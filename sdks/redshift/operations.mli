open Types

module AcceptReservedNodeExchange : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
    | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
    | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_reserved_node_exchange_input_message ->
    ( accept_reserved_node_exchange_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_reserved_node_exchange_input_message ->
    ( accept_reserved_node_exchange_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exchanges a DC1 Reserved Node for a DC2 Reserved Node with no changes to the configuration \
   (term, payment type, or number of nodes) and no additional costs. \n"]

module AddPartner : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `PartnerNotFoundFault of partner_not_found_fault
    | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    partner_integration_input_message ->
    ( partner_integration_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    partner_integration_input_message ->
    ( partner_integration_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a partner integration to a cluster. This operation authorizes a partner to push status \
   updates for the specified database. To complete the integration, you also set up the \
   integration on the partner website.\n"]

module AssociateDataShareConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidDataShareFault of invalid_data_share_fault
    | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_data_share_consumer_message ->
    ( data_share,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDataShareFault of invalid_data_share_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_data_share_consumer_message ->
    ( data_share Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDataShareFault of invalid_data_share_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "From a datashare consumer account, associates a datashare with the account \
   (AssociateEntireAccount) or the specified namespace (ConsumerArn). If you make this \
   association, the consumer can consume the datashare.\n"]

module AuthorizeClusterSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
    | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_cluster_security_group_ingress_message ->
    ( authorize_cluster_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_cluster_security_group_ingress_message ->
    ( authorize_cluster_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an inbound (ingress) rule to an Amazon Redshift security group. Depending on whether the \
   application accessing your cluster is running on the Internet or an Amazon EC2 instance, you \
   can authorize inbound access to either a Classless Interdomain Routing (CIDR)/Internet Protocol \
   (IP) range or to an Amazon EC2 security group. You can add as many as 20 ingress rules to an \
   Amazon Redshift security group.\n\n\
  \ If you authorize access to an Amazon EC2 security group, specify {i EC2SecurityGroupName} and \
   {i EC2SecurityGroupOwnerId}. The Amazon EC2 security group and Amazon Redshift cluster must be \
   in the same Amazon Web Services Region. \n\
  \ \n\
  \  If you authorize access to a CIDR/IP address range, specify {i CIDRIP}. For an overview of \
   CIDR blocks, see the Wikipedia article on \
   {{:http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}. \n\
  \  \n\
  \   You must also associate the security group with a cluster so that clients running on these \
   IP addresses or the EC2 instance are authorized to connect to the cluster. For information \
   about managing security groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html}Working \
   with Security Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \   "]

module AuthorizeDataShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_data_share_message ->
    ( data_share,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_data_share_message ->
    ( data_share Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "From a data producer account, authorizes the sharing of a datashare with one or more consumer \
   accounts or managing entities. To authorize a datashare for a data consumer, the producer \
   account must have the correct access permissions.\n"]

module AuthorizeEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `EndpointAuthorizationAlreadyExistsFault of endpoint_authorization_already_exists_fault
    | `EndpointAuthorizationsPerClusterLimitExceededFault of
      endpoint_authorizations_per_cluster_limit_exceeded_fault
    | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_endpoint_access_message ->
    ( endpoint_authorization,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointAuthorizationAlreadyExistsFault of endpoint_authorization_already_exists_fault
      | `EndpointAuthorizationsPerClusterLimitExceededFault of
        endpoint_authorizations_per_cluster_limit_exceeded_fault
      | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_endpoint_access_message ->
    ( endpoint_authorization Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointAuthorizationAlreadyExistsFault of endpoint_authorization_already_exists_fault
      | `EndpointAuthorizationsPerClusterLimitExceededFault of
        endpoint_authorizations_per_cluster_limit_exceeded_fault
      | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Grants access to a cluster.\n"]

module AuthorizeSnapshotAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
    | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_snapshot_access_message ->
    ( authorize_snapshot_access_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_snapshot_access_message ->
    ( authorize_snapshot_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Authorizes the specified Amazon Web Services account to restore the specified snapshot.\n\n\
  \  For more information about working with snapshots, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html}Amazon Redshift \
   Snapshots} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module BatchDeleteClusterSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BatchDeleteRequestSizeExceededFault of batch_delete_request_size_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_cluster_snapshots_request ->
    ( batch_delete_cluster_snapshots_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BatchDeleteRequestSizeExceededFault of batch_delete_request_size_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_cluster_snapshots_request ->
    ( batch_delete_cluster_snapshots_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BatchDeleteRequestSizeExceededFault of batch_delete_request_size_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a set of cluster snapshots.\n"]

module BatchModifyClusterSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BatchModifyClusterSnapshotsLimitExceededFault of
      batch_modify_cluster_snapshots_limit_exceeded_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_modify_cluster_snapshots_message ->
    ( batch_modify_cluster_snapshots_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BatchModifyClusterSnapshotsLimitExceededFault of
        batch_modify_cluster_snapshots_limit_exceeded_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_modify_cluster_snapshots_message ->
    ( batch_modify_cluster_snapshots_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BatchModifyClusterSnapshotsLimitExceededFault of
        batch_modify_cluster_snapshots_limit_exceeded_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the settings for a set of cluster snapshots.\n"]

module CancelResize : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `ResizeNotFoundFault of resize_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_resize_message ->
    ( resize_progress_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `ResizeNotFoundFault of resize_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_resize_message ->
    ( resize_progress_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `ResizeNotFoundFault of resize_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels a resize operation for a cluster.\n"]

module CopyClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_cluster_snapshot_message ->
    ( copy_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_cluster_snapshot_message ->
    ( copy_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified automated cluster snapshot to a new manual cluster snapshot. The source \
   must be an automated snapshot and it must be in the available state.\n\n\
  \ When you delete a cluster, Amazon Redshift deletes any automated snapshots of the cluster. \
   Also, when the retention period of the snapshot expires, Amazon Redshift automatically deletes \
   it. If you want to keep an automated snapshot for a longer period, you can make a manual copy \
   of the snapshot. Manual snapshots are retained until you delete them.\n\
  \ \n\
  \   For more information about working with snapshots, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html}Amazon Redshift \
   Snapshots} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \  "]

module CreateAuthenticationProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthenticationProfileAlreadyExistsFault of authentication_profile_already_exists_fault
    | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
    | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_authentication_profile_message ->
    ( create_authentication_profile_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileAlreadyExistsFault of authentication_profile_already_exists_fault
      | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_authentication_profile_message ->
    ( create_authentication_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileAlreadyExistsFault of authentication_profile_already_exists_fault
      | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an authentication profile with the specified parameters.\n"]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterAlreadyExistsFault of cluster_already_exists_fault
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
    | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
    | `InvalidClusterTrackFault of invalid_cluster_track_fault
    | `InvalidElasticIpFault of invalid_elastic_ip_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidTagFault of invalid_tag_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `NumberOfNodesPerClusterLimitExceededFault of number_of_nodes_per_cluster_limit_exceeded_fault
    | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_message ->
    ( create_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_message ->
    ( create_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cluster with the specified parameters.\n\n\
  \ To create a cluster in Virtual Private Cloud (VPC), you must provide a cluster subnet group \
   name. The cluster subnet group identifies the subnets of your VPC that Amazon Redshift uses \
   when creating the cluster. For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ \n\
  \  VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a subnet group for a provisioned cluster is in an account \
   with VPC BPA turned on, the following capabilities are blocked:\n\
  \  \n\
  \   {ul\n\
  \         {-  Creating a public cluster\n\
  \             \n\
  \              }\n\
  \         {-  Restoring a public cluster\n\
  \             \n\
  \              }\n\
  \         {-  Modifying a private cluster to be public\n\
  \             \n\
  \              }\n\
  \         {-  Adding a subnet with VPC BPA turned on to the subnet group when there's at least \
   one public cluster within the group\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module CreateClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupAlreadyExistsFault of cluster_parameter_group_already_exists_fault
    | `ClusterParameterGroupQuotaExceededFault of cluster_parameter_group_quota_exceeded_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_parameter_group_message ->
    ( create_cluster_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupAlreadyExistsFault of cluster_parameter_group_already_exists_fault
      | `ClusterParameterGroupQuotaExceededFault of cluster_parameter_group_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_parameter_group_message ->
    ( create_cluster_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupAlreadyExistsFault of cluster_parameter_group_already_exists_fault
      | `ClusterParameterGroupQuotaExceededFault of cluster_parameter_group_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Redshift parameter group.\n\n\
  \ Creating parameter groups is independent of creating clusters. You can associate a cluster \
   with a parameter group when you create the cluster. You can also associate an existing cluster \
   with a parameter group after the cluster is created by using [ModifyCluster]. \n\
  \ \n\
  \  Parameters in the parameter group define specific behavior that applies to the databases you \
   create on the cluster. For more information about parameters and parameter groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
   Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \  "]

module CreateClusterSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSecurityGroupAlreadyExistsFault of cluster_security_group_already_exists_fault
    | `ClusterSecurityGroupQuotaExceededFault of cluster_security_group_quota_exceeded_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_security_group_message ->
    ( create_cluster_security_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupAlreadyExistsFault of cluster_security_group_already_exists_fault
      | `ClusterSecurityGroupQuotaExceededFault of cluster_security_group_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_security_group_message ->
    ( create_cluster_security_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupAlreadyExistsFault of cluster_security_group_already_exists_fault
      | `ClusterSecurityGroupQuotaExceededFault of cluster_security_group_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Redshift security group. You use security groups to control access to \
   non-VPC clusters.\n\n\
  \  For information about managing security groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html}Amazon \
   Redshift Cluster Security Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module CreateClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
    | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_snapshot_message ->
    ( create_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_snapshot_message ->
    ( create_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a manual snapshot of the specified cluster. The cluster must be in the [available] \
   state. \n\n\
  \  For more information about working with snapshots, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html}Amazon Redshift \
   Snapshots} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module CreateClusterSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSubnetGroupAlreadyExistsFault of cluster_subnet_group_already_exists_fault
    | `ClusterSubnetGroupQuotaExceededFault of cluster_subnet_group_quota_exceeded_fault
    | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_subnet_group_message ->
    ( create_cluster_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupAlreadyExistsFault of cluster_subnet_group_already_exists_fault
      | `ClusterSubnetGroupQuotaExceededFault of cluster_subnet_group_quota_exceeded_fault
      | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_subnet_group_message ->
    ( create_cluster_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupAlreadyExistsFault of cluster_subnet_group_already_exists_fault
      | `ClusterSubnetGroupQuotaExceededFault of cluster_subnet_group_quota_exceeded_fault
      | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Redshift subnet group. You must provide a list of one or more subnets in \
   your existing Amazon Virtual Private Cloud (Amazon VPC) when creating Amazon Redshift subnet \
   group.\n\n\
  \  For information about subnet groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-cluster-subnet-groups.html}Amazon \
   Redshift Cluster Subnet Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module CreateCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `CustomCnameAssociationFault of custom_cname_association_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_message ->
    ( create_custom_domain_association_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_message ->
    ( create_custom_domain_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to create a custom domain name for a cluster. Properties include the custom domain name, \
   the cluster the custom domain is associated with, and the certificate Amazon Resource Name \
   (ARN).\n"]

module CreateEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessToClusterDeniedFault of access_to_cluster_denied_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `EndpointAlreadyExistsFault of endpoint_already_exists_fault
    | `EndpointsPerAuthorizationLimitExceededFault of
      endpoints_per_authorization_limit_exceeded_fault
    | `EndpointsPerClusterLimitExceededFault of endpoints_per_cluster_limit_exceeded_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_message ->
    ( endpoint_access,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToClusterDeniedFault of access_to_cluster_denied_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `EndpointAlreadyExistsFault of endpoint_already_exists_fault
      | `EndpointsPerAuthorizationLimitExceededFault of
        endpoints_per_authorization_limit_exceeded_fault
      | `EndpointsPerClusterLimitExceededFault of endpoints_per_cluster_limit_exceeded_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_message ->
    ( endpoint_access Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToClusterDeniedFault of access_to_cluster_denied_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `EndpointAlreadyExistsFault of endpoint_already_exists_fault
      | `EndpointsPerAuthorizationLimitExceededFault of
        endpoints_per_authorization_limit_exceeded_fault
      | `EndpointsPerClusterLimitExceededFault of endpoints_per_cluster_limit_exceeded_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a Redshift-managed VPC endpoint.\n"]

module CreateEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
    | `InvalidTagFault of invalid_tag_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
    | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
    | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
      | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
      | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Redshift event notification subscription. This action requires an ARN (Amazon \
   Resource Name) of an Amazon SNS topic created by either the Amazon Redshift console, the Amazon \
   SNS console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic \
   in Amazon SNS and subscribe to the topic. The ARN is displayed in the SNS console.\n\n\
  \ You can specify the source type, and lists of Amazon Redshift source IDs, event categories, \
   and event severities. Notifications will be sent for all events you want that match those \
   criteria. For example, you can specify source type = cluster, source ID = my-cluster-1 and \
   mycluster2, event categories = Availability, Backup, and severity = ERROR. The subscription \
   will only send notifications for those ERROR events in the Availability and Backup categories \
   for the specified clusters.\n\
  \ \n\
  \  If you specify both the source type and source IDs, such as source type = cluster and source \
   identifier = my-cluster-1, notifications will be sent for all the cluster events for \
   my-cluster-1. If you specify a source type but do not specify a source identifier, you will \
   receive notice of the events for the objects of that type in your Amazon Web Services account. \
   If you do not specify either the SourceType nor the SourceIdentifier, you will be notified of \
   events generated from all Amazon Redshift sources belonging to your Amazon Web Services \
   account. You must specify a source type if you specify a source ID.\n\
  \  "]

module CreateHsmClientCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmClientCertificateAlreadyExistsFault of hsm_client_certificate_already_exists_fault
    | `HsmClientCertificateQuotaExceededFault of hsm_client_certificate_quota_exceeded_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_client_certificate_message ->
    ( create_hsm_client_certificate_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateAlreadyExistsFault of hsm_client_certificate_already_exists_fault
      | `HsmClientCertificateQuotaExceededFault of hsm_client_certificate_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_client_certificate_message ->
    ( create_hsm_client_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateAlreadyExistsFault of hsm_client_certificate_already_exists_fault
      | `HsmClientCertificateQuotaExceededFault of hsm_client_certificate_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an HSM client certificate that an Amazon Redshift cluster will use to connect to the \
   client's HSM in order to store and retrieve the keys used to encrypt the cluster databases.\n\n\
  \ The command returns a public key, which you must store in the HSM. In addition to creating the \
   HSM certificate, you must create an Amazon Redshift HSM configuration that provides a cluster \
   the information needed to store and use encryption keys in the HSM. For more information, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html#working-with-HSM}Hardware \
   Security Modules} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module CreateHsmConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmConfigurationAlreadyExistsFault of hsm_configuration_already_exists_fault
    | `HsmConfigurationQuotaExceededFault of hsm_configuration_quota_exceeded_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_configuration_message ->
    ( create_hsm_configuration_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationAlreadyExistsFault of hsm_configuration_already_exists_fault
      | `HsmConfigurationQuotaExceededFault of hsm_configuration_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hsm_configuration_message ->
    ( create_hsm_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationAlreadyExistsFault of hsm_configuration_already_exists_fault
      | `HsmConfigurationQuotaExceededFault of hsm_configuration_quota_exceeded_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an HSM configuration that contains the information required by an Amazon Redshift \
   cluster to store and use database encryption keys in a Hardware Security Module (HSM). After \
   creating the HSM configuration, you can specify it as a parameter when creating a cluster. The \
   cluster will then store its encryption keys in the HSM.\n\n\
  \ In addition to creating an HSM configuration, you must also create an HSM client certificate. \
   For more information, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-HSM.html}Hardware Security \
   Modules} in the Amazon Redshift Cluster Management Guide.\n\
  \ "]

module CreateIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationAlreadyExistsFault of integration_already_exists_fault
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
    | `IntegrationSourceNotFoundFault of integration_source_not_found_fault
    | `IntegrationTargetNotFoundFault of integration_target_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidTagFault of invalid_tag_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `IntegrationSourceNotFoundFault of integration_source_not_found_fault
      | `IntegrationTargetNotFoundFault of integration_target_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `IntegrationSourceNotFoundFault of integration_source_not_found_fault
      | `IntegrationTargetNotFoundFault of integration_target_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTagFault of invalid_tag_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a zero-ETL integration or S3 event integration with Amazon Redshift.\n"]

module CreateRedshiftIdcApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InvalidTagFault of invalid_tag_fault
    | `RedshiftIdcApplicationAlreadyExistsFault of redshift_idc_application_already_exists_fault
    | `RedshiftIdcApplicationQuotaExceededFault of redshift_idc_application_quota_exceeded_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_redshift_idc_application_message ->
    ( create_redshift_idc_application_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidTagFault of invalid_tag_fault
      | `RedshiftIdcApplicationAlreadyExistsFault of redshift_idc_application_already_exists_fault
      | `RedshiftIdcApplicationQuotaExceededFault of redshift_idc_application_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_redshift_idc_application_message ->
    ( create_redshift_idc_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidTagFault of invalid_tag_fault
      | `RedshiftIdcApplicationAlreadyExistsFault of redshift_idc_application_already_exists_fault
      | `RedshiftIdcApplicationQuotaExceededFault of redshift_idc_application_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Amazon Redshift application for use with IAM Identity Center.\n"]

module CreateScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidScheduledActionFault of invalid_scheduled_action_fault
    | `InvalidScheduleFault of invalid_schedule_fault
    | `ScheduledActionAlreadyExistsFault of scheduled_action_already_exists_fault
    | `ScheduledActionQuotaExceededFault of scheduled_action_quota_exceeded_fault
    | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_message ->
    ( scheduled_action,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidScheduledActionFault of invalid_scheduled_action_fault
      | `InvalidScheduleFault of invalid_schedule_fault
      | `ScheduledActionAlreadyExistsFault of scheduled_action_already_exists_fault
      | `ScheduledActionQuotaExceededFault of scheduled_action_quota_exceeded_fault
      | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_message ->
    ( scheduled_action Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidScheduledActionFault of invalid_scheduled_action_fault
      | `InvalidScheduleFault of invalid_schedule_fault
      | `ScheduledActionAlreadyExistsFault of scheduled_action_already_exists_fault
      | `ScheduledActionQuotaExceededFault of scheduled_action_quota_exceeded_fault
      | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API \
   action. For example, you can create a schedule of when to run the [ResizeCluster] API \
   operation. \n"]

module CreateSnapshotCopyGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `InvalidTagFault of invalid_tag_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `SnapshotCopyGrantAlreadyExistsFault of snapshot_copy_grant_already_exists_fault
    | `SnapshotCopyGrantQuotaExceededFault of snapshot_copy_grant_quota_exceeded_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_grant_message ->
    ( create_snapshot_copy_grant_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidTagFault of invalid_tag_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `SnapshotCopyGrantAlreadyExistsFault of snapshot_copy_grant_already_exists_fault
      | `SnapshotCopyGrantQuotaExceededFault of snapshot_copy_grant_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_grant_message ->
    ( create_snapshot_copy_grant_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidTagFault of invalid_tag_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `SnapshotCopyGrantAlreadyExistsFault of snapshot_copy_grant_already_exists_fault
      | `SnapshotCopyGrantQuotaExceededFault of snapshot_copy_grant_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot copy grant that permits Amazon Redshift to use an encrypted symmetric key \
   from Key Management Service (KMS) to encrypt copied snapshots in a destination region.\n\n\
  \  For more information about managing snapshot copy grants, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html}Amazon \
   Redshift Database Encryption} in the {i Amazon Redshift Cluster Management Guide}. \n\
  \ "]

module CreateSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidScheduleFault of invalid_schedule_fault
    | `InvalidTagFault of invalid_tag_fault
    | `ScheduleDefinitionTypeUnsupportedFault of schedule_definition_type_unsupported_fault
    | `SnapshotScheduleAlreadyExistsFault of snapshot_schedule_already_exists_fault
    | `SnapshotScheduleQuotaExceededFault of snapshot_schedule_quota_exceeded_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_schedule_message ->
    ( snapshot_schedule,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidScheduleFault of invalid_schedule_fault
      | `InvalidTagFault of invalid_tag_fault
      | `ScheduleDefinitionTypeUnsupportedFault of schedule_definition_type_unsupported_fault
      | `SnapshotScheduleAlreadyExistsFault of snapshot_schedule_already_exists_fault
      | `SnapshotScheduleQuotaExceededFault of snapshot_schedule_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_schedule_message ->
    ( snapshot_schedule Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidScheduleFault of invalid_schedule_fault
      | `InvalidTagFault of invalid_tag_fault
      | `ScheduleDefinitionTypeUnsupportedFault of schedule_definition_type_unsupported_fault
      | `SnapshotScheduleAlreadyExistsFault of snapshot_schedule_already_exists_fault
      | `SnapshotScheduleQuotaExceededFault of snapshot_schedule_quota_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a snapshot schedule that can be associated to a cluster and which overrides the default \
   system backup schedule. \n"]

module CreateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidTagFault of invalid_tag_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tags_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tags_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to a cluster.\n\n\
  \ A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, you \
   will receive an error and the attempt will fail.\n\
  \ \n\
  \  If you specify a key that already exists for the resource, the value for that key will be \
   updated with the new value.\n\
  \  "]

module CreateUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidUsageLimitFault of invalid_usage_limit_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnsupportedOperationFault of unsupported_operation_fault
    | `UsageLimitAlreadyExistsFault of usage_limit_already_exists_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_message ->
    ( usage_limit,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidUsageLimitFault of invalid_usage_limit_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitAlreadyExistsFault of usage_limit_already_exists_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_message ->
    ( usage_limit Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidUsageLimitFault of invalid_usage_limit_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitAlreadyExistsFault of usage_limit_already_exists_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a usage limit for a specified Amazon Redshift feature on a cluster. The usage limit is \
   identified by the returned usage limit identifier.\n"]

module DeauthorizeDataShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deauthorize_data_share_message ->
    ( data_share,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deauthorize_data_share_message ->
    ( data_share Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "From a datashare producer account, removes authorization from the specified datashare. \n"]

module DeleteAuthenticationProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
    | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_authentication_profile_message ->
    ( delete_authentication_profile_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_authentication_profile_message ->
    ( delete_authentication_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an authentication profile.\n"]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
    | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_message ->
    ( delete_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_message ->
    ( delete_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotAlreadyExistsFault of cluster_snapshot_already_exists_fault
      | `ClusterSnapshotQuotaExceededFault of cluster_snapshot_quota_exceeded_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously provisioned cluster without its final snapshot being created. A successful \
   response from the web service indicates that the request was received correctly. Use \
   [DescribeClusters] to monitor the status of the deletion. The delete operation cannot be \
   canceled or reverted once submitted. For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n\n\
  \ If you want to shut down the cluster and retain it for future use, set {i \
   SkipFinalClusterSnapshot} to [false] and specify a name for {i FinalClusterSnapshotIdentifier}. \
   You can later restore this snapshot to resume using the cluster. If a final cluster snapshot is \
   requested, the status of the cluster will be \"final-snapshot\" while the snapshot is being \
   taken, then it's \"deleting\" once Amazon Redshift begins deleting the cluster. \n\
  \ \n\
  \   For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \  "]

module DeleteClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified Amazon Redshift parameter group.\n\n\
  \  You cannot delete a parameter group if it is associated with a cluster.\n\
  \  \n\
  \   "]

module DeleteClusterSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Redshift security group.\n\n\
  \  You cannot delete a security group that is associated with any clusters. You cannot delete \
   the default security group.\n\
  \  \n\
  \     For information about managing security groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html}Amazon \
   Redshift Cluster Security Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \    "]

module DeleteClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_snapshot_message ->
    ( delete_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_snapshot_message ->
    ( delete_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified manual snapshot. The snapshot must be in the [available] state, with no \
   other users authorized to access the snapshot. \n\n\
  \ Unlike automated snapshots, manual snapshots are retained even after you delete your cluster. \
   Amazon Redshift does not delete your manual snapshots. You must delete manual snapshot \
   explicitly to avoid getting charged. If other accounts are authorized to access the snapshot, \
   you must revoke all of the authorizations before you can delete the snapshot.\n\
  \ "]

module DeleteClusterSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
    | `InvalidClusterSubnetStateFault of invalid_cluster_subnet_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterSubnetStateFault of invalid_cluster_subnet_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterSubnetStateFault of invalid_cluster_subnet_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified cluster subnet group.\n"]

module DeleteCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `CustomCnameAssociationFault of custom_cname_association_fault
    | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Contains information about deleting a custom domain association for a cluster.\n"]

module DeleteEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `EndpointNotFoundFault of endpoint_not_found_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidEndpointStateFault of invalid_endpoint_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_message ->
    ( endpoint_access,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_message ->
    ( endpoint_access Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a Redshift-managed VPC endpoint.\n"]

module DeleteEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon Redshift event notification subscription.\n"]

module DeleteHsmClientCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
    | `InvalidHsmClientCertificateStateFault of invalid_hsm_client_certificate_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_client_certificate_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `InvalidHsmClientCertificateStateFault of invalid_hsm_client_certificate_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_client_certificate_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `InvalidHsmClientCertificateStateFault of invalid_hsm_client_certificate_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified HSM client certificate.\n"]

module DeleteHsmConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
    | `InvalidHsmConfigurationStateFault of invalid_hsm_configuration_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_configuration_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InvalidHsmConfigurationStateFault of invalid_hsm_configuration_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_hsm_configuration_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InvalidHsmConfigurationStateFault of invalid_hsm_configuration_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Amazon Redshift HSM configuration.\n"]

module DeleteIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationConflictStateFault of integration_conflict_state_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationConflictStateFault of integration_conflict_state_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationConflictStateFault of integration_conflict_state_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a zero-ETL integration or S3 event integration with Amazon Redshift.\n"]

module DeletePartner : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `PartnerNotFoundFault of partner_not_found_fault
    | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    partner_integration_input_message ->
    ( partner_integration_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    partner_integration_input_message ->
    ( partner_integration_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a partner integration from a cluster. Data can still flow to the cluster until the \
   integration is deleted at the partner's website.\n"]

module DeleteRedshiftIdcApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_redshift_idc_application_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_redshift_idc_application_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon Redshift IAM Identity Center application.\n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceNotFoundFault of resource_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the resource policy for a specified resource.\n"]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a scheduled action. \n"]

module DeleteSnapshotCopyGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidSnapshotCopyGrantStateFault of invalid_snapshot_copy_grant_state_fault
    | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_grant_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSnapshotCopyGrantStateFault of invalid_snapshot_copy_grant_state_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_grant_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSnapshotCopyGrantStateFault of invalid_snapshot_copy_grant_state_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified snapshot copy grant.\n"]

module DeleteSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
    | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_schedule_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_schedule_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot schedule.\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTagFault of invalid_tag_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes tags from a resource. You must provide the ARN of the resource from which you want to \
   delete the tag or tags.\n"]

module DeleteUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `UnsupportedOperationFault of unsupported_operation_fault
    | `UsageLimitNotFoundFault of usage_limit_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitNotFoundFault of usage_limit_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitNotFoundFault of usage_limit_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a usage limit from a cluster.\n"]

module DeregisterNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_namespace_input_message ->
    ( deregister_namespace_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_namespace_input_message ->
    ( deregister_namespace_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters a cluster or serverless namespace from the Amazon Web Services Glue Data Catalog.\n"]

module DescribeAccountAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    (account_attribute_list, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    ( account_attribute_list Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of attributes attached to an account\n"]

module DescribeAuthenticationProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
    | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_authentication_profiles_message ->
    ( describe_authentication_profiles_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_authentication_profiles_message ->
    ( describe_authentication_profiles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an authentication profile.\n"]

module DescribeClusterDbRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_db_revisions_message ->
    ( cluster_db_revisions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_db_revisions_message ->
    ( cluster_db_revisions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of [ClusterDbRevision] objects.\n"]

module DescribeClusterParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_parameter_groups_message ->
    ( cluster_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_parameter_groups_message ->
    ( cluster_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of Amazon Redshift parameter groups, including parameter groups you created and \
   the default parameter group. For each parameter group, the response includes the parameter \
   group name, description, and parameter group family name. You can optionally specify a name to \
   retrieve the description of a specific parameter group.\n\n\
  \  For more information about parameters and parameter groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
   Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ \n\
  \  If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   parameter groups that match any combination of the specified keys and values. For example, if \
   you have [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all \
   parameter groups that have any combination of those values are returned.\n\
  \  \n\
  \   If both tag keys and values are omitted from the request, parameter groups are returned \
   regardless of whether they have tag keys or values associated with them.\n\
  \   "]

module DescribeClusterParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_parameters_message ->
    ( cluster_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_parameters_message ->
    ( cluster_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a detailed list of parameters contained within the specified Amazon Redshift parameter \
   group. For each parameter the response includes information such as parameter name, \
   description, data type, value, whether the parameter value is modifiable, and so on.\n\n\
  \ You can specify {i source} filter to retrieve parameters of only specific type. For example, \
   to retrieve parameters that were modified by a user action such as from \
   [ModifyClusterParameterGroup], you can specify {i source} equal to {i user}.\n\
  \ \n\
  \   For more information about parameters and parameter groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
   Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \  "]

module DescribeClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_message ->
    ( clusters_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_message ->
    ( clusters_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns properties of provisioned clusters including general cluster properties, cluster \
   database properties, maintenance and backup properties, and security and access properties. \
   This operation supports pagination. For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   clusters that match any combination of the specified keys and values. For example, if you have \
   [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all clusters \
   that have any combination of those values are returned.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, clusters are returned regardless of \
   whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeClusterSecurityGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_security_groups_message ->
    ( cluster_security_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_security_groups_message ->
    ( cluster_security_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about Amazon Redshift security groups. If the name of a security group is \
   specified, the response will contain only information about only that security group.\n\n\
  \  For information about managing security groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html}Amazon \
   Redshift Cluster Security Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ \n\
  \  If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   security groups that match any combination of the specified keys and values. For example, if \
   you have [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all \
   security groups that have any combination of those values are returned.\n\
  \  \n\
  \   If both tag keys and values are omitted from the request, security groups are returned \
   regardless of whether they have tag keys or values associated with them.\n\
  \   "]

module DescribeClusterSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `InvalidTagFault of invalid_tag_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_snapshots_message ->
    ( snapshot_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidTagFault of invalid_tag_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_snapshots_message ->
    ( snapshot_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidTagFault of invalid_tag_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns one or more snapshot objects, which contain metadata about your cluster snapshots. By \
   default, this operation returns information about all snapshots of all clusters that are owned \
   by your Amazon Web Services account. No information is returned for snapshots owned by inactive \
   Amazon Web Services accounts.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   snapshots that match any combination of the specified keys and values. For example, if you have \
   [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all snapshots \
   that have any combination of those values are returned. Only snapshots that you own are \
   returned in the response; shared snapshots are not returned with the tag key and tag value \
   request parameters.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, snapshots are returned regardless \
   of whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeClusterSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_subnet_groups_message ->
    ( cluster_subnet_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_subnet_groups_message ->
    ( cluster_subnet_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns one or more cluster subnet group objects, which contain metadata about your cluster \
   subnet groups. By default, this operation returns information about all cluster subnet groups \
   that are defined in your Amazon Web Services account.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   subnet groups that match any combination of the specified keys and values. For example, if you \
   have [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all subnet \
   groups that have any combination of those values are returned.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, subnet groups are returned \
   regardless of whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeClusterTracks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidClusterTrackFault of invalid_cluster_track_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_tracks_message ->
    ( track_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_tracks_message ->
    ( track_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all the available maintenance tracks.\n"]

module DescribeClusterVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_versions_message ->
    (cluster_versions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_versions_message ->
    ( cluster_versions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns descriptions of the available Amazon Redshift cluster versions. You can call this \
   operation even before creating any clusters to learn more about the Amazon Redshift versions. \
   For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n"]

module DescribeCustomDomainAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_domain_associations_message ->
    ( custom_domain_associations_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_domain_associations_message ->
    ( custom_domain_associations_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Contains information about custom domain associations for a cluster.\n"]

module DescribeDataShares : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_message ->
    ( describe_data_shares_result,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_message ->
    ( describe_data_shares_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shows the status of any inbound or outbound datashares available in the specified account.\n"]

module DescribeDataSharesForConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_for_consumer_message ->
    ( describe_data_shares_for_consumer_result,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_for_consumer_message ->
    ( describe_data_shares_for_consumer_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of datashares where the account identifier being called is a consumer account \
   identifier.\n"]

module DescribeDataSharesForProducer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_for_producer_message ->
    ( describe_data_shares_for_producer_result,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_shares_for_producer_message ->
    ( describe_data_shares_for_producer_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of datashares when the account identifier being called is a producer account \
   identifier.\n"]

module DescribeDefaultClusterParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_default_cluster_parameters_message ->
    (describe_default_cluster_parameters_result, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_default_cluster_parameters_message ->
    ( describe_default_cluster_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of parameter settings for the specified parameter group family.\n\n\
  \  For more information about parameters and parameter groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
   Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module DescribeEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `EndpointNotFoundFault of endpoint_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_access_message ->
    ( endpoint_access_list,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_access_message ->
    ( endpoint_access_list Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a Redshift-managed VPC endpoint.\n"]

module DescribeEndpointAuthorization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_authorization_message ->
    ( endpoint_authorization_list,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_authorization_message ->
    ( endpoint_authorization_list Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an endpoint authorization.\n"]

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
  "Displays a list of event categories for all event source types, or for a specified source type. \
   For a list of the event categories and source types, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html}Amazon \
   Redshift Event Notifications}.\n"]

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
  "Returns events related to clusters, security groups, snapshots, and parameter groups for the \
   past 14 days. Events specific to a particular cluster, security group, snapshot or parameter \
   group can be obtained by providing the name as a parameter. By default, the past hour of events \
   are returned.\n"]

module DescribeEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTagFault of invalid_tag_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists descriptions of all the Amazon Redshift event notification subscriptions for a customer \
   account. If you specify a subscription name, lists the description for that subscription.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   event notification subscriptions that match any combination of the specified keys and values. \
   For example, if you have [owner] and [environment] for tag keys, and [admin] and [test] for tag \
   values, all subscriptions that have any combination of those values are returned.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, subscriptions are returned \
   regardless of whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeHsmClientCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_client_certificates_message ->
    ( hsm_client_certificate_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_client_certificates_message ->
    ( hsm_client_certificate_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified HSM client certificate. If no certificate ID is \
   specified, returns information about all the HSM certificates owned by your Amazon Web Services \
   account.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   HSM client certificates that match any combination of the specified keys and values. For \
   example, if you have [owner] and [environment] for tag keys, and [admin] and [test] for tag \
   values, all HSM client certificates that have any combination of those values are returned.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, HSM client certificates are \
   returned regardless of whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeHsmConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
    | `InvalidTagFault of invalid_tag_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_configurations_message ->
    ( hsm_configuration_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hsm_configurations_message ->
    ( hsm_configuration_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InvalidTagFault of invalid_tag_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified Amazon Redshift HSM configuration. If no configuration \
   ID is specified, returns information about all the HSM configurations owned by your Amazon Web \
   Services account.\n\n\
  \ If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   HSM connections that match any combination of the specified keys and values. For example, if \
   you have [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all HSM \
   connections that have any combination of those values are returned.\n\
  \ \n\
  \  If both tag keys and values are omitted from the request, HSM connections are returned \
   regardless of whether they have tag keys or values associated with them.\n\
  \  "]

module DescribeInboundIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InvalidNamespaceFault of invalid_namespace_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_message ->
    ( inbound_integrations_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidNamespaceFault of invalid_namespace_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_message ->
    ( inbound_integrations_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidNamespaceFault of invalid_namespace_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of inbound integrations.\n"]

module DescribeIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_message ->
    ( integrations_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_message ->
    ( integrations_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more zero-ETL or S3 event integrations with Amazon Redshift.\n"]

module DescribeLoggingStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_status_message ->
    ( logging_status,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_logging_status_message ->
    ( logging_status Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes whether information, such as queries and connection attempts, is being logged for the \
   specified Amazon Redshift cluster.\n"]

module DescribeNodeConfigurationOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_node_configuration_options_message ->
    ( node_configuration_options_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_node_configuration_options_message ->
    ( node_configuration_options_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns properties of possible node configurations such as node type, number of nodes, and disk \
   usage for the specified action type.\n"]

module DescribeOrderableClusterOptions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_cluster_options_message ->
    (orderable_cluster_options_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_cluster_options_message ->
    ( orderable_cluster_options_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of orderable cluster options. Before you create a new cluster you can use this \
   operation to find what options are available, such as the EC2 Availability Zones (AZ) in the \
   specific Amazon Web Services Region that you can specify, and the node types you can request. \
   The node types differ by available storage, memory, CPU and price. With the cost involved you \
   might want to obtain a list of cluster options in the specific region and specify values when \
   creating a cluster. For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n"]

module DescribePartners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_partners_input_message ->
    ( describe_partners_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_partners_input_message ->
    ( describe_partners_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the partner integrations defined for a cluster.\n"]

module DescribeRedshiftIdcApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_redshift_idc_applications_message ->
    ( describe_redshift_idc_applications_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_redshift_idc_applications_message ->
    ( describe_redshift_idc_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the Amazon Redshift IAM Identity Center applications.\n"]

module DescribeReservedNodeExchangeStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReservedNodeExchangeNotFoundFault of reserved_node_exchange_not_found_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_node_exchange_status_input_message ->
    ( describe_reserved_node_exchange_status_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedNodeExchangeNotFoundFault of reserved_node_exchange_not_found_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_node_exchange_status_input_message ->
    ( describe_reserved_node_exchange_status_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedNodeExchangeNotFoundFault of reserved_node_exchange_not_found_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns exchange status details and associated metadata for a reserved-node exchange. Statuses \
   include such values as in progress and requested.\n"]

module DescribeReservedNodeOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_node_offerings_message ->
    ( reserved_node_offerings_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_node_offerings_message ->
    ( reserved_node_offerings_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the available reserved node offerings by Amazon Redshift with their \
   descriptions including the node type, the fixed and recurring costs of reserving the node and \
   duration the node will be reserved for you. These descriptions help you determine which reserve \
   node offering you want to purchase. You then use the unique offering ID in you call to \
   [PurchaseReservedNodeOffering] to reserve one or more nodes for your Amazon Redshift cluster. \n\n\
  \  For more information about reserved node offerings, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html}Purchasing \
   Reserved Nodes} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module DescribeReservedNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_message ->
    ( reserved_nodes_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_nodes_message ->
    ( reserved_nodes_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the descriptions of the reserved nodes.\n"]

module DescribeResize : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ResizeNotFoundFault of resize_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resize_message ->
    ( resize_progress_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ResizeNotFoundFault of resize_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resize_message ->
    ( resize_progress_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ResizeNotFoundFault of resize_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the last resize operation for the specified cluster. If no resize \
   operation has ever been initiated for the specified cluster, a [HTTP\n\
  \                404] error is returned. If a resize operation was initiated and completed, the \
   status of the resize remains as [SUCCEEDED] until the next resize. \n\n\
  \ A resize operation can be requested using [ModifyCluster] and specifying a different number or \
   type of nodes for the cluster. \n\
  \ "]

module DescribeScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_message ->
    ( scheduled_actions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_message ->
    ( scheduled_actions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes properties of scheduled actions. \n"]

module DescribeSnapshotCopyGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTagFault of invalid_tag_fault
    | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_copy_grants_message ->
    ( snapshot_copy_grant_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_copy_grants_message ->
    ( snapshot_copy_grant_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of snapshot copy grants owned by the Amazon Web Services account in the \
   destination region.\n\n\
  \  For more information about managing snapshot copy grants, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html}Amazon \
   Redshift Database Encryption} in the {i Amazon Redshift Cluster Management Guide}. \n\
  \ "]

module DescribeSnapshotSchedules : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_schedules_message ->
    (describe_snapshot_schedules_output_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshot_schedules_message ->
    ( describe_snapshot_schedules_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of snapshot schedules. \n"]

module DescribeStorage : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (customer_storage_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( customer_storage_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns account level backups storage size and provisional storage.\n"]

module DescribeTableRestoreStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `TableRestoreNotFoundFault of table_restore_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_table_restore_status_message ->
    ( table_restore_status_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `TableRestoreNotFoundFault of table_restore_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_table_restore_status_message ->
    ( table_restore_status_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `TableRestoreNotFoundFault of table_restore_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the status of one or more table restore requests made using the \
   [RestoreTableFromClusterSnapshot] API action. If you don't specify a value for the \
   [TableRestoreRequestId] parameter, then [DescribeTableRestoreStatus] returns the status of all \
   table restore requests ordered by the date and time of the request in ascending order. \
   Otherwise [DescribeTableRestoreStatus] returns the status of the table specified by \
   [TableRestoreRequestId].\n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTagFault of invalid_tag_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_message ->
    ( tagged_resource_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_message ->
    ( tagged_resource_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTagFault of invalid_tag_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of tags. You can return tags from a specific resource by specifying an ARN, or \
   you can return all tags for a given type of resource, such as clusters, snapshots, and so on.\n\n\
  \ The following are limitations for [DescribeTags]: \n\
  \ \n\
  \  {ul\n\
  \        {-  You cannot specify an ARN and a resource-type value together in the same request.\n\
  \            \n\
  \             }\n\
  \        {-  You cannot use the [MaxRecords] and [Marker] parameters together with the ARN \
   parameter.\n\
  \            \n\
  \             }\n\
  \        {-  The [MaxRecords] parameter can be a range from 10 to 50 results to return in a \
   request.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   If you specify both tag keys and tag values in the same request, Amazon Redshift returns all \
   resources that match any combination of the specified keys and values. For example, if you have \
   [owner] and [environment] for tag keys, and [admin] and [test] for tag values, all resources \
   that have any combination of those values are returned.\n\
  \   \n\
  \    If both tag keys and values are omitted from the request, resources are returned regardless \
   of whether they have tag keys or values associated with them.\n\
  \    "]

module DescribeUsageLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_limits_message ->
    ( usage_limit_list,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_limits_message ->
    ( usage_limit_list Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shows usage limits on a cluster. Results are filtered based on the combination of input usage \
   limit identifier, cluster identifier, and feature type parameters:\n\n\
  \ {ul\n\
  \       {-  If usage limit identifier, cluster identifier, and feature type are not provided, \
   then all usage limit objects for the current account in the current region are returned.\n\
  \           \n\
  \            }\n\
  \       {-  If usage limit identifier is provided, then the corresponding usage limit object is \
   returned.\n\
  \           \n\
  \            }\n\
  \       {-  If cluster identifier is provided, then all usage limit objects for the specified \
   cluster are returned.\n\
  \           \n\
  \            }\n\
  \       {-  If cluster identifier and feature type are provided, then all usage limit objects \
   for the combination of cluster and feature are returned.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DisableLogging : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_logging_message ->
    ( logging_status,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_logging_message ->
    ( logging_status Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops logging information, such as queries and connection attempts, for the specified Amazon \
   Redshift cluster.\n"]

module DisableSnapshotCopy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `SnapshotCopyAlreadyDisabledFault of snapshot_copy_already_disabled_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_snapshot_copy_message ->
    ( disable_snapshot_copy_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `SnapshotCopyAlreadyDisabledFault of snapshot_copy_already_disabled_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_snapshot_copy_message ->
    ( disable_snapshot_copy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `SnapshotCopyAlreadyDisabledFault of snapshot_copy_already_disabled_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the automatic copying of snapshots from one region to another region for a specified \
   cluster.\n\n\
  \ If your cluster and its snapshots are encrypted using an encrypted symmetric key from Key \
   Management Service, use [DeleteSnapshotCopyGrant] to delete the grant that grants Amazon \
   Redshift permission to the key in the destination region. \n\
  \ "]

module DisassociateDataShareConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidDataShareFault of invalid_data_share_fault
    | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_data_share_consumer_message ->
    ( data_share,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDataShareFault of invalid_data_share_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_data_share_consumer_message ->
    ( data_share Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDataShareFault of invalid_data_share_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "From a datashare consumer account, remove association for the specified datashare. \n"]

module EnableLogging : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BucketNotFoundFault of bucket_not_found_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InsufficientS3BucketPolicyFault of insufficient_s3_bucket_policy_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidS3BucketNameFault of invalid_s3_bucket_name_fault
    | `InvalidS3KeyPrefixFault of invalid_s3_key_prefix_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_logging_message ->
    ( logging_status,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BucketNotFoundFault of bucket_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientS3BucketPolicyFault of insufficient_s3_bucket_policy_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidS3BucketNameFault of invalid_s3_bucket_name_fault
      | `InvalidS3KeyPrefixFault of invalid_s3_key_prefix_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_logging_message ->
    ( logging_status Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BucketNotFoundFault of bucket_not_found_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientS3BucketPolicyFault of insufficient_s3_bucket_policy_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidS3BucketNameFault of invalid_s3_bucket_name_fault
      | `InvalidS3KeyPrefixFault of invalid_s3_key_prefix_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts logging information, such as queries and connection attempts, for the specified Amazon \
   Redshift cluster.\n"]

module EnableSnapshotCopy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `CopyToRegionDisabledFault of copy_to_region_disabled_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `IncompatibleOrderableOptions of incompatible_orderable_options
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `SnapshotCopyAlreadyEnabledFault of snapshot_copy_already_enabled_fault
    | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnknownSnapshotCopyRegionFault of unknown_snapshot_copy_region_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_snapshot_copy_message ->
    ( enable_snapshot_copy_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CopyToRegionDisabledFault of copy_to_region_disabled_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `IncompatibleOrderableOptions of incompatible_orderable_options
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `SnapshotCopyAlreadyEnabledFault of snapshot_copy_already_enabled_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnknownSnapshotCopyRegionFault of unknown_snapshot_copy_region_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_snapshot_copy_message ->
    ( enable_snapshot_copy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CopyToRegionDisabledFault of copy_to_region_disabled_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `IncompatibleOrderableOptions of incompatible_orderable_options
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `SnapshotCopyAlreadyEnabledFault of snapshot_copy_already_enabled_fault
      | `SnapshotCopyGrantNotFoundFault of snapshot_copy_grant_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnknownSnapshotCopyRegionFault of unknown_snapshot_copy_region_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the automatic copy of snapshots from one region to another region for a specified \
   cluster.\n"]

module FailoverPrimaryCompute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_primary_compute_input_message ->
    ( failover_primary_compute_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_primary_compute_input_message ->
    ( failover_primary_compute_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fails over the primary compute unit of the specified Multi-AZ cluster to another Availability \
   Zone.\n"]

module GetClusterCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_credentials_message ->
    ( cluster_credentials,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_credentials_message ->
    ( cluster_credentials Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a database user name and temporary password with temporary authorization to log on to \
   an Amazon Redshift database. The action returns the database user name prefixed with [IAM:] if \
   [AutoCreate] is [False] or [IAMA:] if [AutoCreate] is [True]. You can optionally specify one or \
   more database user groups that the user will join at log on. By default, the temporary \
   credentials expire in 900 seconds. You can optionally specify a duration between 900 seconds \
   (15 minutes) and 3600 seconds (60 minutes). For more information, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/generating-user-credentials.html}Using IAM \
   Authentication to Generate Database User Credentials} in the Amazon Redshift Cluster Management \
   Guide.\n\n\
  \ The Identity and Access Management (IAM) user or role that runs GetClusterCredentials must \
   have an IAM policy attached that allows access to all necessary actions and resources. For more \
   information about permissions, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html#redshift-policy-resources.getclustercredentials-resources}Resource \
   Policies for GetClusterCredentials} in the Amazon Redshift Cluster Management Guide.\n\
  \ \n\
  \  If the [DbGroups] parameter is specified, the IAM policy must allow the [redshift:JoinGroup] \
   action with access to the listed [dbgroups]. \n\
  \  \n\
  \   In addition, if the [AutoCreate] parameter is set to [True], then the policy must include \
   the [redshift:CreateClusterUser] permission.\n\
  \   \n\
  \    If the [DbName] parameter is specified, the IAM policy must allow access to the resource \
   [dbname] for the specified database name. \n\
  \    "]

module GetClusterCredentialsWithIAM : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_credentials_with_iam_message ->
    ( cluster_extended_credentials,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_credentials_with_iam_message ->
    ( cluster_extended_credentials Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a database user name and temporary password with temporary authorization to log in to \
   an Amazon Redshift database. The database user is mapped 1:1 to the source Identity and Access \
   Management (IAM) identity. For more information about IAM identities, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html}IAM Identities (users, user groups, \
   and roles)} in the Amazon Web Services Identity and Access Management User Guide.\n\n\
  \ The Identity and Access Management (IAM) identity that runs this operation must have an IAM \
   policy attached that allows access to all necessary actions and resources. For more information \
   about permissions, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html}Using \
   identity-based policies (IAM policies)} in the Amazon Redshift Cluster Management Guide. \n\
  \ "]

module GetIdentityCenterAuthToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `RedshiftInvalidParameterFault of redshift_invalid_parameter_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `RedshiftInvalidParameterFault of redshift_invalid_parameter_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `RedshiftInvalidParameterFault of redshift_invalid_parameter_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates an encrypted authentication token that propagates the caller's Amazon Web Services \
   IAM Identity Center identity to Amazon Redshift clusters. This API extracts the Amazon Web \
   Services IAM Identity Center identity from enhanced credentials and creates a secure token that \
   Amazon Redshift drivers can use for authentication.\n\n\
  \ The token is encrypted using Key Management Service (KMS) and can only be decrypted by the \
   specified Amazon Redshift clusters. The token contains the caller's Amazon Web Services IAM \
   Identity Center identity information and is valid for a limited time period.\n\
  \ \n\
  \  This API is exclusively for use with Amazon Web Services IAM Identity Center enhanced \
   credentials. If the caller is not using enhanced credentials with embedded Amazon Web Services \
   IAM Identity Center identity, the API will return an error.\n\
  \  "]

module GetReservedNodeExchangeConfigurationOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
    | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reserved_node_exchange_configuration_options_input_message ->
    ( get_reserved_node_exchange_configuration_options_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reserved_node_exchange_configuration_options_input_message ->
    ( get_reserved_node_exchange_configuration_options_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the configuration options for the reserved-node exchange. These options include \
   information about the source reserved node and target reserved node offering. Details include \
   the node type, the price, the node count, and the offering type.\n"]

module GetReservedNodeExchangeOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
    | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reserved_node_exchange_offerings_input_message ->
    ( get_reserved_node_exchange_offerings_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reserved_node_exchange_offerings_input_message ->
    ( get_reserved_node_exchange_offerings_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an array of DC2 ReservedNodeOfferings that matches the payment type, term, and usage \
   price of the given DC1 reserved node.\n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidPolicyFault of invalid_policy_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_message ->
    ( get_resource_policy_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidPolicyFault of invalid_policy_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_message ->
    ( get_resource_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidPolicyFault of invalid_policy_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the resource policy for a specified resource.\n"]

module ListRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommendations_message ->
    ( list_recommendations_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommendations_message ->
    ( list_recommendations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the Amazon Redshift Advisor recommendations for one or multiple Amazon Redshift clusters \
   in an Amazon Web Services account.\n"]

module ModifyAquaConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_aqua_input_message ->
    ( modify_aqua_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_aqua_input_message ->
    ( modify_aqua_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation is retired. Calling this operation does not change AQUA configuration. Amazon \
   Redshift automatically determines whether to use AQUA (Advanced Query Accelerator). \n"]

module ModifyAuthenticationProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
    | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
    | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_authentication_profile_message ->
    ( modify_authentication_profile_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_authentication_profile_message ->
    ( modify_authentication_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthenticationProfileNotFoundFault of authentication_profile_not_found_fault
      | `AuthenticationProfileQuotaExceededFault of authentication_profile_quota_exceeded_fault
      | `InvalidAuthenticationProfileRequestFault of invalid_authentication_profile_request_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an authentication profile.\n"]

module ModifyCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterAlreadyExistsFault of cluster_already_exists_fault
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `CustomCnameAssociationFault of custom_cname_association_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
    | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidClusterTrackFault of invalid_cluster_track_fault
    | `InvalidElasticIpFault of invalid_elastic_ip_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault
    | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `NumberOfNodesPerClusterLimitExceededFault of number_of_nodes_per_cluster_limit_exceeded_fault
    | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
    | `TableLimitExceededFault of table_limit_exceeded_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault
    | `UnsupportedOptionFault of unsupported_option_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_message ->
    ( modify_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `TableLimitExceededFault of table_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UnsupportedOptionFault of unsupported_option_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_message ->
    ( modify_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `TableLimitExceededFault of table_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UnsupportedOptionFault of unsupported_option_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a cluster.\n\n\
  \ You can also change node type and the number of nodes to scale up or down the cluster. When \
   resizing a cluster, you must specify both the number of nodes and the node type even if one of \
   the parameters does not change.\n\
  \ \n\
  \  You can add another security or parameter group, or change the admin user password. Resetting \
   a cluster password or modifying the security groups associated with a cluster do not need a \
   reboot. However, modifying a parameter group requires a reboot for parameters to take effect. \
   For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \  \n\
  \   VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you \
   own in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a subnet group for a provisioned cluster is in an account \
   with VPC BPA turned on, the following capabilities are blocked:\n\
  \   \n\
  \    {ul\n\
  \          {-  Creating a public cluster\n\
  \              \n\
  \               }\n\
  \          {-  Restoring a public cluster\n\
  \              \n\
  \               }\n\
  \          {-  Modifying a private cluster to be public\n\
  \              \n\
  \               }\n\
  \          {-  Adding a subnet with VPC BPA turned on to the subnet group when there's at least \
   one public cluster within the group\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module ModifyClusterDbRevision : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterOnLatestRevisionFault of cluster_on_latest_revision_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_db_revision_message ->
    ( modify_cluster_db_revision_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterOnLatestRevisionFault of cluster_on_latest_revision_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_db_revision_message ->
    ( modify_cluster_db_revision_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterOnLatestRevisionFault of cluster_on_latest_revision_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the database revision of a cluster. The database revision is a unique revision of the \
   database running in a cluster.\n"]

module ModifyClusterIamRoles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_iam_roles_message ->
    ( modify_cluster_iam_roles_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_iam_roles_message ->
    ( modify_cluster_iam_roles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the list of Identity and Access Management (IAM) roles that can be used by the cluster \
   to access other Amazon Web Services services.\n\n\
  \ The maximum number of IAM roles that you can associate is subject to a quota. For more \
   information, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Quotas and \
   limits} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module ModifyClusterMaintenance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_maintenance_message ->
    ( modify_cluster_maintenance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_maintenance_message ->
    ( modify_cluster_maintenance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the maintenance settings of a cluster.\n"]

module ModifyClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_parameter_group_message ->
    ( cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_parameter_group_message ->
    ( cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a parameter group. For the parameters parameter, it can't contain \
   ASCII characters.\n\n\
  \  For more information about parameters and parameter groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
   Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module ModifyClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_snapshot_message ->
    ( modify_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_snapshot_message ->
    ( modify_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a snapshot.\n\n\
  \ This exanmple modifies the manual retention period setting for a cluster snapshot.\n\
  \ "]

module ModifyClusterSnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
    | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_snapshot_schedule_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_snapshot_schedule_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterSnapshotScheduleStateFault of invalid_cluster_snapshot_schedule_state_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a snapshot schedule for a cluster.\n"]

module ModifyClusterSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `InvalidSubnet of invalid_subnet
    | `SubnetAlreadyInUse of subnet_already_in_use
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_subnet_group_message ->
    ( modify_cluster_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_subnet_group_message ->
    ( modify_cluster_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `ClusterSubnetQuotaExceededFault of cluster_subnet_quota_exceeded_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a cluster subnet group to include the specified list of VPC subnets. The operation \
   replaces the existing list of subnets with the new list of subnets.\n\n\
  \ VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a subnet group for a provisioned cluster is in an account \
   with VPC BPA turned on, the following capabilities are blocked:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creating a public cluster\n\
  \            \n\
  \             }\n\
  \        {-  Restoring a public cluster\n\
  \            \n\
  \             }\n\
  \        {-  Modifying a private cluster to be public\n\
  \            \n\
  \             }\n\
  \        {-  Adding a subnet with VPC BPA turned on to the subnet group when there's at least \
   one public cluster within the group\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module ModifyCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `CustomCnameAssociationFault of custom_cname_association_fault
    | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_custom_domain_association_message ->
    ( modify_custom_domain_association_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_custom_domain_association_message ->
    ( modify_custom_domain_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `CustomCnameAssociationFault of custom_cname_association_fault
      | `CustomDomainAssociationNotFoundFault of custom_domain_association_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Contains information for changing a custom domain association.\n"]

module ModifyEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `EndpointNotFoundFault of endpoint_not_found_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidEndpointStateFault of invalid_endpoint_state_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_access_message ->
    ( endpoint_access,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_access_message ->
    ( endpoint_access Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a Redshift-managed VPC endpoint.\n"]

module ModifyEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
    | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault
    | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault
      | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidSubscriptionStateFault of invalid_subscription_state_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionEventIdNotFoundFault of subscription_event_id_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault
      | `SubscriptionSeverityNotFoundFault of subscription_severity_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an existing Amazon Redshift event notification subscription.\n"]

module ModifyIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationAlreadyExistsFault of integration_already_exists_fault
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationConflictStateFault of integration_conflict_state_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationConflictStateFault of integration_conflict_state_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationConflictStateFault of integration_conflict_state_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a zero-ETL integration or S3 event integration with Amazon Redshift.\n"]

module ModifyLakehouseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_lakehouse_configuration_message ->
    ( lakehouse_configuration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_lakehouse_configuration_message ->
    ( lakehouse_configuration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the lakehouse configuration for a cluster. This operation allows you to manage Amazon \
   Redshift federated permissions and Amazon Web Services IAM Identity Center trusted identity \
   propagation.\n"]

module ModifyRedshiftIdcApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_redshift_idc_application_message ->
    ( modify_redshift_idc_application_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_redshift_idc_application_message ->
    ( modify_redshift_idc_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes an existing Amazon Redshift IAM Identity Center application.\n"]

module ModifyScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidScheduledActionFault of invalid_scheduled_action_fault
    | `InvalidScheduleFault of invalid_schedule_fault
    | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
    | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_scheduled_action_message ->
    ( scheduled_action,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidScheduledActionFault of invalid_scheduled_action_fault
      | `InvalidScheduleFault of invalid_schedule_fault
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_scheduled_action_message ->
    ( scheduled_action Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidScheduledActionFault of invalid_scheduled_action_fault
      | `InvalidScheduleFault of invalid_schedule_fault
      | `ScheduledActionNotFoundFault of scheduled_action_not_found_fault
      | `ScheduledActionTypeUnsupportedFault of scheduled_action_type_unsupported_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a scheduled action. \n"]

module ModifySnapshotCopyRetentionPeriod : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidRetentionPeriodFault of invalid_retention_period_fault
    | `SnapshotCopyDisabledFault of snapshot_copy_disabled_fault
    | `UnauthorizedOperation of unauthorized_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_snapshot_copy_retention_period_message ->
    ( modify_snapshot_copy_retention_period_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `SnapshotCopyDisabledFault of snapshot_copy_disabled_fault
      | `UnauthorizedOperation of unauthorized_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_snapshot_copy_retention_period_message ->
    ( modify_snapshot_copy_retention_period_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidRetentionPeriodFault of invalid_retention_period_fault
      | `SnapshotCopyDisabledFault of snapshot_copy_disabled_fault
      | `UnauthorizedOperation of unauthorized_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the number of days to retain snapshots in the destination Amazon Web Services Region \
   after they are copied from the source Amazon Web Services Region. By default, this operation \
   only changes the retention period of copied automated snapshots. The retention periods for both \
   new and existing copied automated snapshots are updated with the new retention period. You can \
   set the manual option to change only the retention periods of copied manual snapshots. If you \
   set this option, only newly copied manual snapshots have the new retention period. \n"]

module ModifySnapshotSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidScheduleFault of invalid_schedule_fault
    | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
    | `SnapshotScheduleUpdateInProgressFault of snapshot_schedule_update_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_snapshot_schedule_message ->
    ( snapshot_schedule,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidScheduleFault of invalid_schedule_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `SnapshotScheduleUpdateInProgressFault of snapshot_schedule_update_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_snapshot_schedule_message ->
    ( snapshot_schedule Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidScheduleFault of invalid_schedule_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `SnapshotScheduleUpdateInProgressFault of snapshot_schedule_update_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a snapshot schedule. Any schedule associated with a cluster is modified asynchronously.\n"]

module ModifyUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidUsageLimitFault of invalid_usage_limit_fault
    | `UnsupportedOperationFault of unsupported_operation_fault
    | `UsageLimitNotFoundFault of usage_limit_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_usage_limit_message ->
    ( usage_limit,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidUsageLimitFault of invalid_usage_limit_fault
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitNotFoundFault of usage_limit_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_usage_limit_message ->
    ( usage_limit Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidUsageLimitFault of invalid_usage_limit_fault
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UsageLimitNotFoundFault of usage_limit_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a usage limit in a cluster. You can't modify the feature type or period of a usage \
   limit.\n"]

module PauseCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    pause_cluster_message ->
    ( pause_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    pause_cluster_message ->
    ( pause_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Pauses a cluster.\n"]

module PurchaseReservedNodeOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_node_offering_message ->
    ( purchase_reserved_node_offering_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_node_offering_message ->
    ( purchase_reserved_node_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `ReservedNodeQuotaExceededFault of reserved_node_quota_exceeded_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to purchase reserved nodes. Amazon Redshift offers a predefined set of reserved node \
   offerings. You can purchase one or more of the offerings. You can call the \
   [DescribeReservedNodeOfferings] API to obtain the available reserved node offerings. You can \
   call this API by providing a specific reserved node offering and the number of nodes you want \
   to reserve. \n\n\
  \  For more information about reserved node offerings, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/purchase-reserved-node-instance.html}Purchasing \
   Reserved Nodes} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConflictPolicyUpdateFault of conflict_policy_update_fault
    | `InvalidPolicyFault of invalid_policy_fault
    | `ResourceNotFoundFault of resource_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_message ->
    ( put_resource_policy_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictPolicyUpdateFault of conflict_policy_update_fault
      | `InvalidPolicyFault of invalid_policy_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_message ->
    ( put_resource_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConflictPolicyUpdateFault of conflict_policy_update_fault
      | `InvalidPolicyFault of invalid_policy_fault
      | `ResourceNotFoundFault of resource_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the resource policy for a specified resource.\n"]

module RebootCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_cluster_message ->
    ( reboot_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_cluster_message ->
    ( reboot_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots a cluster. This action is taken as soon as possible. It results in a momentary outage \
   to the cluster, during which the cluster status is set to [rebooting]. A cluster event is \
   created when the reboot is completed. Any pending cluster modifications (see [ModifyCluster]) \
   are applied at this reboot. For more information about managing clusters, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html}Amazon Redshift \
   Clusters} in the {i Amazon Redshift Cluster Management Guide}. \n"]

module RegisterNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidNamespaceFault of invalid_namespace_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_namespace_input_message ->
    ( register_namespace_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_namespace_input_message ->
    ( register_namespace_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidNamespaceFault of invalid_namespace_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a cluster or serverless namespace to the Amazon Web Services Glue Data Catalog.\n"]

module RejectDataShare : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_data_share_message ->
    ( data_share,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_data_share_message ->
    ( data_share Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidDataShareFault of invalid_data_share_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "From a datashare consumer account, rejects the specified datashare.\n"]

module ResetClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_cluster_parameter_group_message ->
    ( cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_cluster_parameter_group_message ->
    ( cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `InvalidClusterParameterGroupStateFault of invalid_cluster_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets one or more parameters of the specified parameter group to their default values and sets \
   the source values of the parameters to \"engine-default\". To reset the entire parameter group \
   specify the {i ResetAllParameters} parameter. For parameter changes to take effect you must \
   reboot any associated clusters. \n"]

module ResizeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `NumberOfNodesPerClusterLimitExceededFault of number_of_nodes_per_cluster_limit_exceeded_fault
    | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
    | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
    | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault
    | `UnsupportedOptionFault of unsupported_option_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resize_cluster_message ->
    ( resize_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UnsupportedOptionFault of unsupported_option_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resize_cluster_message ->
    ( resize_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault
      | `UnsupportedOptionFault of unsupported_option_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the size of the cluster. You can change the cluster's type, or change the number or \
   type of nodes. The default behavior is to use the elastic resize method. With an elastic \
   resize, your cluster is available for read and write operations more quickly than with the \
   classic resize method. \n\n\
  \ Elastic resize operations have the following restrictions:\n\
  \ \n\
  \  {ul\n\
  \        {-  You can only resize clusters of the following types:\n\
  \            \n\
  \             {ul\n\
  \                   {-  dc2.large\n\
  \                       \n\
  \                        }\n\
  \                   {-  dc2.8xlarge\n\
  \                       \n\
  \                        }\n\
  \                   {-  rg.xlarge\n\
  \                       \n\
  \                        }\n\
  \                   {-  rg.4xlarge\n\
  \                       \n\
  \                        }\n\
  \                   {-  ra3.large\n\
  \                       \n\
  \                        }\n\
  \                   {-  ra3.xlplus\n\
  \                       \n\
  \                        }\n\
  \                   {-  ra3.4xlarge\n\
  \                       \n\
  \                        }\n\
  \                   {-  ra3.16xlarge\n\
  \                       \n\
  \                        }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        {-  The type of nodes that you add must match the node type for the cluster.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module RestoreFromClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
    | `ClusterAlreadyExistsFault of cluster_already_exists_fault
    | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
    | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
    | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
    | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
    | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
    | `InvalidClusterTrackFault of invalid_cluster_track_fault
    | `InvalidElasticIpFault of invalid_elastic_ip_fault
    | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidTagFault of invalid_tag_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `NumberOfNodesPerClusterLimitExceededFault of number_of_nodes_per_cluster_limit_exceeded_fault
    | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
    | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
    | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
    | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
    | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
    | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
    | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
    | `TagLimitExceededFault of tag_limit_exceeded_fault
    | `UnauthorizedOperation of unauthorized_operation
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_cluster_snapshot_message ->
    ( restore_from_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_cluster_snapshot_message ->
    ( restore_from_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterParameterGroupNotFoundFault of cluster_parameter_group_not_found_fault
      | `ClusterQuotaExceededFault of cluster_quota_exceeded_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `ClusterSubnetGroupNotFoundFault of cluster_subnet_group_not_found_fault
      | `DependentServiceAccessDeniedFault of dependent_service_access_denied_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `DependentServiceUnavailableFault of dependent_service_unavailable_fault
      | `HsmClientCertificateNotFoundFault of hsm_client_certificate_not_found_fault
      | `HsmConfigurationNotFoundFault of hsm_configuration_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidClusterSubnetGroupStateFault of invalid_cluster_subnet_group_state_fault
      | `InvalidClusterTrackFault of invalid_cluster_track_fault
      | `InvalidElasticIpFault of invalid_elastic_ip_fault
      | `InvalidReservedNodeStateFault of invalid_reserved_node_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidTagFault of invalid_tag_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `Ipv6CidrBlockNotFoundFault of ipv6_cidr_block_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `NumberOfNodesPerClusterLimitExceededFault of
        number_of_nodes_per_cluster_limit_exceeded_fault
      | `NumberOfNodesQuotaExceededFault of number_of_nodes_quota_exceeded_fault
      | `RedshiftIdcApplicationNotExistsFault of redshift_idc_application_not_exists_fault
      | `ReservedNodeAlreadyExistsFault of reserved_node_already_exists_fault
      | `ReservedNodeAlreadyMigratedFault of reserved_node_already_migrated_fault
      | `ReservedNodeNotFoundFault of reserved_node_not_found_fault
      | `ReservedNodeOfferingNotFoundFault of reserved_node_offering_not_found_fault
      | `SnapshotScheduleNotFoundFault of snapshot_schedule_not_found_fault
      | `TagLimitExceededFault of tag_limit_exceeded_fault
      | `UnauthorizedOperation of unauthorized_operation
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cluster from a snapshot. By default, Amazon Redshift creates the resulting \
   cluster with the same configuration as the original cluster from which the snapshot was \
   created, except that the new cluster is created with the default cluster security and parameter \
   groups. After Amazon Redshift creates the cluster, you can use the [ModifyCluster] API to \
   associate a different security group and different parameter group with the restored cluster. \
   If you are using a DS node type, you can also choose to change to another DS node type of the \
   same size during restore.\n\n\
  \ If you restore a cluster into a VPC, you must provide a cluster subnet group where you want \
   the cluster restored.\n\
  \ \n\
  \  VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a subnet group for a provisioned cluster is in an account \
   with VPC BPA turned on, the following capabilities are blocked:\n\
  \  \n\
  \   {ul\n\
  \         {-  Creating a public cluster\n\
  \             \n\
  \              }\n\
  \         {-  Restoring a public cluster\n\
  \             \n\
  \              }\n\
  \         {-  Modifying a private cluster to be public\n\
  \             \n\
  \              }\n\
  \         {-  Adding a subnet with VPC BPA turned on to the subnet group when there's at least \
   one public cluster within the group\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   \n\
  \     For more information about working with snapshots, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html}Amazon Redshift \
   Snapshots} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \    "]

module RestoreTableFromClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `InProgressTableRestoreQuotaExceededFault of in_progress_table_restore_quota_exceeded_fault
    | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidTableRestoreArgumentFault of invalid_table_restore_argument_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_cluster_snapshot_message ->
    ( restore_table_from_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InProgressTableRestoreQuotaExceededFault of in_progress_table_restore_quota_exceeded_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTableRestoreArgumentFault of invalid_table_restore_argument_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_cluster_snapshot_message ->
    ( restore_table_from_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `InProgressTableRestoreQuotaExceededFault of in_progress_table_restore_quota_exceeded_fault
      | `InvalidClusterSnapshotStateFault of invalid_cluster_snapshot_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidTableRestoreArgumentFault of invalid_table_restore_argument_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new table from a table in an Amazon Redshift cluster snapshot. You must create the \
   new table within the Amazon Redshift cluster that the snapshot was taken from.\n\n\
  \ You cannot use [RestoreTableFromClusterSnapshot] to restore a table with the same name as an \
   existing table in an Amazon Redshift cluster. That is, you cannot overwrite an existing table \
   in a cluster with a restored table. If you want to replace your original table with a new, \
   restored table, then rename or drop your original table before you call \
   [RestoreTableFromClusterSnapshot]. When you have renamed your original table, then you can pass \
   the original name of the table as the [NewTableName] parameter value in the call to \
   [RestoreTableFromClusterSnapshot]. This way, you can replace the original table with the table \
   created from the snapshot.\n\
  \ \n\
  \  You can't use this operation to restore tables with \
   {{:https://docs.aws.amazon.com/redshift/latest/dg/t_Sorting_data.html#t_Sorting_data-interleaved}interleaved \
   sort keys}.\n\
  \  "]

module ResumeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_cluster_message ->
    ( resume_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_cluster_message ->
    ( resume_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Resumes a paused cluster.\n"]

module RevokeClusterSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_cluster_security_group_ingress_message ->
    ( revoke_cluster_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_cluster_security_group_ingress_message ->
    ( revoke_cluster_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `ClusterSecurityGroupNotFoundFault of cluster_security_group_not_found_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes an ingress rule in an Amazon Redshift security group for a previously authorized IP \
   range or Amazon EC2 security group. To add an ingress rule, see \
   [AuthorizeClusterSecurityGroupIngress]. For information about managing security groups, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-security-groups.html}Amazon \
   Redshift Cluster Security Groups} in the {i Amazon Redshift Cluster Management Guide}. \n"]

module RevokeEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `EndpointAuthorizationNotFoundFault of endpoint_authorization_not_found_fault
    | `EndpointNotFoundFault of endpoint_not_found_fault
    | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
    | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidEndpointStateFault of invalid_endpoint_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_endpoint_access_message ->
    ( endpoint_authorization,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointAuthorizationNotFoundFault of endpoint_authorization_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_endpoint_access_message ->
    ( endpoint_authorization Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `EndpointAuthorizationNotFoundFault of endpoint_authorization_not_found_fault
      | `EndpointNotFoundFault of endpoint_not_found_fault
      | `InvalidAuthorizationStateFault of invalid_authorization_state_fault
      | `InvalidClusterSecurityGroupStateFault of invalid_cluster_security_group_state_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidEndpointStateFault of invalid_endpoint_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Revokes access to a cluster.\n"]

module RevokeSnapshotAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_snapshot_access_message ->
    ( revoke_snapshot_access_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_snapshot_access_message ->
    ( revoke_snapshot_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessToSnapshotDeniedFault of access_to_snapshot_denied_fault
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `ClusterSnapshotNotFoundFault of cluster_snapshot_not_found_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the ability of the specified Amazon Web Services account to restore the specified \
   snapshot. If the account is currently restoring the snapshot, the restore will run to \
   completion.\n\n\
  \  For more information about working with snapshots, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-snapshots.html}Amazon Redshift \
   Snapshots} in the {i Amazon Redshift Cluster Management Guide}.\n\
  \ "]

module RotateEncryptionKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rotate_encryption_key_message ->
    ( rotate_encryption_key_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rotate_encryption_key_message ->
    ( rotate_encryption_key_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `DependentServiceRequestThrottlingFault of dependent_service_request_throttling_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rotates the encryption keys for a cluster.\n"]

module UpdatePartnerStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `PartnerNotFoundFault of partner_not_found_fault
    | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
    | `UnsupportedOperationFault of unsupported_operation_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_partner_status_input_message ->
    ( partner_integration_output_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_partner_status_input_message ->
    ( partner_integration_output_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `PartnerNotFoundFault of partner_not_found_fault
      | `UnauthorizedPartnerIntegrationFault of unauthorized_partner_integration_fault
      | `UnsupportedOperationFault of unsupported_operation_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the status of a partner integration.\n"]
