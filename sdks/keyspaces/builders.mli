open Types

val make_target_tracking_scaling_policy_configuration :
  ?disable_scale_in:boolean_object ->
  ?scale_in_cooldown:integer_object ->
  ?scale_out_cooldown:integer_object ->
  target_value:double_object ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  unit ->
  auto_scaling_policy

val make_auto_scaling_settings :
  ?auto_scaling_disabled:boolean_object ->
  ?minimum_units:capacity_units ->
  ?maximum_units:capacity_units ->
  ?scaling_policy:auto_scaling_policy ->
  unit ->
  auto_scaling_settings

val make_auto_scaling_specification :
  ?write_capacity_auto_scaling:auto_scaling_settings ->
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  unit ->
  auto_scaling_specification

val make_capacity_specification :
  ?read_capacity_units:capacity_units ->
  ?write_capacity_units:capacity_units ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification

val make_capacity_specification_summary :
  ?read_capacity_units:capacity_units ->
  ?write_capacity_units:capacity_units ->
  ?last_update_to_pay_per_request_timestamp:timestamp ->
  throughput_mode:throughput_mode ->
  unit ->
  capacity_specification_summary

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_cdc_specification :
  ?view_type:view_type ->
  ?tags:tag_list ->
  ?propagate_tags:cdc_propagate_tags ->
  status:cdc_status ->
  unit ->
  cdc_specification

val make_cdc_specification_summary :
  ?view_type:view_type -> status:cdc_status -> unit -> cdc_specification_summary

val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit -> client_side_timestamps

val make_clustering_key : name:generic_string -> order_by:sort_order -> unit -> clustering_key

val make_column_definition :
  name:generic_string -> type_:generic_string -> unit -> column_definition

val make_comment : message:Smaws_Lib.Smithy_api.Types.string_ -> unit -> comment
val make_create_keyspace_response : resource_arn:ar_n -> unit -> create_keyspace_response

val make_replication_specification :
  ?region_list:region_list -> replication_strategy:rs -> unit -> replication_specification

val make_create_keyspace_request :
  ?tags:tag_list ->
  ?replication_specification:replication_specification ->
  keyspace_name:keyspace_name ->
  unit ->
  create_keyspace_request

val make_create_table_response : resource_arn:ar_n -> unit -> create_table_response

val make_warm_throughput_specification :
  ?read_units_per_second:Smaws_Lib.Smithy_api.Types.long ->
  ?write_units_per_second:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  warm_throughput_specification

val make_replica_specification :
  ?read_capacity_units:capacity_units ->
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  region:region ->
  unit ->
  replica_specification

val make_time_to_live : status:time_to_live_status -> unit -> time_to_live

val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit -> point_in_time_recovery

val make_encryption_specification :
  ?kms_key_identifier:kms_key_ar_n -> type_:encryption_type -> unit -> encryption_specification

val make_static_column : name:generic_string -> unit -> static_column
val make_partition_key : name:generic_string -> unit -> partition_key

val make_schema_definition :
  ?clustering_keys:clustering_key_list ->
  ?static_columns:static_column_list ->
  all_columns:column_definition_list ->
  partition_keys:partition_key_list ->
  unit ->
  schema_definition

val make_create_table_request :
  ?comment:comment ->
  ?capacity_specification:capacity_specification ->
  ?encryption_specification:encryption_specification ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?ttl:time_to_live ->
  ?default_time_to_live:default_time_to_live ->
  ?tags:tag_list ->
  ?client_side_timestamps:client_side_timestamps ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?replica_specifications:replica_specification_list ->
  ?cdc_specification:cdc_specification ->
  ?warm_throughput_specification:warm_throughput_specification ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  schema_definition:schema_definition ->
  unit ->
  create_table_request

val make_create_type_response :
  keyspace_arn:ar_n -> type_name:type_name -> unit -> create_type_response

val make_field_definition : name:generic_string -> type_:generic_string -> unit -> field_definition

val make_create_type_request :
  keyspace_name:keyspace_name ->
  type_name:type_name ->
  field_definitions:field_list ->
  unit ->
  create_type_request

val make_delete_keyspace_response : unit -> unit
val make_delete_keyspace_request : keyspace_name:keyspace_name -> unit -> delete_keyspace_request
val make_delete_table_response : unit -> unit

val make_delete_table_request :
  keyspace_name:keyspace_name -> table_name:table_name -> unit -> delete_table_request

val make_delete_type_response :
  keyspace_arn:ar_n -> type_name:type_name -> unit -> delete_type_response

val make_delete_type_request :
  keyspace_name:keyspace_name -> type_name:type_name -> unit -> delete_type_request

val make_replication_group_status :
  ?tables_replication_progress:tables_replication_progress ->
  region:region ->
  keyspace_status:keyspace_status ->
  unit ->
  replication_group_status

val make_get_keyspace_response :
  ?replication_regions:region_list ->
  ?replication_group_statuses:replication_group_status_list ->
  keyspace_name:keyspace_name ->
  resource_arn:ar_n ->
  replication_strategy:rs ->
  unit ->
  get_keyspace_response

val make_get_keyspace_request : keyspace_name:keyspace_name -> unit -> get_keyspace_request

val make_warm_throughput_specification_summary :
  read_units_per_second:Smaws_Lib.Smithy_api.Types.long ->
  write_units_per_second:Smaws_Lib.Smithy_api.Types.long ->
  status:warm_throughput_status ->
  unit ->
  warm_throughput_specification_summary

val make_replica_specification_summary :
  ?region:region ->
  ?status:table_status ->
  ?capacity_specification:capacity_specification_summary ->
  ?warm_throughput_specification:warm_throughput_specification_summary ->
  unit ->
  replica_specification_summary

val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:timestamp ->
  status:point_in_time_recovery_status ->
  unit ->
  point_in_time_recovery_summary

val make_get_table_response :
  ?creation_timestamp:timestamp ->
  ?status:table_status ->
  ?schema_definition:schema_definition ->
  ?capacity_specification:capacity_specification_summary ->
  ?encryption_specification:encryption_specification ->
  ?point_in_time_recovery:point_in_time_recovery_summary ->
  ?ttl:time_to_live ->
  ?default_time_to_live:default_time_to_live ->
  ?comment:comment ->
  ?client_side_timestamps:client_side_timestamps ->
  ?replica_specifications:replica_specification_summary_list ->
  ?latest_stream_arn:stream_arn ->
  ?cdc_specification:cdc_specification_summary ->
  ?warm_throughput_specification:warm_throughput_specification_summary ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  resource_arn:ar_n ->
  unit ->
  get_table_response

val make_get_table_request :
  keyspace_name:keyspace_name -> table_name:table_name -> unit -> get_table_request

val make_replica_auto_scaling_specification :
  ?region:region ->
  ?auto_scaling_specification:auto_scaling_specification ->
  unit ->
  replica_auto_scaling_specification

val make_get_table_auto_scaling_settings_response :
  ?auto_scaling_specification:auto_scaling_specification ->
  ?replica_specifications:replica_auto_scaling_specification_list ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  resource_arn:ar_n ->
  unit ->
  get_table_auto_scaling_settings_response

val make_get_table_auto_scaling_settings_request :
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  unit ->
  get_table_auto_scaling_settings_request

val make_get_type_response :
  ?field_definitions:field_list ->
  ?last_modified_timestamp:timestamp ->
  ?status:type_status ->
  ?direct_referring_tables:table_name_list ->
  ?direct_parent_types:type_name_list ->
  ?max_nesting_depth:depth ->
  keyspace_name:keyspace_name ->
  type_name:type_name ->
  keyspace_arn:ar_n ->
  unit ->
  get_type_response

val make_get_type_request :
  keyspace_name:keyspace_name -> type_name:type_name -> unit -> get_type_request

val make_keyspace_summary :
  ?replication_regions:region_list ->
  keyspace_name:keyspace_name ->
  resource_arn:ar_n ->
  replication_strategy:rs ->
  unit ->
  keyspace_summary

val make_update_table_response : resource_arn:ar_n -> unit -> update_table_response

val make_update_table_request :
  ?add_columns:column_definition_list ->
  ?capacity_specification:capacity_specification ->
  ?encryption_specification:encryption_specification ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?ttl:time_to_live ->
  ?default_time_to_live:default_time_to_live ->
  ?client_side_timestamps:client_side_timestamps ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?replica_specifications:replica_specification_list ->
  ?cdc_specification:cdc_specification ->
  ?warm_throughput_specification:warm_throughput_specification ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  unit ->
  update_table_request

val make_update_keyspace_response : resource_arn:ar_n -> unit -> update_keyspace_response

val make_update_keyspace_request :
  ?client_side_timestamps:client_side_timestamps ->
  keyspace_name:keyspace_name ->
  replication_specification:replication_specification ->
  unit ->
  update_keyspace_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:ar_n -> tags:tag_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:ar_n -> tags:tag_list -> unit -> tag_resource_request
val make_restore_table_response : restored_table_ar_n:ar_n -> unit -> restore_table_response

val make_restore_table_request :
  ?restore_timestamp:timestamp ->
  ?capacity_specification_override:capacity_specification ->
  ?encryption_specification_override:encryption_specification ->
  ?point_in_time_recovery_override:point_in_time_recovery ->
  ?tags_override:tag_list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?replica_specifications:replica_specification_list ->
  source_keyspace_name:keyspace_name ->
  source_table_name:table_name ->
  target_keyspace_name:keyspace_name ->
  target_table_name:table_name ->
  unit ->
  restore_table_request

val make_list_types_response :
  ?next_token:next_token -> types:type_name_list -> unit -> list_types_response

val make_list_types_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  keyspace_name:keyspace_name ->
  unit ->
  list_types_request

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:ar_n ->
  unit ->
  list_tags_for_resource_request

val make_table_summary :
  keyspace_name:keyspace_name -> table_name:table_name -> resource_arn:ar_n -> unit -> table_summary

val make_list_tables_response :
  ?next_token:next_token -> ?tables:table_summary_list -> unit -> list_tables_response

val make_list_tables_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  keyspace_name:keyspace_name ->
  unit ->
  list_tables_request

val make_list_keyspaces_response :
  ?next_token:next_token -> keyspaces:keyspace_summary_list -> unit -> list_keyspaces_response

val make_list_keyspaces_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_keyspaces_request
