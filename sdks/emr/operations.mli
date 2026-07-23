open Types

module GetAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_auto_termination_policy_input ->
    (get_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_auto_termination_policy_input ->
    ( get_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the auto-termination policy for an Amazon EMR cluster.\n"]

module GetBlockPublicAccessConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_block_public_access_configuration_input ->
    ( get_block_public_access_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_block_public_access_configuration_input ->
    ( get_block_public_access_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Amazon EMR block public access configuration for your Amazon Web Services account \
   in the current Region. For more information see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html}Configure \
   Block Public Access for Amazon EMR} in the {i Amazon EMR Management Guide}.\n"]

module GetClusterSessionCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_session_credentials_input ->
    ( get_cluster_session_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_session_credentials_input ->
    ( get_cluster_session_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides temporary, HTTP basic credentials that are associated with a given runtime IAM role \
   and used by a cluster with fine-grained access control activated. You can use these credentials \
   to connect to cluster endpoints that support username and password authentication.\n"]

module GetManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_managed_scaling_policy_input ->
    (get_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_managed_scaling_policy_input ->
    ( get_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetches the attached managed scaling policy for an Amazon EMR cluster. \n"]

module GetOnClusterAppUIPresignedURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_on_cluster_app_ui_presigned_url_input ->
    ( get_on_cluster_app_ui_presigned_url_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_on_cluster_app_ui_presigned_url_input ->
    ( get_on_cluster_app_ui_presigned_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The presigned URL properties for the cluster's application user interface.\n"]

module GetPersistentAppUIPresignedURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_persistent_app_ui_presigned_url_input ->
    ( get_persistent_app_ui_presigned_url_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_persistent_app_ui_presigned_url_input ->
    ( get_persistent_app_ui_presigned_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The presigned URL properties for the cluster's application user interface.\n"]

module GetSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_input ->
    ( get_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_input ->
    ( get_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns detailed information about a session.\n"]

module GetSessionEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_input ->
    ( get_session_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_input ->
    ( get_session_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Spark Connect endpoint URL and a time-limited authentication token for the \
   specified session. Use the endpoint and token to connect a PySpark client to the session. Call \
   this operation again when the token expires to obtain a new one.\n"]

module GetStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_studio_session_mapping_input ->
    ( get_studio_session_mapping_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_studio_session_mapping_input ->
    ( get_studio_session_mapping_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches mapping details for the specified Amazon EMR Studio and identity (user or group).\n"]

module ListBootstrapActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bootstrap_actions_input ->
    ( list_bootstrap_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bootstrap_actions_input ->
    ( list_bootstrap_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information about the bootstrap actions associated with a cluster.\n"]

module ListClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_input ->
    ( list_clusters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_input ->
    ( list_clusters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the status of all clusters visible to this Amazon Web Services account. Allows you to \
   filter the list of clusters based on certain criteria; for example, filtering by cluster \
   creation date and time or by status. This call returns a maximum of 50 clusters in unsorted \
   order per call, but returns a marker to track the paging of the cluster list across multiple \
   ListClusters calls.\n"]

module ListInstanceFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_fleets_input ->
    ( list_instance_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_fleets_input ->
    ( list_instance_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all available details about the instance fleets in a cluster.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

module ListInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_groups_input ->
    ( list_instance_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_groups_input ->
    ( list_instance_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides all available details about the instance groups in a cluster.\n"]

module ListInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instances_input ->
    ( list_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instances_input ->
    ( list_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information for all active Amazon EC2 instances and Amazon EC2 instances terminated in \
   the last 30 days, up to a maximum of 2,000. Amazon EC2 instances in any of the following states \
   are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.\n"]

module ListNotebookExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_executions_input ->
    ( list_notebook_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_executions_input ->
    ( list_notebook_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides summaries of all notebook executions. You can filter the list based on multiple \
   criteria such as status, time range, and editor id. Returns a maximum of 50 notebook executions \
   and a marker to track the paging of a longer notebook execution list across multiple \
   [ListNotebookExecutions] calls.\n"]

module ListReleaseLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_release_labels_input ->
    ( list_release_labels_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_release_labels_input ->
    ( list_release_labels_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves release labels of Amazon EMR services in the Region where the API is called.\n"]

module ListSecurityConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_security_configurations_input ->
    ( list_security_configurations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_security_configurations_input ->
    ( list_security_configurations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the security configurations visible to this account, providing their creation dates \
   and times, and their names. This call returns a maximum of 50 clusters per call, but returns a \
   marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.\n"]

module ListSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_input ->
    ( list_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_input ->
    ( list_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the sessions on a cluster. You can filter the results by session state. Newer sessions \
   are returned first.\n"]

module ListSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_steps_input ->
    ( list_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_steps_input ->
    ( list_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of steps for the cluster in reverse order unless you specify [stepIds] with the \
   request or filter by [StepStates]. You can specify a maximum of 10 [stepIDs]. The CLI \
   automatically paginates results to return a list greater than 50 steps. To return more than 50 \
   steps using the CLI, specify a [Marker], which is a pagination token that indicates the next \
   set of steps to retrieve.\n"]

module ListStudios : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_studios_input ->
    ( list_studios_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_studios_input ->
    ( list_studios_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all Amazon EMR Studios associated with the Amazon Web Services account. The \
   list includes details such as ID, Studio Access URL, and creation time for each Studio.\n"]

module ListStudioSessionMappings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_studio_session_mappings_input ->
    ( list_studio_session_mappings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_studio_session_mappings_input ->
    ( list_studio_session_mappings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all user or group session mappings for the Amazon EMR Studio specified by \
   [StudioId].\n"]

module ListSupportedInstanceTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_supported_instance_types_input ->
    ( list_supported_instance_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_supported_instance_types_input ->
    ( list_supported_instance_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A list of the instance types that Amazon EMR supports. You can filter the list by Amazon Web \
   Services Region and Amazon EMR release. \n"]

module ModifyCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_input ->
    ( modify_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_input ->
    ( modify_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the number of steps that can be executed concurrently for the cluster specified using \
   ClusterID.\n"]

module ModifyInstanceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the target On-Demand and target Spot capacities for the instance fleet with the \
   specified InstanceFleetID within the cluster specified using ClusterID. The call either \
   succeeds or fails atomically.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

module ModifyInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_groups_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_groups_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance \
   group. The input parameters include the new target instance count for the group and the \
   instance group ID. The call will either succeed or fail atomically.\n"]

module PutAutoScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_auto_scaling_policy_input ->
    (put_auto_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_auto_scaling_policy_input ->
    ( put_auto_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an automatic scaling policy for a core instance group or task instance group \
   in an Amazon EMR cluster. The automatic scaling policy defines how an instance group \
   dynamically adds and terminates Amazon EC2 instances in response to the value of a CloudWatch \
   metric.\n"]

module PutAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_auto_termination_policy_input ->
    (put_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_auto_termination_policy_input ->
    ( put_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Auto-termination is supported in Amazon EMR releases 5.30.0 and 6.1.0 and later. For more \
   information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-auto-termination-policy.html}Using \
   an auto-termination policy}.\n\
  \ \n\
  \   Creates or updates an auto-termination policy for an Amazon EMR cluster. An auto-termination \
   policy defines the amount of idle time in seconds after which a cluster automatically \
   terminates. For alternative cluster termination options, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html}Control \
   cluster termination}.\n\
  \   "]

module PutBlockPublicAccessConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_block_public_access_configuration_input ->
    ( put_block_public_access_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_block_public_access_configuration_input ->
    ( put_block_public_access_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an Amazon EMR block public access configuration for your Amazon Web Services \
   account in the current Region. For more information see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html}Configure \
   Block Public Access for Amazon EMR} in the {i Amazon EMR Management Guide}.\n"]

module PutManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_managed_scaling_policy_input ->
    (put_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_managed_scaling_policy_input ->
    ( put_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling \
   policy defines the limits for resources, such as Amazon EC2 instances that can be added or \
   terminated from a cluster. The policy only applies to the core and task nodes. The master node \
   cannot be scaled after initial configuration. \n"]

module RemoveAutoScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_scaling_policy_input ->
    (remove_auto_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_scaling_policy_input ->
    ( remove_auto_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an automatic scaling policy from a specified instance group within an Amazon EMR cluster.\n"]

module RemoveAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_termination_policy_input ->
    (remove_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_termination_policy_input ->
    ( remove_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes an auto-termination policy from an Amazon EMR cluster.\n"]

module RemoveManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_managed_scaling_policy_input ->
    (remove_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_managed_scaling_policy_input ->
    ( remove_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes a managed scaling policy from a specified Amazon EMR cluster. \n"]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from an Amazon EMR resource, such as a cluster or Amazon EMR Studio. Tags make it \
   easier to associate resources in various ways, such as grouping clusters to track your Amazon \
   EMR resource allocation costs. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag Clusters}. \n\n\
  \ The following example removes the stack tag with value Prod from a cluster:\n\
  \ "]

module RunJobFlow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    run_job_flow_input ->
    ( run_job_flow_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    run_job_flow_input ->
    ( run_job_flow_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps \
   specified. After the steps complete, the cluster stops and the HDFS partition is lost. To \
   prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If \
   the [JobFlowInstancesConfig] [KeepJobFlowAliveWhenNoSteps] parameter is set to [TRUE], the \
   cluster transitions to the WAITING state rather than shutting down after the steps have \
   completed. \n\n\
  \ For additional protection, you can set the [JobFlowInstancesConfig] [TerminationProtected] \
   parameter to [TRUE] to lock the cluster and prevent it from being terminated by API call, user \
   intervention, or in the event of a job flow error.\n\
  \ \n\
  \  A maximum of 256 steps are allowed in each job flow.\n\
  \  \n\
  \   If your cluster is long-running (such as a Hive data warehouse) or complex, you may require \
   more than 256 steps to process your data. You can bypass the 256-step limitation in various \
   ways, including using the SSH shell to connect to the master node and submitting queries \
   directly to the software running on the master node, such as Hive and Hadoop.\n\
  \   \n\
  \    For long-running clusters, we recommend that you periodically store your results.\n\
  \    \n\
  \      The instance fleets configuration is available only in Amazon EMR releases 4.8.0 and \
   later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters \
   or InstanceGroups parameters, but not both.\n\
  \      \n\
  \       "]

module SetKeepJobFlowAliveWhenNoSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_keep_job_flow_alive_when_no_steps_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_keep_job_flow_alive_when_no_steps_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use the [SetKeepJobFlowAliveWhenNoSteps] to configure a cluster (job flow) to terminate \
   after the step execution, i.e., all your steps are executed. If you want a transient cluster \
   that shuts down after the last of the current executing steps are completed, you can configure \
   [SetKeepJobFlowAliveWhenNoSteps] to false. If you want a long running cluster, configure \
   [SetKeepJobFlowAliveWhenNoSteps] to true.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html}Managing \
   Cluster Termination} in the {i Amazon EMR Management Guide}.\n\
  \ "]

module SetTerminationProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_termination_protection_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_termination_protection_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "SetTerminationProtection locks a cluster (job flow) so the Amazon EC2 instances in the cluster \
   cannot be terminated by user intervention, an API call, or in the event of a job-flow error. \
   The cluster still terminates upon successful completion of the job flow. Calling \
   [SetTerminationProtection] on a cluster is similar to calling the Amazon EC2 \
   [DisableAPITermination] API on all Amazon EC2 instances in a cluster.\n\n\
  \  [SetTerminationProtection] is used to prevent accidental termination of a cluster and to \
   ensure that in the event of an error, the instances persist so that you can recover any data \
   stored in their ephemeral instance storage.\n\
  \ \n\
  \   To terminate a cluster that has been locked by setting [SetTerminationProtection] to [true], \
   you must first unlock the job flow by a subsequent call to [SetTerminationProtection] in which \
   you set the value to [false]. \n\
  \  \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html}Managing \
   Cluster Termination} in the {i Amazon EMR Management Guide}. \n\
  \   "]

module SetUnhealthyNodeReplacement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_unhealthy_node_replacement_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_unhealthy_node_replacement_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specify whether to enable unhealthy node replacement, which lets Amazon EMR gracefully replace \
   core nodes on a cluster if any nodes become unhealthy. For example, a node becomes unhealthy if \
   disk usage is above 90%. If unhealthy node replacement is on and [TerminationProtected] are \
   off, Amazon EMR immediately terminates the unhealthy core nodes. To use unhealthy node \
   replacement and retain unhealthy core nodes, use to turn on termination protection. In such \
   cases, Amazon EMR adds the unhealthy nodes to a denylist, reducing job interruptions and \
   failures.\n\n\
  \ If unhealthy node replacement is on, Amazon EMR notifies YARN and other applications on the \
   cluster to stop scheduling tasks with these nodes, moves the data, and then terminates the \
   nodes.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-node-replacement.html}graceful \
   node replacement} in the {i Amazon EMR Management Guide}.\n\
  \  "]

module SetVisibleToAllUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_visible_to_all_users_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_visible_to_all_users_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The SetVisibleToAllUsers parameter is no longer supported. Your cluster may be visible to all \
   users in your account. To restrict cluster access using an IAM policy, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-access-IAM.html}Identity and \
   Access Management for Amazon EMR}. \n\
  \ \n\
  \   Sets the [Cluster$VisibleToAllUsers] value for an Amazon EMR cluster. When [true], IAM \
   principals in the Amazon Web Services account can perform Amazon EMR cluster actions that their \
   IAM policies allow. When [false], only the IAM principal that created the cluster and the \
   Amazon Web Services account root user can perform Amazon EMR actions on the cluster, regardless \
   of IAM permissions policies attached to other IAM principals.\n\
  \   \n\
  \    This action works on running clusters. When you create a cluster, use the \
   [RunJobFlowInput$VisibleToAllUsers] parameter.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/security_IAM_emr-with-IAM.html#security_set_visible_to_all_users}Understanding \
   the Amazon EMR Cluster VisibleToAllUsers Setting} in the {i Amazon EMR Management Guide}.\n\
  \     "]

module StartNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_execution_input ->
    ( start_notebook_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_execution_input ->
    ( start_notebook_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a notebook execution.\n"]

module StartSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_session_input ->
    ( start_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_session_input ->
    ( start_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates and starts a new Spark Connect session on the specified cluster. The cluster must be in \
   the [RUNNING] or [WAITING] state and have sessions enabled. This operation is supported in \
   Amazon EMR Spark 8.0.0 and later.\n"]

module StopNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_execution_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_execution_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a notebook execution.\n"]

module TerminateJobFlows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_job_flows_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_job_flows_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any \
   step not yet completed is canceled and the Amazon EC2 instances on which the cluster is running \
   are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was \
   specified when the cluster was created.\n\n\
  \ The maximum number of clusters allowed is 10. The call to [TerminateJobFlows] is asynchronous. \
   Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to \
   completely terminate and release allocated resources, such as Amazon EC2 instances.\n\
  \ "]

module TerminateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_input ->
    ( terminate_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_input ->
    ( terminate_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates an active session. After you call this operation, the session enters the \
   [TERMINATING] state and then transitions to [TERMINATED].\n"]

module UpdateStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an Amazon EMR Studio configuration, including attributes such as name, description, and \
   subnets.\n"]

module UpdateStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the session policy attached to the user or group for the specified Amazon EMR Studio.\n"]

module DescribeStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_input ->
    ( describe_studio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_input ->
    ( describe_studio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details for the specified Amazon EMR Studio including ID, Name, VPC, Studio access URL, \
   and so on.\n"]

module DescribeStep : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_step_input ->
    ( describe_step_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_step_input ->
    ( describe_step_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides more detail about the cluster step.\n"]

module DescribeSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_security_configuration_input ->
    ( describe_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_security_configuration_input ->
    ( describe_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the details of a security configuration by returning the configuration JSON.\n"]

module DescribeReleaseLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_release_label_input ->
    ( describe_release_label_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_release_label_input ->
    ( describe_release_label_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides Amazon EMR release label details, such as the releases available the Region where the \
   API request is run, and the available applications for a specific Amazon EMR release label. Can \
   also list Amazon EMR releases that support a specified version of Spark.\n"]

module DescribePersistentAppUI : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_persistent_app_ui_input ->
    ( describe_persistent_app_ui_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_persistent_app_ui_input ->
    ( describe_persistent_app_ui_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a persistent application user interface.\n"]

module DescribeNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_execution_input ->
    ( describe_notebook_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_execution_input ->
    ( describe_notebook_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides details of a notebook execution.\n"]

module DescribeJobFlows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_job_flows_input ->
    ( describe_job_flows_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_job_flows_input ->
    ( describe_job_flows_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is no longer supported and will eventually be removed. We recommend you use \
   [ListClusters], [DescribeCluster], [ListSteps], [ListInstanceGroups] and [ListBootstrapActions] \
   instead.\n\n\
  \ DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The \
   parameters can include a list of job flow IDs, job flow states, and restrictions on job flow \
   creation date and time.\n\
  \ \n\
  \  Regardless of supplied parameters, only job flows created within the last two months are \
   returned.\n\
  \  \n\
  \   If no parameters are supplied, then job flows matching either of the following criteria are \
   returned:\n\
  \   \n\
  \    {ul\n\
  \          {-  Job flows created and completed in the last two weeks\n\
  \              \n\
  \               }\n\
  \          {-   Job flows created within the last two months that are in one of the following \
   states: [RUNNING], [WAITING], [SHUTTING_DOWN], [STARTING] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Amazon EMR can return a maximum of 512 job flow descriptions.\n\
  \   "]

module DescribeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_input ->
    ( describe_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_input ->
    ( describe_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides cluster-level details including status, hardware and software configuration, VPC \
   settings, and so on.\n"]

module DeleteStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a user or group from an Amazon EMR Studio.\n"]

module DeleteStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes an Amazon EMR Studio from the Studio metadata store.\n"]

module DeleteSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_input ->
    ( delete_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_input ->
    ( delete_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a security configuration.\n"]

module CreateStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Maps a user or group to the Amazon EMR Studio specified by [StudioId], and applies a session \
   policy to refine Studio permissions for that user or group. Use [CreateStudioSessionMapping] to \
   assign users to a Studio when you use IAM Identity Center authentication. For instructions on \
   how to assign users to a Studio when you use IAM authentication, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-manage-users.html#emr-studio-assign-users-groups}Assign \
   a user or group to your EMR Studio}.\n"]

module CreateStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_studio_input ->
    ( create_studio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_studio_input ->
    ( create_studio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Amazon EMR Studio.\n"]

module CreateSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_input ->
    ( create_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_input ->
    ( create_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a security configuration, which is stored in the service and can be specified when a \
   cluster is created.\n"]

module CreatePersistentAppUI : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_persistent_app_ui_input ->
    ( create_persistent_app_ui_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_persistent_app_ui_input ->
    ( create_persistent_app_ui_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a persistent application user interface.\n"]

module CancelSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_steps_input ->
    ( cancel_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_steps_input ->
    ( cancel_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions \
   4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each \
   CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee that a \
   step will be canceled, even if the request is successfully submitted. When you use Amazon EMR \
   releases 5.28.0 and later, you can cancel steps that are in a [PENDING] or [RUNNING] state. In \
   earlier versions of Amazon EMR, you can only cancel steps that are in a [PENDING] state. \n"]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to an Amazon EMR resource, such as a cluster or an Amazon EMR Studio. Tags make it \
   easier to associate resources in various ways, such as grouping clusters to track your Amazon \
   EMR resource allocation costs. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag Clusters}. \n"]

module AddJobFlowSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_job_flow_steps_input ->
    ( add_job_flow_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_job_flow_steps_input ->
    ( add_job_flow_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each \
   job flow.\n\n\
  \ If your cluster is long-running (such as a Hive data warehouse) or complex, you may require \
   more than 256 steps to process your data. You can bypass the 256-step limitation in various \
   ways, including using SSH to connect to the master node and submitting queries directly to the \
   software running on the master node, such as Hive and Hadoop.\n\
  \ \n\
  \  A step specifies the location of a JAR file stored either on the master node of the cluster \
   or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. \
   The main class can be specified either in the manifest of the JAR or by using the MainFunction \
   parameter of the step.\n\
  \  \n\
  \   Amazon EMR executes each step in the order listed. For a step to be considered complete, the \
   main function must exit with a zero exit code and all Hadoop jobs started while the step was \
   running must have completed and run successfully.\n\
  \   \n\
  \    You can only add steps to a cluster that is in one of the following states: STARTING, \
   BOOTSTRAPPING, RUNNING, or WAITING.\n\
  \    \n\
  \      The string values passed into [HadoopJarStep] object cannot exceed a total of 10240 \
   characters.\n\
  \      \n\
  \       "]

module AddInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_instance_groups_input ->
    ( add_instance_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_instance_groups_input ->
    ( add_instance_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds one or more instance groups to a running cluster.\n"]

module AddInstanceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_instance_fleet_input ->
    ( add_instance_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_instance_fleet_input ->
    ( add_instance_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an instance fleet to a running cluster.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x.\n\
  \  \n\
  \   "]
