open Types

let make_vpc_security_group_membership ?status:(status_ : string_ option)
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option) () =
  ({ status = status_; vpc_security_group_id = vpc_security_group_id_ }
    : vpc_security_group_membership)

let make_upgrade_target ?is_major_version_upgrade:(is_major_version_upgrade_ : boolean_ option)
    ?auto_upgrade:(auto_upgrade_ : boolean_ option) ?description:(description_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     is_major_version_upgrade = is_major_version_upgrade_;
     auto_upgrade = auto_upgrade_;
     description = description_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : upgrade_target)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_list_message ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_list_message)

let make_global_cluster_member
    ?synchronization_status:
      (synchronization_status_ : global_cluster_member_synchronization_status option)
    ?is_writer:(is_writer_ : boolean_ option) ?readers:(readers_ : readers_arn_list option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option) () =
  ({
     synchronization_status = synchronization_status_;
     is_writer = is_writer_;
     readers = readers_;
     db_cluster_arn = db_cluster_arn_;
   }
    : global_cluster_member)

let make_failover_state ?is_data_loss_allowed:(is_data_loss_allowed_ : boolean_ option)
    ?to_db_cluster_arn:(to_db_cluster_arn_ : string_ option)
    ?from_db_cluster_arn:(from_db_cluster_arn_ : string_ option)
    ?status:(status_ : failover_status option) () =
  ({
     is_data_loss_allowed = is_data_loss_allowed_;
     to_db_cluster_arn = to_db_cluster_arn_;
     from_db_cluster_arn = from_db_cluster_arn_;
     status = status_;
   }
    : failover_state)

let make_global_cluster ?tag_list:(tag_list_ : tag_list option)
    ?failover_state:(failover_state_ : failover_state option)
    ?global_cluster_members:(global_cluster_members_ : global_cluster_member_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?status:(status_ : string_ option) ?global_cluster_arn:(global_cluster_arn_ : string_ option)
    ?global_cluster_resource_id:(global_cluster_resource_id_ : string_ option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option) () =
  ({
     tag_list = tag_list_;
     failover_state = failover_state_;
     global_cluster_members = global_cluster_members_;
     deletion_protection = deletion_protection_;
     storage_encrypted = storage_encrypted_;
     database_name = database_name_;
     engine_version = engine_version_;
     engine = engine_;
     status = status_;
     global_cluster_arn = global_cluster_arn_;
     global_cluster_resource_id = global_cluster_resource_id_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : global_cluster)

let make_switchover_global_cluster_message
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : db_cluster_identifier)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     target_db_cluster_identifier = target_db_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : switchover_global_cluster_message)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_status:(subnet_status_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_identifier:(subnet_identifier_ : string_ option) () =
  ({
     subnet_status = subnet_status_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_identifier = subnet_identifier_;
   }
    : subnet)

let make_db_cluster_member ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?db_cluster_parameter_group_status:(db_cluster_parameter_group_status_ : string_ option)
    ?is_cluster_writer:(is_cluster_writer_ : boolean_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     promotion_tier = promotion_tier_;
     db_cluster_parameter_group_status = db_cluster_parameter_group_status_;
     is_cluster_writer = is_cluster_writer_;
     db_instance_identifier = db_instance_identifier_;
   }
    : db_cluster_member)

let make_db_cluster_role ?status:(status_ : string_ option) ?role_arn:(role_arn_ : string_ option)
    () =
  ({ status = status_; role_arn = role_arn_ } : db_cluster_role)

let make_serverless_v2_scaling_configuration_info
    ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ }
    : serverless_v2_scaling_configuration_info)

let make_cluster_master_user_secret ?kms_key_id:(kms_key_id_ : string_ option)
    ?secret_status:(secret_status_ : string_ option) ?secret_arn:(secret_arn_ : string_ option) () =
  ({ kms_key_id = kms_key_id_; secret_status = secret_status_; secret_arn = secret_arn_ }
    : cluster_master_user_secret)

let make_db_cluster ?network_type:(network_type_ : string_ option)
    ?master_user_secret:(master_user_secret_ : cluster_master_user_secret option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration_info option)
    ?storage_type:(storage_type_ : string_ option)
    ?io_optimized_next_allowed_modification_time:
      (io_optimized_next_allowed_modification_time_ : t_stamp option)
    ?deletion_protection:(deletion_protection_ : boolean_ option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?clone_group_id:(clone_group_id_ : string_ option)
    ?associated_roles:(associated_roles_ : db_cluster_roles option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?db_cluster_members:(db_cluster_members_ : db_cluster_member_list option)
    ?read_replica_identifiers:(read_replica_identifiers_ : read_replica_identifier_list option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?master_username:(master_username_ : string_ option) ?port:(port_ : integer_optional option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_ option) ?reader_endpoint:(reader_endpoint_ : string_ option)
    ?endpoint:(endpoint_ : string_ option)
    ?earliest_restorable_time:(earliest_restorable_time_ : t_stamp option)
    ?percent_progress:(percent_progress_ : string_ option) ?status:(status_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : string_ option)
    ?db_cluster_parameter_group:(db_cluster_parameter_group_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({
     network_type = network_type_;
     master_user_secret = master_user_secret_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     io_optimized_next_allowed_modification_time = io_optimized_next_allowed_modification_time_;
     deletion_protection = deletion_protection_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     cluster_create_time = cluster_create_time_;
     clone_group_id = clone_group_id_;
     associated_roles = associated_roles_;
     db_cluster_arn = db_cluster_arn_;
     db_cluster_resource_id = db_cluster_resource_id_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     hosted_zone_id = hosted_zone_id_;
     vpc_security_groups = vpc_security_groups_;
     db_cluster_members = db_cluster_members_;
     read_replica_identifiers = read_replica_identifiers_;
     replication_source_identifier = replication_source_identifier_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     master_username = master_username_;
     port = port_;
     latest_restorable_time = latest_restorable_time_;
     engine_version = engine_version_;
     engine = engine_;
     multi_a_z = multi_a_z_;
     reader_endpoint = reader_endpoint_;
     endpoint = endpoint_;
     earliest_restorable_time = earliest_restorable_time_;
     percent_progress = percent_progress_;
     status = status_;
     db_subnet_group = db_subnet_group_;
     db_cluster_parameter_group = db_cluster_parameter_group_;
     db_cluster_identifier = db_cluster_identifier_;
     backup_retention_period = backup_retention_period_;
     availability_zones = availability_zones_;
   }
    : db_cluster)

let make_stop_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : stop_db_cluster_message)

let make_start_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : start_db_cluster_message)

let make_serverless_v2_scaling_configuration ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ }
    : serverless_v2_scaling_configuration)

let make_serverless_v2_features_support ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ } : serverless_v2_features_support)

let make_restore_db_cluster_to_point_in_time_message ?network_type:(network_type_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?restore_to_time:(restore_to_time_ : t_stamp option)
    ?restore_type:(restore_type_ : string_ option)
    ~source_db_cluster_identifier:(source_db_cluster_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     network_type = network_type_;
     storage_type = storage_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     deletion_protection = deletion_protection_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_subnet_group_name = db_subnet_group_name_;
     port = port_;
     use_latest_restorable_time = use_latest_restorable_time_;
     restore_to_time = restore_to_time_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     restore_type = restore_type_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : restore_db_cluster_to_point_in_time_message)

let make_restore_db_cluster_from_snapshot_message ?network_type:(network_type_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?engine_version:(engine_version_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~engine:(engine_ : string_) ~snapshot_identifier:(snapshot_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     network_type = network_type_;
     storage_type = storage_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     deletion_protection = deletion_protection_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_subnet_group_name = db_subnet_group_name_;
     port = port_;
     engine_version = engine_version_;
     engine = engine_;
     snapshot_identifier = snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     availability_zones = availability_zones_;
   }
    : restore_db_cluster_from_snapshot_message)

let make_pending_maintenance_action ?description:(description_ : string_ option)
    ?current_apply_date:(current_apply_date_ : t_stamp option)
    ?opt_in_status:(opt_in_status_ : string_ option)
    ?forced_apply_date:(forced_apply_date_ : t_stamp option)
    ?auto_applied_after_date:(auto_applied_after_date_ : t_stamp option)
    ?action:(action_ : string_ option) () =
  ({
     description = description_;
     current_apply_date = current_apply_date_;
     opt_in_status = opt_in_status_;
     forced_apply_date = forced_apply_date_;
     auto_applied_after_date = auto_applied_after_date_;
     action = action_;
   }
    : pending_maintenance_action)

let make_resource_pending_maintenance_actions
    ?pending_maintenance_action_details:
      (pending_maintenance_action_details_ : pending_maintenance_action_details option)
    ?resource_identifier:(resource_identifier_ : string_ option) () =
  ({
     pending_maintenance_action_details = pending_maintenance_action_details_;
     resource_identifier = resource_identifier_;
   }
    : resource_pending_maintenance_actions)

let make_parameter ?apply_method:(apply_method_ : apply_method option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?source:(source_ : string_ option)
    ?description:(description_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({
     apply_method = apply_method_;
     minimum_engine_version = minimum_engine_version_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     apply_type = apply_type_;
     source = source_;
     description = description_;
     parameter_value = parameter_value_;
     parameter_name = parameter_name_;
   }
    : parameter)

let make_reset_db_cluster_parameter_group_message ?parameters:(parameters_ : parameters_list option)
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({
     parameters = parameters_;
     reset_all_parameters = reset_all_parameters_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
   }
    : reset_db_cluster_parameter_group_message)

let make_db_cluster_parameter_group_name_message
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : db_cluster_parameter_group_name_message)

let make_remove_tags_from_resource_message ~tag_keys:(tag_keys_ : key_list)
    ~resource_name:(resource_name_ : string_) () =
  ({ tag_keys = tag_keys_; resource_name = resource_name_ } : remove_tags_from_resource_message)

let make_event_subscription ?event_subscription_arn:(event_subscription_arn_ : string_ option)
    ?enabled:(enabled_ : boolean_ option)
    ?event_categories_list:(event_categories_list_ : event_categories_list option)
    ?source_ids_list:(source_ids_list_ : source_ids_list option)
    ?source_type:(source_type_ : string_ option)
    ?subscription_creation_time:(subscription_creation_time_ : string_ option)
    ?status:(status_ : string_ option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?cust_subscription_id:(cust_subscription_id_ : string_ option)
    ?customer_aws_id:(customer_aws_id_ : string_ option) () =
  ({
     event_subscription_arn = event_subscription_arn_;
     enabled = enabled_;
     event_categories_list = event_categories_list_;
     source_ids_list = source_ids_list_;
     source_type = source_type_;
     subscription_creation_time = subscription_creation_time_;
     status = status_;
     sns_topic_arn = sns_topic_arn_;
     cust_subscription_id = cust_subscription_id_;
     customer_aws_id = customer_aws_id_;
   }
    : event_subscription)

let make_remove_source_identifier_from_subscription_message
    ~source_identifier:(source_identifier_ : string_)
    ~subscription_name:(subscription_name_ : string_) () =
  ({ source_identifier = source_identifier_; subscription_name = subscription_name_ }
    : remove_source_identifier_from_subscription_message)

let make_remove_from_global_cluster_message
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : remove_from_global_cluster_message)

let make_endpoint ?hosted_zone_id:(hosted_zone_id_ : string_ option) ?port:(port_ : integer option)
    ?address:(address_ : string_ option) () =
  ({ hosted_zone_id = hosted_zone_id_; port = port_; address = address_ } : endpoint)

let make_db_subnet_group
    ?supported_network_types:(supported_network_types_ : network_type_list option)
    ?db_subnet_group_arn:(db_subnet_group_arn_ : string_ option)
    ?subnets:(subnets_ : subnet_list option)
    ?subnet_group_status:(subnet_group_status_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?db_subnet_group_description:(db_subnet_group_description_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option) () =
  ({
     supported_network_types = supported_network_types_;
     db_subnet_group_arn = db_subnet_group_arn_;
     subnets = subnets_;
     subnet_group_status = subnet_group_status_;
     vpc_id = vpc_id_;
     db_subnet_group_description = db_subnet_group_description_;
     db_subnet_group_name = db_subnet_group_name_;
   }
    : db_subnet_group)

let make_pending_cloudwatch_logs_exports
    ?log_types_to_disable:(log_types_to_disable_ : log_type_list option)
    ?log_types_to_enable:(log_types_to_enable_ : log_type_list option) () =
  ({ log_types_to_disable = log_types_to_disable_; log_types_to_enable = log_types_to_enable_ }
    : pending_cloudwatch_logs_exports)

let make_pending_modified_values
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?port:(port_ : integer_optional option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_instance_class:(db_instance_class_ : string_ option) () =
  ({
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
     db_subnet_group_name = db_subnet_group_name_;
     ca_certificate_identifier = ca_certificate_identifier_;
     storage_type = storage_type_;
     db_instance_identifier = db_instance_identifier_;
     iops = iops_;
     license_model = license_model_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     backup_retention_period = backup_retention_period_;
     port = port_;
     master_user_password = master_user_password_;
     allocated_storage = allocated_storage_;
     db_instance_class = db_instance_class_;
   }
    : pending_modified_values)

let make_db_instance_status_info ?message:(message_ : string_ option)
    ?status:(status_ : string_ option) ?normal:(normal_ : boolean_ option)
    ?status_type:(status_type_ : string_ option) () =
  ({ message = message_; status = status_; normal = normal_; status_type = status_type_ }
    : db_instance_status_info)

let make_certificate_details ?valid_till:(valid_till_ : t_stamp option)
    ?ca_identifier:(ca_identifier_ : string_ option) () =
  ({ valid_till = valid_till_; ca_identifier = ca_identifier_ } : certificate_details)

let make_db_instance
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?db_instance_arn:(db_instance_arn_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?status_infos:(status_infos_ : db_instance_status_info_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : db_subnet_group option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?backup_retention_period:(backup_retention_period_ : integer option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?endpoint:(endpoint_ : endpoint option)
    ?db_instance_status:(db_instance_status_ : string_ option) ?engine:(engine_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_enabled = performance_insights_enabled_;
     certificate_details = certificate_details_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     db_instance_arn = db_instance_arn_;
     promotion_tier = promotion_tier_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     ca_certificate_identifier = ca_certificate_identifier_;
     dbi_resource_id = dbi_resource_id_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     db_cluster_identifier = db_cluster_identifier_;
     status_infos = status_infos_;
     publicly_accessible = publicly_accessible_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     latest_restorable_time = latest_restorable_time_;
     pending_modified_values = pending_modified_values_;
     preferred_maintenance_window = preferred_maintenance_window_;
     db_subnet_group = db_subnet_group_;
     availability_zone = availability_zone_;
     vpc_security_groups = vpc_security_groups_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     instance_create_time = instance_create_time_;
     endpoint = endpoint_;
     db_instance_status = db_instance_status_;
     engine = engine_;
     db_instance_class = db_instance_class_;
     db_instance_identifier = db_instance_identifier_;
   }
    : db_instance)

let make_reboot_db_instance_message ?force_failover:(force_failover_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ force_failover = force_failover_; db_instance_identifier = db_instance_identifier_ }
    : reboot_db_instance_message)

let make_pending_maintenance_actions_message ?marker:(marker_ : string_ option)
    ?pending_maintenance_actions:(pending_maintenance_actions_ : pending_maintenance_actions option)
    () =
  ({ marker = marker_; pending_maintenance_actions = pending_maintenance_actions_ }
    : pending_maintenance_actions_message)

let make_orderable_db_instance_option ?storage_type:(storage_type_ : string_ option)
    ?vpc:(vpc_ : boolean_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?license_model:(license_model_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     storage_type = storage_type_;
     vpc = vpc_;
     availability_zones = availability_zones_;
     license_model = license_model_;
     db_instance_class = db_instance_class_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : orderable_db_instance_option)

let make_orderable_db_instance_options_message ?marker:(marker_ : string_ option)
    ?orderable_db_instance_options:
      (orderable_db_instance_options_ : orderable_db_instance_options_list option) () =
  ({ marker = marker_; orderable_db_instance_options = orderable_db_instance_options_ }
    : orderable_db_instance_options_message)

let make_modify_global_cluster_message
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?new_global_cluster_identifier:
      (new_global_cluster_identifier_ : global_cluster_identifier option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     deletion_protection = deletion_protection_;
     new_global_cluster_identifier = new_global_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : modify_global_cluster_message)

let make_modify_event_subscription_message ?enabled:(enabled_ : boolean_optional option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ~subscription_name:(subscription_name_ : string_) () =
  ({
     enabled = enabled_;
     event_categories = event_categories_;
     source_type = source_type_;
     sns_topic_arn = sns_topic_arn_;
     subscription_name = subscription_name_;
   }
    : modify_event_subscription_message)

let make_modify_db_subnet_group_message
    ?db_subnet_group_description:(db_subnet_group_description_ : string_ option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~db_subnet_group_name:(db_subnet_group_name_ : string_) () =
  ({
     subnet_ids = subnet_ids_;
     db_subnet_group_description = db_subnet_group_description_;
     db_subnet_group_name = db_subnet_group_name_;
   }
    : modify_db_subnet_group_message)

let make_modify_db_instance_message
    ?certificate_rotation_restart:(certificate_rotation_restart_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?new_db_instance_identifier:(new_db_instance_identifier_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     certificate_rotation_restart = certificate_rotation_restart_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     promotion_tier = promotion_tier_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     ca_certificate_identifier = ca_certificate_identifier_;
     new_db_instance_identifier = new_db_instance_identifier_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     preferred_maintenance_window = preferred_maintenance_window_;
     apply_immediately = apply_immediately_;
     db_instance_class = db_instance_class_;
     db_instance_identifier = db_instance_identifier_;
   }
    : modify_db_instance_message)

let make_db_cluster_snapshot_attribute
    ?attribute_values:(attribute_values_ : attribute_value_list option)
    ?attribute_name:(attribute_name_ : string_ option) () =
  ({ attribute_values = attribute_values_; attribute_name = attribute_name_ }
    : db_cluster_snapshot_attribute)

let make_modify_db_cluster_snapshot_attribute_message
    ?values_to_remove:(values_to_remove_ : attribute_value_list option)
    ?values_to_add:(values_to_add_ : attribute_value_list option)
    ~attribute_name:(attribute_name_ : string_)
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({
     values_to_remove = values_to_remove_;
     values_to_add = values_to_add_;
     attribute_name = attribute_name_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
   }
    : modify_db_cluster_snapshot_attribute_message)

let make_modify_db_cluster_parameter_group_message ~parameters:(parameters_ : parameters_list)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({ parameters = parameters_; db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : modify_db_cluster_parameter_group_message)

let make_cloudwatch_logs_export_configuration
    ?disable_log_types:(disable_log_types_ : log_type_list option)
    ?enable_log_types:(enable_log_types_ : log_type_list option) () =
  ({ disable_log_types = disable_log_types_; enable_log_types = enable_log_types_ }
    : cloudwatch_logs_export_configuration)

let make_modify_db_cluster_message ?network_type:(network_type_ : string_ option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?storage_type:(storage_type_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?new_db_cluster_identifier:(new_db_cluster_identifier_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     network_type = network_type_;
     rotate_master_user_password = rotate_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     deletion_protection = deletion_protection_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     engine_version = engine_version_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     master_user_password = master_user_password_;
     port = port_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     backup_retention_period = backup_retention_period_;
     apply_immediately = apply_immediately_;
     new_db_cluster_identifier = new_db_cluster_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : modify_db_cluster_message)

let make_filter ~values:(values_ : filter_value_list) ~name:(name_ : string_) () =
  ({ values = values_; name = name_ } : filter)

let make_list_tags_for_resource_message ?filters:(filters_ : filter_list option)
    ~resource_name:(resource_name_ : string_) () =
  ({ filters = filters_; resource_name = resource_name_ } : list_tags_for_resource_message)

let make_global_clusters_message ?global_clusters:(global_clusters_ : global_cluster_list option)
    ?marker:(marker_ : string_ option) () =
  ({ global_clusters = global_clusters_; marker = marker_ } : global_clusters_message)

let make_failover_global_cluster_message ?switchover:(switchover_ : boolean_optional option)
    ?allow_data_loss:(allow_data_loss_ : boolean_optional option)
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : db_cluster_identifier)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     switchover = switchover_;
     allow_data_loss = allow_data_loss_;
     target_db_cluster_identifier = target_db_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : failover_global_cluster_message)

let make_failover_db_cluster_message
    ?target_db_instance_identifier:(target_db_instance_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     target_db_instance_identifier = target_db_instance_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : failover_db_cluster_message)

let make_event ?source_arn:(source_arn_ : string_ option) ?date:(date_ : t_stamp option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?message:(message_ : string_ option) ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     source_arn = source_arn_;
     date = date_;
     event_categories = event_categories_;
     message = message_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : event)

let make_events_message ?events:(events_ : event_list option) ?marker:(marker_ : string_ option) ()
    =
  ({ events = events_; marker = marker_ } : events_message)

let make_event_subscriptions_message
    ?event_subscriptions_list:(event_subscriptions_list_ : event_subscriptions_list option)
    ?marker:(marker_ : string_ option) () =
  ({ event_subscriptions_list = event_subscriptions_list_; marker = marker_ }
    : event_subscriptions_message)

let make_event_categories_map ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) () =
  ({ event_categories = event_categories_; source_type = source_type_ } : event_categories_map)

let make_event_categories_message
    ?event_categories_map_list:(event_categories_map_list_ : event_categories_map_list option) () =
  ({ event_categories_map_list = event_categories_map_list_ } : event_categories_message)

let make_engine_defaults ?parameters:(parameters_ : parameters_list option)
    ?marker:(marker_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option) () =
  ({
     parameters = parameters_;
     marker = marker_;
     db_parameter_group_family = db_parameter_group_family_;
   }
    : engine_defaults)

let make_describe_pending_maintenance_actions_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ?resource_identifier:(resource_identifier_ : string_ option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     resource_identifier = resource_identifier_;
   }
    : describe_pending_maintenance_actions_message)

let make_describe_orderable_db_instance_options_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?vpc:(vpc_ : boolean_optional option) ?license_model:(license_model_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ~engine:(engine_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     vpc = vpc_;
     license_model = license_model_;
     db_instance_class = db_instance_class_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : describe_orderable_db_instance_options_message)

let make_describe_global_clusters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : describe_global_clusters_message)

let make_describe_events_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?duration:(duration_ : integer_optional option) ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) ?source_type:(source_type_ : source_type option)
    ?source_identifier:(source_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     event_categories = event_categories_;
     duration = duration_;
     end_time = end_time_;
     start_time = start_time_;
     source_type = source_type_;
     source_identifier = source_identifier_;
   }
    : describe_events_message)

let make_describe_event_subscriptions_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?subscription_name:(subscription_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     subscription_name = subscription_name_;
   }
    : describe_event_subscriptions_message)

let make_describe_event_categories_message ?filters:(filters_ : filter_list option)
    ?source_type:(source_type_ : string_ option) () =
  ({ filters = filters_; source_type = source_type_ } : describe_event_categories_message)

let make_describe_engine_default_cluster_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_parameter_group_family = db_parameter_group_family_;
   }
    : describe_engine_default_cluster_parameters_message)

let make_describe_db_subnet_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_subnet_group_name = db_subnet_group_name_;
   }
    : describe_db_subnet_groups_message)

let make_db_subnet_group_message ?db_subnet_groups:(db_subnet_groups_ : db_subnet_groups option)
    ?marker:(marker_ : string_ option) () =
  ({ db_subnet_groups = db_subnet_groups_; marker = marker_ } : db_subnet_group_message)

let make_describe_db_instances_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_instance_identifier = db_instance_identifier_;
   }
    : describe_db_instances_message)

let make_db_instance_message ?db_instances:(db_instances_ : db_instance_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_instances = db_instances_; marker = marker_ } : db_instance_message)

let make_describe_db_engine_versions_message
    ?list_supported_timezones:(list_supported_timezones_ : boolean_optional option)
    ?list_supported_character_sets:(list_supported_character_sets_ : boolean_optional option)
    ?default_only:(default_only_ : boolean_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     list_supported_timezones = list_supported_timezones_;
     list_supported_character_sets = list_supported_character_sets_;
     default_only = default_only_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_parameter_group_family = db_parameter_group_family_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : describe_db_engine_versions_message)

let make_db_engine_version
    ?serverless_v2_features_support:
      (serverless_v2_features_support_ : serverless_v2_features_support option)
    ?supports_certificate_rotation_without_restart:
      (supports_certificate_rotation_without_restart_ : boolean_optional option)
    ?supported_ca_certificate_identifiers:
      (supported_ca_certificate_identifiers_ : ca_certificate_identifiers_list option)
    ?supports_log_exports_to_cloudwatch_logs:
      (supports_log_exports_to_cloudwatch_logs_ : boolean_ option)
    ?exportable_log_types:(exportable_log_types_ : log_type_list option)
    ?valid_upgrade_target:(valid_upgrade_target_ : valid_upgrade_target_list option)
    ?db_engine_version_description:(db_engine_version_description_ : string_ option)
    ?db_engine_description:(db_engine_description_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     serverless_v2_features_support = serverless_v2_features_support_;
     supports_certificate_rotation_without_restart = supports_certificate_rotation_without_restart_;
     supported_ca_certificate_identifiers = supported_ca_certificate_identifiers_;
     supports_log_exports_to_cloudwatch_logs = supports_log_exports_to_cloudwatch_logs_;
     exportable_log_types = exportable_log_types_;
     valid_upgrade_target = valid_upgrade_target_;
     db_engine_version_description = db_engine_version_description_;
     db_engine_description = db_engine_description_;
     db_parameter_group_family = db_parameter_group_family_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : db_engine_version)

let make_db_engine_version_message
    ?db_engine_versions:(db_engine_versions_ : db_engine_version_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_engine_versions = db_engine_versions_; marker = marker_ } : db_engine_version_message)

let make_describe_db_clusters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : describe_db_clusters_message)

let make_db_cluster_message ?db_clusters:(db_clusters_ : db_cluster_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_clusters = db_clusters_; marker = marker_ } : db_cluster_message)

let make_describe_db_cluster_snapshots_message ?include_public:(include_public_ : boolean_ option)
    ?include_shared:(include_shared_ : boolean_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     include_public = include_public_;
     include_shared = include_shared_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     snapshot_type = snapshot_type_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : describe_db_cluster_snapshots_message)

let make_db_cluster_snapshot ?storage_type:(storage_type_ : string_ option)
    ?source_db_cluster_snapshot_arn:(source_db_cluster_snapshot_arn_ : string_ option)
    ?db_cluster_snapshot_arn:(db_cluster_snapshot_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option) ?vpc_id:(vpc_id_ : string_ option)
    ?port:(port_ : integer option) ?status:(status_ : string_ option)
    ?engine:(engine_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({
     storage_type = storage_type_;
     source_db_cluster_snapshot_arn = source_db_cluster_snapshot_arn_;
     db_cluster_snapshot_arn = db_cluster_snapshot_arn_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     percent_progress = percent_progress_;
     snapshot_type = snapshot_type_;
     engine_version = engine_version_;
     master_username = master_username_;
     cluster_create_time = cluster_create_time_;
     vpc_id = vpc_id_;
     port = port_;
     status = status_;
     engine = engine_;
     snapshot_create_time = snapshot_create_time_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     availability_zones = availability_zones_;
   }
    : db_cluster_snapshot)

let make_db_cluster_snapshot_message
    ?db_cluster_snapshots:(db_cluster_snapshots_ : db_cluster_snapshot_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_cluster_snapshots = db_cluster_snapshots_; marker = marker_ } : db_cluster_snapshot_message)

let make_describe_db_cluster_snapshot_attributes_message
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({ db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_ }
    : describe_db_cluster_snapshot_attributes_message)

let make_describe_db_cluster_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?source:(source_ : string_ option)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     source = source_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
   }
    : describe_db_cluster_parameters_message)

let make_db_cluster_parameter_group_details ?marker:(marker_ : string_ option)
    ?parameters:(parameters_ : parameters_list option) () =
  ({ marker = marker_; parameters = parameters_ } : db_cluster_parameter_group_details)

let make_describe_db_cluster_parameter_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
   }
    : describe_db_cluster_parameter_groups_message)

let make_db_cluster_parameter_group
    ?db_cluster_parameter_group_arn:(db_cluster_parameter_group_arn_ : string_ option)
    ?description:(description_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option) () =
  ({
     db_cluster_parameter_group_arn = db_cluster_parameter_group_arn_;
     description = description_;
     db_parameter_group_family = db_parameter_group_family_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
   }
    : db_cluster_parameter_group)

let make_db_cluster_parameter_groups_message
    ?db_cluster_parameter_groups:
      (db_cluster_parameter_groups_ : db_cluster_parameter_group_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_cluster_parameter_groups = db_cluster_parameter_groups_; marker = marker_ }
    : db_cluster_parameter_groups_message)

let make_describe_certificates_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?certificate_identifier:(certificate_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     certificate_identifier = certificate_identifier_;
   }
    : describe_certificates_message)

let make_certificate ?certificate_arn:(certificate_arn_ : string_ option)
    ?valid_till:(valid_till_ : t_stamp option) ?valid_from:(valid_from_ : t_stamp option)
    ?thumbprint:(thumbprint_ : string_ option)
    ?certificate_type:(certificate_type_ : string_ option)
    ?certificate_identifier:(certificate_identifier_ : string_ option) () =
  ({
     certificate_arn = certificate_arn_;
     valid_till = valid_till_;
     valid_from = valid_from_;
     thumbprint = thumbprint_;
     certificate_type = certificate_type_;
     certificate_identifier = certificate_identifier_;
   }
    : certificate)

let make_certificate_message ?marker:(marker_ : string_ option)
    ?certificates:(certificates_ : certificate_list option) () =
  ({ marker = marker_; certificates = certificates_ } : certificate_message)

let make_delete_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({ global_cluster_identifier = global_cluster_identifier_ } : delete_global_cluster_message)

let make_delete_event_subscription_message ~subscription_name:(subscription_name_ : string_) () =
  ({ subscription_name = subscription_name_ } : delete_event_subscription_message)

let make_delete_db_subnet_group_message ~db_subnet_group_name:(db_subnet_group_name_ : string_) () =
  ({ db_subnet_group_name = db_subnet_group_name_ } : delete_db_subnet_group_message)

let make_delete_db_instance_message ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ } : delete_db_instance_message)

let make_delete_db_cluster_snapshot_message
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({ db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_ }
    : delete_db_cluster_snapshot_message)

let make_delete_db_cluster_parameter_group_message
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : delete_db_cluster_parameter_group_message)

let make_delete_db_cluster_message
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : delete_db_cluster_message)

let make_create_global_cluster_message
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     storage_encrypted = storage_encrypted_;
     database_name = database_name_;
     deletion_protection = deletion_protection_;
     engine_version = engine_version_;
     engine = engine_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : create_global_cluster_message)

let make_create_event_subscription_message ?tags:(tags_ : tag_list option)
    ?enabled:(enabled_ : boolean_optional option) ?source_ids:(source_ids_ : source_ids_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_type:(source_type_ : string_ option) ~sns_topic_arn:(sns_topic_arn_ : string_)
    ~subscription_name:(subscription_name_ : string_) () =
  ({
     tags = tags_;
     enabled = enabled_;
     source_ids = source_ids_;
     event_categories = event_categories_;
     source_type = source_type_;
     sns_topic_arn = sns_topic_arn_;
     subscription_name = subscription_name_;
   }
    : create_event_subscription_message)

let make_create_db_subnet_group_message ?tags:(tags_ : tag_list option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~db_subnet_group_description:(db_subnet_group_description_ : string_)
    ~db_subnet_group_name:(db_subnet_group_name_ : string_) () =
  ({
     tags = tags_;
     subnet_ids = subnet_ids_;
     db_subnet_group_description = db_subnet_group_description_;
     db_subnet_group_name = db_subnet_group_name_;
   }
    : create_db_subnet_group_message)

let make_create_db_instance_message
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~engine:(engine_ : string_)
    ~db_instance_class:(db_instance_class_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     ca_certificate_identifier = ca_certificate_identifier_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     promotion_tier = promotion_tier_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     db_cluster_identifier = db_cluster_identifier_;
     tags = tags_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     preferred_maintenance_window = preferred_maintenance_window_;
     availability_zone = availability_zone_;
     engine = engine_;
     db_instance_class = db_instance_class_;
     db_instance_identifier = db_instance_identifier_;
   }
    : create_db_instance_message)

let make_create_db_cluster_snapshot_message ?tags:(tags_ : tag_list option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({
     tags = tags_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
   }
    : create_db_cluster_snapshot_message)

let make_create_db_cluster_parameter_group_message ?tags:(tags_ : tag_list option)
    ~description:(description_ : string_)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({
     tags = tags_;
     description = description_;
     db_parameter_group_family = db_parameter_group_family_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
   }
    : create_db_cluster_parameter_group_message)

let make_create_db_cluster_message ?network_type:(network_type_ : string_ option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?storage_type:(storage_type_ : string_ option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?pre_signed_url:(pre_signed_url_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?master_username:(master_username_ : string_ option) ?port:(port_ : integer_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~engine:(engine_ : string_) ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     network_type = network_type_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     global_cluster_identifier = global_cluster_identifier_;
     deletion_protection = deletion_protection_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     pre_signed_url = pre_signed_url_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     tags = tags_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     port = port_;
     engine_version = engine_version_;
     engine = engine_;
     db_subnet_group_name = db_subnet_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     db_cluster_identifier = db_cluster_identifier_;
     backup_retention_period = backup_retention_period_;
     availability_zones = availability_zones_;
   }
    : create_db_cluster_message)

let make_copy_db_cluster_snapshot_message ?tags:(tags_ : tag_list option)
    ?copy_tags:(copy_tags_ : boolean_optional option)
    ?pre_signed_url:(pre_signed_url_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ~target_db_cluster_snapshot_identifier:(target_db_cluster_snapshot_identifier_ : string_)
    ~source_db_cluster_snapshot_identifier:(source_db_cluster_snapshot_identifier_ : string_) () =
  ({
     tags = tags_;
     copy_tags = copy_tags_;
     pre_signed_url = pre_signed_url_;
     kms_key_id = kms_key_id_;
     target_db_cluster_snapshot_identifier = target_db_cluster_snapshot_identifier_;
     source_db_cluster_snapshot_identifier = source_db_cluster_snapshot_identifier_;
   }
    : copy_db_cluster_snapshot_message)

let make_copy_db_cluster_parameter_group_message ?tags:(tags_ : tag_list option)
    ~target_db_cluster_parameter_group_description:
      (target_db_cluster_parameter_group_description_ : string_)
    ~target_db_cluster_parameter_group_identifier:
      (target_db_cluster_parameter_group_identifier_ : string_)
    ~source_db_cluster_parameter_group_identifier:
      (source_db_cluster_parameter_group_identifier_ : string_) () =
  ({
     tags = tags_;
     target_db_cluster_parameter_group_description = target_db_cluster_parameter_group_description_;
     target_db_cluster_parameter_group_identifier = target_db_cluster_parameter_group_identifier_;
     source_db_cluster_parameter_group_identifier = source_db_cluster_parameter_group_identifier_;
   }
    : copy_db_cluster_parameter_group_message)

let make_apply_pending_maintenance_action_message ~opt_in_type:(opt_in_type_ : string_)
    ~apply_action:(apply_action_ : string_) ~resource_identifier:(resource_identifier_ : string_) ()
    =
  ({
     opt_in_type = opt_in_type_;
     apply_action = apply_action_;
     resource_identifier = resource_identifier_;
   }
    : apply_pending_maintenance_action_message)

let make_add_tags_to_resource_message ~tags:(tags_ : tag_list)
    ~resource_name:(resource_name_ : string_) () =
  ({ tags = tags_; resource_name = resource_name_ } : add_tags_to_resource_message)

let make_add_source_identifier_to_subscription_message
    ~source_identifier:(source_identifier_ : string_)
    ~subscription_name:(subscription_name_ : string_) () =
  ({ source_identifier = source_identifier_; subscription_name = subscription_name_ }
    : add_source_identifier_to_subscription_message)
