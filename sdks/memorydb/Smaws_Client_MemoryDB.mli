(** MemoryDB client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
