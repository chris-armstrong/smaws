open Types

val make_update_table_response : resource_arn:ar_n -> unit -> update_table_response

val make_column_definition :
  type_:generic_string -> name:generic_string -> unit -> column_definition

val make_capacity_specification :
  ?write_capacity_units:capacity_units ->
  ?read_capacity_units:capacity_units ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification

val make_encryption_specification :
  ?kms_key_identifier:kms_key_ar_n -> type_:encryption_type -> unit -> encryption_specification

val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit -> point_in_time_recovery

val make_time_to_live : status:time_to_live_status -> unit -> time_to_live

val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit -> client_side_timestamps

val make_target_tracking_scaling_policy_configuration :
  ?scale_out_cooldown:integer_object ->
  ?scale_in_cooldown:integer_object ->
  ?disable_scale_in:boolean_object ->
  target_value:double_object ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  unit ->
  auto_scaling_policy

val make_auto_scaling_settings :
  ?scaling_policy:auto_scaling_policy ->
  ?maximum_units:capacity_units ->
  ?minimum_units:capacity_units ->
  ?auto_scaling_disabled:boolean_object ->
  unit ->
  auto_scaling_settings

val make_auto_scaling_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?write_capacity_auto_scaling:auto_scaling_settings ->
  unit ->
  auto_scaling_specification

val make_replica_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?read_capacity_units:capacity_units ->
  region:region ->
  unit ->
  replica_specification

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_cdc_specification :
  ?propagate_tags:cdc_propagate_tags ->
  ?tags:tag_list ->
  ?view_type:view_type ->
  status:cdc_status ->
  unit ->
  cdc_specification

val make_update_table_request :
  ?cdc_specification:cdc_specification ->
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?add_columns:column_definition_list ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  update_table_request

val make_update_keyspace_response : resource_arn:ar_n -> unit -> update_keyspace_response

val make_replication_specification :
  ?region_list:region_list -> replication_strategy:rs -> unit -> replication_specification

val make_update_keyspace_request :
  ?client_side_timestamps:client_side_timestamps ->
  replication_specification:replication_specification ->
  keyspace_name:keyspace_name ->
  unit ->
  update_keyspace_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tags:tag_list -> resource_arn:ar_n -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tag_list -> resource_arn:ar_n -> unit -> tag_resource_request

val make_table_summary :
  resource_arn:ar_n -> table_name:table_name -> keyspace_name:keyspace_name -> unit -> table_summary

val make_static_column : name:generic_string -> unit -> static_column
val make_partition_key : name:generic_string -> unit -> partition_key
val make_clustering_key : order_by:sort_order -> name:generic_string -> unit -> clustering_key

val make_schema_definition :
  ?static_columns:static_column_list ->
  ?clustering_keys:clustering_key_list ->
  partition_keys:partition_key_list ->
  all_columns:column_definition_list ->
  unit ->
  schema_definition

val make_restore_table_response : restored_table_ar_n:ar_n -> unit -> restore_table_response

val make_restore_table_request :
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?tags_override:tag_list ->
  ?point_in_time_recovery_override:point_in_time_recovery ->
  ?encryption_specification_override:encryption_specification ->
  ?capacity_specification_override:capacity_specification ->
  ?restore_timestamp:timestamp ->
  target_table_name:table_name ->
  target_keyspace_name:keyspace_name ->
  source_table_name:table_name ->
  source_keyspace_name:keyspace_name ->
  unit ->
  restore_table_request

val make_replication_group_status :
  ?tables_replication_progress:tables_replication_progress ->
  keyspace_status:keyspace_status ->
  region:region ->
  unit ->
  replication_group_status

val make_capacity_specification_summary :
  ?last_update_to_pay_per_request_timestamp:timestamp ->
  ?write_capacity_units:capacity_units ->
  ?read_capacity_units:capacity_units ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification_summary

val make_replica_specification_summary :
  ?capacity_specification:capacity_specification_summary ->
  ?status:table_status ->
  ?region:region ->
  unit ->
  replica_specification_summary

val make_replica_auto_scaling_specification :
  ?auto_scaling_specification:auto_scaling_specification ->
  ?region:region ->
  unit ->
  replica_auto_scaling_specification

val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:timestamp ->
  status:point_in_time_recovery_status ->
  unit ->
  point_in_time_recovery_summary

val make_list_types_response :
  ?next_token:next_token -> types:type_name_list -> unit -> list_types_response

val make_list_types_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  keyspace_name:keyspace_name ->
  unit ->
  list_types_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:ar_n ->
  unit ->
  list_tags_for_resource_request

val make_list_tables_response :
  ?tables:table_summary_list -> ?next_token:next_token -> unit -> list_tables_response

val make_list_tables_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  keyspace_name:keyspace_name ->
  unit ->
  list_tables_request

val make_keyspace_summary :
  ?replication_regions:region_list ->
  replication_strategy:rs ->
  resource_arn:ar_n ->
  keyspace_name:keyspace_name ->
  unit ->
  keyspace_summary

val make_list_keyspaces_response :
  ?next_token:next_token -> keyspaces:keyspace_summary_list -> unit -> list_keyspaces_response

val make_list_keyspaces_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_keyspaces_request

val make_field_definition : type_:generic_string -> name:generic_string -> unit -> field_definition

val make_get_type_response :
  ?max_nesting_depth:depth ->
  ?direct_parent_types:type_name_list ->
  ?direct_referring_tables:table_name_list ->
  ?status:type_status ->
  ?last_modified_timestamp:timestamp ->
  ?field_definitions:field_list ->
  keyspace_arn:ar_n ->
  type_name:type_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_type_response

val make_get_type_request :
  type_name:type_name -> keyspace_name:keyspace_name -> unit -> get_type_request

val make_get_table_auto_scaling_settings_response :
  ?replica_specifications:replica_auto_scaling_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  resource_arn:ar_n ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_auto_scaling_settings_response

val make_get_table_auto_scaling_settings_request :
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_auto_scaling_settings_request

val make_comment : message:Smaws_Lib.Smithy_api.Types.string_ -> unit -> comment

val make_cdc_specification_summary :
  ?view_type:view_type -> status:cdc_status -> unit -> cdc_specification_summary

val make_get_table_response :
  ?cdc_specification:cdc_specification_summary ->
  ?latest_stream_arn:stream_arn ->
  ?replica_specifications:replica_specification_summary_list ->
  ?client_side_timestamps:client_side_timestamps ->
  ?comment:comment ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery_summary ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification_summary ->
  ?schema_definition:schema_definition ->
  ?status:table_status ->
  ?creation_timestamp:timestamp ->
  resource_arn:ar_n ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  get_table_response

val make_get_table_request :
  table_name:table_name -> keyspace_name:keyspace_name -> unit -> get_table_request

val make_get_keyspace_response :
  ?replication_group_statuses:replication_group_status_list ->
  ?replication_regions:region_list ->
  replication_strategy:rs ->
  resource_arn:ar_n ->
  keyspace_name:keyspace_name ->
  unit ->
  get_keyspace_response

val make_get_keyspace_request : keyspace_name:keyspace_name -> unit -> get_keyspace_request

val make_delete_type_response :
  type_name:type_name -> keyspace_arn:ar_n -> unit -> delete_type_response

val make_delete_type_request :
  type_name:type_name -> keyspace_name:keyspace_name -> unit -> delete_type_request

val make_delete_table_response : unit -> unit

val make_delete_table_request :
  table_name:table_name -> keyspace_name:keyspace_name -> unit -> delete_table_request

val make_delete_keyspace_response : unit -> unit
val make_delete_keyspace_request : keyspace_name:keyspace_name -> unit -> delete_keyspace_request

val make_create_type_response :
  type_name:type_name -> keyspace_arn:ar_n -> unit -> create_type_response

val make_create_type_request :
  field_definitions:field_list ->
  type_name:type_name ->
  keyspace_name:keyspace_name ->
  unit ->
  create_type_request

val make_create_table_response : resource_arn:ar_n -> unit -> create_table_response

val make_create_table_request :
  ?cdc_specification:cdc_specification ->
  ?replica_specifications:replica_specification_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?tags:tag_list ->
  ?default_time_to_live:default_time_to_live ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?comment:comment ->
  schema_definition:schema_definition ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  unit ->
  create_table_request

val make_create_keyspace_response : resource_arn:ar_n -> unit -> create_keyspace_response

val make_create_keyspace_request :
  ?replication_specification:replication_specification ->
  ?tags:tag_list ->
  keyspace_name:keyspace_name ->
  unit ->
  create_keyspace_request
