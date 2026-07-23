(** DAX client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:string_ ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet

val make_subnet_group :
  ?subnet_group_name:string_ ->
  ?description:string_ ->
  ?vpc_id:string_ ->
  ?subnets:subnet_list ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet_group

val make_update_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> update_subnet_group_response

val make_update_subnet_group_request :
  ?description:string_ ->
  ?subnet_ids:subnet_identifier_list ->
  subnet_group_name:string_ ->
  unit ->
  update_subnet_group_request

val make_parameter_group :
  ?parameter_group_name:string_ -> ?description:string_ -> unit -> parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_name:string_ -> ?parameter_value:string_ -> unit -> parameter_name_value

val make_update_parameter_group_request :
  parameter_group_name:string_ ->
  parameter_name_values:parameter_name_value_list ->
  unit ->
  update_parameter_group_request

val make_sse_description : ?status:sse_status -> unit -> sse_description

val make_parameter_group_status :
  ?parameter_group_name:string_ ->
  ?parameter_apply_status:string_ ->
  ?node_ids_to_reboot:node_identifier_list ->
  unit ->
  parameter_group_status

val make_security_group_membership :
  ?security_group_identifier:string_ -> ?status:string_ -> unit -> security_group_membership

val make_notification_configuration :
  ?topic_arn:string_ -> ?topic_status:string_ -> unit -> notification_configuration

val make_endpoint : ?address:string_ -> ?port:integer -> ?ur_l:string_ -> unit -> endpoint

val make_node :
  ?node_id:string_ ->
  ?endpoint:endpoint ->
  ?node_create_time:t_stamp ->
  ?availability_zone:string_ ->
  ?node_status:string_ ->
  ?parameter_group_status:string_ ->
  unit ->
  node

val make_cluster :
  ?cluster_name:string_ ->
  ?description:string_ ->
  ?cluster_arn:string_ ->
  ?total_nodes:integer_optional ->
  ?active_nodes:integer_optional ->
  ?node_type:string_ ->
  ?status:string_ ->
  ?cluster_discovery_endpoint:endpoint ->
  ?node_ids_to_remove:node_identifier_list ->
  ?nodes:node_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_configuration:notification_configuration ->
  ?subnet_group:string_ ->
  ?security_groups:security_group_membership_list ->
  ?iam_role_arn:string_ ->
  ?parameter_group:parameter_group_status ->
  ?sse_description:sse_description ->
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?network_type:network_type ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_cluster_request :
  ?description:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?notification_topic_status:string_ ->
  ?parameter_group_name:string_ ->
  ?security_group_ids:security_group_identifier_list ->
  cluster_name:string_ ->
  unit ->
  update_cluster_request

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag
val make_untag_resource_response : ?tags:tag_list -> unit -> untag_resource_response

val make_untag_resource_request :
  resource_name:string_ -> tag_keys:key_list -> unit -> untag_resource_request

val make_tag_resource_response : ?tags:tag_list -> unit -> tag_resource_response

val make_tag_resource_request :
  resource_name:string_ -> tags:tag_list -> unit -> tag_resource_request

val make_reboot_node_response : ?cluster:cluster -> unit -> reboot_node_response

val make_reboot_node_request :
  cluster_name:string_ -> node_id:string_ -> unit -> reboot_node_request

val make_list_tags_response : ?tags:tag_list -> ?next_token:string_ -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:string_ -> resource_name:string_ -> unit -> list_tags_request

val make_increase_replication_factor_response :
  ?cluster:cluster -> unit -> increase_replication_factor_response

val make_increase_replication_factor_request :
  ?availability_zones:availability_zone_list ->
  cluster_name:string_ ->
  new_replication_factor:integer ->
  unit ->
  increase_replication_factor_request

val make_describe_subnet_groups_response :
  ?next_token:string_ -> ?subnet_groups:subnet_group_list -> unit -> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?subnet_group_names:subnet_group_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_subnet_groups_request

val make_node_type_specific_value :
  ?node_type:string_ -> ?value:string_ -> unit -> node_type_specific_value

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_type:parameter_type ->
  ?parameter_value:string_ ->
  ?node_type_specific_values:node_type_specific_value_list ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:is_modifiable ->
  ?change_type:change_type ->
  unit ->
  parameter

val make_describe_parameters_response :
  ?next_token:string_ -> ?parameters:parameter_list -> unit -> describe_parameters_response

val make_describe_parameters_request :
  ?source:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  parameter_group_name:string_ ->
  unit ->
  describe_parameters_request

val make_describe_parameter_groups_response :
  ?next_token:string_ ->
  ?parameter_groups:parameter_group_list ->
  unit ->
  describe_parameter_groups_response

val make_describe_parameter_groups_request :
  ?parameter_group_names:parameter_group_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_parameter_groups_request

val make_event :
  ?source_name:string_ ->
  ?source_type:source_type ->
  ?message:string_ ->
  ?date:t_stamp ->
  unit ->
  event

val make_describe_events_response :
  ?next_token:string_ -> ?events:event_list -> unit -> describe_events_response

val make_describe_events_request :
  ?source_name:string_ ->
  ?source_type:source_type ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?duration:integer_optional ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_events_request

val make_describe_default_parameters_response :
  ?next_token:string_ -> ?parameters:parameter_list -> unit -> describe_default_parameters_response

val make_describe_default_parameters_request :
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_default_parameters_request

val make_describe_clusters_response :
  ?next_token:string_ -> ?clusters:cluster_list -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?cluster_names:cluster_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_clusters_request

val make_delete_subnet_group_response :
  ?deletion_message:string_ -> unit -> delete_subnet_group_response

val make_delete_subnet_group_request :
  subnet_group_name:string_ -> unit -> delete_subnet_group_request

val make_delete_parameter_group_response :
  ?deletion_message:string_ -> unit -> delete_parameter_group_response

val make_delete_parameter_group_request :
  parameter_group_name:string_ -> unit -> delete_parameter_group_request

val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster_name:string_ -> unit -> delete_cluster_request

val make_decrease_replication_factor_response :
  ?cluster:cluster -> unit -> decrease_replication_factor_response

val make_decrease_replication_factor_request :
  ?availability_zones:availability_zone_list ->
  ?node_ids_to_remove:node_identifier_list ->
  cluster_name:string_ ->
  new_replication_factor:integer ->
  unit ->
  decrease_replication_factor_request

val make_create_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> create_subnet_group_response

val make_create_subnet_group_request :
  ?description:string_ ->
  subnet_group_name:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_subnet_group_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> create_parameter_group_response

val make_create_parameter_group_request :
  ?description:string_ -> parameter_group_name:string_ -> unit -> create_parameter_group_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response
val make_sse_specification : enabled:sse_enabled -> unit -> sse_specification

val make_create_cluster_request :
  ?description:string_ ->
  ?availability_zones:availability_zone_list ->
  ?subnet_group_name:string_ ->
  ?security_group_ids:security_group_identifier_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?parameter_group_name:string_ ->
  ?tags:tag_list ->
  ?sse_specification:sse_specification ->
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?network_type:network_type ->
  cluster_name:string_ ->
  node_type:string_ ->
  replication_factor:integer ->
  iam_role_arn:string_ ->
  unit ->
  create_cluster_request
(** {1:operations Operations} *)

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterAlreadyExistsFault of cluster_already_exists_fault
    | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterAlreadyExistsFault of cluster_already_exists_fault
      | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a DAX cluster. All nodes in the cluster run the same DAX caching software.\n"]

module CreateParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupAlreadyExistsFault of parameter_group_already_exists_fault
    | `ParameterGroupQuotaExceededFault of parameter_group_quota_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
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
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
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
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new parameter group. A parameter group is a collection of parameters that you apply \
   to all of the nodes in a DAX cluster.\n"]

module CreateSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidSubnet of invalid_subnet
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `SubnetGroupAlreadyExistsFault of subnet_group_already_exists_fault
    | `SubnetGroupQuotaExceededFault of subnet_group_quota_exceeded_fault
    | `SubnetNotAllowedFault of subnet_not_allowed_fault
    | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ] ->
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
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ] )
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
      | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new subnet group.\n"]

module DecreaseReplicationFactor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NodeNotFoundFault of node_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decrease_replication_factor_request ->
    ( decrease_replication_factor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NodeNotFoundFault of node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    decrease_replication_factor_request ->
    ( decrease_replication_factor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NodeNotFoundFault of node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more nodes from a DAX cluster.\n\n\
  \  You cannot use [DecreaseReplicationFactor] to remove the last node in a DAX cluster. If you \
   need to do this, use [DeleteCluster] instead.\n\
  \  \n\
  \   "]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
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
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
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
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously provisioned DAX cluster. {i DeleteCluster} deletes all associated nodes, \
   node endpoints and the DAX cluster itself. When you receive a successful response from this \
   action, DAX immediately begins deleting the cluster; you cannot cancel or revert this action.\n"]

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
   with any DAX clusters.\n"]

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
  "Deletes a subnet group.\n\n\
  \  You cannot delete a subnet group if it is associated with any DAX clusters.\n\
  \  \n\
  \   "]

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
  "Returns information about all provisioned DAX clusters if no cluster identifier is specified, \
   or about a specific DAX cluster if a cluster identifier is supplied.\n\n\
  \ If the cluster is in the CREATING state, only cluster level information will be displayed \
   until all of the nodes are successfully provisioned.\n\
  \ \n\
  \  If the cluster is in the DELETING state, only cluster level information will be displayed.\n\
  \  \n\
  \   If nodes are currently being added to the DAX cluster, node endpoint information and \
   creation time for the additional nodes will not be displayed until they are completely \
   provisioned. When the DAX cluster state is {i available}, the cluster is ready for use.\n\
  \   \n\
  \    If nodes are currently being removed from the DAX cluster, no endpoint information for the \
   removed nodes is displayed.\n\
  \    "]

module DescribeDefaultParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_default_parameters_request ->
    ( describe_default_parameters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_default_parameters_request ->
    ( describe_default_parameters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the default system parameter information for the DAX caching software.\n"]

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
  "Returns events related to DAX clusters and parameter groups. You can obtain events specific to \
   a particular DAX cluster or parameter group by providing the name as a parameter.\n\n\
  \ By default, only the events occurring within the last 24 hours are returned; however, you can \
   retrieve up to 14 days' worth of events if necessary.\n\
  \ "]

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
   list will contain only the descriptions for that group.\n"]

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
  "Returns a list of subnet group descriptions. If a subnet group name is specified, the list will \
   contain only the description of that group.\n"]

module IncreaseReplicationFactor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
    | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    increase_replication_factor_request ->
    ( increase_replication_factor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    increase_replication_factor_request ->
    ( increase_replication_factor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
      | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds one or more nodes to a DAX cluster.\n"]

module ListTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all of the tags for a DAX cluster. You can call [ListTags] up to 10 times per second, per \
   account.\n"]

module RebootNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NodeNotFoundFault of node_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_node_request ->
    ( reboot_node_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NodeNotFoundFault of node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_node_request ->
    ( reboot_node_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NodeNotFoundFault of node_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots a single node of a DAX cluster. The reboot action takes place as soon as possible. \
   During the reboot, the node status is set to REBOOTING.\n\n\
  \   [RebootNode] restarts the DAX engine process and does not remove the contents of the cache.\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a set of tags with a DAX resource. You can call [TagResource] up to 5 times per \
   second, per account. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidARNFault of invalid_arn_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
    | `TagNotFoundFault of tag_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidARNFault of invalid_arn_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
      | `TagNotFoundFault of tag_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association of tags from a DAX resource. You can call [UntagResource] up to 5 times \
   per second, per account. \n"]

module UpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClusterNotFoundFault of cluster_not_found_fault
    | `InvalidClusterStateFault of invalid_cluster_state_fault
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
    | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClusterNotFoundFault of cluster_not_found_fault
      | `InvalidClusterStateFault of invalid_cluster_state_fault
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
      | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings for a DAX cluster. You can use this action to change one or more cluster \
   configuration parameters by specifying the parameters and the new values.\n"]

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
  "Modifies the parameters of a parameter group. You can modify up to 20 parameters in a single \
   request by submitting a list parameter name and value pairs.\n"]

(** {1:Serialization and Deserialization} *)
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
[@@ocaml.doc "Modifies an existing subnet group.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
