open Types

let make_authentication ?password_count:(password_count_ : integer_optional option)
    ?type_:(type__ : authentication_type option) () =
  ({ password_count = password_count_; type_ = type__ } : authentication)

let make_user ?ar_n:(ar_n_ : string_ option)
    ?authentication:(authentication_ : authentication option)
    ?user_group_ids:(user_group_ids_ : user_group_id_list option)
    ?access_string:(access_string_ : string_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?engine:(engine_ : engine_type option) ?status:(status_ : string_ option)
    ?user_name:(user_name_ : string_ option) ?user_id:(user_id_ : string_ option) () =
  ({
     ar_n = ar_n_;
     authentication = authentication_;
     user_group_ids = user_group_ids_;
     access_string = access_string_;
     minimum_engine_version = minimum_engine_version_;
     engine = engine_;
     status = status_;
     user_name = user_name_;
     user_id = user_id_;
   }
    : user)

let make_user_groups_update_status
    ?user_group_ids_to_remove:(user_group_ids_to_remove_ : user_group_id_list option)
    ?user_group_ids_to_add:(user_group_ids_to_add_ : user_group_id_list option) () =
  ({
     user_group_ids_to_remove = user_group_ids_to_remove_;
     user_group_ids_to_add = user_group_ids_to_add_;
   }
    : user_groups_update_status)

let make_user_group_pending_changes ?user_ids_to_add:(user_ids_to_add_ : user_id_list option)
    ?user_ids_to_remove:(user_ids_to_remove_ : user_id_list option) () =
  ({ user_ids_to_add = user_ids_to_add_; user_ids_to_remove = user_ids_to_remove_ }
    : user_group_pending_changes)

let make_user_group ?ar_n:(ar_n_ : string_ option)
    ?serverless_caches:(serverless_caches_ : ug_serverless_cache_id_list option)
    ?replication_groups:(replication_groups_ : ug_replication_group_id_list option)
    ?pending_changes:(pending_changes_ : user_group_pending_changes option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?user_ids:(user_ids_ : user_id_list option) ?engine:(engine_ : engine_type option)
    ?status:(status_ : string_ option) ?user_group_id:(user_group_id_ : string_ option) () =
  ({
     ar_n = ar_n_;
     serverless_caches = serverless_caches_;
     replication_groups = replication_groups_;
     pending_changes = pending_changes_;
     minimum_engine_version = minimum_engine_version_;
     user_ids = user_ids_;
     engine = engine_;
     status = status_;
     user_group_id = user_group_id_;
   }
    : user_group)

let make_node_group_member_update_status
    ?node_update_status_modified_date:(node_update_status_modified_date_ : t_stamp option)
    ?node_update_initiated_date:(node_update_initiated_date_ : t_stamp option)
    ?node_update_initiated_by:(node_update_initiated_by_ : node_update_initiated_by option)
    ?node_update_end_date:(node_update_end_date_ : t_stamp option)
    ?node_update_start_date:(node_update_start_date_ : t_stamp option)
    ?node_deletion_date:(node_deletion_date_ : t_stamp option)
    ?node_update_status:(node_update_status_ : node_update_status option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({
     node_update_status_modified_date = node_update_status_modified_date_;
     node_update_initiated_date = node_update_initiated_date_;
     node_update_initiated_by = node_update_initiated_by_;
     node_update_end_date = node_update_end_date_;
     node_update_start_date = node_update_start_date_;
     node_deletion_date = node_deletion_date_;
     node_update_status = node_update_status_;
     cache_node_id = cache_node_id_;
     cache_cluster_id = cache_cluster_id_;
   }
    : node_group_member_update_status)

let make_node_group_update_status
    ?node_group_member_update_status:
      (node_group_member_update_status_ : node_group_member_update_status_list option)
    ?node_group_id:(node_group_id_ : string_ option) () =
  ({
     node_group_member_update_status = node_group_member_update_status_;
     node_group_id = node_group_id_;
   }
    : node_group_update_status)

let make_cache_node_update_status
    ?node_update_status_modified_date:(node_update_status_modified_date_ : t_stamp option)
    ?node_update_initiated_date:(node_update_initiated_date_ : t_stamp option)
    ?node_update_initiated_by:(node_update_initiated_by_ : node_update_initiated_by option)
    ?node_update_end_date:(node_update_end_date_ : t_stamp option)
    ?node_update_start_date:(node_update_start_date_ : t_stamp option)
    ?node_deletion_date:(node_deletion_date_ : t_stamp option)
    ?node_update_status:(node_update_status_ : node_update_status option)
    ?cache_node_id:(cache_node_id_ : string_ option) () =
  ({
     node_update_status_modified_date = node_update_status_modified_date_;
     node_update_initiated_date = node_update_initiated_date_;
     node_update_initiated_by = node_update_initiated_by_;
     node_update_end_date = node_update_end_date_;
     node_update_start_date = node_update_start_date_;
     node_deletion_date = node_deletion_date_;
     node_update_status = node_update_status_;
     cache_node_id = cache_node_id_;
   }
    : cache_node_update_status)

let make_update_action ?engine:(engine_ : string_ option)
    ?estimated_update_time:(estimated_update_time_ : string_ option)
    ?cache_node_update_status:(cache_node_update_status_ : cache_node_update_status_list option)
    ?node_group_update_status:(node_group_update_status_ : node_group_update_status_list option)
    ?sla_met:(sla_met_ : sla_met option)
    ?update_action_status_modified_date:(update_action_status_modified_date_ : t_stamp option)
    ?nodes_updated:(nodes_updated_ : string_ option)
    ?update_action_status:(update_action_status_ : update_action_status option)
    ?update_action_available_date:(update_action_available_date_ : t_stamp option)
    ?service_update_type:(service_update_type_ : service_update_type option)
    ?service_update_recommended_apply_by_date:
      (service_update_recommended_apply_by_date_ : t_stamp option)
    ?service_update_status:(service_update_status_ : service_update_status option)
    ?service_update_severity:(service_update_severity_ : service_update_severity option)
    ?service_update_release_date:(service_update_release_date_ : t_stamp option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     engine = engine_;
     estimated_update_time = estimated_update_time_;
     cache_node_update_status = cache_node_update_status_;
     node_group_update_status = node_group_update_status_;
     sla_met = sla_met_;
     update_action_status_modified_date = update_action_status_modified_date_;
     nodes_updated = nodes_updated_;
     update_action_status = update_action_status_;
     update_action_available_date = update_action_available_date_;
     service_update_type = service_update_type_;
     service_update_recommended_apply_by_date = service_update_recommended_apply_by_date_;
     service_update_status = service_update_status_;
     service_update_severity = service_update_severity_;
     service_update_release_date = service_update_release_date_;
     service_update_name = service_update_name_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
   }
    : update_action)

let make_update_actions_message ?update_actions:(update_actions_ : update_action_list option)
    ?marker:(marker_ : string_ option) () =
  ({ update_actions = update_actions_; marker = marker_ } : update_actions_message)

let make_processed_update_action
    ?update_action_status:(update_action_status_ : update_action_status option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     update_action_status = update_action_status_;
     service_update_name = service_update_name_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
   }
    : processed_update_action)

let make_unprocessed_update_action ?error_message:(error_message_ : string_ option)
    ?error_type:(error_type_ : string_ option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     error_message = error_message_;
     error_type = error_type_;
     service_update_name = service_update_name_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
   }
    : unprocessed_update_action)

let make_update_action_results_message
    ?unprocessed_update_actions:
      (unprocessed_update_actions_ : unprocessed_update_action_list option)
    ?processed_update_actions:(processed_update_actions_ : processed_update_action_list option) () =
  ({
     unprocessed_update_actions = unprocessed_update_actions_;
     processed_update_actions = processed_update_actions_;
   }
    : update_action_results_message)

let make_time_range_filter ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) () =
  ({ end_time = end_time_; start_time = start_time_ } : time_range_filter)

let make_global_replication_group_info
    ?global_replication_group_member_role:(global_replication_group_member_role_ : string_ option)
    ?global_replication_group_id:(global_replication_group_id_ : string_ option) () =
  ({
     global_replication_group_member_role = global_replication_group_member_role_;
     global_replication_group_id = global_replication_group_id_;
   }
    : global_replication_group_info)

let make_slot_migration ?progress_percentage:(progress_percentage_ : double option) () =
  ({ progress_percentage = progress_percentage_ } : slot_migration)

let make_resharding_status ?slot_migration:(slot_migration_ : slot_migration option) () =
  ({ slot_migration = slot_migration_ } : resharding_status)

let make_cloud_watch_logs_destination_details ?log_group:(log_group_ : string_ option) () =
  ({ log_group = log_group_ } : cloud_watch_logs_destination_details)

let make_kinesis_firehose_destination_details ?delivery_stream:(delivery_stream_ : string_ option)
    () =
  ({ delivery_stream = delivery_stream_ } : kinesis_firehose_destination_details)

let make_destination_details
    ?kinesis_firehose_details:
      (kinesis_firehose_details_ : kinesis_firehose_destination_details option)
    ?cloud_watch_logs_details:
      (cloud_watch_logs_details_ : cloud_watch_logs_destination_details option) () =
  ({
     kinesis_firehose_details = kinesis_firehose_details_;
     cloud_watch_logs_details = cloud_watch_logs_details_;
   }
    : destination_details)

let make_pending_log_delivery_configuration ?log_format:(log_format_ : log_format option)
    ?destination_details:(destination_details_ : destination_details option)
    ?destination_type:(destination_type_ : destination_type option)
    ?log_type:(log_type_ : log_type option) () =
  ({
     log_format = log_format_;
     destination_details = destination_details_;
     destination_type = destination_type_;
     log_type = log_type_;
   }
    : pending_log_delivery_configuration)

let make_replication_group_pending_modified_values
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : pending_log_delivery_configuration_list option)
    ?user_groups:(user_groups_ : user_groups_update_status option)
    ?auth_token_status:(auth_token_status_ : auth_token_update_status option)
    ?resharding:(resharding_ : resharding_status option)
    ?automatic_failover_status:
      (automatic_failover_status_ : pending_automatic_failover_status option)
    ?primary_cluster_id:(primary_cluster_id_ : string_ option) () =
  ({
     cluster_mode = cluster_mode_;
     transit_encryption_mode = transit_encryption_mode_;
     transit_encryption_enabled = transit_encryption_enabled_;
     log_delivery_configurations = log_delivery_configurations_;
     user_groups = user_groups_;
     auth_token_status = auth_token_status_;
     resharding = resharding_;
     automatic_failover_status = automatic_failover_status_;
     primary_cluster_id = primary_cluster_id_;
   }
    : replication_group_pending_modified_values)

let make_endpoint ?port:(port_ : integer option) ?address:(address_ : string_ option) () =
  ({ port = port_; address = address_ } : endpoint)

let make_node_group_member ?current_role:(current_role_ : string_ option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?read_endpoint:(read_endpoint_ : endpoint option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({
     current_role = current_role_;
     preferred_outpost_arn = preferred_outpost_arn_;
     preferred_availability_zone = preferred_availability_zone_;
     read_endpoint = read_endpoint_;
     cache_node_id = cache_node_id_;
     cache_cluster_id = cache_cluster_id_;
   }
    : node_group_member)

let make_node_group ?node_group_members:(node_group_members_ : node_group_member_list option)
    ?slots:(slots_ : string_ option) ?reader_endpoint:(reader_endpoint_ : endpoint option)
    ?primary_endpoint:(primary_endpoint_ : endpoint option) ?status:(status_ : string_ option)
    ?node_group_id:(node_group_id_ : string_ option) () =
  ({
     node_group_members = node_group_members_;
     slots = slots_;
     reader_endpoint = reader_endpoint_;
     primary_endpoint = primary_endpoint_;
     status = status_;
     node_group_id = node_group_id_;
   }
    : node_group)

let make_log_delivery_configuration ?message:(message_ : string_ option)
    ?status:(status_ : log_delivery_configuration_status option)
    ?log_format:(log_format_ : log_format option)
    ?destination_details:(destination_details_ : destination_details option)
    ?destination_type:(destination_type_ : destination_type option)
    ?log_type:(log_type_ : log_type option) () =
  ({
     message = message_;
     status = status_;
     log_format = log_format_;
     destination_details = destination_details_;
     destination_type = destination_type_;
     log_type = log_type_;
   }
    : log_delivery_configuration)

let make_replication_group
    ?effective_durability:(effective_durability_ : effective_durability option)
    ?durability:(durability_ : durability option) ?engine:(engine_ : string_ option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?replication_group_create_time:(replication_group_create_time_ : t_stamp option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_list option)
    ?user_group_ids:(user_group_ids_ : user_group_id_list option) ?ar_n:(ar_n_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?member_clusters_outpost_arns:
      (member_clusters_outpost_arns_ : replication_group_outpost_arn_list option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?auth_token_last_modified_date:(auth_token_last_modified_date_ : t_stamp option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?cluster_enabled:(cluster_enabled_ : boolean_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?configuration_endpoint:(configuration_endpoint_ : endpoint option)
    ?multi_a_z:(multi_a_z_ : multi_az_status option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?snapshotting_cluster_id:(snapshotting_cluster_id_ : string_ option)
    ?node_groups:(node_groups_ : node_group_list option)
    ?member_clusters:(member_clusters_ : cluster_id_list option)
    ?pending_modified_values:
      (pending_modified_values_ : replication_group_pending_modified_values option)
    ?status:(status_ : string_ option)
    ?global_replication_group_info:
      (global_replication_group_info_ : global_replication_group_info option)
    ?description:(description_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     effective_durability = effective_durability_;
     durability = durability_;
     engine = engine_;
     cluster_mode = cluster_mode_;
     transit_encryption_mode = transit_encryption_mode_;
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     data_tiering = data_tiering_;
     replication_group_create_time = replication_group_create_time_;
     log_delivery_configurations = log_delivery_configurations_;
     user_group_ids = user_group_ids_;
     ar_n = ar_n_;
     storage_encryption_type = storage_encryption_type_;
     kms_key_id = kms_key_id_;
     member_clusters_outpost_arns = member_clusters_outpost_arns_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     transit_encryption_enabled = transit_encryption_enabled_;
     auth_token_last_modified_date = auth_token_last_modified_date_;
     auth_token_enabled = auth_token_enabled_;
     cache_node_type = cache_node_type_;
     cluster_enabled = cluster_enabled_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     configuration_endpoint = configuration_endpoint_;
     multi_a_z = multi_a_z_;
     automatic_failover = automatic_failover_;
     snapshotting_cluster_id = snapshotting_cluster_id_;
     node_groups = node_groups_;
     member_clusters = member_clusters_;
     pending_modified_values = pending_modified_values_;
     status = status_;
     global_replication_group_info = global_replication_group_info_;
     description = description_;
     replication_group_id = replication_group_id_;
   }
    : replication_group)

let make_test_migration_response ?replication_group:(replication_group_ : replication_group option)
    () =
  ({ replication_group = replication_group_ } : test_migration_response)

let make_customer_node_endpoint ?port:(port_ : integer_optional option)
    ?address:(address_ : string_ option) () =
  ({ port = port_; address = address_ } : customer_node_endpoint)

let make_test_migration_message
    ~customer_node_endpoint_list:(customer_node_endpoint_list_ : customer_node_endpoint_list)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     customer_node_endpoint_list = customer_node_endpoint_list_;
     replication_group_id = replication_group_id_;
   }
    : test_migration_message)

let make_test_failover_message ~node_group_id:(node_group_id_ : allowed_node_group_id)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({ node_group_id = node_group_id_; replication_group_id = replication_group_id_ }
    : test_failover_message)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_list_message ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_list_message)

let make_subnet_outpost ?subnet_outpost_arn:(subnet_outpost_arn_ : string_ option) () =
  ({ subnet_outpost_arn = subnet_outpost_arn_ } : subnet_outpost)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?supported_network_types:(supported_network_types_ : network_type_list option)
    ?subnet_outpost:(subnet_outpost_ : subnet_outpost option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_identifier:(subnet_identifier_ : string_ option) () =
  ({
     supported_network_types = supported_network_types_;
     subnet_outpost = subnet_outpost_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_identifier = subnet_identifier_;
   }
    : subnet)

let make_start_migration_response ?replication_group:(replication_group_ : replication_group option)
    () =
  ({ replication_group = replication_group_ } : start_migration_response)

let make_start_migration_message
    ~customer_node_endpoint_list:(customer_node_endpoint_list_ : customer_node_endpoint_list)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     customer_node_endpoint_list = customer_node_endpoint_list_;
     replication_group_id = replication_group_id_;
   }
    : start_migration_message)

let make_node_group_configuration
    ?replica_outpost_arns:(replica_outpost_arns_ : outpost_arns_list option)
    ?primary_outpost_arn:(primary_outpost_arn_ : string_ option)
    ?replica_availability_zones:(replica_availability_zones_ : availability_zones_list option)
    ?primary_availability_zone:(primary_availability_zone_ : string_ option)
    ?replica_count:(replica_count_ : integer_optional option) ?slots:(slots_ : string_ option)
    ?node_group_id:(node_group_id_ : allowed_node_group_id option) () =
  ({
     replica_outpost_arns = replica_outpost_arns_;
     primary_outpost_arn = primary_outpost_arn_;
     replica_availability_zones = replica_availability_zones_;
     primary_availability_zone = primary_availability_zone_;
     replica_count = replica_count_;
     slots = slots_;
     node_group_id = node_group_id_;
   }
    : node_group_configuration)

let make_node_snapshot ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?cache_node_create_time:(cache_node_create_time_ : t_stamp option)
    ?cache_size:(cache_size_ : string_ option)
    ?node_group_configuration:(node_group_configuration_ : node_group_configuration option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?node_group_id:(node_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({
     snapshot_create_time = snapshot_create_time_;
     cache_node_create_time = cache_node_create_time_;
     cache_size = cache_size_;
     node_group_configuration = node_group_configuration_;
     cache_node_id = cache_node_id_;
     node_group_id = node_group_id_;
     cache_cluster_id = cache_cluster_id_;
   }
    : node_snapshot)

let make_snapshot ?durability:(durability_ : durability option)
    ?data_tiering:(data_tiering_ : data_tiering_status option) ?ar_n:(ar_n_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?node_snapshots:(node_snapshots_ : node_snapshot_list option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?num_node_groups:(num_node_groups_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?topic_arn:(topic_arn_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?cache_cluster_create_time:(cache_cluster_create_time_ : t_stamp option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?snapshot_source:(snapshot_source_ : string_ option)
    ?snapshot_status:(snapshot_status_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_description:(replication_group_description_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option) () =
  ({
     durability = durability_;
     data_tiering = data_tiering_;
     ar_n = ar_n_;
     kms_key_id = kms_key_id_;
     node_snapshots = node_snapshots_;
     automatic_failover = automatic_failover_;
     num_node_groups = num_node_groups_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     vpc_id = vpc_id_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_parameter_group_name = cache_parameter_group_name_;
     port = port_;
     topic_arn = topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     cache_cluster_create_time = cache_cluster_create_time_;
     preferred_outpost_arn = preferred_outpost_arn_;
     preferred_availability_zone = preferred_availability_zone_;
     num_cache_nodes = num_cache_nodes_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     snapshot_source = snapshot_source_;
     snapshot_status = snapshot_status_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_description = replication_group_description_;
     replication_group_id = replication_group_id_;
     snapshot_name = snapshot_name_;
   }
    : snapshot)

let make_service_update ?estimated_update_time:(estimated_update_time_ : string_ option)
    ?auto_update_after_recommended_apply_by_date:
      (auto_update_after_recommended_apply_by_date_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?service_update_type:(service_update_type_ : service_update_type option)
    ?service_update_description:(service_update_description_ : string_ option)
    ?service_update_status:(service_update_status_ : service_update_status option)
    ?service_update_recommended_apply_by_date:
      (service_update_recommended_apply_by_date_ : t_stamp option)
    ?service_update_severity:(service_update_severity_ : service_update_severity option)
    ?service_update_end_date:(service_update_end_date_ : t_stamp option)
    ?service_update_release_date:(service_update_release_date_ : t_stamp option)
    ?service_update_name:(service_update_name_ : string_ option) () =
  ({
     estimated_update_time = estimated_update_time_;
     auto_update_after_recommended_apply_by_date = auto_update_after_recommended_apply_by_date_;
     engine_version = engine_version_;
     engine = engine_;
     service_update_type = service_update_type_;
     service_update_description = service_update_description_;
     service_update_status = service_update_status_;
     service_update_recommended_apply_by_date = service_update_recommended_apply_by_date_;
     service_update_severity = service_update_severity_;
     service_update_end_date = service_update_end_date_;
     service_update_release_date = service_update_release_date_;
     service_update_name = service_update_name_;
   }
    : service_update)

let make_service_updates_message ?service_updates:(service_updates_ : service_update_list option)
    ?marker:(marker_ : string_ option) () =
  ({ service_updates = service_updates_; marker = marker_ } : service_updates_message)

let make_serverless_cache_configuration
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine:(engine_ : string_ option)
    ?serverless_cache_name:(serverless_cache_name_ : string_ option) () =
  ({
     major_engine_version = major_engine_version_;
     engine = engine_;
     serverless_cache_name = serverless_cache_name_;
   }
    : serverless_cache_configuration)

let make_serverless_cache_snapshot
    ?serverless_cache_configuration:
      (serverless_cache_configuration_ : serverless_cache_configuration option)
    ?bytes_used_for_cache:(bytes_used_for_cache_ : string_ option)
    ?expiry_time:(expiry_time_ : t_stamp option) ?create_time:(create_time_ : t_stamp option)
    ?status:(status_ : string_ option) ?snapshot_type:(snapshot_type_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?ar_n:(ar_n_ : string_ option)
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option) () =
  ({
     serverless_cache_configuration = serverless_cache_configuration_;
     bytes_used_for_cache = bytes_used_for_cache_;
     expiry_time = expiry_time_;
     create_time = create_time_;
     status = status_;
     snapshot_type = snapshot_type_;
     kms_key_id = kms_key_id_;
     ar_n = ar_n_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
   }
    : serverless_cache_snapshot)

let make_data_storage ?minimum:(minimum_ : integer_optional option)
    ?maximum:(maximum_ : integer_optional option) ~unit_:(unit__ : data_storage_unit) () =
  ({ unit_ = unit__; minimum = minimum_; maximum = maximum_ } : data_storage)

let make_ecpu_per_second ?minimum:(minimum_ : integer_optional option)
    ?maximum:(maximum_ : integer_optional option) () =
  ({ minimum = minimum_; maximum = maximum_ } : ecpu_per_second)

let make_cache_usage_limits ?ecpu_per_second:(ecpu_per_second_ : ecpu_per_second option)
    ?data_storage:(data_storage_ : data_storage option) () =
  ({ ecpu_per_second = ecpu_per_second_; data_storage = data_storage_ } : cache_usage_limits)

let make_serverless_cache ?network_type:(network_type_ : network_type option)
    ?daily_snapshot_time:(daily_snapshot_time_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_list option)
    ?user_group_id:(user_group_id_ : string_ option) ?ar_n:(ar_n_ : string_ option)
    ?reader_endpoint:(reader_endpoint_ : endpoint option) ?endpoint:(endpoint_ : endpoint option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?full_engine_version:(full_engine_version_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine:(engine_ : string_ option) ?status:(status_ : string_ option)
    ?create_time:(create_time_ : t_stamp option) ?description:(description_ : string_ option)
    ?serverless_cache_name:(serverless_cache_name_ : string_ option) () =
  ({
     network_type = network_type_;
     daily_snapshot_time = daily_snapshot_time_;
     snapshot_retention_limit = snapshot_retention_limit_;
     subnet_ids = subnet_ids_;
     user_group_id = user_group_id_;
     ar_n = ar_n_;
     reader_endpoint = reader_endpoint_;
     endpoint = endpoint_;
     security_group_ids = security_group_ids_;
     storage_encryption_type = storage_encryption_type_;
     kms_key_id = kms_key_id_;
     cache_usage_limits = cache_usage_limits_;
     full_engine_version = full_engine_version_;
     major_engine_version = major_engine_version_;
     engine = engine_;
     status = status_;
     create_time = create_time_;
     description = description_;
     serverless_cache_name = serverless_cache_name_;
   }
    : serverless_cache)

let make_security_group_membership ?status:(status_ : string_ option)
    ?security_group_id:(security_group_id_ : string_ option) () =
  ({ status = status_; security_group_id = security_group_id_ } : security_group_membership)

let make_scale_config ?scale_interval_minutes:(scale_interval_minutes_ : integer_optional option)
    ?scale_percentage:(scale_percentage_ : integer_optional option) () =
  ({ scale_interval_minutes = scale_interval_minutes_; scale_percentage = scale_percentage_ }
    : scale_config)

let make_ec2_security_group
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_name = ec2_security_group_name_;
     status = status_;
   }
    : ec2_security_group)

let make_cache_security_group ?ar_n:(ar_n_ : string_ option)
    ?ec2_security_groups:(ec2_security_groups_ : ec2_security_group_list option)
    ?description:(description_ : string_ option)
    ?cache_security_group_name:(cache_security_group_name_ : string_ option)
    ?owner_id:(owner_id_ : string_ option) () =
  ({
     ar_n = ar_n_;
     ec2_security_groups = ec2_security_groups_;
     description = description_;
     cache_security_group_name = cache_security_group_name_;
     owner_id = owner_id_;
   }
    : cache_security_group)

let make_revoke_cache_security_group_ingress_message
    ~ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_)
    ~ec2_security_group_name:(ec2_security_group_name_ : string_)
    ~cache_security_group_name:(cache_security_group_name_ : string_) () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_name = ec2_security_group_name_;
     cache_security_group_name = cache_security_group_name_;
   }
    : revoke_cache_security_group_ingress_message)

let make_resharding_configuration
    ?preferred_availability_zones:(preferred_availability_zones_ : availability_zones_list option)
    ?node_group_id:(node_group_id_ : allowed_node_group_id option) () =
  ({ preferred_availability_zones = preferred_availability_zones_; node_group_id = node_group_id_ }
    : resharding_configuration)

let make_parameter_name_value ?parameter_value:(parameter_value_ : string_ option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : parameter_name_value)

let make_reset_cache_parameter_group_message
    ?parameter_name_values:(parameter_name_values_ : parameter_name_value_list option)
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     parameter_name_values = parameter_name_values_;
     reset_all_parameters = reset_all_parameters_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : reset_cache_parameter_group_message)

let make_cache_parameter_group_name_message
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option) () =
  ({ cache_parameter_group_name = cache_parameter_group_name_ }
    : cache_parameter_group_name_message)

let make_recurring_charge ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option)
    ?recurring_charge_amount:(recurring_charge_amount_ : double option) () =
  ({
     recurring_charge_frequency = recurring_charge_frequency_;
     recurring_charge_amount = recurring_charge_amount_;
   }
    : recurring_charge)

let make_reserved_cache_nodes_offering
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?usage_price:(usage_price_ : double option) ?fixed_price:(fixed_price_ : double option)
    ?duration:(duration_ : integer option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option) () =
  ({
     recurring_charges = recurring_charges_;
     offering_type = offering_type_;
     product_description = product_description_;
     usage_price = usage_price_;
     fixed_price = fixed_price_;
     duration = duration_;
     cache_node_type = cache_node_type_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
   }
    : reserved_cache_nodes_offering)

let make_reserved_cache_nodes_offering_message
    ?reserved_cache_nodes_offerings:
      (reserved_cache_nodes_offerings_ : reserved_cache_nodes_offering_list option)
    ?marker:(marker_ : string_ option) () =
  ({ reserved_cache_nodes_offerings = reserved_cache_nodes_offerings_; marker = marker_ }
    : reserved_cache_nodes_offering_message)

let make_reserved_cache_node ?reservation_ar_n:(reservation_ar_n_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?state:(state_ : string_ option) ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?cache_node_count:(cache_node_count_ : integer option)
    ?usage_price:(usage_price_ : double option) ?fixed_price:(fixed_price_ : double option)
    ?duration:(duration_ : integer option) ?start_time:(start_time_ : t_stamp option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option) () =
  ({
     reservation_ar_n = reservation_ar_n_;
     recurring_charges = recurring_charges_;
     state = state_;
     offering_type = offering_type_;
     product_description = product_description_;
     cache_node_count = cache_node_count_;
     usage_price = usage_price_;
     fixed_price = fixed_price_;
     duration = duration_;
     start_time = start_time_;
     cache_node_type = cache_node_type_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     reserved_cache_node_id = reserved_cache_node_id_;
   }
    : reserved_cache_node)

let make_reserved_cache_node_message
    ?reserved_cache_nodes:(reserved_cache_nodes_ : reserved_cache_node_list option)
    ?marker:(marker_ : string_ option) () =
  ({ reserved_cache_nodes = reserved_cache_nodes_; marker = marker_ } : reserved_cache_node_message)

let make_replication_group_message
    ?replication_groups:(replication_groups_ : replication_group_list option)
    ?marker:(marker_ : string_ option) () =
  ({ replication_groups = replication_groups_; marker = marker_ } : replication_group_message)

let make_configure_shard
    ?preferred_outpost_arns:(preferred_outpost_arns_ : preferred_outpost_arn_list option)
    ?preferred_availability_zones:
      (preferred_availability_zones_ : preferred_availability_zone_list option)
    ~new_replica_count:(new_replica_count_ : integer)
    ~node_group_id:(node_group_id_ : allowed_node_group_id) () =
  ({
     preferred_outpost_arns = preferred_outpost_arns_;
     preferred_availability_zones = preferred_availability_zones_;
     new_replica_count = new_replica_count_;
     node_group_id = node_group_id_;
   }
    : configure_shard)

let make_remove_tags_from_resource_message ~tag_keys:(tag_keys_ : key_list)
    ~resource_name:(resource_name_ : string_) () =
  ({ tag_keys = tag_keys_; resource_name = resource_name_ } : remove_tags_from_resource_message)

let make_regional_configuration
    ~resharding_configuration:(resharding_configuration_ : resharding_configuration_list)
    ~replication_group_region:(replication_group_region_ : string_)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     resharding_configuration = resharding_configuration_;
     replication_group_region = replication_group_region_;
     replication_group_id = replication_group_id_;
   }
    : regional_configuration)

let make_pending_modified_values ?scale_config:(scale_config_ : scale_config option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : pending_log_delivery_configuration_list option)
    ?auth_token_status:(auth_token_status_ : auth_token_update_status option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_node_ids_to_remove:(cache_node_ids_to_remove_ : cache_node_ids_list option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option) () =
  ({
     scale_config = scale_config_;
     transit_encryption_mode = transit_encryption_mode_;
     transit_encryption_enabled = transit_encryption_enabled_;
     log_delivery_configurations = log_delivery_configurations_;
     auth_token_status = auth_token_status_;
     cache_node_type = cache_node_type_;
     engine_version = engine_version_;
     cache_node_ids_to_remove = cache_node_ids_to_remove_;
     num_cache_nodes = num_cache_nodes_;
   }
    : pending_modified_values)

let make_notification_configuration ?topic_status:(topic_status_ : string_ option)
    ?topic_arn:(topic_arn_ : string_ option) () =
  ({ topic_status = topic_status_; topic_arn = topic_arn_ } : notification_configuration)

let make_cache_security_group_membership ?status:(status_ : string_ option)
    ?cache_security_group_name:(cache_security_group_name_ : string_ option) () =
  ({ status = status_; cache_security_group_name = cache_security_group_name_ }
    : cache_security_group_membership)

let make_cache_parameter_group_status
    ?cache_node_ids_to_reboot:(cache_node_ids_to_reboot_ : cache_node_ids_list option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option) () =
  ({
     cache_node_ids_to_reboot = cache_node_ids_to_reboot_;
     parameter_apply_status = parameter_apply_status_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : cache_parameter_group_status)

let make_cache_node ?customer_outpost_arn:(customer_outpost_arn_ : string_ option)
    ?customer_availability_zone:(customer_availability_zone_ : string_ option)
    ?source_cache_node_id:(source_cache_node_id_ : string_ option)
    ?parameter_group_status:(parameter_group_status_ : string_ option)
    ?endpoint:(endpoint_ : endpoint option)
    ?cache_node_create_time:(cache_node_create_time_ : t_stamp option)
    ?cache_node_status:(cache_node_status_ : string_ option)
    ?cache_node_id:(cache_node_id_ : string_ option) () =
  ({
     customer_outpost_arn = customer_outpost_arn_;
     customer_availability_zone = customer_availability_zone_;
     source_cache_node_id = source_cache_node_id_;
     parameter_group_status = parameter_group_status_;
     endpoint = endpoint_;
     cache_node_create_time = cache_node_create_time_;
     cache_node_status = cache_node_status_;
     cache_node_id = cache_node_id_;
   }
    : cache_node)

let make_cache_cluster
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_list option)
    ?replication_group_log_delivery_enabled:
      (replication_group_log_delivery_enabled_ : boolean_ option) ?ar_n:(ar_n_ : string_ option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?auth_token_last_modified_date:(auth_token_last_modified_date_ : t_stamp option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?cache_nodes:(cache_nodes_ : cache_node_list option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_parameter_group:(cache_parameter_group_ : cache_parameter_group_status option)
    ?cache_security_groups:(cache_security_groups_ : cache_security_group_membership_list option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?cache_cluster_create_time:(cache_cluster_create_time_ : t_stamp option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?cache_cluster_status:(cache_cluster_status_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?client_download_landing_page:(client_download_landing_page_ : string_ option)
    ?configuration_endpoint:(configuration_endpoint_ : endpoint option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({
     transit_encryption_mode = transit_encryption_mode_;
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     log_delivery_configurations = log_delivery_configurations_;
     replication_group_log_delivery_enabled = replication_group_log_delivery_enabled_;
     ar_n = ar_n_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     transit_encryption_enabled = transit_encryption_enabled_;
     auth_token_last_modified_date = auth_token_last_modified_date_;
     auth_token_enabled = auth_token_enabled_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     replication_group_id = replication_group_id_;
     security_groups = security_groups_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     cache_nodes = cache_nodes_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_parameter_group = cache_parameter_group_;
     cache_security_groups = cache_security_groups_;
     notification_configuration = notification_configuration_;
     pending_modified_values = pending_modified_values_;
     preferred_maintenance_window = preferred_maintenance_window_;
     cache_cluster_create_time = cache_cluster_create_time_;
     preferred_outpost_arn = preferred_outpost_arn_;
     preferred_availability_zone = preferred_availability_zone_;
     num_cache_nodes = num_cache_nodes_;
     cache_cluster_status = cache_cluster_status_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     client_download_landing_page = client_download_landing_page_;
     configuration_endpoint = configuration_endpoint_;
     cache_cluster_id = cache_cluster_id_;
   }
    : cache_cluster)

let make_reboot_cache_cluster_message
    ~cache_node_ids_to_reboot:(cache_node_ids_to_reboot_ : cache_node_ids_list)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({ cache_node_ids_to_reboot = cache_node_ids_to_reboot_; cache_cluster_id = cache_cluster_id_ }
    : reboot_cache_cluster_message)

let make_global_replication_group_member ?status:(status_ : string_ option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?role:(role_ : string_ option)
    ?replication_group_region:(replication_group_region_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     status = status_;
     automatic_failover = automatic_failover_;
     role = role_;
     replication_group_region = replication_group_region_;
     replication_group_id = replication_group_id_;
   }
    : global_replication_group_member)

let make_global_node_group ?slots:(slots_ : string_ option)
    ?global_node_group_id:(global_node_group_id_ : string_ option) () =
  ({ slots = slots_; global_node_group_id = global_node_group_id_ } : global_node_group)

let make_global_replication_group ?ar_n:(ar_n_ : string_ option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?global_node_groups:(global_node_groups_ : global_node_group_list option)
    ?cluster_enabled:(cluster_enabled_ : boolean_optional option)
    ?members:(members_ : global_replication_group_member_list option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?status:(status_ : string_ option)
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ?global_replication_group_id:(global_replication_group_id_ : string_ option) () =
  ({
     ar_n = ar_n_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     transit_encryption_enabled = transit_encryption_enabled_;
     auth_token_enabled = auth_token_enabled_;
     global_node_groups = global_node_groups_;
     cluster_enabled = cluster_enabled_;
     members = members_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     status = status_;
     global_replication_group_description = global_replication_group_description_;
     global_replication_group_id = global_replication_group_id_;
   }
    : global_replication_group)

let make_rebalance_slots_in_global_replication_group_message
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     global_replication_group_id = global_replication_group_id_;
   }
    : rebalance_slots_in_global_replication_group_message)

let make_purchase_reserved_cache_nodes_offering_message ?tags:(tags_ : tag_list option)
    ?cache_node_count:(cache_node_count_ : integer_optional option)
    ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option)
    ~reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_) () =
  ({
     tags = tags_;
     cache_node_count = cache_node_count_;
     reserved_cache_node_id = reserved_cache_node_id_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
   }
    : purchase_reserved_cache_nodes_offering_message)

let make_parameter ?change_type:(change_type_ : change_type option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?source:(source_ : string_ option) ?description:(description_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({
     change_type = change_type_;
     minimum_engine_version = minimum_engine_version_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     source = source_;
     description = description_;
     parameter_value = parameter_value_;
     parameter_name = parameter_name_;
   }
    : parameter)

let make_authentication_mode ?passwords:(passwords_ : password_list_input option)
    ?type_:(type__ : input_authentication_type option) () =
  ({ passwords = passwords_; type_ = type__ } : authentication_mode)

let make_modify_user_message ?engine:(engine_ : engine_type option)
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ?no_password_required:(no_password_required_ : boolean_optional option)
    ?passwords:(passwords_ : password_list_input option)
    ?append_access_string:(append_access_string_ : access_string option)
    ?access_string:(access_string_ : access_string option) ~user_id:(user_id_ : user_id) () =
  ({
     engine = engine_;
     authentication_mode = authentication_mode_;
     no_password_required = no_password_required_;
     passwords = passwords_;
     append_access_string = append_access_string_;
     access_string = access_string_;
     user_id = user_id_;
   }
    : modify_user_message)

let make_modify_user_group_message ?engine:(engine_ : engine_type option)
    ?user_ids_to_remove:(user_ids_to_remove_ : user_id_list_input option)
    ?user_ids_to_add:(user_ids_to_add_ : user_id_list_input option)
    ~user_group_id:(user_group_id_ : string_) () =
  ({
     engine = engine_;
     user_ids_to_remove = user_ids_to_remove_;
     user_ids_to_add = user_ids_to_add_;
     user_group_id = user_group_id_;
   }
    : modify_user_group_message)

let make_modify_serverless_cache_response
    ?serverless_cache:(serverless_cache_ : serverless_cache option) () =
  ({ serverless_cache = serverless_cache_ } : modify_serverless_cache_response)

let make_modify_serverless_cache_request
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine:(engine_ : string_ option) ?daily_snapshot_time:(daily_snapshot_time_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?user_group_id:(user_group_id_ : string_ option)
    ?remove_user_group:(remove_user_group_ : boolean_optional option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?description:(description_ : string_ option)
    ~serverless_cache_name:(serverless_cache_name_ : string_) () =
  ({
     major_engine_version = major_engine_version_;
     engine = engine_;
     daily_snapshot_time = daily_snapshot_time_;
     snapshot_retention_limit = snapshot_retention_limit_;
     security_group_ids = security_group_ids_;
     user_group_id = user_group_id_;
     remove_user_group = remove_user_group_;
     cache_usage_limits = cache_usage_limits_;
     description = description_;
     serverless_cache_name = serverless_cache_name_;
   }
    : modify_serverless_cache_request)

let make_modify_replication_group_shard_configuration_message
    ?node_groups_to_retain:(node_groups_to_retain_ : node_groups_to_retain_list option)
    ?node_groups_to_remove:(node_groups_to_remove_ : node_groups_to_remove_list option)
    ?resharding_configuration:(resharding_configuration_ : resharding_configuration_list option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~node_group_count:(node_group_count_ : integer)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     node_groups_to_retain = node_groups_to_retain_;
     node_groups_to_remove = node_groups_to_remove_;
     resharding_configuration = resharding_configuration_;
     apply_immediately = apply_immediately_;
     node_group_count = node_group_count_;
     replication_group_id = replication_group_id_;
   }
    : modify_replication_group_shard_configuration_message)

let make_log_delivery_configuration_request ?enabled:(enabled_ : boolean_optional option)
    ?log_format:(log_format_ : log_format option)
    ?destination_details:(destination_details_ : destination_details option)
    ?destination_type:(destination_type_ : destination_type option)
    ?log_type:(log_type_ : log_type option) () =
  ({
     enabled = enabled_;
     log_format = log_format_;
     destination_details = destination_details_;
     destination_type = destination_type_;
     log_type = log_type_;
   }
    : log_delivery_configuration_request)

let make_modify_replication_group_message ?durability:(durability_ : durability option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?remove_user_groups:(remove_user_groups_ : boolean_optional option)
    ?user_group_ids_to_remove:(user_group_ids_to_remove_ : user_group_id_list option)
    ?user_group_ids_to_add:(user_group_ids_to_add_ : user_group_id_list option)
    ?auth_token_update_strategy:
      (auth_token_update_strategy_ : auth_token_update_strategy_type option)
    ?auth_token:(auth_token_ : string_ option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?node_group_id:(node_group_id_ : string_ option)
    ?multi_az_enabled:(multi_az_enabled_ : boolean_optional option)
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ?snapshotting_cluster_id:(snapshotting_cluster_id_ : string_ option)
    ?primary_cluster_id:(primary_cluster_id_ : string_ option)
    ?replication_group_description:(replication_group_description_ : string_ option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     durability = durability_;
     cluster_mode = cluster_mode_;
     transit_encryption_mode = transit_encryption_mode_;
     transit_encryption_enabled = transit_encryption_enabled_;
     ip_discovery = ip_discovery_;
     log_delivery_configurations = log_delivery_configurations_;
     remove_user_groups = remove_user_groups_;
     user_group_ids_to_remove = user_group_ids_to_remove_;
     user_group_ids_to_add = user_group_ids_to_add_;
     auth_token_update_strategy = auth_token_update_strategy_;
     auth_token = auth_token_;
     cache_node_type = cache_node_type_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     engine = engine_;
     apply_immediately = apply_immediately_;
     notification_topic_status = notification_topic_status_;
     cache_parameter_group_name = cache_parameter_group_name_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     security_group_ids = security_group_ids_;
     cache_security_group_names = cache_security_group_names_;
     node_group_id = node_group_id_;
     multi_az_enabled = multi_az_enabled_;
     automatic_failover_enabled = automatic_failover_enabled_;
     snapshotting_cluster_id = snapshotting_cluster_id_;
     primary_cluster_id = primary_cluster_id_;
     replication_group_description = replication_group_description_;
     replication_group_id = replication_group_id_;
   }
    : modify_replication_group_message)

let make_modify_global_replication_group_message
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     automatic_failover_enabled = automatic_failover_enabled_;
     global_replication_group_description = global_replication_group_description_;
     cache_parameter_group_name = cache_parameter_group_name_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     apply_immediately = apply_immediately_;
     global_replication_group_id = global_replication_group_id_;
   }
    : modify_global_replication_group_message)

let make_cache_subnet_group
    ?supported_network_types:(supported_network_types_ : network_type_list option)
    ?ar_n:(ar_n_ : string_ option) ?subnets:(subnets_ : subnet_list option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?cache_subnet_group_description:(cache_subnet_group_description_ : string_ option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option) () =
  ({
     supported_network_types = supported_network_types_;
     ar_n = ar_n_;
     subnets = subnets_;
     vpc_id = vpc_id_;
     cache_subnet_group_description = cache_subnet_group_description_;
     cache_subnet_group_name = cache_subnet_group_name_;
   }
    : cache_subnet_group)

let make_modify_cache_subnet_group_message ?subnet_ids:(subnet_ids_ : subnet_identifier_list option)
    ?cache_subnet_group_description:(cache_subnet_group_description_ : string_ option)
    ~cache_subnet_group_name:(cache_subnet_group_name_ : string_) () =
  ({
     subnet_ids = subnet_ids_;
     cache_subnet_group_description = cache_subnet_group_description_;
     cache_subnet_group_name = cache_subnet_group_name_;
   }
    : modify_cache_subnet_group_message)

let make_modify_cache_parameter_group_message
    ~parameter_name_values:(parameter_name_values_ : parameter_name_value_list)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     parameter_name_values = parameter_name_values_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : modify_cache_parameter_group_message)

let make_modify_cache_cluster_message ?scale_config:(scale_config_ : scale_config option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?auth_token_update_strategy:
      (auth_token_update_strategy_ : auth_token_update_strategy_type option)
    ?auth_token:(auth_token_ : string_ option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?new_availability_zones:(new_availability_zones_ : preferred_availability_zone_list option)
    ?az_mode:(az_mode_ : az_mode option)
    ?cache_node_ids_to_remove:(cache_node_ids_to_remove_ : cache_node_ids_list option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({
     scale_config = scale_config_;
     ip_discovery = ip_discovery_;
     log_delivery_configurations = log_delivery_configurations_;
     auth_token_update_strategy = auth_token_update_strategy_;
     auth_token = auth_token_;
     cache_node_type = cache_node_type_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     engine = engine_;
     apply_immediately = apply_immediately_;
     notification_topic_status = notification_topic_status_;
     cache_parameter_group_name = cache_parameter_group_name_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     security_group_ids = security_group_ids_;
     cache_security_group_names = cache_security_group_names_;
     new_availability_zones = new_availability_zones_;
     az_mode = az_mode_;
     cache_node_ids_to_remove = cache_node_ids_to_remove_;
     num_cache_nodes = num_cache_nodes_;
     cache_cluster_id = cache_cluster_id_;
   }
    : modify_cache_cluster_message)

let make_list_tags_for_resource_message ~resource_name:(resource_name_ : string_) () =
  ({ resource_name = resource_name_ } : list_tags_for_resource_message)

let make_list_allowed_node_type_modifications_message
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({ replication_group_id = replication_group_id_; cache_cluster_id = cache_cluster_id_ }
    : list_allowed_node_type_modifications_message)

let make_allowed_node_type_modifications_message
    ?scale_down_modifications:(scale_down_modifications_ : node_type_list option)
    ?scale_up_modifications:(scale_up_modifications_ : node_type_list option) () =
  ({
     scale_down_modifications = scale_down_modifications_;
     scale_up_modifications = scale_up_modifications_;
   }
    : allowed_node_type_modifications_message)

let make_increase_replica_count_message
    ?replica_configuration:(replica_configuration_ : replica_configuration_list option)
    ?new_replica_count:(new_replica_count_ : integer_optional option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     replica_configuration = replica_configuration_;
     new_replica_count = new_replica_count_;
     replication_group_id = replication_group_id_;
   }
    : increase_replica_count_message)

let make_increase_node_groups_in_global_replication_group_message
    ?regional_configurations:(regional_configurations_ : regional_configuration_list option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~node_group_count:(node_group_count_ : integer)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     regional_configurations = regional_configurations_;
     node_group_count = node_group_count_;
     global_replication_group_id = global_replication_group_id_;
   }
    : increase_node_groups_in_global_replication_group_message)

let make_filter ~values:(values_ : filter_value_list) ~name:(name_ : filter_name) () =
  ({ values = values_; name = name_ } : filter)

let make_failover_global_replication_group_message
    ~primary_replication_group_id:(primary_replication_group_id_ : string_)
    ~primary_region:(primary_region_ : string_)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     primary_replication_group_id = primary_replication_group_id_;
     primary_region = primary_region_;
     global_replication_group_id = global_replication_group_id_;
   }
    : failover_global_replication_group_message)

let make_export_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : export_serverless_cache_snapshot_response)

let make_export_serverless_cache_snapshot_request ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_) () =
  ({
     s3_bucket_name = s3_bucket_name_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
   }
    : export_serverless_cache_snapshot_request)

let make_event ?date:(date_ : t_stamp option) ?message:(message_ : string_ option)
    ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     date = date_;
     message = message_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : event)

let make_events_message ?events:(events_ : event_list option) ?marker:(marker_ : string_ option) ()
    =
  ({ events = events_; marker = marker_ } : events_message)

let make_cache_node_type_specific_value ?value:(value_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) () =
  ({ value = value_; cache_node_type = cache_node_type_ } : cache_node_type_specific_value)

let make_cache_node_type_specific_parameter ?change_type:(change_type_ : change_type option)
    ?cache_node_type_specific_values:
      (cache_node_type_specific_values_ : cache_node_type_specific_value_list option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?source:(source_ : string_ option) ?description:(description_ : string_ option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({
     change_type = change_type_;
     cache_node_type_specific_values = cache_node_type_specific_values_;
     minimum_engine_version = minimum_engine_version_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     source = source_;
     description = description_;
     parameter_name = parameter_name_;
   }
    : cache_node_type_specific_parameter)

let make_engine_defaults
    ?cache_node_type_specific_parameters:
      (cache_node_type_specific_parameters_ : cache_node_type_specific_parameters_list option)
    ?parameters:(parameters_ : parameters_list option) ?marker:(marker_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option) () =
  ({
     cache_node_type_specific_parameters = cache_node_type_specific_parameters_;
     parameters = parameters_;
     marker = marker_;
     cache_parameter_group_family = cache_parameter_group_family_;
   }
    : engine_defaults)

let make_disassociate_global_replication_group_message
    ~replication_group_region:(replication_group_region_ : string_)
    ~replication_group_id:(replication_group_id_ : string_)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     replication_group_region = replication_group_region_;
     replication_group_id = replication_group_id_;
     global_replication_group_id = global_replication_group_id_;
   }
    : disassociate_global_replication_group_message)

let make_describe_users_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?user_id:(user_id_ : user_id option) ?engine:(engine_ : engine_type option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     user_id = user_id_;
     engine = engine_;
   }
    : describe_users_message)

let make_describe_user_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?user_group_id:(user_group_id_ : string_ option) () =
  ({ marker = marker_; max_records = max_records_; user_group_id = user_group_id_ }
    : describe_user_groups_message)

let make_describe_update_actions_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?show_node_level_update_status:(show_node_level_update_status_ : boolean_optional option)
    ?update_action_status:(update_action_status_ : update_action_status_list option)
    ?service_update_time_range:(service_update_time_range_ : time_range_filter option)
    ?service_update_status:(service_update_status_ : service_update_status_list option)
    ?engine:(engine_ : string_ option)
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ?service_update_name:(service_update_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     show_node_level_update_status = show_node_level_update_status_;
     update_action_status = update_action_status_;
     service_update_time_range = service_update_time_range_;
     service_update_status = service_update_status_;
     engine = engine_;
     cache_cluster_ids = cache_cluster_ids_;
     replication_group_ids = replication_group_ids_;
     service_update_name = service_update_name_;
   }
    : describe_update_actions_message)

let make_describe_snapshots_message
    ?show_node_group_config:(show_node_group_config_ : boolean_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?snapshot_source:(snapshot_source_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({
     show_node_group_config = show_node_group_config_;
     max_records = max_records_;
     marker = marker_;
     snapshot_source = snapshot_source_;
     snapshot_name = snapshot_name_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
   }
    : describe_snapshots_message)

let make_describe_snapshots_list_message ?snapshots:(snapshots_ : snapshot_list option)
    ?marker:(marker_ : string_ option) () =
  ({ snapshots = snapshots_; marker = marker_ } : describe_snapshots_list_message)

let make_describe_service_updates_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?service_update_status:(service_update_status_ : service_update_status_list option)
    ?service_update_name:(service_update_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     service_update_status = service_update_status_;
     service_update_name = service_update_name_;
   }
    : describe_service_updates_message)

let make_describe_serverless_caches_response
    ?serverless_caches:(serverless_caches_ : serverless_cache_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ serverless_caches = serverless_caches_; next_token = next_token_ }
    : describe_serverless_caches_response)

let make_describe_serverless_caches_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?serverless_cache_name:(serverless_cache_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     serverless_cache_name = serverless_cache_name_;
   }
    : describe_serverless_caches_request)

let make_describe_serverless_cache_snapshots_response
    ?serverless_cache_snapshots:
      (serverless_cache_snapshots_ : serverless_cache_snapshot_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ serverless_cache_snapshots = serverless_cache_snapshots_; next_token = next_token_ }
    : describe_serverless_cache_snapshots_response)

let make_describe_serverless_cache_snapshots_request
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option)
    ?serverless_cache_name:(serverless_cache_name_ : string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     snapshot_type = snapshot_type_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     serverless_cache_name = serverless_cache_name_;
   }
    : describe_serverless_cache_snapshots_request)

let make_describe_reserved_cache_nodes_offerings_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?duration:(duration_ : string_ option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     offering_type = offering_type_;
     product_description = product_description_;
     duration = duration_;
     cache_node_type = cache_node_type_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
   }
    : describe_reserved_cache_nodes_offerings_message)

let make_describe_reserved_cache_nodes_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?duration:(duration_ : string_ option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     offering_type = offering_type_;
     product_description = product_description_;
     duration = duration_;
     cache_node_type = cache_node_type_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     reserved_cache_node_id = reserved_cache_node_id_;
   }
    : describe_reserved_cache_nodes_message)

let make_describe_replication_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({ marker = marker_; max_records = max_records_; replication_group_id = replication_group_id_ }
    : describe_replication_groups_message)

let make_describe_global_replication_groups_message
    ?show_member_info:(show_member_info_ : boolean_optional option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?global_replication_group_id:(global_replication_group_id_ : string_ option) () =
  ({
     show_member_info = show_member_info_;
     marker = marker_;
     max_records = max_records_;
     global_replication_group_id = global_replication_group_id_;
   }
    : describe_global_replication_groups_message)

let make_describe_events_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?duration:(duration_ : integer_optional option) ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     duration = duration_;
     end_time = end_time_;
     start_time = start_time_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : describe_events_message)

let make_describe_engine_default_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ~cache_parameter_group_family:(cache_parameter_group_family_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     cache_parameter_group_family = cache_parameter_group_family_;
   }
    : describe_engine_default_parameters_message)

let make_describe_cache_subnet_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     cache_subnet_group_name = cache_subnet_group_name_;
   }
    : describe_cache_subnet_groups_message)

let make_cache_subnet_group_message
    ?cache_subnet_groups:(cache_subnet_groups_ : cache_subnet_groups option)
    ?marker:(marker_ : string_ option) () =
  ({ cache_subnet_groups = cache_subnet_groups_; marker = marker_ } : cache_subnet_group_message)

let make_describe_cache_security_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?cache_security_group_name:(cache_security_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     cache_security_group_name = cache_security_group_name_;
   }
    : describe_cache_security_groups_message)

let make_cache_security_group_message
    ?cache_security_groups:(cache_security_groups_ : cache_security_groups option)
    ?marker:(marker_ : string_ option) () =
  ({ cache_security_groups = cache_security_groups_; marker = marker_ }
    : cache_security_group_message)

let make_describe_cache_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?source:(source_ : string_ option)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     source = source_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : describe_cache_parameters_message)

let make_cache_parameter_group_details
    ?cache_node_type_specific_parameters:
      (cache_node_type_specific_parameters_ : cache_node_type_specific_parameters_list option)
    ?parameters:(parameters_ : parameters_list option) ?marker:(marker_ : string_ option) () =
  ({
     cache_node_type_specific_parameters = cache_node_type_specific_parameters_;
     parameters = parameters_;
     marker = marker_;
   }
    : cache_parameter_group_details)

let make_describe_cache_parameter_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : describe_cache_parameter_groups_message)

let make_cache_parameter_group ?ar_n:(ar_n_ : string_ option)
    ?is_global:(is_global_ : boolean_ option) ?description:(description_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option) () =
  ({
     ar_n = ar_n_;
     is_global = is_global_;
     description = description_;
     cache_parameter_group_family = cache_parameter_group_family_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : cache_parameter_group)

let make_cache_parameter_groups_message
    ?cache_parameter_groups:(cache_parameter_groups_ : cache_parameter_group_list option)
    ?marker:(marker_ : string_ option) () =
  ({ cache_parameter_groups = cache_parameter_groups_; marker = marker_ }
    : cache_parameter_groups_message)

let make_describe_cache_engine_versions_message ?default_only:(default_only_ : boolean_ option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     default_only = default_only_;
     marker = marker_;
     max_records = max_records_;
     cache_parameter_group_family = cache_parameter_group_family_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : describe_cache_engine_versions_message)

let make_cache_engine_version
    ?cache_engine_version_description:(cache_engine_version_description_ : string_ option)
    ?cache_engine_description:(cache_engine_description_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     cache_engine_version_description = cache_engine_version_description_;
     cache_engine_description = cache_engine_description_;
     cache_parameter_group_family = cache_parameter_group_family_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : cache_engine_version)

let make_cache_engine_version_message
    ?cache_engine_versions:(cache_engine_versions_ : cache_engine_version_list option)
    ?marker:(marker_ : string_ option) () =
  ({ cache_engine_versions = cache_engine_versions_; marker = marker_ }
    : cache_engine_version_message)

let make_describe_cache_clusters_message
    ?show_cache_clusters_not_in_replication_groups:
      (show_cache_clusters_not_in_replication_groups_ : boolean_optional option)
    ?show_cache_node_info:(show_cache_node_info_ : boolean_optional option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option) () =
  ({
     show_cache_clusters_not_in_replication_groups = show_cache_clusters_not_in_replication_groups_;
     show_cache_node_info = show_cache_node_info_;
     marker = marker_;
     max_records = max_records_;
     cache_cluster_id = cache_cluster_id_;
   }
    : describe_cache_clusters_message)

let make_cache_cluster_message ?cache_clusters:(cache_clusters_ : cache_cluster_list option)
    ?marker:(marker_ : string_ option) () =
  ({ cache_clusters = cache_clusters_; marker = marker_ } : cache_cluster_message)

let make_delete_user_message ~user_id:(user_id_ : user_id) () =
  ({ user_id = user_id_ } : delete_user_message)

let make_delete_user_group_message ~user_group_id:(user_group_id_ : string_) () =
  ({ user_group_id = user_group_id_ } : delete_user_group_message)

let make_delete_snapshot_message ~snapshot_name:(snapshot_name_ : string_) () =
  ({ snapshot_name = snapshot_name_ } : delete_snapshot_message)

let make_delete_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : delete_serverless_cache_snapshot_response)

let make_delete_serverless_cache_snapshot_request
    ~serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_) () =
  ({ serverless_cache_snapshot_name = serverless_cache_snapshot_name_ }
    : delete_serverless_cache_snapshot_request)

let make_delete_serverless_cache_response
    ?serverless_cache:(serverless_cache_ : serverless_cache option) () =
  ({ serverless_cache = serverless_cache_ } : delete_serverless_cache_response)

let make_delete_serverless_cache_request
    ?final_snapshot_name:(final_snapshot_name_ : string_ option)
    ~serverless_cache_name:(serverless_cache_name_ : string_) () =
  ({ final_snapshot_name = final_snapshot_name_; serverless_cache_name = serverless_cache_name_ }
    : delete_serverless_cache_request)

let make_delete_replication_group_message
    ?final_snapshot_identifier:(final_snapshot_identifier_ : string_ option)
    ?retain_primary_cluster:(retain_primary_cluster_ : boolean_optional option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     final_snapshot_identifier = final_snapshot_identifier_;
     retain_primary_cluster = retain_primary_cluster_;
     replication_group_id = replication_group_id_;
   }
    : delete_replication_group_message)

let make_delete_global_replication_group_message
    ~retain_primary_replication_group:(retain_primary_replication_group_ : boolean_)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     retain_primary_replication_group = retain_primary_replication_group_;
     global_replication_group_id = global_replication_group_id_;
   }
    : delete_global_replication_group_message)

let make_delete_cache_subnet_group_message
    ~cache_subnet_group_name:(cache_subnet_group_name_ : string_) () =
  ({ cache_subnet_group_name = cache_subnet_group_name_ } : delete_cache_subnet_group_message)

let make_delete_cache_security_group_message
    ~cache_security_group_name:(cache_security_group_name_ : string_) () =
  ({ cache_security_group_name = cache_security_group_name_ } : delete_cache_security_group_message)

let make_delete_cache_parameter_group_message
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({ cache_parameter_group_name = cache_parameter_group_name_ }
    : delete_cache_parameter_group_message)

let make_delete_cache_cluster_message
    ?final_snapshot_identifier:(final_snapshot_identifier_ : string_ option)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({ final_snapshot_identifier = final_snapshot_identifier_; cache_cluster_id = cache_cluster_id_ }
    : delete_cache_cluster_message)

let make_decrease_replica_count_message
    ?replicas_to_remove:(replicas_to_remove_ : remove_replicas_list option)
    ?replica_configuration:(replica_configuration_ : replica_configuration_list option)
    ?new_replica_count:(new_replica_count_ : integer_optional option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     replicas_to_remove = replicas_to_remove_;
     replica_configuration = replica_configuration_;
     new_replica_count = new_replica_count_;
     replication_group_id = replication_group_id_;
   }
    : decrease_replica_count_message)

let make_decrease_node_groups_in_global_replication_group_message
    ?global_node_groups_to_retain:(global_node_groups_to_retain_ : global_node_group_id_list option)
    ?global_node_groups_to_remove:(global_node_groups_to_remove_ : global_node_group_id_list option)
    ~apply_immediately:(apply_immediately_ : boolean_)
    ~node_group_count:(node_group_count_ : integer)
    ~global_replication_group_id:(global_replication_group_id_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     global_node_groups_to_retain = global_node_groups_to_retain_;
     global_node_groups_to_remove = global_node_groups_to_remove_;
     node_group_count = node_group_count_;
     global_replication_group_id = global_replication_group_id_;
   }
    : decrease_node_groups_in_global_replication_group_message)

let make_create_user_message
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ?tags:(tags_ : tag_list option)
    ?no_password_required:(no_password_required_ : boolean_optional option)
    ?passwords:(passwords_ : password_list_input option)
    ~access_string:(access_string_ : access_string) ~engine:(engine_ : engine_type)
    ~user_name:(user_name_ : user_name) ~user_id:(user_id_ : user_id) () =
  ({
     authentication_mode = authentication_mode_;
     tags = tags_;
     no_password_required = no_password_required_;
     access_string = access_string_;
     passwords = passwords_;
     engine = engine_;
     user_name = user_name_;
     user_id = user_id_;
   }
    : create_user_message)

let make_create_user_group_message ?tags:(tags_ : tag_list option)
    ?user_ids:(user_ids_ : user_id_list_input option) ~engine:(engine_ : engine_type)
    ~user_group_id:(user_group_id_ : string_) () =
  ({ tags = tags_; user_ids = user_ids_; engine = engine_; user_group_id = user_group_id_ }
    : create_user_group_message)

let make_create_snapshot_message ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ~snapshot_name:(snapshot_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     snapshot_name = snapshot_name_;
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
   }
    : create_snapshot_message)

let make_create_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : create_serverless_cache_snapshot_response)

let make_create_serverless_cache_snapshot_request ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ~serverless_cache_name:(serverless_cache_name_ : string_)
    ~serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     serverless_cache_name = serverless_cache_name_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
   }
    : create_serverless_cache_snapshot_request)

let make_create_serverless_cache_response
    ?serverless_cache:(serverless_cache_ : serverless_cache option) () =
  ({ serverless_cache = serverless_cache_ } : create_serverless_cache_response)

let make_create_serverless_cache_request ?network_type:(network_type_ : network_type option)
    ?daily_snapshot_time:(daily_snapshot_time_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_list option)
    ?user_group_id:(user_group_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?snapshot_arns_to_restore:(snapshot_arns_to_restore_ : snapshot_arns_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?description:(description_ : string_ option) ~engine:(engine_ : string_)
    ~serverless_cache_name:(serverless_cache_name_ : string_) () =
  ({
     network_type = network_type_;
     daily_snapshot_time = daily_snapshot_time_;
     snapshot_retention_limit = snapshot_retention_limit_;
     subnet_ids = subnet_ids_;
     user_group_id = user_group_id_;
     tags = tags_;
     snapshot_arns_to_restore = snapshot_arns_to_restore_;
     security_group_ids = security_group_ids_;
     kms_key_id = kms_key_id_;
     cache_usage_limits = cache_usage_limits_;
     major_engine_version = major_engine_version_;
     engine = engine_;
     description = description_;
     serverless_cache_name = serverless_cache_name_;
   }
    : create_serverless_cache_request)

let make_create_replication_group_message ?durability:(durability_ : durability option)
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?data_tiering_enabled:(data_tiering_enabled_ : boolean_optional option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?user_group_ids:(user_group_ids_ : user_group_id_list_input option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?auth_token:(auth_token_ : string_ option) ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option) ?tags:(tags_ : tag_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?node_group_configuration:(node_group_configuration_ : node_group_configuration_list option)
    ?replicas_per_node_group:(replicas_per_node_group_ : integer_optional option)
    ?num_node_groups:(num_node_groups_ : integer_optional option)
    ?preferred_cache_cluster_a_zs:(preferred_cache_cluster_a_zs_ : availability_zones_list option)
    ?num_cache_clusters:(num_cache_clusters_ : integer_optional option)
    ?multi_az_enabled:(multi_az_enabled_ : boolean_optional option)
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ?primary_cluster_id:(primary_cluster_id_ : string_ option)
    ?global_replication_group_id:(global_replication_group_id_ : string_ option)
    ~replication_group_description:(replication_group_description_ : string_)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     durability = durability_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     cluster_mode = cluster_mode_;
     transit_encryption_mode = transit_encryption_mode_;
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     data_tiering_enabled = data_tiering_enabled_;
     log_delivery_configurations = log_delivery_configurations_;
     user_group_ids = user_group_ids_;
     kms_key_id = kms_key_id_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     transit_encryption_enabled = transit_encryption_enabled_;
     auth_token = auth_token_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     notification_topic_arn = notification_topic_arn_;
     port = port_;
     preferred_maintenance_window = preferred_maintenance_window_;
     snapshot_name = snapshot_name_;
     snapshot_arns = snapshot_arns_;
     tags = tags_;
     security_group_ids = security_group_ids_;
     cache_security_group_names = cache_security_group_names_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_parameter_group_name = cache_parameter_group_name_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     node_group_configuration = node_group_configuration_;
     replicas_per_node_group = replicas_per_node_group_;
     num_node_groups = num_node_groups_;
     preferred_cache_cluster_a_zs = preferred_cache_cluster_a_zs_;
     num_cache_clusters = num_cache_clusters_;
     multi_az_enabled = multi_az_enabled_;
     automatic_failover_enabled = automatic_failover_enabled_;
     primary_cluster_id = primary_cluster_id_;
     global_replication_group_id = global_replication_group_id_;
     replication_group_description = replication_group_description_;
     replication_group_id = replication_group_id_;
   }
    : create_replication_group_message)

let make_create_global_replication_group_message
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ~primary_replication_group_id:(primary_replication_group_id_ : string_)
    ~global_replication_group_id_suffix:(global_replication_group_id_suffix_ : string_) () =
  ({
     primary_replication_group_id = primary_replication_group_id_;
     global_replication_group_description = global_replication_group_description_;
     global_replication_group_id_suffix = global_replication_group_id_suffix_;
   }
    : create_global_replication_group_message)

let make_create_cache_subnet_group_message ?tags:(tags_ : tag_list option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~cache_subnet_group_description:(cache_subnet_group_description_ : string_)
    ~cache_subnet_group_name:(cache_subnet_group_name_ : string_) () =
  ({
     tags = tags_;
     subnet_ids = subnet_ids_;
     cache_subnet_group_description = cache_subnet_group_description_;
     cache_subnet_group_name = cache_subnet_group_name_;
   }
    : create_cache_subnet_group_message)

let make_create_cache_security_group_message ?tags:(tags_ : tag_list option)
    ~description:(description_ : string_)
    ~cache_security_group_name:(cache_security_group_name_ : string_) () =
  ({
     tags = tags_;
     description = description_;
     cache_security_group_name = cache_security_group_name_;
   }
    : create_cache_security_group_message)

let make_create_cache_parameter_group_message ?tags:(tags_ : tag_list option)
    ~description:(description_ : string_)
    ~cache_parameter_group_family:(cache_parameter_group_family_ : string_)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     tags = tags_;
     description = description_;
     cache_parameter_group_family = cache_parameter_group_family_;
     cache_parameter_group_name = cache_parameter_group_name_;
   }
    : create_cache_parameter_group_message)

let make_create_cache_cluster_message ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?preferred_outpost_arns:(preferred_outpost_arns_ : preferred_outpost_arn_list option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?outpost_mode:(outpost_mode_ : outpost_mode option) ?auth_token:(auth_token_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option) ?tags:(tags_ : tag_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?preferred_availability_zones:
      (preferred_availability_zones_ : preferred_availability_zone_list option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?az_mode:(az_mode_ : az_mode option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     transit_encryption_enabled = transit_encryption_enabled_;
     log_delivery_configurations = log_delivery_configurations_;
     preferred_outpost_arns = preferred_outpost_arns_;
     preferred_outpost_arn = preferred_outpost_arn_;
     outpost_mode = outpost_mode_;
     auth_token = auth_token_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     notification_topic_arn = notification_topic_arn_;
     port = port_;
     preferred_maintenance_window = preferred_maintenance_window_;
     snapshot_name = snapshot_name_;
     snapshot_arns = snapshot_arns_;
     tags = tags_;
     security_group_ids = security_group_ids_;
     cache_security_group_names = cache_security_group_names_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_parameter_group_name = cache_parameter_group_name_;
     engine_version = engine_version_;
     engine = engine_;
     cache_node_type = cache_node_type_;
     num_cache_nodes = num_cache_nodes_;
     preferred_availability_zones = preferred_availability_zones_;
     preferred_availability_zone = preferred_availability_zone_;
     az_mode = az_mode_;
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
   }
    : create_cache_cluster_message)

let make_copy_snapshot_message ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?target_bucket:(target_bucket_ : string_ option)
    ~target_snapshot_name:(target_snapshot_name_ : string_)
    ~source_snapshot_name:(source_snapshot_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     target_bucket = target_bucket_;
     target_snapshot_name = target_snapshot_name_;
     source_snapshot_name = source_snapshot_name_;
   }
    : copy_snapshot_message)

let make_copy_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : copy_serverless_cache_snapshot_response)

let make_copy_serverless_cache_snapshot_request ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ~target_serverless_cache_snapshot_name:(target_serverless_cache_snapshot_name_ : string_)
    ~source_serverless_cache_snapshot_name:(source_serverless_cache_snapshot_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     target_serverless_cache_snapshot_name = target_serverless_cache_snapshot_name_;
     source_serverless_cache_snapshot_name = source_serverless_cache_snapshot_name_;
   }
    : copy_serverless_cache_snapshot_request)

let make_complete_migration_response
    ?replication_group:(replication_group_ : replication_group option) () =
  ({ replication_group = replication_group_ } : complete_migration_response)

let make_complete_migration_message ?force:(force_ : boolean_ option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({ force = force_; replication_group_id = replication_group_id_ } : complete_migration_message)

let make_batch_stop_update_action_message
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ~service_update_name:(service_update_name_ : string_) () =
  ({
     service_update_name = service_update_name_;
     cache_cluster_ids = cache_cluster_ids_;
     replication_group_ids = replication_group_ids_;
   }
    : batch_stop_update_action_message)

let make_batch_apply_update_action_message
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ~service_update_name:(service_update_name_ : string_) () =
  ({
     service_update_name = service_update_name_;
     cache_cluster_ids = cache_cluster_ids_;
     replication_group_ids = replication_group_ids_;
   }
    : batch_apply_update_action_message)

let make_authorize_cache_security_group_ingress_message
    ~ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_)
    ~ec2_security_group_name:(ec2_security_group_name_ : string_)
    ~cache_security_group_name:(cache_security_group_name_ : string_) () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_name = ec2_security_group_name_;
     cache_security_group_name = cache_security_group_name_;
   }
    : authorize_cache_security_group_ingress_message)

let make_add_tags_to_resource_message ~tags:(tags_ : tag_list)
    ~resource_name:(resource_name_ : string_) () =
  ({ tags = tags_; resource_name = resource_name_ } : add_tags_to_resource_message)
