open Types

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : request_tag_map) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_cluster_configuration
    ?ingest_query_instances:(ingest_query_instances_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_only_instances:(query_only_instances_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?dedicated_compactor:(dedicated_compactor_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     ingest_query_instances = ingest_query_instances_;
     query_only_instances = query_only_instances_;
     dedicated_compactor = dedicated_compactor_;
   }
    : cluster_configuration)

let make_create_db_cluster_output ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?db_cluster_status:(db_cluster_status_ : cluster_status option) () =
  ({ db_cluster_id = db_cluster_id_; db_cluster_status = db_cluster_status_ }
    : create_db_cluster_output)

let make_maintenance_schedule ~timezone:(timezone_ : iana_timezone)
    ~preferred_maintenance_window:(preferred_maintenance_window_ : maintenance_window) () =
  ({ timezone = timezone_; preferred_maintenance_window = preferred_maintenance_window_ }
    : maintenance_schedule)

let make_s3_configuration ~bucket_name:(bucket_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({ bucket_name = bucket_name_; enabled = enabled_ } : s3_configuration)

let make_log_delivery_configuration ~s3_configuration:(s3_configuration_ : s3_configuration) () =
  ({ s3_configuration = s3_configuration_ } : log_delivery_configuration)

let make_create_db_cluster_input ?username:(username_ : username option)
    ?password:(password_ : password option) ?organization:(organization_ : organization option)
    ?bucket:(bucket_ : bucket option) ?port:(port_ : port option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?network_type:(network_type_ : network_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deployment_type:(deployment_type_ : cluster_deployment_type option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?tags:(tags_ : request_tag_map option) ~name:(name_ : db_cluster_name)
    ~db_instance_type:(db_instance_type_ : db_instance_type)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list) () =
  ({
     name = name_;
     username = username_;
     password = password_;
     organization = organization_;
     bucket = bucket_;
     port = port_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     network_type = network_type_;
     publicly_accessible = publicly_accessible_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     deployment_type = deployment_type_;
     failover_mode = failover_mode_;
     log_delivery_configuration = log_delivery_configuration_;
     maintenance_schedule = maintenance_schedule_;
     tags = tags_;
   }
    : create_db_cluster_input)

let make_create_db_instance_output ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : db_instance_id) ~name:(name_ : db_instance_name) ~arn:(arn_ : arn)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     availability_zone = availability_zone_;
     secondary_availability_zone = secondary_availability_zone_;
     log_delivery_configuration = log_delivery_configuration_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     db_cluster_id = db_cluster_id_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
   }
    : create_db_instance_output)

let make_create_db_instance_input ?username:(username_ : username option)
    ?organization:(organization_ : organization option) ?bucket:(bucket_ : bucket option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?tags:(tags_ : request_tag_map option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option) ~name:(name_ : db_instance_name)
    ~password:(password_ : password) ~db_instance_type:(db_instance_type_ : db_instance_type)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list)
    ~vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list)
    ~allocated_storage:(allocated_storage_ : allocated_storage) () =
  ({
     name = name_;
     username = username_;
     password = password_;
     organization = organization_;
     bucket = bucket_;
     db_instance_type = db_instance_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     publicly_accessible = publicly_accessible_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     deployment_type = deployment_type_;
     log_delivery_configuration = log_delivery_configuration_;
     maintenance_schedule = maintenance_schedule_;
     tags = tags_;
     port = port_;
     network_type = network_type_;
   }
    : create_db_instance_input)

let make_duration ~duration_type:(duration_type_ : duration_type)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({ duration_type = duration_type_; value = value_ } : duration)

let make_influx_d_bv3_enterprise_parameters
    ?query_file_limit:(query_file_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_log_size:(query_log_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?log_filter:(log_filter_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_format:(log_format_ : log_formats option)
    ?data_fusion_num_threads:(data_fusion_num_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_type:(data_fusion_runtime_type_ : data_fusion_runtime_type option)
    ?data_fusion_runtime_disable_lifo_slot:
      (data_fusion_runtime_disable_lifo_slot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_runtime_event_interval:
      (data_fusion_runtime_event_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_global_queue_interval:
      (data_fusion_runtime_global_queue_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_blocking_threads:
      (data_fusion_runtime_max_blocking_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_io_events_per_tick:
      (data_fusion_runtime_max_io_events_per_tick_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_keep_alive:
      (data_fusion_runtime_thread_keep_alive_ : duration option)
    ?data_fusion_runtime_thread_priority:
      (data_fusion_runtime_thread_priority_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_max_parquet_fanout:
      (data_fusion_max_parquet_fanout_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_use_cached_parquet_loader:
      (data_fusion_use_cached_parquet_loader_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_config:(data_fusion_config_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_http_request_size:(max_http_request_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?force_snapshot_mem_threshold:(force_snapshot_mem_threshold_ : percent_or_absolute_long option)
    ?wal_snapshot_size:(wal_snapshot_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_max_write_buffer_size:
      (wal_max_write_buffer_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?snapshotted_wal_files_to_keep:
      (snapshotted_wal_files_to_keep_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?preemptive_cache_age:(preemptive_cache_age_ : duration option)
    ?parquet_mem_cache_prune_percentage:
      (parquet_mem_cache_prune_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?parquet_mem_cache_prune_interval:(parquet_mem_cache_prune_interval_ : duration option)
    ?disable_parquet_mem_cache:
      (disable_parquet_mem_cache_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_query_path_duration:
      (parquet_mem_cache_query_path_duration_ : duration option)
    ?last_cache_eviction_interval:(last_cache_eviction_interval_ : duration option)
    ?distinct_cache_eviction_interval:(distinct_cache_eviction_interval_ : duration option)
    ?gen1_duration:(gen1_duration_ : duration option)
    ?exec_mem_pool_bytes:(exec_mem_pool_bytes_ : percent_or_absolute_long option)
    ?parquet_mem_cache_size:(parquet_mem_cache_size_ : percent_or_absolute_long option)
    ?wal_replay_fail_on_error:
      (wal_replay_fail_on_error_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?wal_replay_concurrency_limit:
      (wal_replay_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_max_entries:
      (table_index_cache_max_entries_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_concurrency_limit:
      (table_index_cache_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?gen1_lookback_duration:(gen1_lookback_duration_ : duration option)
    ?retention_check_interval:(retention_check_interval_ : duration option)
    ?delete_grace_period:(delete_grace_period_ : duration option)
    ?hard_delete_default_duration:(hard_delete_default_duration_ : duration option)
    ?compaction_row_limit:(compaction_row_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compaction_max_num_files_per_plan:
      (compaction_max_num_files_per_plan_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compaction_gen2_duration:(compaction_gen2_duration_ : duration option)
    ?compaction_multipliers:(compaction_multipliers_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compaction_cleanup_wait:(compaction_cleanup_wait_ : duration option)
    ?compaction_check_interval:(compaction_check_interval_ : duration option)
    ?last_value_cache_disable_from_history:
      (last_value_cache_disable_from_history_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?distinct_value_cache_disable_from_history:
      (distinct_value_cache_disable_from_history_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?replication_interval:(replication_interval_ : duration option)
    ?catalog_sync_interval:(catalog_sync_interval_ : duration option)
    ~ingest_query_instances:(ingest_query_instances_ : Smaws_Lib.Smithy_api.Types.integer)
    ~query_only_instances:(query_only_instances_ : Smaws_Lib.Smithy_api.Types.integer)
    ~dedicated_compactor:(dedicated_compactor_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({
     query_file_limit = query_file_limit_;
     query_log_size = query_log_size_;
     log_filter = log_filter_;
     log_format = log_format_;
     data_fusion_num_threads = data_fusion_num_threads_;
     data_fusion_runtime_type = data_fusion_runtime_type_;
     data_fusion_runtime_disable_lifo_slot = data_fusion_runtime_disable_lifo_slot_;
     data_fusion_runtime_event_interval = data_fusion_runtime_event_interval_;
     data_fusion_runtime_global_queue_interval = data_fusion_runtime_global_queue_interval_;
     data_fusion_runtime_max_blocking_threads = data_fusion_runtime_max_blocking_threads_;
     data_fusion_runtime_max_io_events_per_tick = data_fusion_runtime_max_io_events_per_tick_;
     data_fusion_runtime_thread_keep_alive = data_fusion_runtime_thread_keep_alive_;
     data_fusion_runtime_thread_priority = data_fusion_runtime_thread_priority_;
     data_fusion_max_parquet_fanout = data_fusion_max_parquet_fanout_;
     data_fusion_use_cached_parquet_loader = data_fusion_use_cached_parquet_loader_;
     data_fusion_config = data_fusion_config_;
     max_http_request_size = max_http_request_size_;
     force_snapshot_mem_threshold = force_snapshot_mem_threshold_;
     wal_snapshot_size = wal_snapshot_size_;
     wal_max_write_buffer_size = wal_max_write_buffer_size_;
     snapshotted_wal_files_to_keep = snapshotted_wal_files_to_keep_;
     preemptive_cache_age = preemptive_cache_age_;
     parquet_mem_cache_prune_percentage = parquet_mem_cache_prune_percentage_;
     parquet_mem_cache_prune_interval = parquet_mem_cache_prune_interval_;
     disable_parquet_mem_cache = disable_parquet_mem_cache_;
     parquet_mem_cache_query_path_duration = parquet_mem_cache_query_path_duration_;
     last_cache_eviction_interval = last_cache_eviction_interval_;
     distinct_cache_eviction_interval = distinct_cache_eviction_interval_;
     gen1_duration = gen1_duration_;
     exec_mem_pool_bytes = exec_mem_pool_bytes_;
     parquet_mem_cache_size = parquet_mem_cache_size_;
     wal_replay_fail_on_error = wal_replay_fail_on_error_;
     wal_replay_concurrency_limit = wal_replay_concurrency_limit_;
     table_index_cache_max_entries = table_index_cache_max_entries_;
     table_index_cache_concurrency_limit = table_index_cache_concurrency_limit_;
     gen1_lookback_duration = gen1_lookback_duration_;
     retention_check_interval = retention_check_interval_;
     delete_grace_period = delete_grace_period_;
     hard_delete_default_duration = hard_delete_default_duration_;
     ingest_query_instances = ingest_query_instances_;
     query_only_instances = query_only_instances_;
     dedicated_compactor = dedicated_compactor_;
     compaction_row_limit = compaction_row_limit_;
     compaction_max_num_files_per_plan = compaction_max_num_files_per_plan_;
     compaction_gen2_duration = compaction_gen2_duration_;
     compaction_multipliers = compaction_multipliers_;
     compaction_cleanup_wait = compaction_cleanup_wait_;
     compaction_check_interval = compaction_check_interval_;
     last_value_cache_disable_from_history = last_value_cache_disable_from_history_;
     distinct_value_cache_disable_from_history = distinct_value_cache_disable_from_history_;
     replication_interval = replication_interval_;
     catalog_sync_interval = catalog_sync_interval_;
   }
    : influx_d_bv3_enterprise_parameters)

let make_influx_d_bv3_core_parameters
    ?query_file_limit:(query_file_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_log_size:(query_log_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?log_filter:(log_filter_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_format:(log_format_ : log_formats option)
    ?data_fusion_num_threads:(data_fusion_num_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_type:(data_fusion_runtime_type_ : data_fusion_runtime_type option)
    ?data_fusion_runtime_disable_lifo_slot:
      (data_fusion_runtime_disable_lifo_slot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_runtime_event_interval:
      (data_fusion_runtime_event_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_global_queue_interval:
      (data_fusion_runtime_global_queue_interval_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_blocking_threads:
      (data_fusion_runtime_max_blocking_threads_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_max_io_events_per_tick:
      (data_fusion_runtime_max_io_events_per_tick_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_runtime_thread_keep_alive:
      (data_fusion_runtime_thread_keep_alive_ : duration option)
    ?data_fusion_runtime_thread_priority:
      (data_fusion_runtime_thread_priority_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_max_parquet_fanout:
      (data_fusion_max_parquet_fanout_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_fusion_use_cached_parquet_loader:
      (data_fusion_use_cached_parquet_loader_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_fusion_config:(data_fusion_config_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_http_request_size:(max_http_request_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?force_snapshot_mem_threshold:(force_snapshot_mem_threshold_ : percent_or_absolute_long option)
    ?wal_snapshot_size:(wal_snapshot_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?wal_max_write_buffer_size:
      (wal_max_write_buffer_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?snapshotted_wal_files_to_keep:
      (snapshotted_wal_files_to_keep_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?preemptive_cache_age:(preemptive_cache_age_ : duration option)
    ?parquet_mem_cache_prune_percentage:
      (parquet_mem_cache_prune_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?parquet_mem_cache_prune_interval:(parquet_mem_cache_prune_interval_ : duration option)
    ?disable_parquet_mem_cache:
      (disable_parquet_mem_cache_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?parquet_mem_cache_query_path_duration:
      (parquet_mem_cache_query_path_duration_ : duration option)
    ?last_cache_eviction_interval:(last_cache_eviction_interval_ : duration option)
    ?distinct_cache_eviction_interval:(distinct_cache_eviction_interval_ : duration option)
    ?gen1_duration:(gen1_duration_ : duration option)
    ?exec_mem_pool_bytes:(exec_mem_pool_bytes_ : percent_or_absolute_long option)
    ?parquet_mem_cache_size:(parquet_mem_cache_size_ : percent_or_absolute_long option)
    ?wal_replay_fail_on_error:
      (wal_replay_fail_on_error_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?wal_replay_concurrency_limit:
      (wal_replay_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_max_entries:
      (table_index_cache_max_entries_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_index_cache_concurrency_limit:
      (table_index_cache_concurrency_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?gen1_lookback_duration:(gen1_lookback_duration_ : duration option)
    ?retention_check_interval:(retention_check_interval_ : duration option)
    ?delete_grace_period:(delete_grace_period_ : duration option)
    ?hard_delete_default_duration:(hard_delete_default_duration_ : duration option) () =
  ({
     query_file_limit = query_file_limit_;
     query_log_size = query_log_size_;
     log_filter = log_filter_;
     log_format = log_format_;
     data_fusion_num_threads = data_fusion_num_threads_;
     data_fusion_runtime_type = data_fusion_runtime_type_;
     data_fusion_runtime_disable_lifo_slot = data_fusion_runtime_disable_lifo_slot_;
     data_fusion_runtime_event_interval = data_fusion_runtime_event_interval_;
     data_fusion_runtime_global_queue_interval = data_fusion_runtime_global_queue_interval_;
     data_fusion_runtime_max_blocking_threads = data_fusion_runtime_max_blocking_threads_;
     data_fusion_runtime_max_io_events_per_tick = data_fusion_runtime_max_io_events_per_tick_;
     data_fusion_runtime_thread_keep_alive = data_fusion_runtime_thread_keep_alive_;
     data_fusion_runtime_thread_priority = data_fusion_runtime_thread_priority_;
     data_fusion_max_parquet_fanout = data_fusion_max_parquet_fanout_;
     data_fusion_use_cached_parquet_loader = data_fusion_use_cached_parquet_loader_;
     data_fusion_config = data_fusion_config_;
     max_http_request_size = max_http_request_size_;
     force_snapshot_mem_threshold = force_snapshot_mem_threshold_;
     wal_snapshot_size = wal_snapshot_size_;
     wal_max_write_buffer_size = wal_max_write_buffer_size_;
     snapshotted_wal_files_to_keep = snapshotted_wal_files_to_keep_;
     preemptive_cache_age = preemptive_cache_age_;
     parquet_mem_cache_prune_percentage = parquet_mem_cache_prune_percentage_;
     parquet_mem_cache_prune_interval = parquet_mem_cache_prune_interval_;
     disable_parquet_mem_cache = disable_parquet_mem_cache_;
     parquet_mem_cache_query_path_duration = parquet_mem_cache_query_path_duration_;
     last_cache_eviction_interval = last_cache_eviction_interval_;
     distinct_cache_eviction_interval = distinct_cache_eviction_interval_;
     gen1_duration = gen1_duration_;
     exec_mem_pool_bytes = exec_mem_pool_bytes_;
     parquet_mem_cache_size = parquet_mem_cache_size_;
     wal_replay_fail_on_error = wal_replay_fail_on_error_;
     wal_replay_concurrency_limit = wal_replay_concurrency_limit_;
     table_index_cache_max_entries = table_index_cache_max_entries_;
     table_index_cache_concurrency_limit = table_index_cache_concurrency_limit_;
     gen1_lookback_duration = gen1_lookback_duration_;
     retention_check_interval = retention_check_interval_;
     delete_grace_period = delete_grace_period_;
     hard_delete_default_duration = hard_delete_default_duration_;
   }
    : influx_d_bv3_core_parameters)

let make_influx_d_bv2_parameters
    ?flux_log_enabled:(flux_log_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?log_level:(log_level_ : log_level option)
    ?no_tasks:(no_tasks_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_concurrency:(query_concurrency_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_queue_size:(query_queue_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?tracing_type:(tracing_type_ : tracing_type option)
    ?metrics_disabled:(metrics_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?http_idle_timeout:(http_idle_timeout_ : duration option)
    ?http_read_header_timeout:(http_read_header_timeout_ : duration option)
    ?http_read_timeout:(http_read_timeout_ : duration option)
    ?http_write_timeout:(http_write_timeout_ : duration option)
    ?influxql_max_select_buckets:
      (influxql_max_select_buckets_ : Smaws_Lib.Smithy_api.Types.long option)
    ?influxql_max_select_point:(influxql_max_select_point_ : Smaws_Lib.Smithy_api.Types.long option)
    ?influxql_max_select_series:
      (influxql_max_select_series_ : Smaws_Lib.Smithy_api.Types.long option)
    ?pprof_disabled:(pprof_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_initial_memory_bytes:
      (query_initial_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?query_max_memory_bytes:(query_max_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?query_memory_bytes:(query_memory_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?session_length:(session_length_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?session_renew_disabled:(session_renew_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?storage_cache_max_memory_size:
      (storage_cache_max_memory_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_cache_snapshot_memory_size:
      (storage_cache_snapshot_memory_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_cache_snapshot_write_cold_duration:
      (storage_cache_snapshot_write_cold_duration_ : duration option)
    ?storage_compact_full_write_cold_duration:
      (storage_compact_full_write_cold_duration_ : duration option)
    ?storage_compact_throughput_burst:
      (storage_compact_throughput_burst_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_max_concurrent_compactions:
      (storage_max_concurrent_compactions_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_max_index_log_file_size:
      (storage_max_index_log_file_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_no_validate_field_size:
      (storage_no_validate_field_size_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?storage_retention_check_interval:(storage_retention_check_interval_ : duration option)
    ?storage_series_file_max_concurrent_snapshot_compactions:
      (storage_series_file_max_concurrent_snapshot_compactions_ :
         Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_series_id_set_cache_size:
      (storage_series_id_set_cache_size_ : Smaws_Lib.Smithy_api.Types.long option)
    ?storage_wal_max_concurrent_writes:
      (storage_wal_max_concurrent_writes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_wal_max_write_delay:(storage_wal_max_write_delay_ : duration option)
    ?ui_disabled:(ui_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     flux_log_enabled = flux_log_enabled_;
     log_level = log_level_;
     no_tasks = no_tasks_;
     query_concurrency = query_concurrency_;
     query_queue_size = query_queue_size_;
     tracing_type = tracing_type_;
     metrics_disabled = metrics_disabled_;
     http_idle_timeout = http_idle_timeout_;
     http_read_header_timeout = http_read_header_timeout_;
     http_read_timeout = http_read_timeout_;
     http_write_timeout = http_write_timeout_;
     influxql_max_select_buckets = influxql_max_select_buckets_;
     influxql_max_select_point = influxql_max_select_point_;
     influxql_max_select_series = influxql_max_select_series_;
     pprof_disabled = pprof_disabled_;
     query_initial_memory_bytes = query_initial_memory_bytes_;
     query_max_memory_bytes = query_max_memory_bytes_;
     query_memory_bytes = query_memory_bytes_;
     session_length = session_length_;
     session_renew_disabled = session_renew_disabled_;
     storage_cache_max_memory_size = storage_cache_max_memory_size_;
     storage_cache_snapshot_memory_size = storage_cache_snapshot_memory_size_;
     storage_cache_snapshot_write_cold_duration = storage_cache_snapshot_write_cold_duration_;
     storage_compact_full_write_cold_duration = storage_compact_full_write_cold_duration_;
     storage_compact_throughput_burst = storage_compact_throughput_burst_;
     storage_max_concurrent_compactions = storage_max_concurrent_compactions_;
     storage_max_index_log_file_size = storage_max_index_log_file_size_;
     storage_no_validate_field_size = storage_no_validate_field_size_;
     storage_retention_check_interval = storage_retention_check_interval_;
     storage_series_file_max_concurrent_snapshot_compactions =
       storage_series_file_max_concurrent_snapshot_compactions_;
     storage_series_id_set_cache_size = storage_series_id_set_cache_size_;
     storage_wal_max_concurrent_writes = storage_wal_max_concurrent_writes_;
     storage_wal_max_write_delay = storage_wal_max_write_delay_;
     ui_disabled = ui_disabled_;
   }
    : influx_d_bv2_parameters)

let make_create_db_parameter_group_output
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?parameters:(parameters_ : parameters option) ~id:(id_ : db_parameter_group_id)
    ~name:(name_ : db_parameter_group_name) ~arn:(arn_ : arn) () =
  ({ id = id_; name = name_; arn = arn_; description = description_; parameters = parameters_ }
    : create_db_parameter_group_output)

let make_create_db_parameter_group_input
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?parameters:(parameters_ : parameters option) ?tags:(tags_ : request_tag_map option)
    ~name:(name_ : db_parameter_group_name) () =
  ({ name = name_; description = description_; parameters = parameters_; tags = tags_ }
    : create_db_parameter_group_input)

let make_db_cluster_summary ?status:(status_ : cluster_status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reader_endpoint:(reader_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?port:(port_ : port option) ?deployment_type:(deployment_type_ : cluster_deployment_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?engine_type:(engine_type_ : engine_type option) ~id:(id_ : db_cluster_id)
    ~name:(name_ : db_cluster_name) ~arn:(arn_ : arn) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     reader_endpoint = reader_endpoint_;
     port = port_;
     deployment_type = deployment_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     engine_type = engine_type_;
   }
    : db_cluster_summary)

let make_db_instance_for_cluster_summary ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option) ~id:(id_ : db_instance_id)
    ~name:(name_ : db_instance_name) ~arn:(arn_ : arn) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
   }
    : db_instance_for_cluster_summary)

let make_db_instance_summary ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option) ~id:(id_ : db_instance_id)
    ~name:(name_ : db_instance_name) ~arn:(arn_ : arn) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
   }
    : db_instance_summary)

let make_db_parameter_group_summary
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~id:(id_ : db_parameter_group_id) ~name:(name_ : db_parameter_group_name) ~arn:(arn_ : arn) () =
  ({ id = id_; name = name_; arn = arn_; description = description_ } : db_parameter_group_summary)

let make_delete_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : delete_db_cluster_output)

let make_delete_db_cluster_input ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ db_cluster_id = db_cluster_id_ } : delete_db_cluster_input)

let make_delete_db_instance_output ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : db_instance_id) ~name:(name_ : db_instance_name) ~arn:(arn_ : arn)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     availability_zone = availability_zone_;
     secondary_availability_zone = secondary_availability_zone_;
     log_delivery_configuration = log_delivery_configuration_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     db_cluster_id = db_cluster_id_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
   }
    : delete_db_instance_output)

let make_delete_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : delete_db_instance_input)

let make_get_db_cluster_output ?status:(status_ : cluster_status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reader_endpoint:(reader_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?port:(port_ : port option) ?deployment_type:(deployment_type_ : cluster_deployment_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?network_type:(network_type_ : network_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?engine_type:(engine_type_ : engine_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?cluster_configuration:(cluster_configuration_ : cluster_configuration option)
    ~id:(id_ : db_cluster_id) ~name:(name_ : db_cluster_name) ~arn:(arn_ : arn) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     reader_endpoint = reader_endpoint_;
     port = port_;
     deployment_type = deployment_type_;
     db_instance_type = db_instance_type_;
     network_type = network_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     engine_type = engine_type_;
     publicly_accessible = publicly_accessible_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     log_delivery_configuration = log_delivery_configuration_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     failover_mode = failover_mode_;
     cluster_configuration = cluster_configuration_;
   }
    : get_db_cluster_output)

let make_get_db_cluster_input ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ db_cluster_id = db_cluster_id_ } : get_db_cluster_input)

let make_get_db_instance_output ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : db_instance_id) ~name:(name_ : db_instance_name) ~arn:(arn_ : arn)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     availability_zone = availability_zone_;
     secondary_availability_zone = secondary_availability_zone_;
     log_delivery_configuration = log_delivery_configuration_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     db_cluster_id = db_cluster_id_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
   }
    : get_db_instance_output)

let make_get_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : get_db_instance_input)

let make_get_db_parameter_group_output
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?parameters:(parameters_ : parameters option) ~id:(id_ : db_parameter_group_id)
    ~name:(name_ : db_parameter_group_name) ~arn:(arn_ : arn) () =
  ({ id = id_; name = name_; arn = arn_; description = description_; parameters = parameters_ }
    : get_db_parameter_group_output)

let make_get_db_parameter_group_input ~identifier:(identifier_ : db_parameter_group_identifier) () =
  ({ identifier = identifier_ } : get_db_parameter_group_input)

let make_list_db_clusters_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_cluster_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_db_clusters_output)

let make_list_db_clusters_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_db_clusters_input)

let make_list_db_instances_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_instance_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_db_instances_output)

let make_list_db_instances_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_db_instances_input)

let make_list_db_instances_for_cluster_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_instance_for_cluster_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_db_instances_for_cluster_output)

let make_list_db_instances_for_cluster_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~db_cluster_id:(db_cluster_id_ : db_cluster_id)
    () =
  ({ db_cluster_id = db_cluster_id_; next_token = next_token_; max_results = max_results_ }
    : list_db_instances_for_cluster_input)

let make_list_db_parameter_groups_output ?next_token:(next_token_ : next_token option)
    ~items:(items_ : db_parameter_group_summary_list) () =
  ({ items = items_; next_token = next_token_ } : list_db_parameter_groups_output)

let make_list_db_parameter_groups_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_db_parameter_groups_input)

let make_reboot_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : reboot_db_cluster_output)

let make_reboot_db_cluster_input ?instance_ids:(instance_ids_ : db_instance_id_list option)
    ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({ db_cluster_id = db_cluster_id_; instance_ids = instance_ids_ } : reboot_db_cluster_input)

let make_reboot_db_instance_output ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : db_instance_id) ~name:(name_ : db_instance_name) ~arn:(arn_ : arn)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     availability_zone = availability_zone_;
     secondary_availability_zone = secondary_availability_zone_;
     log_delivery_configuration = log_delivery_configuration_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     db_cluster_id = db_cluster_id_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
   }
    : reboot_db_instance_output)

let make_reboot_db_instance_input ~identifier:(identifier_ : db_instance_identifier) () =
  ({ identifier = identifier_ } : reboot_db_instance_input)

let make_update_db_cluster_output ?db_cluster_status:(db_cluster_status_ : cluster_status option) ()
    =
  ({ db_cluster_status = db_cluster_status_ } : update_db_cluster_output)

let make_update_db_cluster_input
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?port:(port_ : port option) ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?failover_mode:(failover_mode_ : failover_mode option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ~db_cluster_id:(db_cluster_id_ : db_cluster_id) () =
  ({
     db_cluster_id = db_cluster_id_;
     log_delivery_configuration = log_delivery_configuration_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     port = port_;
     db_instance_type = db_instance_type_;
     failover_mode = failover_mode_;
     maintenance_schedule = maintenance_schedule_;
   }
    : update_db_cluster_input)

let make_update_db_instance_output ?status:(status_ : status option)
    ?endpoint:(endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option) ?port:(port_ : port option)
    ?network_type:(network_type_ : network_type option)
    ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?secondary_availability_zone:
      (secondary_availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?influx_auth_parameters_secret_arn:
      (influx_auth_parameters_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_cluster_id:(db_cluster_id_ : db_cluster_id option)
    ?instance_mode:(instance_mode_ : instance_mode option)
    ?instance_modes:(instance_modes_ : instance_mode_list option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ?last_maintenance_time:(last_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_maintenance_time:(next_maintenance_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : db_instance_id) ~name:(name_ : db_instance_name) ~arn:(arn_ : arn)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : vpc_subnet_id_list) () =
  ({
     id = id_;
     name = name_;
     arn = arn_;
     status = status_;
     endpoint = endpoint_;
     port = port_;
     network_type = network_type_;
     db_instance_type = db_instance_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     deployment_type = deployment_type_;
     vpc_subnet_ids = vpc_subnet_ids_;
     publicly_accessible = publicly_accessible_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     availability_zone = availability_zone_;
     secondary_availability_zone = secondary_availability_zone_;
     log_delivery_configuration = log_delivery_configuration_;
     influx_auth_parameters_secret_arn = influx_auth_parameters_secret_arn_;
     db_cluster_id = db_cluster_id_;
     instance_mode = instance_mode_;
     instance_modes = instance_modes_;
     maintenance_schedule = maintenance_schedule_;
     last_maintenance_time = last_maintenance_time_;
     next_maintenance_time = next_maintenance_time_;
   }
    : update_db_instance_output)

let make_update_db_instance_input
    ?log_delivery_configuration:(log_delivery_configuration_ : log_delivery_configuration option)
    ?db_parameter_group_identifier:
      (db_parameter_group_identifier_ : db_parameter_group_identifier option)
    ?port:(port_ : port option) ?db_instance_type:(db_instance_type_ : db_instance_type option)
    ?deployment_type:(deployment_type_ : deployment_type option)
    ?db_storage_type:(db_storage_type_ : db_storage_type option)
    ?allocated_storage:(allocated_storage_ : allocated_storage option)
    ?maintenance_schedule:(maintenance_schedule_ : maintenance_schedule option)
    ~identifier:(identifier_ : db_instance_identifier) () =
  ({
     identifier = identifier_;
     log_delivery_configuration = log_delivery_configuration_;
     db_parameter_group_identifier = db_parameter_group_identifier_;
     port = port_;
     db_instance_type = db_instance_type_;
     deployment_type = deployment_type_;
     db_storage_type = db_storage_type_;
     allocated_storage = allocated_storage_;
     maintenance_schedule = maintenance_schedule_;
   }
    : update_db_instance_input)
