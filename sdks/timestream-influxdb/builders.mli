open Types

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_request :
  resource_arn:arn -> tags:request_tag_map -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_cluster_configuration :
  ?ingest_query_instances:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_only_instances:Smaws_Lib.Smithy_api.Types.integer ->
  ?dedicated_compactor:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  cluster_configuration

val make_create_db_cluster_output :
  ?db_cluster_id:db_cluster_id ->
  ?db_cluster_status:cluster_status ->
  unit ->
  create_db_cluster_output

val make_maintenance_schedule :
  timezone:iana_timezone ->
  preferred_maintenance_window:maintenance_window ->
  unit ->
  maintenance_schedule

val make_s3_configuration :
  bucket_name:Smaws_Lib.Smithy_api.Types.string_ ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  s3_configuration

val make_log_delivery_configuration :
  s3_configuration:s3_configuration -> unit -> log_delivery_configuration

val make_create_db_cluster_input :
  ?username:username ->
  ?password:password ->
  ?organization:organization ->
  ?bucket:bucket ->
  ?port:port ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?network_type:network_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deployment_type:cluster_deployment_type ->
  ?failover_mode:failover_mode ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?maintenance_schedule:maintenance_schedule ->
  ?tags:request_tag_map ->
  name:db_cluster_name ->
  db_instance_type:db_instance_type ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  vpc_security_group_ids:vpc_security_group_id_list ->
  unit ->
  create_db_cluster_input

val make_create_db_instance_output :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_cluster_id:db_cluster_id ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  unit ->
  create_db_instance_output

val make_create_db_instance_input :
  ?username:username ->
  ?organization:organization ->
  ?bucket:bucket ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?db_storage_type:db_storage_type ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?deployment_type:deployment_type ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?maintenance_schedule:maintenance_schedule ->
  ?tags:request_tag_map ->
  ?port:port ->
  ?network_type:network_type ->
  name:db_instance_name ->
  password:password ->
  db_instance_type:db_instance_type ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  vpc_security_group_ids:vpc_security_group_id_list ->
  allocated_storage:allocated_storage ->
  unit ->
  create_db_instance_input

val make_duration :
  duration_type:duration_type -> value:Smaws_Lib.Smithy_api.Types.long -> unit -> duration

val make_influx_d_bv3_enterprise_parameters :
  ?query_file_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_log_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?log_filter:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_format:log_formats ->
  ?data_fusion_num_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_type:data_fusion_runtime_type ->
  ?data_fusion_runtime_disable_lifo_slot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_runtime_event_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_global_queue_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_blocking_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_io_events_per_tick:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_keep_alive:duration ->
  ?data_fusion_runtime_thread_priority:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_max_parquet_fanout:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_use_cached_parquet_loader:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_config:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_http_request_size:Smaws_Lib.Smithy_api.Types.long ->
  ?force_snapshot_mem_threshold:percent_or_absolute_long ->
  ?wal_snapshot_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_max_write_buffer_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?snapshotted_wal_files_to_keep:Smaws_Lib.Smithy_api.Types.integer ->
  ?preemptive_cache_age:duration ->
  ?parquet_mem_cache_prune_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?parquet_mem_cache_prune_interval:duration ->
  ?disable_parquet_mem_cache:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_query_path_duration:duration ->
  ?last_cache_eviction_interval:duration ->
  ?distinct_cache_eviction_interval:duration ->
  ?gen1_duration:duration ->
  ?exec_mem_pool_bytes:percent_or_absolute_long ->
  ?parquet_mem_cache_size:percent_or_absolute_long ->
  ?wal_replay_fail_on_error:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?wal_replay_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_max_entries:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?gen1_lookback_duration:duration ->
  ?retention_check_interval:duration ->
  ?delete_grace_period:duration ->
  ?hard_delete_default_duration:duration ->
  ?compaction_row_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?compaction_max_num_files_per_plan:Smaws_Lib.Smithy_api.Types.integer ->
  ?compaction_gen2_duration:duration ->
  ?compaction_multipliers:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compaction_cleanup_wait:duration ->
  ?compaction_check_interval:duration ->
  ?last_value_cache_disable_from_history:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?distinct_value_cache_disable_from_history:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?replication_interval:duration ->
  ?catalog_sync_interval:duration ->
  ingest_query_instances:Smaws_Lib.Smithy_api.Types.integer ->
  query_only_instances:Smaws_Lib.Smithy_api.Types.integer ->
  dedicated_compactor:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  influx_d_bv3_enterprise_parameters

val make_influx_d_bv3_core_parameters :
  ?query_file_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_log_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?log_filter:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_format:log_formats ->
  ?data_fusion_num_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_type:data_fusion_runtime_type ->
  ?data_fusion_runtime_disable_lifo_slot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_runtime_event_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_global_queue_interval:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_blocking_threads:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_max_io_events_per_tick:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_runtime_thread_keep_alive:duration ->
  ?data_fusion_runtime_thread_priority:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_max_parquet_fanout:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_fusion_use_cached_parquet_loader:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_fusion_config:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_http_request_size:Smaws_Lib.Smithy_api.Types.long ->
  ?force_snapshot_mem_threshold:percent_or_absolute_long ->
  ?wal_snapshot_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?wal_max_write_buffer_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?snapshotted_wal_files_to_keep:Smaws_Lib.Smithy_api.Types.integer ->
  ?preemptive_cache_age:duration ->
  ?parquet_mem_cache_prune_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?parquet_mem_cache_prune_interval:duration ->
  ?disable_parquet_mem_cache:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?parquet_mem_cache_query_path_duration:duration ->
  ?last_cache_eviction_interval:duration ->
  ?distinct_cache_eviction_interval:duration ->
  ?gen1_duration:duration ->
  ?exec_mem_pool_bytes:percent_or_absolute_long ->
  ?parquet_mem_cache_size:percent_or_absolute_long ->
  ?wal_replay_fail_on_error:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?wal_replay_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_max_entries:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_index_cache_concurrency_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?gen1_lookback_duration:duration ->
  ?retention_check_interval:duration ->
  ?delete_grace_period:duration ->
  ?hard_delete_default_duration:duration ->
  unit ->
  influx_d_bv3_core_parameters

val make_influx_d_bv2_parameters :
  ?flux_log_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?log_level:log_level ->
  ?no_tasks:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_concurrency:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_queue_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?tracing_type:tracing_type ->
  ?metrics_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?http_idle_timeout:duration ->
  ?http_read_header_timeout:duration ->
  ?http_read_timeout:duration ->
  ?http_write_timeout:duration ->
  ?influxql_max_select_buckets:Smaws_Lib.Smithy_api.Types.long ->
  ?influxql_max_select_point:Smaws_Lib.Smithy_api.Types.long ->
  ?influxql_max_select_series:Smaws_Lib.Smithy_api.Types.long ->
  ?pprof_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_initial_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?query_max_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?query_memory_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?session_length:Smaws_Lib.Smithy_api.Types.integer ->
  ?session_renew_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?storage_cache_max_memory_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_cache_snapshot_memory_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_cache_snapshot_write_cold_duration:duration ->
  ?storage_compact_full_write_cold_duration:duration ->
  ?storage_compact_throughput_burst:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_max_concurrent_compactions:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_max_index_log_file_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_no_validate_field_size:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?storage_retention_check_interval:duration ->
  ?storage_series_file_max_concurrent_snapshot_compactions:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_series_id_set_cache_size:Smaws_Lib.Smithy_api.Types.long ->
  ?storage_wal_max_concurrent_writes:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_wal_max_write_delay:duration ->
  ?ui_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  influx_d_bv2_parameters

val make_create_db_parameter_group_output :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?parameters:parameters ->
  id:db_parameter_group_id ->
  name:db_parameter_group_name ->
  arn:arn ->
  unit ->
  create_db_parameter_group_output

val make_create_db_parameter_group_input :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?parameters:parameters ->
  ?tags:request_tag_map ->
  name:db_parameter_group_name ->
  unit ->
  create_db_parameter_group_input

val make_db_cluster_summary :
  ?status:cluster_status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reader_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?deployment_type:cluster_deployment_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?engine_type:engine_type ->
  id:db_cluster_id ->
  name:db_cluster_name ->
  arn:arn ->
  unit ->
  db_cluster_summary

val make_db_instance_for_cluster_summary :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  unit ->
  db_instance_for_cluster_summary

val make_db_instance_summary :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  unit ->
  db_instance_summary

val make_db_parameter_group_summary :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  id:db_parameter_group_id ->
  name:db_parameter_group_name ->
  arn:arn ->
  unit ->
  db_parameter_group_summary

val make_delete_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> delete_db_cluster_output

val make_delete_db_cluster_input : db_cluster_id:db_cluster_id -> unit -> delete_db_cluster_input

val make_delete_db_instance_output :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_cluster_id:db_cluster_id ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  unit ->
  delete_db_instance_output

val make_delete_db_instance_input :
  identifier:db_instance_identifier -> unit -> delete_db_instance_input

val make_get_db_cluster_output :
  ?status:cluster_status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?reader_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?deployment_type:cluster_deployment_type ->
  ?db_instance_type:db_instance_type ->
  ?network_type:network_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?engine_type:engine_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_subnet_ids:vpc_subnet_id_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?failover_mode:failover_mode ->
  ?cluster_configuration:cluster_configuration ->
  id:db_cluster_id ->
  name:db_cluster_name ->
  arn:arn ->
  unit ->
  get_db_cluster_output

val make_get_db_cluster_input : db_cluster_id:db_cluster_id -> unit -> get_db_cluster_input

val make_get_db_instance_output :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_cluster_id:db_cluster_id ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  unit ->
  get_db_instance_output

val make_get_db_instance_input : identifier:db_instance_identifier -> unit -> get_db_instance_input

val make_get_db_parameter_group_output :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?parameters:parameters ->
  id:db_parameter_group_id ->
  name:db_parameter_group_name ->
  arn:arn ->
  unit ->
  get_db_parameter_group_output

val make_get_db_parameter_group_input :
  identifier:db_parameter_group_identifier -> unit -> get_db_parameter_group_input

val make_list_db_clusters_output :
  ?next_token:next_token -> items:db_cluster_summary_list -> unit -> list_db_clusters_output

val make_list_db_clusters_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_db_clusters_input

val make_list_db_instances_output :
  ?next_token:next_token -> items:db_instance_summary_list -> unit -> list_db_instances_output

val make_list_db_instances_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_db_instances_input

val make_list_db_instances_for_cluster_output :
  ?next_token:next_token ->
  items:db_instance_for_cluster_summary_list ->
  unit ->
  list_db_instances_for_cluster_output

val make_list_db_instances_for_cluster_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  db_cluster_id:db_cluster_id ->
  unit ->
  list_db_instances_for_cluster_input

val make_list_db_parameter_groups_output :
  ?next_token:next_token ->
  items:db_parameter_group_summary_list ->
  unit ->
  list_db_parameter_groups_output

val make_list_db_parameter_groups_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_db_parameter_groups_input

val make_reboot_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> reboot_db_cluster_output

val make_reboot_db_cluster_input :
  ?instance_ids:db_instance_id_list ->
  db_cluster_id:db_cluster_id ->
  unit ->
  reboot_db_cluster_input

val make_reboot_db_instance_output :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_cluster_id:db_cluster_id ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  unit ->
  reboot_db_instance_output

val make_reboot_db_instance_input :
  identifier:db_instance_identifier -> unit -> reboot_db_instance_input

val make_update_db_cluster_output :
  ?db_cluster_status:cluster_status -> unit -> update_db_cluster_output

val make_update_db_cluster_input :
  ?log_delivery_configuration:log_delivery_configuration ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?port:port ->
  ?db_instance_type:db_instance_type ->
  ?failover_mode:failover_mode ->
  ?maintenance_schedule:maintenance_schedule ->
  db_cluster_id:db_cluster_id ->
  unit ->
  update_db_cluster_input

val make_update_db_instance_output :
  ?status:status ->
  ?endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:port ->
  ?network_type:network_type ->
  ?db_instance_type:db_instance_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?deployment_type:deployment_type ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?secondary_availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?log_delivery_configuration:log_delivery_configuration ->
  ?influx_auth_parameters_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_cluster_id:db_cluster_id ->
  ?instance_mode:instance_mode ->
  ?instance_modes:instance_mode_list ->
  ?maintenance_schedule:maintenance_schedule ->
  ?last_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_maintenance_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:db_instance_id ->
  name:db_instance_name ->
  arn:arn ->
  vpc_subnet_ids:vpc_subnet_id_list ->
  unit ->
  update_db_instance_output

val make_update_db_instance_input :
  ?log_delivery_configuration:log_delivery_configuration ->
  ?db_parameter_group_identifier:db_parameter_group_identifier ->
  ?port:port ->
  ?db_instance_type:db_instance_type ->
  ?deployment_type:deployment_type ->
  ?db_storage_type:db_storage_type ->
  ?allocated_storage:allocated_storage ->
  ?maintenance_schedule:maintenance_schedule ->
  identifier:db_instance_identifier ->
  unit ->
  update_db_instance_input
