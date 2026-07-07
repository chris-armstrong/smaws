open Types

module BatchUpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_cluster_request ->
    ( batch_update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_cluster_request ->
    ( batch_update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceUpdateNotFoundFault of service_update_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Apply the service update to a list of clusters supplied. For more information on service \
   updates and applying them, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/managing-updates.html#applying-updates}Applying \
   the service updates}.\n"]

module CopySnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_request ->
    ( copy_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_request ->
    ( copy_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Makes a copy of an existing snapshot.\n"]

module CreateACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLAlreadyExistsFault of acl_already_exists_fault
    | `ACLQuotaExceededFault of acl_quota_exceeded_fault
    | `DefaultUserRequired of default_user_required
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_acl_request ->
    ( create_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLAlreadyExistsFault of acl_already_exists_fault
      | `ACLQuotaExceededFault of acl_quota_exceeded_fault
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_acl_request ->
    ( create_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLAlreadyExistsFault of acl_already_exists_fault
      | `ACLQuotaExceededFault of acl_quota_exceeded_fault
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Access Control List. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html}Authenticating users \
   with Access Contol Lists (ACLs)}.\n"]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `ClusterAlreadyExistsFault of cluster_already_exists_fault
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidACLStateFault of invalid_acl_state_fault
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a cluster. All nodes in the cluster run the same protocol-compliant engine software.\n"]

module CreateMultiRegionCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterAlreadyExistsFault of multi_region_cluster_already_exists_fault
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_multi_region_cluster_request ->
    ( create_multi_region_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterAlreadyExistsFault of multi_region_cluster_already_exists_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_multi_region_cluster_request ->
    ( create_multi_region_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterAlreadyExistsFault of multi_region_cluster_already_exists_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new multi-Region cluster.\n"]

module CreateParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupAlreadyExistsFault of parameter_group_already_exists_fault
    | `ParameterGroupQuotaExceededFault of parameter_group_quota_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_parameter_group_request ->
    ( create_parameter_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupAlreadyExistsFault of parameter_group_already_exists_fault
      | `ParameterGroupQuotaExceededFault of parameter_group_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_parameter_group_request ->
    ( create_parameter_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupAlreadyExistsFault of parameter_group_already_exists_fault
      | `ParameterGroupQuotaExceededFault of parameter_group_quota_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new MemoryDB parameter group. A parameter group is a collection of parameters and \
   their values that are applied to all of the nodes in any cluster. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/parametergroups.html}Configuring engine \
   parameters using parameter groups}. \n"]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a copy of an entire cluster at a specific moment in time.\n"]

module CreateSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidSubnet of invalid_subnet
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SubnetGroupAlreadyExistsFault of subnet_group_already_exists_fault
    | `SubnetGroupQuotaExceededFault of subnet_group_quota_exceeded_fault
    | `SubnetNotAllowedFault of subnet_not_allowed_fault
    | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_subnet_group_request ->
    ( create_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidSubnet of invalid_subnet
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupAlreadyExistsFault of subnet_group_already_exists_fault
      | `SubnetGroupQuotaExceededFault of subnet_group_quota_exceeded_fault
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_subnet_group_request ->
    ( create_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidSubnet of invalid_subnet
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupAlreadyExistsFault of subnet_group_already_exists_fault
      | `SubnetGroupQuotaExceededFault of subnet_group_quota_exceeded_fault
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a subnet group. A subnet group is a collection of subnets (typically private) that you \
   can designate for your clusters running in an Amazon Virtual Private Cloud (VPC) environment. \
   When you create a cluster in an Amazon VPC, you must specify a subnet group. MemoryDB uses that \
   subnet group to choose a subnet and IP addresses within that subnet to associate with your \
   nodes. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/subnetgroups.html}Subnets and subnet \
   groups}.\n"]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserAlreadyExistsFault of user_already_exists_fault
    | `UserQuotaExceededFault of user_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserAlreadyExistsFault of user_already_exists_fault
      | `UserQuotaExceededFault of user_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserAlreadyExistsFault of user_already_exists_fault
      | `UserQuotaExceededFault of user_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a MemoryDB user. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html}Authenticating users \
   with Access Contol Lists (ACLs)}.\n"]

module DeleteACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `InvalidACLStateFault of invalid_acl_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_acl_request ->
    ( delete_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_acl_request ->
    ( delete_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Access Control List. The ACL must first be disassociated from the cluster before it \
   can be deleted. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/clusters.acls.html}Authenticating users \
   with Access Contol Lists (ACLs)}.\n"]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotAlreadyExistsFault of snapshot_already_exists_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cluster. It also deletes all associated nodes and node endpoints.\n\n\
  \   [CreateSnapshot] permission is required to create a final snapshot. Without this permission, \
   the API call will fail with an [Access Denied] exception.\n\
  \  \n\
  \   "]

module DeleteMultiRegionCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_multi_region_cluster_request ->
    ( delete_multi_region_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_multi_region_cluster_request ->
    ( delete_multi_region_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing multi-Region cluster.\n"]

module DeleteParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_parameter_group_request ->
    ( delete_parameter_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_parameter_group_request ->
    ( delete_parameter_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified parameter group. You cannot delete a parameter group if it is associated \
   with any clusters. You cannot delete the default parameter groups in your account.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSnapshotStateFault of invalid_snapshot_state_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing snapshot. When you receive a successful response from this operation, \
   MemoryDB immediately begins deleting the snapshot; you cannot cancel or revert this operation.\n"]

module DeleteSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SubnetGroupInUseFault of subnet_group_in_use_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_subnet_group_request ->
    ( delete_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupInUseFault of subnet_group_in_use_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_subnet_group_request ->
    ( delete_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupInUseFault of subnet_group_in_use_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a subnet group. You cannot delete a default subnet group or one that is associated with \
   any clusters.\n"]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserStateFault of invalid_user_state_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a user. The user will be removed from all ACLs and in turn removed from all clusters.\n"]

module DescribeACLs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ac_ls_request ->
    ( describe_ac_ls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ac_ls_request ->
    ( describe_ac_ls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of ACLs.\n"]

module DescribeClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all provisioned clusters if no cluster identifier is specified, or \
   about a specific cluster if a cluster name is supplied.\n"]

module DescribeEngineVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_versions_request ->
    ( describe_engine_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_versions_request ->
    ( describe_engine_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the available Redis OSS engine versions.\n"]

module DescribeEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_request ->
    ( describe_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_request ->
    ( describe_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns events related to clusters, security groups, and parameter groups. You can obtain \
   events specific to a particular cluster, security group, or parameter group by providing the \
   name as a parameter. By default, only the events occurring within the last hour are returned; \
   however, you can retrieve up to 14 days' worth of events if necessary.\n"]

module DescribeMultiRegionClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_clusters_request ->
    ( describe_multi_region_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_clusters_request ->
    ( describe_multi_region_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details about one or more multi-Region clusters.\n"]

module DescribeMultiRegionParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_parameter_groups_request ->
    ( describe_multi_region_parameter_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_parameter_groups_request ->
    ( describe_multi_region_parameter_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of multi-region parameter groups.\n"]

module DescribeMultiRegionParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_parameters_request ->
    ( describe_multi_region_parameters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_multi_region_parameters_request ->
    ( describe_multi_region_parameters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular multi-region parameter group.\n"]

module DescribeParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_parameter_groups_request ->
    ( describe_parameter_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_parameter_groups_request ->
    ( describe_parameter_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of parameter group descriptions. If a parameter group name is specified, the \
   list contains only the descriptions for that group.\n"]

module DescribeParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_parameters_request ->
    ( describe_parameters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_parameters_request ->
    ( describe_parameters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular parameter group.\n"]

module DescribeReservedNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_request ->
    ( describe_reserved_nodes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_request ->
    ( describe_reserved_nodes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about reserved nodes for this account, or about a specified reserved node.\n"]

module DescribeReservedNodesOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_offerings_request ->
    ( describe_reserved_nodes_offerings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_offerings_request ->
    ( describe_reserved_nodes_offerings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists available reserved node offerings.\n"]

module DescribeServiceUpdates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_updates_request ->
    ( describe_service_updates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_updates_request ->
    ( describe_service_updates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details of the service updates.\n"]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about cluster snapshots. By default, DescribeSnapshots lists all of your \
   snapshots; it can optionally describe a single snapshot, or just the snapshots associated with \
   a particular cluster.\n"]

module DescribeSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_subnet_groups_request ->
    ( describe_subnet_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_subnet_groups_request ->
    ( describe_subnet_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of subnet group descriptions. If a subnet group name is specified, the list \
   contains only the description of that group.\n"]

module DescribeUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of users.\n"]

module FailoverShard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ShardNotFoundFault of shard_not_found_fault
    | `TestFailoverNotAvailableFault of test_failover_not_available_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_shard_request ->
    ( failover_shard_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ShardNotFoundFault of shard_not_found_fault
      | `TestFailoverNotAvailableFault of test_failover_not_available_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_shard_request ->
    ( failover_shard_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `APICallRateForCustomerExceededFault of api_call_rate_for_customer_exceeded_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ShardNotFoundFault of shard_not_found_fault
      | `TestFailoverNotAvailableFault of test_failover_not_available_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to failover a shard. This API is designed for testing the behavior of your application in \
   case of MemoryDB failover. It is not designed to be used as a production-level tool for \
   initiating a failover to overcome a problem you may have with the cluster. Moreover, in certain \
   conditions such as large scale operational events, Amazon may block this API. \n"]

module ListAllowedMultiRegionClusterUpdates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_multi_region_cluster_updates_request ->
    ( list_allowed_multi_region_cluster_updates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_multi_region_cluster_updates_request ->
    ( list_allowed_multi_region_cluster_updates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the allowed updates for a multi-Region cluster.\n"]

module ListAllowedNodeTypeUpdates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_node_type_updates_request ->
    ( list_allowed_node_type_updates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_allowed_node_type_updates_request ->
    ( list_allowed_node_type_updates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all available node types that you can scale to from your cluster's current node type. \
   When you use the UpdateCluster operation to scale your cluster, the value of the NodeType \
   parameter must be one of the node types returned by this operation.\n"]

module ListTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags currently on a named resource. A tag is a key-value pair where the key and value \
   are case-sensitive. You can use tags to categorize and track your MemoryDB resources. For more \
   information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\n\
  \ When you add or remove tags from multi region clusters, you might not immediately see the \
   latest effective tags in the ListTags API response due to it being eventually consistent \
   specifically for multi region clusters. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\
  \ \n\
  \  \n\
  \  "]

module PurchaseReservedNodesOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
    | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
    | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_nodes_offering_request ->
    ( purchase_reserved_nodes_offering_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
      | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_nodes_offering_request ->
    ( purchase_reserved_nodes_offering_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
      | `ReservedNodesOfferingNotFoundFault of reserved_nodes_offering_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to purchase a reserved node offering. Reserved nodes are not eligible for \
   cancellation and are non-refundable.\n"]

module ResetParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_parameter_group_request ->
    ( reset_parameter_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_parameter_group_request ->
    ( reset_parameter_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a parameter group to the engine or system default value. You can \
   reset specific parameters by submitting a list of parameter names. To reset the entire \
   parameter group, specify the AllParameters and ParameterGroupName parameters.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Use this operation to add tags to a resource. A tag is a key-value pair where the key and \
   value are case-sensitive. You can use tags to categorize and track all your MemoryDB resources. \
   For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\n\
  \ When you add tags to multi region clusters, you might not immediately see the latest effective \
   tags in the ListTags API response due to it being eventually consistent specifically for multi \
   region clusters. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\
  \ \n\
  \  You can specify cost-allocation tags for your MemoryDB resources, Amazon generates a cost \
   allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by \
   your tags. You can apply tags that represent business categories (such as cost centers, \
   application names, or owners) to organize your costs across multiple services. For more \
   information, see {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging.html}Using \
   Cost Allocation Tags}.\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SnapshotNotFoundFault of snapshot_not_found_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `TagNotFoundFault of tag_not_found_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SnapshotNotFoundFault of snapshot_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to remove tags on a resource. A tag is a key-value pair where the key and \
   value are case-sensitive. You can use tags to categorize and track all your MemoryDB resources. \
   For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\n\
  \ When you remove tags from multi region clusters, you might not immediately see the latest \
   effective tags in the ListTags API response due to it being eventually consistent specifically \
   for multi region clusters. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/Tagging-Resources.html}Tagging your \
   MemoryDB resources}.\n\
  \ \n\
  \  You can specify cost-allocation tags for your MemoryDB resources, Amazon generates a cost \
   allocation report as a comma-separated value (CSV) file with your usage and costs aggregated by \
   your tags. You can apply tags that represent business categories (such as cost centers, \
   application names, or owners) to organize your costs across multiple services. For more \
   information, see {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/tagging.html}Using \
   Cost Allocation Tags}.\n\
  \  "]

module UpdateACL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `DefaultUserRequired of default_user_required
    | `DuplicateUserNameFault of duplicate_user_name_fault
    | `InvalidACLStateFault of invalid_acl_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_acl_request ->
    ( update_acl_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_acl_request ->
    ( update_acl_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `DefaultUserRequired of default_user_required
      | `DuplicateUserNameFault of duplicate_user_name_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the list of users that belong to the Access Control List.\n"]

module UpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ACLNotFoundFault of acl_not_found_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InvalidACLStateFault of invalid_acl_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidKMSKeyFault of invalid_kms_key_fault
    | `InvalidNodeStateFault of invalid_node_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `NoOperationFault of no_operation_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidNodeStateFault of invalid_node_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ACLNotFoundFault of acl_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InvalidACLStateFault of invalid_acl_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidKMSKeyFault of invalid_kms_key_fault
      | `InvalidNodeStateFault of invalid_node_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `NoOperationFault of no_operation_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ShardsPerClusterQuotaExceededFault of shards_per_cluster_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a cluster. You can use this operation to change one or more cluster \
   configuration settings by specifying the settings and the new values.\n"]

module UpdateMultiRegionCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
    | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_multi_region_cluster_request ->
    ( update_multi_region_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_multi_region_cluster_request ->
    ( update_multi_region_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidMultiRegionClusterStateFault of invalid_multi_region_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MultiRegionClusterNotFoundFault of multi_region_cluster_not_found_fault
      | `MultiRegionParameterGroupNotFoundFault of multi_region_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the configuration of an existing multi-Region cluster.\n"]

module UpdateParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_parameter_group_request ->
    ( update_parameter_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_parameter_group_request ->
    ( update_parameter_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the parameters of a parameter group. You can modify up to 20 parameters in a single \
   request by submitting a list parameter name and value pairs.\n"]

module UpdateSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidSubnet of invalid_subnet
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `SubnetInUse of subnet_in_use
    | `SubnetNotAllowedFault of subnet_not_allowed_fault
    | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_group_request ->
    ( update_subnet_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidSubnet of invalid_subnet
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `SubnetInUse of subnet_in_use
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_subnet_group_request ->
    ( update_subnet_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidSubnet of invalid_subnet
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `SubnetInUse of subnet_in_use
      | `SubnetNotAllowedFault of subnet_not_allowed_fault
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a subnet group. For more information, see \
   {{:https://docs.aws.amazon.com/MemoryDB/latest/devguide/ubnetGroups.Modifying.html}Updating a \
   subnet group} \n"]

module UpdateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidUserStateFault of invalid_user_state_fault
    | `UserNotFoundFault of user_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `UserNotFoundFault of user_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidUserStateFault of invalid_user_state_fault
      | `UserNotFoundFault of user_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes user password(s) and/or access string.\n"]
