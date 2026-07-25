(** PCS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:arn -> tags:request_tag_map -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_accounting :
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  mode:accounting_mode ->
  unit ->
  accounting

val make_accounting_request :
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  mode:accounting_mode ->
  unit ->
  accounting_request

val make_cgroup_custom_setting :
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cgroup_custom_setting

val make_error_info :
  ?code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  error_info

val make_endpoint :
  ?public_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv6_address:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:endpoint_type ->
  private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  port:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  endpoint

val make_networking :
  ?subnet_ids:subnet_id_list ->
  ?security_group_ids:security_group_id_list ->
  ?network_type:network_type ->
  unit ->
  networking

val make_slurm_rest : mode:slurm_rest_mode -> unit -> slurm_rest

val make_jwt_key :
  secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  secret_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  jwt_key

val make_jwt_auth : ?jwt_key:jwt_key -> unit -> jwt_auth

val make_slurm_auth_key :
  secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  secret_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurm_auth_key

val make_slurmdbd_custom_setting :
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurmdbd_custom_setting

val make_slurm_custom_setting :
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurm_custom_setting

val make_cluster_slurm_configuration :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?auth_key:slurm_auth_key ->
  ?jwt_auth:jwt_auth ->
  ?accounting:accounting ->
  ?slurm_rest:slurm_rest ->
  unit ->
  cluster_slurm_configuration

val make_scheduler :
  type_:scheduler_type -> version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> scheduler

val make_cluster :
  ?slurm_configuration:cluster_slurm_configuration ->
  ?endpoints:endpoints ->
  ?error_info:error_info_list ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  status:cluster_status ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  scheduler:scheduler ->
  size:size ->
  networking:networking ->
  unit ->
  cluster

val make_cluster_summary :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:cluster_status ->
  unit ->
  cluster_summary

val make_slurm_rest_request : mode:slurm_rest_mode -> unit -> slurm_rest_request

val make_cluster_slurm_configuration_request :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?accounting:accounting_request ->
  ?slurm_rest:slurm_rest_request ->
  unit ->
  cluster_slurm_configuration_request

val make_compute_node_group_slurm_configuration :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  unit ->
  compute_node_group_slurm_configuration

val make_spot_options : ?allocation_strategy:spot_allocation_strategy -> unit -> spot_options

val make_instance_config :
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ -> unit -> instance_config

val make_scaling_configuration :
  min_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  max_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  scaling_configuration

val make_custom_launch_template :
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  custom_launch_template

val make_compute_node_group :
  ?ami_id:ami_id ->
  ?purchase_option:purchase_option ->
  ?spot_options:spot_options ->
  ?slurm_configuration:compute_node_group_slurm_configuration ->
  ?error_info:error_info_list ->
  name:compute_node_group_name ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:compute_node_group_status ->
  subnet_ids:subnet_id_list ->
  custom_launch_template:custom_launch_template ->
  iam_instance_profile_arn:instance_profile_arn ->
  scaling_configuration:scaling_configuration ->
  instance_configs:instance_list ->
  unit ->
  compute_node_group

val make_compute_node_group_configuration :
  ?compute_node_group_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  compute_node_group_configuration

val make_compute_node_group_summary :
  name:compute_node_group_name ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:compute_node_group_status ->
  unit ->
  compute_node_group_summary

val make_compute_node_group_slurm_configuration_request :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  unit ->
  compute_node_group_slurm_configuration_request

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_networking_request :
  ?subnet_ids:subnet_id_list ->
  ?security_group_ids:security_group_id_list ->
  ?network_type:network_type ->
  unit ->
  networking_request

val make_scheduler_request :
  type_:scheduler_type -> version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> scheduler_request

val make_create_cluster_request :
  ?slurm_configuration:cluster_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  ?tags:request_tag_map ->
  cluster_name:cluster_name ->
  scheduler:scheduler_request ->
  size:size ->
  networking:networking_request ->
  unit ->
  create_cluster_request

val make_create_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> create_compute_node_group_response

val make_scaling_configuration_request :
  min_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  max_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  scaling_configuration_request

val make_create_compute_node_group_request :
  ?ami_id:ami_id ->
  ?purchase_option:purchase_option ->
  ?spot_options:spot_options ->
  ?slurm_configuration:compute_node_group_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  ?tags:request_tag_map ->
  cluster_identifier:cluster_identifier ->
  compute_node_group_name:compute_node_group_name ->
  subnet_ids:string_list ->
  custom_launch_template:custom_launch_template ->
  iam_instance_profile_arn:instance_profile_arn ->
  scaling_configuration:scaling_configuration_request ->
  instance_configs:instance_list ->
  unit ->
  create_compute_node_group_request

val make_queue_slurm_configuration :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> queue_slurm_configuration

val make_queue :
  ?slurm_configuration:queue_slurm_configuration ->
  ?error_info:error_info_list ->
  name:queue_name ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:queue_status ->
  compute_node_group_configurations:compute_node_group_configuration_list ->
  unit ->
  queue

val make_create_queue_response : ?queue:queue -> unit -> create_queue_response

val make_queue_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> queue_slurm_configuration_request

val make_create_queue_request :
  ?compute_node_group_configurations:compute_node_group_configuration_list ->
  ?slurm_configuration:queue_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  ?tags:request_tag_map ->
  cluster_identifier:cluster_identifier ->
  queue_name:queue_name ->
  unit ->
  create_queue_request

val make_delete_cluster_response : unit -> unit

val make_delete_cluster_request :
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  unit ->
  delete_cluster_request

val make_delete_compute_node_group_response : unit -> unit

val make_delete_compute_node_group_request :
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  compute_node_group_identifier:compute_node_group_identifier ->
  unit ->
  delete_compute_node_group_request

val make_delete_queue_response : unit -> unit

val make_delete_queue_request :
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  queue_identifier:queue_identifier ->
  unit ->
  delete_queue_request

val make_get_cluster_response : ?cluster:cluster -> unit -> get_cluster_response
val make_get_cluster_request : cluster_identifier:cluster_identifier -> unit -> get_cluster_request

val make_get_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> get_compute_node_group_response

val make_get_compute_node_group_request :
  cluster_identifier:cluster_identifier ->
  compute_node_group_identifier:compute_node_group_identifier ->
  unit ->
  get_compute_node_group_request

val make_get_queue_response : ?queue:queue -> unit -> get_queue_response

val make_get_queue_request :
  cluster_identifier:cluster_identifier ->
  queue_identifier:queue_identifier ->
  unit ->
  get_queue_request

val make_list_clusters_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  clusters:cluster_list ->
  unit ->
  list_clusters_response

val make_list_clusters_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  unit ->
  list_clusters_request

val make_list_compute_node_groups_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  compute_node_groups:compute_node_group_list ->
  unit ->
  list_compute_node_groups_response

val make_list_compute_node_groups_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  cluster_identifier:cluster_identifier ->
  unit ->
  list_compute_node_groups_request

val make_queue_summary :
  name:queue_name ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:queue_status ->
  unit ->
  queue_summary

val make_list_queues_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  queues:queue_list ->
  unit ->
  list_queues_response

val make_list_queues_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:max_results ->
  cluster_identifier:cluster_identifier ->
  unit ->
  list_queues_request

val make_register_compute_node_group_instance_response :
  node_i_d:Smaws_Lib.Smithy_api.Types.string_ ->
  shared_secret:shared_secret ->
  endpoints:endpoints ->
  unit ->
  register_compute_node_group_instance_response

val make_register_compute_node_group_instance_request :
  cluster_identifier:cluster_identifier ->
  bootstrap_id:bootstrap_id ->
  unit ->
  register_compute_node_group_instance_request

val make_update_accounting_request :
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?mode:accounting_mode ->
  unit ->
  update_accounting_request

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_scheduler_request :
  version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> update_scheduler_request

val make_update_slurm_rest_request : ?mode:slurm_rest_mode -> unit -> update_slurm_rest_request

val make_update_cluster_slurm_configuration_request :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?accounting:update_accounting_request ->
  ?slurm_rest:update_slurm_rest_request ->
  unit ->
  update_cluster_slurm_configuration_request

val make_update_cluster_request :
  ?client_token:sb_client_token ->
  ?slurm_configuration:update_cluster_slurm_configuration_request ->
  ?scheduler:update_scheduler_request ->
  cluster_identifier:cluster_identifier ->
  unit ->
  update_cluster_request

val make_update_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> update_compute_node_group_response

val make_update_compute_node_group_slurm_configuration_request :
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?slurm_custom_settings:slurm_custom_settings ->
  unit ->
  update_compute_node_group_slurm_configuration_request

val make_update_compute_node_group_request :
  ?ami_id:ami_id ->
  ?subnet_ids:string_list ->
  ?custom_launch_template:custom_launch_template ->
  ?purchase_option:purchase_option ->
  ?spot_options:spot_options ->
  ?scaling_configuration:scaling_configuration_request ->
  ?iam_instance_profile_arn:instance_profile_arn ->
  ?slurm_configuration:update_compute_node_group_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  compute_node_group_identifier:compute_node_group_identifier ->
  unit ->
  update_compute_node_group_request

val make_update_queue_response : ?queue:queue -> unit -> update_queue_response

val make_update_queue_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> update_queue_slurm_configuration_request

val make_update_queue_request :
  ?compute_node_group_configurations:compute_node_group_configuration_list ->
  ?slurm_configuration:update_queue_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  queue_identifier:queue_identifier ->
  unit ->
  update_queue_request
(** {1:operations Operations} *)

module UpdateQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_queue_request ->
    ( update_queue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_queue_request ->
    ( update_queue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the compute node group configuration of a queue. Use this API to change the compute \
   node groups that the queue can send jobs to.\n"]

module UpdateComputeNodeGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_compute_node_group_request ->
    ( update_compute_node_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_compute_node_group_request ->
    ( update_compute_node_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a compute node group. You can update many of the fields related to your compute node \
   group including the configurations for networking, compute nodes, and settings specific to your \
   scheduler (such as Slurm).\n"]

module UpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a cluster configuration. You can upgrade the Slurm version, modify scheduler settings, \
   and update accounting configuration for an existing cluster. For more information about \
   upgrading the Slurm version, see \
   {{:https://docs.aws.amazon.com/pcs/latest/userguide/working-with_clusters_upgrade.html}Upgrading \
   the Slurm version on a cluster} in the {i PCS User Guide}. \n\n\
  \  You can only update clusters that are in [ACTIVE], [UPDATE_FAILED], or [SUSPENDED] state. All \
   associated resources (queues and compute node groups) must be in [ACTIVE] state before you can \
   update the cluster.\n\
  \  \n\
  \   "]

module RegisterComputeNodeGroupInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_compute_node_group_instance_request ->
    ( register_compute_node_group_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_compute_node_group_instance_request ->
    ( register_compute_node_group_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API action isn't intended for you to use.\n\
  \ \n\
  \   PCS uses this API action to register the compute nodes it launches in your account.\n\
  \   "]

module ListQueues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_queues_request ->
    ( list_queues_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_queues_request ->
    ( list_queues_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all queues associated with a cluster.\n"]

module ListComputeNodeGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compute_node_groups_request ->
    ( list_compute_node_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compute_node_groups_request ->
    ( list_compute_node_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all compute node groups associated with a cluster.\n"]

module ListClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    ( list_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    ( list_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of running clusters in your account.\n"]

module GetQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_queue_request ->
    ( get_queue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_queue_request ->
    ( get_queue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about a queue. The information includes the compute node groups \
   that the queue uses to schedule jobs.\n"]

module GetComputeNodeGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_compute_node_group_request ->
    ( get_compute_node_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_compute_node_group_request ->
    ( get_compute_node_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about a compute node group. This API action provides networking \
   information, EC2 instance type, compute node group status, and scheduler (such as Slurm) \
   configuration.\n"]

module GetCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_request ->
    ( get_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_request ->
    ( get_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about a running cluster in your account. This API action provides \
   networking information, endpoint information for communication with the scheduler, and \
   provisioning status.\n"]

module DeleteQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_queue_request ->
    ( delete_queue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_queue_request ->
    ( delete_queue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a job queue. If the compute node group associated with this queue isn't associated with \
   any other queues, PCS terminates all the compute nodes for this queue.\n"]

module DeleteComputeNodeGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_compute_node_group_request ->
    ( delete_compute_node_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_compute_node_group_request ->
    ( delete_compute_node_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a compute node group. You must delete all queues associated with the compute node group \
   first.\n"]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cluster and all its linked resources. You must delete all queues and compute node \
   groups associated with the cluster before you can delete the cluster.\n"]

module CreateQueue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_queue_request ->
    ( create_queue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_queue_request ->
    ( create_queue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a job queue. You must associate 1 or more compute node groups with the queue. You can \
   associate 1 compute node group with multiple queues.\n"]

module CreateComputeNodeGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_compute_node_group_request ->
    ( create_compute_node_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_compute_node_group_request ->
    ( create_compute_node_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a managed set of compute nodes. You associate a compute node group with a cluster \
   through 1 or more PCS queues or as part of the login fleet. A compute node group includes the \
   definition of the compute properties and lifecycle management. PCS uses the information you \
   provide to this API action to launch compute nodes in your account. You can only specify \
   subnets in the same Amazon VPC as your cluster. You receive billing charges for the compute \
   nodes that PCS launches in your account. You must already have a launch template before you \
   call this API. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html}Launch an \
   instance from a launch template} in the {i Amazon Elastic Compute Cloud User Guide for Linux \
   Instances}.\n"]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a cluster in your account. PCS creates the cluster controller in a service-owned \
   account. The cluster controller communicates with the cluster resources in your account. The \
   subnets and security groups for the cluster must already exist before you use this API action.\n\n\
  \  It takes time for PCS to create the cluster. The cluster is in a [Creating] state until it is \
   ready to use. There can only be 1 cluster in a [Creating] state per Amazon Web Services Region \
   per Amazon Web Services account. [CreateCluster] fails with a [ServiceQuotaExceededException] \
   if there is already a cluster in a [Creating] state.\n\
  \  \n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all tags on an PCS resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or edits tags on an PCS resource. Each tag consists of a tag key and a tag value. The tag \
   key and tag value are case-sensitive strings. The tag value can be an empty (null) string. To \
   add a tag, specify a new tag key and a tag value. To edit a tag, specify an existing tag key \
   and a new tag value.\n"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes tags from an PCS resource. To delete a tag, specify the tag key and the Amazon Resource \
   Name (ARN) of the PCS resource.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
