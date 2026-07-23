open Types

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_list_message ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_list_message)

let make_add_tags_to_resource_message ~resource_name:(resource_name_ : string_)
    ~tags:(tags_ : tag_list) () =
  ({ resource_name = resource_name_; tags = tags_ } : add_tags_to_resource_message)

let make_allowed_node_type_modifications_message
    ?scale_up_modifications:(scale_up_modifications_ : node_type_list option)
    ?scale_down_modifications:(scale_down_modifications_ : node_type_list option) () =
  ({
     scale_up_modifications = scale_up_modifications_;
     scale_down_modifications = scale_down_modifications_;
   }
    : allowed_node_type_modifications_message)

let make_kinesis_firehose_destination_details ?delivery_stream:(delivery_stream_ : string_ option)
    () =
  ({ delivery_stream = delivery_stream_ } : kinesis_firehose_destination_details)

let make_cloud_watch_logs_destination_details ?log_group:(log_group_ : string_ option) () =
  ({ log_group = log_group_ } : cloud_watch_logs_destination_details)

let make_destination_details
    ?cloud_watch_logs_details:
      (cloud_watch_logs_details_ : cloud_watch_logs_destination_details option)
    ?kinesis_firehose_details:
      (kinesis_firehose_details_ : kinesis_firehose_destination_details option) () =
  ({
     cloud_watch_logs_details = cloud_watch_logs_details_;
     kinesis_firehose_details = kinesis_firehose_details_;
   }
    : destination_details)

let make_log_delivery_configuration ?log_type:(log_type_ : log_type option)
    ?destination_type:(destination_type_ : destination_type option)
    ?destination_details:(destination_details_ : destination_details option)
    ?log_format:(log_format_ : log_format option)
    ?status:(status_ : log_delivery_configuration_status option)
    ?message:(message_ : string_ option) () =
  ({
     log_type = log_type_;
     destination_type = destination_type_;
     destination_details = destination_details_;
     log_format = log_format_;
     status = status_;
     message = message_;
   }
    : log_delivery_configuration)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option) () =
  ({ address = address_; port = port_ } : endpoint)

let make_node_group_member ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?read_endpoint:(read_endpoint_ : endpoint option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?current_role:(current_role_ : string_ option) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     cache_node_id = cache_node_id_;
     read_endpoint = read_endpoint_;
     preferred_availability_zone = preferred_availability_zone_;
     preferred_outpost_arn = preferred_outpost_arn_;
     current_role = current_role_;
   }
    : node_group_member)

let make_node_group ?node_group_id:(node_group_id_ : string_ option)
    ?status:(status_ : string_ option) ?primary_endpoint:(primary_endpoint_ : endpoint option)
    ?reader_endpoint:(reader_endpoint_ : endpoint option) ?slots:(slots_ : string_ option)
    ?node_group_members:(node_group_members_ : node_group_member_list option) () =
  ({
     node_group_id = node_group_id_;
     status = status_;
     primary_endpoint = primary_endpoint_;
     reader_endpoint = reader_endpoint_;
     slots = slots_;
     node_group_members = node_group_members_;
   }
    : node_group)

let make_pending_log_delivery_configuration ?log_type:(log_type_ : log_type option)
    ?destination_type:(destination_type_ : destination_type option)
    ?destination_details:(destination_details_ : destination_details option)
    ?log_format:(log_format_ : log_format option) () =
  ({
     log_type = log_type_;
     destination_type = destination_type_;
     destination_details = destination_details_;
     log_format = log_format_;
   }
    : pending_log_delivery_configuration)

let make_user_groups_update_status
    ?user_group_ids_to_add:(user_group_ids_to_add_ : user_group_id_list option)
    ?user_group_ids_to_remove:(user_group_ids_to_remove_ : user_group_id_list option) () =
  ({
     user_group_ids_to_add = user_group_ids_to_add_;
     user_group_ids_to_remove = user_group_ids_to_remove_;
   }
    : user_groups_update_status)

let make_slot_migration ?progress_percentage:(progress_percentage_ : double option) () =
  ({ progress_percentage = progress_percentage_ } : slot_migration)

let make_resharding_status ?slot_migration:(slot_migration_ : slot_migration option) () =
  ({ slot_migration = slot_migration_ } : resharding_status)

let make_replication_group_pending_modified_values
    ?primary_cluster_id:(primary_cluster_id_ : string_ option)
    ?automatic_failover_status:
      (automatic_failover_status_ : pending_automatic_failover_status option)
    ?resharding:(resharding_ : resharding_status option)
    ?auth_token_status:(auth_token_status_ : auth_token_update_status option)
    ?user_groups:(user_groups_ : user_groups_update_status option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : pending_log_delivery_configuration_list option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option) () =
  ({
     primary_cluster_id = primary_cluster_id_;
     automatic_failover_status = automatic_failover_status_;
     resharding = resharding_;
     auth_token_status = auth_token_status_;
     user_groups = user_groups_;
     log_delivery_configurations = log_delivery_configurations_;
     transit_encryption_enabled = transit_encryption_enabled_;
     transit_encryption_mode = transit_encryption_mode_;
     cluster_mode = cluster_mode_;
   }
    : replication_group_pending_modified_values)

let make_global_replication_group_info
    ?global_replication_group_id:(global_replication_group_id_ : string_ option)
    ?global_replication_group_member_role:(global_replication_group_member_role_ : string_ option)
    () =
  ({
     global_replication_group_id = global_replication_group_id_;
     global_replication_group_member_role = global_replication_group_member_role_;
   }
    : global_replication_group_info)

let make_replication_group ?replication_group_id:(replication_group_id_ : string_ option)
    ?description:(description_ : string_ option)
    ?global_replication_group_info:
      (global_replication_group_info_ : global_replication_group_info option)
    ?status:(status_ : string_ option)
    ?pending_modified_values:
      (pending_modified_values_ : replication_group_pending_modified_values option)
    ?member_clusters:(member_clusters_ : cluster_id_list option)
    ?node_groups:(node_groups_ : node_group_list option)
    ?snapshotting_cluster_id:(snapshotting_cluster_id_ : string_ option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?multi_a_z:(multi_a_z_ : multi_az_status option)
    ?configuration_endpoint:(configuration_endpoint_ : endpoint option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?cluster_enabled:(cluster_enabled_ : boolean_optional option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?auth_token_last_modified_date:(auth_token_last_modified_date_ : t_stamp option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?member_clusters_outpost_arns:
      (member_clusters_outpost_arns_ : replication_group_outpost_arn_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?ar_n:(ar_n_ : string_ option) ?user_group_ids:(user_group_ids_ : user_group_id_list option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_list option)
    ?replication_group_create_time:(replication_group_create_time_ : t_stamp option)
    ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option) ?engine:(engine_ : string_ option)
    ?durability:(durability_ : durability option)
    ?effective_durability:(effective_durability_ : effective_durability option) () =
  ({
     replication_group_id = replication_group_id_;
     description = description_;
     global_replication_group_info = global_replication_group_info_;
     status = status_;
     pending_modified_values = pending_modified_values_;
     member_clusters = member_clusters_;
     node_groups = node_groups_;
     snapshotting_cluster_id = snapshotting_cluster_id_;
     automatic_failover = automatic_failover_;
     multi_a_z = multi_a_z_;
     configuration_endpoint = configuration_endpoint_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     cluster_enabled = cluster_enabled_;
     cache_node_type = cache_node_type_;
     auth_token_enabled = auth_token_enabled_;
     auth_token_last_modified_date = auth_token_last_modified_date_;
     transit_encryption_enabled = transit_encryption_enabled_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     member_clusters_outpost_arns = member_clusters_outpost_arns_;
     kms_key_id = kms_key_id_;
     storage_encryption_type = storage_encryption_type_;
     ar_n = ar_n_;
     user_group_ids = user_group_ids_;
     log_delivery_configurations = log_delivery_configurations_;
     replication_group_create_time = replication_group_create_time_;
     data_tiering = data_tiering_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
     transit_encryption_mode = transit_encryption_mode_;
     cluster_mode = cluster_mode_;
     engine = engine_;
     durability = durability_;
     effective_durability = effective_durability_;
   }
    : replication_group)

let make_test_migration_response ?replication_group:(replication_group_ : replication_group option)
    () =
  ({ replication_group = replication_group_ } : test_migration_response)

let make_customer_node_endpoint ?address:(address_ : string_ option)
    ?port:(port_ : integer_optional option) () =
  ({ address = address_; port = port_ } : customer_node_endpoint)

let make_test_migration_message ~replication_group_id:(replication_group_id_ : string_)
    ~customer_node_endpoint_list:(customer_node_endpoint_list_ : customer_node_endpoint_list) () =
  ({
     replication_group_id = replication_group_id_;
     customer_node_endpoint_list = customer_node_endpoint_list_;
   }
    : test_migration_message)

let make_test_failover_message ~replication_group_id:(replication_group_id_ : string_)
    ~node_group_id:(node_group_id_ : allowed_node_group_id) () =
  ({ replication_group_id = replication_group_id_; node_group_id = node_group_id_ }
    : test_failover_message)

let make_start_migration_response ?replication_group:(replication_group_ : replication_group option)
    () =
  ({ replication_group = replication_group_ } : start_migration_response)

let make_start_migration_message ~replication_group_id:(replication_group_id_ : string_)
    ~customer_node_endpoint_list:(customer_node_endpoint_list_ : customer_node_endpoint_list) () =
  ({
     replication_group_id = replication_group_id_;
     customer_node_endpoint_list = customer_node_endpoint_list_;
   }
    : start_migration_message)

let make_ec2_security_group ?status:(status_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option) () =
  ({
     status = status_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : ec2_security_group)

let make_cache_security_group ?owner_id:(owner_id_ : string_ option)
    ?cache_security_group_name:(cache_security_group_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?ec2_security_groups:(ec2_security_groups_ : ec2_security_group_list option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({
     owner_id = owner_id_;
     cache_security_group_name = cache_security_group_name_;
     description = description_;
     ec2_security_groups = ec2_security_groups_;
     ar_n = ar_n_;
   }
    : cache_security_group)

let make_revoke_cache_security_group_ingress_message
    ~cache_security_group_name:(cache_security_group_name_ : string_)
    ~ec2_security_group_name:(ec2_security_group_name_ : string_)
    ~ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_) () =
  ({
     cache_security_group_name = cache_security_group_name_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : revoke_cache_security_group_ingress_message)

let make_cache_parameter_group_name_message
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option) () =
  ({ cache_parameter_group_name = cache_parameter_group_name_ }
    : cache_parameter_group_name_message)

let make_parameter_name_value ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ } : parameter_name_value)

let make_reset_cache_parameter_group_message
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ?parameter_name_values:(parameter_name_values_ : parameter_name_value_list option)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     reset_all_parameters = reset_all_parameters_;
     parameter_name_values = parameter_name_values_;
   }
    : reset_cache_parameter_group_message)

let make_remove_tags_from_resource_message ~resource_name:(resource_name_ : string_)
    ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_name = resource_name_; tag_keys = tag_keys_ } : remove_tags_from_resource_message)

let make_security_group_membership ?security_group_id:(security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ security_group_id = security_group_id_; status = status_ } : security_group_membership)

let make_cache_node ?cache_node_id:(cache_node_id_ : string_ option)
    ?cache_node_status:(cache_node_status_ : string_ option)
    ?cache_node_create_time:(cache_node_create_time_ : t_stamp option)
    ?endpoint:(endpoint_ : endpoint option)
    ?parameter_group_status:(parameter_group_status_ : string_ option)
    ?source_cache_node_id:(source_cache_node_id_ : string_ option)
    ?customer_availability_zone:(customer_availability_zone_ : string_ option)
    ?customer_outpost_arn:(customer_outpost_arn_ : string_ option) () =
  ({
     cache_node_id = cache_node_id_;
     cache_node_status = cache_node_status_;
     cache_node_create_time = cache_node_create_time_;
     endpoint = endpoint_;
     parameter_group_status = parameter_group_status_;
     source_cache_node_id = source_cache_node_id_;
     customer_availability_zone = customer_availability_zone_;
     customer_outpost_arn = customer_outpost_arn_;
   }
    : cache_node)

let make_cache_parameter_group_status
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?cache_node_ids_to_reboot:(cache_node_ids_to_reboot_ : cache_node_ids_list option) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     parameter_apply_status = parameter_apply_status_;
     cache_node_ids_to_reboot = cache_node_ids_to_reboot_;
   }
    : cache_parameter_group_status)

let make_cache_security_group_membership
    ?cache_security_group_name:(cache_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ cache_security_group_name = cache_security_group_name_; status = status_ }
    : cache_security_group_membership)

let make_notification_configuration ?topic_arn:(topic_arn_ : string_ option)
    ?topic_status:(topic_status_ : string_ option) () =
  ({ topic_arn = topic_arn_; topic_status = topic_status_ } : notification_configuration)

let make_scale_config ?scale_percentage:(scale_percentage_ : integer_optional option)
    ?scale_interval_minutes:(scale_interval_minutes_ : integer_optional option) () =
  ({ scale_percentage = scale_percentage_; scale_interval_minutes = scale_interval_minutes_ }
    : scale_config)

let make_pending_modified_values ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?cache_node_ids_to_remove:(cache_node_ids_to_remove_ : cache_node_ids_list option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option)
    ?auth_token_status:(auth_token_status_ : auth_token_update_status option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : pending_log_delivery_configuration_list option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?scale_config:(scale_config_ : scale_config option) () =
  ({
     num_cache_nodes = num_cache_nodes_;
     cache_node_ids_to_remove = cache_node_ids_to_remove_;
     engine_version = engine_version_;
     cache_node_type = cache_node_type_;
     auth_token_status = auth_token_status_;
     log_delivery_configurations = log_delivery_configurations_;
     transit_encryption_enabled = transit_encryption_enabled_;
     transit_encryption_mode = transit_encryption_mode_;
     scale_config = scale_config_;
   }
    : pending_modified_values)

let make_cache_cluster ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?configuration_endpoint:(configuration_endpoint_ : endpoint option)
    ?client_download_landing_page:(client_download_landing_page_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_cluster_status:(cache_cluster_status_ : string_ option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?cache_cluster_create_time:(cache_cluster_create_time_ : t_stamp option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?cache_security_groups:(cache_security_groups_ : cache_security_group_membership_list option)
    ?cache_parameter_group:(cache_parameter_group_ : cache_parameter_group_status option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_nodes:(cache_nodes_ : cache_node_list option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?auth_token_last_modified_date:(auth_token_last_modified_date_ : t_stamp option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?ar_n:(ar_n_ : string_ option)
    ?replication_group_log_delivery_enabled:
      (replication_group_log_delivery_enabled_ : boolean_ option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_list option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     configuration_endpoint = configuration_endpoint_;
     client_download_landing_page = client_download_landing_page_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     cache_cluster_status = cache_cluster_status_;
     num_cache_nodes = num_cache_nodes_;
     preferred_availability_zone = preferred_availability_zone_;
     preferred_outpost_arn = preferred_outpost_arn_;
     cache_cluster_create_time = cache_cluster_create_time_;
     preferred_maintenance_window = preferred_maintenance_window_;
     pending_modified_values = pending_modified_values_;
     notification_configuration = notification_configuration_;
     cache_security_groups = cache_security_groups_;
     cache_parameter_group = cache_parameter_group_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_nodes = cache_nodes_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     security_groups = security_groups_;
     replication_group_id = replication_group_id_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     auth_token_enabled = auth_token_enabled_;
     auth_token_last_modified_date = auth_token_last_modified_date_;
     transit_encryption_enabled = transit_encryption_enabled_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     ar_n = ar_n_;
     replication_group_log_delivery_enabled = replication_group_log_delivery_enabled_;
     log_delivery_configurations = log_delivery_configurations_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
     transit_encryption_mode = transit_encryption_mode_;
   }
    : cache_cluster)

let make_reboot_cache_cluster_message ~cache_cluster_id:(cache_cluster_id_ : string_)
    ~cache_node_ids_to_reboot:(cache_node_ids_to_reboot_ : cache_node_ids_list) () =
  ({ cache_cluster_id = cache_cluster_id_; cache_node_ids_to_reboot = cache_node_ids_to_reboot_ }
    : reboot_cache_cluster_message)

let make_global_node_group ?global_node_group_id:(global_node_group_id_ : string_ option)
    ?slots:(slots_ : string_ option) () =
  ({ global_node_group_id = global_node_group_id_; slots = slots_ } : global_node_group)

let make_global_replication_group_member
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?replication_group_region:(replication_group_region_ : string_ option)
    ?role:(role_ : string_ option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?status:(status_ : string_ option) () =
  ({
     replication_group_id = replication_group_id_;
     replication_group_region = replication_group_region_;
     role = role_;
     automatic_failover = automatic_failover_;
     status = status_;
   }
    : global_replication_group_member)

let make_global_replication_group
    ?global_replication_group_id:(global_replication_group_id_ : string_ option)
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ?status:(status_ : string_ option) ?cache_node_type:(cache_node_type_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?members:(members_ : global_replication_group_member_list option)
    ?cluster_enabled:(cluster_enabled_ : boolean_optional option)
    ?global_node_groups:(global_node_groups_ : global_node_group_list option)
    ?auth_token_enabled:(auth_token_enabled_ : boolean_optional option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     global_replication_group_description = global_replication_group_description_;
     status = status_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     members = members_;
     cluster_enabled = cluster_enabled_;
     global_node_groups = global_node_groups_;
     auth_token_enabled = auth_token_enabled_;
     transit_encryption_enabled = transit_encryption_enabled_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     ar_n = ar_n_;
   }
    : global_replication_group)

let make_rebalance_slots_in_global_replication_group_message
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     apply_immediately = apply_immediately_;
   }
    : rebalance_slots_in_global_replication_group_message)

let make_recurring_charge ?recurring_charge_amount:(recurring_charge_amount_ : double option)
    ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option) () =
  ({
     recurring_charge_amount = recurring_charge_amount_;
     recurring_charge_frequency = recurring_charge_frequency_;
   }
    : recurring_charge)

let make_reserved_cache_node ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?start_time:(start_time_ : t_stamp option)
    ?duration:(duration_ : integer option) ?fixed_price:(fixed_price_ : double option)
    ?usage_price:(usage_price_ : double option)
    ?cache_node_count:(cache_node_count_ : integer option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option) ?state:(state_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?reservation_ar_n:(reservation_ar_n_ : string_ option) () =
  ({
     reserved_cache_node_id = reserved_cache_node_id_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     cache_node_type = cache_node_type_;
     start_time = start_time_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     cache_node_count = cache_node_count_;
     product_description = product_description_;
     offering_type = offering_type_;
     state = state_;
     recurring_charges = recurring_charges_;
     reservation_ar_n = reservation_ar_n_;
   }
    : reserved_cache_node)

let make_purchase_reserved_cache_nodes_offering_message
    ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option)
    ?cache_node_count:(cache_node_count_ : integer_optional option) ?tags:(tags_ : tag_list option)
    ~reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_) () =
  ({
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     reserved_cache_node_id = reserved_cache_node_id_;
     cache_node_count = cache_node_count_;
     tags = tags_;
   }
    : purchase_reserved_cache_nodes_offering_message)

let make_user_group_pending_changes ?user_ids_to_remove:(user_ids_to_remove_ : user_id_list option)
    ?user_ids_to_add:(user_ids_to_add_ : user_id_list option) () =
  ({ user_ids_to_remove = user_ids_to_remove_; user_ids_to_add = user_ids_to_add_ }
    : user_group_pending_changes)

let make_user_group ?user_group_id:(user_group_id_ : string_ option)
    ?status:(status_ : string_ option) ?engine:(engine_ : engine_type option)
    ?user_ids:(user_ids_ : user_id_list option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?pending_changes:(pending_changes_ : user_group_pending_changes option)
    ?replication_groups:(replication_groups_ : ug_replication_group_id_list option)
    ?serverless_caches:(serverless_caches_ : ug_serverless_cache_id_list option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({
     user_group_id = user_group_id_;
     status = status_;
     engine = engine_;
     user_ids = user_ids_;
     minimum_engine_version = minimum_engine_version_;
     pending_changes = pending_changes_;
     replication_groups = replication_groups_;
     serverless_caches = serverless_caches_;
     ar_n = ar_n_;
   }
    : user_group)

let make_modify_user_group_message ?user_ids_to_add:(user_ids_to_add_ : user_id_list_input option)
    ?user_ids_to_remove:(user_ids_to_remove_ : user_id_list_input option)
    ?engine:(engine_ : engine_type option) ~user_group_id:(user_group_id_ : string_) () =
  ({
     user_group_id = user_group_id_;
     user_ids_to_add = user_ids_to_add_;
     user_ids_to_remove = user_ids_to_remove_;
     engine = engine_;
   }
    : modify_user_group_message)

let make_authentication ?type_:(type__ : authentication_type option)
    ?password_count:(password_count_ : integer_optional option) () =
  ({ type_ = type__; password_count = password_count_ } : authentication)

let make_user ?user_id:(user_id_ : string_ option) ?user_name:(user_name_ : string_ option)
    ?status:(status_ : string_ option) ?engine:(engine_ : engine_type option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?access_string:(access_string_ : string_ option)
    ?user_group_ids:(user_group_ids_ : user_group_id_list option)
    ?authentication:(authentication_ : authentication option) ?ar_n:(ar_n_ : string_ option) () =
  ({
     user_id = user_id_;
     user_name = user_name_;
     status = status_;
     engine = engine_;
     minimum_engine_version = minimum_engine_version_;
     access_string = access_string_;
     user_group_ids = user_group_ids_;
     authentication = authentication_;
     ar_n = ar_n_;
   }
    : user)

let make_authentication_mode ?type_:(type__ : input_authentication_type option)
    ?passwords:(passwords_ : password_list_input option) () =
  ({ type_ = type__; passwords = passwords_ } : authentication_mode)

let make_modify_user_message ?access_string:(access_string_ : access_string option)
    ?append_access_string:(append_access_string_ : access_string option)
    ?passwords:(passwords_ : password_list_input option)
    ?no_password_required:(no_password_required_ : boolean_optional option)
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ?engine:(engine_ : engine_type option) ~user_id:(user_id_ : user_id) () =
  ({
     user_id = user_id_;
     access_string = access_string_;
     append_access_string = append_access_string_;
     passwords = passwords_;
     no_password_required = no_password_required_;
     authentication_mode = authentication_mode_;
     engine = engine_;
   }
    : modify_user_message)

let make_ecpu_per_second ?maximum:(maximum_ : integer_optional option)
    ?minimum:(minimum_ : integer_optional option) () =
  ({ maximum = maximum_; minimum = minimum_ } : ecpu_per_second)

let make_data_storage ?maximum:(maximum_ : integer_optional option)
    ?minimum:(minimum_ : integer_optional option) ~unit_:(unit__ : data_storage_unit) () =
  ({ maximum = maximum_; minimum = minimum_; unit_ = unit__ } : data_storage)

let make_cache_usage_limits ?data_storage:(data_storage_ : data_storage option)
    ?ecpu_per_second:(ecpu_per_second_ : ecpu_per_second option) () =
  ({ data_storage = data_storage_; ecpu_per_second = ecpu_per_second_ } : cache_usage_limits)

let make_serverless_cache ?serverless_cache_name:(serverless_cache_name_ : string_ option)
    ?description:(description_ : string_ option) ?create_time:(create_time_ : t_stamp option)
    ?status:(status_ : string_ option) ?engine:(engine_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?full_engine_version:(full_engine_version_ : string_ option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?endpoint:(endpoint_ : endpoint option) ?reader_endpoint:(reader_endpoint_ : endpoint option)
    ?ar_n:(ar_n_ : string_ option) ?user_group_id:(user_group_id_ : string_ option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_list option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?daily_snapshot_time:(daily_snapshot_time_ : string_ option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     serverless_cache_name = serverless_cache_name_;
     description = description_;
     create_time = create_time_;
     status = status_;
     engine = engine_;
     major_engine_version = major_engine_version_;
     full_engine_version = full_engine_version_;
     cache_usage_limits = cache_usage_limits_;
     kms_key_id = kms_key_id_;
     storage_encryption_type = storage_encryption_type_;
     security_group_ids = security_group_ids_;
     endpoint = endpoint_;
     reader_endpoint = reader_endpoint_;
     ar_n = ar_n_;
     user_group_id = user_group_id_;
     subnet_ids = subnet_ids_;
     snapshot_retention_limit = snapshot_retention_limit_;
     daily_snapshot_time = daily_snapshot_time_;
     network_type = network_type_;
   }
    : serverless_cache)

let make_modify_serverless_cache_response
    ?serverless_cache:(serverless_cache_ : serverless_cache option) () =
  ({ serverless_cache = serverless_cache_ } : modify_serverless_cache_response)

let make_modify_serverless_cache_request ?description:(description_ : string_ option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?remove_user_group:(remove_user_group_ : boolean_optional option)
    ?user_group_id:(user_group_id_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?daily_snapshot_time:(daily_snapshot_time_ : string_ option) ?engine:(engine_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ~serverless_cache_name:(serverless_cache_name_ : string_) () =
  ({
     serverless_cache_name = serverless_cache_name_;
     description = description_;
     cache_usage_limits = cache_usage_limits_;
     remove_user_group = remove_user_group_;
     user_group_id = user_group_id_;
     security_group_ids = security_group_ids_;
     snapshot_retention_limit = snapshot_retention_limit_;
     daily_snapshot_time = daily_snapshot_time_;
     engine = engine_;
     major_engine_version = major_engine_version_;
   }
    : modify_serverless_cache_request)

let make_resharding_configuration ?node_group_id:(node_group_id_ : allowed_node_group_id option)
    ?preferred_availability_zones:(preferred_availability_zones_ : availability_zones_list option)
    () =
  ({ node_group_id = node_group_id_; preferred_availability_zones = preferred_availability_zones_ }
    : resharding_configuration)

let make_modify_replication_group_shard_configuration_message
    ?resharding_configuration:(resharding_configuration_ : resharding_configuration_list option)
    ?node_groups_to_remove:(node_groups_to_remove_ : node_groups_to_remove_list option)
    ?node_groups_to_retain:(node_groups_to_retain_ : node_groups_to_retain_list option)
    ~replication_group_id:(replication_group_id_ : string_)
    ~node_group_count:(node_group_count_ : integer)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     replication_group_id = replication_group_id_;
     node_group_count = node_group_count_;
     apply_immediately = apply_immediately_;
     resharding_configuration = resharding_configuration_;
     node_groups_to_remove = node_groups_to_remove_;
     node_groups_to_retain = node_groups_to_retain_;
   }
    : modify_replication_group_shard_configuration_message)

let make_log_delivery_configuration_request ?log_type:(log_type_ : log_type option)
    ?destination_type:(destination_type_ : destination_type option)
    ?destination_details:(destination_details_ : destination_details option)
    ?log_format:(log_format_ : log_format option) ?enabled:(enabled_ : boolean_optional option) () =
  ({
     log_type = log_type_;
     destination_type = destination_type_;
     destination_details = destination_details_;
     log_format = log_format_;
     enabled = enabled_;
   }
    : log_delivery_configuration_request)

let make_modify_replication_group_message
    ?replication_group_description:(replication_group_description_ : string_ option)
    ?primary_cluster_id:(primary_cluster_id_ : string_ option)
    ?snapshotting_cluster_id:(snapshotting_cluster_id_ : string_ option)
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ?multi_az_enabled:(multi_az_enabled_ : boolean_optional option)
    ?node_group_id:(node_group_id_ : string_ option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?auth_token:(auth_token_ : string_ option)
    ?auth_token_update_strategy:
      (auth_token_update_strategy_ : auth_token_update_strategy_type option)
    ?user_group_ids_to_add:(user_group_ids_to_add_ : user_group_id_list option)
    ?user_group_ids_to_remove:(user_group_ids_to_remove_ : user_group_id_list option)
    ?remove_user_groups:(remove_user_groups_ : boolean_optional option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?durability:(durability_ : durability option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     replication_group_id = replication_group_id_;
     replication_group_description = replication_group_description_;
     primary_cluster_id = primary_cluster_id_;
     snapshotting_cluster_id = snapshotting_cluster_id_;
     automatic_failover_enabled = automatic_failover_enabled_;
     multi_az_enabled = multi_az_enabled_;
     node_group_id = node_group_id_;
     cache_security_group_names = cache_security_group_names_;
     security_group_ids = security_group_ids_;
     preferred_maintenance_window = preferred_maintenance_window_;
     notification_topic_arn = notification_topic_arn_;
     cache_parameter_group_name = cache_parameter_group_name_;
     notification_topic_status = notification_topic_status_;
     apply_immediately = apply_immediately_;
     engine = engine_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     cache_node_type = cache_node_type_;
     auth_token = auth_token_;
     auth_token_update_strategy = auth_token_update_strategy_;
     user_group_ids_to_add = user_group_ids_to_add_;
     user_group_ids_to_remove = user_group_ids_to_remove_;
     remove_user_groups = remove_user_groups_;
     log_delivery_configurations = log_delivery_configurations_;
     ip_discovery = ip_discovery_;
     transit_encryption_enabled = transit_encryption_enabled_;
     transit_encryption_mode = transit_encryption_mode_;
     cluster_mode = cluster_mode_;
     durability = durability_;
   }
    : modify_replication_group_message)

let make_modify_global_replication_group_message
    ?cache_node_type:(cache_node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     apply_immediately = apply_immediately_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     cache_parameter_group_name = cache_parameter_group_name_;
     global_replication_group_description = global_replication_group_description_;
     automatic_failover_enabled = automatic_failover_enabled_;
   }
    : modify_global_replication_group_message)

let make_subnet_outpost ?subnet_outpost_arn:(subnet_outpost_arn_ : string_ option) () =
  ({ subnet_outpost_arn = subnet_outpost_arn_ } : subnet_outpost)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_outpost:(subnet_outpost_ : subnet_outpost option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_outpost = subnet_outpost_;
     supported_network_types = supported_network_types_;
   }
    : subnet)

let make_cache_subnet_group ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_subnet_group_description:(cache_subnet_group_description_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?subnets:(subnets_ : subnet_list option)
    ?ar_n:(ar_n_ : string_ option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_subnet_group_description = cache_subnet_group_description_;
     vpc_id = vpc_id_;
     subnets = subnets_;
     ar_n = ar_n_;
     supported_network_types = supported_network_types_;
   }
    : cache_subnet_group)

let make_modify_cache_subnet_group_message
    ?cache_subnet_group_description:(cache_subnet_group_description_ : string_ option)
    ?subnet_ids:(subnet_ids_ : subnet_identifier_list option)
    ~cache_subnet_group_name:(cache_subnet_group_name_ : string_) () =
  ({
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_subnet_group_description = cache_subnet_group_description_;
     subnet_ids = subnet_ids_;
   }
    : modify_cache_subnet_group_message)

let make_modify_cache_parameter_group_message
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_)
    ~parameter_name_values:(parameter_name_values_ : parameter_name_value_list) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     parameter_name_values = parameter_name_values_;
   }
    : modify_cache_parameter_group_message)

let make_modify_cache_cluster_message ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?cache_node_ids_to_remove:(cache_node_ids_to_remove_ : cache_node_ids_list option)
    ?az_mode:(az_mode_ : az_mode option)
    ?new_availability_zones:(new_availability_zones_ : preferred_availability_zone_list option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?auth_token:(auth_token_ : string_ option)
    ?auth_token_update_strategy:
      (auth_token_update_strategy_ : auth_token_update_strategy_type option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?scale_config:(scale_config_ : scale_config option)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     num_cache_nodes = num_cache_nodes_;
     cache_node_ids_to_remove = cache_node_ids_to_remove_;
     az_mode = az_mode_;
     new_availability_zones = new_availability_zones_;
     cache_security_group_names = cache_security_group_names_;
     security_group_ids = security_group_ids_;
     preferred_maintenance_window = preferred_maintenance_window_;
     notification_topic_arn = notification_topic_arn_;
     cache_parameter_group_name = cache_parameter_group_name_;
     notification_topic_status = notification_topic_status_;
     apply_immediately = apply_immediately_;
     engine = engine_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     cache_node_type = cache_node_type_;
     auth_token = auth_token_;
     auth_token_update_strategy = auth_token_update_strategy_;
     log_delivery_configurations = log_delivery_configurations_;
     ip_discovery = ip_discovery_;
     scale_config = scale_config_;
   }
    : modify_cache_cluster_message)

let make_list_tags_for_resource_message ~resource_name:(resource_name_ : string_) () =
  ({ resource_name = resource_name_ } : list_tags_for_resource_message)

let make_list_allowed_node_type_modifications_message
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option) () =
  ({ cache_cluster_id = cache_cluster_id_; replication_group_id = replication_group_id_ }
    : list_allowed_node_type_modifications_message)

let make_configure_shard
    ?preferred_availability_zones:
      (preferred_availability_zones_ : preferred_availability_zone_list option)
    ?preferred_outpost_arns:(preferred_outpost_arns_ : preferred_outpost_arn_list option)
    ~node_group_id:(node_group_id_ : allowed_node_group_id)
    ~new_replica_count:(new_replica_count_ : integer) () =
  ({
     node_group_id = node_group_id_;
     new_replica_count = new_replica_count_;
     preferred_availability_zones = preferred_availability_zones_;
     preferred_outpost_arns = preferred_outpost_arns_;
   }
    : configure_shard)

let make_increase_replica_count_message
    ?new_replica_count:(new_replica_count_ : integer_optional option)
    ?replica_configuration:(replica_configuration_ : replica_configuration_list option)
    ~replication_group_id:(replication_group_id_ : string_)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     replication_group_id = replication_group_id_;
     new_replica_count = new_replica_count_;
     replica_configuration = replica_configuration_;
     apply_immediately = apply_immediately_;
   }
    : increase_replica_count_message)

let make_regional_configuration ~replication_group_id:(replication_group_id_ : string_)
    ~replication_group_region:(replication_group_region_ : string_)
    ~resharding_configuration:(resharding_configuration_ : resharding_configuration_list) () =
  ({
     replication_group_id = replication_group_id_;
     replication_group_region = replication_group_region_;
     resharding_configuration = resharding_configuration_;
   }
    : regional_configuration)

let make_increase_node_groups_in_global_replication_group_message
    ?regional_configurations:(regional_configurations_ : regional_configuration_list option)
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~node_group_count:(node_group_count_ : integer)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     node_group_count = node_group_count_;
     regional_configurations = regional_configurations_;
     apply_immediately = apply_immediately_;
   }
    : increase_node_groups_in_global_replication_group_message)

let make_failover_global_replication_group_message
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~primary_region:(primary_region_ : string_)
    ~primary_replication_group_id:(primary_replication_group_id_ : string_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     primary_region = primary_region_;
     primary_replication_group_id = primary_replication_group_id_;
   }
    : failover_global_replication_group_message)

let make_serverless_cache_configuration
    ?serverless_cache_name:(serverless_cache_name_ : string_ option)
    ?engine:(engine_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option) () =
  ({
     serverless_cache_name = serverless_cache_name_;
     engine = engine_;
     major_engine_version = major_engine_version_;
   }
    : serverless_cache_configuration)

let make_serverless_cache_snapshot
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option)
    ?ar_n:(ar_n_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?status:(status_ : string_ option)
    ?create_time:(create_time_ : t_stamp option) ?expiry_time:(expiry_time_ : t_stamp option)
    ?bytes_used_for_cache:(bytes_used_for_cache_ : string_ option)
    ?serverless_cache_configuration:
      (serverless_cache_configuration_ : serverless_cache_configuration option) () =
  ({
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     ar_n = ar_n_;
     kms_key_id = kms_key_id_;
     snapshot_type = snapshot_type_;
     status = status_;
     create_time = create_time_;
     expiry_time = expiry_time_;
     bytes_used_for_cache = bytes_used_for_cache_;
     serverless_cache_configuration = serverless_cache_configuration_;
   }
    : serverless_cache_snapshot)

let make_export_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : export_serverless_cache_snapshot_response)

let make_export_serverless_cache_snapshot_request
    ~serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_) () =
  ({
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     s3_bucket_name = s3_bucket_name_;
   }
    : export_serverless_cache_snapshot_request)

let make_disassociate_global_replication_group_message
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~replication_group_id:(replication_group_id_ : string_)
    ~replication_group_region:(replication_group_region_ : string_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     replication_group_id = replication_group_id_;
     replication_group_region = replication_group_region_;
   }
    : disassociate_global_replication_group_message)

let make_filter ~name:(name_ : filter_name) ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : filter)

let make_describe_users_message ?engine:(engine_ : engine_type option)
    ?user_id:(user_id_ : user_id option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     engine = engine_;
     user_id = user_id_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_users_message)

let make_describe_user_groups_message ?user_group_id:(user_group_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ user_group_id = user_group_id_; max_records = max_records_; marker = marker_ }
    : describe_user_groups_message)

let make_cache_node_update_status ?cache_node_id:(cache_node_id_ : string_ option)
    ?node_update_status:(node_update_status_ : node_update_status option)
    ?node_deletion_date:(node_deletion_date_ : t_stamp option)
    ?node_update_start_date:(node_update_start_date_ : t_stamp option)
    ?node_update_end_date:(node_update_end_date_ : t_stamp option)
    ?node_update_initiated_by:(node_update_initiated_by_ : node_update_initiated_by option)
    ?node_update_initiated_date:(node_update_initiated_date_ : t_stamp option)
    ?node_update_status_modified_date:(node_update_status_modified_date_ : t_stamp option) () =
  ({
     cache_node_id = cache_node_id_;
     node_update_status = node_update_status_;
     node_deletion_date = node_deletion_date_;
     node_update_start_date = node_update_start_date_;
     node_update_end_date = node_update_end_date_;
     node_update_initiated_by = node_update_initiated_by_;
     node_update_initiated_date = node_update_initiated_date_;
     node_update_status_modified_date = node_update_status_modified_date_;
   }
    : cache_node_update_status)

let make_node_group_member_update_status ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?node_update_status:(node_update_status_ : node_update_status option)
    ?node_deletion_date:(node_deletion_date_ : t_stamp option)
    ?node_update_start_date:(node_update_start_date_ : t_stamp option)
    ?node_update_end_date:(node_update_end_date_ : t_stamp option)
    ?node_update_initiated_by:(node_update_initiated_by_ : node_update_initiated_by option)
    ?node_update_initiated_date:(node_update_initiated_date_ : t_stamp option)
    ?node_update_status_modified_date:(node_update_status_modified_date_ : t_stamp option) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     cache_node_id = cache_node_id_;
     node_update_status = node_update_status_;
     node_deletion_date = node_deletion_date_;
     node_update_start_date = node_update_start_date_;
     node_update_end_date = node_update_end_date_;
     node_update_initiated_by = node_update_initiated_by_;
     node_update_initiated_date = node_update_initiated_date_;
     node_update_status_modified_date = node_update_status_modified_date_;
   }
    : node_group_member_update_status)

let make_node_group_update_status ?node_group_id:(node_group_id_ : string_ option)
    ?node_group_member_update_status:
      (node_group_member_update_status_ : node_group_member_update_status_list option) () =
  ({
     node_group_id = node_group_id_;
     node_group_member_update_status = node_group_member_update_status_;
   }
    : node_group_update_status)

let make_update_action ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?service_update_release_date:(service_update_release_date_ : t_stamp option)
    ?service_update_severity:(service_update_severity_ : service_update_severity option)
    ?service_update_status:(service_update_status_ : service_update_status option)
    ?service_update_recommended_apply_by_date:
      (service_update_recommended_apply_by_date_ : t_stamp option)
    ?service_update_type:(service_update_type_ : service_update_type option)
    ?update_action_available_date:(update_action_available_date_ : t_stamp option)
    ?update_action_status:(update_action_status_ : update_action_status option)
    ?nodes_updated:(nodes_updated_ : string_ option)
    ?update_action_status_modified_date:(update_action_status_modified_date_ : t_stamp option)
    ?sla_met:(sla_met_ : sla_met option)
    ?node_group_update_status:(node_group_update_status_ : node_group_update_status_list option)
    ?cache_node_update_status:(cache_node_update_status_ : cache_node_update_status_list option)
    ?estimated_update_time:(estimated_update_time_ : string_ option)
    ?engine:(engine_ : string_ option) () =
  ({
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
     service_update_name = service_update_name_;
     service_update_release_date = service_update_release_date_;
     service_update_severity = service_update_severity_;
     service_update_status = service_update_status_;
     service_update_recommended_apply_by_date = service_update_recommended_apply_by_date_;
     service_update_type = service_update_type_;
     update_action_available_date = update_action_available_date_;
     update_action_status = update_action_status_;
     nodes_updated = nodes_updated_;
     update_action_status_modified_date = update_action_status_modified_date_;
     sla_met = sla_met_;
     node_group_update_status = node_group_update_status_;
     cache_node_update_status = cache_node_update_status_;
     estimated_update_time = estimated_update_time_;
     engine = engine_;
   }
    : update_action)

let make_update_actions_message ?marker:(marker_ : string_ option)
    ?update_actions:(update_actions_ : update_action_list option) () =
  ({ marker = marker_; update_actions = update_actions_ } : update_actions_message)

let make_time_range_filter ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) () =
  ({ start_time = start_time_; end_time = end_time_ } : time_range_filter)

let make_describe_update_actions_message
    ?service_update_name:(service_update_name_ : string_ option)
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ?engine:(engine_ : string_ option)
    ?service_update_status:(service_update_status_ : service_update_status_list option)
    ?service_update_time_range:(service_update_time_range_ : time_range_filter option)
    ?update_action_status:(update_action_status_ : update_action_status_list option)
    ?show_node_level_update_status:(show_node_level_update_status_ : boolean_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     service_update_name = service_update_name_;
     replication_group_ids = replication_group_ids_;
     cache_cluster_ids = cache_cluster_ids_;
     engine = engine_;
     service_update_status = service_update_status_;
     service_update_time_range = service_update_time_range_;
     update_action_status = update_action_status_;
     show_node_level_update_status = show_node_level_update_status_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_update_actions_message)

let make_node_group_configuration ?node_group_id:(node_group_id_ : allowed_node_group_id option)
    ?slots:(slots_ : string_ option) ?replica_count:(replica_count_ : integer_optional option)
    ?primary_availability_zone:(primary_availability_zone_ : string_ option)
    ?replica_availability_zones:(replica_availability_zones_ : availability_zones_list option)
    ?primary_outpost_arn:(primary_outpost_arn_ : string_ option)
    ?replica_outpost_arns:(replica_outpost_arns_ : outpost_arns_list option) () =
  ({
     node_group_id = node_group_id_;
     slots = slots_;
     replica_count = replica_count_;
     primary_availability_zone = primary_availability_zone_;
     replica_availability_zones = replica_availability_zones_;
     primary_outpost_arn = primary_outpost_arn_;
     replica_outpost_arns = replica_outpost_arns_;
   }
    : node_group_configuration)

let make_node_snapshot ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?node_group_id:(node_group_id_ : string_ option)
    ?cache_node_id:(cache_node_id_ : string_ option)
    ?node_group_configuration:(node_group_configuration_ : node_group_configuration option)
    ?cache_size:(cache_size_ : string_ option)
    ?cache_node_create_time:(cache_node_create_time_ : t_stamp option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     node_group_id = node_group_id_;
     cache_node_id = cache_node_id_;
     node_group_configuration = node_group_configuration_;
     cache_size = cache_size_;
     cache_node_create_time = cache_node_create_time_;
     snapshot_create_time = snapshot_create_time_;
   }
    : node_snapshot)

let make_snapshot ?snapshot_name:(snapshot_name_ : string_ option)
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?replication_group_description:(replication_group_description_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?snapshot_status:(snapshot_status_ : string_ option)
    ?snapshot_source:(snapshot_source_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?cache_cluster_create_time:(cache_cluster_create_time_ : t_stamp option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?topic_arn:(topic_arn_ : string_ option) ?port:(port_ : integer_optional option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?num_node_groups:(num_node_groups_ : integer_optional option)
    ?automatic_failover:(automatic_failover_ : automatic_failover_status option)
    ?node_snapshots:(node_snapshots_ : node_snapshot_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?ar_n:(ar_n_ : string_ option)
    ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?durability:(durability_ : durability option) () =
  ({
     snapshot_name = snapshot_name_;
     replication_group_id = replication_group_id_;
     replication_group_description = replication_group_description_;
     cache_cluster_id = cache_cluster_id_;
     snapshot_status = snapshot_status_;
     snapshot_source = snapshot_source_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     num_cache_nodes = num_cache_nodes_;
     preferred_availability_zone = preferred_availability_zone_;
     preferred_outpost_arn = preferred_outpost_arn_;
     cache_cluster_create_time = cache_cluster_create_time_;
     preferred_maintenance_window = preferred_maintenance_window_;
     topic_arn = topic_arn_;
     port = port_;
     cache_parameter_group_name = cache_parameter_group_name_;
     cache_subnet_group_name = cache_subnet_group_name_;
     vpc_id = vpc_id_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     num_node_groups = num_node_groups_;
     automatic_failover = automatic_failover_;
     node_snapshots = node_snapshots_;
     kms_key_id = kms_key_id_;
     ar_n = ar_n_;
     data_tiering = data_tiering_;
     durability = durability_;
   }
    : snapshot)

let make_describe_snapshots_list_message ?marker:(marker_ : string_ option)
    ?snapshots:(snapshots_ : snapshot_list option) () =
  ({ marker = marker_; snapshots = snapshots_ } : describe_snapshots_list_message)

let make_describe_snapshots_message ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?snapshot_source:(snapshot_source_ : string_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?show_node_group_config:(show_node_group_config_ : boolean_optional option) () =
  ({
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
     snapshot_name = snapshot_name_;
     snapshot_source = snapshot_source_;
     marker = marker_;
     max_records = max_records_;
     show_node_group_config = show_node_group_config_;
   }
    : describe_snapshots_message)

let make_service_update ?service_update_name:(service_update_name_ : string_ option)
    ?service_update_release_date:(service_update_release_date_ : t_stamp option)
    ?service_update_end_date:(service_update_end_date_ : t_stamp option)
    ?service_update_severity:(service_update_severity_ : service_update_severity option)
    ?service_update_recommended_apply_by_date:
      (service_update_recommended_apply_by_date_ : t_stamp option)
    ?service_update_status:(service_update_status_ : service_update_status option)
    ?service_update_description:(service_update_description_ : string_ option)
    ?service_update_type:(service_update_type_ : service_update_type option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?auto_update_after_recommended_apply_by_date:
      (auto_update_after_recommended_apply_by_date_ : boolean_optional option)
    ?estimated_update_time:(estimated_update_time_ : string_ option) () =
  ({
     service_update_name = service_update_name_;
     service_update_release_date = service_update_release_date_;
     service_update_end_date = service_update_end_date_;
     service_update_severity = service_update_severity_;
     service_update_recommended_apply_by_date = service_update_recommended_apply_by_date_;
     service_update_status = service_update_status_;
     service_update_description = service_update_description_;
     service_update_type = service_update_type_;
     engine = engine_;
     engine_version = engine_version_;
     auto_update_after_recommended_apply_by_date = auto_update_after_recommended_apply_by_date_;
     estimated_update_time = estimated_update_time_;
   }
    : service_update)

let make_service_updates_message ?marker:(marker_ : string_ option)
    ?service_updates:(service_updates_ : service_update_list option) () =
  ({ marker = marker_; service_updates = service_updates_ } : service_updates_message)

let make_describe_service_updates_message
    ?service_update_name:(service_update_name_ : string_ option)
    ?service_update_status:(service_update_status_ : service_update_status_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     service_update_name = service_update_name_;
     service_update_status = service_update_status_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_service_updates_message)

let make_describe_serverless_cache_snapshots_response ?next_token:(next_token_ : string_ option)
    ?serverless_cache_snapshots:
      (serverless_cache_snapshots_ : serverless_cache_snapshot_list option) () =
  ({ next_token = next_token_; serverless_cache_snapshots = serverless_cache_snapshots_ }
    : describe_serverless_cache_snapshots_response)

let make_describe_serverless_cache_snapshots_request
    ?serverless_cache_name:(serverless_cache_name_ : string_ option)
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) () =
  ({
     serverless_cache_name = serverless_cache_name_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     snapshot_type = snapshot_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_serverless_cache_snapshots_request)

let make_describe_serverless_caches_response ?next_token:(next_token_ : string_ option)
    ?serverless_caches:(serverless_caches_ : serverless_cache_list option) () =
  ({ next_token = next_token_; serverless_caches = serverless_caches_ }
    : describe_serverless_caches_response)

let make_describe_serverless_caches_request
    ?serverless_cache_name:(serverless_cache_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     serverless_cache_name = serverless_cache_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_serverless_caches_request)

let make_reserved_cache_nodes_offering
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?duration:(duration_ : integer option)
    ?fixed_price:(fixed_price_ : double option) ?usage_price:(usage_price_ : double option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option) () =
  ({
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     cache_node_type = cache_node_type_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     product_description = product_description_;
     offering_type = offering_type_;
     recurring_charges = recurring_charges_;
   }
    : reserved_cache_nodes_offering)

let make_reserved_cache_nodes_offering_message ?marker:(marker_ : string_ option)
    ?reserved_cache_nodes_offerings:
      (reserved_cache_nodes_offerings_ : reserved_cache_nodes_offering_list option) () =
  ({ marker = marker_; reserved_cache_nodes_offerings = reserved_cache_nodes_offerings_ }
    : reserved_cache_nodes_offering_message)

let make_describe_reserved_cache_nodes_offerings_message
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     cache_node_type = cache_node_type_;
     duration = duration_;
     product_description = product_description_;
     offering_type = offering_type_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_cache_nodes_offerings_message)

let make_reserved_cache_node_message ?marker:(marker_ : string_ option)
    ?reserved_cache_nodes:(reserved_cache_nodes_ : reserved_cache_node_list option) () =
  ({ marker = marker_; reserved_cache_nodes = reserved_cache_nodes_ } : reserved_cache_node_message)

let make_describe_reserved_cache_nodes_message
    ?reserved_cache_node_id:(reserved_cache_node_id_ : string_ option)
    ?reserved_cache_nodes_offering_id:(reserved_cache_nodes_offering_id_ : string_ option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     reserved_cache_node_id = reserved_cache_node_id_;
     reserved_cache_nodes_offering_id = reserved_cache_nodes_offering_id_;
     cache_node_type = cache_node_type_;
     duration = duration_;
     product_description = product_description_;
     offering_type = offering_type_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_cache_nodes_message)

let make_replication_group_message ?marker:(marker_ : string_ option)
    ?replication_groups:(replication_groups_ : replication_group_list option) () =
  ({ marker = marker_; replication_groups = replication_groups_ } : replication_group_message)

let make_describe_replication_groups_message
    ?replication_group_id:(replication_group_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ replication_group_id = replication_group_id_; max_records = max_records_; marker = marker_ }
    : describe_replication_groups_message)

let make_describe_global_replication_groups_message
    ?global_replication_group_id:(global_replication_group_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?show_member_info:(show_member_info_ : boolean_optional option) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     max_records = max_records_;
     marker = marker_;
     show_member_info = show_member_info_;
   }
    : describe_global_replication_groups_message)

let make_event ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?message:(message_ : string_ option)
    ?date:(date_ : t_stamp option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     message = message_;
     date = date_;
   }
    : event)

let make_events_message ?marker:(marker_ : string_ option) ?events:(events_ : event_list option) ()
    =
  ({ marker = marker_; events = events_ } : events_message)

let make_describe_events_message ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?duration:(duration_ : integer_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     start_time = start_time_;
     end_time = end_time_;
     duration = duration_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_events_message)

let make_cache_node_type_specific_value ?cache_node_type:(cache_node_type_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ cache_node_type = cache_node_type_; value = value_ } : cache_node_type_specific_value)

let make_cache_node_type_specific_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?cache_node_type_specific_values:
      (cache_node_type_specific_values_ : cache_node_type_specific_value_list option)
    ?change_type:(change_type_ : change_type option) () =
  ({
     parameter_name = parameter_name_;
     description = description_;
     source = source_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     minimum_engine_version = minimum_engine_version_;
     cache_node_type_specific_values = cache_node_type_specific_values_;
     change_type = change_type_;
   }
    : cache_node_type_specific_parameter)

let make_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?change_type:(change_type_ : change_type option) () =
  ({
     parameter_name = parameter_name_;
     parameter_value = parameter_value_;
     description = description_;
     source = source_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     minimum_engine_version = minimum_engine_version_;
     change_type = change_type_;
   }
    : parameter)

let make_engine_defaults
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?marker:(marker_ : string_ option) ?parameters:(parameters_ : parameters_list option)
    ?cache_node_type_specific_parameters:
      (cache_node_type_specific_parameters_ : cache_node_type_specific_parameters_list option) () =
  ({
     cache_parameter_group_family = cache_parameter_group_family_;
     marker = marker_;
     parameters = parameters_;
     cache_node_type_specific_parameters = cache_node_type_specific_parameters_;
   }
    : engine_defaults)

let make_describe_engine_default_parameters_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~cache_parameter_group_family:(cache_parameter_group_family_ : string_) () =
  ({
     cache_parameter_group_family = cache_parameter_group_family_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_engine_default_parameters_message)

let make_cache_subnet_group_message ?marker:(marker_ : string_ option)
    ?cache_subnet_groups:(cache_subnet_groups_ : cache_subnet_groups option) () =
  ({ marker = marker_; cache_subnet_groups = cache_subnet_groups_ } : cache_subnet_group_message)

let make_describe_cache_subnet_groups_message
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cache_subnet_group_name = cache_subnet_group_name_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cache_subnet_groups_message)

let make_cache_security_group_message ?marker:(marker_ : string_ option)
    ?cache_security_groups:(cache_security_groups_ : cache_security_groups option) () =
  ({ marker = marker_; cache_security_groups = cache_security_groups_ }
    : cache_security_group_message)

let make_describe_cache_security_groups_message
    ?cache_security_group_name:(cache_security_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cache_security_group_name = cache_security_group_name_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cache_security_groups_message)

let make_cache_parameter_group_details ?marker:(marker_ : string_ option)
    ?parameters:(parameters_ : parameters_list option)
    ?cache_node_type_specific_parameters:
      (cache_node_type_specific_parameters_ : cache_node_type_specific_parameters_list option) () =
  ({
     marker = marker_;
     parameters = parameters_;
     cache_node_type_specific_parameters = cache_node_type_specific_parameters_;
   }
    : cache_parameter_group_details)

let make_describe_cache_parameters_message ?source:(source_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     source = source_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cache_parameters_message)

let make_cache_parameter_group
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?description:(description_ : string_ option) ?is_global:(is_global_ : boolean_ option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     cache_parameter_group_family = cache_parameter_group_family_;
     description = description_;
     is_global = is_global_;
     ar_n = ar_n_;
   }
    : cache_parameter_group)

let make_cache_parameter_groups_message ?marker:(marker_ : string_ option)
    ?cache_parameter_groups:(cache_parameter_groups_ : cache_parameter_group_list option) () =
  ({ marker = marker_; cache_parameter_groups = cache_parameter_groups_ }
    : cache_parameter_groups_message)

let make_describe_cache_parameter_groups_message
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cache_parameter_groups_message)

let make_cache_engine_version ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?cache_engine_description:(cache_engine_description_ : string_ option)
    ?cache_engine_version_description:(cache_engine_version_description_ : string_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     cache_parameter_group_family = cache_parameter_group_family_;
     cache_engine_description = cache_engine_description_;
     cache_engine_version_description = cache_engine_version_description_;
   }
    : cache_engine_version)

let make_cache_engine_version_message ?marker:(marker_ : string_ option)
    ?cache_engine_versions:(cache_engine_versions_ : cache_engine_version_list option) () =
  ({ marker = marker_; cache_engine_versions = cache_engine_versions_ }
    : cache_engine_version_message)

let make_describe_cache_engine_versions_message ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_parameter_group_family:(cache_parameter_group_family_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?default_only:(default_only_ : boolean_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     cache_parameter_group_family = cache_parameter_group_family_;
     max_records = max_records_;
     marker = marker_;
     default_only = default_only_;
   }
    : describe_cache_engine_versions_message)

let make_cache_cluster_message ?marker:(marker_ : string_ option)
    ?cache_clusters:(cache_clusters_ : cache_cluster_list option) () =
  ({ marker = marker_; cache_clusters = cache_clusters_ } : cache_cluster_message)

let make_describe_cache_clusters_message ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?show_cache_node_info:(show_cache_node_info_ : boolean_optional option)
    ?show_cache_clusters_not_in_replication_groups:
      (show_cache_clusters_not_in_replication_groups_ : boolean_optional option) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     max_records = max_records_;
     marker = marker_;
     show_cache_node_info = show_cache_node_info_;
     show_cache_clusters_not_in_replication_groups = show_cache_clusters_not_in_replication_groups_;
   }
    : describe_cache_clusters_message)

let make_delete_user_group_message ~user_group_id:(user_group_id_ : string_) () =
  ({ user_group_id = user_group_id_ } : delete_user_group_message)

let make_delete_user_message ~user_id:(user_id_ : user_id) () =
  ({ user_id = user_id_ } : delete_user_message)

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
  ({ serverless_cache_name = serverless_cache_name_; final_snapshot_name = final_snapshot_name_ }
    : delete_serverless_cache_request)

let make_delete_replication_group_message
    ?retain_primary_cluster:(retain_primary_cluster_ : boolean_optional option)
    ?final_snapshot_identifier:(final_snapshot_identifier_ : string_ option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({
     replication_group_id = replication_group_id_;
     retain_primary_cluster = retain_primary_cluster_;
     final_snapshot_identifier = final_snapshot_identifier_;
   }
    : delete_replication_group_message)

let make_delete_global_replication_group_message
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~retain_primary_replication_group:(retain_primary_replication_group_ : boolean_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     retain_primary_replication_group = retain_primary_replication_group_;
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
  ({ cache_cluster_id = cache_cluster_id_; final_snapshot_identifier = final_snapshot_identifier_ }
    : delete_cache_cluster_message)

let make_decrease_replica_count_message
    ?new_replica_count:(new_replica_count_ : integer_optional option)
    ?replica_configuration:(replica_configuration_ : replica_configuration_list option)
    ?replicas_to_remove:(replicas_to_remove_ : remove_replicas_list option)
    ~replication_group_id:(replication_group_id_ : string_)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     replication_group_id = replication_group_id_;
     new_replica_count = new_replica_count_;
     replica_configuration = replica_configuration_;
     replicas_to_remove = replicas_to_remove_;
     apply_immediately = apply_immediately_;
   }
    : decrease_replica_count_message)

let make_decrease_node_groups_in_global_replication_group_message
    ?global_node_groups_to_remove:(global_node_groups_to_remove_ : global_node_group_id_list option)
    ?global_node_groups_to_retain:(global_node_groups_to_retain_ : global_node_group_id_list option)
    ~global_replication_group_id:(global_replication_group_id_ : string_)
    ~node_group_count:(node_group_count_ : integer)
    ~apply_immediately:(apply_immediately_ : boolean_) () =
  ({
     global_replication_group_id = global_replication_group_id_;
     node_group_count = node_group_count_;
     global_node_groups_to_remove = global_node_groups_to_remove_;
     global_node_groups_to_retain = global_node_groups_to_retain_;
     apply_immediately = apply_immediately_;
   }
    : decrease_node_groups_in_global_replication_group_message)

let make_create_user_group_message ?user_ids:(user_ids_ : user_id_list_input option)
    ?tags:(tags_ : tag_list option) ~user_group_id:(user_group_id_ : string_)
    ~engine:(engine_ : engine_type) () =
  ({ user_group_id = user_group_id_; engine = engine_; user_ids = user_ids_; tags = tags_ }
    : create_user_group_message)

let make_create_user_message ?passwords:(passwords_ : password_list_input option)
    ?no_password_required:(no_password_required_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ~user_id:(user_id_ : user_id) ~user_name:(user_name_ : user_name)
    ~engine:(engine_ : engine_type) ~access_string:(access_string_ : access_string) () =
  ({
     user_id = user_id_;
     user_name = user_name_;
     engine = engine_;
     passwords = passwords_;
     access_string = access_string_;
     no_password_required = no_password_required_;
     tags = tags_;
     authentication_mode = authentication_mode_;
   }
    : create_user_message)

let make_create_snapshot_message ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ~snapshot_name:(snapshot_name_ : string_) () =
  ({
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
     snapshot_name = snapshot_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : create_snapshot_message)

let make_create_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : create_serverless_cache_snapshot_response)

let make_create_serverless_cache_snapshot_request ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ~serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_)
    ~serverless_cache_name:(serverless_cache_name_ : string_) () =
  ({
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     serverless_cache_name = serverless_cache_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : create_serverless_cache_snapshot_request)

let make_create_serverless_cache_response
    ?serverless_cache:(serverless_cache_ : serverless_cache option) () =
  ({ serverless_cache = serverless_cache_ } : create_serverless_cache_response)

let make_create_serverless_cache_request ?description:(description_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?cache_usage_limits:(cache_usage_limits_ : cache_usage_limits option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?snapshot_arns_to_restore:(snapshot_arns_to_restore_ : snapshot_arns_list option)
    ?tags:(tags_ : tag_list option) ?user_group_id:(user_group_id_ : string_ option)
    ?subnet_ids:(subnet_ids_ : subnet_ids_list option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?daily_snapshot_time:(daily_snapshot_time_ : string_ option)
    ?network_type:(network_type_ : network_type option)
    ~serverless_cache_name:(serverless_cache_name_ : string_) ~engine:(engine_ : string_) () =
  ({
     serverless_cache_name = serverless_cache_name_;
     description = description_;
     engine = engine_;
     major_engine_version = major_engine_version_;
     cache_usage_limits = cache_usage_limits_;
     kms_key_id = kms_key_id_;
     security_group_ids = security_group_ids_;
     snapshot_arns_to_restore = snapshot_arns_to_restore_;
     tags = tags_;
     user_group_id = user_group_id_;
     subnet_ids = subnet_ids_;
     snapshot_retention_limit = snapshot_retention_limit_;
     daily_snapshot_time = daily_snapshot_time_;
     network_type = network_type_;
   }
    : create_serverless_cache_request)

let make_create_replication_group_message
    ?global_replication_group_id:(global_replication_group_id_ : string_ option)
    ?primary_cluster_id:(primary_cluster_id_ : string_ option)
    ?automatic_failover_enabled:(automatic_failover_enabled_ : boolean_optional option)
    ?multi_az_enabled:(multi_az_enabled_ : boolean_optional option)
    ?num_cache_clusters:(num_cache_clusters_ : integer_optional option)
    ?preferred_cache_cluster_a_zs:(preferred_cache_cluster_a_zs_ : availability_zones_list option)
    ?num_node_groups:(num_node_groups_ : integer_optional option)
    ?replicas_per_node_group:(replicas_per_node_group_ : integer_optional option)
    ?node_group_configuration:(node_group_configuration_ : node_group_configuration_list option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?tags:(tags_ : tag_list option) ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option) ?auth_token:(auth_token_ : string_ option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?at_rest_encryption_enabled:(at_rest_encryption_enabled_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?user_group_ids:(user_group_ids_ : user_group_id_list_input option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?data_tiering_enabled:(data_tiering_enabled_ : boolean_optional option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?transit_encryption_mode:(transit_encryption_mode_ : transit_encryption_mode option)
    ?cluster_mode:(cluster_mode_ : cluster_mode option)
    ?serverless_cache_snapshot_name:(serverless_cache_snapshot_name_ : string_ option)
    ?durability:(durability_ : durability option)
    ~replication_group_id:(replication_group_id_ : string_)
    ~replication_group_description:(replication_group_description_ : string_) () =
  ({
     replication_group_id = replication_group_id_;
     replication_group_description = replication_group_description_;
     global_replication_group_id = global_replication_group_id_;
     primary_cluster_id = primary_cluster_id_;
     automatic_failover_enabled = automatic_failover_enabled_;
     multi_az_enabled = multi_az_enabled_;
     num_cache_clusters = num_cache_clusters_;
     preferred_cache_cluster_a_zs = preferred_cache_cluster_a_zs_;
     num_node_groups = num_node_groups_;
     replicas_per_node_group = replicas_per_node_group_;
     node_group_configuration = node_group_configuration_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     cache_parameter_group_name = cache_parameter_group_name_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_security_group_names = cache_security_group_names_;
     security_group_ids = security_group_ids_;
     tags = tags_;
     snapshot_arns = snapshot_arns_;
     snapshot_name = snapshot_name_;
     preferred_maintenance_window = preferred_maintenance_window_;
     port = port_;
     notification_topic_arn = notification_topic_arn_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     auth_token = auth_token_;
     transit_encryption_enabled = transit_encryption_enabled_;
     at_rest_encryption_enabled = at_rest_encryption_enabled_;
     kms_key_id = kms_key_id_;
     user_group_ids = user_group_ids_;
     log_delivery_configurations = log_delivery_configurations_;
     data_tiering_enabled = data_tiering_enabled_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
     transit_encryption_mode = transit_encryption_mode_;
     cluster_mode = cluster_mode_;
     serverless_cache_snapshot_name = serverless_cache_snapshot_name_;
     durability = durability_;
   }
    : create_replication_group_message)

let make_create_global_replication_group_message
    ?global_replication_group_description:(global_replication_group_description_ : string_ option)
    ~global_replication_group_id_suffix:(global_replication_group_id_suffix_ : string_)
    ~primary_replication_group_id:(primary_replication_group_id_ : string_) () =
  ({
     global_replication_group_id_suffix = global_replication_group_id_suffix_;
     global_replication_group_description = global_replication_group_description_;
     primary_replication_group_id = primary_replication_group_id_;
   }
    : create_global_replication_group_message)

let make_create_cache_subnet_group_message ?tags:(tags_ : tag_list option)
    ~cache_subnet_group_name:(cache_subnet_group_name_ : string_)
    ~cache_subnet_group_description:(cache_subnet_group_description_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_subnet_group_description = cache_subnet_group_description_;
     subnet_ids = subnet_ids_;
     tags = tags_;
   }
    : create_cache_subnet_group_message)

let make_create_cache_security_group_message ?tags:(tags_ : tag_list option)
    ~cache_security_group_name:(cache_security_group_name_ : string_)
    ~description:(description_ : string_) () =
  ({
     cache_security_group_name = cache_security_group_name_;
     description = description_;
     tags = tags_;
   }
    : create_cache_security_group_message)

let make_create_cache_parameter_group_message ?tags:(tags_ : tag_list option)
    ~cache_parameter_group_name:(cache_parameter_group_name_ : string_)
    ~cache_parameter_group_family:(cache_parameter_group_family_ : string_)
    ~description:(description_ : string_) () =
  ({
     cache_parameter_group_name = cache_parameter_group_name_;
     cache_parameter_group_family = cache_parameter_group_family_;
     description = description_;
     tags = tags_;
   }
    : create_cache_parameter_group_message)

let make_create_cache_cluster_message ?replication_group_id:(replication_group_id_ : string_ option)
    ?az_mode:(az_mode_ : az_mode option)
    ?preferred_availability_zone:(preferred_availability_zone_ : string_ option)
    ?preferred_availability_zones:
      (preferred_availability_zones_ : preferred_availability_zone_list option)
    ?num_cache_nodes:(num_cache_nodes_ : integer_optional option)
    ?cache_node_type:(cache_node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cache_parameter_group_name:(cache_parameter_group_name_ : string_ option)
    ?cache_subnet_group_name:(cache_subnet_group_name_ : string_ option)
    ?cache_security_group_names:
      (cache_security_group_names_ : cache_security_group_name_list option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?tags:(tags_ : tag_list option) ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option) ?auth_token:(auth_token_ : string_ option)
    ?outpost_mode:(outpost_mode_ : outpost_mode option)
    ?preferred_outpost_arn:(preferred_outpost_arn_ : string_ option)
    ?preferred_outpost_arns:(preferred_outpost_arns_ : preferred_outpost_arn_list option)
    ?log_delivery_configurations:
      (log_delivery_configurations_ : log_delivery_configuration_request_list option)
    ?transit_encryption_enabled:(transit_encryption_enabled_ : boolean_optional option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ~cache_cluster_id:(cache_cluster_id_ : string_) () =
  ({
     cache_cluster_id = cache_cluster_id_;
     replication_group_id = replication_group_id_;
     az_mode = az_mode_;
     preferred_availability_zone = preferred_availability_zone_;
     preferred_availability_zones = preferred_availability_zones_;
     num_cache_nodes = num_cache_nodes_;
     cache_node_type = cache_node_type_;
     engine = engine_;
     engine_version = engine_version_;
     cache_parameter_group_name = cache_parameter_group_name_;
     cache_subnet_group_name = cache_subnet_group_name_;
     cache_security_group_names = cache_security_group_names_;
     security_group_ids = security_group_ids_;
     tags = tags_;
     snapshot_arns = snapshot_arns_;
     snapshot_name = snapshot_name_;
     preferred_maintenance_window = preferred_maintenance_window_;
     port = port_;
     notification_topic_arn = notification_topic_arn_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     auth_token = auth_token_;
     outpost_mode = outpost_mode_;
     preferred_outpost_arn = preferred_outpost_arn_;
     preferred_outpost_arns = preferred_outpost_arns_;
     log_delivery_configurations = log_delivery_configurations_;
     transit_encryption_enabled = transit_encryption_enabled_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
   }
    : create_cache_cluster_message)

let make_copy_snapshot_message ?target_bucket:(target_bucket_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ~source_snapshot_name:(source_snapshot_name_ : string_)
    ~target_snapshot_name:(target_snapshot_name_ : string_) () =
  ({
     source_snapshot_name = source_snapshot_name_;
     target_snapshot_name = target_snapshot_name_;
     target_bucket = target_bucket_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : copy_snapshot_message)

let make_copy_serverless_cache_snapshot_response
    ?serverless_cache_snapshot:(serverless_cache_snapshot_ : serverless_cache_snapshot option) () =
  ({ serverless_cache_snapshot = serverless_cache_snapshot_ }
    : copy_serverless_cache_snapshot_response)

let make_copy_serverless_cache_snapshot_request ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ~source_serverless_cache_snapshot_name:(source_serverless_cache_snapshot_name_ : string_)
    ~target_serverless_cache_snapshot_name:(target_serverless_cache_snapshot_name_ : string_) () =
  ({
     source_serverless_cache_snapshot_name = source_serverless_cache_snapshot_name_;
     target_serverless_cache_snapshot_name = target_serverless_cache_snapshot_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : copy_serverless_cache_snapshot_request)

let make_complete_migration_response
    ?replication_group:(replication_group_ : replication_group option) () =
  ({ replication_group = replication_group_ } : complete_migration_response)

let make_complete_migration_message ?force:(force_ : boolean_ option)
    ~replication_group_id:(replication_group_id_ : string_) () =
  ({ replication_group_id = replication_group_id_; force = force_ } : complete_migration_message)

let make_unprocessed_update_action ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?error_type:(error_type_ : string_ option) ?error_message:(error_message_ : string_ option) () =
  ({
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
     service_update_name = service_update_name_;
     error_type = error_type_;
     error_message = error_message_;
   }
    : unprocessed_update_action)

let make_processed_update_action ?replication_group_id:(replication_group_id_ : string_ option)
    ?cache_cluster_id:(cache_cluster_id_ : string_ option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?update_action_status:(update_action_status_ : update_action_status option) () =
  ({
     replication_group_id = replication_group_id_;
     cache_cluster_id = cache_cluster_id_;
     service_update_name = service_update_name_;
     update_action_status = update_action_status_;
   }
    : processed_update_action)

let make_update_action_results_message
    ?processed_update_actions:(processed_update_actions_ : processed_update_action_list option)
    ?unprocessed_update_actions:
      (unprocessed_update_actions_ : unprocessed_update_action_list option) () =
  ({
     processed_update_actions = processed_update_actions_;
     unprocessed_update_actions = unprocessed_update_actions_;
   }
    : update_action_results_message)

let make_batch_stop_update_action_message
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ~service_update_name:(service_update_name_ : string_) () =
  ({
     replication_group_ids = replication_group_ids_;
     cache_cluster_ids = cache_cluster_ids_;
     service_update_name = service_update_name_;
   }
    : batch_stop_update_action_message)

let make_batch_apply_update_action_message
    ?replication_group_ids:(replication_group_ids_ : replication_group_id_list option)
    ?cache_cluster_ids:(cache_cluster_ids_ : cache_cluster_id_list option)
    ~service_update_name:(service_update_name_ : string_) () =
  ({
     replication_group_ids = replication_group_ids_;
     cache_cluster_ids = cache_cluster_ids_;
     service_update_name = service_update_name_;
   }
    : batch_apply_update_action_message)

let make_authorize_cache_security_group_ingress_message
    ~cache_security_group_name:(cache_security_group_name_ : string_)
    ~ec2_security_group_name:(ec2_security_group_name_ : string_)
    ~ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_) () =
  ({
     cache_security_group_name = cache_security_group_name_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : authorize_cache_security_group_ingress_message)
