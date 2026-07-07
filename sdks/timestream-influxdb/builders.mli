open Types

val make_s3_configuration :
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  bucket_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  s3_configuration

val make_log_delivery_configuration :
  s3_configuration:s3_configuration -> unit -> log_delivery_configuration

val make_maintenance_schedule :
  preferred_maintenance_window:maintenance_window ->
  timezone:iana_timezone ->
  unit ->
  maintenance_schedule

val make_update_db_instance_output :
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?db_cluster_id:db_cluster_id ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  update_db_instance_output

val make_update_db_instance_input :
  ?maintenance_schedule:maintenance_schedule ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?deployment_type:deployment_type ->
  ?db_instance_type:db_instance_type ->
  ?port:port ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?log_delivery_configuration:log_delivery_configuration ->
  identifier:db_instance_identifier ->
  unit ->
  update_db_instance_input

val make_update_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> update_db_cluster_output

val make_update_db_cluster_input :
  ?maintenance_schedule:maintenance_schedule ->
  ?failover_mode:failover_mode ->
  ?db_instance_type:db_instance_type ->
  ?port:port ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?log_delivery_configuration:log_delivery_configuration ->
  db_cluster_id:db_cluster_id ->
  unit ->
  update_db_cluster_input

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_request :
  tags:request_tag_map -> resource_arn:arn -> unit -> tag_resource_request

val make_reboot_db_instance_output :
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?db_cluster_id:db_cluster_id ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  reboot_db_instance_output

val make_reboot_db_instance_input :
  identifier:db_instance_identifier -> unit -> reboot_db_instance_input

val make_reboot_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> reboot_db_cluster_output

val make_reboot_db_cluster_input :
  ?instance_ids:db_instance_id_list ->
  db_cluster_id:db_cluster_id ->
  unit ->
  reboot_db_cluster_input

val make_duration :
  value:Smaws_Lib.Smithy_api.Types.long -> duration_type:duration_type -> unit -> duration

val make_influx_d_bv2_parameters :
  ?ui_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?storage_wal_max_write_delay:duration ->
  ?storage_wal_max_concurrent_writes:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_series_id_set_cache_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_series_file_max_concurrent_snapshot_compactions:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_retention_check_interval:duration ->
  ?storage_no_validate_field_size:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?storage_max_index_log_file_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_max_concurrent_compactions:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_compact_throughput_burst:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_compact_full_write_cold_duration:duration ->
  ?storage_cache_snapshot_write_cold_duration:duration ->
  ?storage_cache_snapshot_memory_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_cache_max_memory_size:Smaws_Lib.Smithy_api.Types.long ->
  ?session_renew_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?session_length:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?query_max_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?query_initial_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?pprof_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?influxql_max_select_series:Smaws_Lib.Smithy_api.Types.long ->
  ?influxql_max_select_point:Smaws_Lib.Smithy_api.Types.long ->
  ?influxql_max_select_buckets:Smaws_Lib.Smithy_api.Types.long ->
  ?http_write_timeout:duration ->
  ?http_read_timeout:duration ->
  ?http_read_header_timeout:duration ->
  ?http_idle_timeout:duration ->
  ?metrics_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tracing_type:tracing_type ->
  ?query_queue_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_concurrency:Smaws_Lib.Smithy_api.Types.integer ->
  ?no_tasks:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?log_level:log_level ->
  ?flux_log_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  influx_d_bv2_parameters

val make_influx_d_bv3_core_parameters :
  ?hard_delete_default_duration:duration ->
  ?delete_grace_period:duration ->
  ?retention_check_interval:duration ->
  ?gen1_lookback_duration:duration ->
  ?table_index_cache_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_max_entries:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_replay_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_replay_fail_on_error:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_size:percent_or_absolute_long ->
  ?exec_mem_pool_bytes:percent_or_absolute_long ->
  ?gen1_duration:duration ->
  ?distinct_cache_eviction_interval:duration ->
  ?last_cache_eviction_interval:duration ->
  ?parquet_mem_cache_query_path_duration:duration ->
  ?disable_parquet_mem_cache:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_prune_interval:duration ->
  ?parquet_mem_cache_prune_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?preemptive_cache_age:duration ->
  ?snapshotted_wal_files_to_keep:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_max_write_buffer_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_snapshot_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?force_snapshot_mem_threshold:percent_or_absolute_long ->
  ?max_http_request_size:Smaws_Lib.Smithy_api.Types.long ->
  ?data_fusion_config:Smaws_Lib.Smithy_api.Types.string_ ->
  ?data_fusion_use_cached_parquet_loader:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_max_parquet_fanout:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_priority:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_keep_alive:duration ->
  ?data_fusion_runtime_max_io_events_per_tick:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_blocking_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_global_queue_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_event_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_disable_lifo_slot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_runtime_type:data_fusion_runtime_type ->
  ?data_fusion_num_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?log_format:log_formats ->
  ?log_filter:Smaws_Lib.Smithy_api.Types.string_ ->
  ?query_log_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_file_limit:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  influx_d_bv3_core_parameters

val make_influx_d_bv3_enterprise_parameters :
  ?catalog_sync_interval:duration ->
  ?replication_interval:duration ->
  ?distinct_value_cache_disable_from_history:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?last_value_cache_disable_from_history:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?compaction_check_interval:duration ->
  ?compaction_cleanup_wait:duration ->
  ?compaction_multipliers:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compaction_gen2_duration:duration ->
  ?compaction_max_num_files_per_plan:Smaws_Lib.Smithy_api.Types.integer ->
  ?compaction_row_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?hard_delete_default_duration:duration ->
  ?delete_grace_period:duration ->
  ?retention_check_interval:duration ->
  ?gen1_lookback_duration:duration ->
  ?table_index_cache_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_max_entries:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_replay_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_replay_fail_on_error:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_size:percent_or_absolute_long ->
  ?exec_mem_pool_bytes:percent_or_absolute_long ->
  ?gen1_duration:duration ->
  ?distinct_cache_eviction_interval:duration ->
  ?last_cache_eviction_interval:duration ->
  ?parquet_mem_cache_query_path_duration:duration ->
  ?disable_parquet_mem_cache:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_prune_interval:duration ->
  ?parquet_mem_cache_prune_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?preemptive_cache_age:duration ->
  ?snapshotted_wal_files_to_keep:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_max_write_buffer_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_snapshot_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?force_snapshot_mem_threshold:percent_or_absolute_long ->
  ?max_http_request_size:Smaws_Lib.Smithy_api.Types.long ->
  ?data_fusion_config:Smaws_Lib.Smithy_api.Types.string_ ->
  ?data_fusion_use_cached_parquet_loader:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_max_parquet_fanout:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_priority:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_keep_alive:duration ->
  ?data_fusion_runtime_max_io_events_per_tick:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_blocking_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_global_queue_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_event_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_disable_lifo_slot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_runtime_type:data_fusion_runtime_type ->
  ?data_fusion_num_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?log_format:log_formats ->
  ?log_filter:Smaws_Lib.Smithy_api.Types.string_ ->
  ?query_log_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_file_limit:Smaws_Lib.Smithy_api.Types.integer ->
  dedicated_compactor:Smaws_Lib.Smithy_api.Types.boolean_ ->
  query_only_instances:Smaws_Lib.Smithy_api.Types.integer ->
  ingest_query_instances:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  influx_d_bv3_enterprise_parameters

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_db_parameter_group_summary :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:arn ->
  name:db_parameter_group_name ->
  id:db_parameter_group_id ->
  unit ->
  db_parameter_group_summary

val make_list_db_parameter_groups_output :
  ?next_token:next_token ->
  items:db_parameter_group_summary_list ->
  unit ->
  list_db_parameter_groups_output

val make_list_db_parameter_groups_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_db_parameter_groups_input

val make_db_instance_summary :
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  db_instance_summary

val make_list_db_instances_output :
  ?next_token:next_token -> items:db_instance_summary_list -> unit -> list_db_instances_output

val make_list_db_instances_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_db_instances_input

val make_db_instance_for_cluster_summary :
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  db_instance_for_cluster_summary

val make_list_db_instances_for_cluster_output :
  ?next_token:next_token ->
  items:db_instance_for_cluster_summary_list ->
  unit ->
  list_db_instances_for_cluster_output

val make_list_db_instances_for_cluster_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  db_cluster_id:db_cluster_id ->
  unit ->
  list_db_instances_for_cluster_input

val make_db_cluster_summary :
  ?engine_type:engine_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?deployment_type:cluster_deployment_type ->
  ?port:port ->
  ?reader_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:cluster_status ->
  arn:arn ->
  name:db_cluster_name ->
  id:db_cluster_id ->
  unit ->
  db_cluster_summary

val make_list_db_clusters_output :
  ?next_token:next_token -> items:db_cluster_summary_list -> unit -> list_db_clusters_output

val make_list_db_clusters_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_db_clusters_input

val make_get_db_parameter_group_output :
  ?parameters:parameters ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:arn ->
  name:db_parameter_group_name ->
  id:db_parameter_group_id ->
  unit ->
  get_db_parameter_group_output

val make_get_db_parameter_group_input :
  identifier:db_parameter_group_identifier -> unit -> get_db_parameter_group_input

val make_get_db_instance_output :
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?db_cluster_id:db_cluster_id ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  get_db_instance_output

val make_get_db_instance_input : identifier:db_instance_identifier -> unit -> get_db_instance_input

val make_cluster_configuration :
  ?dedicated_compactor:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_only_instances:Smaws_Lib.Smithy_api.Types.integer ->
  ?ingest_query_instances:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  cluster_configuration

val make_get_db_cluster_output :
  ?cluster_configuration:cluster_configuration ->
  ?failover_mode:failover_mode ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?vpc_subnet_ids:vpc_subnet_id_list ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?engine_type:engine_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?deployment_type:cluster_deployment_type ->
  ?port:port ->
  ?reader_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:cluster_status ->
  arn:arn ->
  name:db_cluster_name ->
  id:db_cluster_id ->
  unit ->
  get_db_cluster_output

val make_get_db_cluster_input : db_cluster_id:db_cluster_id -> unit -> get_db_cluster_input

val make_delete_db_instance_output :
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?db_cluster_id:db_cluster_id ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  delete_db_instance_output

val make_delete_db_instance_input :
  identifier:db_instance_identifier -> unit -> delete_db_instance_input

val make_delete_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> delete_db_cluster_output

val make_delete_db_cluster_input : db_cluster_id:db_cluster_id -> unit -> delete_db_cluster_input

val make_create_db_parameter_group_output :
  ?parameters:parameters ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  arn:arn ->
  name:db_parameter_group_name ->
  id:db_parameter_group_id ->
  unit ->
  create_db_parameter_group_output

val make_create_db_parameter_group_input :
  ?tags:request_tag_map ->
  ?parameters:parameters ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  name:db_parameter_group_name ->
  unit ->
  create_db_parameter_group_input

val make_create_db_instance_output :
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_schedule:maintenance_schedule ->
  ?instance_modes:instance_mode_list ->
  ?instance_mode:instance_mode ->
  ?db_cluster_id:db_cluster_id ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:deployment_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?port:port ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:status ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  arn:arn ->
  name:db_instance_name ->
  id:db_instance_id ->
  unit ->
  create_db_instance_output

val make_create_db_instance_input :
  ?network_type:network_type ->
  ?port:port ->
  ?tags:request_tag_map ->
  ?maintenance_schedule:maintenance_schedule ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?deployment_type:deployment_type ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?db_storage_type:db_storage_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?bucket:bucket ->
  ?organization:organization ->
  ?username:username ->
  allocated_storage:allocated_storage ->
  vpc_security_group_ids:vpc_security_group_id_list ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  db_instance_type:db_instance_type ->
  password:password ->
  name:db_instance_name ->
  unit ->
  create_db_instance_input

val make_create_db_cluster_output :
  ?db_cluster_status:cluster_status ->
  ?db_cluster_id:db_cluster_id ->
  unit ->
  create_db_cluster_output

val make_create_db_cluster_input :
  ?tags:request_tag_map ->
  ?maintenance_schedule:maintenance_schedule ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?failover_mode:failover_mode ->
  ?deployment_type:cluster_deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?network_type:network_type ->
  ?allocated_storage:allocated_storage ->
  ?db_storage_type:db_storage_type ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?port:port ->
  ?bucket:bucket ->
  ?organization:organization ->
  ?password:password ->
  ?username:username ->
  vpc_security_group_ids:vpc_security_group_id_list ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  db_instance_type:db_instance_type ->
  name:db_cluster_name ->
  unit ->
  create_db_cluster_input
