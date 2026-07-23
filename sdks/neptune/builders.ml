open Types

let make_add_role_to_db_cluster_message ?feature_name:(feature_name_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~role_arn:(role_arn_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     role_arn = role_arn_;
     feature_name = feature_name_;
   }
    : add_role_to_db_cluster_message)

let make_event_subscription ?customer_aws_id:(customer_aws_id_ : string_ option)
    ?cust_subscription_id:(cust_subscription_id_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option) ?status:(status_ : string_ option)
    ?subscription_creation_time:(subscription_creation_time_ : string_ option)
    ?source_type:(source_type_ : string_ option)
    ?source_ids_list:(source_ids_list_ : source_ids_list option)
    ?event_categories_list:(event_categories_list_ : event_categories_list option)
    ?enabled:(enabled_ : boolean_ option)
    ?event_subscription_arn:(event_subscription_arn_ : string_ option) () =
  ({
     customer_aws_id = customer_aws_id_;
     cust_subscription_id = cust_subscription_id_;
     sns_topic_arn = sns_topic_arn_;
     status = status_;
     subscription_creation_time = subscription_creation_time_;
     source_type = source_type_;
     source_ids_list = source_ids_list_;
     event_categories_list = event_categories_list_;
     enabled = enabled_;
     event_subscription_arn = event_subscription_arn_;
   }
    : event_subscription)

let make_add_source_identifier_to_subscription_message
    ~subscription_name:(subscription_name_ : string_)
    ~source_identifier:(source_identifier_ : string_) () =
  ({ subscription_name = subscription_name_; source_identifier = source_identifier_ }
    : add_source_identifier_to_subscription_message)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_to_resource_message ~resource_name:(resource_name_ : string_)
    ~tags:(tags_ : tag_list) () =
  ({ resource_name = resource_name_; tags = tags_ } : add_tags_to_resource_message)

let make_failover_state ?status:(status_ : failover_status option)
    ?from_db_cluster_arn:(from_db_cluster_arn_ : string_ option)
    ?to_db_cluster_arn:(to_db_cluster_arn_ : string_ option)
    ?is_data_loss_allowed:(is_data_loss_allowed_ : boolean_ option) () =
  ({
     status = status_;
     from_db_cluster_arn = from_db_cluster_arn_;
     to_db_cluster_arn = to_db_cluster_arn_;
     is_data_loss_allowed = is_data_loss_allowed_;
   }
    : failover_state)

let make_global_cluster_member ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?readers:(readers_ : readers_arn_list option) ?is_writer:(is_writer_ : boolean_ option) () =
  ({ db_cluster_arn = db_cluster_arn_; readers = readers_; is_writer = is_writer_ }
    : global_cluster_member)

let make_global_cluster
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?global_cluster_resource_id:(global_cluster_resource_id_ : string_ option)
    ?global_cluster_arn:(global_cluster_arn_ : string_ option) ?status:(status_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?global_cluster_members:(global_cluster_members_ : global_cluster_member_list option)
    ?failover_state:(failover_state_ : failover_state option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     global_cluster_resource_id = global_cluster_resource_id_;
     global_cluster_arn = global_cluster_arn_;
     status = status_;
     engine = engine_;
     engine_version = engine_version_;
     database_name = database_name_;
     storage_encrypted = storage_encrypted_;
     deletion_protection = deletion_protection_;
     global_cluster_members = global_cluster_members_;
     failover_state = failover_state_;
     tag_list = tag_list_;
   }
    : global_cluster)

let make_switchover_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : string_) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     target_db_cluster_identifier = target_db_cluster_identifier_;
   }
    : switchover_global_cluster_message)

let make_serverless_v2_scaling_configuration_info
    ?min_capacity:(min_capacity_ : double_optional option)
    ?max_capacity:(max_capacity_ : double_optional option) () =
  ({ min_capacity = min_capacity_; max_capacity = max_capacity_ }
    : serverless_v2_scaling_configuration_info)

let make_pending_cloudwatch_logs_exports
    ?log_types_to_enable:(log_types_to_enable_ : log_type_list option)
    ?log_types_to_disable:(log_types_to_disable_ : log_type_list option) () =
  ({ log_types_to_enable = log_types_to_enable_; log_types_to_disable = log_types_to_disable_ }
    : pending_cloudwatch_logs_exports)

let make_cluster_pending_modified_values
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?network_type:(network_type_ : string_ option) () =
  ({
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
     db_cluster_identifier = db_cluster_identifier_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     engine_version = engine_version_;
     backup_retention_period = backup_retention_period_;
     storage_type = storage_type_;
     allocated_storage = allocated_storage_;
     iops = iops_;
     network_type = network_type_;
   }
    : cluster_pending_modified_values)

let make_db_cluster_role ?role_arn:(role_arn_ : string_ option) ?status:(status_ : string_ option)
    ?feature_name:(feature_name_ : string_ option) () =
  ({ role_arn = role_arn_; status = status_; feature_name = feature_name_ } : db_cluster_role)

let make_vpc_security_group_membership
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ vpc_security_group_id = vpc_security_group_id_; status = status_ }
    : vpc_security_group_membership)

let make_db_cluster_member ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?is_cluster_writer:(is_cluster_writer_ : boolean_ option)
    ?db_cluster_parameter_group_status:(db_cluster_parameter_group_status_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     is_cluster_writer = is_cluster_writer_;
     db_cluster_parameter_group_status = db_cluster_parameter_group_status_;
     promotion_tier = promotion_tier_;
   }
    : db_cluster_member)

let make_db_cluster_option_group_status
    ?db_cluster_option_group_name:(db_cluster_option_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ db_cluster_option_group_name = db_cluster_option_group_name_; status = status_ }
    : db_cluster_option_group_status)

let make_db_cluster ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_parameter_group:(db_cluster_parameter_group_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : string_ option) ?status:(status_ : string_ option)
    ?percent_progress:(percent_progress_ : string_ option)
    ?earliest_restorable_time:(earliest_restorable_time_ : t_stamp option)
    ?endpoint:(endpoint_ : string_ option) ?reader_endpoint:(reader_endpoint_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?port:(port_ : integer_optional option) ?master_username:(master_username_ : string_ option)
    ?db_cluster_option_group_memberships:
      (db_cluster_option_group_memberships_ : db_cluster_option_group_memberships option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?read_replica_identifiers:(read_replica_identifiers_ : read_replica_identifier_list option)
    ?db_cluster_members:(db_cluster_members_ : db_cluster_member_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?associated_roles:(associated_roles_ : db_cluster_roles option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?clone_group_id:(clone_group_id_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?pending_modified_values:(pending_modified_values_ : cluster_pending_modified_values option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?cross_account_clone:(cross_account_clone_ : boolean_optional option)
    ?automatic_restart_time:(automatic_restart_time_ : t_stamp option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration_info option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?io_optimized_next_allowed_modification_time:
      (io_optimized_next_allowed_modification_time_ : t_stamp option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option) ()
    =
  ({
     allocated_storage = allocated_storage_;
     availability_zones = availability_zones_;
     backup_retention_period = backup_retention_period_;
     character_set_name = character_set_name_;
     database_name = database_name_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_parameter_group = db_cluster_parameter_group_;
     db_subnet_group = db_subnet_group_;
     status = status_;
     percent_progress = percent_progress_;
     earliest_restorable_time = earliest_restorable_time_;
     endpoint = endpoint_;
     reader_endpoint = reader_endpoint_;
     multi_a_z = multi_a_z_;
     engine = engine_;
     engine_version = engine_version_;
     latest_restorable_time = latest_restorable_time_;
     port = port_;
     master_username = master_username_;
     db_cluster_option_group_memberships = db_cluster_option_group_memberships_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     replication_source_identifier = replication_source_identifier_;
     read_replica_identifiers = read_replica_identifiers_;
     db_cluster_members = db_cluster_members_;
     vpc_security_groups = vpc_security_groups_;
     hosted_zone_id = hosted_zone_id_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     db_cluster_resource_id = db_cluster_resource_id_;
     db_cluster_arn = db_cluster_arn_;
     associated_roles = associated_roles_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     clone_group_id = clone_group_id_;
     cluster_create_time = cluster_create_time_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     pending_modified_values = pending_modified_values_;
     deletion_protection = deletion_protection_;
     cross_account_clone = cross_account_clone_;
     automatic_restart_time = automatic_restart_time_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     global_cluster_identifier = global_cluster_identifier_;
     io_optimized_next_allowed_modification_time = io_optimized_next_allowed_modification_time_;
     storage_type = storage_type_;
     network_type = network_type_;
   }
    : db_cluster)

let make_stop_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : stop_db_cluster_message)

let make_start_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : start_db_cluster_message)

let make_serverless_v2_scaling_configuration ?min_capacity:(min_capacity_ : double_optional option)
    ?max_capacity:(max_capacity_ : double_optional option) () =
  ({ min_capacity = min_capacity_; max_capacity = max_capacity_ }
    : serverless_v2_scaling_configuration)

let make_restore_db_cluster_to_point_in_time_message ?restore_type:(restore_type_ : string_ option)
    ?restore_to_time:(restore_to_time_ : t_stamp option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?port:(port_ : integer_optional option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~source_db_cluster_identifier:(source_db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     restore_type = restore_type_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     restore_to_time = restore_to_time_;
     use_latest_restorable_time = use_latest_restorable_time_;
     port = port_;
     db_subnet_group_name = db_subnet_group_name_;
     option_group_name = option_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     deletion_protection = deletion_protection_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     network_type = network_type_;
   }
    : restore_db_cluster_to_point_in_time_message)

let make_restore_db_cluster_from_snapshot_message
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?engine_version:(engine_version_ : string_ option) ?port:(port_ : integer_optional option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~snapshot_identifier:(snapshot_identifier_ : string_) ~engine:(engine_ : string_) () =
  ({
     availability_zones = availability_zones_;
     db_cluster_identifier = db_cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     engine = engine_;
     engine_version = engine_version_;
     port = port_;
     db_subnet_group_name = db_subnet_group_name_;
     database_name = database_name_;
     option_group_name = option_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     deletion_protection = deletion_protection_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     network_type = network_type_;
   }
    : restore_db_cluster_from_snapshot_message)

let make_db_parameter_group_name_message
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : db_parameter_group_name_message)

let make_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?apply_method:(apply_method_ : apply_method option) () =
  ({
     parameter_name = parameter_name_;
     parameter_value = parameter_value_;
     description = description_;
     source = source_;
     apply_type = apply_type_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     minimum_engine_version = minimum_engine_version_;
     apply_method = apply_method_;
   }
    : parameter)

let make_reset_db_parameter_group_message
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ?parameters:(parameters_ : parameters_list option)
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     reset_all_parameters = reset_all_parameters_;
     parameters = parameters_;
   }
    : reset_db_parameter_group_message)

let make_db_cluster_parameter_group_name_message
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : db_cluster_parameter_group_name_message)

let make_reset_db_cluster_parameter_group_message
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ?parameters:(parameters_ : parameters_list option)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     reset_all_parameters = reset_all_parameters_;
     parameters = parameters_;
   }
    : reset_db_cluster_parameter_group_message)

let make_remove_tags_from_resource_message ~resource_name:(resource_name_ : string_)
    ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_name = resource_name_; tag_keys = tag_keys_ } : remove_tags_from_resource_message)

let make_remove_source_identifier_from_subscription_message
    ~subscription_name:(subscription_name_ : string_)
    ~source_identifier:(source_identifier_ : string_) () =
  ({ subscription_name = subscription_name_; source_identifier = source_identifier_ }
    : remove_source_identifier_from_subscription_message)

let make_remove_role_from_db_cluster_message ?feature_name:(feature_name_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~role_arn:(role_arn_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     role_arn = role_arn_;
     feature_name = feature_name_;
   }
    : remove_role_from_db_cluster_message)

let make_remove_from_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : remove_from_global_cluster_message)

let make_domain_membership ?domain:(domain_ : string_ option) ?status:(status_ : string_ option)
    ?fqd_n:(fqd_n_ : string_ option) ?iam_role_name:(iam_role_name_ : string_ option) () =
  ({ domain = domain_; status = status_; fqd_n = fqd_n_; iam_role_name = iam_role_name_ }
    : domain_membership)

let make_db_instance_status_info ?status_type:(status_type_ : string_ option)
    ?normal:(normal_ : boolean_ option) ?status:(status_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ status_type = status_type_; normal = normal_; status = status_; message = message_ }
    : db_instance_status_info)

let make_option_group_membership ?option_group_name:(option_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ option_group_name = option_group_name_; status = status_ } : option_group_membership)

let make_pending_modified_values ?db_instance_class:(db_instance_class_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option) () =
  ({
     db_instance_class = db_instance_class_;
     allocated_storage = allocated_storage_;
     master_user_password = master_user_password_;
     port = port_;
     backup_retention_period = backup_retention_period_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     license_model = license_model_;
     iops = iops_;
     db_instance_identifier = db_instance_identifier_;
     storage_type = storage_type_;
     ca_certificate_identifier = ca_certificate_identifier_;
     db_subnet_group_name = db_subnet_group_name_;
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
   }
    : pending_modified_values)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_status:(subnet_status_ : string_ option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_status = subnet_status_;
   }
    : subnet)

let make_db_subnet_group ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?db_subnet_group_description:(db_subnet_group_description_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?subnet_group_status:(subnet_group_status_ : string_ option)
    ?subnets:(subnets_ : subnet_list option)
    ?db_subnet_group_arn:(db_subnet_group_arn_ : string_ option)
    ?supported_network_types:(supported_network_types_ : string_list option) () =
  ({
     db_subnet_group_name = db_subnet_group_name_;
     db_subnet_group_description = db_subnet_group_description_;
     vpc_id = vpc_id_;
     subnet_group_status = subnet_group_status_;
     subnets = subnets_;
     db_subnet_group_arn = db_subnet_group_arn_;
     supported_network_types = supported_network_types_;
   }
    : db_subnet_group)

let make_db_parameter_group_status
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option) () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     parameter_apply_status = parameter_apply_status_;
   }
    : db_parameter_group_status)

let make_db_security_group_membership
    ?db_security_group_name:(db_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ db_security_group_name = db_security_group_name_; status = status_ }
    : db_security_group_membership)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option) () =
  ({ address = address_; port = port_; hosted_zone_id = hosted_zone_id_ } : endpoint)

let make_db_instance ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?engine:(engine_ : string_ option)
    ?db_instance_status:(db_instance_status_ : string_ option)
    ?master_username:(master_username_ : string_ option) ?db_name:(db_name_ : string_ option)
    ?endpoint:(endpoint_ : endpoint option) ?allocated_storage:(allocated_storage_ : integer option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer option)
    ?db_security_groups:(db_security_groups_ : db_security_group_membership_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?db_parameter_groups:(db_parameter_groups_ : db_parameter_group_status_list option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : db_subnet_group option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?multi_a_z:(multi_a_z_ : boolean_ option) ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?read_replica_source_db_instance_identifier:
      (read_replica_source_db_instance_identifier_ : string_ option)
    ?read_replica_db_instance_identifiers:
      (read_replica_db_instance_identifiers_ : read_replica_db_instance_identifier_list option)
    ?read_replica_db_cluster_identifiers:
      (read_replica_db_cluster_identifiers_ : read_replica_db_cluster_identifier_list option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?option_group_memberships:(option_group_memberships_ : option_group_membership_list option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?status_infos:(status_infos_ : db_instance_status_info_list option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?db_instance_port:(db_instance_port_ : integer option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?domain_memberships:(domain_memberships_ : domain_membership_list option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?enhanced_monitoring_resource_arn:(enhanced_monitoring_resource_arn_ : string_ option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?db_instance_arn:(db_instance_arn_ : string_ option) ?timezone:(timezone_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     db_instance_class = db_instance_class_;
     engine = engine_;
     db_instance_status = db_instance_status_;
     master_username = master_username_;
     db_name = db_name_;
     endpoint = endpoint_;
     allocated_storage = allocated_storage_;
     instance_create_time = instance_create_time_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_security_groups = db_security_groups_;
     vpc_security_groups = vpc_security_groups_;
     db_parameter_groups = db_parameter_groups_;
     availability_zone = availability_zone_;
     db_subnet_group = db_subnet_group_;
     preferred_maintenance_window = preferred_maintenance_window_;
     pending_modified_values = pending_modified_values_;
     latest_restorable_time = latest_restorable_time_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     read_replica_source_db_instance_identifier = read_replica_source_db_instance_identifier_;
     read_replica_db_instance_identifiers = read_replica_db_instance_identifiers_;
     read_replica_db_cluster_identifiers = read_replica_db_cluster_identifiers_;
     license_model = license_model_;
     iops = iops_;
     option_group_memberships = option_group_memberships_;
     character_set_name = character_set_name_;
     secondary_availability_zone = secondary_availability_zone_;
     publicly_accessible = publicly_accessible_;
     status_infos = status_infos_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     db_instance_port = db_instance_port_;
     db_cluster_identifier = db_cluster_identifier_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     dbi_resource_id = dbi_resource_id_;
     ca_certificate_identifier = ca_certificate_identifier_;
     domain_memberships = domain_memberships_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     enhanced_monitoring_resource_arn = enhanced_monitoring_resource_arn_;
     monitoring_role_arn = monitoring_role_arn_;
     promotion_tier = promotion_tier_;
     db_instance_arn = db_instance_arn_;
     timezone = timezone_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     performance_insights_enabled = performance_insights_enabled_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     deletion_protection = deletion_protection_;
     network_type = network_type_;
   }
    : db_instance)

let make_reboot_db_instance_message ?force_failover:(force_failover_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_; force_failover = force_failover_ }
    : reboot_db_instance_message)

let make_promote_read_replica_db_cluster_message
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : promote_read_replica_db_cluster_message)

let make_modify_global_cluster_message
    ?new_global_cluster_identifier:
      (new_global_cluster_identifier_ : global_cluster_identifier option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_optional option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     new_global_cluster_identifier = new_global_cluster_identifier_;
     deletion_protection = deletion_protection_;
     engine_version = engine_version_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
   }
    : modify_global_cluster_message)

let make_modify_event_subscription_message ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?enabled:(enabled_ : boolean_optional option) ~subscription_name:(subscription_name_ : string_)
    () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     event_categories = event_categories_;
     enabled = enabled_;
   }
    : modify_event_subscription_message)

let make_modify_db_subnet_group_message
    ?db_subnet_group_description:(db_subnet_group_description_ : string_ option)
    ~db_subnet_group_name:(db_subnet_group_name_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     db_subnet_group_name = db_subnet_group_name_;
     db_subnet_group_description = db_subnet_group_description_;
     subnet_ids = subnet_ids_;
   }
    : modify_db_subnet_group_message)

let make_modify_db_parameter_group_message
    ~db_parameter_group_name:(db_parameter_group_name_ : string_)
    ~parameters:(parameters_ : parameters_list) () =
  ({ db_parameter_group_name = db_parameter_group_name_; parameters = parameters_ }
    : modify_db_parameter_group_message)

let make_cloudwatch_logs_export_configuration
    ?enable_log_types:(enable_log_types_ : log_type_list option)
    ?disable_log_types:(disable_log_types_ : log_type_list option) () =
  ({ enable_log_types = enable_log_types_; disable_log_types = disable_log_types_ }
    : cloudwatch_logs_export_configuration)

let make_modify_db_instance_message
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?db_security_groups:(db_security_groups_ : db_security_group_name_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?new_db_instance_identifier:(new_db_instance_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?db_port_number:(db_port_number_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     allocated_storage = allocated_storage_;
     db_instance_class = db_instance_class_;
     db_subnet_group_name = db_subnet_group_name_;
     db_security_groups = db_security_groups_;
     vpc_security_group_ids = vpc_security_group_ids_;
     apply_immediately = apply_immediately_;
     master_user_password = master_user_password_;
     db_parameter_group_name = db_parameter_group_name_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     license_model = license_model_;
     iops = iops_;
     option_group_name = option_group_name_;
     new_db_instance_identifier = new_db_instance_identifier_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     ca_certificate_identifier = ca_certificate_identifier_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     db_port_number = db_port_number_;
     publicly_accessible = publicly_accessible_;
     monitoring_role_arn = monitoring_role_arn_;
     domain_iam_role_name = domain_iam_role_name_;
     promotion_tier = promotion_tier_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     deletion_protection = deletion_protection_;
   }
    : modify_db_instance_message)

let make_db_cluster_snapshot_attribute ?attribute_name:(attribute_name_ : string_ option)
    ?attribute_values:(attribute_values_ : attribute_value_list option) () =
  ({ attribute_name = attribute_name_; attribute_values = attribute_values_ }
    : db_cluster_snapshot_attribute)

let make_modify_db_cluster_snapshot_attribute_message
    ?values_to_add:(values_to_add_ : attribute_value_list option)
    ?values_to_remove:(values_to_remove_ : attribute_value_list option)
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_)
    ~attribute_name:(attribute_name_ : string_) () =
  ({
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     attribute_name = attribute_name_;
     values_to_add = values_to_add_;
     values_to_remove = values_to_remove_;
   }
    : modify_db_cluster_snapshot_attribute_message)

let make_modify_db_cluster_parameter_group_message
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_)
    ~parameters:(parameters_ : parameters_list) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_; parameters = parameters_ }
    : modify_db_cluster_parameter_group_message)

let make_modify_db_cluster_endpoint_output
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_resource_identifier:
      (db_cluster_endpoint_resource_identifier_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?status:(status_ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option)
    ?custom_endpoint_type:(custom_endpoint_type_ : string_ option)
    ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?db_cluster_endpoint_arn:(db_cluster_endpoint_arn_ : string_ option) () =
  ({
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_resource_identifier = db_cluster_endpoint_resource_identifier_;
     endpoint = endpoint_;
     status = status_;
     endpoint_type = endpoint_type_;
     custom_endpoint_type = custom_endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
     db_cluster_endpoint_arn = db_cluster_endpoint_arn_;
   }
    : modify_db_cluster_endpoint_output)

let make_modify_db_cluster_endpoint_message ?endpoint_type:(endpoint_type_ : string_ option)
    ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_) () =
  ({
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     endpoint_type = endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
   }
    : modify_db_cluster_endpoint_message)

let make_modify_db_cluster_message
    ?new_db_cluster_identifier:(new_db_cluster_identifier_ : string_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?port:(port_ : integer_optional option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?db_instance_parameter_group_name:(db_instance_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     new_db_cluster_identifier = new_db_cluster_identifier_;
     apply_immediately = apply_immediately_;
     backup_retention_period = backup_retention_period_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     port = port_;
     master_user_password = master_user_password_;
     option_group_name = option_group_name_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     engine_version = engine_version_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     db_instance_parameter_group_name = db_instance_parameter_group_name_;
     deletion_protection = deletion_protection_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     storage_type = storage_type_;
     network_type = network_type_;
   }
    : modify_db_cluster_message)

let make_tag_list_message ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_list_message)

let make_filter ~name:(name_ : string_) ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : filter)

let make_list_tags_for_resource_message ?filters:(filters_ : filter_list option)
    ~resource_name:(resource_name_ : string_) () =
  ({ resource_name = resource_name_; filters = filters_ } : list_tags_for_resource_message)

let make_failover_global_cluster_message
    ?allow_data_loss:(allow_data_loss_ : boolean_optional option)
    ?switchover:(switchover_ : boolean_optional option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : string_) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     target_db_cluster_identifier = target_db_cluster_identifier_;
     allow_data_loss = allow_data_loss_;
     switchover = switchover_;
   }
    : failover_global_cluster_message)

let make_failover_db_cluster_message
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?target_db_instance_identifier:(target_db_instance_identifier_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     target_db_instance_identifier = target_db_instance_identifier_;
   }
    : failover_db_cluster_message)

let make_double_range ?from_:(from__ : double option) ?to_:(to__ : double option) () =
  ({ from_ = from__; to_ = to__ } : double_range)

let make_range ?from_:(from__ : integer option) ?to_:(to__ : integer option)
    ?step:(step_ : integer_optional option) () =
  ({ from_ = from__; to_ = to__; step = step_ } : range)

let make_valid_storage_options ?storage_type:(storage_type_ : string_ option)
    ?storage_size:(storage_size_ : range_list option)
    ?provisioned_iops:(provisioned_iops_ : range_list option)
    ?iops_to_storage_ratio:(iops_to_storage_ratio_ : double_range_list option) () =
  ({
     storage_type = storage_type_;
     storage_size = storage_size_;
     provisioned_iops = provisioned_iops_;
     iops_to_storage_ratio = iops_to_storage_ratio_;
   }
    : valid_storage_options)

let make_valid_db_instance_modifications_message
    ?storage:(storage_ : valid_storage_options_list option) () =
  ({ storage = storage_ } : valid_db_instance_modifications_message)

let make_describe_valid_db_instance_modifications_message
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ }
    : describe_valid_db_instance_modifications_message)

let make_pending_maintenance_action ?action:(action_ : string_ option)
    ?auto_applied_after_date:(auto_applied_after_date_ : t_stamp option)
    ?forced_apply_date:(forced_apply_date_ : t_stamp option)
    ?opt_in_status:(opt_in_status_ : string_ option)
    ?current_apply_date:(current_apply_date_ : t_stamp option)
    ?description:(description_ : string_ option) () =
  ({
     action = action_;
     auto_applied_after_date = auto_applied_after_date_;
     forced_apply_date = forced_apply_date_;
     opt_in_status = opt_in_status_;
     current_apply_date = current_apply_date_;
     description = description_;
   }
    : pending_maintenance_action)

let make_resource_pending_maintenance_actions
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?pending_maintenance_action_details:
      (pending_maintenance_action_details_ : pending_maintenance_action_details option) () =
  ({
     resource_identifier = resource_identifier_;
     pending_maintenance_action_details = pending_maintenance_action_details_;
   }
    : resource_pending_maintenance_actions)

let make_pending_maintenance_actions_message
    ?pending_maintenance_actions:(pending_maintenance_actions_ : pending_maintenance_actions option)
    ?marker:(marker_ : string_ option) () =
  ({ pending_maintenance_actions = pending_maintenance_actions_; marker = marker_ }
    : pending_maintenance_actions_message)

let make_describe_pending_maintenance_actions_message
    ?resource_identifier:(resource_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({
     resource_identifier = resource_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_pending_maintenance_actions_message)

let make_orderable_db_instance_option ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?multi_az_capable:(multi_az_capable_ : boolean_ option)
    ?read_replica_capable:(read_replica_capable_ : boolean_ option) ?vpc:(vpc_ : boolean_ option)
    ?supports_storage_encryption:(supports_storage_encryption_ : boolean_ option)
    ?storage_type:(storage_type_ : string_ option) ?supports_iops:(supports_iops_ : boolean_ option)
    ?supports_enhanced_monitoring:(supports_enhanced_monitoring_ : boolean_ option)
    ?supports_iam_database_authentication:(supports_iam_database_authentication_ : boolean_ option)
    ?supports_performance_insights:(supports_performance_insights_ : boolean_ option)
    ?min_storage_size:(min_storage_size_ : integer_optional option)
    ?max_storage_size:(max_storage_size_ : integer_optional option)
    ?min_iops_per_db_instance:(min_iops_per_db_instance_ : integer_optional option)
    ?max_iops_per_db_instance:(max_iops_per_db_instance_ : integer_optional option)
    ?min_iops_per_gib:(min_iops_per_gib_ : double_optional option)
    ?max_iops_per_gib:(max_iops_per_gib_ : double_optional option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option)
    ?supported_network_types:(supported_network_types_ : string_list option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_instance_class = db_instance_class_;
     license_model = license_model_;
     availability_zones = availability_zones_;
     multi_az_capable = multi_az_capable_;
     read_replica_capable = read_replica_capable_;
     vpc = vpc_;
     supports_storage_encryption = supports_storage_encryption_;
     storage_type = storage_type_;
     supports_iops = supports_iops_;
     supports_enhanced_monitoring = supports_enhanced_monitoring_;
     supports_iam_database_authentication = supports_iam_database_authentication_;
     supports_performance_insights = supports_performance_insights_;
     min_storage_size = min_storage_size_;
     max_storage_size = max_storage_size_;
     min_iops_per_db_instance = min_iops_per_db_instance_;
     max_iops_per_db_instance = max_iops_per_db_instance_;
     min_iops_per_gib = min_iops_per_gib_;
     max_iops_per_gib = max_iops_per_gib_;
     supports_global_databases = supports_global_databases_;
     supported_network_types = supported_network_types_;
   }
    : orderable_db_instance_option)

let make_orderable_db_instance_options_message
    ?orderable_db_instance_options:
      (orderable_db_instance_options_ : orderable_db_instance_options_list option)
    ?marker:(marker_ : string_ option) () =
  ({ orderable_db_instance_options = orderable_db_instance_options_; marker = marker_ }
    : orderable_db_instance_options_message)

let make_describe_orderable_db_instance_options_message
    ?engine_version:(engine_version_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?license_model:(license_model_ : string_ option) ?vpc:(vpc_ : boolean_optional option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~engine:(engine_ : string_) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_instance_class = db_instance_class_;
     license_model = license_model_;
     vpc = vpc_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_orderable_db_instance_options_message)

let make_global_clusters_message ?marker:(marker_ : string_ option)
    ?global_clusters:(global_clusters_ : global_cluster_list option) () =
  ({ marker = marker_; global_clusters = global_clusters_ } : global_clusters_message)

let make_describe_global_clusters_message
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_global_clusters_message)

let make_event_subscriptions_message ?marker:(marker_ : string_ option)
    ?event_subscriptions_list:(event_subscriptions_list_ : event_subscriptions_list option) () =
  ({ marker = marker_; event_subscriptions_list = event_subscriptions_list_ }
    : event_subscriptions_message)

let make_describe_event_subscriptions_message
    ?subscription_name:(subscription_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     subscription_name = subscription_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_event_subscriptions_message)

let make_event ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?message:(message_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?date:(date_ : t_stamp option) ?source_arn:(source_arn_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     message = message_;
     event_categories = event_categories_;
     date = date_;
     source_arn = source_arn_;
   }
    : event)

let make_events_message ?marker:(marker_ : string_ option) ?events:(events_ : event_list option) ()
    =
  ({ marker = marker_; events = events_ } : events_message)

let make_describe_events_message ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?duration:(duration_ : integer_optional option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     start_time = start_time_;
     end_time = end_time_;
     duration = duration_;
     event_categories = event_categories_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_events_message)

let make_event_categories_map ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option) () =
  ({ source_type = source_type_; event_categories = event_categories_ } : event_categories_map)

let make_event_categories_message
    ?event_categories_map_list:(event_categories_map_list_ : event_categories_map_list option) () =
  ({ event_categories_map_list = event_categories_map_list_ } : event_categories_message)

let make_describe_event_categories_message ?source_type:(source_type_ : string_ option)
    ?filters:(filters_ : filter_list option) () =
  ({ source_type = source_type_; filters = filters_ } : describe_event_categories_message)

let make_engine_defaults ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?marker:(marker_ : string_ option) ?parameters:(parameters_ : parameters_list option) () =
  ({
     db_parameter_group_family = db_parameter_group_family_;
     marker = marker_;
     parameters = parameters_;
   }
    : engine_defaults)

let make_describe_engine_default_parameters_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_) () =
  ({
     db_parameter_group_family = db_parameter_group_family_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_engine_default_parameters_message)

let make_describe_engine_default_cluster_parameters_message ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_) () =
  ({
     db_parameter_group_family = db_parameter_group_family_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_engine_default_cluster_parameters_message)

let make_db_subnet_group_message ?marker:(marker_ : string_ option)
    ?db_subnet_groups:(db_subnet_groups_ : db_subnet_groups option) () =
  ({ marker = marker_; db_subnet_groups = db_subnet_groups_ } : db_subnet_group_message)

let make_describe_db_subnet_groups_message
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_subnet_group_name = db_subnet_group_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_subnet_groups_message)

let make_db_parameter_group_details ?parameters:(parameters_ : parameters_list option)
    ?marker:(marker_ : string_ option) () =
  ({ parameters = parameters_; marker = marker_ } : db_parameter_group_details)

let make_describe_db_parameters_message ?source:(source_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~db_parameter_group_name:(db_parameter_group_name_ : string_)
    () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     source = source_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_parameters_message)

let make_db_parameter_group ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?description:(description_ : string_ option)
    ?db_parameter_group_arn:(db_parameter_group_arn_ : string_ option) () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     db_parameter_group_family = db_parameter_group_family_;
     description = description_;
     db_parameter_group_arn = db_parameter_group_arn_;
   }
    : db_parameter_group)

let make_db_parameter_groups_message ?marker:(marker_ : string_ option)
    ?db_parameter_groups:(db_parameter_groups_ : db_parameter_group_list option) () =
  ({ marker = marker_; db_parameter_groups = db_parameter_groups_ } : db_parameter_groups_message)

let make_describe_db_parameter_groups_message
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_parameter_groups_message)

let make_db_instance_message ?marker:(marker_ : string_ option)
    ?db_instances:(db_instances_ : db_instance_list option) () =
  ({ marker = marker_; db_instances = db_instances_ } : db_instance_message)

let make_describe_db_instances_message
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_instances_message)

let make_timezone ?timezone_name:(timezone_name_ : string_ option) () =
  ({ timezone_name = timezone_name_ } : timezone)

let make_upgrade_target ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?description:(description_ : string_ option)
    ?auto_upgrade:(auto_upgrade_ : boolean_ option)
    ?is_major_version_upgrade:(is_major_version_upgrade_ : boolean_ option)
    ?supports_global_databases:(supports_global_databases_ : boolean_optional option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     description = description_;
     auto_upgrade = auto_upgrade_;
     is_major_version_upgrade = is_major_version_upgrade_;
     supports_global_databases = supports_global_databases_;
   }
    : upgrade_target)

let make_character_set ?character_set_name:(character_set_name_ : string_ option)
    ?character_set_description:(character_set_description_ : string_ option) () =
  ({
     character_set_name = character_set_name_;
     character_set_description = character_set_description_;
   }
    : character_set)

let make_db_engine_version ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?db_engine_description:(db_engine_description_ : string_ option)
    ?db_engine_version_description:(db_engine_version_description_ : string_ option)
    ?default_character_set:(default_character_set_ : character_set option)
    ?supported_character_sets:(supported_character_sets_ : supported_character_sets_list option)
    ?valid_upgrade_target:(valid_upgrade_target_ : valid_upgrade_target_list option)
    ?supported_timezones:(supported_timezones_ : supported_timezones_list option)
    ?exportable_log_types:(exportable_log_types_ : log_type_list option)
    ?supports_log_exports_to_cloudwatch_logs:
      (supports_log_exports_to_cloudwatch_logs_ : boolean_ option)
    ?supports_read_replica:(supports_read_replica_ : boolean_ option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_parameter_group_family = db_parameter_group_family_;
     db_engine_description = db_engine_description_;
     db_engine_version_description = db_engine_version_description_;
     default_character_set = default_character_set_;
     supported_character_sets = supported_character_sets_;
     valid_upgrade_target = valid_upgrade_target_;
     supported_timezones = supported_timezones_;
     exportable_log_types = exportable_log_types_;
     supports_log_exports_to_cloudwatch_logs = supports_log_exports_to_cloudwatch_logs_;
     supports_read_replica = supports_read_replica_;
     supports_global_databases = supports_global_databases_;
   }
    : db_engine_version)

let make_db_engine_version_message ?marker:(marker_ : string_ option)
    ?db_engine_versions:(db_engine_versions_ : db_engine_version_list option) () =
  ({ marker = marker_; db_engine_versions = db_engine_versions_ } : db_engine_version_message)

let make_describe_db_engine_versions_message ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ?default_only:(default_only_ : boolean_ option)
    ?list_supported_character_sets:(list_supported_character_sets_ : boolean_optional option)
    ?list_supported_timezones:(list_supported_timezones_ : boolean_optional option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_parameter_group_family = db_parameter_group_family_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     default_only = default_only_;
     list_supported_character_sets = list_supported_character_sets_;
     list_supported_timezones = list_supported_timezones_;
   }
    : describe_db_engine_versions_message)

let make_db_cluster_snapshot ?availability_zones:(availability_zones_ : availability_zones option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?engine:(engine_ : string_ option) ?allocated_storage:(allocated_storage_ : integer option)
    ?status:(status_ : string_ option) ?port:(port_ : integer option)
    ?vpc_id:(vpc_id_ : string_ option) ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?master_username:(master_username_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?db_cluster_snapshot_arn:(db_cluster_snapshot_arn_ : string_ option)
    ?source_db_cluster_snapshot_arn:(source_db_cluster_snapshot_arn_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?storage_type:(storage_type_ : string_ option) () =
  ({
     availability_zones = availability_zones_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     snapshot_create_time = snapshot_create_time_;
     engine = engine_;
     allocated_storage = allocated_storage_;
     status = status_;
     port = port_;
     vpc_id = vpc_id_;
     cluster_create_time = cluster_create_time_;
     master_username = master_username_;
     engine_version = engine_version_;
     license_model = license_model_;
     snapshot_type = snapshot_type_;
     percent_progress = percent_progress_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     db_cluster_snapshot_arn = db_cluster_snapshot_arn_;
     source_db_cluster_snapshot_arn = source_db_cluster_snapshot_arn_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     storage_type = storage_type_;
   }
    : db_cluster_snapshot)

let make_db_cluster_snapshot_message ?marker:(marker_ : string_ option)
    ?db_cluster_snapshots:(db_cluster_snapshots_ : db_cluster_snapshot_list option) () =
  ({ marker = marker_; db_cluster_snapshots = db_cluster_snapshots_ } : db_cluster_snapshot_message)

let make_describe_db_cluster_snapshots_message
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?include_shared:(include_shared_ : boolean_ option)
    ?include_public:(include_public_ : boolean_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     snapshot_type = snapshot_type_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     include_shared = include_shared_;
     include_public = include_public_;
   }
    : describe_db_cluster_snapshots_message)

let make_describe_db_cluster_snapshot_attributes_message
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({ db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_ }
    : describe_db_cluster_snapshot_attributes_message)

let make_db_cluster_message ?marker:(marker_ : string_ option)
    ?db_clusters:(db_clusters_ : db_cluster_list option) () =
  ({ marker = marker_; db_clusters = db_clusters_ } : db_cluster_message)

let make_describe_db_clusters_message
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_clusters_message)

let make_db_cluster_parameter_group_details ?parameters:(parameters_ : parameters_list option)
    ?marker:(marker_ : string_ option) () =
  ({ parameters = parameters_; marker = marker_ } : db_cluster_parameter_group_details)

let make_describe_db_cluster_parameters_message ?source:(source_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     source = source_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_cluster_parameters_message)

let make_db_cluster_parameter_group
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?description:(description_ : string_ option)
    ?db_cluster_parameter_group_arn:(db_cluster_parameter_group_arn_ : string_ option) () =
  ({
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     db_parameter_group_family = db_parameter_group_family_;
     description = description_;
     db_cluster_parameter_group_arn = db_cluster_parameter_group_arn_;
   }
    : db_cluster_parameter_group)

let make_db_cluster_parameter_groups_message ?marker:(marker_ : string_ option)
    ?db_cluster_parameter_groups:
      (db_cluster_parameter_groups_ : db_cluster_parameter_group_list option) () =
  ({ marker = marker_; db_cluster_parameter_groups = db_cluster_parameter_groups_ }
    : db_cluster_parameter_groups_message)

let make_describe_db_cluster_parameter_groups_message
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_cluster_parameter_groups_message)

let make_db_cluster_endpoint
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_resource_identifier:
      (db_cluster_endpoint_resource_identifier_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?status:(status_ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option)
    ?custom_endpoint_type:(custom_endpoint_type_ : string_ option)
    ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?db_cluster_endpoint_arn:(db_cluster_endpoint_arn_ : string_ option) () =
  ({
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_resource_identifier = db_cluster_endpoint_resource_identifier_;
     endpoint = endpoint_;
     status = status_;
     endpoint_type = endpoint_type_;
     custom_endpoint_type = custom_endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
     db_cluster_endpoint_arn = db_cluster_endpoint_arn_;
   }
    : db_cluster_endpoint)

let make_db_cluster_endpoint_message ?marker:(marker_ : string_ option)
    ?db_cluster_endpoints:(db_cluster_endpoints_ : db_cluster_endpoint_list option) () =
  ({ marker = marker_; db_cluster_endpoints = db_cluster_endpoints_ } : db_cluster_endpoint_message)

let make_describe_db_cluster_endpoints_message
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_cluster_endpoints_message)

let make_delete_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({ global_cluster_identifier = global_cluster_identifier_ } : delete_global_cluster_message)

let make_delete_event_subscription_message ~subscription_name:(subscription_name_ : string_) () =
  ({ subscription_name = subscription_name_ } : delete_event_subscription_message)

let make_delete_db_subnet_group_message ~db_subnet_group_name:(db_subnet_group_name_ : string_) () =
  ({ db_subnet_group_name = db_subnet_group_name_ } : delete_db_subnet_group_message)

let make_delete_db_parameter_group_message
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : delete_db_parameter_group_message)

let make_delete_db_instance_message ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
   }
    : delete_db_instance_message)

let make_delete_db_cluster_snapshot_message
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({ db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_ }
    : delete_db_cluster_snapshot_message)

let make_delete_db_cluster_parameter_group_message
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : delete_db_cluster_parameter_group_message)

let make_delete_db_cluster_endpoint_output
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_resource_identifier:
      (db_cluster_endpoint_resource_identifier_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?status:(status_ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option)
    ?custom_endpoint_type:(custom_endpoint_type_ : string_ option)
    ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?db_cluster_endpoint_arn:(db_cluster_endpoint_arn_ : string_ option) () =
  ({
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_resource_identifier = db_cluster_endpoint_resource_identifier_;
     endpoint = endpoint_;
     status = status_;
     endpoint_type = endpoint_type_;
     custom_endpoint_type = custom_endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
     db_cluster_endpoint_arn = db_cluster_endpoint_arn_;
   }
    : delete_db_cluster_endpoint_output)

let make_delete_db_cluster_endpoint_message
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_) () =
  ({ db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_ }
    : delete_db_cluster_endpoint_message)

let make_delete_db_cluster_message ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
   }
    : delete_db_cluster_message)

let make_create_global_cluster_message
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option) ?tags:(tags_ : tag_list option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     engine = engine_;
     engine_version = engine_version_;
     deletion_protection = deletion_protection_;
     database_name = database_name_;
     tags = tags_;
     storage_encrypted = storage_encrypted_;
   }
    : create_global_cluster_message)

let make_create_event_subscription_message ?source_type:(source_type_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?source_ids:(source_ids_ : source_ids_list option) ?enabled:(enabled_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ~subscription_name:(subscription_name_ : string_)
    ~sns_topic_arn:(sns_topic_arn_ : string_) () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     event_categories = event_categories_;
     source_ids = source_ids_;
     enabled = enabled_;
     tags = tags_;
   }
    : create_event_subscription_message)

let make_create_db_subnet_group_message ?tags:(tags_ : tag_list option)
    ~db_subnet_group_name:(db_subnet_group_name_ : string_)
    ~db_subnet_group_description:(db_subnet_group_description_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     db_subnet_group_name = db_subnet_group_name_;
     db_subnet_group_description = db_subnet_group_description_;
     subnet_ids = subnet_ids_;
     tags = tags_;
   }
    : create_db_subnet_group_message)

let make_create_db_parameter_group_message ?tags:(tags_ : tag_list option)
    ~db_parameter_group_name:(db_parameter_group_name_ : string_)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_)
    ~description:(description_ : string_) () =
  ({
     db_parameter_group_name = db_parameter_group_name_;
     db_parameter_group_family = db_parameter_group_family_;
     description = description_;
     tags = tags_;
   }
    : create_db_parameter_group_message)

let make_create_db_instance_message ?db_name:(db_name_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?master_username:(master_username_ : string_ option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?db_security_groups:(db_security_groups_ : db_security_group_name_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?port:(port_ : integer_optional option) ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?timezone:(timezone_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~db_instance_class:(db_instance_class_ : string_) ~engine:(engine_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_name = db_name_;
     db_instance_identifier = db_instance_identifier_;
     allocated_storage = allocated_storage_;
     db_instance_class = db_instance_class_;
     engine = engine_;
     master_username = master_username_;
     master_user_password = master_user_password_;
     db_security_groups = db_security_groups_;
     vpc_security_group_ids = vpc_security_group_ids_;
     availability_zone = availability_zone_;
     db_subnet_group_name = db_subnet_group_name_;
     preferred_maintenance_window = preferred_maintenance_window_;
     db_parameter_group_name = db_parameter_group_name_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     port = port_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     license_model = license_model_;
     iops = iops_;
     option_group_name = option_group_name_;
     character_set_name = character_set_name_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     db_cluster_identifier = db_cluster_identifier_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     domain_iam_role_name = domain_iam_role_name_;
     promotion_tier = promotion_tier_;
     timezone = timezone_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     deletion_protection = deletion_protection_;
   }
    : create_db_instance_message)

let make_create_db_cluster_snapshot_message ?tags:(tags_ : tag_list option)
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     tags = tags_;
   }
    : create_db_cluster_snapshot_message)

let make_create_db_cluster_parameter_group_message ?tags:(tags_ : tag_list option)
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_)
    ~description:(description_ : string_) () =
  ({
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     db_parameter_group_family = db_parameter_group_family_;
     description = description_;
     tags = tags_;
   }
    : create_db_cluster_parameter_group_message)

let make_create_db_cluster_endpoint_output
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_resource_identifier:
      (db_cluster_endpoint_resource_identifier_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?status:(status_ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option)
    ?custom_endpoint_type:(custom_endpoint_type_ : string_ option)
    ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?db_cluster_endpoint_arn:(db_cluster_endpoint_arn_ : string_ option) () =
  ({
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_resource_identifier = db_cluster_endpoint_resource_identifier_;
     endpoint = endpoint_;
     status = status_;
     endpoint_type = endpoint_type_;
     custom_endpoint_type = custom_endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
     db_cluster_endpoint_arn = db_cluster_endpoint_arn_;
   }
    : create_db_cluster_endpoint_output)

let make_create_db_cluster_endpoint_message ?static_members:(static_members_ : string_list option)
    ?excluded_members:(excluded_members_ : string_list option) ?tags:(tags_ : tag_list option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_)
    ~endpoint_type:(endpoint_type_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     endpoint_type = endpoint_type_;
     static_members = static_members_;
     excluded_members = excluded_members_;
     tags = tags_;
   }
    : create_db_cluster_endpoint_message)

let make_create_db_cluster_message
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?port:(port_ : integer_optional option)
    ?master_username:(master_username_ : string_ option)
    ?master_user_password:(master_user_password_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?pre_signed_url:(pre_signed_url_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~engine:(engine_ : string_) () =
  ({
     availability_zones = availability_zones_;
     backup_retention_period = backup_retention_period_;
     character_set_name = character_set_name_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     database_name = database_name_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_subnet_group_name = db_subnet_group_name_;
     engine = engine_;
     engine_version = engine_version_;
     port = port_;
     master_username = master_username_;
     master_user_password = master_user_password_;
     option_group_name = option_group_name_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     replication_source_identifier = replication_source_identifier_;
     tags = tags_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     pre_signed_url = pre_signed_url_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     deletion_protection = deletion_protection_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     global_cluster_identifier = global_cluster_identifier_;
     storage_type = storage_type_;
     network_type = network_type_;
   }
    : create_db_cluster_message)

let make_copy_db_parameter_group_message ?tags:(tags_ : tag_list option)
    ~source_db_parameter_group_identifier:(source_db_parameter_group_identifier_ : string_)
    ~target_db_parameter_group_identifier:(target_db_parameter_group_identifier_ : string_)
    ~target_db_parameter_group_description:(target_db_parameter_group_description_ : string_) () =
  ({
     source_db_parameter_group_identifier = source_db_parameter_group_identifier_;
     target_db_parameter_group_identifier = target_db_parameter_group_identifier_;
     target_db_parameter_group_description = target_db_parameter_group_description_;
     tags = tags_;
   }
    : copy_db_parameter_group_message)

let make_copy_db_cluster_snapshot_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?pre_signed_url:(pre_signed_url_ : string_ option)
    ?copy_tags:(copy_tags_ : boolean_optional option) ?tags:(tags_ : tag_list option)
    ~source_db_cluster_snapshot_identifier:(source_db_cluster_snapshot_identifier_ : string_)
    ~target_db_cluster_snapshot_identifier:(target_db_cluster_snapshot_identifier_ : string_) () =
  ({
     source_db_cluster_snapshot_identifier = source_db_cluster_snapshot_identifier_;
     target_db_cluster_snapshot_identifier = target_db_cluster_snapshot_identifier_;
     kms_key_id = kms_key_id_;
     pre_signed_url = pre_signed_url_;
     copy_tags = copy_tags_;
     tags = tags_;
   }
    : copy_db_cluster_snapshot_message)

let make_copy_db_cluster_parameter_group_message ?tags:(tags_ : tag_list option)
    ~source_db_cluster_parameter_group_identifier:
      (source_db_cluster_parameter_group_identifier_ : string_)
    ~target_db_cluster_parameter_group_identifier:
      (target_db_cluster_parameter_group_identifier_ : string_)
    ~target_db_cluster_parameter_group_description:
      (target_db_cluster_parameter_group_description_ : string_) () =
  ({
     source_db_cluster_parameter_group_identifier = source_db_cluster_parameter_group_identifier_;
     target_db_cluster_parameter_group_identifier = target_db_cluster_parameter_group_identifier_;
     target_db_cluster_parameter_group_description = target_db_cluster_parameter_group_description_;
     tags = tags_;
   }
    : copy_db_cluster_parameter_group_message)

let make_apply_pending_maintenance_action_message
    ~resource_identifier:(resource_identifier_ : string_) ~apply_action:(apply_action_ : string_)
    ~opt_in_type:(opt_in_type_ : string_) () =
  ({
     resource_identifier = resource_identifier_;
     apply_action = apply_action_;
     opt_in_type = opt_in_type_;
   }
    : apply_pending_maintenance_action_message)
