(** PCS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_slurm_rest_request : ?mode:slurm_rest_mode -> unit -> update_slurm_rest_request

val make_update_scheduler_request :
  version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> update_scheduler_request

val make_slurm_custom_setting :
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurm_custom_setting

val make_update_queue_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> update_queue_slurm_configuration_request

val make_compute_node_group_configuration :
  ?compute_node_group_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  compute_node_group_configuration

val make_queue_slurm_configuration :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> queue_slurm_configuration

val make_error_info :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  error_info

val make_queue :
  ?error_info:error_info_list ->
  ?slurm_configuration:queue_slurm_configuration ->
  compute_node_group_configurations:compute_node_group_configuration_list ->
  status:queue_status ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:queue_name ->
  unit ->
  queue

val make_update_queue_response : ?queue:queue -> unit -> update_queue_response

val make_update_queue_request :
  ?client_token:sb_client_token ->
  ?slurm_configuration:update_queue_slurm_configuration_request ->
  ?compute_node_group_configurations:compute_node_group_configuration_list ->
  queue_identifier:queue_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  update_queue_request

val make_update_compute_node_group_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  update_compute_node_group_slurm_configuration_request

val make_custom_launch_template :
  version:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  custom_launch_template

val make_scaling_configuration :
  max_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  min_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  scaling_configuration

val make_instance_config :
  ?instance_type:Smaws_Lib.Smithy_api.Types.string_ -> unit -> instance_config

val make_spot_options : ?allocation_strategy:spot_allocation_strategy -> unit -> spot_options

val make_compute_node_group_slurm_configuration :
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  compute_node_group_slurm_configuration

val make_compute_node_group :
  ?error_info:error_info_list ->
  ?slurm_configuration:compute_node_group_slurm_configuration ->
  ?spot_options:spot_options ->
  ?purchase_option:purchase_option ->
  ?ami_id:ami_id ->
  instance_configs:instance_list ->
  scaling_configuration:scaling_configuration ->
  iam_instance_profile_arn:instance_profile_arn ->
  custom_launch_template:custom_launch_template ->
  subnet_ids:subnet_id_list ->
  status:compute_node_group_status ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:compute_node_group_name ->
  unit ->
  compute_node_group

val make_update_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> update_compute_node_group_response

val make_scaling_configuration_request :
  max_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  min_instance_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  scaling_configuration_request

val make_update_compute_node_group_request :
  ?client_token:sb_client_token ->
  ?slurm_configuration:update_compute_node_group_slurm_configuration_request ->
  ?iam_instance_profile_arn:instance_profile_arn ->
  ?scaling_configuration:scaling_configuration_request ->
  ?spot_options:spot_options ->
  ?purchase_option:purchase_option ->
  ?custom_launch_template:custom_launch_template ->
  ?subnet_ids:string_list ->
  ?ami_id:ami_id ->
  compute_node_group_identifier:compute_node_group_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  update_compute_node_group_request

val make_slurmdbd_custom_setting :
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurmdbd_custom_setting

val make_cgroup_custom_setting :
  parameter_value:Smaws_Lib.Smithy_api.Types.string_ ->
  parameter_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cgroup_custom_setting

val make_update_accounting_request :
  ?mode:accounting_mode ->
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  update_accounting_request

val make_update_cluster_slurm_configuration_request :
  ?slurm_rest:update_slurm_rest_request ->
  ?accounting:update_accounting_request ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  update_cluster_slurm_configuration_request

val make_scheduler :
  version:Smaws_Lib.Smithy_api.Types.string_ -> type_:scheduler_type -> unit -> scheduler

val make_slurm_auth_key :
  secret_version:Smaws_Lib.Smithy_api.Types.string_ ->
  secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  slurm_auth_key

val make_jwt_key :
  secret_version:Smaws_Lib.Smithy_api.Types.string_ ->
  secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  jwt_key

val make_jwt_auth : ?jwt_key:jwt_key -> unit -> jwt_auth

val make_accounting :
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  mode:accounting_mode ->
  unit ->
  accounting

val make_slurm_rest : mode:slurm_rest_mode -> unit -> slurm_rest

val make_cluster_slurm_configuration :
  ?slurm_rest:slurm_rest ->
  ?accounting:accounting ->
  ?jwt_auth:jwt_auth ->
  ?auth_key:slurm_auth_key ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  cluster_slurm_configuration

val make_networking :
  ?network_type:network_type ->
  ?security_group_ids:security_group_id_list ->
  ?subnet_ids:subnet_id_list ->
  unit ->
  networking

val make_endpoint :
  ?ipv6_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?public_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  port:Smaws_Lib.Smithy_api.Types.string_ ->
  private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  type_:endpoint_type ->
  unit ->
  endpoint

val make_cluster :
  ?error_info:error_info_list ->
  ?endpoints:endpoints ->
  ?slurm_configuration:cluster_slurm_configuration ->
  networking:networking ->
  size:size ->
  scheduler:scheduler ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:cluster_status ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_cluster_request :
  ?scheduler:update_scheduler_request ->
  ?slurm_configuration:update_cluster_slurm_configuration_request ->
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  unit ->
  update_cluster_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:request_tag_map -> resource_arn:arn -> unit -> tag_resource_request

val make_slurm_rest_request : mode:slurm_rest_mode -> unit -> slurm_rest_request

val make_scheduler_request :
  version:Smaws_Lib.Smithy_api.Types.string_ -> type_:scheduler_type -> unit -> scheduler_request

val make_register_compute_node_group_instance_response :
  endpoints:endpoints ->
  shared_secret:shared_secret ->
  node_i_d:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  register_compute_node_group_instance_response

val make_register_compute_node_group_instance_request :
  bootstrap_id:bootstrap_id ->
  cluster_identifier:cluster_identifier ->
  unit ->
  register_compute_node_group_instance_request

val make_queue_summary :
  status:queue_status ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:queue_name ->
  unit ->
  queue_summary

val make_queue_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings -> unit -> queue_slurm_configuration_request

val make_networking_request :
  ?network_type:network_type ->
  ?security_group_ids:security_group_id_list ->
  ?subnet_ids:subnet_id_list ->
  unit ->
  networking_request

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_queues_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  queues:queue_list ->
  unit ->
  list_queues_response

val make_list_queues_request :
  ?max_results:max_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_identifier:cluster_identifier ->
  unit ->
  list_queues_request

val make_compute_node_group_summary :
  status:compute_node_group_status ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:compute_node_group_name ->
  unit ->
  compute_node_group_summary

val make_list_compute_node_groups_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  compute_node_groups:compute_node_group_list ->
  unit ->
  list_compute_node_groups_response

val make_list_compute_node_groups_request :
  ?max_results:max_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cluster_identifier:cluster_identifier ->
  unit ->
  list_compute_node_groups_request

val make_cluster_summary :
  status:cluster_status ->
  modified_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:Smaws_Lib.Smithy_api.Types.string_ ->
  id:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cluster_summary

val make_list_clusters_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  clusters:cluster_list ->
  unit ->
  list_clusters_response

val make_list_clusters_request :
  ?max_results:max_results ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_clusters_request

val make_get_queue_response : ?queue:queue -> unit -> get_queue_response

val make_get_queue_request :
  queue_identifier:queue_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  get_queue_request

val make_get_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> get_compute_node_group_response

val make_get_compute_node_group_request :
  compute_node_group_identifier:compute_node_group_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  get_compute_node_group_request

val make_get_cluster_response : ?cluster:cluster -> unit -> get_cluster_response
val make_get_cluster_request : cluster_identifier:cluster_identifier -> unit -> get_cluster_request
val make_delete_queue_response : unit -> unit

val make_delete_queue_request :
  ?client_token:sb_client_token ->
  queue_identifier:queue_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  delete_queue_request

val make_delete_compute_node_group_response : unit -> unit

val make_delete_compute_node_group_request :
  ?client_token:sb_client_token ->
  compute_node_group_identifier:compute_node_group_identifier ->
  cluster_identifier:cluster_identifier ->
  unit ->
  delete_compute_node_group_request

val make_delete_cluster_response : unit -> unit

val make_delete_cluster_request :
  ?client_token:sb_client_token ->
  cluster_identifier:cluster_identifier ->
  unit ->
  delete_cluster_request

val make_create_queue_response : ?queue:queue -> unit -> create_queue_response

val make_create_queue_request :
  ?tags:request_tag_map ->
  ?client_token:sb_client_token ->
  ?slurm_configuration:queue_slurm_configuration_request ->
  ?compute_node_group_configurations:compute_node_group_configuration_list ->
  queue_name:queue_name ->
  cluster_identifier:cluster_identifier ->
  unit ->
  create_queue_request

val make_create_compute_node_group_response :
  ?compute_node_group:compute_node_group -> unit -> create_compute_node_group_response

val make_compute_node_group_slurm_configuration_request :
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  compute_node_group_slurm_configuration_request

val make_create_compute_node_group_request :
  ?tags:request_tag_map ->
  ?client_token:sb_client_token ->
  ?slurm_configuration:compute_node_group_slurm_configuration_request ->
  ?spot_options:spot_options ->
  ?purchase_option:purchase_option ->
  ?ami_id:ami_id ->
  instance_configs:instance_list ->
  scaling_configuration:scaling_configuration_request ->
  iam_instance_profile_arn:instance_profile_arn ->
  custom_launch_template:custom_launch_template ->
  subnet_ids:string_list ->
  compute_node_group_name:compute_node_group_name ->
  cluster_identifier:cluster_identifier ->
  unit ->
  create_compute_node_group_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_accounting_request :
  ?default_purge_time_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  mode:accounting_mode ->
  unit ->
  accounting_request

val make_cluster_slurm_configuration_request :
  ?slurm_rest:slurm_rest_request ->
  ?accounting:accounting_request ->
  ?cgroup_custom_settings:cgroup_custom_settings ->
  ?slurmdbd_custom_settings:slurmdbd_custom_settings ->
  ?slurm_custom_settings:slurm_custom_settings ->
  ?scale_down_idle_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  cluster_slurm_configuration_request

val make_create_cluster_request :
  ?tags:request_tag_map ->
  ?client_token:sb_client_token ->
  ?slurm_configuration:cluster_slurm_configuration_request ->
  networking:networking_request ->
  size:size ->
  scheduler:scheduler_request ->
  cluster_name:cluster_name ->
  unit ->
  create_cluster_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
