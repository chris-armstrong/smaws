open Types

let make_account_quota ?account_quota_name:(account_quota_name_ : string_ option)
    ?used:(used_ : long option) ?max:(max_ : long option) () =
  ({ account_quota_name = account_quota_name_; used = used_; max = max_ } : account_quota)

let make_account_attributes_message ?account_quotas:(account_quotas_ : account_quota_list option) ()
    =
  ({ account_quotas = account_quotas_ } : account_attributes_message)

let make_add_role_to_db_cluster_message ?feature_name:(feature_name_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~role_arn:(role_arn_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     role_arn = role_arn_;
     feature_name = feature_name_;
   }
    : add_role_to_db_cluster_message)

let make_add_role_to_db_instance_message ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~role_arn:(role_arn_ : string_) ~feature_name:(feature_name_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     role_arn = role_arn_;
     feature_name = feature_name_;
   }
    : add_role_to_db_instance_message)

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

let make_additional_storage_volume ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) ~volume_name:(volume_name_ : string_) () =
  ({
     volume_name = volume_name_;
     allocated_storage = allocated_storage_;
     iop_s = iop_s_;
     max_allocated_storage = max_allocated_storage_;
     storage_throughput = storage_throughput_;
     storage_type = storage_type_;
   }
    : additional_storage_volume)

let make_additional_storage_volume_output ?volume_name:(volume_name_ : string_ option)
    ?storage_volume_status:(storage_volume_status_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) () =
  ({
     volume_name = volume_name_;
     storage_volume_status = storage_volume_status_;
     allocated_storage = allocated_storage_;
     iop_s = iop_s_;
     max_allocated_storage = max_allocated_storage_;
     storage_throughput = storage_throughput_;
     storage_type = storage_type_;
   }
    : additional_storage_volume_output)

let make_master_user_secret ?secret_arn:(secret_arn_ : string_ option)
    ?secret_status:(secret_status_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({ secret_arn = secret_arn_; secret_status = secret_status_; kms_key_id = kms_key_id_ }
    : master_user_secret)

let make_certificate_details ?ca_identifier:(ca_identifier_ : string_ option)
    ?valid_till:(valid_till_ : t_stamp option) () =
  ({ ca_identifier = ca_identifier_; valid_till = valid_till_ } : certificate_details)

let make_db_instance_automated_backups_replication
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option) () =
  ({ db_instance_automated_backups_arn = db_instance_automated_backups_arn_ }
    : db_instance_automated_backups_replication)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option) () =
  ({ address = address_; port = port_; hosted_zone_id = hosted_zone_id_ } : endpoint)

let make_db_instance_role ?role_arn:(role_arn_ : string_ option)
    ?feature_name:(feature_name_ : string_ option) ?status:(status_ : string_ option) () =
  ({ role_arn = role_arn_; feature_name = feature_name_; status = status_ } : db_instance_role)

let make_processor_feature ?name:(name_ : string_ option) ?value:(value_ : string_ option) () =
  ({ name = name_; value = value_ } : processor_feature)

let make_domain_membership ?domain:(domain_ : string_ option) ?status:(status_ : string_ option)
    ?fqd_n:(fqd_n_ : string_ option) ?iam_role_name:(iam_role_name_ : string_ option)
    ?o_u:(o_u_ : string_ option) ?auth_secret_arn:(auth_secret_arn_ : string_ option)
    ?dns_ips:(dns_ips_ : string_list option) () =
  ({
     domain = domain_;
     status = status_;
     fqd_n = fqd_n_;
     iam_role_name = iam_role_name_;
     o_u = o_u_;
     auth_secret_arn = auth_secret_arn_;
     dns_ips = dns_ips_;
   }
    : domain_membership)

let make_db_instance_status_info ?status_type:(status_type_ : string_ option)
    ?normal:(normal_ : boolean_ option) ?status:(status_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ status_type = status_type_; normal = normal_; status = status_; message = message_ }
    : db_instance_status_info)

let make_option_group_membership ?option_group_name:(option_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ option_group_name = option_group_name_; status = status_ } : option_group_membership)

let make_pending_cloudwatch_logs_exports
    ?log_types_to_enable:(log_types_to_enable_ : log_type_list option)
    ?log_types_to_disable:(log_types_to_disable_ : log_type_list option) () =
  ({ log_types_to_enable = log_types_to_enable_; log_types_to_disable = log_types_to_disable_ }
    : pending_cloudwatch_logs_exports)

let make_pending_modified_values ?db_instance_class:(db_instance_class_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?port:(port_ : integer_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?resume_full_automation_mode_time:(resume_full_automation_mode_time_ : t_stamp option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?engine:(engine_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option) () =
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
     storage_throughput = storage_throughput_;
     db_instance_identifier = db_instance_identifier_;
     storage_type = storage_type_;
     ca_certificate_identifier = ca_certificate_identifier_;
     db_subnet_group_name = db_subnet_group_name_;
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     automation_mode = automation_mode_;
     resume_full_automation_mode_time = resume_full_automation_mode_time_;
     multi_tenant = multi_tenant_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     dedicated_log_volume = dedicated_log_volume_;
     engine = engine_;
     additional_storage_volumes = additional_storage_volumes_;
   }
    : pending_modified_values)

let make_outpost ?arn:(arn_ : string_ option) () = ({ arn = arn_ } : outpost)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_outpost:(subnet_outpost_ : outpost option)
    ?subnet_status:(subnet_status_ : string_ option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_outpost = subnet_outpost_;
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

let make_vpc_security_group_membership
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ vpc_security_group_id = vpc_security_group_id_; status = status_ }
    : vpc_security_group_membership)

let make_db_security_group_membership
    ?db_security_group_name:(db_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ db_security_group_name = db_security_group_name_; status = status_ }
    : db_security_group_membership)

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
    ?upgrade_rollout_order:(upgrade_rollout_order_ : upgrade_rollout_order option)
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
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_memberships:(option_group_memberships_ : option_group_membership_list option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?status_infos:(status_infos_ : db_instance_status_info_list option)
    ?storage_type:(storage_type_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
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
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?deletion_protection:(deletion_protection_ : boolean_ option)
    ?associated_roles:(associated_roles_ : db_instance_roles option)
    ?listener_endpoint:(listener_endpoint_ : endpoint option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?tag_list:(tag_list_ : tag_list option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?resume_full_automation_mode_time:(resume_full_automation_mode_time_ : t_stamp option)
    ?customer_owned_ip_enabled:(customer_owned_ip_enabled_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?activity_stream_status:(activity_stream_status_ : activity_stream_status option)
    ?activity_stream_kms_key_id:(activity_stream_kms_key_id_ : string_ option)
    ?activity_stream_kinesis_stream_name:(activity_stream_kinesis_stream_name_ : string_ option)
    ?activity_stream_mode:(activity_stream_mode_ : activity_stream_mode option)
    ?activity_stream_engine_native_audit_fields_included:
      (activity_stream_engine_native_audit_fields_included_ : boolean_optional option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?db_instance_automated_backups_replications:
      (db_instance_automated_backups_replications_ :
         db_instance_automated_backups_replication_list option)
    ?backup_target:(backup_target_ : string_ option)
    ?automatic_restart_time:(automatic_restart_time_ : t_stamp option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?activity_stream_policy_status:
      (activity_stream_policy_status_ : activity_stream_policy_status option)
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?read_replica_source_db_cluster_identifier:
      (read_replica_source_db_cluster_identifier_ : string_ option)
    ?percent_progress:(percent_progress_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_ option)
    ?is_storage_config_upgrade_available:
      (is_storage_config_upgrade_available_ : boolean_optional option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_output_list option)
    ?storage_volume_status:(storage_volume_status_ : string_ option) () =
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
     upgrade_rollout_order = upgrade_rollout_order_;
     pending_modified_values = pending_modified_values_;
     latest_restorable_time = latest_restorable_time_;
     multi_a_z = multi_a_z_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     read_replica_source_db_instance_identifier = read_replica_source_db_instance_identifier_;
     read_replica_db_instance_identifiers = read_replica_db_instance_identifiers_;
     read_replica_db_cluster_identifiers = read_replica_db_cluster_identifiers_;
     replica_mode = replica_mode_;
     license_model = license_model_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_memberships = option_group_memberships_;
     character_set_name = character_set_name_;
     nchar_character_set_name = nchar_character_set_name_;
     secondary_availability_zone = secondary_availability_zone_;
     publicly_accessible = publicly_accessible_;
     status_infos = status_infos_;
     storage_type = storage_type_;
     storage_encryption_type = storage_encryption_type_;
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
     database_insights_mode = database_insights_mode_;
     performance_insights_enabled = performance_insights_enabled_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     deletion_protection = deletion_protection_;
     associated_roles = associated_roles_;
     listener_endpoint = listener_endpoint_;
     max_allocated_storage = max_allocated_storage_;
     tag_list = tag_list_;
     automation_mode = automation_mode_;
     resume_full_automation_mode_time = resume_full_automation_mode_time_;
     customer_owned_ip_enabled = customer_owned_ip_enabled_;
     network_type = network_type_;
     activity_stream_status = activity_stream_status_;
     activity_stream_kms_key_id = activity_stream_kms_key_id_;
     activity_stream_kinesis_stream_name = activity_stream_kinesis_stream_name_;
     activity_stream_mode = activity_stream_mode_;
     activity_stream_engine_native_audit_fields_included =
       activity_stream_engine_native_audit_fields_included_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     db_instance_automated_backups_replications = db_instance_automated_backups_replications_;
     backup_target = backup_target_;
     automatic_restart_time = automatic_restart_time_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     activity_stream_policy_status = activity_stream_policy_status_;
     certificate_details = certificate_details_;
     db_system_id = db_system_id_;
     master_user_secret = master_user_secret_;
     read_replica_source_db_cluster_identifier = read_replica_source_db_cluster_identifier_;
     percent_progress = percent_progress_;
     multi_tenant = multi_tenant_;
     dedicated_log_volume = dedicated_log_volume_;
     is_storage_config_upgrade_available = is_storage_config_upgrade_available_;
     engine_lifecycle_support = engine_lifecycle_support_;
     additional_storage_volumes = additional_storage_volumes_;
     storage_volume_status = storage_volume_status_;
   }
    : db_instance)

let make_switchover_read_replica_message ~db_instance_identifier:(db_instance_identifier_ : string_)
    () =
  ({ db_instance_identifier = db_instance_identifier_ } : switchover_read_replica_message)

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
    ?readers:(readers_ : readers_arn_list option) ?is_writer:(is_writer_ : boolean_ option)
    ?global_write_forwarding_status:
      (global_write_forwarding_status_ : write_forwarding_status option)
    ?synchronization_status:
      (synchronization_status_ : global_cluster_member_synchronization_status option) () =
  ({
     db_cluster_arn = db_cluster_arn_;
     readers = readers_;
     is_writer = is_writer_;
     global_write_forwarding_status = global_write_forwarding_status_;
     synchronization_status = synchronization_status_;
   }
    : global_cluster_member)

let make_global_cluster
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?global_cluster_resource_id:(global_cluster_resource_id_ : string_ option)
    ?global_cluster_arn:(global_cluster_arn_ : string_ option) ?status:(status_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?global_cluster_members:(global_cluster_members_ : global_cluster_member_list option)
    ?endpoint:(endpoint_ : string_ option) ?failover_state:(failover_state_ : failover_state option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     global_cluster_resource_id = global_cluster_resource_id_;
     global_cluster_arn = global_cluster_arn_;
     status = status_;
     engine = engine_;
     engine_version = engine_version_;
     engine_lifecycle_support = engine_lifecycle_support_;
     database_name = database_name_;
     storage_encrypted = storage_encrypted_;
     storage_encryption_type = storage_encryption_type_;
     deletion_protection = deletion_protection_;
     global_cluster_members = global_cluster_members_;
     endpoint = endpoint_;
     failover_state = failover_state_;
     tag_list = tag_list_;
   }
    : global_cluster)

let make_switchover_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : db_cluster_identifier) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     target_db_cluster_identifier = target_db_cluster_identifier_;
   }
    : switchover_global_cluster_message)

let make_blue_green_deployment_task ?name:(name_ : blue_green_deployment_task_name option)
    ?status:(status_ : blue_green_deployment_task_status option) () =
  ({ name = name_; status = status_ } : blue_green_deployment_task)

let make_switchover_detail ?source_member:(source_member_ : database_arn option)
    ?target_member:(target_member_ : database_arn option)
    ?status:(status_ : switchover_detail_status option) () =
  ({ source_member = source_member_; target_member = target_member_; status = status_ }
    : switchover_detail)

let make_blue_green_deployment
    ?blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier option)
    ?blue_green_deployment_name:(blue_green_deployment_name_ : blue_green_deployment_name option)
    ?source:(source_ : database_arn option) ?target:(target_ : database_arn option)
    ?switchover_details:(switchover_details_ : switchover_detail_list option)
    ?tasks:(tasks_ : blue_green_deployment_task_list option)
    ?status:(status_ : blue_green_deployment_status option)
    ?status_details:(status_details_ : blue_green_deployment_status_details option)
    ?create_time:(create_time_ : t_stamp option) ?delete_time:(delete_time_ : t_stamp option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
     blue_green_deployment_name = blue_green_deployment_name_;
     source = source_;
     target = target_;
     switchover_details = switchover_details_;
     tasks = tasks_;
     status = status_;
     status_details = status_details_;
     create_time = create_time_;
     delete_time = delete_time_;
     tag_list = tag_list_;
   }
    : blue_green_deployment)

let make_switchover_blue_green_deployment_response
    ?blue_green_deployment:(blue_green_deployment_ : blue_green_deployment option) () =
  ({ blue_green_deployment = blue_green_deployment_ } : switchover_blue_green_deployment_response)

let make_switchover_blue_green_deployment_request
    ?switchover_timeout:(switchover_timeout_ : switchover_timeout option)
    ~blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier) () =
  ({
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
     switchover_timeout = switchover_timeout_;
   }
    : switchover_blue_green_deployment_request)

let make_restore_window ?earliest_time:(earliest_time_ : t_stamp option)
    ?latest_time:(latest_time_ : t_stamp option) () =
  ({ earliest_time = earliest_time_; latest_time = latest_time_ } : restore_window)

let make_db_instance_automated_backup ?db_instance_arn:(db_instance_arn_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) ?region:(region_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?restore_window:(restore_window_ : restore_window option)
    ?allocated_storage:(allocated_storage_ : integer option) ?status:(status_ : string_ option)
    ?port:(port_ : integer option) ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?master_username:(master_username_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?encrypted:(encrypted_ : boolean_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_type:(storage_type_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?timezone:(timezone_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option)
    ?db_instance_automated_backups_replications:
      (db_instance_automated_backups_replications_ :
         db_instance_automated_backups_replication_list option)
    ?backup_target:(backup_target_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?tag_list:(tag_list_ : tag_list option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option) () =
  ({
     db_instance_arn = db_instance_arn_;
     dbi_resource_id = dbi_resource_id_;
     region = region_;
     db_instance_identifier = db_instance_identifier_;
     restore_window = restore_window_;
     allocated_storage = allocated_storage_;
     status = status_;
     port = port_;
     availability_zone = availability_zone_;
     vpc_id = vpc_id_;
     instance_create_time = instance_create_time_;
     master_username = master_username_;
     engine = engine_;
     engine_version = engine_version_;
     license_model = license_model_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     tde_credential_arn = tde_credential_arn_;
     encrypted = encrypted_;
     storage_encryption_type = storage_encryption_type_;
     storage_type = storage_type_;
     kms_key_id = kms_key_id_;
     timezone = timezone_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
     db_instance_automated_backups_replications = db_instance_automated_backups_replications_;
     backup_target = backup_target_;
     multi_tenant = multi_tenant_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     tag_list = tag_list_;
     dedicated_log_volume = dedicated_log_volume_;
     additional_storage_volumes = additional_storage_volumes_;
   }
    : db_instance_automated_backup)

let make_stop_db_instance_automated_backups_replication_message
    ~source_db_instance_arn:(source_db_instance_arn_ : string_) () =
  ({ source_db_instance_arn = source_db_instance_arn_ }
    : stop_db_instance_automated_backups_replication_message)

let make_stop_db_instance_message ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : stop_db_instance_message)

let make_limitless_database ?status:(status_ : limitless_database_status option)
    ?min_required_ac_u:(min_required_ac_u_ : double_optional option) () =
  ({ status = status_; min_required_ac_u = min_required_ac_u_ } : limitless_database)

let make_serverless_v2_scaling_configuration_info
    ?min_capacity:(min_capacity_ : double_optional option)
    ?max_capacity:(max_capacity_ : double_optional option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option) () =
  ({
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
   }
    : serverless_v2_scaling_configuration_info)

let make_rds_custom_cluster_configuration
    ?interconnect_subnet_id:(interconnect_subnet_id_ : string_ option)
    ?transit_gateway_multicast_domain_id:(transit_gateway_multicast_domain_id_ : string_ option)
    ?replica_mode:(replica_mode_ : replica_mode option) () =
  ({
     interconnect_subnet_id = interconnect_subnet_id_;
     transit_gateway_multicast_domain_id = transit_gateway_multicast_domain_id_;
     replica_mode = replica_mode_;
   }
    : rds_custom_cluster_configuration)

let make_scaling_configuration_info ?min_capacity:(min_capacity_ : integer_optional option)
    ?max_capacity:(max_capacity_ : integer_optional option)
    ?auto_pause:(auto_pause_ : boolean_optional option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option) () =
  ({
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     auto_pause = auto_pause_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
     timeout_action = timeout_action_;
     seconds_before_timeout = seconds_before_timeout_;
   }
    : scaling_configuration_info)

let make_cluster_pending_modified_values
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?iops:(iops_ : integer_optional option)
    ?certificate_details:(certificate_details_ : certificate_details option) () =
  ({
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
     db_cluster_identifier = db_cluster_identifier_;
     master_user_password = master_user_password_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     engine_version = engine_version_;
     backup_retention_period = backup_retention_period_;
     storage_type = storage_type_;
     allocated_storage = allocated_storage_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     iops = iops_;
     certificate_details = certificate_details_;
   }
    : cluster_pending_modified_values)

let make_db_cluster_role ?role_arn:(role_arn_ : string_ option) ?status:(status_ : string_ option)
    ?feature_name:(feature_name_ : string_ option) () =
  ({ role_arn = role_arn_; status = status_; feature_name = feature_name_ } : db_cluster_role)

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

let make_db_cluster_status_info ?status_type:(status_type_ : string_ option)
    ?normal:(normal_ : boolean_ option) ?status:(status_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ status_type = status_type_; normal = normal_; status = status_; message = message_ }
    : db_cluster_status_info)

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
    ?custom_endpoints:(custom_endpoints_ : string_list option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?port:(port_ : integer_optional option) ?master_username:(master_username_ : string_ option)
    ?db_cluster_option_group_memberships:
      (db_cluster_option_group_memberships_ : db_cluster_option_group_memberships option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?upgrade_rollout_order:(upgrade_rollout_order_ : upgrade_rollout_order option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?read_replica_identifiers:(read_replica_identifiers_ : read_replica_identifier_list option)
    ?status_infos:(status_infos_ : db_cluster_status_info_list option)
    ?db_cluster_members:(db_cluster_members_ : db_cluster_member_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?associated_roles:(associated_roles_ : db_cluster_roles option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?clone_group_id:(clone_group_id_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?earliest_backtrack_time:(earliest_backtrack_time_ : t_stamp option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?backtrack_consumed_change_records:(backtrack_consumed_change_records_ : long_optional option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?capacity:(capacity_ : integer_optional option)
    ?pending_modified_values:(pending_modified_values_ : cluster_pending_modified_values option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?scaling_configuration_info:(scaling_configuration_info_ : scaling_configuration_info option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?io_optimized_next_allowed_modification_time:
      (io_optimized_next_allowed_modification_time_ : t_stamp option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_optional option)
    ?activity_stream_mode:(activity_stream_mode_ : activity_stream_mode option)
    ?activity_stream_status:(activity_stream_status_ : activity_stream_status option)
    ?activity_stream_kms_key_id:(activity_stream_kms_key_id_ : string_ option)
    ?activity_stream_kinesis_stream_name:(activity_stream_kinesis_stream_name_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?cross_account_clone:(cross_account_clone_ : boolean_optional option)
    ?domain_memberships:(domain_memberships_ : domain_membership_list option)
    ?tag_list:(tag_list_ : tag_list option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?global_write_forwarding_status:
      (global_write_forwarding_status_ : write_forwarding_status option)
    ?global_write_forwarding_requested:
      (global_write_forwarding_requested_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?automatic_restart_time:(automatic_restart_time_ : t_stamp option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration_info option)
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?local_write_forwarding_status:
      (local_write_forwarding_status_ : local_write_forwarding_status option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?limitless_database:(limitless_database_ : limitless_database option)
    ?cluster_scalability_type:(cluster_scalability_type_ : cluster_scalability_type option)
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?vpc_networking_enabled:(vpc_networking_enabled_ : boolean_optional option)
    ?internet_access_gateway_enabled:(internet_access_gateway_enabled_ : boolean_optional option) ()
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
     custom_endpoints = custom_endpoints_;
     multi_a_z = multi_a_z_;
     engine = engine_;
     engine_version = engine_version_;
     latest_restorable_time = latest_restorable_time_;
     port = port_;
     master_username = master_username_;
     db_cluster_option_group_memberships = db_cluster_option_group_memberships_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     upgrade_rollout_order = upgrade_rollout_order_;
     replication_source_identifier = replication_source_identifier_;
     read_replica_identifiers = read_replica_identifiers_;
     status_infos = status_infos_;
     db_cluster_members = db_cluster_members_;
     vpc_security_groups = vpc_security_groups_;
     hosted_zone_id = hosted_zone_id_;
     storage_encrypted = storage_encrypted_;
     storage_encryption_type = storage_encryption_type_;
     kms_key_id = kms_key_id_;
     db_cluster_resource_id = db_cluster_resource_id_;
     db_cluster_arn = db_cluster_arn_;
     associated_roles = associated_roles_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     clone_group_id = clone_group_id_;
     cluster_create_time = cluster_create_time_;
     earliest_backtrack_time = earliest_backtrack_time_;
     backtrack_window = backtrack_window_;
     backtrack_consumed_change_records = backtrack_consumed_change_records_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     capacity = capacity_;
     pending_modified_values = pending_modified_values_;
     engine_mode = engine_mode_;
     scaling_configuration_info = scaling_configuration_info_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     db_cluster_instance_class = db_cluster_instance_class_;
     storage_type = storage_type_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     io_optimized_next_allowed_modification_time = io_optimized_next_allowed_modification_time_;
     publicly_accessible = publicly_accessible_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     deletion_protection = deletion_protection_;
     http_endpoint_enabled = http_endpoint_enabled_;
     activity_stream_mode = activity_stream_mode_;
     activity_stream_status = activity_stream_status_;
     activity_stream_kms_key_id = activity_stream_kms_key_id_;
     activity_stream_kinesis_stream_name = activity_stream_kinesis_stream_name_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     cross_account_clone = cross_account_clone_;
     domain_memberships = domain_memberships_;
     tag_list = tag_list_;
     global_cluster_identifier = global_cluster_identifier_;
     global_write_forwarding_status = global_write_forwarding_status_;
     global_write_forwarding_requested = global_write_forwarding_requested_;
     network_type = network_type_;
     automatic_restart_time = automatic_restart_time_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     serverless_v2_platform_version = serverless_v2_platform_version_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     database_insights_mode = database_insights_mode_;
     performance_insights_enabled = performance_insights_enabled_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     db_system_id = db_system_id_;
     master_user_secret = master_user_secret_;
     local_write_forwarding_status = local_write_forwarding_status_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     limitless_database = limitless_database_;
     cluster_scalability_type = cluster_scalability_type_;
     certificate_details = certificate_details_;
     engine_lifecycle_support = engine_lifecycle_support_;
     vpc_networking_enabled = vpc_networking_enabled_;
     internet_access_gateway_enabled = internet_access_gateway_enabled_;
   }
    : db_cluster)

let make_stop_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : stop_db_cluster_message)

let make_stop_activity_stream_response ?kms_key_id:(kms_key_id_ : string_ option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?status:(status_ : activity_stream_status option) () =
  ({ kms_key_id = kms_key_id_; kinesis_stream_name = kinesis_stream_name_; status = status_ }
    : stop_activity_stream_response)

let make_stop_activity_stream_request
    ?apply_immediately:(apply_immediately_ : boolean_optional option)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_; apply_immediately = apply_immediately_ }
    : stop_activity_stream_request)

let make_export_task ?export_task_identifier:(export_task_identifier_ : string_ option)
    ?source_arn:(source_arn_ : string_ option) ?export_only:(export_only_ : string_list option)
    ?snapshot_time:(snapshot_time_ : t_stamp option)
    ?task_start_time:(task_start_time_ : t_stamp option)
    ?task_end_time:(task_end_time_ : t_stamp option) ?s3_bucket:(s3_bucket_ : string_ option)
    ?s3_prefix:(s3_prefix_ : string_ option) ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?status:(status_ : string_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?total_extracted_data_in_g_b:(total_extracted_data_in_g_b_ : integer option)
    ?failure_cause:(failure_cause_ : string_ option)
    ?warning_message:(warning_message_ : string_ option)
    ?source_type:(source_type_ : export_source_type option) () =
  ({
     export_task_identifier = export_task_identifier_;
     source_arn = source_arn_;
     export_only = export_only_;
     snapshot_time = snapshot_time_;
     task_start_time = task_start_time_;
     task_end_time = task_end_time_;
     s3_bucket = s3_bucket_;
     s3_prefix = s3_prefix_;
     iam_role_arn = iam_role_arn_;
     kms_key_id = kms_key_id_;
     status = status_;
     percent_progress = percent_progress_;
     total_extracted_data_in_g_b = total_extracted_data_in_g_b_;
     failure_cause = failure_cause_;
     warning_message = warning_message_;
     source_type = source_type_;
   }
    : export_task)

let make_start_export_task_message ?s3_prefix:(s3_prefix_ : string_ option)
    ?export_only:(export_only_ : string_list option)
    ~export_task_identifier:(export_task_identifier_ : string_) ~source_arn:(source_arn_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_) ~iam_role_arn:(iam_role_arn_ : string_)
    ~kms_key_id:(kms_key_id_ : string_) () =
  ({
     export_task_identifier = export_task_identifier_;
     source_arn = source_arn_;
     s3_bucket_name = s3_bucket_name_;
     iam_role_arn = iam_role_arn_;
     kms_key_id = kms_key_id_;
     s3_prefix = s3_prefix_;
     export_only = export_only_;
   }
    : start_export_task_message)

let make_start_db_instance_automated_backups_replication_message
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option) ?tags:(tags_ : tag_list option)
    ~source_db_instance_arn:(source_db_instance_arn_ : string_) () =
  ({
     source_db_instance_arn = source_db_instance_arn_;
     backup_retention_period = backup_retention_period_;
     kms_key_id = kms_key_id_;
     pre_signed_url = pre_signed_url_;
     tags = tags_;
   }
    : start_db_instance_automated_backups_replication_message)

let make_start_db_instance_message ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ } : start_db_instance_message)

let make_start_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : start_db_cluster_message)

let make_start_activity_stream_response ?kms_key_id:(kms_key_id_ : string_ option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?status:(status_ : activity_stream_status option) ?mode:(mode_ : activity_stream_mode option)
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ?apply_immediately:(apply_immediately_ : boolean_ option) () =
  ({
     kms_key_id = kms_key_id_;
     kinesis_stream_name = kinesis_stream_name_;
     status = status_;
     mode = mode_;
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
     apply_immediately = apply_immediately_;
   }
    : start_activity_stream_response)

let make_start_activity_stream_request
    ?apply_immediately:(apply_immediately_ : boolean_optional option)
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ~resource_arn:(resource_arn_ : string_) ~mode:(mode_ : activity_stream_mode)
    ~kms_key_id:(kms_key_id_ : string_) () =
  ({
     resource_arn = resource_arn_;
     mode = mode_;
     kms_key_id = kms_key_id_;
     apply_immediately = apply_immediately_;
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
   }
    : start_activity_stream_request)

let make_ip_range ?status:(status_ : string_ option) ?cidri_p:(cidri_p_ : string_ option) () =
  ({ status = status_; cidri_p = cidri_p_ } : ip_range)

let make_ec2_security_group ?status:(status_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option) () =
  ({
     status = status_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : ec2_security_group)

let make_db_security_group ?owner_id:(owner_id_ : string_ option)
    ?db_security_group_name:(db_security_group_name_ : string_ option)
    ?db_security_group_description:(db_security_group_description_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?ec2_security_groups:(ec2_security_groups_ : ec2_security_group_list option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ?db_security_group_arn:(db_security_group_arn_ : string_ option) () =
  ({
     owner_id = owner_id_;
     db_security_group_name = db_security_group_name_;
     db_security_group_description = db_security_group_description_;
     vpc_id = vpc_id_;
     ec2_security_groups = ec2_security_groups_;
     ip_ranges = ip_ranges_;
     db_security_group_arn = db_security_group_arn_;
   }
    : db_security_group)

let make_revoke_db_security_group_ingress_message ?cidri_p:(cidri_p_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ~db_security_group_name:(db_security_group_name_ : string_) () =
  ({
     db_security_group_name = db_security_group_name_;
     cidri_p = cidri_p_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : revoke_db_security_group_ingress_message)

let make_tag_specification ?resource_type:(resource_type_ : string_ option)
    ?tags:(tags_ : tag_list option) () =
  ({ resource_type = resource_type_; tags = tags_ } : tag_specification)

let make_restore_db_instance_to_point_in_time_message
    ?source_db_instance_identifier:(source_db_instance_identifier_ : string_ option)
    ?restore_time:(restore_time_ : t_stamp option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?port:(port_ : integer_optional option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?license_model:(license_model_ : string_ option) ?db_name:(db_name_ : string_ option)
    ?engine:(engine_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain_fqdn:(domain_fqdn_ : string_ option) ?domain_ou:(domain_ou_ : string_ option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?source_dbi_resource_id:(source_dbi_resource_id_ : string_ option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?source_db_instance_automated_backups_arn:
      (source_db_instance_automated_backups_arn_ : string_ option)
    ?backup_target:(backup_target_ : string_ option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ~target_db_instance_identifier:(target_db_instance_identifier_ : string_) () =
  ({
     source_db_instance_identifier = source_db_instance_identifier_;
     target_db_instance_identifier = target_db_instance_identifier_;
     restore_time = restore_time_;
     use_latest_restorable_time = use_latest_restorable_time_;
     db_instance_class = db_instance_class_;
     port = port_;
     availability_zone = availability_zone_;
     db_subnet_group_name = db_subnet_group_name_;
     multi_a_z = multi_a_z_;
     publicly_accessible = publicly_accessible_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     license_model = license_model_;
     db_name = db_name_;
     engine = engine_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     tags = tags_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     vpc_security_group_ids = vpc_security_group_ids_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     domain_fqdn = domain_fqdn_;
     domain_ou = domain_ou_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_dns_ips = domain_dns_ips_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     use_default_processor_features = use_default_processor_features_;
     db_parameter_group_name = db_parameter_group_name_;
     deletion_protection = deletion_protection_;
     source_dbi_resource_id = source_dbi_resource_id_;
     max_allocated_storage = max_allocated_storage_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     network_type = network_type_;
     source_db_instance_automated_backups_arn = source_db_instance_automated_backups_arn_;
     backup_target = backup_target_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     allocated_storage = allocated_storage_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     dedicated_log_volume = dedicated_log_volume_;
     ca_certificate_identifier = ca_certificate_identifier_;
     engine_lifecycle_support = engine_lifecycle_support_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
   }
    : restore_db_instance_to_point_in_time_message)

let make_restore_db_instance_from_s3_message ?db_name:(db_name_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?master_username:(master_username_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
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
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?storage_type:(storage_type_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?s3_prefix:(s3_prefix_ : string_ option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?network_type:(network_type_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~db_instance_class:(db_instance_class_ : string_) ~engine:(engine_ : string_)
    ~source_engine:(source_engine_ : string_)
    ~source_engine_version:(source_engine_version_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~s3_ingestion_role_arn:(s3_ingestion_role_arn_ : string_) () =
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
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     storage_type = storage_type_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     source_engine = source_engine_;
     source_engine_version = source_engine_version_;
     s3_bucket_name = s3_bucket_name_;
     s3_prefix = s3_prefix_;
     s3_ingestion_role_arn = s3_ingestion_role_arn_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     use_default_processor_features = use_default_processor_features_;
     deletion_protection = deletion_protection_;
     max_allocated_storage = max_allocated_storage_;
     network_type = network_type_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     dedicated_log_volume = dedicated_log_volume_;
     ca_certificate_identifier = ca_certificate_identifier_;
     engine_lifecycle_support = engine_lifecycle_support_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
   }
    : restore_db_instance_from_s3_message)

let make_restore_db_instance_from_db_snapshot_message
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?port:(port_ : integer_optional option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?license_model:(license_model_ : string_ option) ?db_name:(db_name_ : string_ option)
    ?engine:(engine_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option) ?tags:(tags_ : tag_list option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?domain:(domain_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option) ?backup_target:(backup_target_ : string_ option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_class = db_instance_class_;
     port = port_;
     availability_zone = availability_zone_;
     db_subnet_group_name = db_subnet_group_name_;
     multi_a_z = multi_a_z_;
     publicly_accessible = publicly_accessible_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     license_model = license_model_;
     db_name = db_name_;
     engine = engine_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     tags = tags_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     vpc_security_group_ids = vpc_security_group_ids_;
     domain = domain_;
     domain_fqdn = domain_fqdn_;
     domain_ou = domain_ou_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_dns_ips = domain_dns_ips_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain_iam_role_name = domain_iam_role_name_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     use_default_processor_features = use_default_processor_features_;
     db_parameter_group_name = db_parameter_group_name_;
     deletion_protection = deletion_protection_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     network_type = network_type_;
     backup_target = backup_target_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     allocated_storage = allocated_storage_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     dedicated_log_volume = dedicated_log_volume_;
     ca_certificate_identifier = ca_certificate_identifier_;
     engine_lifecycle_support = engine_lifecycle_support_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
   }
    : restore_db_instance_from_db_snapshot_message)

let make_scaling_configuration ?min_capacity:(min_capacity_ : integer_optional option)
    ?max_capacity:(max_capacity_ : integer_optional option)
    ?auto_pause:(auto_pause_ : boolean_optional option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option) () =
  ({
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     auto_pause = auto_pause_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
     timeout_action = timeout_action_;
     seconds_before_timeout = seconds_before_timeout_;
   }
    : scaling_configuration)

let make_serverless_v2_scaling_configuration ?min_capacity:(min_capacity_ : double_optional option)
    ?max_capacity:(max_capacity_ : double_optional option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option) () =
  ({
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
   }
    : serverless_v2_scaling_configuration)

let make_restore_db_cluster_to_point_in_time_message ?restore_type:(restore_type_ : string_ option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?restore_to_time:(restore_to_time_ : t_stamp option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?port:(port_ : integer_optional option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?iops:(iops_ : integer_optional option) ?network_type:(network_type_ : string_ option)
    ?source_db_cluster_resource_id:(source_db_cluster_resource_id_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?enable_vpc_networking:(enable_vpc_networking_ : boolean_optional option)
    ?enable_internet_access_gateway:(enable_internet_access_gateway_ : boolean_optional option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
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
     backtrack_window = backtrack_window_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     deletion_protection = deletion_protection_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     db_cluster_instance_class = db_cluster_instance_class_;
     storage_type = storage_type_;
     publicly_accessible = publicly_accessible_;
     iops = iops_;
     network_type = network_type_;
     source_db_cluster_resource_id = source_db_cluster_resource_id_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     scaling_configuration = scaling_configuration_;
     engine_mode = engine_mode_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     engine_lifecycle_support = engine_lifecycle_support_;
     tag_specifications = tag_specifications_;
     enable_vpc_networking = enable_vpc_networking_;
     enable_internet_access_gateway = enable_internet_access_gateway_;
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
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?enable_vpc_networking:(enable_vpc_networking_ : boolean_optional option)
    ?enable_internet_access_gateway:(enable_internet_access_gateway_ : boolean_optional option)
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
     backtrack_window = backtrack_window_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     engine_mode = engine_mode_;
     scaling_configuration = scaling_configuration_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     deletion_protection = deletion_protection_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     db_cluster_instance_class = db_cluster_instance_class_;
     storage_type = storage_type_;
     iops = iops_;
     publicly_accessible = publicly_accessible_;
     network_type = network_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     engine_lifecycle_support = engine_lifecycle_support_;
     tag_specifications = tag_specifications_;
     enable_vpc_networking = enable_vpc_networking_;
     enable_internet_access_gateway = enable_internet_access_gateway_;
   }
    : restore_db_cluster_from_snapshot_message)

let make_restore_db_cluster_from_s3_message
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?port:(port_ : integer_optional option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?s3_prefix:(s3_prefix_ : string_ option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?network_type:(network_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~engine:(engine_ : string_)
    ~master_username:(master_username_ : string_) ~source_engine:(source_engine_ : string_)
    ~source_engine_version:(source_engine_version_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~s3_ingestion_role_arn:(s3_ingestion_role_arn_ : string_) () =
  ({
     availability_zones = availability_zones_;
     backup_retention_period = backup_retention_period_;
     character_set_name = character_set_name_;
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
     tags = tags_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     source_engine = source_engine_;
     source_engine_version = source_engine_version_;
     s3_bucket_name = s3_bucket_name_;
     s3_prefix = s3_prefix_;
     s3_ingestion_role_arn = s3_ingestion_role_arn_;
     backtrack_window = backtrack_window_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     deletion_protection = deletion_protection_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     storage_type = storage_type_;
     network_type = network_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     engine_lifecycle_support = engine_lifecycle_support_;
     tag_specifications = tag_specifications_;
   }
    : restore_db_cluster_from_s3_message)

let make_db_parameter_group_name_message
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : db_parameter_group_name_message)

let make_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : potentially_sensitive_parameter_value option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?apply_method:(apply_method_ : apply_method option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option) () =
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
     supported_engine_modes = supported_engine_modes_;
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

let make_remove_role_from_db_instance_message
    ~db_instance_identifier:(db_instance_identifier_ : string_) ~role_arn:(role_arn_ : string_)
    ~feature_name:(feature_name_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     role_arn = role_arn_;
     feature_name = feature_name_;
   }
    : remove_role_from_db_instance_message)

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

let make_target_health ?state:(state_ : target_state option)
    ?reason:(reason_ : target_health_reason option) ?description:(description_ : string_ option) ()
    =
  ({ state = state_; reason = reason_; description = description_ } : target_health)

let make_db_proxy_target ?target_arn:(target_arn_ : string_ option)
    ?endpoint:(endpoint_ : string_ option)
    ?tracked_cluster_id:(tracked_cluster_id_ : string_ option)
    ?rds_resource_id:(rds_resource_id_ : string_ option) ?port:(port_ : integer option)
    ?type_:(type__ : target_type option) ?role:(role_ : target_role option)
    ?target_health:(target_health_ : target_health option) () =
  ({
     target_arn = target_arn_;
     endpoint = endpoint_;
     tracked_cluster_id = tracked_cluster_id_;
     rds_resource_id = rds_resource_id_;
     port = port_;
     type_ = type__;
     role = role_;
     target_health = target_health_;
   }
    : db_proxy_target)

let make_register_db_proxy_targets_response
    ?db_proxy_targets:(db_proxy_targets_ : target_list option) () =
  ({ db_proxy_targets = db_proxy_targets_ } : register_db_proxy_targets_response)

let make_register_db_proxy_targets_request
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ?db_instance_identifiers:(db_instance_identifiers_ : string_list option)
    ?db_cluster_identifiers:(db_cluster_identifiers_ : string_list option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
     db_instance_identifiers = db_instance_identifiers_;
     db_cluster_identifiers = db_cluster_identifiers_;
   }
    : register_db_proxy_targets_request)

let make_db_shard_group ?db_shard_group_resource_id:(db_shard_group_resource_id_ : string_ option)
    ?db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?max_ac_u:(max_ac_u_ : double_optional option) ?min_ac_u:(min_ac_u_ : double_optional option)
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ?status:(status_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?endpoint:(endpoint_ : string_ option)
    ?db_shard_group_arn:(db_shard_group_arn_ : string_ option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     db_shard_group_resource_id = db_shard_group_resource_id_;
     db_shard_group_identifier = db_shard_group_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     max_ac_u = max_ac_u_;
     min_ac_u = min_ac_u_;
     compute_redundancy = compute_redundancy_;
     status = status_;
     publicly_accessible = publicly_accessible_;
     endpoint = endpoint_;
     db_shard_group_arn = db_shard_group_arn_;
     tag_list = tag_list_;
   }
    : db_shard_group)

let make_reboot_db_shard_group_message
    ~db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier) () =
  ({ db_shard_group_identifier = db_shard_group_identifier_ } : reboot_db_shard_group_message)

let make_reboot_db_instance_message ?force_failover:(force_failover_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_; force_failover = force_failover_ }
    : reboot_db_instance_message)

let make_reboot_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : reboot_db_cluster_message)

let make_recurring_charge ?recurring_charge_amount:(recurring_charge_amount_ : double option)
    ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option) () =
  ({
     recurring_charge_amount = recurring_charge_amount_;
     recurring_charge_frequency = recurring_charge_frequency_;
   }
    : recurring_charge)

let make_reserved_db_instance ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?start_time:(start_time_ : t_stamp option) ?duration:(duration_ : integer option)
    ?fixed_price:(fixed_price_ : double option) ?usage_price:(usage_price_ : double option)
    ?currency_code:(currency_code_ : string_ option)
    ?db_instance_count:(db_instance_count_ : integer option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_ option)
    ?state:(state_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?reserved_db_instance_arn:(reserved_db_instance_arn_ : string_ option)
    ?lease_id:(lease_id_ : string_ option) () =
  ({
     reserved_db_instance_id = reserved_db_instance_id_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     db_instance_class = db_instance_class_;
     start_time = start_time_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     currency_code = currency_code_;
     db_instance_count = db_instance_count_;
     product_description = product_description_;
     offering_type = offering_type_;
     multi_a_z = multi_a_z_;
     state = state_;
     recurring_charges = recurring_charges_;
     reserved_db_instance_arn = reserved_db_instance_arn_;
     lease_id = lease_id_;
   }
    : reserved_db_instance)

let make_purchase_reserved_db_instances_offering_message
    ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option)
    ?db_instance_count:(db_instance_count_ : integer_optional option)
    ?tags:(tags_ : tag_list option)
    ~reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_) () =
  ({
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     reserved_db_instance_id = reserved_db_instance_id_;
     db_instance_count = db_instance_count_;
     tags = tags_;
   }
    : purchase_reserved_db_instances_offering_message)

let make_promote_read_replica_db_cluster_message
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : promote_read_replica_db_cluster_message)

let make_promote_read_replica_message
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     tag_specifications = tag_specifications_;
   }
    : promote_read_replica_message)

let make_tenant_database_pending_modified_values
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?tenant_db_name:(tenant_db_name_ : string_ option) () =
  ({ master_user_password = master_user_password_; tenant_db_name = tenant_db_name_ }
    : tenant_database_pending_modified_values)

let make_tenant_database
    ?tenant_database_create_time:(tenant_database_create_time_ : t_stamp option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?tenant_db_name:(tenant_db_name_ : string_ option) ?status:(status_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?tenant_database_resource_id:(tenant_database_resource_id_ : string_ option)
    ?tenant_database_ar_n:(tenant_database_ar_n_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_ option)
    ?pending_modified_values:
      (pending_modified_values_ : tenant_database_pending_modified_values option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     tenant_database_create_time = tenant_database_create_time_;
     db_instance_identifier = db_instance_identifier_;
     tenant_db_name = tenant_db_name_;
     status = status_;
     master_username = master_username_;
     dbi_resource_id = dbi_resource_id_;
     tenant_database_resource_id = tenant_database_resource_id_;
     tenant_database_ar_n = tenant_database_ar_n_;
     character_set_name = character_set_name_;
     nchar_character_set_name = nchar_character_set_name_;
     deletion_protection = deletion_protection_;
     pending_modified_values = pending_modified_values_;
     master_user_secret = master_user_secret_;
     tag_list = tag_list_;
   }
    : tenant_database)

let make_modify_tenant_database_message
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?new_tenant_db_name:(new_tenant_db_name_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~tenant_db_name:(tenant_db_name_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     tenant_db_name = tenant_db_name_;
     master_user_password = master_user_password_;
     new_tenant_db_name = new_tenant_db_name_;
     manage_master_user_password = manage_master_user_password_;
     rotate_master_user_password = rotate_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
   }
    : modify_tenant_database_message)

let make_option_setting ?name:(name_ : string_ option)
    ?value:(value_ : potentially_sensitive_option_setting_value option)
    ?default_value:(default_value_ : string_ option) ?description:(description_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?is_collection:(is_collection_ : boolean_ option) () =
  ({
     name = name_;
     value = value_;
     default_value = default_value_;
     description = description_;
     apply_type = apply_type_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     is_collection = is_collection_;
   }
    : option_setting)

let make_option_ ?option_name:(option_name_ : string_ option)
    ?option_description:(option_description_ : string_ option)
    ?persistent:(persistent_ : boolean_ option) ?permanent:(permanent_ : boolean_ option)
    ?port:(port_ : integer_optional option) ?option_version:(option_version_ : string_ option)
    ?option_settings:(option_settings_ : option_setting_configuration_list option)
    ?db_security_group_memberships:
      (db_security_group_memberships_ : db_security_group_membership_list option)
    ?vpc_security_group_memberships:
      (vpc_security_group_memberships_ : vpc_security_group_membership_list option) () =
  ({
     option_name = option_name_;
     option_description = option_description_;
     persistent = persistent_;
     permanent = permanent_;
     port = port_;
     option_version = option_version_;
     option_settings = option_settings_;
     db_security_group_memberships = db_security_group_memberships_;
     vpc_security_group_memberships = vpc_security_group_memberships_;
   }
    : option_)

let make_option_group ?option_group_name:(option_group_name_ : string_ option)
    ?option_group_description:(option_group_description_ : string_ option)
    ?engine_name:(engine_name_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?options:(options_ : options_list option)
    ?allows_vpc_and_non_vpc_instance_memberships:
      (allows_vpc_and_non_vpc_instance_memberships_ : boolean_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?option_group_arn:(option_group_arn_ : string_ option)
    ?source_option_group:(source_option_group_ : string_ option)
    ?source_account_id:(source_account_id_ : string_ option)
    ?copy_timestamp:(copy_timestamp_ : t_stamp option) () =
  ({
     option_group_name = option_group_name_;
     option_group_description = option_group_description_;
     engine_name = engine_name_;
     major_engine_version = major_engine_version_;
     options = options_;
     allows_vpc_and_non_vpc_instance_memberships = allows_vpc_and_non_vpc_instance_memberships_;
     vpc_id = vpc_id_;
     option_group_arn = option_group_arn_;
     source_option_group = source_option_group_;
     source_account_id = source_account_id_;
     copy_timestamp = copy_timestamp_;
   }
    : option_group)

let make_option_configuration ?port:(port_ : integer_optional option)
    ?option_version:(option_version_ : string_ option)
    ?db_security_group_memberships:
      (db_security_group_memberships_ : db_security_group_name_list option)
    ?vpc_security_group_memberships:
      (vpc_security_group_memberships_ : vpc_security_group_id_list option)
    ?option_settings:(option_settings_ : option_settings_list option)
    ~option_name:(option_name_ : string_) () =
  ({
     option_name = option_name_;
     port = port_;
     option_version = option_version_;
     db_security_group_memberships = db_security_group_memberships_;
     vpc_security_group_memberships = vpc_security_group_memberships_;
     option_settings = option_settings_;
   }
    : option_configuration)

let make_modify_option_group_message
    ?options_to_include:(options_to_include_ : option_configuration_list option)
    ?options_to_remove:(options_to_remove_ : option_names_list option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ~option_group_name:(option_group_name_ : string_) () =
  ({
     option_group_name = option_group_name_;
     options_to_include = options_to_include_;
     options_to_remove = options_to_remove_;
     apply_immediately = apply_immediately_;
   }
    : modify_option_group_message)

let make_integration_error ?error_message:(error_message_ : string_ option)
    ~error_code:(error_code_ : string_) () =
  ({ error_code = error_code_; error_message = error_message_ } : integration_error)

let make_integration ?source_arn:(source_arn_ : source_arn option)
    ?target_arn:(target_arn_ : arn option)
    ?integration_name:(integration_name_ : integration_name option)
    ?integration_arn:(integration_arn_ : integration_arn option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?status:(status_ : integration_status option) ?tags:(tags_ : tag_list option)
    ?data_filter:(data_filter_ : data_filter option)
    ?description:(description_ : integration_description option)
    ?create_time:(create_time_ : t_stamp option) ?errors:(errors_ : integration_error_list option)
    () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     integration_arn = integration_arn_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     status = status_;
     tags = tags_;
     data_filter = data_filter_;
     description = description_;
     create_time = create_time_;
     errors = errors_;
   }
    : integration)

let make_modify_integration_message ?integration_name:(integration_name_ : integration_name option)
    ?data_filter:(data_filter_ : data_filter option)
    ?description:(description_ : integration_description option)
    ~integration_identifier:(integration_identifier_ : integration_identifier) () =
  ({
     integration_identifier = integration_identifier_;
     integration_name = integration_name_;
     data_filter = data_filter_;
     description = description_;
   }
    : modify_integration_message)

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

let make_db_snapshot_attribute ?attribute_name:(attribute_name_ : string_ option)
    ?attribute_values:(attribute_values_ : attribute_value_list option) () =
  ({ attribute_name = attribute_name_; attribute_values = attribute_values_ }
    : db_snapshot_attribute)

let make_modify_db_snapshot_attribute_message
    ?values_to_add:(values_to_add_ : attribute_value_list option)
    ?values_to_remove:(values_to_remove_ : attribute_value_list option)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_)
    ~attribute_name:(attribute_name_ : string_) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     attribute_name = attribute_name_;
     values_to_add = values_to_add_;
     values_to_remove = values_to_remove_;
   }
    : modify_db_snapshot_attribute_message)

let make_db_snapshot ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?engine:(engine_ : string_ option) ?allocated_storage:(allocated_storage_ : integer option)
    ?status:(status_ : string_ option) ?port:(port_ : integer option)
    ?availability_zone:(availability_zone_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?master_username:(master_username_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?source_region:(source_region_ : string_ option)
    ?source_db_snapshot_identifier:(source_db_snapshot_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?encrypted:(encrypted_ : boolean_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?db_snapshot_arn:(db_snapshot_arn_ : string_ option)
    ?timezone:(timezone_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) ?tag_list:(tag_list_ : tag_list option)
    ?snapshot_target:(snapshot_target_ : string_ option)
    ?original_snapshot_create_time:(original_snapshot_create_time_ : t_stamp option)
    ?snapshot_database_time:(snapshot_database_time_ : t_stamp option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?snapshot_availability_zone:(snapshot_availability_zone_ : string_ option) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
     snapshot_create_time = snapshot_create_time_;
     engine = engine_;
     allocated_storage = allocated_storage_;
     status = status_;
     port = port_;
     availability_zone = availability_zone_;
     vpc_id = vpc_id_;
     instance_create_time = instance_create_time_;
     master_username = master_username_;
     engine_version = engine_version_;
     license_model = license_model_;
     snapshot_type = snapshot_type_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     percent_progress = percent_progress_;
     source_region = source_region_;
     source_db_snapshot_identifier = source_db_snapshot_identifier_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     encrypted = encrypted_;
     storage_encryption_type = storage_encryption_type_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     kms_key_id = kms_key_id_;
     db_snapshot_arn = db_snapshot_arn_;
     timezone = timezone_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     processor_features = processor_features_;
     dbi_resource_id = dbi_resource_id_;
     tag_list = tag_list_;
     snapshot_target = snapshot_target_;
     original_snapshot_create_time = original_snapshot_create_time_;
     snapshot_database_time = snapshot_database_time_;
     db_system_id = db_system_id_;
     multi_tenant = multi_tenant_;
     dedicated_log_volume = dedicated_log_volume_;
     additional_storage_volumes = additional_storage_volumes_;
     snapshot_availability_zone = snapshot_availability_zone_;
   }
    : db_snapshot)

let make_modify_db_snapshot_message ?engine_version:(engine_version_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     engine_version = engine_version_;
     option_group_name = option_group_name_;
   }
    : modify_db_snapshot_message)

let make_modify_db_shard_group_message ?max_ac_u:(max_ac_u_ : double_optional option)
    ?min_ac_u:(min_ac_u_ : double_optional option)
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ~db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier) () =
  ({
     db_shard_group_identifier = db_shard_group_identifier_;
     max_ac_u = max_ac_u_;
     min_ac_u = min_ac_u_;
     compute_redundancy = compute_redundancy_;
   }
    : modify_db_shard_group_message)

let make_performance_insights_metric_dimension_group ?dimensions:(dimensions_ : string_list option)
    ?group:(group_ : string_ option) ?limit:(limit_ : integer option) () =
  ({ dimensions = dimensions_; group = group_; limit = limit_ }
    : performance_insights_metric_dimension_group)

let make_performance_insights_metric_query
    ?group_by:(group_by_ : performance_insights_metric_dimension_group option)
    ?metric:(metric_ : string_ option) () =
  ({ group_by = group_by_; metric = metric_ } : performance_insights_metric_query)

let make_metric_query
    ?performance_insights_metric_query:
      (performance_insights_metric_query_ : performance_insights_metric_query option) () =
  ({ performance_insights_metric_query = performance_insights_metric_query_ } : metric_query)

let make_scalar_reference_details ?value:(value_ : double option) () =
  ({ value = value_ } : scalar_reference_details)

let make_reference_details
    ?scalar_reference_details:(scalar_reference_details_ : scalar_reference_details option) () =
  ({ scalar_reference_details = scalar_reference_details_ } : reference_details)

let make_metric_reference ?name:(name_ : string_ option)
    ?reference_details:(reference_details_ : reference_details option) () =
  ({ name = name_; reference_details = reference_details_ } : metric_reference)

let make_metric ?name:(name_ : string_ option)
    ?references:(references_ : metric_reference_list option)
    ?statistics_details:(statistics_details_ : string_ option)
    ?metric_query:(metric_query_ : metric_query option) () =
  ({
     name = name_;
     references = references_;
     statistics_details = statistics_details_;
     metric_query = metric_query_;
   }
    : metric)

let make_performance_issue_details ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?metrics:(metrics_ : metric_list option)
    ?analysis:(analysis_ : string_ option) () =
  ({ start_time = start_time_; end_time = end_time_; metrics = metrics_; analysis = analysis_ }
    : performance_issue_details)

let make_issue_details
    ?performance_issue_details:(performance_issue_details_ : performance_issue_details option) () =
  ({ performance_issue_details = performance_issue_details_ } : issue_details)

let make_doc_link ?text:(text_ : string_ option) ?url:(url_ : string_ option) () =
  ({ text = text_; url = url_ } : doc_link)

let make_context_attribute ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : context_attribute)

let make_recommended_action_parameter ?key:(key_ : string_ option) ?value:(value_ : string_ option)
    () =
  ({ key = key_; value = value_ } : recommended_action_parameter)

let make_recommended_action ?action_id:(action_id_ : string_ option)
    ?title:(title_ : string_ option) ?description:(description_ : string_ option)
    ?operation:(operation_ : string_ option)
    ?parameters:(parameters_ : recommended_action_parameter_list option)
    ?apply_modes:(apply_modes_ : string_list option) ?status:(status_ : string_ option)
    ?issue_details:(issue_details_ : issue_details option)
    ?context_attributes:(context_attributes_ : context_attribute_list option) () =
  ({
     action_id = action_id_;
     title = title_;
     description = description_;
     operation = operation_;
     parameters = parameters_;
     apply_modes = apply_modes_;
     status = status_;
     issue_details = issue_details_;
     context_attributes = context_attributes_;
   }
    : recommended_action)

let make_db_recommendation ?recommendation_id:(recommendation_id_ : string_ option)
    ?type_id:(type_id_ : string_ option) ?severity:(severity_ : string_ option)
    ?resource_arn:(resource_arn_ : string_ option) ?status:(status_ : string_ option)
    ?created_time:(created_time_ : t_stamp option) ?updated_time:(updated_time_ : t_stamp option)
    ?detection:(detection_ : string_ option) ?recommendation:(recommendation_ : string_ option)
    ?description:(description_ : string_ option) ?reason:(reason_ : string_ option)
    ?recommended_actions:(recommended_actions_ : recommended_action_list option)
    ?category:(category_ : string_ option) ?source:(source_ : string_ option)
    ?type_detection:(type_detection_ : string_ option)
    ?type_recommendation:(type_recommendation_ : string_ option) ?impact:(impact_ : string_ option)
    ?additional_info:(additional_info_ : string_ option) ?links:(links_ : doc_link_list option)
    ?issue_details:(issue_details_ : issue_details option) () =
  ({
     recommendation_id = recommendation_id_;
     type_id = type_id_;
     severity = severity_;
     resource_arn = resource_arn_;
     status = status_;
     created_time = created_time_;
     updated_time = updated_time_;
     detection = detection_;
     recommendation = recommendation_;
     description = description_;
     reason = reason_;
     recommended_actions = recommended_actions_;
     category = category_;
     source = source_;
     type_detection = type_detection_;
     type_recommendation = type_recommendation_;
     impact = impact_;
     additional_info = additional_info_;
     links = links_;
     issue_details = issue_details_;
   }
    : db_recommendation)

let make_db_recommendation_message
    ?db_recommendation:(db_recommendation_ : db_recommendation option) () =
  ({ db_recommendation = db_recommendation_ } : db_recommendation_message)

let make_recommended_action_update ~action_id:(action_id_ : string_) ~status:(status_ : string_) ()
    =
  ({ action_id = action_id_; status = status_ } : recommended_action_update)

let make_modify_db_recommendation_message ?locale:(locale_ : string_ option)
    ?status:(status_ : string_ option)
    ?recommended_action_updates:
      (recommended_action_updates_ : recommended_action_update_list option)
    ~recommendation_id:(recommendation_id_ : string_) () =
  ({
     recommendation_id = recommendation_id_;
     locale = locale_;
     status = status_;
     recommended_action_updates = recommended_action_updates_;
   }
    : modify_db_recommendation_message)

let make_connection_pool_configuration_info
    ?max_connections_percent:(max_connections_percent_ : integer option)
    ?max_idle_connections_percent:(max_idle_connections_percent_ : integer option)
    ?connection_borrow_timeout:(connection_borrow_timeout_ : integer option)
    ?session_pinning_filters:(session_pinning_filters_ : string_list option)
    ?init_query:(init_query_ : operator_sensitive_string option) () =
  ({
     max_connections_percent = max_connections_percent_;
     max_idle_connections_percent = max_idle_connections_percent_;
     connection_borrow_timeout = connection_borrow_timeout_;
     session_pinning_filters = session_pinning_filters_;
     init_query = init_query_;
   }
    : connection_pool_configuration_info)

let make_db_proxy_target_group ?db_proxy_name:(db_proxy_name_ : string_ option)
    ?target_group_name:(target_group_name_ : string_ option)
    ?target_group_arn:(target_group_arn_ : string_ option)
    ?is_default:(is_default_ : boolean_ option) ?status:(status_ : string_ option)
    ?connection_pool_config:(connection_pool_config_ : connection_pool_configuration_info option)
    ?created_date:(created_date_ : t_stamp option) ?updated_date:(updated_date_ : t_stamp option) ()
    =
  ({
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
     target_group_arn = target_group_arn_;
     is_default = is_default_;
     status = status_;
     connection_pool_config = connection_pool_config_;
     created_date = created_date_;
     updated_date = updated_date_;
   }
    : db_proxy_target_group)

let make_modify_db_proxy_target_group_response
    ?db_proxy_target_group:(db_proxy_target_group_ : db_proxy_target_group option) () =
  ({ db_proxy_target_group = db_proxy_target_group_ } : modify_db_proxy_target_group_response)

let make_connection_pool_configuration
    ?max_connections_percent:(max_connections_percent_ : integer_optional option)
    ?max_idle_connections_percent:(max_idle_connections_percent_ : integer_optional option)
    ?connection_borrow_timeout:(connection_borrow_timeout_ : integer_optional option)
    ?session_pinning_filters:(session_pinning_filters_ : string_list option)
    ?init_query:(init_query_ : operator_sensitive_string option) () =
  ({
     max_connections_percent = max_connections_percent_;
     max_idle_connections_percent = max_idle_connections_percent_;
     connection_borrow_timeout = connection_borrow_timeout_;
     session_pinning_filters = session_pinning_filters_;
     init_query = init_query_;
   }
    : connection_pool_configuration)

let make_modify_db_proxy_target_group_request
    ?connection_pool_config:(connection_pool_config_ : connection_pool_configuration option)
    ?new_name:(new_name_ : string_ option)
    ~target_group_name:(target_group_name_ : db_proxy_target_group_name)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
     connection_pool_config = connection_pool_config_;
     new_name = new_name_;
   }
    : modify_db_proxy_target_group_request)

let make_db_proxy_endpoint ?db_proxy_endpoint_name:(db_proxy_endpoint_name_ : string_ option)
    ?db_proxy_endpoint_arn:(db_proxy_endpoint_arn_ : string_ option)
    ?db_proxy_name:(db_proxy_name_ : string_ option)
    ?status:(status_ : db_proxy_endpoint_status option) ?vpc_id:(vpc_id_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : string_list option) ?endpoint:(endpoint_ : string_ option)
    ?created_date:(created_date_ : t_stamp option)
    ?target_role:(target_role_ : db_proxy_endpoint_target_role option)
    ?is_default:(is_default_ : boolean_ option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option) () =
  ({
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     db_proxy_endpoint_arn = db_proxy_endpoint_arn_;
     db_proxy_name = db_proxy_name_;
     status = status_;
     vpc_id = vpc_id_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     endpoint = endpoint_;
     created_date = created_date_;
     target_role = target_role_;
     is_default = is_default_;
     endpoint_network_type = endpoint_network_type_;
   }
    : db_proxy_endpoint)

let make_modify_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : modify_db_proxy_endpoint_response)

let make_modify_db_proxy_endpoint_request
    ?new_db_proxy_endpoint_name:(new_db_proxy_endpoint_name_ : db_proxy_endpoint_name option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name) () =
  ({
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     new_db_proxy_endpoint_name = new_db_proxy_endpoint_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
   }
    : modify_db_proxy_endpoint_request)

let make_user_auth_config_info ?description:(description_ : string_ option)
    ?user_name:(user_name_ : string_ option) ?auth_scheme:(auth_scheme_ : auth_scheme option)
    ?secret_arn:(secret_arn_ : string_ option) ?iam_auth:(iam_auth_ : iam_auth_mode option)
    ?client_password_auth_type:(client_password_auth_type_ : client_password_auth_type option) () =
  ({
     description = description_;
     user_name = user_name_;
     auth_scheme = auth_scheme_;
     secret_arn = secret_arn_;
     iam_auth = iam_auth_;
     client_password_auth_type = client_password_auth_type_;
   }
    : user_auth_config_info)

let make_db_proxy ?db_proxy_name:(db_proxy_name_ : string_ option)
    ?db_proxy_arn:(db_proxy_arn_ : string_ option) ?status:(status_ : db_proxy_status option)
    ?engine_family:(engine_family_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : string_list option)
    ?default_auth_scheme:(default_auth_scheme_ : string_ option)
    ?auth:(auth_ : user_auth_config_info_list option) ?role_arn:(role_arn_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?require_tl_s:(require_tl_s_ : boolean_ option)
    ?idle_client_timeout:(idle_client_timeout_ : integer option)
    ?debug_logging:(debug_logging_ : boolean_ option) ?created_date:(created_date_ : t_stamp option)
    ?updated_date:(updated_date_ : t_stamp option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?target_connection_network_type:
      (target_connection_network_type_ : target_connection_network_type option) () =
  ({
     db_proxy_name = db_proxy_name_;
     db_proxy_arn = db_proxy_arn_;
     status = status_;
     engine_family = engine_family_;
     vpc_id = vpc_id_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     default_auth_scheme = default_auth_scheme_;
     auth = auth_;
     role_arn = role_arn_;
     endpoint = endpoint_;
     require_tl_s = require_tl_s_;
     idle_client_timeout = idle_client_timeout_;
     debug_logging = debug_logging_;
     created_date = created_date_;
     updated_date = updated_date_;
     endpoint_network_type = endpoint_network_type_;
     target_connection_network_type = target_connection_network_type_;
   }
    : db_proxy)

let make_modify_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : modify_db_proxy_response)

let make_user_auth_config ?description:(description_ : description option)
    ?user_name:(user_name_ : auth_user_name option) ?auth_scheme:(auth_scheme_ : auth_scheme option)
    ?secret_arn:(secret_arn_ : arn option) ?iam_auth:(iam_auth_ : iam_auth_mode option)
    ?client_password_auth_type:(client_password_auth_type_ : client_password_auth_type option) () =
  ({
     description = description_;
     user_name = user_name_;
     auth_scheme = auth_scheme_;
     secret_arn = secret_arn_;
     iam_auth = iam_auth_;
     client_password_auth_type = client_password_auth_type_;
   }
    : user_auth_config)

let make_modify_db_proxy_request ?new_db_proxy_name:(new_db_proxy_name_ : db_proxy_name option)
    ?default_auth_scheme:(default_auth_scheme_ : default_auth_scheme option)
    ?auth:(auth_ : user_auth_config_list option)
    ?require_tl_s:(require_tl_s_ : boolean_optional option)
    ?idle_client_timeout:(idle_client_timeout_ : integer_optional option)
    ?debug_logging:(debug_logging_ : boolean_optional option) ?role_arn:(role_arn_ : arn option)
    ?security_groups:(security_groups_ : string_list option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     db_proxy_name = db_proxy_name_;
     new_db_proxy_name = new_db_proxy_name_;
     default_auth_scheme = default_auth_scheme_;
     auth = auth_;
     require_tl_s = require_tl_s_;
     idle_client_timeout = idle_client_timeout_;
     debug_logging = debug_logging_;
     role_arn = role_arn_;
     security_groups = security_groups_;
   }
    : modify_db_proxy_request)

let make_modify_db_parameter_group_message
    ~db_parameter_group_name:(db_parameter_group_name_ : string_)
    ~parameters:(parameters_ : parameters_list) () =
  ({ db_parameter_group_name = db_parameter_group_name_; parameters = parameters_ }
    : modify_db_parameter_group_message)

let make_modify_additional_storage_volume
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?set_for_delete:(set_for_delete_ : boolean_optional option)
    ~volume_name:(volume_name_ : string_) () =
  ({
     volume_name = volume_name_;
     allocated_storage = allocated_storage_;
     iop_s = iop_s_;
     max_allocated_storage = max_allocated_storage_;
     storage_throughput = storage_throughput_;
     storage_type = storage_type_;
     set_for_delete = set_for_delete_;
   }
    : modify_additional_storage_volume)

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
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?license_model:(license_model_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?new_db_instance_identifier:(new_db_instance_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?domain:(domain_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?disable_domain:(disable_domain_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?db_port_number:(db_port_number_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?certificate_rotation_restart:(certificate_rotation_restart_ : boolean_optional option)
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?resume_full_automation_mode_minutes:
      (resume_full_automation_mode_minutes_ : integer_optional option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?aws_backup_recovery_point_arn:
      (aws_backup_recovery_point_arn_ : aws_backup_recovery_point_arn option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?engine:(engine_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : modify_additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
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
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     new_db_instance_identifier = new_db_instance_identifier_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     ca_certificate_identifier = ca_certificate_identifier_;
     domain = domain_;
     domain_fqdn = domain_fqdn_;
     domain_ou = domain_ou_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_dns_ips = domain_dns_ips_;
     disable_domain = disable_domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     db_port_number = db_port_number_;
     publicly_accessible = publicly_accessible_;
     monitoring_role_arn = monitoring_role_arn_;
     domain_iam_role_name = domain_iam_role_name_;
     promotion_tier = promotion_tier_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     processor_features = processor_features_;
     use_default_processor_features = use_default_processor_features_;
     deletion_protection = deletion_protection_;
     max_allocated_storage = max_allocated_storage_;
     certificate_rotation_restart = certificate_rotation_restart_;
     replica_mode = replica_mode_;
     automation_mode = automation_mode_;
     resume_full_automation_mode_minutes = resume_full_automation_mode_minutes_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     network_type = network_type_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     manage_master_user_password = manage_master_user_password_;
     rotate_master_user_password = rotate_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     multi_tenant = multi_tenant_;
     dedicated_log_volume = dedicated_log_volume_;
     engine = engine_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
     master_user_authentication_type = master_user_authentication_type_;
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
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?engine_version:(engine_version_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?db_instance_parameter_group_name:(db_instance_parameter_group_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_http_endpoint:(enable_http_endpoint_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?enable_global_write_forwarding:(enable_global_write_forwarding_ : boolean_optional option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?enable_local_write_forwarding:(enable_local_write_forwarding_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?allow_engine_mode_change:(allow_engine_mode_change_ : boolean_ option)
    ?aws_backup_recovery_point_arn:
      (aws_backup_recovery_point_arn_ : aws_backup_recovery_point_arn option)
    ?enable_limitless_database:(enable_limitless_database_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
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
     backtrack_window = backtrack_window_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     engine_version = engine_version_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     db_instance_parameter_group_name = db_instance_parameter_group_name_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     scaling_configuration = scaling_configuration_;
     deletion_protection = deletion_protection_;
     enable_http_endpoint = enable_http_endpoint_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     enable_global_write_forwarding = enable_global_write_forwarding_;
     db_cluster_instance_class = db_cluster_instance_class_;
     allocated_storage = allocated_storage_;
     storage_type = storage_type_;
     iops = iops_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     network_type = network_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     manage_master_user_password = manage_master_user_password_;
     rotate_master_user_password = rotate_master_user_password_;
     enable_local_write_forwarding = enable_local_write_forwarding_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     engine_mode = engine_mode_;
     allow_engine_mode_change = allow_engine_mode_change_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     enable_limitless_database = enable_limitless_database_;
     ca_certificate_identifier = ca_certificate_identifier_;
     master_user_authentication_type = master_user_authentication_type_;
   }
    : modify_db_cluster_message)

let make_serverless_v2_features_support ?min_capacity:(min_capacity_ : double_optional option)
    ?max_capacity:(max_capacity_ : double_optional option) () =
  ({ min_capacity = min_capacity_; max_capacity = max_capacity_ } : serverless_v2_features_support)

let make_timezone ?timezone_name:(timezone_name_ : string_ option) () =
  ({ timezone_name = timezone_name_ } : timezone)

let make_upgrade_target ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?description:(description_ : string_ option)
    ?auto_upgrade:(auto_upgrade_ : boolean_ option)
    ?is_major_version_upgrade:(is_major_version_upgrade_ : boolean_ option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?supports_parallel_query:(supports_parallel_query_ : boolean_optional option)
    ?supports_global_databases:(supports_global_databases_ : boolean_optional option)
    ?supports_babelfish:(supports_babelfish_ : boolean_optional option)
    ?supports_limitless_database:(supports_limitless_database_ : boolean_optional option)
    ?supports_local_write_forwarding:(supports_local_write_forwarding_ : boolean_optional option)
    ?supports_integrations:(supports_integrations_ : boolean_optional option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     description = description_;
     auto_upgrade = auto_upgrade_;
     is_major_version_upgrade = is_major_version_upgrade_;
     supported_engine_modes = supported_engine_modes_;
     supports_parallel_query = supports_parallel_query_;
     supports_global_databases = supports_global_databases_;
     supports_babelfish = supports_babelfish_;
     supports_limitless_database = supports_limitless_database_;
     supports_local_write_forwarding = supports_local_write_forwarding_;
     supports_integrations = supports_integrations_;
   }
    : upgrade_target)

let make_character_set ?character_set_name:(character_set_name_ : string_ option)
    ?character_set_description:(character_set_description_ : string_ option) () =
  ({
     character_set_name = character_set_name_;
     character_set_description = character_set_description_;
   }
    : character_set)

let make_custom_db_engine_version_am_i ?image_id:(image_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ image_id = image_id_; status = status_ } : custom_db_engine_version_am_i)

let make_db_engine_version ?engine:(engine_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?database_installation_files_s3_bucket_name:
      (database_installation_files_s3_bucket_name_ : string_ option)
    ?database_installation_files_s3_prefix:(database_installation_files_s3_prefix_ : string_ option)
    ?database_installation_files:(database_installation_files_ : string_list option)
    ?custom_db_engine_version_manifest:
      (custom_db_engine_version_manifest_ : custom_db_engine_version_manifest option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?db_engine_description:(db_engine_description_ : string_ option)
    ?db_engine_version_arn:(db_engine_version_arn_ : string_ option)
    ?db_engine_version_description:(db_engine_version_description_ : string_ option)
    ?default_character_set:(default_character_set_ : character_set option)
    ?failure_reason:(failure_reason_ : string_ option)
    ?image:(image_ : custom_db_engine_version_am_i option)
    ?db_engine_media_type:(db_engine_media_type_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?create_time:(create_time_ : t_stamp option)
    ?supported_character_sets:(supported_character_sets_ : supported_character_sets_list option)
    ?supported_nchar_character_sets:
      (supported_nchar_character_sets_ : supported_character_sets_list option)
    ?valid_upgrade_target:(valid_upgrade_target_ : valid_upgrade_target_list option)
    ?supported_timezones:(supported_timezones_ : supported_timezones_list option)
    ?exportable_log_types:(exportable_log_types_ : log_type_list option)
    ?supports_log_exports_to_cloudwatch_logs:
      (supports_log_exports_to_cloudwatch_logs_ : boolean_ option)
    ?supports_read_replica:(supports_read_replica_ : boolean_ option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?supported_feature_names:(supported_feature_names_ : feature_name_list option)
    ?status:(status_ : string_ option)
    ?supports_parallel_query:(supports_parallel_query_ : boolean_ option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option)
    ?tag_list:(tag_list_ : tag_list option)
    ?supports_babelfish:(supports_babelfish_ : boolean_ option)
    ?supports_limitless_database:(supports_limitless_database_ : boolean_ option)
    ?supports_certificate_rotation_without_restart:
      (supports_certificate_rotation_without_restart_ : boolean_optional option)
    ?supported_ca_certificate_identifiers:
      (supported_ca_certificate_identifiers_ : ca_certificate_identifiers_list option)
    ?supports_local_write_forwarding:(supports_local_write_forwarding_ : boolean_optional option)
    ?supports_integrations:(supports_integrations_ : boolean_ option)
    ?serverless_v2_features_support:
      (serverless_v2_features_support_ : serverless_v2_features_support option) () =
  ({
     engine = engine_;
     major_engine_version = major_engine_version_;
     engine_version = engine_version_;
     database_installation_files_s3_bucket_name = database_installation_files_s3_bucket_name_;
     database_installation_files_s3_prefix = database_installation_files_s3_prefix_;
     database_installation_files = database_installation_files_;
     custom_db_engine_version_manifest = custom_db_engine_version_manifest_;
     db_parameter_group_family = db_parameter_group_family_;
     db_engine_description = db_engine_description_;
     db_engine_version_arn = db_engine_version_arn_;
     db_engine_version_description = db_engine_version_description_;
     default_character_set = default_character_set_;
     failure_reason = failure_reason_;
     image = image_;
     db_engine_media_type = db_engine_media_type_;
     kms_key_id = kms_key_id_;
     create_time = create_time_;
     supported_character_sets = supported_character_sets_;
     supported_nchar_character_sets = supported_nchar_character_sets_;
     valid_upgrade_target = valid_upgrade_target_;
     supported_timezones = supported_timezones_;
     exportable_log_types = exportable_log_types_;
     supports_log_exports_to_cloudwatch_logs = supports_log_exports_to_cloudwatch_logs_;
     supports_read_replica = supports_read_replica_;
     supported_engine_modes = supported_engine_modes_;
     supported_feature_names = supported_feature_names_;
     status = status_;
     supports_parallel_query = supports_parallel_query_;
     supports_global_databases = supports_global_databases_;
     tag_list = tag_list_;
     supports_babelfish = supports_babelfish_;
     supports_limitless_database = supports_limitless_database_;
     supports_certificate_rotation_without_restart = supports_certificate_rotation_without_restart_;
     supported_ca_certificate_identifiers = supported_ca_certificate_identifiers_;
     supports_local_write_forwarding = supports_local_write_forwarding_;
     supports_integrations = supports_integrations_;
     serverless_v2_features_support = serverless_v2_features_support_;
   }
    : db_engine_version)

let make_modify_custom_db_engine_version_message ?description:(description_ : description option)
    ?status:(status_ : custom_engine_version_status option) ~engine:(engine_ : custom_engine_name)
    ~engine_version:(engine_version_ : custom_engine_version) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     description = description_;
     status = status_;
   }
    : modify_custom_db_engine_version_message)

let make_db_cluster_capacity_info ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?pending_capacity:(pending_capacity_ : integer_optional option)
    ?current_capacity:(current_capacity_ : integer_optional option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     pending_capacity = pending_capacity_;
     current_capacity = current_capacity_;
     seconds_before_timeout = seconds_before_timeout_;
     timeout_action = timeout_action_;
   }
    : db_cluster_capacity_info)

let make_modify_current_db_cluster_capacity_message ?capacity:(capacity_ : integer_optional option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     capacity = capacity_;
     seconds_before_timeout = seconds_before_timeout_;
     timeout_action = timeout_action_;
   }
    : modify_current_db_cluster_capacity_message)

let make_certificate ?certificate_identifier:(certificate_identifier_ : string_ option)
    ?certificate_type:(certificate_type_ : string_ option)
    ?thumbprint:(thumbprint_ : string_ option) ?valid_from:(valid_from_ : t_stamp option)
    ?valid_till:(valid_till_ : t_stamp option) ?certificate_arn:(certificate_arn_ : string_ option)
    ?customer_override:(customer_override_ : boolean_optional option)
    ?customer_override_valid_till:(customer_override_valid_till_ : t_stamp option) () =
  ({
     certificate_identifier = certificate_identifier_;
     certificate_type = certificate_type_;
     thumbprint = thumbprint_;
     valid_from = valid_from_;
     valid_till = valid_till_;
     certificate_arn = certificate_arn_;
     customer_override = customer_override_;
     customer_override_valid_till = customer_override_valid_till_;
   }
    : certificate)

let make_modify_certificates_message
    ?certificate_identifier:(certificate_identifier_ : string_ option)
    ?remove_customer_override:(remove_customer_override_ : boolean_optional option) () =
  ({
     certificate_identifier = certificate_identifier_;
     remove_customer_override = remove_customer_override_;
   }
    : modify_certificates_message)

let make_modify_activity_stream_response ?kms_key_id:(kms_key_id_ : string_ option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?status:(status_ : activity_stream_status option) ?mode:(mode_ : activity_stream_mode option)
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ?policy_status:(policy_status_ : activity_stream_policy_status option) () =
  ({
     kms_key_id = kms_key_id_;
     kinesis_stream_name = kinesis_stream_name_;
     status = status_;
     mode = mode_;
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
     policy_status = policy_status_;
   }
    : modify_activity_stream_response)

let make_modify_activity_stream_request ?resource_arn:(resource_arn_ : string_ option)
    ?audit_policy_state:(audit_policy_state_ : audit_policy_state option) () =
  ({ resource_arn = resource_arn_; audit_policy_state = audit_policy_state_ }
    : modify_activity_stream_request)

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
    ~target_db_cluster_identifier:(target_db_cluster_identifier_ : db_cluster_identifier) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     target_db_cluster_identifier = target_db_cluster_identifier_;
     allow_data_loss = allow_data_loss_;
     switchover = switchover_;
   }
    : failover_global_cluster_message)

let make_failover_db_cluster_message
    ?target_db_instance_identifier:(target_db_instance_identifier_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     target_db_instance_identifier = target_db_instance_identifier_;
   }
    : failover_db_cluster_message)

let make_enable_http_endpoint_response ?resource_arn:(resource_arn_ : string_ option)
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_ option) () =
  ({ resource_arn = resource_arn_; http_endpoint_enabled = http_endpoint_enabled_ }
    : enable_http_endpoint_response)

let make_enable_http_endpoint_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : enable_http_endpoint_request)

let make_download_db_log_file_portion_details
    ?log_file_data:(log_file_data_ : sensitive_string option) ?marker:(marker_ : string_ option)
    ?additional_data_pending:(additional_data_pending_ : boolean_ option) () =
  ({
     log_file_data = log_file_data_;
     marker = marker_;
     additional_data_pending = additional_data_pending_;
   }
    : download_db_log_file_portion_details)

let make_download_db_log_file_portion_message ?marker:(marker_ : string_ option)
    ?number_of_lines:(number_of_lines_ : integer option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~log_file_name:(log_file_name_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     log_file_name = log_file_name_;
     marker = marker_;
     number_of_lines = number_of_lines_;
   }
    : download_db_log_file_portion_message)

let make_disable_http_endpoint_response ?resource_arn:(resource_arn_ : string_ option)
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_ option) () =
  ({ resource_arn = resource_arn_; http_endpoint_enabled = http_endpoint_enabled_ }
    : disable_http_endpoint_response)

let make_disable_http_endpoint_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : disable_http_endpoint_request)

let make_double_range ?from_:(from__ : double option) ?to_:(to__ : double option) () =
  ({ from_ = from__; to_ = to__ } : double_range)

let make_range ?from_:(from__ : integer option) ?to_:(to__ : integer option)
    ?step:(step_ : integer_optional option) () =
  ({ from_ = from__; to_ = to__; step = step_ } : range)

let make_valid_storage_options ?storage_type:(storage_type_ : string_ option)
    ?storage_size:(storage_size_ : range_list option)
    ?provisioned_iops:(provisioned_iops_ : range_list option)
    ?iops_to_storage_ratio:(iops_to_storage_ratio_ : double_range_list option)
    ?provisioned_storage_throughput:(provisioned_storage_throughput_ : range_list option)
    ?storage_throughput_to_iops_ratio:(storage_throughput_to_iops_ratio_ : double_range_list option)
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_ option) () =
  ({
     storage_type = storage_type_;
     storage_size = storage_size_;
     provisioned_iops = provisioned_iops_;
     iops_to_storage_ratio = iops_to_storage_ratio_;
     provisioned_storage_throughput = provisioned_storage_throughput_;
     storage_throughput_to_iops_ratio = storage_throughput_to_iops_ratio_;
     supports_storage_autoscaling = supports_storage_autoscaling_;
   }
    : valid_storage_options)

let make_valid_volume_options ?volume_name:(volume_name_ : string_ option)
    ?storage:(storage_ : valid_storage_options_list option) () =
  ({ volume_name = volume_name_; storage = storage_ } : valid_volume_options)

let make_valid_additional_storage_options
    ?supports_additional_storage_volumes:(supports_additional_storage_volumes_ : boolean_ option)
    ?volumes:(volumes_ : valid_volume_options_list option) () =
  ({
     supports_additional_storage_volumes = supports_additional_storage_volumes_;
     volumes = volumes_;
   }
    : valid_additional_storage_options)

let make_available_processor_feature ?name:(name_ : string_ option)
    ?default_value:(default_value_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option) () =
  ({ name = name_; default_value = default_value_; allowed_values = allowed_values_ }
    : available_processor_feature)

let make_valid_db_instance_modifications_message
    ?storage:(storage_ : valid_storage_options_list option)
    ?valid_processor_features:(valid_processor_features_ : available_processor_feature_list option)
    ?supports_dedicated_log_volume:(supports_dedicated_log_volume_ : boolean_ option)
    ?additional_storage:(additional_storage_ : valid_additional_storage_options option) () =
  ({
     storage = storage_;
     valid_processor_features = valid_processor_features_;
     supports_dedicated_log_volume = supports_dedicated_log_volume_;
     additional_storage = additional_storage_;
   }
    : valid_db_instance_modifications_message)

let make_describe_valid_db_instance_modifications_message
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ }
    : describe_valid_db_instance_modifications_message)

let make_tenant_databases_message ?marker:(marker_ : string_ option)
    ?tenant_databases:(tenant_databases_ : tenant_databases_list option) () =
  ({ marker = marker_; tenant_databases = tenant_databases_ } : tenant_databases_message)

let make_describe_tenant_databases_message
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?tenant_db_name:(tenant_db_name_ : string_ option) ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     tenant_db_name = tenant_db_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_tenant_databases_message)

let make_source_region ?region_name:(region_name_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?status:(status_ : string_ option)
    ?supports_db_instance_automated_backups_replication:
      (supports_db_instance_automated_backups_replication_ : boolean_ option) () =
  ({
     region_name = region_name_;
     endpoint = endpoint_;
     status = status_;
     supports_db_instance_automated_backups_replication =
       supports_db_instance_automated_backups_replication_;
   }
    : source_region)

let make_source_region_message ?marker:(marker_ : string_ option)
    ?source_regions:(source_regions_ : source_region_list option) () =
  ({ marker = marker_; source_regions = source_regions_ } : source_region_message)

let make_describe_source_regions_message ?region_name:(region_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option) () =
  ({ region_name = region_name_; max_records = max_records_; marker = marker_; filters = filters_ }
    : describe_source_regions_message)

let make_serverless_v2_platform_version_info
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option)
    ?serverless_v2_platform_version_description:
      (serverless_v2_platform_version_description_ : string_ option)
    ?engine:(engine_ : string_ option)
    ?serverless_v2_features_support:
      (serverless_v2_features_support_ : serverless_v2_features_support option)
    ?status:(status_ : string_ option) ?is_default:(is_default_ : boolean_ option) () =
  ({
     serverless_v2_platform_version = serverless_v2_platform_version_;
     serverless_v2_platform_version_description = serverless_v2_platform_version_description_;
     engine = engine_;
     serverless_v2_features_support = serverless_v2_features_support_;
     status = status_;
     is_default = is_default_;
   }
    : serverless_v2_platform_version_info)

let make_serverless_v2_platform_versions_message ?marker:(marker_ : string_ option)
    ?serverless_v2_platform_versions:
      (serverless_v2_platform_versions_ : serverless_v2_platform_version_list option) () =
  ({ marker = marker_; serverless_v2_platform_versions = serverless_v2_platform_versions_ }
    : serverless_v2_platform_versions_message)

let make_describe_serverless_v2_platform_versions_message
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option)
    ?engine:(engine_ : string_ option) ?filters:(filters_ : filter_list option)
    ?default_only:(default_only_ : boolean_optional option)
    ?include_all:(include_all_ : boolean_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     serverless_v2_platform_version = serverless_v2_platform_version_;
     engine = engine_;
     filters = filters_;
     default_only = default_only_;
     include_all = include_all_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_serverless_v2_platform_versions_message)

let make_reserved_db_instances_offering
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?duration:(duration_ : integer option)
    ?fixed_price:(fixed_price_ : double option) ?usage_price:(usage_price_ : double option)
    ?currency_code:(currency_code_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option) () =
  ({
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     db_instance_class = db_instance_class_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     currency_code = currency_code_;
     product_description = product_description_;
     offering_type = offering_type_;
     multi_a_z = multi_a_z_;
     recurring_charges = recurring_charges_;
   }
    : reserved_db_instances_offering)

let make_reserved_db_instances_offering_message ?marker:(marker_ : string_ option)
    ?reserved_db_instances_offerings:
      (reserved_db_instances_offerings_ : reserved_db_instances_offering_list option) () =
  ({ marker = marker_; reserved_db_instances_offerings = reserved_db_instances_offerings_ }
    : reserved_db_instances_offering_message)

let make_describe_reserved_db_instances_offerings_message
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?duration:(duration_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     db_instance_class = db_instance_class_;
     duration = duration_;
     product_description = product_description_;
     offering_type = offering_type_;
     multi_a_z = multi_a_z_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_db_instances_offerings_message)

let make_reserved_db_instance_message ?marker:(marker_ : string_ option)
    ?reserved_db_instances:(reserved_db_instances_ : reserved_db_instance_list option) () =
  ({ marker = marker_; reserved_db_instances = reserved_db_instances_ }
    : reserved_db_instance_message)

let make_describe_reserved_db_instances_message
    ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option) ?duration:(duration_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?lease_id:(lease_id_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     reserved_db_instance_id = reserved_db_instance_id_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     db_instance_class = db_instance_class_;
     duration = duration_;
     product_description = product_description_;
     offering_type = offering_type_;
     multi_a_z = multi_a_z_;
     lease_id = lease_id_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_db_instances_message)

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

let make_available_additional_storage_volumes_option
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_ option)
    ?supports_storage_throughput:(supports_storage_throughput_ : boolean_ option)
    ?supports_iops:(supports_iops_ : boolean_ option) ?storage_type:(storage_type_ : string_ option)
    ?min_storage_size:(min_storage_size_ : integer_optional option)
    ?max_storage_size:(max_storage_size_ : integer_optional option)
    ?min_iops:(min_iops_ : integer_optional option) ?max_iops:(max_iops_ : integer_optional option)
    ?min_iops_per_gib:(min_iops_per_gib_ : double_optional option)
    ?max_iops_per_gib:(max_iops_per_gib_ : double_optional option)
    ?min_storage_throughput:(min_storage_throughput_ : integer_optional option)
    ?max_storage_throughput:(max_storage_throughput_ : integer_optional option) () =
  ({
     supports_storage_autoscaling = supports_storage_autoscaling_;
     supports_storage_throughput = supports_storage_throughput_;
     supports_iops = supports_iops_;
     storage_type = storage_type_;
     min_storage_size = min_storage_size_;
     max_storage_size = max_storage_size_;
     min_iops = min_iops_;
     max_iops = max_iops_;
     min_iops_per_gib = min_iops_per_gib_;
     max_iops_per_gib = max_iops_per_gib_;
     min_storage_throughput = min_storage_throughput_;
     max_storage_throughput = max_storage_throughput_;
   }
    : available_additional_storage_volumes_option)

let make_orderable_db_instance_option ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?availability_zone_group:(availability_zone_group_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?multi_az_capable:(multi_az_capable_ : boolean_ option)
    ?read_replica_capable:(read_replica_capable_ : boolean_ option) ?vpc:(vpc_ : boolean_ option)
    ?supports_storage_encryption:(supports_storage_encryption_ : boolean_ option)
    ?storage_type:(storage_type_ : string_ option) ?supports_iops:(supports_iops_ : boolean_ option)
    ?supports_storage_throughput:(supports_storage_throughput_ : boolean_ option)
    ?supports_enhanced_monitoring:(supports_enhanced_monitoring_ : boolean_ option)
    ?supports_iam_database_authentication:(supports_iam_database_authentication_ : boolean_ option)
    ?supports_performance_insights:(supports_performance_insights_ : boolean_ option)
    ?min_storage_size:(min_storage_size_ : integer_optional option)
    ?max_storage_size:(max_storage_size_ : integer_optional option)
    ?min_iops_per_db_instance:(min_iops_per_db_instance_ : integer_optional option)
    ?max_iops_per_db_instance:(max_iops_per_db_instance_ : integer_optional option)
    ?min_iops_per_gib:(min_iops_per_gib_ : double_optional option)
    ?max_iops_per_gib:(max_iops_per_gib_ : double_optional option)
    ?min_storage_throughput_per_db_instance:
      (min_storage_throughput_per_db_instance_ : integer_optional option)
    ?max_storage_throughput_per_db_instance:
      (max_storage_throughput_per_db_instance_ : integer_optional option)
    ?min_storage_throughput_per_iops:(min_storage_throughput_per_iops_ : double_optional option)
    ?max_storage_throughput_per_iops:(max_storage_throughput_per_iops_ : double_optional option)
    ?available_processor_features:
      (available_processor_features_ : available_processor_feature_list option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_optional option)
    ?supports_kerberos_authentication:(supports_kerberos_authentication_ : boolean_optional option)
    ?outpost_capable:(outpost_capable_ : boolean_ option)
    ?supported_activity_stream_modes:
      (supported_activity_stream_modes_ : activity_stream_mode_list option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option)
    ?supported_network_types:(supported_network_types_ : string_list option)
    ?supports_clusters:(supports_clusters_ : boolean_ option)
    ?supports_dedicated_log_volume:(supports_dedicated_log_volume_ : boolean_ option)
    ?supports_additional_storage_volumes:
      (supports_additional_storage_volumes_ : boolean_optional option)
    ?supports_http_endpoint:(supports_http_endpoint_ : boolean_ option)
    ?available_additional_storage_volumes_options:
      (available_additional_storage_volumes_options_ :
         available_additional_storage_volumes_option_list option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_instance_class = db_instance_class_;
     license_model = license_model_;
     availability_zone_group = availability_zone_group_;
     availability_zones = availability_zones_;
     multi_az_capable = multi_az_capable_;
     read_replica_capable = read_replica_capable_;
     vpc = vpc_;
     supports_storage_encryption = supports_storage_encryption_;
     storage_type = storage_type_;
     supports_iops = supports_iops_;
     supports_storage_throughput = supports_storage_throughput_;
     supports_enhanced_monitoring = supports_enhanced_monitoring_;
     supports_iam_database_authentication = supports_iam_database_authentication_;
     supports_performance_insights = supports_performance_insights_;
     min_storage_size = min_storage_size_;
     max_storage_size = max_storage_size_;
     min_iops_per_db_instance = min_iops_per_db_instance_;
     max_iops_per_db_instance = max_iops_per_db_instance_;
     min_iops_per_gib = min_iops_per_gib_;
     max_iops_per_gib = max_iops_per_gib_;
     min_storage_throughput_per_db_instance = min_storage_throughput_per_db_instance_;
     max_storage_throughput_per_db_instance = max_storage_throughput_per_db_instance_;
     min_storage_throughput_per_iops = min_storage_throughput_per_iops_;
     max_storage_throughput_per_iops = max_storage_throughput_per_iops_;
     available_processor_features = available_processor_features_;
     supported_engine_modes = supported_engine_modes_;
     supports_storage_autoscaling = supports_storage_autoscaling_;
     supports_kerberos_authentication = supports_kerberos_authentication_;
     outpost_capable = outpost_capable_;
     supported_activity_stream_modes = supported_activity_stream_modes_;
     supports_global_databases = supports_global_databases_;
     supported_network_types = supported_network_types_;
     supports_clusters = supports_clusters_;
     supports_dedicated_log_volume = supports_dedicated_log_volume_;
     supports_additional_storage_volumes = supports_additional_storage_volumes_;
     supports_http_endpoint = supports_http_endpoint_;
     available_additional_storage_volumes_options = available_additional_storage_volumes_options_;
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
    ?license_model:(license_model_ : string_ option)
    ?availability_zone_group:(availability_zone_group_ : string_ option)
    ?vpc:(vpc_ : boolean_optional option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~engine:(engine_ : string_) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     db_instance_class = db_instance_class_;
     license_model = license_model_;
     availability_zone_group = availability_zone_group_;
     vpc = vpc_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_orderable_db_instance_options_message)

let make_option_groups ?option_groups_list:(option_groups_list_ : option_groups_list option)
    ?marker:(marker_ : string_ option) () =
  ({ option_groups_list = option_groups_list_; marker = marker_ } : option_groups)

let make_describe_option_groups_message ?option_group_name:(option_group_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?engine_name:(engine_name_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option) () =
  ({
     option_group_name = option_group_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
     engine_name = engine_name_;
     major_engine_version = major_engine_version_;
   }
    : describe_option_groups_message)

let make_option_version ?version:(version_ : string_ option)
    ?is_default:(is_default_ : boolean_ option) () =
  ({ version = version_; is_default = is_default_ } : option_version)

let make_minimum_engine_version_per_allowed_value ?allowed_value:(allowed_value_ : string_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option) () =
  ({ allowed_value = allowed_value_; minimum_engine_version = minimum_engine_version_ }
    : minimum_engine_version_per_allowed_value)

let make_option_group_option_setting ?setting_name:(setting_name_ : string_ option)
    ?setting_description:(setting_description_ : string_ option)
    ?default_value:(default_value_ : string_ option) ?apply_type:(apply_type_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option) ?is_required:(is_required_ : boolean_ option)
    ?minimum_engine_version_per_allowed_value:
      (minimum_engine_version_per_allowed_value_ :
         minimum_engine_version_per_allowed_value_list option) () =
  ({
     setting_name = setting_name_;
     setting_description = setting_description_;
     default_value = default_value_;
     apply_type = apply_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     is_required = is_required_;
     minimum_engine_version_per_allowed_value = minimum_engine_version_per_allowed_value_;
   }
    : option_group_option_setting)

let make_option_group_option ?name:(name_ : string_ option)
    ?description:(description_ : string_ option) ?engine_name:(engine_name_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?minimum_required_minor_engine_version:(minimum_required_minor_engine_version_ : string_ option)
    ?port_required:(port_required_ : boolean_ option)
    ?default_port:(default_port_ : integer_optional option)
    ?options_depended_on:(options_depended_on_ : options_depended_on option)
    ?options_conflicts_with:(options_conflicts_with_ : options_conflicts_with option)
    ?persistent:(persistent_ : boolean_ option) ?permanent:(permanent_ : boolean_ option)
    ?requires_auto_minor_engine_version_upgrade:
      (requires_auto_minor_engine_version_upgrade_ : boolean_ option)
    ?vpc_only:(vpc_only_ : boolean_ option)
    ?supports_option_version_downgrade:
      (supports_option_version_downgrade_ : boolean_optional option)
    ?option_group_option_settings:
      (option_group_option_settings_ : option_group_option_settings_list option)
    ?option_group_option_versions:
      (option_group_option_versions_ : option_group_option_versions_list option)
    ?copyable_cross_account:(copyable_cross_account_ : boolean_optional option) () =
  ({
     name = name_;
     description = description_;
     engine_name = engine_name_;
     major_engine_version = major_engine_version_;
     minimum_required_minor_engine_version = minimum_required_minor_engine_version_;
     port_required = port_required_;
     default_port = default_port_;
     options_depended_on = options_depended_on_;
     options_conflicts_with = options_conflicts_with_;
     persistent = persistent_;
     permanent = permanent_;
     requires_auto_minor_engine_version_upgrade = requires_auto_minor_engine_version_upgrade_;
     vpc_only = vpc_only_;
     supports_option_version_downgrade = supports_option_version_downgrade_;
     option_group_option_settings = option_group_option_settings_;
     option_group_option_versions = option_group_option_versions_;
     copyable_cross_account = copyable_cross_account_;
   }
    : option_group_option)

let make_option_group_options_message
    ?option_group_options:(option_group_options_ : option_group_options_list option)
    ?marker:(marker_ : string_ option) () =
  ({ option_group_options = option_group_options_; marker = marker_ }
    : option_group_options_message)

let make_describe_option_group_options_message
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~engine_name:(engine_name_ : string_) () =
  ({
     engine_name = engine_name_;
     major_engine_version = major_engine_version_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_option_group_options_message)

let make_describe_integrations_response ?marker:(marker_ : marker option)
    ?integrations:(integrations_ : integration_list option) () =
  ({ marker = marker_; integrations = integrations_ } : describe_integrations_response)

let make_describe_integrations_message
    ?integration_identifier:(integration_identifier_ : integration_identifier option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : marker option) () =
  ({
     integration_identifier = integration_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_integrations_message)

let make_global_clusters_message ?marker:(marker_ : string_ option)
    ?global_clusters:(global_clusters_ : global_cluster_list option) () =
  ({ marker = marker_; global_clusters = global_clusters_ } : global_clusters_message)

let make_describe_global_clusters_message
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_global_clusters_message)

let make_export_tasks_message ?marker:(marker_ : string_ option)
    ?export_tasks:(export_tasks_ : export_tasks_list option) () =
  ({ marker = marker_; export_tasks = export_tasks_ } : export_tasks_message)

let make_describe_export_tasks_message
    ?export_task_identifier:(export_task_identifier_ : string_ option)
    ?source_arn:(source_arn_ : string_ option) ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : max_records option)
    ?source_type:(source_type_ : export_source_type option) () =
  ({
     export_task_identifier = export_task_identifier_;
     source_arn = source_arn_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
     source_type = source_type_;
   }
    : describe_export_tasks_message)

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

let make_db_snapshot_tenant_database
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?engine_name:(engine_name_ : string_ option) ?snapshot_type:(snapshot_type_ : string_ option)
    ?tenant_database_create_time:(tenant_database_create_time_ : t_stamp option)
    ?tenant_db_name:(tenant_db_name_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?tenant_database_resource_id:(tenant_database_resource_id_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?db_snapshot_tenant_database_ar_n:(db_snapshot_tenant_database_ar_n_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
     dbi_resource_id = dbi_resource_id_;
     engine_name = engine_name_;
     snapshot_type = snapshot_type_;
     tenant_database_create_time = tenant_database_create_time_;
     tenant_db_name = tenant_db_name_;
     master_username = master_username_;
     tenant_database_resource_id = tenant_database_resource_id_;
     character_set_name = character_set_name_;
     db_snapshot_tenant_database_ar_n = db_snapshot_tenant_database_ar_n_;
     nchar_character_set_name = nchar_character_set_name_;
     tag_list = tag_list_;
   }
    : db_snapshot_tenant_database)

let make_db_snapshot_tenant_databases_message ?marker:(marker_ : string_ option)
    ?db_snapshot_tenant_databases:
      (db_snapshot_tenant_databases_ : db_snapshot_tenant_databases_list option) () =
  ({ marker = marker_; db_snapshot_tenant_databases = db_snapshot_tenant_databases_ }
    : db_snapshot_tenant_databases_message)

let make_describe_db_snapshot_tenant_databases_message
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
     snapshot_type = snapshot_type_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     dbi_resource_id = dbi_resource_id_;
   }
    : describe_db_snapshot_tenant_databases_message)

let make_db_snapshot_message ?marker:(marker_ : string_ option)
    ?db_snapshots:(db_snapshots_ : db_snapshot_list option) () =
  ({ marker = marker_; db_snapshots = db_snapshots_ } : db_snapshot_message)

let make_describe_db_snapshots_message
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?filters:(filters_ : filter_list option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?include_shared:(include_shared_ : boolean_ option)
    ?include_public:(include_public_ : boolean_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
     snapshot_type = snapshot_type_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     include_shared = include_shared_;
     include_public = include_public_;
     dbi_resource_id = dbi_resource_id_;
   }
    : describe_db_snapshots_message)

let make_describe_db_snapshot_attributes_message
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({ db_snapshot_identifier = db_snapshot_identifier_ } : describe_db_snapshot_attributes_message)

let make_describe_db_shard_groups_response
    ?db_shard_groups:(db_shard_groups_ : db_shard_groups_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_shard_groups = db_shard_groups_; marker = marker_ } : describe_db_shard_groups_response)

let make_describe_db_shard_groups_message
    ?db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) () =
  ({
     db_shard_group_identifier = db_shard_group_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_shard_groups_message)

let make_db_security_group_message ?marker:(marker_ : string_ option)
    ?db_security_groups:(db_security_groups_ : db_security_groups option) () =
  ({ marker = marker_; db_security_groups = db_security_groups_ } : db_security_group_message)

let make_describe_db_security_groups_message
    ?db_security_group_name:(db_security_group_name_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_security_group_name = db_security_group_name_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_security_groups_message)

let make_db_recommendations_message
    ?db_recommendations:(db_recommendations_ : db_recommendation_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_recommendations = db_recommendations_; marker = marker_ } : db_recommendations_message)

let make_describe_db_recommendations_message
    ?last_updated_after:(last_updated_after_ : t_stamp option)
    ?last_updated_before:(last_updated_before_ : t_stamp option) ?locale:(locale_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     last_updated_after = last_updated_after_;
     last_updated_before = last_updated_before_;
     locale = locale_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_recommendations_message)

let make_describe_db_proxy_targets_response ?targets:(targets_ : target_list option)
    ?marker:(marker_ : string_ option) () =
  ({ targets = targets_; marker = marker_ } : describe_db_proxy_targets_response)

let make_describe_db_proxy_targets_request
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) ~db_proxy_name:(db_proxy_name_ : db_proxy_name)
    () =
  ({
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_proxy_targets_request)

let make_describe_db_proxy_target_groups_response
    ?target_groups:(target_groups_ : target_group_list option) ?marker:(marker_ : string_ option) ()
    =
  ({ target_groups = target_groups_; marker = marker_ } : describe_db_proxy_target_groups_response)

let make_describe_db_proxy_target_groups_request
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) ~db_proxy_name:(db_proxy_name_ : db_proxy_name)
    () =
  ({
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_proxy_target_groups_request)

let make_describe_db_proxy_endpoints_response
    ?db_proxy_endpoints:(db_proxy_endpoints_ : db_proxy_endpoint_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_proxy_endpoints = db_proxy_endpoints_; marker = marker_ }
    : describe_db_proxy_endpoints_response)

let make_describe_db_proxy_endpoints_request ?db_proxy_name:(db_proxy_name_ : db_proxy_name option)
    ?db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) () =
  ({
     db_proxy_name = db_proxy_name_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_proxy_endpoints_request)

let make_describe_db_proxies_response ?db_proxies:(db_proxies_ : db_proxy_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_proxies = db_proxies_; marker = marker_ } : describe_db_proxies_response)

let make_describe_db_proxies_request ?db_proxy_name:(db_proxy_name_ : db_proxy_name option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) () =
  ({
     db_proxy_name = db_proxy_name_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_proxies_request)

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

let make_supported_engine_lifecycle
    ~lifecycle_support_name:(lifecycle_support_name_ : lifecycle_support_name)
    ~lifecycle_support_start_date:(lifecycle_support_start_date_ : t_stamp)
    ~lifecycle_support_end_date:(lifecycle_support_end_date_ : t_stamp) () =
  ({
     lifecycle_support_name = lifecycle_support_name_;
     lifecycle_support_start_date = lifecycle_support_start_date_;
     lifecycle_support_end_date = lifecycle_support_end_date_;
   }
    : supported_engine_lifecycle)

let make_db_major_engine_version ?engine:(engine_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?supported_engine_lifecycles:
      (supported_engine_lifecycles_ : supported_engine_lifecycle_list option) () =
  ({
     engine = engine_;
     major_engine_version = major_engine_version_;
     supported_engine_lifecycles = supported_engine_lifecycles_;
   }
    : db_major_engine_version)

let make_describe_db_major_engine_versions_response
    ?db_major_engine_versions:(db_major_engine_versions_ : db_major_engine_versions_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_major_engine_versions = db_major_engine_versions_; marker = marker_ }
    : describe_db_major_engine_versions_response)

let make_describe_db_major_engine_versions_request ?engine:(engine_ : engine option)
    ?major_engine_version:(major_engine_version_ : major_engine_version option)
    ?marker:(marker_ : marker option) ?max_records:(max_records_ : max_records option) () =
  ({
     engine = engine_;
     major_engine_version = major_engine_version_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_db_major_engine_versions_request)

let make_describe_db_log_files_details ?log_file_name:(log_file_name_ : string_ option)
    ?last_written:(last_written_ : long option) ?size:(size_ : long option) () =
  ({ log_file_name = log_file_name_; last_written = last_written_; size = size_ }
    : describe_db_log_files_details)

let make_describe_db_log_files_response
    ?describe_db_log_files:(describe_db_log_files_ : describe_db_log_files_list option)
    ?marker:(marker_ : string_ option) () =
  ({ describe_db_log_files = describe_db_log_files_; marker = marker_ }
    : describe_db_log_files_response)

let make_describe_db_log_files_message ?filename_contains:(filename_contains_ : string_ option)
    ?file_last_written:(file_last_written_ : long option) ?file_size:(file_size_ : long option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~db_instance_identifier:(db_instance_identifier_ : string_)
    () =
  ({
     db_instance_identifier = db_instance_identifier_;
     filename_contains = filename_contains_;
     file_last_written = file_last_written_;
     file_size = file_size_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_log_files_message)

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

let make_db_instance_automated_backup_message ?marker:(marker_ : string_ option)
    ?db_instance_automated_backups:
      (db_instance_automated_backups_ : db_instance_automated_backup_list option) () =
  ({ marker = marker_; db_instance_automated_backups = db_instance_automated_backups_ }
    : db_instance_automated_backup_message)

let make_describe_db_instance_automated_backups_message
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option)
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option) () =
  ({
     dbi_resource_id = dbi_resource_id_;
     db_instance_identifier = db_instance_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
   }
    : describe_db_instance_automated_backups_message)

let make_db_engine_version_message ?marker:(marker_ : string_ option)
    ?db_engine_versions:(db_engine_versions_ : db_engine_version_list option) () =
  ({ marker = marker_; db_engine_versions = db_engine_versions_ } : db_engine_version_message)

let make_describe_db_engine_versions_message ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ?default_only:(default_only_ : boolean_ option)
    ?list_supported_character_sets:(list_supported_character_sets_ : boolean_optional option)
    ?list_supported_timezones:(list_supported_timezones_ : boolean_optional option)
    ?include_all:(include_all_ : boolean_optional option) () =
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
     include_all = include_all_;
   }
    : describe_db_engine_versions_message)

let make_db_cluster_snapshot ?availability_zones:(availability_zones_ : availability_zones option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?engine:(engine_ : string_ option) ?engine_mode:(engine_mode_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option) ?status:(status_ : string_ option)
    ?port:(port_ : integer option) ?vpc_id:(vpc_id_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?master_username:(master_username_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?db_cluster_snapshot_arn:(db_cluster_snapshot_arn_ : string_ option)
    ?source_db_cluster_snapshot_arn:(source_db_cluster_snapshot_arn_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?tag_list:(tag_list_ : tag_list option) ?storage_type:(storage_type_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?db_system_id:(db_system_id_ : string_ option) () =
  ({
     availability_zones = availability_zones_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     snapshot_create_time = snapshot_create_time_;
     engine = engine_;
     engine_mode = engine_mode_;
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
     storage_encryption_type = storage_encryption_type_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     kms_key_id = kms_key_id_;
     db_cluster_snapshot_arn = db_cluster_snapshot_arn_;
     source_db_cluster_snapshot_arn = source_db_cluster_snapshot_arn_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     tag_list = tag_list_;
     storage_type = storage_type_;
     storage_throughput = storage_throughput_;
     db_cluster_resource_id = db_cluster_resource_id_;
     db_system_id = db_system_id_;
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
    ?include_public:(include_public_ : boolean_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     snapshot_type = snapshot_type_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     include_shared = include_shared_;
     include_public = include_public_;
     db_cluster_resource_id = db_cluster_resource_id_;
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
    ?marker:(marker_ : string_ option) ?include_shared:(include_shared_ : boolean_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     include_shared = include_shared_;
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

let make_db_cluster_backtrack ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?backtrack_identifier:(backtrack_identifier_ : string_ option)
    ?backtrack_to:(backtrack_to_ : t_stamp option)
    ?backtracked_from:(backtracked_from_ : t_stamp option)
    ?backtrack_request_creation_time:(backtrack_request_creation_time_ : t_stamp option)
    ?status:(status_ : string_ option) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     backtrack_identifier = backtrack_identifier_;
     backtrack_to = backtrack_to_;
     backtracked_from = backtracked_from_;
     backtrack_request_creation_time = backtrack_request_creation_time_;
     status = status_;
   }
    : db_cluster_backtrack)

let make_db_cluster_backtrack_message ?marker:(marker_ : string_ option)
    ?db_cluster_backtracks:(db_cluster_backtracks_ : db_cluster_backtrack_list option) () =
  ({ marker = marker_; db_cluster_backtracks = db_cluster_backtracks_ }
    : db_cluster_backtrack_message)

let make_describe_db_cluster_backtracks_message
    ?backtrack_identifier:(backtrack_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ~db_cluster_identifier:(db_cluster_identifier_ : string_) ()
    =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     backtrack_identifier = backtrack_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_cluster_backtracks_message)

let make_db_cluster_automated_backup ?engine:(engine_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?db_cluster_automated_backups_arn:(db_cluster_automated_backups_arn_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?restore_window:(restore_window_ : restore_window option)
    ?master_username:(master_username_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?region:(region_ : string_ option) ?license_model:(license_model_ : string_ option)
    ?status:(status_ : string_ option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?port:(port_ : integer option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?tag_list:(tag_list_ : tag_list option) () =
  ({
     engine = engine_;
     vpc_id = vpc_id_;
     db_cluster_automated_backups_arn = db_cluster_automated_backups_arn_;
     db_cluster_identifier = db_cluster_identifier_;
     restore_window = restore_window_;
     master_username = master_username_;
     db_cluster_resource_id = db_cluster_resource_id_;
     region = region_;
     license_model = license_model_;
     status = status_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     cluster_create_time = cluster_create_time_;
     storage_encrypted = storage_encrypted_;
     storage_encryption_type = storage_encryption_type_;
     allocated_storage = allocated_storage_;
     engine_version = engine_version_;
     db_cluster_arn = db_cluster_arn_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     engine_mode = engine_mode_;
     availability_zones = availability_zones_;
     port = port_;
     kms_key_id = kms_key_id_;
     storage_type = storage_type_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     tag_list = tag_list_;
   }
    : db_cluster_automated_backup)

let make_db_cluster_automated_backup_message ?marker:(marker_ : string_ option)
    ?db_cluster_automated_backups:
      (db_cluster_automated_backups_ : db_cluster_automated_backup_list option) () =
  ({ marker = marker_; db_cluster_automated_backups = db_cluster_automated_backups_ }
    : db_cluster_automated_backup_message)

let make_describe_db_cluster_automated_backups_message
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     db_cluster_resource_id = db_cluster_resource_id_;
     db_cluster_identifier = db_cluster_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_db_cluster_automated_backups_message)

let make_certificate_message
    ?default_certificate_for_new_launches:(default_certificate_for_new_launches_ : string_ option)
    ?certificates:(certificates_ : certificate_list option) ?marker:(marker_ : string_ option) () =
  ({
     default_certificate_for_new_launches = default_certificate_for_new_launches_;
     certificates = certificates_;
     marker = marker_;
   }
    : certificate_message)

let make_describe_certificates_message
    ?certificate_identifier:(certificate_identifier_ : string_ option)
    ?filters:(filters_ : filter_list option) ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) () =
  ({
     certificate_identifier = certificate_identifier_;
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_certificates_message)

let make_describe_blue_green_deployments_response
    ?blue_green_deployments:(blue_green_deployments_ : blue_green_deployment_list option)
    ?marker:(marker_ : string_ option) () =
  ({ blue_green_deployments = blue_green_deployments_; marker = marker_ }
    : describe_blue_green_deployments_response)

let make_describe_blue_green_deployments_request
    ?blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier option)
    ?filters:(filters_ : filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : max_records option) () =
  ({
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_blue_green_deployments_request)

let make_describe_account_attributes_message () = (() : unit)
let make_deregister_db_proxy_targets_response () = (() : unit)

let make_deregister_db_proxy_targets_request
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ?db_instance_identifiers:(db_instance_identifiers_ : string_list option)
    ?db_cluster_identifiers:(db_cluster_identifiers_ : string_list option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
     db_instance_identifiers = db_instance_identifiers_;
     db_cluster_identifiers = db_cluster_identifiers_;
   }
    : deregister_db_proxy_targets_request)

let make_delete_tenant_database_message
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~tenant_db_name:(tenant_db_name_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     tenant_db_name = tenant_db_name_;
     skip_final_snapshot = skip_final_snapshot_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
   }
    : delete_tenant_database_message)

let make_delete_option_group_message ~option_group_name:(option_group_name_ : string_) () =
  ({ option_group_name = option_group_name_ } : delete_option_group_message)

let make_delete_integration_message
    ~integration_identifier:(integration_identifier_ : integration_identifier) () =
  ({ integration_identifier = integration_identifier_ } : delete_integration_message)

let make_delete_global_cluster_message
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({ global_cluster_identifier = global_cluster_identifier_ } : delete_global_cluster_message)

let make_delete_event_subscription_message ~subscription_name:(subscription_name_ : string_) () =
  ({ subscription_name = subscription_name_ } : delete_event_subscription_message)

let make_delete_db_subnet_group_message ~db_subnet_group_name:(db_subnet_group_name_ : string_) () =
  ({ db_subnet_group_name = db_subnet_group_name_ } : delete_db_subnet_group_message)

let make_delete_db_snapshot_message ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({ db_snapshot_identifier = db_snapshot_identifier_ } : delete_db_snapshot_message)

let make_delete_db_shard_group_message
    ~db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier) () =
  ({ db_shard_group_identifier = db_shard_group_identifier_ } : delete_db_shard_group_message)

let make_delete_db_security_group_message
    ~db_security_group_name:(db_security_group_name_ : string_) () =
  ({ db_security_group_name = db_security_group_name_ } : delete_db_security_group_message)

let make_delete_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : delete_db_proxy_endpoint_response)

let make_delete_db_proxy_endpoint_request
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name) () =
  ({ db_proxy_endpoint_name = db_proxy_endpoint_name_ } : delete_db_proxy_endpoint_request)

let make_delete_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : delete_db_proxy_response)

let make_delete_db_proxy_request ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({ db_proxy_name = db_proxy_name_ } : delete_db_proxy_request)

let make_delete_db_parameter_group_message
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : delete_db_parameter_group_message)

let make_delete_db_instance_automated_backup_message
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option) () =
  ({
     dbi_resource_id = dbi_resource_id_;
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
   }
    : delete_db_instance_automated_backup_message)

let make_delete_db_instance_message ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?delete_automated_backups:(delete_automated_backups_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     delete_automated_backups = delete_automated_backups_;
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

let make_delete_db_cluster_endpoint_message
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_) () =
  ({ db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_ }
    : delete_db_cluster_endpoint_message)

let make_delete_db_cluster_automated_backup_message
    ~db_cluster_resource_id:(db_cluster_resource_id_ : string_) () =
  ({ db_cluster_resource_id = db_cluster_resource_id_ }
    : delete_db_cluster_automated_backup_message)

let make_delete_db_cluster_message ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?delete_automated_backups:(delete_automated_backups_ : boolean_optional option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     delete_automated_backups = delete_automated_backups_;
   }
    : delete_db_cluster_message)

let make_delete_custom_db_engine_version_message ~engine:(engine_ : custom_engine_name)
    ~engine_version:(engine_version_ : custom_engine_version) () =
  ({ engine = engine_; engine_version = engine_version_ } : delete_custom_db_engine_version_message)

let make_delete_blue_green_deployment_response
    ?blue_green_deployment:(blue_green_deployment_ : blue_green_deployment option) () =
  ({ blue_green_deployment = blue_green_deployment_ } : delete_blue_green_deployment_response)

let make_delete_blue_green_deployment_request
    ?delete_target:(delete_target_ : boolean_optional option)
    ~blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier) () =
  ({
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
     delete_target = delete_target_;
   }
    : delete_blue_green_deployment_request)

let make_create_tenant_database_message
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option) ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~tenant_db_name:(tenant_db_name_ : string_) ~master_username:(master_username_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     tenant_db_name = tenant_db_name_;
     master_username = master_username_;
     master_user_password = master_user_password_;
     character_set_name = character_set_name_;
     nchar_character_set_name = nchar_character_set_name_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     tags = tags_;
   }
    : create_tenant_database_message)

let make_create_option_group_message ?tags:(tags_ : tag_list option)
    ~option_group_name:(option_group_name_ : string_) ~engine_name:(engine_name_ : string_)
    ~major_engine_version:(major_engine_version_ : string_)
    ~option_group_description:(option_group_description_ : string_) () =
  ({
     option_group_name = option_group_name_;
     engine_name = engine_name_;
     major_engine_version = major_engine_version_;
     option_group_description = option_group_description_;
     tags = tags_;
   }
    : create_option_group_message)

let make_create_integration_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?tags:(tags_ : tag_list option) ?data_filter:(data_filter_ : data_filter option)
    ?description:(description_ : integration_description option)
    ~source_arn:(source_arn_ : source_arn) ~target_arn:(target_arn_ : arn)
    ~integration_name:(integration_name_ : integration_name) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     data_filter = data_filter_;
     description = description_;
   }
    : create_integration_message)

let make_create_global_cluster_message
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     global_cluster_identifier = global_cluster_identifier_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     engine = engine_;
     engine_version = engine_version_;
     engine_lifecycle_support = engine_lifecycle_support_;
     deletion_protection = deletion_protection_;
     database_name = database_name_;
     storage_encrypted = storage_encrypted_;
     tags = tags_;
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

let make_create_db_snapshot_message ?tags:(tags_ : tag_list option)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
     tags = tags_;
   }
    : create_db_snapshot_message)

let make_create_db_shard_group_message
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ?min_ac_u:(min_ac_u_ : double_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ~db_shard_group_identifier:(db_shard_group_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~max_ac_u:(max_ac_u_ : double_optional) () =
  ({
     db_shard_group_identifier = db_shard_group_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     compute_redundancy = compute_redundancy_;
     max_ac_u = max_ac_u_;
     min_ac_u = min_ac_u_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
   }
    : create_db_shard_group_message)

let make_create_db_security_group_message ?tags:(tags_ : tag_list option)
    ~db_security_group_name:(db_security_group_name_ : string_)
    ~db_security_group_description:(db_security_group_description_ : string_) () =
  ({
     db_security_group_name = db_security_group_name_;
     db_security_group_description = db_security_group_description_;
     tags = tags_;
   }
    : create_db_security_group_message)

let make_create_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : create_db_proxy_endpoint_response)

let make_create_db_proxy_endpoint_request
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?target_role:(target_role_ : db_proxy_endpoint_target_role option)
    ?tags:(tags_ : tag_list option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name)
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : string_list) () =
  ({
     db_proxy_name = db_proxy_name_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     target_role = target_role_;
     tags = tags_;
     endpoint_network_type = endpoint_network_type_;
   }
    : create_db_proxy_endpoint_request)

let make_create_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : create_db_proxy_response)

let make_create_db_proxy_request
    ?default_auth_scheme:(default_auth_scheme_ : default_auth_scheme option)
    ?auth:(auth_ : user_auth_config_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?require_tl_s:(require_tl_s_ : boolean_ option)
    ?idle_client_timeout:(idle_client_timeout_ : integer_optional option)
    ?debug_logging:(debug_logging_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?target_connection_network_type:
      (target_connection_network_type_ : target_connection_network_type option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) ~engine_family:(engine_family_ : engine_family)
    ~role_arn:(role_arn_ : arn) ~vpc_subnet_ids:(vpc_subnet_ids_ : string_list) () =
  ({
     db_proxy_name = db_proxy_name_;
     engine_family = engine_family_;
     default_auth_scheme = default_auth_scheme_;
     auth = auth_;
     role_arn = role_arn_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     require_tl_s = require_tl_s_;
     idle_client_timeout = idle_client_timeout_;
     debug_logging = debug_logging_;
     tags = tags_;
     endpoint_network_type = endpoint_network_type_;
     target_connection_network_type = target_connection_network_type_;
   }
    : create_db_proxy_request)

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

let make_create_db_instance_read_replica_message
    ?source_db_instance_identifier:(source_db_instance_identifier_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option) ?port:(port_ : integer_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?iops:(iops_ : integer_optional option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?storage_type:(storage_type_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain_fqdn:(domain_fqdn_ : string_ option) ?domain_ou:(domain_ou_ : string_ option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?backup_target:(backup_target_ : string_ option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?upgrade_storage_config:(upgrade_storage_config_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_instance_identifier = db_instance_identifier_;
     source_db_instance_identifier = source_db_instance_identifier_;
     db_instance_class = db_instance_class_;
     availability_zone = availability_zone_;
     port = port_;
     multi_a_z = multi_a_z_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     iops = iops_;
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     db_parameter_group_name = db_parameter_group_name_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     db_subnet_group_name = db_subnet_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     storage_type = storage_type_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     kms_key_id = kms_key_id_;
     pre_signed_url = pre_signed_url_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     use_default_processor_features = use_default_processor_features_;
     deletion_protection = deletion_protection_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     domain_fqdn = domain_fqdn_;
     domain_ou = domain_ou_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_dns_ips = domain_dns_ips_;
     replica_mode = replica_mode_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     network_type = network_type_;
     max_allocated_storage = max_allocated_storage_;
     backup_target = backup_target_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     allocated_storage = allocated_storage_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     dedicated_log_volume = dedicated_log_volume_;
     upgrade_storage_config = upgrade_storage_config_;
     ca_certificate_identifier = ca_certificate_identifier_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
   }
    : create_db_instance_read_replica_message)

let make_create_db_instance_message ?db_name:(db_name_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?master_username:(master_username_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
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
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?domain:(domain_ : string_ option)
    ?domain_fqdn:(domain_fqdn_ : string_ option) ?domain_ou:(domain_ou_ : string_ option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?timezone:(timezone_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option) ?backup_target:(backup_target_ : string_ option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~db_instance_class:(db_instance_class_ : string_) ~engine:(engine_ : string_) () =
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
     storage_throughput = storage_throughput_;
     option_group_name = option_group_name_;
     character_set_name = character_set_name_;
     nchar_character_set_name = nchar_character_set_name_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     db_cluster_identifier = db_cluster_identifier_;
     storage_type = storage_type_;
     tde_credential_arn = tde_credential_arn_;
     tde_credential_password = tde_credential_password_;
     storage_encrypted = storage_encrypted_;
     kms_key_id = kms_key_id_;
     domain = domain_;
     domain_fqdn = domain_fqdn_;
     domain_ou = domain_ou_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_dns_ips = domain_dns_ips_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     domain_iam_role_name = domain_iam_role_name_;
     promotion_tier = promotion_tier_;
     timezone = timezone_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     processor_features = processor_features_;
     deletion_protection = deletion_protection_;
     max_allocated_storage = max_allocated_storage_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     network_type = network_type_;
     backup_target = backup_target_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     db_system_id = db_system_id_;
     ca_certificate_identifier = ca_certificate_identifier_;
     manage_master_user_password = manage_master_user_password_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     multi_tenant = multi_tenant_;
     dedicated_log_volume = dedicated_log_volume_;
     engine_lifecycle_support = engine_lifecycle_support_;
     additional_storage_volumes = additional_storage_volumes_;
     tag_specifications = tag_specifications_;
     master_user_authentication_type = master_user_authentication_type_;
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
    ?database_name:(database_name_ : string_ option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?port:(port_ : integer_optional option)
    ?master_username:(master_username_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?tags:(tags_ : tag_list option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?enable_http_endpoint:(enable_http_endpoint_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain:(domain_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?enable_global_write_forwarding:(enable_global_write_forwarding_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?enable_limitless_database:(enable_limitless_database_ : boolean_optional option)
    ?cluster_scalability_type:(cluster_scalability_type_ : cluster_scalability_type option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?enable_local_write_forwarding:(enable_local_write_forwarding_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ?with_express_configuration:(with_express_configuration_ : boolean_optional option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) ~engine:(engine_ : string_) () =
  ({
     availability_zones = availability_zones_;
     backup_retention_period = backup_retention_period_;
     character_set_name = character_set_name_;
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
     backtrack_window = backtrack_window_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     engine_mode = engine_mode_;
     scaling_configuration = scaling_configuration_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     db_cluster_instance_class = db_cluster_instance_class_;
     allocated_storage = allocated_storage_;
     storage_type = storage_type_;
     iops = iops_;
     publicly_accessible = publicly_accessible_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     deletion_protection = deletion_protection_;
     global_cluster_identifier = global_cluster_identifier_;
     enable_http_endpoint = enable_http_endpoint_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain = domain_;
     domain_iam_role_name = domain_iam_role_name_;
     enable_global_write_forwarding = enable_global_write_forwarding_;
     network_type = network_type_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     monitoring_interval = monitoring_interval_;
     monitoring_role_arn = monitoring_role_arn_;
     database_insights_mode = database_insights_mode_;
     enable_performance_insights = enable_performance_insights_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     enable_limitless_database = enable_limitless_database_;
     cluster_scalability_type = cluster_scalability_type_;
     db_system_id = db_system_id_;
     manage_master_user_password = manage_master_user_password_;
     enable_local_write_forwarding = enable_local_write_forwarding_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     ca_certificate_identifier = ca_certificate_identifier_;
     engine_lifecycle_support = engine_lifecycle_support_;
     tag_specifications = tag_specifications_;
     master_user_authentication_type = master_user_authentication_type_;
     with_express_configuration = with_express_configuration_;
   }
    : create_db_cluster_message)

let make_create_custom_db_engine_version_message
    ?database_installation_files_s3_bucket_name:
      (database_installation_files_s3_bucket_name_ : bucket_name option)
    ?database_installation_files_s3_prefix:
      (database_installation_files_s3_prefix_ : string255 option)
    ?database_installation_files:(database_installation_files_ : string_list option)
    ?image_id:(image_id_ : string255 option) ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option)
    ?source_custom_db_engine_version_identifier:
      (source_custom_db_engine_version_identifier_ : string255 option)
    ?use_aws_provided_latest_image:(use_aws_provided_latest_image_ : boolean_optional option)
    ?description:(description_ : description option)
    ?manifest:(manifest_ : custom_db_engine_version_manifest option) ?tags:(tags_ : tag_list option)
    ~engine:(engine_ : custom_engine_name) ~engine_version:(engine_version_ : custom_engine_version)
    () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     database_installation_files_s3_bucket_name = database_installation_files_s3_bucket_name_;
     database_installation_files_s3_prefix = database_installation_files_s3_prefix_;
     database_installation_files = database_installation_files_;
     image_id = image_id_;
     kms_key_id = kms_key_id_;
     source_custom_db_engine_version_identifier = source_custom_db_engine_version_identifier_;
     use_aws_provided_latest_image = use_aws_provided_latest_image_;
     description = description_;
     manifest = manifest_;
     tags = tags_;
   }
    : create_custom_db_engine_version_message)

let make_create_blue_green_deployment_response
    ?blue_green_deployment:(blue_green_deployment_ : blue_green_deployment option) () =
  ({ blue_green_deployment = blue_green_deployment_ } : create_blue_green_deployment_response)

let make_create_blue_green_deployment_request
    ?target_engine_version:(target_engine_version_ : target_engine_version option)
    ?target_db_parameter_group_name:
      (target_db_parameter_group_name_ : target_db_parameter_group_name option)
    ?target_db_cluster_parameter_group_name:
      (target_db_cluster_parameter_group_name_ : target_db_cluster_parameter_group_name option)
    ?tags:(tags_ : tag_list option)
    ?target_db_instance_class:(target_db_instance_class_ : target_db_instance_class option)
    ?upgrade_target_storage_config:(upgrade_target_storage_config_ : boolean_optional option)
    ?target_iops:(target_iops_ : integer_optional option)
    ?target_storage_type:(target_storage_type_ : target_storage_type option)
    ?target_allocated_storage:(target_allocated_storage_ : integer_optional option)
    ?target_storage_throughput:(target_storage_throughput_ : integer_optional option)
    ~blue_green_deployment_name:(blue_green_deployment_name_ : blue_green_deployment_name)
    ~source:(source_ : database_arn) () =
  ({
     blue_green_deployment_name = blue_green_deployment_name_;
     source = source_;
     target_engine_version = target_engine_version_;
     target_db_parameter_group_name = target_db_parameter_group_name_;
     target_db_cluster_parameter_group_name = target_db_cluster_parameter_group_name_;
     tags = tags_;
     target_db_instance_class = target_db_instance_class_;
     upgrade_target_storage_config = upgrade_target_storage_config_;
     target_iops = target_iops_;
     target_storage_type = target_storage_type_;
     target_allocated_storage = target_allocated_storage_;
     target_storage_throughput = target_storage_throughput_;
   }
    : create_blue_green_deployment_request)

let make_copy_option_group_message ?tags:(tags_ : tag_list option)
    ~source_option_group_identifier:(source_option_group_identifier_ : string_)
    ~target_option_group_identifier:(target_option_group_identifier_ : string_)
    ~target_option_group_description:(target_option_group_description_ : string_) () =
  ({
     source_option_group_identifier = source_option_group_identifier_;
     target_option_group_identifier = target_option_group_identifier_;
     target_option_group_description = target_option_group_description_;
     tags = tags_;
   }
    : copy_option_group_message)

let make_copy_db_snapshot_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option) ?copy_tags:(copy_tags_ : boolean_optional option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?target_custom_availability_zone:(target_custom_availability_zone_ : string_ option)
    ?snapshot_target:(snapshot_target_ : string_ option)
    ?copy_option_group:(copy_option_group_ : boolean_optional option)
    ?snapshot_availability_zone:(snapshot_availability_zone_ : string_ option)
    ~source_db_snapshot_identifier:(source_db_snapshot_identifier_ : string_)
    ~target_db_snapshot_identifier:(target_db_snapshot_identifier_ : string_) () =
  ({
     source_db_snapshot_identifier = source_db_snapshot_identifier_;
     target_db_snapshot_identifier = target_db_snapshot_identifier_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     copy_tags = copy_tags_;
     pre_signed_url = pre_signed_url_;
     option_group_name = option_group_name_;
     target_custom_availability_zone = target_custom_availability_zone_;
     snapshot_target = snapshot_target_;
     copy_option_group = copy_option_group_;
     snapshot_availability_zone = snapshot_availability_zone_;
   }
    : copy_db_snapshot_message)

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
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
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

let make_cancel_export_task_message ~export_task_identifier:(export_task_identifier_ : string_) () =
  ({ export_task_identifier = export_task_identifier_ } : cancel_export_task_message)

let make_backtrack_db_cluster_message ?force:(force_ : boolean_optional option)
    ?use_earliest_time_on_point_in_time_unavailable:
      (use_earliest_time_on_point_in_time_unavailable_ : boolean_optional option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~backtrack_to:(backtrack_to_ : t_stamp) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     backtrack_to = backtrack_to_;
     force = force_;
     use_earliest_time_on_point_in_time_unavailable =
       use_earliest_time_on_point_in_time_unavailable_;
   }
    : backtrack_db_cluster_message)

let make_authorize_db_security_group_ingress_message ?cidri_p:(cidri_p_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ~db_security_group_name:(db_security_group_name_ : string_) () =
  ({
     db_security_group_name = db_security_group_name_;
     cidri_p = cidri_p_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : authorize_db_security_group_ingress_message)

let make_apply_pending_maintenance_action_message
    ~resource_identifier:(resource_identifier_ : string_) ~apply_action:(apply_action_ : string_)
    ~opt_in_type:(opt_in_type_ : string_) () =
  ({
     resource_identifier = resource_identifier_;
     apply_action = apply_action_;
     opt_in_type = opt_in_type_;
   }
    : apply_pending_maintenance_action_message)
