open Types

val make_acl_pending_changes :
  ?user_names_to_remove:user_name_list ->
  ?user_names_to_add:user_name_list ->
  unit ->
  acl_pending_changes

val make_ac_l :
  ?name:string_ ->
  ?status:string_ ->
  ?user_names:user_name_list ->
  ?minimum_engine_version:string_ ->
  ?pending_changes:acl_pending_changes ->
  ?clusters:acl_cluster_name_list ->
  ?ar_n:string_ ->
  unit ->
  ac_l

val make_ac_ls_update_status : ?acl_to_apply:acl_name -> unit -> ac_ls_update_status

val make_authentication :
  ?type_:authentication_type -> ?password_count:integer_optional -> unit -> authentication

val make_user :
  ?name:string_ ->
  ?status:string_ ->
  ?access_string:string_ ->
  ?acl_names:acl_name_list ->
  ?minimum_engine_version:string_ ->
  ?authentication:authentication ->
  ?ar_n:string_ ->
  unit ->
  user

val make_update_user_response : ?user:user -> unit -> update_user_response

val make_authentication_mode :
  ?type_:input_authentication_type -> ?passwords:password_list_input -> unit -> authentication_mode

val make_update_user_request :
  ?authentication_mode:authentication_mode ->
  ?access_string:access_string ->
  user_name:user_name ->
  unit ->
  update_user_request

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?identifier:string_ ->
  ?availability_zone:availability_zone ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet

val make_subnet_group :
  ?name:string_ ->
  ?description:string_ ->
  ?vpc_id:string_ ->
  ?subnets:subnet_list ->
  ?ar_n:string_ ->
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
  ?name:string_ ->
  ?family:string_ ->
  ?description:string_ ->
  ?ar_n:string_ ->
  unit ->
  parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_name:string_ -> ?parameter_value:string_ -> unit -> parameter_name_value

val make_update_parameter_group_request :
  parameter_group_name:string_ ->
  parameter_name_values:parameter_name_value_list ->
  unit ->
  update_parameter_group_request

val make_regional_cluster :
  ?cluster_name:string_ ->
  ?region:string_ ->
  ?status:string_ ->
  ?ar_n:string_ ->
  unit ->
  regional_cluster

val make_multi_region_cluster :
  ?multi_region_cluster_name:string_ ->
  ?description:string_ ->
  ?status:string_ ->
  ?node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?number_of_shards:integer_optional ->
  ?clusters:regional_cluster_list ->
  ?multi_region_parameter_group_name:string_ ->
  ?tls_enabled:boolean_optional ->
  ?ar_n:string_ ->
  unit ->
  multi_region_cluster

val make_update_multi_region_cluster_response :
  ?multi_region_cluster:multi_region_cluster -> unit -> update_multi_region_cluster_response

val make_shard_configuration_request : ?shard_count:integer -> unit -> shard_configuration_request

val make_update_multi_region_cluster_request :
  ?node_type:string_ ->
  ?description:string_ ->
  ?engine_version:string_ ->
  ?shard_configuration:shard_configuration_request ->
  ?multi_region_parameter_group_name:string_ ->
  ?update_strategy:update_strategy ->
  multi_region_cluster_name:string_ ->
  unit ->
  update_multi_region_cluster_request

val make_security_group_membership :
  ?security_group_id:string_ -> ?status:string_ -> unit -> security_group_membership

val make_endpoint : ?address:string_ -> ?port:integer -> unit -> endpoint

val make_node :
  ?name:string_ ->
  ?status:string_ ->
  ?availability_zone:string_ ->
  ?create_time:t_stamp ->
  ?endpoint:endpoint ->
  unit ->
  node

val make_shard :
  ?name:string_ ->
  ?status:string_ ->
  ?slots:string_ ->
  ?nodes:node_list ->
  ?number_of_nodes:integer_optional ->
  unit ->
  shard

val make_pending_modified_service_update :
  ?service_update_name:string_ ->
  ?status:service_update_status ->
  unit ->
  pending_modified_service_update

val make_slot_migration : ?progress_percentage:double -> unit -> slot_migration
val make_resharding_status : ?slot_migration:slot_migration -> unit -> resharding_status

val make_cluster_pending_updates :
  ?resharding:resharding_status ->
  ?ac_ls:ac_ls_update_status ->
  ?service_updates:pending_modified_service_update_list ->
  unit ->
  cluster_pending_updates

val make_cluster :
  ?name:string_ ->
  ?description:string_ ->
  ?status:string_ ->
  ?pending_updates:cluster_pending_updates ->
  ?multi_region_cluster_name:string_ ->
  ?number_of_shards:integer_optional ->
  ?shards:shard_list ->
  ?availability_mode:az_status ->
  ?cluster_endpoint:endpoint ->
  ?node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?engine_patch_version:string_ ->
  ?parameter_group_name:string_ ->
  ?parameter_group_status:string_ ->
  ?security_groups:security_group_membership_list ->
  ?subnet_group_name:string_ ->
  ?tls_enabled:boolean_optional ->
  ?kms_key_id:string_ ->
  ?ar_n:string_ ->
  ?sns_topic_arn:string_ ->
  ?sns_topic_status:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?maintenance_window:string_ ->
  ?snapshot_window:string_ ->
  ?acl_name:acl_name ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?data_tiering:data_tiering_status ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_replica_configuration_request :
  ?replica_count:integer -> unit -> replica_configuration_request

val make_update_cluster_request :
  ?description:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?maintenance_window:string_ ->
  ?sns_topic_arn:string_ ->
  ?sns_topic_status:string_ ->
  ?parameter_group_name:string_ ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?replica_configuration:replica_configuration_request ->
  ?shard_configuration:shard_configuration_request ->
  ?acl_name:acl_name ->
  ?ip_discovery:ip_discovery ->
  cluster_name:string_ ->
  unit ->
  update_cluster_request

val make_update_acl_response : ?ac_l:ac_l -> unit -> update_acl_response

val make_update_acl_request :
  ?user_names_to_add:user_name_list_input ->
  ?user_names_to_remove:user_name_list_input ->
  acl_name:string_ ->
  unit ->
  update_acl_request

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag
val make_untag_resource_response : ?tag_list:tag_list -> unit -> untag_resource_response

val make_untag_resource_request :
  resource_arn:string_ -> tag_keys:key_list -> unit -> untag_resource_request

val make_tag_resource_response : ?tag_list:tag_list -> unit -> tag_resource_response

val make_tag_resource_request :
  resource_arn:string_ -> tags:tag_list -> unit -> tag_resource_request

val make_reset_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> reset_parameter_group_response

val make_reset_parameter_group_request :
  ?all_parameters:boolean_ ->
  ?parameter_names:parameter_name_list ->
  parameter_group_name:string_ ->
  unit ->
  reset_parameter_group_request

val make_recurring_charge :
  ?recurring_charge_amount:double -> ?recurring_charge_frequency:string_ -> unit -> recurring_charge

val make_reserved_node :
  ?reservation_id:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  ?node_type:string_ ->
  ?start_time:t_stamp ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?node_count:integer ->
  ?offering_type:string_ ->
  ?state:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?ar_n:string_ ->
  unit ->
  reserved_node

val make_purchase_reserved_nodes_offering_response :
  ?reserved_node:reserved_node -> unit -> purchase_reserved_nodes_offering_response

val make_purchase_reserved_nodes_offering_request :
  ?reservation_id:string_ ->
  ?node_count:integer_optional ->
  ?tags:tag_list ->
  reserved_nodes_offering_id:string_ ->
  unit ->
  purchase_reserved_nodes_offering_request

val make_list_tags_response : ?tag_list:tag_list -> unit -> list_tags_response
val make_list_tags_request : resource_arn:string_ -> unit -> list_tags_request

val make_list_allowed_node_type_updates_response :
  ?scale_up_node_types:node_type_list ->
  ?scale_down_node_types:node_type_list ->
  unit ->
  list_allowed_node_type_updates_response

val make_list_allowed_node_type_updates_request :
  cluster_name:string_ -> unit -> list_allowed_node_type_updates_request

val make_list_allowed_multi_region_cluster_updates_response :
  ?scale_up_node_types:node_type_list ->
  ?scale_down_node_types:node_type_list ->
  unit ->
  list_allowed_multi_region_cluster_updates_response

val make_list_allowed_multi_region_cluster_updates_request :
  multi_region_cluster_name:string_ -> unit -> list_allowed_multi_region_cluster_updates_request

val make_failover_shard_response : ?cluster:cluster -> unit -> failover_shard_response

val make_failover_shard_request :
  cluster_name:string_ -> shard_name:string_ -> unit -> failover_shard_request

val make_describe_users_response :
  ?users:user_list -> ?next_token:string_ -> unit -> describe_users_response

val make_filter : name:filter_name -> values:filter_value_list -> unit -> filter

val make_describe_users_request :
  ?user_name:user_name ->
  ?filters:filter_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_users_request

val make_describe_subnet_groups_response :
  ?next_token:string_ -> ?subnet_groups:subnet_group_list -> unit -> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?subnet_group_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_subnet_groups_request

val make_shard_configuration :
  ?slots:string_ -> ?replica_count:integer_optional -> unit -> shard_configuration

val make_shard_detail :
  ?name:string_ ->
  ?configuration:shard_configuration ->
  ?size:string_ ->
  ?snapshot_creation_time:t_stamp ->
  unit ->
  shard_detail

val make_cluster_configuration :
  ?name:string_ ->
  ?description:string_ ->
  ?node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?maintenance_window:string_ ->
  ?topic_arn:string_ ->
  ?port:integer_optional ->
  ?parameter_group_name:string_ ->
  ?subnet_group_name:string_ ->
  ?vpc_id:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?num_shards:integer_optional ->
  ?shards:shard_details ->
  ?multi_region_parameter_group_name:string_ ->
  ?multi_region_cluster_name:string_ ->
  unit ->
  cluster_configuration

val make_snapshot :
  ?name:string_ ->
  ?status:string_ ->
  ?source:string_ ->
  ?kms_key_id:string_ ->
  ?ar_n:string_ ->
  ?cluster_configuration:cluster_configuration ->
  ?data_tiering:data_tiering_status ->
  unit ->
  snapshot

val make_describe_snapshots_response :
  ?next_token:string_ -> ?snapshots:snapshot_list -> unit -> describe_snapshots_response

val make_describe_snapshots_request :
  ?cluster_name:string_ ->
  ?snapshot_name:string_ ->
  ?source:string_ ->
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?show_detail:boolean_optional ->
  unit ->
  describe_snapshots_request

val make_service_update :
  ?cluster_name:string_ ->
  ?service_update_name:string_ ->
  ?release_date:t_stamp ->
  ?description:string_ ->
  ?status:service_update_status ->
  ?type_:service_update_type ->
  ?engine:string_ ->
  ?nodes_updated:string_ ->
  ?auto_update_start_date:t_stamp ->
  unit ->
  service_update

val make_describe_service_updates_response :
  ?next_token:string_ ->
  ?service_updates:service_update_list ->
  unit ->
  describe_service_updates_response

val make_describe_service_updates_request :
  ?service_update_name:string_ ->
  ?cluster_names:cluster_name_list ->
  ?status:service_update_status_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_service_updates_request

val make_reserved_nodes_offering :
  ?reserved_nodes_offering_id:string_ ->
  ?node_type:string_ ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?offering_type:string_ ->
  ?recurring_charges:recurring_charge_list ->
  unit ->
  reserved_nodes_offering

val make_describe_reserved_nodes_offerings_response :
  ?next_token:string_ ->
  ?reserved_nodes_offerings:reserved_nodes_offering_list ->
  unit ->
  describe_reserved_nodes_offerings_response

val make_describe_reserved_nodes_offerings_request :
  ?reserved_nodes_offering_id:string_ ->
  ?node_type:string_ ->
  ?duration:string_ ->
  ?offering_type:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_reserved_nodes_offerings_request

val make_describe_reserved_nodes_response :
  ?next_token:string_ ->
  ?reserved_nodes:reserved_node_list ->
  unit ->
  describe_reserved_nodes_response

val make_describe_reserved_nodes_request :
  ?reservation_id:string_ ->
  ?reserved_nodes_offering_id:string_ ->
  ?node_type:string_ ->
  ?duration:string_ ->
  ?offering_type:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_reserved_nodes_request

val make_parameter :
  ?name:string_ ->
  ?value:string_ ->
  ?description:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?minimum_engine_version:string_ ->
  unit ->
  parameter

val make_describe_parameters_response :
  ?next_token:string_ -> ?parameters:parameters_list -> unit -> describe_parameters_response

val make_describe_parameters_request :
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
  ?parameter_group_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_parameter_groups_request

val make_multi_region_parameter :
  ?name:string_ ->
  ?value:string_ ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?minimum_engine_version:string_ ->
  unit ->
  multi_region_parameter

val make_describe_multi_region_parameters_response :
  ?next_token:string_ ->
  ?multi_region_parameters:multi_region_parameters_list ->
  unit ->
  describe_multi_region_parameters_response

val make_describe_multi_region_parameters_request :
  ?source:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  multi_region_parameter_group_name:string_ ->
  unit ->
  describe_multi_region_parameters_request

val make_multi_region_parameter_group :
  ?name:string_ ->
  ?family:string_ ->
  ?description:string_ ->
  ?ar_n:string_ ->
  unit ->
  multi_region_parameter_group

val make_describe_multi_region_parameter_groups_response :
  ?next_token:string_ ->
  ?multi_region_parameter_groups:multi_region_parameter_group_list ->
  unit ->
  describe_multi_region_parameter_groups_response

val make_describe_multi_region_parameter_groups_request :
  ?multi_region_parameter_group_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_multi_region_parameter_groups_request

val make_describe_multi_region_clusters_response :
  ?next_token:string_ ->
  ?multi_region_clusters:multi_region_cluster_list ->
  unit ->
  describe_multi_region_clusters_response

val make_describe_multi_region_clusters_request :
  ?multi_region_cluster_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  ?show_cluster_details:boolean_optional ->
  unit ->
  describe_multi_region_clusters_request

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

val make_engine_version_info :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?engine_patch_version:string_ ->
  ?parameter_group_family:string_ ->
  unit ->
  engine_version_info

val make_describe_engine_versions_response :
  ?next_token:string_ ->
  ?engine_versions:engine_version_info_list ->
  unit ->
  describe_engine_versions_response

val make_describe_engine_versions_request :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?parameter_group_family:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  ?default_only:boolean_ ->
  unit ->
  describe_engine_versions_request

val make_describe_clusters_response :
  ?next_token:string_ -> ?clusters:cluster_list -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?cluster_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  ?show_shard_details:boolean_optional ->
  unit ->
  describe_clusters_request

val make_describe_ac_ls_response :
  ?ac_ls:acl_list -> ?next_token:string_ -> unit -> describe_ac_ls_response

val make_describe_ac_ls_request :
  ?acl_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
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
  ?multi_region_cluster_name:string_ ->
  ?final_snapshot_name:string_ ->
  cluster_name:string_ ->
  unit ->
  delete_cluster_request

val make_delete_acl_response : ?ac_l:ac_l -> unit -> delete_acl_response
val make_delete_acl_request : acl_name:string_ -> unit -> delete_acl_request
val make_create_user_response : ?user:user -> unit -> create_user_response

val make_create_user_request :
  ?tags:tag_list ->
  user_name:user_name ->
  authentication_mode:authentication_mode ->
  access_string:access_string ->
  unit ->
  create_user_request

val make_create_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> create_subnet_group_response

val make_create_subnet_group_request :
  ?description:string_ ->
  ?tags:tag_list ->
  subnet_group_name:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_subnet_group_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  cluster_name:string_ ->
  snapshot_name:string_ ->
  unit ->
  create_snapshot_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> create_parameter_group_response

val make_create_parameter_group_request :
  ?description:string_ ->
  ?tags:tag_list ->
  parameter_group_name:string_ ->
  family:string_ ->
  unit ->
  create_parameter_group_request

val make_create_multi_region_cluster_response :
  ?multi_region_cluster:multi_region_cluster -> unit -> create_multi_region_cluster_response

val make_create_multi_region_cluster_request :
  ?description:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?multi_region_parameter_group_name:string_ ->
  ?num_shards:integer_optional ->
  ?tls_enabled:boolean_optional ->
  ?tags:tag_list ->
  multi_region_cluster_name_suffix:string_ ->
  node_type:string_ ->
  unit ->
  create_multi_region_cluster_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?multi_region_cluster_name:string_ ->
  ?parameter_group_name:string_ ->
  ?description:string_ ->
  ?num_shards:integer_optional ->
  ?num_replicas_per_shard:integer_optional ->
  ?subnet_group_name:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?maintenance_window:string_ ->
  ?port:integer_optional ->
  ?sns_topic_arn:string_ ->
  ?tls_enabled:boolean_optional ->
  ?kms_key_id:string_ ->
  ?snapshot_arns:snapshot_arns_list ->
  ?snapshot_name:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?tags:tag_list ->
  ?snapshot_window:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?data_tiering:boolean_optional ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  cluster_name:string_ ->
  node_type:string_ ->
  acl_name:acl_name ->
  unit ->
  create_cluster_request

val make_create_acl_response : ?ac_l:ac_l -> unit -> create_acl_response

val make_create_acl_request :
  ?user_names:user_name_list_input ->
  ?tags:tag_list ->
  acl_name:string_ ->
  unit ->
  create_acl_request

val make_copy_snapshot_response : ?snapshot:snapshot -> unit -> copy_snapshot_response

val make_copy_snapshot_request :
  ?target_bucket:target_bucket ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_list ->
  source_snapshot_name:string_ ->
  target_snapshot_name:string_ ->
  unit ->
  copy_snapshot_request

val make_unprocessed_cluster :
  ?cluster_name:string_ ->
  ?error_type:string_ ->
  ?error_message:string_ ->
  unit ->
  unprocessed_cluster

val make_batch_update_cluster_response :
  ?processed_clusters:cluster_list ->
  ?unprocessed_clusters:unprocessed_cluster_list ->
  unit ->
  batch_update_cluster_response

val make_service_update_request :
  ?service_update_name_to_apply:string_ -> unit -> service_update_request

val make_batch_update_cluster_request :
  ?service_update:service_update_request ->
  cluster_names:cluster_name_list ->
  unit ->
  batch_update_cluster_request
