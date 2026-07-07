open Types

val make_authentication :
  ?password_count:integer_optional -> ?type_:authentication_type -> unit -> authentication

val make_user :
  ?ar_n:string_ ->
  ?authentication:authentication ->
  ?minimum_engine_version:string_ ->
  ?acl_names:acl_name_list ->
  ?access_string:string_ ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  user

val make_update_user_response : ?user:user -> unit -> update_user_response

val make_authentication_mode :
  ?passwords:password_list_input -> ?type_:input_authentication_type -> unit -> authentication_mode

val make_update_user_request :
  ?access_string:access_string ->
  ?authentication_mode:authentication_mode ->
  user_name:user_name ->
  unit ->
  update_user_request

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?supported_network_types:network_type_list ->
  ?availability_zone:availability_zone ->
  ?identifier:string_ ->
  unit ->
  subnet

val make_subnet_group :
  ?supported_network_types:network_type_list ->
  ?ar_n:string_ ->
  ?subnets:subnet_list ->
  ?vpc_id:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  unit ->
  subnet_group

val make_update_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> update_subnet_group_response

val make_update_subnet_group_request :
  ?subnet_ids:subnet_identifier_list ->
  ?description:string_ ->
  subnet_group_name:string_ ->
  unit ->
  update_subnet_group_request

val make_parameter_group :
  ?ar_n:string_ ->
  ?description:string_ ->
  ?family:string_ ->
  ?name:string_ ->
  unit ->
  parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_value:string_ -> ?parameter_name:string_ -> unit -> parameter_name_value

val make_update_parameter_group_request :
  parameter_name_values:parameter_name_value_list ->
  parameter_group_name:string_ ->
  unit ->
  update_parameter_group_request

val make_regional_cluster :
  ?ar_n:string_ ->
  ?status:string_ ->
  ?region:string_ ->
  ?cluster_name:string_ ->
  unit ->
  regional_cluster

val make_multi_region_cluster :
  ?ar_n:string_ ->
  ?tls_enabled:boolean_optional ->
  ?multi_region_parameter_group_name:string_ ->
  ?clusters:regional_cluster_list ->
  ?number_of_shards:integer_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?node_type:string_ ->
  ?status:string_ ->
  ?description:string_ ->
  ?multi_region_cluster_name:string_ ->
  unit ->
  multi_region_cluster

val make_update_multi_region_cluster_response :
  ?multi_region_cluster:multi_region_cluster -> unit -> update_multi_region_cluster_response

val make_shard_configuration_request : ?shard_count:integer -> unit -> shard_configuration_request

val make_update_multi_region_cluster_request :
  ?update_strategy:update_strategy ->
  ?multi_region_parameter_group_name:string_ ->
  ?shard_configuration:shard_configuration_request ->
  ?engine_version:string_ ->
  ?description:string_ ->
  ?node_type:string_ ->
  multi_region_cluster_name:string_ ->
  unit ->
  update_multi_region_cluster_request

val make_slot_migration : ?progress_percentage:double -> unit -> slot_migration
val make_resharding_status : ?slot_migration:slot_migration -> unit -> resharding_status
val make_ac_ls_update_status : ?acl_to_apply:acl_name -> unit -> ac_ls_update_status

val make_pending_modified_service_update :
  ?status:service_update_status ->
  ?service_update_name:string_ ->
  unit ->
  pending_modified_service_update

val make_cluster_pending_updates :
  ?service_updates:pending_modified_service_update_list ->
  ?ac_ls:ac_ls_update_status ->
  ?resharding:resharding_status ->
  unit ->
  cluster_pending_updates

val make_endpoint : ?port:integer -> ?address:string_ -> unit -> endpoint

val make_node :
  ?endpoint:endpoint ->
  ?create_time:t_stamp ->
  ?availability_zone:string_ ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  node

val make_shard :
  ?number_of_nodes:integer_optional ->
  ?nodes:node_list ->
  ?slots:string_ ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  shard

val make_security_group_membership :
  ?status:string_ -> ?security_group_id:string_ -> unit -> security_group_membership

val make_cluster :
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?data_tiering:data_tiering_status ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?acl_name:acl_name ->
  ?snapshot_window:string_ ->
  ?maintenance_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?sns_topic_status:string_ ->
  ?sns_topic_arn:string_ ->
  ?ar_n:string_ ->
  ?kms_key_id:string_ ->
  ?tls_enabled:boolean_optional ->
  ?subnet_group_name:string_ ->
  ?security_groups:security_group_membership_list ->
  ?parameter_group_status:string_ ->
  ?parameter_group_name:string_ ->
  ?engine_patch_version:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?node_type:string_ ->
  ?cluster_endpoint:endpoint ->
  ?availability_mode:az_status ->
  ?shards:shard_list ->
  ?number_of_shards:integer_optional ->
  ?multi_region_cluster_name:string_ ->
  ?pending_updates:cluster_pending_updates ->
  ?status:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_replica_configuration_request :
  ?replica_count:integer -> unit -> replica_configuration_request

val make_update_cluster_request :
  ?ip_discovery:ip_discovery ->
  ?acl_name:acl_name ->
  ?shard_configuration:shard_configuration_request ->
  ?replica_configuration:replica_configuration_request ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?node_type:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?parameter_group_name:string_ ->
  ?sns_topic_status:string_ ->
  ?sns_topic_arn:string_ ->
  ?maintenance_window:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?description:string_ ->
  cluster_name:string_ ->
  unit ->
  update_cluster_request

val make_acl_pending_changes :
  ?user_names_to_add:user_name_list ->
  ?user_names_to_remove:user_name_list ->
  unit ->
  acl_pending_changes

val make_ac_l :
  ?ar_n:string_ ->
  ?clusters:acl_cluster_name_list ->
  ?pending_changes:acl_pending_changes ->
  ?minimum_engine_version:string_ ->
  ?user_names:user_name_list ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  ac_l

val make_update_acl_response : ?ac_l:ac_l -> unit -> update_acl_response

val make_update_acl_request :
  ?user_names_to_remove:user_name_list_input ->
  ?user_names_to_add:user_name_list_input ->
  acl_name:string_ ->
  unit ->
  update_acl_request

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag
val make_untag_resource_response : ?tag_list:tag_list -> unit -> untag_resource_response

val make_untag_resource_request :
  tag_keys:key_list -> resource_arn:string_ -> unit -> untag_resource_request

val make_unprocessed_cluster :
  ?error_message:string_ ->
  ?error_type:string_ ->
  ?cluster_name:string_ ->
  unit ->
  unprocessed_cluster

val make_tag_resource_response : ?tag_list:tag_list -> unit -> tag_resource_response

val make_tag_resource_request :
  tags:tag_list -> resource_arn:string_ -> unit -> tag_resource_request

val make_shard_configuration :
  ?replica_count:integer_optional -> ?slots:string_ -> unit -> shard_configuration

val make_shard_detail :
  ?snapshot_creation_time:t_stamp ->
  ?size:string_ ->
  ?configuration:shard_configuration ->
  ?name:string_ ->
  unit ->
  shard_detail

val make_cluster_configuration :
  ?multi_region_cluster_name:string_ ->
  ?multi_region_parameter_group_name:string_ ->
  ?shards:shard_details ->
  ?num_shards:integer_optional ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?vpc_id:string_ ->
  ?subnet_group_name:string_ ->
  ?parameter_group_name:string_ ->
  ?port:integer_optional ->
  ?topic_arn:string_ ->
  ?maintenance_window:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?node_type:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  unit ->
  cluster_configuration

val make_snapshot :
  ?data_tiering:data_tiering_status ->
  ?cluster_configuration:cluster_configuration ->
  ?ar_n:string_ ->
  ?kms_key_id:string_ ->
  ?source:string_ ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  snapshot

val make_service_update_request :
  ?service_update_name_to_apply:string_ -> unit -> service_update_request

val make_service_update :
  ?auto_update_start_date:t_stamp ->
  ?nodes_updated:string_ ->
  ?engine:string_ ->
  ?type_:service_update_type ->
  ?status:service_update_status ->
  ?description:string_ ->
  ?release_date:t_stamp ->
  ?service_update_name:string_ ->
  ?cluster_name:string_ ->
  unit ->
  service_update

val make_reset_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> reset_parameter_group_response

val make_reset_parameter_group_request :
  ?parameter_names:parameter_name_list ->
  ?all_parameters:boolean_ ->
  parameter_group_name:string_ ->
  unit ->
  reset_parameter_group_request

val make_recurring_charge :
  ?recurring_charge_frequency:string_ -> ?recurring_charge_amount:double -> unit -> recurring_charge

val make_reserved_nodes_offering :
  ?recurring_charges:recurring_charge_list ->
  ?offering_type:string_ ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?node_type:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  unit ->
  reserved_nodes_offering

val make_reserved_node :
  ?ar_n:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?state:string_ ->
  ?offering_type:string_ ->
  ?node_count:integer ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?start_time:t_stamp ->
  ?node_type:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  ?reservation_id:string_ ->
  unit ->
  reserved_node

val make_purchase_reserved_nodes_offering_response :
  ?reserved_node:reserved_node -> unit -> purchase_reserved_nodes_offering_response

val make_purchase_reserved_nodes_offering_request :
  ?tags:tag_list ->
  ?node_count:integer_optional ->
  ?reservation_id:string_ ->
  reserved_nodes_offering_id:string_ ->
  unit ->
  purchase_reserved_nodes_offering_request

val make_parameter :
  ?minimum_engine_version:string_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?description:string_ ->
  ?value:string_ ->
  ?name:string_ ->
  unit ->
  parameter

val make_multi_region_parameter :
  ?minimum_engine_version:string_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?value:string_ ->
  ?name:string_ ->
  unit ->
  multi_region_parameter

val make_multi_region_parameter_group :
  ?ar_n:string_ ->
  ?description:string_ ->
  ?family:string_ ->
  ?name:string_ ->
  unit ->
  multi_region_parameter_group

val make_list_tags_response : ?tag_list:tag_list -> unit -> list_tags_response
val make_list_tags_request : resource_arn:string_ -> unit -> list_tags_request

val make_list_allowed_node_type_updates_response :
  ?scale_down_node_types:node_type_list ->
  ?scale_up_node_types:node_type_list ->
  unit ->
  list_allowed_node_type_updates_response

val make_list_allowed_node_type_updates_request :
  cluster_name:string_ -> unit -> list_allowed_node_type_updates_request

val make_list_allowed_multi_region_cluster_updates_response :
  ?scale_down_node_types:node_type_list ->
  ?scale_up_node_types:node_type_list ->
  unit ->
  list_allowed_multi_region_cluster_updates_response

val make_list_allowed_multi_region_cluster_updates_request :
  multi_region_cluster_name:string_ -> unit -> list_allowed_multi_region_cluster_updates_request

val make_filter : values:filter_value_list -> name:filter_name -> unit -> filter
val make_failover_shard_response : ?cluster:cluster -> unit -> failover_shard_response

val make_failover_shard_request :
  shard_name:string_ -> cluster_name:string_ -> unit -> failover_shard_request

val make_event :
  ?date:t_stamp ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_name:string_ ->
  unit ->
  event

val make_engine_version_info :
  ?parameter_group_family:string_ ->
  ?engine_patch_version:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  engine_version_info

val make_describe_users_response :
  ?next_token:string_ -> ?users:user_list -> unit -> describe_users_response

val make_describe_users_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?filters:filter_list ->
  ?user_name:user_name ->
  unit ->
  describe_users_request

val make_describe_subnet_groups_response :
  ?subnet_groups:subnet_group_list -> ?next_token:string_ -> unit -> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?subnet_group_name:string_ ->
  unit ->
  describe_subnet_groups_request

val make_describe_snapshots_response :
  ?snapshots:snapshot_list -> ?next_token:string_ -> unit -> describe_snapshots_response

val make_describe_snapshots_request :
  ?show_detail:boolean_optional ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  ?source:string_ ->
  ?snapshot_name:string_ ->
  ?cluster_name:string_ ->
  unit ->
  describe_snapshots_request

val make_describe_service_updates_response :
  ?service_updates:service_update_list ->
  ?next_token:string_ ->
  unit ->
  describe_service_updates_response

val make_describe_service_updates_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?status:service_update_status_list ->
  ?cluster_names:cluster_name_list ->
  ?service_update_name:string_ ->
  unit ->
  describe_service_updates_request

val make_describe_reserved_nodes_response :
  ?reserved_nodes:reserved_node_list ->
  ?next_token:string_ ->
  unit ->
  describe_reserved_nodes_response

val make_describe_reserved_nodes_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?offering_type:string_ ->
  ?duration:string_ ->
  ?node_type:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  ?reservation_id:string_ ->
  unit ->
  describe_reserved_nodes_request

val make_describe_reserved_nodes_offerings_response :
  ?reserved_nodes_offerings:reserved_nodes_offering_list ->
  ?next_token:string_ ->
  unit ->
  describe_reserved_nodes_offerings_response

val make_describe_reserved_nodes_offerings_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?offering_type:string_ ->
  ?duration:string_ ->
  ?node_type:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  unit ->
  describe_reserved_nodes_offerings_request

val make_describe_parameters_response :
  ?parameters:parameters_list -> ?next_token:string_ -> unit -> describe_parameters_response

val make_describe_parameters_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  parameter_group_name:string_ ->
  unit ->
  describe_parameters_request

val make_describe_parameter_groups_response :
  ?parameter_groups:parameter_group_list ->
  ?next_token:string_ ->
  unit ->
  describe_parameter_groups_response

val make_describe_parameter_groups_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?parameter_group_name:string_ ->
  unit ->
  describe_parameter_groups_request

val make_describe_multi_region_parameters_response :
  ?multi_region_parameters:multi_region_parameters_list ->
  ?next_token:string_ ->
  unit ->
  describe_multi_region_parameters_response

val make_describe_multi_region_parameters_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?source:string_ ->
  multi_region_parameter_group_name:string_ ->
  unit ->
  describe_multi_region_parameters_request

val make_describe_multi_region_parameter_groups_response :
  ?multi_region_parameter_groups:multi_region_parameter_group_list ->
  ?next_token:string_ ->
  unit ->
  describe_multi_region_parameter_groups_response

val make_describe_multi_region_parameter_groups_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?multi_region_parameter_group_name:string_ ->
  unit ->
  describe_multi_region_parameter_groups_request

val make_describe_multi_region_clusters_response :
  ?multi_region_clusters:multi_region_cluster_list ->
  ?next_token:string_ ->
  unit ->
  describe_multi_region_clusters_response

val make_describe_multi_region_clusters_request :
  ?show_cluster_details:boolean_optional ->
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?multi_region_cluster_name:string_ ->
  unit ->
  describe_multi_region_clusters_request

val make_describe_events_response :
  ?events:event_list -> ?next_token:string_ -> unit -> describe_events_response

val make_describe_events_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?duration:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?source_type:source_type ->
  ?source_name:string_ ->
  unit ->
  describe_events_request

val make_describe_engine_versions_response :
  ?engine_versions:engine_version_info_list ->
  ?next_token:string_ ->
  unit ->
  describe_engine_versions_response

val make_describe_engine_versions_request :
  ?default_only:boolean_ ->
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?parameter_group_family:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  describe_engine_versions_request

val make_describe_clusters_response :
  ?clusters:cluster_list -> ?next_token:string_ -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?show_shard_details:boolean_optional ->
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?cluster_name:string_ ->
  unit ->
  describe_clusters_request

val make_describe_ac_ls_response :
  ?next_token:string_ -> ?ac_ls:acl_list -> unit -> describe_ac_ls_response

val make_describe_ac_ls_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?acl_name:string_ ->
  unit ->
  describe_ac_ls_request

val make_delete_user_response : ?user:user -> unit -> delete_user_response
val make_delete_user_request : user_name:user_name -> unit -> delete_user_request

val make_delete_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> delete_subnet_group_response

val make_delete_subnet_group_request :
  subnet_group_name:string_ -> unit -> delete_subnet_group_request

val make_delete_snapshot_response : ?snapshot:snapshot -> unit -> delete_snapshot_response
val make_delete_snapshot_request : snapshot_name:string_ -> unit -> delete_snapshot_request

val make_delete_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> delete_parameter_group_response

val make_delete_parameter_group_request :
  parameter_group_name:string_ -> unit -> delete_parameter_group_request

val make_delete_multi_region_cluster_response :
  ?multi_region_cluster:multi_region_cluster -> unit -> delete_multi_region_cluster_response

val make_delete_multi_region_cluster_request :
  multi_region_cluster_name:string_ -> unit -> delete_multi_region_cluster_request

val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response

val make_delete_cluster_request :
  ?final_snapshot_name:string_ ->
  ?multi_region_cluster_name:string_ ->
  cluster_name:string_ ->
  unit ->
  delete_cluster_request

val make_delete_acl_response : ?ac_l:ac_l -> unit -> delete_acl_response
val make_delete_acl_request : acl_name:string_ -> unit -> delete_acl_request
val make_create_user_response : ?user:user -> unit -> create_user_response

val make_create_user_request :
  ?tags:tag_list ->
  access_string:access_string ->
  authentication_mode:authentication_mode ->
  user_name:user_name ->
  unit ->
  create_user_request

val make_create_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> create_subnet_group_response

val make_create_subnet_group_request :
  ?tags:tag_list ->
  ?description:string_ ->
  subnet_ids:subnet_identifier_list ->
  subnet_group_name:string_ ->
  unit ->
  create_subnet_group_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  snapshot_name:string_ ->
  cluster_name:string_ ->
  unit ->
  create_snapshot_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> create_parameter_group_response

val make_create_parameter_group_request :
  ?tags:tag_list ->
  ?description:string_ ->
  family:string_ ->
  parameter_group_name:string_ ->
  unit ->
  create_parameter_group_request

val make_create_multi_region_cluster_response :
  ?multi_region_cluster:multi_region_cluster -> unit -> create_multi_region_cluster_response

val make_create_multi_region_cluster_request :
  ?tags:tag_list ->
  ?tls_enabled:boolean_optional ->
  ?num_shards:integer_optional ->
  ?multi_region_parameter_group_name:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?description:string_ ->
  node_type:string_ ->
  multi_region_cluster_name_suffix:string_ ->
  unit ->
  create_multi_region_cluster_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?data_tiering:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?snapshot_window:string_ ->
  ?tags:tag_list ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_name:string_ ->
  ?snapshot_arns:snapshot_arns_list ->
  ?kms_key_id:string_ ->
  ?tls_enabled:boolean_optional ->
  ?sns_topic_arn:string_ ->
  ?port:integer_optional ->
  ?maintenance_window:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?subnet_group_name:string_ ->
  ?num_replicas_per_shard:integer_optional ->
  ?num_shards:integer_optional ->
  ?description:string_ ->
  ?parameter_group_name:string_ ->
  ?multi_region_cluster_name:string_ ->
  acl_name:acl_name ->
  node_type:string_ ->
  cluster_name:string_ ->
  unit ->
  create_cluster_request

val make_create_acl_response : ?ac_l:ac_l -> unit -> create_acl_response

val make_create_acl_request :
  ?tags:tag_list ->
  ?user_names:user_name_list_input ->
  acl_name:string_ ->
  unit ->
  create_acl_request

val make_copy_snapshot_response : ?snapshot:snapshot -> unit -> copy_snapshot_response

val make_copy_snapshot_request :
  ?tags:tag_list ->
  ?kms_key_id:kms_key_id ->
  ?target_bucket:target_bucket ->
  target_snapshot_name:string_ ->
  source_snapshot_name:string_ ->
  unit ->
  copy_snapshot_request

val make_batch_update_cluster_response :
  ?unprocessed_clusters:unprocessed_cluster_list ->
  ?processed_clusters:cluster_list ->
  unit ->
  batch_update_cluster_response

val make_batch_update_cluster_request :
  ?service_update:service_update_request ->
  cluster_names:cluster_name_list ->
  unit ->
  batch_update_cluster_request
