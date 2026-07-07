open Types

let make_s3_configuration ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~bucket_name:(bucket_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ enabled = enabled_; bucket_name = bucket_name_ } : s3_configuration)

let make_log_delivery_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : log_delivery_configuration)

let make_maintenance_schedule
    ~preferred_maintenance_window:(preferred_maintenance_window_ : maintenance_window)
    ~timezone:(timezone_ : iana_timezone) () =
  ({ preferred_maintenance_window = preferred_maintenance_window_; timezone = timezone_ }
    : maintenance_schedule)

let make_update_db_instance_output
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~arn:(arn_ : arn) ~name:(name_ : db_instance_name) ~id:(id_ : db_instance_id) () =
  ({
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     db_cluster_id = db_cluster_id_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     log_delivery_configuration = log_delivery_configuration_;
     secondary_availability_zone = secondary_availability_zone_;
     availability_zone = availability_zone_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : update_db_instance_output)

let make_update_db_instance_input
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option) ?port:(port_ : port option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ~identifier:(identifier_ : db_instance_identifier) () =
  ({
     maintenance_schedule = maintenance_schedule_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     deployment_type = deployment_type_;
     db_instance_type = db_instance_type_;
     port = port_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     log_delivery_configuration = log_delivery_configuration_;
     identifier = identifier_;
   }
    : update_db_instance_input)

let make_update_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : update_db_cluster_output)

let make_update_db_cluster_input
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option) ?port:(port_ : port option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({
     maintenance_schedule = maintenance_schedule_;
     failover_mode = failover_mode_;
     db_instance_type = db_instance_type_;
     port = port_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     log_delivery_configuration = log_delivery_configuration_;
     db_cluster_id = db_cluster_id_;
   }
    : update_db_cluster_input)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~resource_arn:(resource_arn_ : arn)
    () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_request ~tags:(tags_ : request_tag_map) ~resource_arn:(resource_arn_ : arn) ()
    =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_reboot_db_instance_output
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~arn:(arn_ : arn) ~name:(name_ : db_instance_name) ~id:(id_ : db_instance_id) () =
  ({
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     db_cluster_id = db_cluster_id_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     log_delivery_configuration = log_delivery_configuration_;
     secondary_availability_zone = secondary_availability_zone_;
     availability_zone = availability_zone_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : reboot_db_instance_output)

let make_reboot_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : reboot_db_instance_input)

let make_reboot_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : reboot_db_cluster_output)

let make_reboot_db_cluster_input ?instance_ids:(instance_ids_ : db_instance_id_list option)
    ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ instance_ids = instance_ids_; db_cluster_id = db_cluster_id_ } : reboot_db_cluster_input)

let make_duration ~value:(value_ : Smaws_Lib.Smithy_api.Types.long)
    ~duration_type:(duration_type_ : duration_type) () =
  ({ value = value_; duration_type = duration_type_ } : duration)

let make_influx_d_bv2_parameters
    ?ui_disabled:(ui_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?storage_wal_max_write_delay:(storage_wal_max_write_delay_ : duration option)
    ?storage_wal_max_concurrent_writes:
      (storage_wal_max_concurrent_writes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_series_id_set_cache_size:
      (storage_series_id_set_cache_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_series_file_max_concurrent_snapshot_compactions:
      (storage_series_file_max_concurrent_snapshot_compactions_ :
         Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_retention_check_interval:(storage_retention_check_interval_ : duration option)
    ?storage_no_validate_field_size:
      (storage_no_validate_field_size_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?storage_max_index_log_file_size:
      (storage_max_index_log_file_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_max_concurrent_compactions:
      (storage_max_concurrent_compactions_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_compact_throughput_burst:
      (storage_compact_throughput_burst_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_compact_full_write_cold_duration:
      (storage_compact_full_write_cold_duration_ : duration option)
    ?storage_cache_snapshot_write_cold_duration:
      (storage_cache_snapshot_write_cold_duration_ : duration option)
    ?storage_cache_snapshot_memory_size:
      (storage_cache_snapshot_memory_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_cache_max_memory_size:
      (storage_cache_max_memory_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?session_renew_disabled:(session_renew_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?session_length:(session_length_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_memory_bytes:(query_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?query_max_memory_bytes:(query_max_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?query_initial_memory_bytes:
      (query_initial_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?pprof_disabled:(pprof_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?influxql_max_select_series:
      (influxql_max_select_series_ : Smaws_Lib.Smithy_api.Types.long option)
    ?influxql_max_select_point:(influxql_max_select_point_ : Smaws_Lib.Smithy_api.Types.long option)
    ?influxql_max_select_buckets:
      (influxql_max_select_buckets_ : Smaws_Lib.Smithy_api.Types.long option)
    ?http_write_timeout:(http_write_timeout_ : duration option)
    ?http_read_timeout:(http_read_timeout_ : duration option)
    ?http_read_header_timeout:(http_read_header_timeout_ : duration option)
    ?http_idle_timeout:(http_idle_timeout_ : duration option)
    ?metrics_disabled:(metrics_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tracing_type:(tracing_type_ : tracing_type option)
    ?query_queue_size:(query_queue_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_concurrency:(query_concurrency_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?no_tasks:(no_tasks_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?log_level:(log_level_ : log_level option)
    ?flux_log_enabled:(flux_log_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     ui_disabled = ui_disabled_;
     storage_wal_max_write_delay = storage_wal_max_write_delay_;
     storage_wal_max_concurrent_writes = storage_wal_max_concurrent_writes_;
     storage_series_id_set_cache_size = storage_series_id_set_cache_size_;
     storage_series_file_max_concurrent_snapshot_compactions =
       storage_series_file_max_concurrent_snapshot_compactions_;
     storage_retention_check_interval = storage_retention_check_interval_;
     storage_no_validate_field_size = storage_no_validate_field_size_;
     storage_max_index_log_file_size = storage_max_index_log_file_size_;
     storage_max_concurrent_compactions = storage_max_concurrent_compactions_;
     storage_compact_throughput_burst = storage_compact_throughput_burst_;
     storage_compact_full_write_cold_duration = storage_compact_full_write_cold_duration_;
     storage_cache_snapshot_write_cold_duration = storage_cache_snapshot_write_cold_duration_;
     storage_cache_snapshot_memory_size = storage_cache_snapshot_memory_size_;
     storage_cache_max_memory_size = storage_cache_max_memory_size_;
     session_renew_disabled = session_renew_disabled_;
     session_length = session_length_;
     query_memory_bytes = query_memory_bytes_;
     query_max_memory_bytes = query_max_memory_bytes_;
     query_initial_memory_bytes = query_initial_memory_bytes_;
     pprof_disabled = pprof_disabled_;
     influxql_max_select_series = influxql_max_select_series_;
     influxql_max_select_point = influxql_max_select_point_;
     influxql_max_select_buckets = influxql_max_select_buckets_;
     http_write_timeout = http_write_timeout_;
     http_read_timeout = http_read_timeout_;
     http_read_header_timeout = http_read_header_timeout_;
     http_idle_timeout = http_idle_timeout_;
     metrics_disabled = metrics_disabled_;
     tracing_type = tracing_type_;
     query_queue_size = query_queue_size_;
     query_concurrency = query_concurrency_;
     no_tasks = no_tasks_;
     log_level = log_level_;
     flux_log_enabled = flux_log_enabled_;
   }
    : influx_d_bv2_parameters)

let make_influx_d_bv3_core_parameters
    ?hard_delete_default_duration:(hard_delete_default_duration_ : duration option)
    ?delete_grace_period:(delete_grace_period_ : duration option)
    ?retention_check_interval:(retention_check_interval_ : duration option)
    ?gen1_lookback_duration:(gen1_lookback_duration_ : duration option)
    ?table_index_cache_concurrency_limit:
      (table_index_cache_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_max_entries:
      (table_index_cache_max_entries_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_replay_concurrency_limit:
      (wal_replay_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_replay_fail_on_error:
      (wal_replay_fail_on_error_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_size:(parquet_mem_cache_size_ : percent_or_absolute_long option)
    ?exec_mem_pool_bytes:(exec_mem_pool_bytes_ : percent_or_absolute_long option)
    ?gen1_duration:(gen1_duration_ : duration option)
    ?distinct_cache_eviction_interval:(distinct_cache_eviction_interval_ : duration option)
    ?last_cache_eviction_interval:(last_cache_eviction_interval_ : duration option)
    ?parquet_mem_cache_query_path_duration:
      (parquet_mem_cache_query_path_duration_ : duration option)
    ?disable_parquet_mem_cache:
      (disable_parquet_mem_cache_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_prune_interval:(parquet_mem_cache_prune_interval_ : duration option)
    ?parquet_mem_cache_prune_percentage:
      (parquet_mem_cache_prune_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?preemptive_cache_age:(preemptive_cache_age_ : duration option)
    ?snapshotted_wal_files_to_keep:
      (snapshotted_wal_files_to_keep_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_max_write_buffer_size:
      (wal_max_write_buffer_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_snapshot_size:(wal_snapshot_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?force_snapshot_mem_threshold:(force_snapshot_mem_threshold_ : percent_or_absolute_long option)
    ?max_http_request_size:(max_http_request_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?data_fusion_config:(data_fusion_config_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?data_fusion_use_cached_parquet_loader:
      (data_fusion_use_cached_parquet_loader_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_max_parquet_fanout:
      (data_fusion_max_parquet_fanout_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_priority:
      (data_fusion_runtime_thread_priority_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_keep_alive:
      (data_fusion_runtime_thread_keep_alive_ : duration option)
    ?data_fusion_runtime_max_io_events_per_tick:
      (data_fusion_runtime_max_io_events_per_tick_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_blocking_threads:
      (data_fusion_runtime_max_blocking_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_global_queue_interval:
      (data_fusion_runtime_global_queue_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_event_interval:
      (data_fusion_runtime_event_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_disable_lifo_slot:
      (data_fusion_runtime_disable_lifo_slot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_runtime_type:(data_fusion_runtime_type_ : data_fusion_runtime_type option)
    ?data_fusion_num_threads:(data_fusion_num_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?log_format:(log_format_ : log_formats option)
    ?log_filter:(log_filter_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?query_log_size:(query_log_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_file_limit:(query_file_limit_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     hard_delete_default_duration = hard_delete_default_duration_;
     delete_grace_period = delete_grace_period_;
     retention_check_interval = retention_check_interval_;
     gen1_lookback_duration = gen1_lookback_duration_;
     table_index_cache_concurrency_limit = table_index_cache_concurrency_limit_;
     table_index_cache_max_entries = table_index_cache_max_entries_;
     wal_replay_concurrency_limit = wal_replay_concurrency_limit_;
     wal_replay_fail_on_error = wal_replay_fail_on_error_;
     parquet_mem_cache_size = parquet_mem_cache_size_;
     exec_mem_pool_bytes = exec_mem_pool_bytes_;
     gen1_duration = gen1_duration_;
     distinct_cache_eviction_interval = distinct_cache_eviction_interval_;
     last_cache_eviction_interval = last_cache_eviction_interval_;
     parquet_mem_cache_query_path_duration = parquet_mem_cache_query_path_duration_;
     disable_parquet_mem_cache = disable_parquet_mem_cache_;
     parquet_mem_cache_prune_interval = parquet_mem_cache_prune_interval_;
     parquet_mem_cache_prune_percentage = parquet_mem_cache_prune_percentage_;
     preemptive_cache_age = preemptive_cache_age_;
     snapshotted_wal_files_to_keep = snapshotted_wal_files_to_keep_;
     wal_max_write_buffer_size = wal_max_write_buffer_size_;
     wal_snapshot_size = wal_snapshot_size_;
     force_snapshot_mem_threshold = force_snapshot_mem_threshold_;
     max_http_request_size = max_http_request_size_;
     data_fusion_config = data_fusion_config_;
     data_fusion_use_cached_parquet_loader = data_fusion_use_cached_parquet_loader_;
     data_fusion_max_parquet_fanout = data_fusion_max_parquet_fanout_;
     data_fusion_runtime_thread_priority = data_fusion_runtime_thread_priority_;
     data_fusion_runtime_thread_keep_alive = data_fusion_runtime_thread_keep_alive_;
     data_fusion_runtime_max_io_events_per_tick = data_fusion_runtime_max_io_events_per_tick_;
     data_fusion_runtime_max_blocking_threads = data_fusion_runtime_max_blocking_threads_;
     data_fusion_runtime_global_queue_interval = data_fusion_runtime_global_queue_interval_;
     data_fusion_runtime_event_interval = data_fusion_runtime_event_interval_;
     data_fusion_runtime_disable_lifo_slot = data_fusion_runtime_disable_lifo_slot_;
     data_fusion_runtime_type = data_fusion_runtime_type_;
     data_fusion_num_threads = data_fusion_num_threads_;
     log_format = log_format_;
     log_filter = log_filter_;
     query_log_size = query_log_size_;
     query_file_limit = query_file_limit_;
   }
    : influx_d_bv3_core_parameters)

let make_influx_d_bv3_enterprise_parameters
    ?catalog_sync_interval:(catalog_sync_interval_ : duration option)
    ?replication_interval:(replication_interval_ : duration option)
    ?distinct_value_cache_disable_from_history:
      (distinct_value_cache_disable_from_history_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?last_value_cache_disable_from_history:
      (last_value_cache_disable_from_history_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?compaction_check_interval:(compaction_check_interval_ : duration option)
    ?compaction_cleanup_wait:(compaction_cleanup_wait_ : duration option)
    ?compaction_multipliers:(compaction_multipliers_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compaction_gen2_duration:(compaction_gen2_duration_ : duration option)
    ?compaction_max_num_files_per_plan:
      (compaction_max_num_files_per_plan_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compaction_row_limit:(compaction_row_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?hard_delete_default_duration:(hard_delete_default_duration_ : duration option)
    ?delete_grace_period:(delete_grace_period_ : duration option)
    ?retention_check_interval:(retention_check_interval_ : duration option)
    ?gen1_lookback_duration:(gen1_lookback_duration_ : duration option)
    ?table_index_cache_concurrency_limit:
      (table_index_cache_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_max_entries:
      (table_index_cache_max_entries_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_replay_concurrency_limit:
      (wal_replay_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_replay_fail_on_error:
      (wal_replay_fail_on_error_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_size:(parquet_mem_cache_size_ : percent_or_absolute_long option)
    ?exec_mem_pool_bytes:(exec_mem_pool_bytes_ : percent_or_absolute_long option)
    ?gen1_duration:(gen1_duration_ : duration option)
    ?distinct_cache_eviction_interval:(distinct_cache_eviction_interval_ : duration option)
    ?last_cache_eviction_interval:(last_cache_eviction_interval_ : duration option)
    ?parquet_mem_cache_query_path_duration:
      (parquet_mem_cache_query_path_duration_ : duration option)
    ?disable_parquet_mem_cache:
      (disable_parquet_mem_cache_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_prune_interval:(parquet_mem_cache_prune_interval_ : duration option)
    ?parquet_mem_cache_prune_percentage:
      (parquet_mem_cache_prune_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?preemptive_cache_age:(preemptive_cache_age_ : duration option)
    ?snapshotted_wal_files_to_keep:
      (snapshotted_wal_files_to_keep_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_max_write_buffer_size:
      (wal_max_write_buffer_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_snapshot_size:(wal_snapshot_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?force_snapshot_mem_threshold:(force_snapshot_mem_threshold_ : percent_or_absolute_long option)
    ?max_http_request_size:(max_http_request_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?data_fusion_config:(data_fusion_config_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?data_fusion_use_cached_parquet_loader:
      (data_fusion_use_cached_parquet_loader_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_max_parquet_fanout:
      (data_fusion_max_parquet_fanout_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_priority:
      (data_fusion_runtime_thread_priority_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_keep_alive:
      (data_fusion_runtime_thread_keep_alive_ : duration option)
    ?data_fusion_runtime_max_io_events_per_tick:
      (data_fusion_runtime_max_io_events_per_tick_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_blocking_threads:
      (data_fusion_runtime_max_blocking_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_global_queue_interval:
      (data_fusion_runtime_global_queue_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_event_interval:
      (data_fusion_runtime_event_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_disable_lifo_slot:
      (data_fusion_runtime_disable_lifo_slot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_runtime_type:(data_fusion_runtime_type_ : data_fusion_runtime_type option)
    ?data_fusion_num_threads:(data_fusion_num_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?log_format:(log_format_ : log_formats option)
    ?log_filter:(log_filter_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?query_log_size:(query_log_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_file_limit:(query_file_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~dedicated_compactor:(dedicated_compactor_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~query_only_instances:(query_only_instances_ : Smaws_Lib.Smithy_api.Types.integer)
    ~ingest_query_instances:(ingest_query_instances_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     catalog_sync_interval = catalog_sync_interval_;
     replication_interval = replication_interval_;
     distinct_value_cache_disable_from_history = distinct_value_cache_disable_from_history_;
     last_value_cache_disable_from_history = last_value_cache_disable_from_history_;
     compaction_check_interval = compaction_check_interval_;
     compaction_cleanup_wait = compaction_cleanup_wait_;
     compaction_multipliers = compaction_multipliers_;
     compaction_gen2_duration = compaction_gen2_duration_;
     compaction_max_num_files_per_plan = compaction_max_num_files_per_plan_;
     compaction_row_limit = compaction_row_limit_;
     dedicated_compactor = dedicated_compactor_;
     query_only_instances = query_only_instances_;
     ingest_query_instances = ingest_query_instances_;
     hard_delete_default_duration = hard_delete_default_duration_;
     delete_grace_period = delete_grace_period_;
     retention_check_interval = retention_check_interval_;
     gen1_lookback_duration = gen1_lookback_duration_;
     table_index_cache_concurrency_limit = table_index_cache_concurrency_limit_;
     table_index_cache_max_entries = table_index_cache_max_entries_;
     wal_replay_concurrency_limit = wal_replay_concurrency_limit_;
     wal_replay_fail_on_error = wal_replay_fail_on_error_;
     parquet_mem_cache_size = parquet_mem_cache_size_;
     exec_mem_pool_bytes = exec_mem_pool_bytes_;
     gen1_duration = gen1_duration_;
     distinct_cache_eviction_interval = distinct_cache_eviction_interval_;
     last_cache_eviction_interval = last_cache_eviction_interval_;
     parquet_mem_cache_query_path_duration = parquet_mem_cache_query_path_duration_;
     disable_parquet_mem_cache = disable_parquet_mem_cache_;
     parquet_mem_cache_prune_interval = parquet_mem_cache_prune_interval_;
     parquet_mem_cache_prune_percentage = parquet_mem_cache_prune_percentage_;
     preemptive_cache_age = preemptive_cache_age_;
     snapshotted_wal_files_to_keep = snapshotted_wal_files_to_keep_;
     wal_max_write_buffer_size = wal_max_write_buffer_size_;
     wal_snapshot_size = wal_snapshot_size_;
     force_snapshot_mem_threshold = force_snapshot_mem_threshold_;
     max_http_request_size = max_http_request_size_;
     data_fusion_config = data_fusion_config_;
     data_fusion_use_cached_parquet_loader = data_fusion_use_cached_parquet_loader_;
     data_fusion_max_parquet_fanout = data_fusion_max_parquet_fanout_;
     data_fusion_runtime_thread_priority = data_fusion_runtime_thread_priority_;
     data_fusion_runtime_thread_keep_alive = data_fusion_runtime_thread_keep_alive_;
     data_fusion_runtime_max_io_events_per_tick = data_fusion_runtime_max_io_events_per_tick_;
     data_fusion_runtime_max_blocking_threads = data_fusion_runtime_max_blocking_threads_;
     data_fusion_runtime_global_queue_interval = data_fusion_runtime_global_queue_interval_;
     data_fusion_runtime_event_interval = data_fusion_runtime_event_interval_;
     data_fusion_runtime_disable_lifo_slot = data_fusion_runtime_disable_lifo_slot_;
     data_fusion_runtime_type = data_fusion_runtime_type_;
     data_fusion_num_threads = data_fusion_num_threads_;
     log_format = log_format_;
     log_filter = log_filter_;
     query_log_size = query_log_size_;
     query_file_limit = query_file_limit_;
   }
    : influx_d_bv3_enterprise_parameters)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_db_parameter_group_summary
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option) ~arn:(arn_ : arn)
    ~name:(name_ : db_parameter_group_name) ~id:(id_ : db_parameter_group_id) () =
  ({ description = description_; arn = arn_; name = name_; id = id_ } : db_parameter_group_summary)

let make_list_db_parameter_groups_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_parameter_group_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_db_parameter_groups_output)

let make_list_db_parameter_groups_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_db_parameter_groups_input)

let make_db_instance_summary ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~arn:(arn_ : arn) ~name:(name_ : db_instance_name)
    ~id:(id_ : db_instance_id) () =
  ({
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : db_instance_summary)

let make_list_db_instances_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_instance_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_db_instances_output)

let make_list_db_instances_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_db_instances_input)

let make_db_instance_for_cluster_summary
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~arn:(arn_ : arn) ~name:(name_ : db_instance_name)
    ~id:(id_ : db_instance_id) () =
  ({
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : db_instance_for_cluster_summary)

let make_list_db_instances_for_cluster_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_instance_for_cluster_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_db_instances_for_cluster_output)

let make_list_db_instances_for_cluster_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~db_cluster_id:(db_cluster_id_ : db_cluster_id) ()
    =
  ({ max_results = max_results_; next_token = next_token_; db_cluster_id = db_cluster_id_ }
    : list_db_instances_for_cluster_input)

let make_db_cluster_summary ?engine_type:(engine_type_ : engine_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?deployment_type:(deployment_type_ : cluster_deployment_type option) ?port:(port_ : port option)
    ?reader_endpoint:(reader_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : cluster_status option) ~arn:(arn_ : arn) ~name:(name_ : db_cluster_name)
    ~id:(id_ : db_cluster_id) () =
  ({
     engine_type = engine_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     deployment_type = deployment_type_;
     port = port_;
     reader_endpoint = reader_endpoint_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : db_cluster_summary)

let make_list_db_clusters_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_cluster_summary_list) () =
  ({ next_token = next_token_; items = items_ } : list_db_clusters_output)

let make_list_db_clusters_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_db_clusters_input)

let make_get_db_parameter_group_output ?parameters:(parameters_ : parameters option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option) ~arn:(arn_ : arn)
    ~name:(name_ : db_parameter_group_name) ~id:(id_ : db_parameter_group_id) () =
  ({ parameters = parameters_; description = description_; arn = arn_; name = name_; id = id_ }
    : get_db_parameter_group_output)

let make_get_db_parameter_group_input ~identifier:(identifier_ : db_parameter_group_identifier) () =
  ({ identifier = identifier_ } : get_db_parameter_group_input)

let make_get_db_instance_output
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~arn:(arn_ : arn) ~name:(name_ : db_instance_name) ~id:(id_ : db_instance_id) () =
  ({
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     db_cluster_id = db_cluster_id_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     log_delivery_configuration = log_delivery_configuration_;
     secondary_availability_zone = secondary_availability_zone_;
     availability_zone = availability_zone_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : get_db_instance_output)

let make_get_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : get_db_instance_input)

let make_cluster_configuration
    ?dedicated_compactor:(dedicated_compactor_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_only_instances:(query_only_instances_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ingest_query_instances:(ingest_query_instances_ : Smaws_Lib.Smithy_api.Types.integer option) ()
    =
  ({
     dedicated_compactor = dedicated_compactor_;
     query_only_instances = query_only_instances_;
     ingest_query_instances = ingest_query_instances_;
   }
    : cluster_configuration)

let make_get_db_cluster_output
    ?cluster_configuration:(cluster_configuration_ : cluster_configuration option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?engine_type:(engine_type_ : engine_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?deployment_type:(deployment_type_ : cluster_deployment_type option) ?port:(port_ : port option)
    ?reader_endpoint:(reader_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : cluster_status option) ~arn:(arn_ : arn) ~name:(name_ : db_cluster_name)
    ~id:(id_ : db_cluster_id) () =
  ({
     cluster_configuration = cluster_configuration_;
     failover_mode = failover_mode_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     log_delivery_configuration = log_delivery_configuration_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     publicly_accessible = publicly_accessible_;
     engine_type = engine_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     deployment_type = deployment_type_;
     port = port_;
     reader_endpoint = reader_endpoint_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : get_db_cluster_output)

let make_get_db_cluster_input ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ db_cluster_id = db_cluster_id_ } : get_db_cluster_input)

let make_delete_db_instance_output
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~arn:(arn_ : arn) ~name:(name_ : db_instance_name) ~id:(id_ : db_instance_id) () =
  ({
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     db_cluster_id = db_cluster_id_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     log_delivery_configuration = log_delivery_configuration_;
     secondary_availability_zone = secondary_availability_zone_;
     availability_zone = availability_zone_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : delete_db_instance_output)

let make_delete_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : delete_db_instance_input)

let make_delete_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : delete_db_cluster_output)

let make_delete_db_cluster_input ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ db_cluster_id = db_cluster_id_ } : delete_db_cluster_input)

let make_create_db_parameter_group_output ?parameters:(parameters_ : parameters option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option) ~arn:(arn_ : arn)
    ~name:(name_ : db_parameter_group_name) ~id:(id_ : db_parameter_group_id) () =
  ({ parameters = parameters_; description = description_; arn = arn_; name = name_; id = id_ }
    : create_db_parameter_group_output)

let make_create_db_parameter_group_input ?tags:(tags_ : request_tag_map option)
    ?parameters:(parameters_ : parameters option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~name:(name_ : db_parameter_group_name) () =
  ({ tags = tags_; parameters = parameters_; description = description_; name = name_ }
    : create_db_parameter_group_input)

let make_create_db_instance_output
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option) ?port:(port_ : port option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : status option) ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~arn:(arn_ : arn) ~name:(name_ : db_instance_name) ~id:(id_ : db_instance_id) () =
  ({
     next_maintenance_time = next_maintenance_time_;
     last_maintenance_time = last_maintenance_time_;
     maintenance_schedule = maintenance_schedule_;
     instance_modes = instance_modes_;
     instance_mode = instance_mode_;
     db_cluster_id = db_cluster_id_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     log_delivery_configuration = log_delivery_configuration_;
     secondary_availability_zone = secondary_availability_zone_;
     availability_zone = availability_zone_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     deployment_type = deployment_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     port = port_;
     endpoint = endpoint_;
     status = status_;
     arn = arn_;
     name = name_;
     id = id_;
   }
    : create_db_instance_output)

let make_create_db_instance_input ?network_type:(network_type_ : network_type option)
    ?port:(port_ : port option) ?tags:(tags_ : request_tag_map option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?bucket:(bucket_ : bucket option) ?organization:(organization_ : organization option)
    ?username:(username_ : username option)
    ~allocated_storage:(allocated_storage_ : allocated_storage)
    ~vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~db_instance_type:(db_instance_type_ : db_instance_type) ~password:(password_ : password)
    ~name:(name_ : db_instance_name) () =
  ({
     network_type = network_type_;
     port = port_;
     tags = tags_;
     maintenance_schedule = maintenance_schedule_;
     log_delivery_configuration = log_delivery_configuration_;
     deployment_type = deployment_type_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     db_instance_type = db_instance_type_;
     bucket = bucket_;
     organization = organization_;
     password = password_;
     username = username_;
     name = name_;
   }
    : create_db_instance_input)

let make_create_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option) () =
  ({ db_cluster_status = db_cluster_status_; db_cluster_id = db_cluster_id_ }
    : create_db_cluster_output)

let make_create_db_cluster_input ?tags:(tags_ : request_tag_map option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?deployment_type:(deployment_type_ : cluster_deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?network_type:(network_type_ : network_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?port:(port_ : port option) ?bucket:(bucket_ : bucket option)
    ?organization:(organization_ : organization option) ?password:(password_ : password option)
    ?username:(username_ : username option)
    ~vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~db_instance_type:(db_instance_type_ : db_instance_type) ~name:(name_ : db_cluster_name) () =
  ({
     tags = tags_;
     maintenance_schedule = maintenance_schedule_;
     log_delivery_configuration = log_delivery_configuration_;
     failover_mode = failover_mode_;
     deployment_type = deployment_type_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     network_type = network_type_;
     allocated_storage = allocated_storage_;
     db_storage_type = db_storage_type_;
     db_instance_type = db_instance_type_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     port = port_;
     bucket = bucket_;
     organization = organization_;
     password = password_;
     username = username_;
     name = name_;
   }
    : create_db_cluster_input)
