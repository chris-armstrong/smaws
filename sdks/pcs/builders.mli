open Types

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
