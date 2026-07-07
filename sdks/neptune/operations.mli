open Types

module AddRoleToDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
    | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
      | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
      | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Identity and Access Management (IAM) role with an Neptune DB cluster.\n"]

module AddSourceIdentifierToSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_source_identifier_to_subscription_message ->
    ( add_source_identifier_to_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_source_identifier_to_subscription_message ->
    ( add_source_identifier_to_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a source identifier to an existing event notification subscription.\n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds metadata tags to an Amazon Neptune resource. These tags can also be used with cost \
   allocation reporting to track cost associated with Amazon Neptune resources, or used in a \
   Condition statement in an IAM policy for Amazon Neptune.\n"]

module ApplyPendingMaintenanceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a pending maintenance action to a resource (for example, to a DB instance).\n"]

module CopyDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_parameter_group_message ->
    ( copy_db_cluster_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_parameter_group_message ->
    ( copy_db_cluster_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Copies the specified DB cluster parameter group.\n"]

module CopyDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_snapshot_message ->
    ( copy_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_snapshot_message ->
    ( copy_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies a snapshot of a DB cluster.\n\n\
  \ To copy a DB cluster snapshot from a shared manual DB cluster snapshot, \
   [SourceDBClusterSnapshotIdentifier] must be the Amazon Resource Name (ARN) of the shared DB \
   cluster snapshot.\n\
  \ "]

module CopyDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_parameter_group_message ->
    ( copy_db_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_parameter_group_message ->
    ( copy_db_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Copies the specified DB parameter group.\n"]

module CreateDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_message ->
    ( create_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_message ->
    ( create_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Neptune DB cluster.\n\n\
  \ You can use the [ReplicationSourceIdentifier] parameter to create the DB cluster as a Read \
   Replica of another DB cluster or Amazon Neptune DB instance.\n\
  \ \n\
  \  Note that when you create a new cluster using [CreateDBCluster] directly, deletion protection \
   is disabled by default (when you create a new production cluster in the console, deletion \
   protection is enabled by default). You can only delete a DB cluster if its [DeletionProtection] \
   field is set to [false].\n\
  \  "]

module CreateDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
    | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_endpoint_message ->
    ( create_db_cluster_endpoint_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
      | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_endpoint_message ->
    ( create_db_cluster_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
      | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new custom endpoint and associates it with an Amazon Neptune DB cluster.\n"]

module CreateDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_parameter_group_message ->
    ( create_db_cluster_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_parameter_group_message ->
    ( create_db_cluster_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB cluster parameter group.\n\n\
  \ Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.\n\
  \ \n\
  \   A DB cluster parameter group is initially created with the default parameters for the \
   database engine used by instances in the DB cluster. To provide custom values for any of the \
   parameters, you must modify the group after creating it using [ModifyDBClusterParameterGroup]. \
   Once you've created a DB cluster parameter group, you need to associate it with your DB cluster \
   using [ModifyDBCluster]. When you associate a new DB cluster parameter group with a running DB \
   cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB \
   cluster parameter group and associated settings to take effect.\n\
  \  \n\
  \    After you create a DB cluster parameter group, you should wait at least 5 minutes before \
   creating your first DB cluster that uses that DB cluster parameter group as the default \
   parameter group. This allows Amazon Neptune to fully complete the create action before the DB \
   cluster parameter group is used as the default for a new DB cluster. This is especially \
   important for parameters that are critical when creating the default database for a DB cluster, \
   such as the character set for the default database defined by the [character_set_database] \
   parameter. You can use the {i Parameter Groups} option of the \
   {{:https://console.aws.amazon.com/rds/}Amazon Neptune console} or the \
   [DescribeDBClusterParameters] command to verify that your DB cluster parameter group has been \
   created or modified.\n\
  \    \n\
  \     "]

module CreateDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_snapshot_message ->
    ( create_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_snapshot_message ->
    ( create_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a snapshot of a DB cluster.\n"]

module CreateDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new DB instance.\n"]

module CreateDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_parameter_group_message ->
    ( create_db_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_parameter_group_message ->
    ( create_db_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB parameter group.\n\n\
  \ A DB parameter group is initially created with the default parameters for the database engine \
   used by the DB instance. To provide custom values for any of the parameters, you must modify \
   the group after creating it using {i ModifyDBParameterGroup}. Once you've created a DB \
   parameter group, you need to associate it with your DB instance using {i ModifyDBInstance}. \
   When you associate a new DB parameter group with a running DB instance, you need to reboot the \
   DB instance without failover for the new DB parameter group and associated settings to take \
   effect.\n\
  \ \n\
  \   After you create a DB parameter group, you should wait at least 5 minutes before creating \
   your first DB instance that uses that DB parameter group as the default parameter group. This \
   allows Amazon Neptune to fully complete the create action before the parameter group is used as \
   the default for a new DB instance. This is especially important for parameters that are \
   critical when creating the default database for a DB instance, such as the character set for \
   the default database defined by the [character_set_database] parameter. You can use the {i \
   Parameter Groups} option of the Amazon Neptune console or the {i DescribeDBParameters} command \
   to verify that your DB parameter group has been created or modified.\n\
  \   \n\
  \    "]

module CreateDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
    | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_subnet_group_message ->
    ( create_db_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_subnet_group_message ->
    ( create_db_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least \
   two AZs in the Amazon Region.\n"]

module CreateEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an event notification subscription. This action requires a topic ARN (Amazon Resource \
   Name) created by either the Neptune console, the SNS console, or the SNS API. To obtain an ARN \
   with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is \
   displayed in the SNS console.\n\n\
  \ You can specify the type of source (SourceType) you want to be notified of, provide a list of \
   Neptune sources (SourceIds) that triggers the events, and provide a list of event categories \
   (EventCategories) for events you want to be notified of. For example, you can specify \
   SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = \
   Availability, Backup.\n\
  \ \n\
  \  If you specify both the SourceType and SourceIds, such as SourceType = db-instance and \
   SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the \
   specified source. If you specify a SourceType but do not specify a SourceIdentifier, you \
   receive notice of the events for that source type for all your Neptune sources. If you do not \
   specify either the SourceType nor the SourceIdentifier, you are notified of events generated \
   from all Neptune sources belonging to your customer account.\n\
  \  "]

module CreateGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
    | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Neptune global database spread across multiple Amazon Regions. The global database \
   contains a single primary cluster with read-write capability, and read-only secondary clusters \
   that receive data from the primary cluster through high-speed replication performed by the \
   Neptune storage subsystem.\n\n\
  \ You can create a global database that is initially empty, and then add a primary cluster and \
   secondary clusters to it, or you can specify an existing Neptune cluster during the create \
   operation to become the primary cluster of the global database.\n\
  \ "]

module DeleteDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_message ->
    ( delete_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_message ->
    ( delete_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB \
   cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual \
   DB cluster snapshots of the specified DB cluster are not deleted.\n\n\
  \ Note that the DB Cluster cannot be deleted if deletion protection is enabled. To delete it, \
   you must first set its [DeletionProtection] field to [False].\n\
  \ "]

module DeleteDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_endpoint_message ->
    ( delete_db_cluster_endpoint_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_endpoint_message ->
    ( delete_db_cluster_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom endpoint and removes it from an Amazon Neptune DB cluster.\n"]

module DeleteDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted \
   can't be associated with any DB clusters.\n"]

module DeleteDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_snapshot_message ->
    ( delete_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_snapshot_message ->
    ( delete_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is \
   terminated.\n\n\
  \  The DB cluster snapshot must be in the [available] state to be deleted.\n\
  \  \n\
  \   "]

module DeleteDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_message ->
    ( delete_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_message ->
    ( delete_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB \
   instance, all automated backups for that instance are deleted and can't be recovered. Manual DB \
   snapshots of the DB instance to be deleted by [DeleteDBInstance] are not deleted.\n\n\
  \  If you request a final DB snapshot the status of the Amazon Neptune DB instance is [deleting] \
   until the DB snapshot is created. The API action [DescribeDBInstance] is used to monitor the \
   status of this operation. The action can't be canceled or reverted once submitted.\n\
  \ \n\
  \  Note that when a DB instance is in a failure state and has a status of [failed], \
   [incompatible-restore], or [incompatible-network], you can only delete it when the \
   [SkipFinalSnapshot] parameter is set to [true].\n\
  \  \n\
  \   You can't delete a DB instance if it is the only instance in the DB cluster, or if it has \
   deletion protection enabled.\n\
  \   "]

module DeleteDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified DBParameterGroup. The DBParameterGroup to be deleted can't be associated \
   with any DB instances.\n"]

module DeleteDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB subnet group.\n\n\
  \  The specified database subnet group must not be associated with any DB instances.\n\
  \  \n\
  \   "]

module DeleteEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an event notification subscription.\n"]

module DeleteGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_global_cluster_message ->
    ( delete_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_global_cluster_message ->
    ( delete_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a global database. The primary and all secondary clusters must already be detached or \
   deleted first.\n"]

module DescribeDBClusterEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_endpoints_message ->
    ( db_cluster_endpoint_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_endpoints_message ->
    ( db_cluster_endpoint_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about endpoints for an Amazon Neptune DB cluster.\n\n\
  \  This operation can also return information for Amazon RDS clusters and Amazon DocDB clusters.\n\
  \  \n\
  \   "]

module DescribeDBClusterParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameter_groups_message ->
    ( db_cluster_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameter_groups_message ->
    ( db_cluster_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of [DBClusterParameterGroup] descriptions. If a [DBClusterParameterGroupName] \
   parameter is specified, the list will contain only the description of the specified DB cluster \
   parameter group.\n"]

module DescribeDBClusterParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameters_message ->
    ( db_cluster_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameters_message ->
    ( db_cluster_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular DB cluster parameter group.\n"]

module DescribeDBClusterSnapshotAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshot_attributes_message ->
    ( describe_db_cluster_snapshot_attributes_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshot_attributes_message ->
    ( describe_db_cluster_snapshot_attributes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster \
   snapshot.\n\n\
  \ When sharing snapshots with other Amazon accounts, [DescribeDBClusterSnapshotAttributes] \
   returns the [restore] attribute and a list of IDs for the Amazon accounts that are authorized \
   to copy or restore the manual DB cluster snapshot. If [all] is included in the list of values \
   for the [restore] attribute, then the manual DB cluster snapshot is public and can be copied or \
   restored by all Amazon accounts.\n\
  \ \n\
  \  To add or remove access for an Amazon account to copy or restore a manual DB cluster \
   snapshot, or to make the manual DB cluster snapshot public or private, use the \
   [ModifyDBClusterSnapshotAttribute] API action.\n\
  \  "]

module DescribeDBClusterSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshots_message ->
    ( db_cluster_snapshot_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshots_message ->
    ( db_cluster_snapshot_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about DB cluster snapshots. This API action supports pagination.\n"]

module DescribeDBClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_clusters_message ->
    ( db_cluster_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_clusters_message ->
    ( db_cluster_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about provisioned DB clusters, and supports pagination.\n\n\
  \  This operation can also return information for Amazon RDS clusters and Amazon DocDB clusters.\n\
  \  \n\
  \   "]

module DescribeDBEngineVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_engine_versions_message ->
    (db_engine_version_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_engine_versions_message ->
    ( db_engine_version_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the available DB engines.\n"]

module DescribeDBInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBInstanceNotFoundFault of db_instance_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instances_message ->
    ( db_instance_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instances_message ->
    ( db_instance_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about provisioned instances, and supports pagination.\n\n\
  \  This operation can also return information for Amazon RDS instances and Amazon DocDB instances.\n\
  \  \n\
  \   "]

module DescribeDBParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameter_groups_message ->
    ( db_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameter_groups_message ->
    ( db_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [DBParameterGroup] descriptions. If a [DBParameterGroupName] is specified, \
   the list will contain only the description of the specified DB parameter group.\n"]

module DescribeDBParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameters_message ->
    ( db_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameters_message ->
    ( db_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular DB parameter group.\n"]

module DescribeDBSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_subnet_groups_message ->
    ( db_subnet_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_subnet_groups_message ->
    ( db_subnet_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list \
   will contain only the descriptions of the specified DBSubnetGroup.\n\n\
  \ For an overview of CIDR ranges, go to the \
   {{:http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Wikipedia Tutorial}.\n\
  \ "]

module DescribeEngineDefaultClusterParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_cluster_parameters_message ->
    ( describe_engine_default_cluster_parameters_result,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_cluster_parameters_message ->
    ( describe_engine_default_cluster_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the default engine and system parameter information for the cluster database engine.\n"]

module DescribeEngineDefaultParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    (describe_engine_default_parameters_result, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    ( describe_engine_default_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the default engine and system parameter information for the specified database engine.\n"]

module DescribeEventCategories : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    (event_categories_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    ( event_categories_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays a list of categories for all event source types, or, if specified, for a specified \
   source type.\n"]

module DescribeEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the subscription descriptions for a customer account. The description for a \
   subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, \
   CreationTime, and Status.\n\n\
  \ If you specify a SubscriptionName, lists the description for that subscription.\n\
  \ "]

module DescribeEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    (events_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( events_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter \
   groups for the past 14 days. Events specific to a particular DB instance, DB security group, \
   database snapshot, or DB parameter group can be obtained by providing the name as a parameter. \
   By default, the past hour of events are returned.\n"]

module DescribeGlobalClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_global_clusters_message ->
    ( global_clusters_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_global_clusters_message ->
    ( global_clusters_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about Neptune global database clusters. This API supports pagination.\n"]

module DescribeOrderableDBInstanceOptions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_db_instance_options_message ->
    (orderable_db_instance_options_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_db_instance_options_message ->
    ( orderable_db_instance_options_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of orderable DB instance options for the specified engine.\n"]

module DescribePendingMaintenanceActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( pending_maintenance_actions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( pending_maintenance_actions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resources (for example, DB instances) that have at least one pending \
   maintenance action.\n"]

module DescribeValidDBInstanceModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_valid_db_instance_modifications_message ->
    ( describe_valid_db_instance_modifications_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_valid_db_instance_modifications_message ->
    ( describe_valid_db_instance_modifications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can call [DescribeValidDBInstanceModifications] to learn what modifications you can make to \
   your DB instance. You can use this information when you call [ModifyDBInstance].\n"]

module FailoverDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_db_cluster_message ->
    ( failover_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_db_cluster_message ->
    ( failover_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Forces a failover for a DB cluster.\n\n\
  \ A failover for a DB cluster promotes one of the Read Replicas (read-only instances) in the DB \
   cluster to be the primary instance (the cluster writer).\n\
  \ \n\
  \  Amazon Neptune will automatically fail over to a Read Replica, if one exists, when the \
   primary instance fails. You can force a failover when you want to simulate a failure of a \
   primary instance for testing. Because each instance in a DB cluster has its own endpoint \
   address, you will need to clean up and re-establish any existing connections that use those \
   endpoint addresses when the failover is complete.\n\
  \  "]

module FailoverGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_global_cluster_message ->
    ( failover_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_global_cluster_message ->
    ( failover_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates the failover process for a Neptune global database.\n\n\
  \ A failover for a Neptune global database promotes one of secondary read-only DB clusters to be \
   the primary DB cluster and demotes the primary DB cluster to being a secondary (read-only) DB \
   cluster. In other words, the role of the current primary DB cluster and the selected target \
   secondary DB cluster are switched. The selected secondary DB cluster assumes full read/write \
   capabilities for the Neptune global database.\n\
  \ \n\
  \   This action applies {b only} to Neptune global databases. This action is only intended for \
   use on healthy Neptune global databases with healthy Neptune DB clusters and no region-wide \
   outages, to test disaster recovery scenarios or to reconfigure the global database topology.\n\
  \   \n\
  \    "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags on an Amazon Neptune resource.\n"]

module ModifyDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modify a setting for a DB cluster. You can change one or more database configuration parameters \
   by specifying these parameters and the new values in the request.\n"]

module ModifyDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_endpoint_message ->
    ( modify_db_cluster_endpoint_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_endpoint_message ->
    ( modify_db_cluster_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the properties of an endpoint in an Amazon Neptune DB cluster.\n"]

module ModifyDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, \
   submit a list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum \
   of 20 parameters can be modified in a single request.\n\n\
  \  Changes to dynamic parameters are applied immediately. Changes to static parameters require a \
   reboot without failover to the DB cluster associated with the parameter group before the change \
   can take effect.\n\
  \  \n\
  \     After you create a DB cluster parameter group, you should wait at least 5 minutes before \
   creating your first DB cluster that uses that DB cluster parameter group as the default \
   parameter group. This allows Amazon Neptune to fully complete the create action before the \
   parameter group is used as the default for a new DB cluster. This is especially important for \
   parameters that are critical when creating the default database for a DB cluster, such as the \
   character set for the default database defined by the [character_set_database] parameter. You \
   can use the {i Parameter Groups} option of the Amazon Neptune console or the \
   [DescribeDBClusterParameters] command to verify that your DB cluster parameter group has been \
   created or modified.\n\
  \     \n\
  \      "]

module ModifyDBClusterSnapshotAttribute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_snapshot_attribute_message ->
    ( modify_db_cluster_snapshot_attribute_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_snapshot_attribute_message ->
    ( modify_db_cluster_snapshot_attribute_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster \
   snapshot.\n\n\
  \ To share a manual DB cluster snapshot with other Amazon accounts, specify [restore] as the \
   [AttributeName] and use the [ValuesToAdd] parameter to add a list of IDs of the Amazon accounts \
   that are authorized to restore the manual DB cluster snapshot. Use the value [all] to make the \
   manual DB cluster snapshot public, which means that it can be copied or restored by all Amazon \
   accounts. Do not add the [all] value for any manual DB cluster snapshots that contain private \
   information that you don't want available to all Amazon accounts. If a manual DB cluster \
   snapshot is encrypted, it can be shared, but only by specifying a list of authorized Amazon \
   account IDs for the [ValuesToAdd] parameter. You can't use [all] as a value for that parameter \
   in this case.\n\
  \ \n\
  \  To view which Amazon accounts have access to copy or restore a manual DB cluster snapshot, or \
   whether a manual DB cluster snapshot public or private, use the \
   [DescribeDBClusterSnapshotAttributes] API action.\n\
  \  "]

module ModifyDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies settings for a DB instance. You can change one or more database configuration \
   parameters by specifying these parameters and the new values in the request. To learn what \
   modifications you can make to your DB instance, call [DescribeValidDBInstanceModifications] \
   before you call [ModifyDBInstance].\n"]

module ModifyDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_parameter_group_message ->
    ( db_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_parameter_group_message ->
    ( db_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a \
   list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum of 20 \
   parameters can be modified in a single request.\n\n\
  \  Changes to dynamic parameters are applied immediately. Changes to static parameters require a \
   reboot without failover to the DB instance associated with the parameter group before the \
   change can take effect.\n\
  \  \n\
  \     After you modify a DB parameter group, you should wait at least 5 minutes before creating \
   your first DB instance that uses that DB parameter group as the default parameter group. This \
   allows Amazon Neptune to fully complete the modify action before the parameter group is used as \
   the default for a new DB instance. This is especially important for parameters that are \
   critical when creating the default database for a DB instance, such as the character set for \
   the default database defined by the [character_set_database] parameter. You can use the {i \
   Parameter Groups} option of the Amazon Neptune console or the {i DescribeDBParameters} command \
   to verify that your DB parameter group has been created or modified.\n\
  \     \n\
  \      "]

module ModifyDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet
    | `SubnetAlreadyInUse of subnet_already_in_use ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_subnet_group_message ->
    ( modify_db_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_subnet_group_message ->
    ( modify_db_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at \
   least two AZs in the Amazon Region.\n"]

module ModifyEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing event notification subscription. Note that you can't modify the source \
   identifiers using this call; to change source identifiers for a subscription, use the \
   [AddSourceIdentifierToSubscription] and [RemoveSourceIdentifierFromSubscription] calls.\n\n\
  \ You can see a list of the event categories for a given SourceType by using the {b \
   DescribeEventCategories} action.\n\
  \ "]

module ModifyGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modify a setting for an Amazon Neptune global cluster. You can change one or more database \
   configuration parameters by specifying these parameters and their new values in the request.\n"]

module PromoteReadReplicaDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_db_cluster_message ->
    ( promote_read_replica_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_db_cluster_message ->
    ( promote_read_replica_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Not supported.\n"]

module RebootDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You might need to reboot your DB instance, usually for maintenance reasons. For example, if you \
   make certain modifications, or if you change the DB parameter group associated with the DB \
   instance, you must reboot the instance for the changes to take effect.\n\n\
  \ Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results \
   in a momentary outage, during which the DB instance status is set to rebooting.\n\
  \ "]

module RemoveFromGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches a Neptune DB cluster from a Neptune global database. A secondary cluster becomes a \
   normal standalone cluster with read-write capability instead of being read-only, and no longer \
   receives data from the primary cluster.\n"]

module RemoveRoleFromDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates an Identity and Access Management (IAM) role from a DB cluster.\n"]

module RemoveSourceIdentifierFromSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_source_identifier_from_subscription_message ->
    ( remove_source_identifier_from_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_source_identifier_from_subscription_message ->
    ( remove_source_identifier_from_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a source identifier from an existing event notification subscription.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes metadata tags from an Amazon Neptune resource.\n"]

module ResetDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Modifies the parameters of a DB cluster parameter group to the default value. To reset \
   specific parameters submit a list of the following: [ParameterName] and [ApplyMethod]. To reset \
   the entire DB cluster parameter group, specify the [DBClusterParameterGroupName] and \
   [ResetAllParameters] parameters.\n\n\
  \  When resetting the entire group, dynamic parameters are updated immediately and static \
   parameters are set to [pending-reboot] to take effect on the next DB instance restart or \
   [RebootDBInstance] request. You must call [RebootDBInstance] for every DB instance in your DB \
   cluster that you want the updated static parameter to apply to.\n\
  \ "]

module ResetDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_db_parameter_group_message ->
    ( db_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_db_parameter_group_message ->
    ( db_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB parameter group to the engine/system default value. To reset \
   specific parameters, provide a list of the following: [ParameterName] and [ApplyMethod]. To \
   reset the entire DB parameter group, specify the [DBParameterGroup] name and \
   [ResetAllParameters] parameters. When resetting the entire group, dynamic parameters are \
   updated immediately and static parameters are set to [pending-reboot] to take effect on the \
   next DB instance restart or [RebootDBInstance] request.\n"]

module RestoreDBClusterFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB cluster from a DB snapshot or DB cluster snapshot.\n\n\
  \ If a DB snapshot is specified, the target DB cluster is created from the source DB snapshot \
   with a default configuration and default security group.\n\
  \ \n\
  \  If a DB cluster snapshot is specified, the target DB cluster is created from the source DB \
   cluster restore point with the same configuration as the original source DB cluster, except \
   that the new DB cluster is created with the default security group.\n\
  \  "]

module RestoreDBClusterToPointInTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time \
   before [LatestRestorableTime] for up to [BackupRetentionPeriod] days. The target DB cluster is \
   created from the source DB cluster with the same configuration as the original DB cluster, \
   except that the new DB cluster is created with the default DB security group.\n\n\
  \  This action only restores the DB cluster, not the DB instances for that DB cluster. You must \
   invoke the [CreateDBInstance] action to create DB instances for the restored DB cluster, \
   specifying the identifier of the restored DB cluster in [DBClusterIdentifier]. You can create \
   DB instances only after the [RestoreDBClusterToPointInTime] action has completed and the DB \
   cluster is available.\n\
  \  \n\
  \   "]

module StartDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an Amazon Neptune DB cluster that was stopped using the Amazon console, the Amazon CLI \
   stop-db-cluster command, or the StopDBCluster API.\n"]

module StopDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an Amazon Neptune DB cluster. When you stop a DB cluster, Neptune retains the DB \
   cluster's metadata, including its endpoints and DB parameter groups.\n\n\
  \ Neptune also retains the transaction logs so you can do a point-in-time restore if necessary.\n\
  \ "]

module SwitchoverGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    switchover_global_cluster_message ->
    ( switchover_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    switchover_global_cluster_message ->
    ( switchover_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Switches over the specified secondary DB cluster to be the new primary DB cluster in the global \
   database cluster. Switchover operations were previously called \"managed planned failovers.\"\n\n\
  \ Promotes the specified secondary cluster to assume full read/write capabilities and demotes \
   the current primary cluster to a secondary (read-only) cluster, maintaining the original \
   replication topology. All secondary clusters are synchronized with the primary at the beginning \
   of the process so the new primary continues operations for the global database without losing \
   any data. Your database is unavailable for a short time while the primary and selected \
   secondary clusters are assuming their new roles.\n\
  \ \n\
  \   This operation is intended for controlled environments, for operations such as \"regional \
   rotation\" or to fall back to the original primary after a global database failover.\n\
  \   \n\
  \    "]
