open Types

let make_vpc_security_group_membership ?status:(status_ : string_ option)
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option) () =
  ({ status = status_; vpc_security_group_id = vpc_security_group_id_ }
    : vpc_security_group_membership)

let make_range ?step:(step_ : integer_optional option) ?to_:(to__ : integer option)
    ?from_:(from__ : integer option) () =
  ({ step = step_; to_ = to__; from_ = from__ } : range)

let make_double_range ?to_:(to__ : double option) ?from_:(from__ : double option) () =
  ({ to_ = to__; from_ = from__ } : double_range)

let make_valid_storage_options
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_ option)
    ?storage_throughput_to_iops_ratio:(storage_throughput_to_iops_ratio_ : double_range_list option)
    ?provisioned_storage_throughput:(provisioned_storage_throughput_ : range_list option)
    ?iops_to_storage_ratio:(iops_to_storage_ratio_ : double_range_list option)
    ?provisioned_iops:(provisioned_iops_ : range_list option)
    ?storage_size:(storage_size_ : range_list option) ?storage_type:(storage_type_ : string_ option)
    () =
  ({
     supports_storage_autoscaling = supports_storage_autoscaling_;
     storage_throughput_to_iops_ratio = storage_throughput_to_iops_ratio_;
     provisioned_storage_throughput = provisioned_storage_throughput_;
     iops_to_storage_ratio = iops_to_storage_ratio_;
     provisioned_iops = provisioned_iops_;
     storage_size = storage_size_;
     storage_type = storage_type_;
   }
    : valid_storage_options)

let make_valid_volume_options ?storage:(storage_ : valid_storage_options_list option)
    ?volume_name:(volume_name_ : string_ option) () =
  ({ storage = storage_; volume_name = volume_name_ } : valid_volume_options)

let make_upgrade_target ?supports_integrations:(supports_integrations_ : boolean_optional option)
    ?supports_local_write_forwarding:(supports_local_write_forwarding_ : boolean_optional option)
    ?supports_limitless_database:(supports_limitless_database_ : boolean_optional option)
    ?supports_babelfish:(supports_babelfish_ : boolean_optional option)
    ?supports_global_databases:(supports_global_databases_ : boolean_optional option)
    ?supports_parallel_query:(supports_parallel_query_ : boolean_optional option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?is_major_version_upgrade:(is_major_version_upgrade_ : boolean_ option)
    ?auto_upgrade:(auto_upgrade_ : boolean_ option) ?description:(description_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     supports_integrations = supports_integrations_;
     supports_local_write_forwarding = supports_local_write_forwarding_;
     supports_limitless_database = supports_limitless_database_;
     supports_babelfish = supports_babelfish_;
     supports_global_databases = supports_global_databases_;
     supports_parallel_query = supports_parallel_query_;
     supported_engine_modes = supported_engine_modes_;
     is_major_version_upgrade = is_major_version_upgrade_;
     auto_upgrade = auto_upgrade_;
     description = description_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : upgrade_target)

let make_available_processor_feature ?allowed_values:(allowed_values_ : string_ option)
    ?default_value:(default_value_ : string_ option) ?name:(name_ : string_ option) () =
  ({ allowed_values = allowed_values_; default_value = default_value_; name = name_ }
    : available_processor_feature)

let make_valid_additional_storage_options ?volumes:(volumes_ : valid_volume_options_list option)
    ?supports_additional_storage_volumes:(supports_additional_storage_volumes_ : boolean_ option) ()
    =
  ({
     volumes = volumes_;
     supports_additional_storage_volumes = supports_additional_storage_volumes_;
   }
    : valid_additional_storage_options)

let make_valid_db_instance_modifications_message
    ?additional_storage:(additional_storage_ : valid_additional_storage_options option)
    ?supports_dedicated_log_volume:(supports_dedicated_log_volume_ : boolean_ option)
    ?valid_processor_features:(valid_processor_features_ : available_processor_feature_list option)
    ?storage:(storage_ : valid_storage_options_list option) () =
  ({
     additional_storage = additional_storage_;
     supports_dedicated_log_volume = supports_dedicated_log_volume_;
     valid_processor_features = valid_processor_features_;
     storage = storage_;
   }
    : valid_db_instance_modifications_message)

let make_user_auth_config
    ?client_password_auth_type:(client_password_auth_type_ : client_password_auth_type option)
    ?iam_auth:(iam_auth_ : iam_auth_mode option) ?secret_arn:(secret_arn_ : arn option)
    ?auth_scheme:(auth_scheme_ : auth_scheme option) ?user_name:(user_name_ : auth_user_name option)
    ?description:(description_ : description option) () =
  ({
     client_password_auth_type = client_password_auth_type_;
     iam_auth = iam_auth_;
     secret_arn = secret_arn_;
     auth_scheme = auth_scheme_;
     user_name = user_name_;
     description = description_;
   }
    : user_auth_config)

let make_user_auth_config_info
    ?client_password_auth_type:(client_password_auth_type_ : client_password_auth_type option)
    ?iam_auth:(iam_auth_ : iam_auth_mode option) ?secret_arn:(secret_arn_ : string_ option)
    ?auth_scheme:(auth_scheme_ : auth_scheme option) ?user_name:(user_name_ : string_ option)
    ?description:(description_ : string_ option) () =
  ({
     client_password_auth_type = client_password_auth_type_;
     iam_auth = iam_auth_;
     secret_arn = secret_arn_;
     auth_scheme = auth_scheme_;
     user_name = user_name_;
     description = description_;
   }
    : user_auth_config_info)

let make_timezone ?timezone_name:(timezone_name_ : string_ option) () =
  ({ timezone_name = timezone_name_ } : timezone)

let make_tenant_database_pending_modified_values ?tenant_db_name:(tenant_db_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option) () =
  ({ tenant_db_name = tenant_db_name_; master_user_password = master_user_password_ }
    : tenant_database_pending_modified_values)

let make_master_user_secret ?kms_key_id:(kms_key_id_ : string_ option)
    ?secret_status:(secret_status_ : string_ option) ?secret_arn:(secret_arn_ : string_ option) () =
  ({ kms_key_id = kms_key_id_; secret_status = secret_status_; secret_arn = secret_arn_ }
    : master_user_secret)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_tenant_database ?tag_list:(tag_list_ : tag_list option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?pending_modified_values:
      (pending_modified_values_ : tenant_database_pending_modified_values option)
    ?deletion_protection:(deletion_protection_ : boolean_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?tenant_database_ar_n:(tenant_database_ar_n_ : string_ option)
    ?tenant_database_resource_id:(tenant_database_resource_id_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?master_username:(master_username_ : string_ option) ?status:(status_ : string_ option)
    ?tenant_db_name:(tenant_db_name_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?tenant_database_create_time:(tenant_database_create_time_ : t_stamp option) () =
  ({
     tag_list = tag_list_;
     master_user_secret = master_user_secret_;
     pending_modified_values = pending_modified_values_;
     deletion_protection = deletion_protection_;
     nchar_character_set_name = nchar_character_set_name_;
     character_set_name = character_set_name_;
     tenant_database_ar_n = tenant_database_ar_n_;
     tenant_database_resource_id = tenant_database_resource_id_;
     dbi_resource_id = dbi_resource_id_;
     master_username = master_username_;
     status = status_;
     tenant_db_name = tenant_db_name_;
     db_instance_identifier = db_instance_identifier_;
     tenant_database_create_time = tenant_database_create_time_;
   }
    : tenant_database)

let make_tenant_databases_message
    ?tenant_databases:(tenant_databases_ : tenant_databases_list option)
    ?marker:(marker_ : string_ option) () =
  ({ tenant_databases = tenant_databases_; marker = marker_ } : tenant_databases_message)

let make_target_health ?description:(description_ : string_ option)
    ?reason:(reason_ : target_health_reason option) ?state:(state_ : target_state option) () =
  ({ description = description_; reason = reason_; state = state_ } : target_health)

let make_db_proxy_target ?target_health:(target_health_ : target_health option)
    ?role:(role_ : target_role option) ?type_:(type__ : target_type option)
    ?port:(port_ : integer option) ?rds_resource_id:(rds_resource_id_ : string_ option)
    ?tracked_cluster_id:(tracked_cluster_id_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) ?target_arn:(target_arn_ : string_ option) () =
  ({
     target_health = target_health_;
     role = role_;
     type_ = type__;
     port = port_;
     rds_resource_id = rds_resource_id_;
     tracked_cluster_id = tracked_cluster_id_;
     endpoint = endpoint_;
     target_arn = target_arn_;
   }
    : db_proxy_target)

let make_connection_pool_configuration_info
    ?init_query:(init_query_ : operator_sensitive_string option)
    ?session_pinning_filters:(session_pinning_filters_ : string_list option)
    ?connection_borrow_timeout:(connection_borrow_timeout_ : integer option)
    ?max_idle_connections_percent:(max_idle_connections_percent_ : integer option)
    ?max_connections_percent:(max_connections_percent_ : integer option) () =
  ({
     init_query = init_query_;
     session_pinning_filters = session_pinning_filters_;
     connection_borrow_timeout = connection_borrow_timeout_;
     max_idle_connections_percent = max_idle_connections_percent_;
     max_connections_percent = max_connections_percent_;
   }
    : connection_pool_configuration_info)

let make_db_proxy_target_group ?updated_date:(updated_date_ : t_stamp option)
    ?created_date:(created_date_ : t_stamp option)
    ?connection_pool_config:(connection_pool_config_ : connection_pool_configuration_info option)
    ?status:(status_ : string_ option) ?is_default:(is_default_ : boolean_ option)
    ?target_group_arn:(target_group_arn_ : string_ option)
    ?target_group_name:(target_group_name_ : string_ option)
    ?db_proxy_name:(db_proxy_name_ : string_ option) () =
  ({
     updated_date = updated_date_;
     created_date = created_date_;
     connection_pool_config = connection_pool_config_;
     status = status_;
     is_default = is_default_;
     target_group_arn = target_group_arn_;
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
   }
    : db_proxy_target_group)

let make_tag_specification ?tags:(tags_ : tag_list option)
    ?resource_type:(resource_type_ : string_ option) () =
  ({ tags = tags_; resource_type = resource_type_ } : tag_specification)

let make_tag_list_message ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_list_message)

let make_endpoint ?hosted_zone_id:(hosted_zone_id_ : string_ option) ?port:(port_ : integer option)
    ?address:(address_ : string_ option) () =
  ({ hosted_zone_id = hosted_zone_id_; port = port_; address = address_ } : endpoint)

let make_db_security_group_membership ?status:(status_ : string_ option)
    ?db_security_group_name:(db_security_group_name_ : string_ option) () =
  ({ status = status_; db_security_group_name = db_security_group_name_ }
    : db_security_group_membership)

let make_db_parameter_group_status
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({
     parameter_apply_status = parameter_apply_status_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : db_parameter_group_status)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_outpost ?arn:(arn_ : string_ option) () = ({ arn = arn_ } : outpost)

let make_subnet ?subnet_status:(subnet_status_ : string_ option)
    ?subnet_outpost:(subnet_outpost_ : outpost option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_identifier:(subnet_identifier_ : string_ option) () =
  ({
     subnet_status = subnet_status_;
     subnet_outpost = subnet_outpost_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_identifier = subnet_identifier_;
   }
    : subnet)

let make_db_subnet_group ?supported_network_types:(supported_network_types_ : string_list option)
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

let make_processor_feature ?value:(value_ : string_ option) ?name:(name_ : string_ option) () =
  ({ value = value_; name = name_ } : processor_feature)

let make_additional_storage_volume ?storage_type:(storage_type_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ~volume_name:(volume_name_ : string_) () =
  ({
     storage_type = storage_type_;
     storage_throughput = storage_throughput_;
     max_allocated_storage = max_allocated_storage_;
     iop_s = iop_s_;
     allocated_storage = allocated_storage_;
     volume_name = volume_name_;
   }
    : additional_storage_volume)

let make_pending_modified_values
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?engine:(engine_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?resume_full_automation_mode_time:(resume_full_automation_mode_time_ : t_stamp option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?port:(port_ : integer_optional option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_instance_class:(db_instance_class_ : string_ option) () =
  ({
     additional_storage_volumes = additional_storage_volumes_;
     engine = engine_;
     dedicated_log_volume = dedicated_log_volume_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     multi_tenant = multi_tenant_;
     resume_full_automation_mode_time = resume_full_automation_mode_time_;
     automation_mode = automation_mode_;
     processor_features = processor_features_;
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
     db_subnet_group_name = db_subnet_group_name_;
     ca_certificate_identifier = ca_certificate_identifier_;
     storage_type = storage_type_;
     db_instance_identifier = db_instance_identifier_;
     storage_throughput = storage_throughput_;
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

let make_option_group_membership ?status:(status_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option) () =
  ({ status = status_; option_group_name = option_group_name_ } : option_group_membership)

let make_db_instance_status_info ?message:(message_ : string_ option)
    ?status:(status_ : string_ option) ?normal:(normal_ : boolean_ option)
    ?status_type:(status_type_ : string_ option) () =
  ({ message = message_; status = status_; normal = normal_; status_type = status_type_ }
    : db_instance_status_info)

let make_domain_membership ?dns_ips:(dns_ips_ : string_list option)
    ?auth_secret_arn:(auth_secret_arn_ : string_ option) ?o_u:(o_u_ : string_ option)
    ?iam_role_name:(iam_role_name_ : string_ option) ?fqd_n:(fqd_n_ : string_ option)
    ?status:(status_ : string_ option) ?domain:(domain_ : string_ option) () =
  ({
     dns_ips = dns_ips_;
     auth_secret_arn = auth_secret_arn_;
     o_u = o_u_;
     iam_role_name = iam_role_name_;
     fqd_n = fqd_n_;
     status = status_;
     domain = domain_;
   }
    : domain_membership)

let make_db_instance_role ?status:(status_ : string_ option)
    ?feature_name:(feature_name_ : string_ option) ?role_arn:(role_arn_ : string_ option) () =
  ({ status = status_; feature_name = feature_name_; role_arn = role_arn_ } : db_instance_role)

let make_db_instance_automated_backups_replication
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option) () =
  ({ db_instance_automated_backups_arn = db_instance_automated_backups_arn_ }
    : db_instance_automated_backups_replication)

let make_certificate_details ?valid_till:(valid_till_ : t_stamp option)
    ?ca_identifier:(ca_identifier_ : string_ option) () =
  ({ valid_till = valid_till_; ca_identifier = ca_identifier_ } : certificate_details)

let make_additional_storage_volume_output ?storage_type:(storage_type_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?storage_volume_status:(storage_volume_status_ : string_ option)
    ?volume_name:(volume_name_ : string_ option) () =
  ({
     storage_type = storage_type_;
     storage_throughput = storage_throughput_;
     max_allocated_storage = max_allocated_storage_;
     iop_s = iop_s_;
     allocated_storage = allocated_storage_;
     storage_volume_status = storage_volume_status_;
     volume_name = volume_name_;
   }
    : additional_storage_volume_output)

let make_db_instance ?storage_volume_status:(storage_volume_status_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_output_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?is_storage_config_upgrade_available:
      (is_storage_config_upgrade_available_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?percent_progress:(percent_progress_ : string_ option)
    ?read_replica_source_db_cluster_identifier:
      (read_replica_source_db_cluster_identifier_ : string_ option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?activity_stream_policy_status:
      (activity_stream_policy_status_ : activity_stream_policy_status option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?automatic_restart_time:(automatic_restart_time_ : t_stamp option)
    ?backup_target:(backup_target_ : string_ option)
    ?db_instance_automated_backups_replications:
      (db_instance_automated_backups_replications_ :
         db_instance_automated_backups_replication_list option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?activity_stream_engine_native_audit_fields_included:
      (activity_stream_engine_native_audit_fields_included_ : boolean_optional option)
    ?activity_stream_mode:(activity_stream_mode_ : activity_stream_mode option)
    ?activity_stream_kinesis_stream_name:(activity_stream_kinesis_stream_name_ : string_ option)
    ?activity_stream_kms_key_id:(activity_stream_kms_key_id_ : string_ option)
    ?activity_stream_status:(activity_stream_status_ : activity_stream_status option)
    ?network_type:(network_type_ : string_ option)
    ?customer_owned_ip_enabled:(customer_owned_ip_enabled_ : boolean_optional option)
    ?resume_full_automation_mode_time:(resume_full_automation_mode_time_ : t_stamp option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?tag_list:(tag_list_ : tag_list option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?listener_endpoint:(listener_endpoint_ : endpoint option)
    ?associated_roles:(associated_roles_ : db_instance_roles option)
    ?deletion_protection:(deletion_protection_ : boolean_ option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?timezone:(timezone_ : string_ option) ?db_instance_arn:(db_instance_arn_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?enhanced_monitoring_resource_arn:(enhanced_monitoring_resource_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_ option)
    ?domain_memberships:(domain_memberships_ : domain_membership_list option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_instance_port:(db_instance_port_ : integer option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_type:(storage_type_ : string_ option)
    ?status_infos:(status_infos_ : db_instance_status_info_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?option_group_memberships:(option_group_memberships_ : option_group_membership_list option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?read_replica_db_cluster_identifiers:
      (read_replica_db_cluster_identifiers_ : read_replica_db_cluster_identifier_list option)
    ?read_replica_db_instance_identifiers:
      (read_replica_db_instance_identifiers_ : read_replica_db_instance_identifier_list option)
    ?read_replica_source_db_instance_identifier:
      (read_replica_source_db_instance_identifier_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_ option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?upgrade_rollout_order:(upgrade_rollout_order_ : upgrade_rollout_order option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : db_subnet_group option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_parameter_groups:(db_parameter_groups_ : db_parameter_group_status_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?db_security_groups:(db_security_groups_ : db_security_group_membership_list option)
    ?backup_retention_period:(backup_retention_period_ : integer option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?allocated_storage:(allocated_storage_ : integer option) ?endpoint:(endpoint_ : endpoint option)
    ?db_name:(db_name_ : string_ option) ?master_username:(master_username_ : string_ option)
    ?db_instance_status:(db_instance_status_ : string_ option) ?engine:(engine_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     storage_volume_status = storage_volume_status_;
     additional_storage_volumes = additional_storage_volumes_;
     engine_lifecycle_support = engine_lifecycle_support_;
     is_storage_config_upgrade_available = is_storage_config_upgrade_available_;
     dedicated_log_volume = dedicated_log_volume_;
     multi_tenant = multi_tenant_;
     percent_progress = percent_progress_;
     read_replica_source_db_cluster_identifier = read_replica_source_db_cluster_identifier_;
     master_user_secret = master_user_secret_;
     db_system_id = db_system_id_;
     certificate_details = certificate_details_;
     activity_stream_policy_status = activity_stream_policy_status_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     automatic_restart_time = automatic_restart_time_;
     backup_target = backup_target_;
     db_instance_automated_backups_replications = db_instance_automated_backups_replications_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     activity_stream_engine_native_audit_fields_included =
       activity_stream_engine_native_audit_fields_included_;
     activity_stream_mode = activity_stream_mode_;
     activity_stream_kinesis_stream_name = activity_stream_kinesis_stream_name_;
     activity_stream_kms_key_id = activity_stream_kms_key_id_;
     activity_stream_status = activity_stream_status_;
     network_type = network_type_;
     customer_owned_ip_enabled = customer_owned_ip_enabled_;
     resume_full_automation_mode_time = resume_full_automation_mode_time_;
     automation_mode = automation_mode_;
     tag_list = tag_list_;
     max_allocated_storage = max_allocated_storage_;
     listener_endpoint = listener_endpoint_;
     associated_roles = associated_roles_;
     deletion_protection = deletion_protection_;
     processor_features = processor_features_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_enabled = performance_insights_enabled_;
     database_insights_mode = database_insights_mode_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     timezone = timezone_;
     db_instance_arn = db_instance_arn_;
     promotion_tier = promotion_tier_;
     monitoring_role_arn = monitoring_role_arn_;
     enhanced_monitoring_resource_arn = enhanced_monitoring_resource_arn_;
     monitoring_interval = monitoring_interval_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain_memberships = domain_memberships_;
     ca_certificate_identifier = ca_certificate_identifier_;
     dbi_resource_id = dbi_resource_id_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     db_cluster_identifier = db_cluster_identifier_;
     db_instance_port = db_instance_port_;
     tde_credential_arn = tde_credential_arn_;
     storage_encryption_type = storage_encryption_type_;
     storage_type = storage_type_;
     status_infos = status_infos_;
     publicly_accessible = publicly_accessible_;
     secondary_availability_zone = secondary_availability_zone_;
     nchar_character_set_name = nchar_character_set_name_;
     character_set_name = character_set_name_;
     option_group_memberships = option_group_memberships_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     license_model = license_model_;
     replica_mode = replica_mode_;
     read_replica_db_cluster_identifiers = read_replica_db_cluster_identifiers_;
     read_replica_db_instance_identifiers = read_replica_db_instance_identifiers_;
     read_replica_source_db_instance_identifier = read_replica_source_db_instance_identifier_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     latest_restorable_time = latest_restorable_time_;
     pending_modified_values = pending_modified_values_;
     upgrade_rollout_order = upgrade_rollout_order_;
     preferred_maintenance_window = preferred_maintenance_window_;
     db_subnet_group = db_subnet_group_;
     availability_zone = availability_zone_;
     db_parameter_groups = db_parameter_groups_;
     vpc_security_groups = vpc_security_groups_;
     db_security_groups = db_security_groups_;
     backup_retention_period = backup_retention_period_;
     preferred_backup_window = preferred_backup_window_;
     instance_create_time = instance_create_time_;
     allocated_storage = allocated_storage_;
     endpoint = endpoint_;
     db_name = db_name_;
     master_username = master_username_;
     db_instance_status = db_instance_status_;
     engine = engine_;
     db_instance_class = db_instance_class_;
     db_instance_identifier = db_instance_identifier_;
   }
    : db_instance)

let make_switchover_read_replica_message ~db_instance_identifier:(db_instance_identifier_ : string_)
    () =
  ({ db_instance_identifier = db_instance_identifier_ } : switchover_read_replica_message)

let make_global_cluster_member
    ?synchronization_status:
      (synchronization_status_ : global_cluster_member_synchronization_status option)
    ?global_write_forwarding_status:
      (global_write_forwarding_status_ : write_forwarding_status option)
    ?is_writer:(is_writer_ : boolean_ option) ?readers:(readers_ : readers_arn_list option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option) () =
  ({
     synchronization_status = synchronization_status_;
     global_write_forwarding_status = global_write_forwarding_status_;
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
    ?failover_state:(failover_state_ : failover_state option) ?endpoint:(endpoint_ : string_ option)
    ?global_cluster_members:(global_cluster_members_ : global_cluster_member_list option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?status:(status_ : string_ option) ?global_cluster_arn:(global_cluster_arn_ : string_ option)
    ?global_cluster_resource_id:(global_cluster_resource_id_ : string_ option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option) () =
  ({
     tag_list = tag_list_;
     failover_state = failover_state_;
     endpoint = endpoint_;
     global_cluster_members = global_cluster_members_;
     deletion_protection = deletion_protection_;
     storage_encryption_type = storage_encryption_type_;
     storage_encrypted = storage_encrypted_;
     database_name = database_name_;
     engine_lifecycle_support = engine_lifecycle_support_;
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

let make_switchover_detail ?status:(status_ : switchover_detail_status option)
    ?target_member:(target_member_ : database_arn option)
    ?source_member:(source_member_ : database_arn option) () =
  ({ status = status_; target_member = target_member_; source_member = source_member_ }
    : switchover_detail)

let make_blue_green_deployment_task ?status:(status_ : blue_green_deployment_task_status option)
    ?name:(name_ : blue_green_deployment_task_name option) () =
  ({ status = status_; name = name_ } : blue_green_deployment_task)

let make_blue_green_deployment ?tag_list:(tag_list_ : tag_list option)
    ?delete_time:(delete_time_ : t_stamp option) ?create_time:(create_time_ : t_stamp option)
    ?status_details:(status_details_ : blue_green_deployment_status_details option)
    ?status:(status_ : blue_green_deployment_status option)
    ?tasks:(tasks_ : blue_green_deployment_task_list option)
    ?switchover_details:(switchover_details_ : switchover_detail_list option)
    ?target:(target_ : database_arn option) ?source:(source_ : database_arn option)
    ?blue_green_deployment_name:(blue_green_deployment_name_ : blue_green_deployment_name option)
    ?blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier option) () =
  ({
     tag_list = tag_list_;
     delete_time = delete_time_;
     create_time = create_time_;
     status_details = status_details_;
     status = status_;
     tasks = tasks_;
     switchover_details = switchover_details_;
     target = target_;
     source = source_;
     blue_green_deployment_name = blue_green_deployment_name_;
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
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
     switchover_timeout = switchover_timeout_;
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
   }
    : switchover_blue_green_deployment_request)

let make_supported_engine_lifecycle
    ~lifecycle_support_end_date:(lifecycle_support_end_date_ : t_stamp)
    ~lifecycle_support_start_date:(lifecycle_support_start_date_ : t_stamp)
    ~lifecycle_support_name:(lifecycle_support_name_ : lifecycle_support_name) () =
  ({
     lifecycle_support_end_date = lifecycle_support_end_date_;
     lifecycle_support_start_date = lifecycle_support_start_date_;
     lifecycle_support_name = lifecycle_support_name_;
   }
    : supported_engine_lifecycle)

let make_character_set ?character_set_description:(character_set_description_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option) () =
  ({
     character_set_description = character_set_description_;
     character_set_name = character_set_name_;
   }
    : character_set)

let make_stop_db_instance_message ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
   }
    : stop_db_instance_message)

let make_restore_window ?latest_time:(latest_time_ : t_stamp option)
    ?earliest_time:(earliest_time_ : t_stamp option) () =
  ({ latest_time = latest_time_; earliest_time = earliest_time_ } : restore_window)

let make_db_instance_automated_backup
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?tag_list:(tag_list_ : tag_list option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?backup_target:(backup_target_ : string_ option)
    ?db_instance_automated_backups_replications:
      (db_instance_automated_backups_replications_ :
         db_instance_automated_backups_replication_list option)
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?timezone:(timezone_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?encrypted:(encrypted_ : boolean_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?vpc_id:(vpc_id_ : string_ option) ?availability_zone:(availability_zone_ : string_ option)
    ?port:(port_ : integer option) ?status:(status_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?restore_window:(restore_window_ : restore_window option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?region:(region_ : string_ option) ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?db_instance_arn:(db_instance_arn_ : string_ option) () =
  ({
     additional_storage_volumes = additional_storage_volumes_;
     dedicated_log_volume = dedicated_log_volume_;
     tag_list = tag_list_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     multi_tenant = multi_tenant_;
     backup_target = backup_target_;
     db_instance_automated_backups_replications = db_instance_automated_backups_replications_;
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     timezone = timezone_;
     kms_key_id = kms_key_id_;
     storage_type = storage_type_;
     storage_encryption_type = storage_encryption_type_;
     encrypted = encrypted_;
     tde_credential_arn = tde_credential_arn_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     license_model = license_model_;
     engine_version = engine_version_;
     engine = engine_;
     master_username = master_username_;
     instance_create_time = instance_create_time_;
     vpc_id = vpc_id_;
     availability_zone = availability_zone_;
     port = port_;
     status = status_;
     allocated_storage = allocated_storage_;
     restore_window = restore_window_;
     db_instance_identifier = db_instance_identifier_;
     region = region_;
     dbi_resource_id = dbi_resource_id_;
     db_instance_arn = db_instance_arn_;
   }
    : db_instance_automated_backup)

let make_stop_db_instance_automated_backups_replication_message
    ~source_db_instance_arn:(source_db_instance_arn_ : string_) () =
  ({ source_db_instance_arn = source_db_instance_arn_ }
    : stop_db_instance_automated_backups_replication_message)

let make_db_cluster_option_group_status ?status:(status_ : string_ option)
    ?db_cluster_option_group_name:(db_cluster_option_group_name_ : string_ option) () =
  ({ status = status_; db_cluster_option_group_name = db_cluster_option_group_name_ }
    : db_cluster_option_group_status)

let make_db_cluster_status_info ?message:(message_ : string_ option)
    ?status:(status_ : string_ option) ?normal:(normal_ : boolean_ option)
    ?status_type:(status_type_ : string_ option) () =
  ({ message = message_; status = status_; normal = normal_; status_type = status_type_ }
    : db_cluster_status_info)

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

let make_db_cluster_role ?feature_name:(feature_name_ : string_ option)
    ?status:(status_ : string_ option) ?role_arn:(role_arn_ : string_ option) () =
  ({ feature_name = feature_name_; status = status_; role_arn = role_arn_ } : db_cluster_role)

let make_rds_custom_cluster_configuration ?replica_mode:(replica_mode_ : replica_mode option)
    ?transit_gateway_multicast_domain_id:(transit_gateway_multicast_domain_id_ : string_ option)
    ?interconnect_subnet_id:(interconnect_subnet_id_ : string_ option) () =
  ({
     replica_mode = replica_mode_;
     transit_gateway_multicast_domain_id = transit_gateway_multicast_domain_id_;
     interconnect_subnet_id = interconnect_subnet_id_;
   }
    : rds_custom_cluster_configuration)

let make_cluster_pending_modified_values
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?iops:(iops_ : integer_optional option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?pending_cloudwatch_logs_exports:
      (pending_cloudwatch_logs_exports_ : pending_cloudwatch_logs_exports option) () =
  ({
     certificate_details = certificate_details_;
     iops = iops_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     allocated_storage = allocated_storage_;
     storage_type = storage_type_;
     backup_retention_period = backup_retention_period_;
     engine_version = engine_version_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     master_user_password = master_user_password_;
     db_cluster_identifier = db_cluster_identifier_;
     pending_cloudwatch_logs_exports = pending_cloudwatch_logs_exports_;
   }
    : cluster_pending_modified_values)

let make_scaling_configuration_info
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?auto_pause:(auto_pause_ : boolean_optional option)
    ?max_capacity:(max_capacity_ : integer_optional option)
    ?min_capacity:(min_capacity_ : integer_optional option) () =
  ({
     seconds_before_timeout = seconds_before_timeout_;
     timeout_action = timeout_action_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
     auto_pause = auto_pause_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
   }
    : scaling_configuration_info)

let make_serverless_v2_scaling_configuration_info
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({
     seconds_until_auto_pause = seconds_until_auto_pause_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
   }
    : serverless_v2_scaling_configuration_info)

let make_limitless_database ?min_required_ac_u:(min_required_ac_u_ : double_optional option)
    ?status:(status_ : limitless_database_status option) () =
  ({ min_required_ac_u = min_required_ac_u_; status = status_ } : limitless_database)

let make_db_cluster
    ?internet_access_gateway_enabled:(internet_access_gateway_enabled_ : boolean_optional option)
    ?vpc_networking_enabled:(vpc_networking_enabled_ : boolean_optional option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?certificate_details:(certificate_details_ : certificate_details option)
    ?cluster_scalability_type:(cluster_scalability_type_ : cluster_scalability_type option)
    ?limitless_database:(limitless_database_ : limitless_database option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?local_write_forwarding_status:
      (local_write_forwarding_status_ : local_write_forwarding_status option)
    ?master_user_secret:(master_user_secret_ : master_user_secret option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?performance_insights_enabled:(performance_insights_enabled_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration_info option)
    ?automatic_restart_time:(automatic_restart_time_ : t_stamp option)
    ?network_type:(network_type_ : string_ option)
    ?global_write_forwarding_requested:
      (global_write_forwarding_requested_ : boolean_optional option)
    ?global_write_forwarding_status:
      (global_write_forwarding_status_ : write_forwarding_status option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?tag_list:(tag_list_ : tag_list option)
    ?domain_memberships:(domain_memberships_ : domain_membership_list option)
    ?cross_account_clone:(cross_account_clone_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?activity_stream_kinesis_stream_name:(activity_stream_kinesis_stream_name_ : string_ option)
    ?activity_stream_kms_key_id:(activity_stream_kms_key_id_ : string_ option)
    ?activity_stream_status:(activity_stream_status_ : activity_stream_status option)
    ?activity_stream_mode:(activity_stream_mode_ : activity_stream_mode option)
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?io_optimized_next_allowed_modification_time:
      (io_optimized_next_allowed_modification_time_ : t_stamp option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?storage_type:(storage_type_ : string_ option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?scaling_configuration_info:(scaling_configuration_info_ : scaling_configuration_info option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?pending_modified_values:(pending_modified_values_ : cluster_pending_modified_values option)
    ?capacity:(capacity_ : integer_optional option)
    ?enabled_cloudwatch_logs_exports:(enabled_cloudwatch_logs_exports_ : log_type_list option)
    ?backtrack_consumed_change_records:(backtrack_consumed_change_records_ : long_optional option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?earliest_backtrack_time:(earliest_backtrack_time_ : t_stamp option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?clone_group_id:(clone_group_id_ : string_ option)
    ?iam_database_authentication_enabled:
      (iam_database_authentication_enabled_ : boolean_optional option)
    ?associated_roles:(associated_roles_ : db_cluster_roles option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?hosted_zone_id:(hosted_zone_id_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?db_cluster_members:(db_cluster_members_ : db_cluster_member_list option)
    ?status_infos:(status_infos_ : db_cluster_status_info_list option)
    ?read_replica_identifiers:(read_replica_identifiers_ : read_replica_identifier_list option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?upgrade_rollout_order:(upgrade_rollout_order_ : upgrade_rollout_order option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?db_cluster_option_group_memberships:
      (db_cluster_option_group_memberships_ : db_cluster_option_group_memberships option)
    ?master_username:(master_username_ : string_ option) ?port:(port_ : integer_optional option)
    ?latest_restorable_time:(latest_restorable_time_ : t_stamp option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?custom_endpoints:(custom_endpoints_ : string_list option)
    ?reader_endpoint:(reader_endpoint_ : string_ option) ?endpoint:(endpoint_ : string_ option)
    ?earliest_restorable_time:(earliest_restorable_time_ : t_stamp option)
    ?percent_progress:(percent_progress_ : string_ option) ?status:(status_ : string_ option)
    ?db_subnet_group:(db_subnet_group_ : string_ option)
    ?db_cluster_parameter_group:(db_cluster_parameter_group_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?allocated_storage:(allocated_storage_ : integer_optional option) () =
  ({
     internet_access_gateway_enabled = internet_access_gateway_enabled_;
     vpc_networking_enabled = vpc_networking_enabled_;
     engine_lifecycle_support = engine_lifecycle_support_;
     certificate_details = certificate_details_;
     cluster_scalability_type = cluster_scalability_type_;
     limitless_database = limitless_database_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     local_write_forwarding_status = local_write_forwarding_status_;
     master_user_secret = master_user_secret_;
     db_system_id = db_system_id_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     performance_insights_enabled = performance_insights_enabled_;
     database_insights_mode = database_insights_mode_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     serverless_v2_platform_version = serverless_v2_platform_version_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     automatic_restart_time = automatic_restart_time_;
     network_type = network_type_;
     global_write_forwarding_requested = global_write_forwarding_requested_;
     global_write_forwarding_status = global_write_forwarding_status_;
     global_cluster_identifier = global_cluster_identifier_;
     tag_list = tag_list_;
     domain_memberships = domain_memberships_;
     cross_account_clone = cross_account_clone_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     activity_stream_kinesis_stream_name = activity_stream_kinesis_stream_name_;
     activity_stream_kms_key_id = activity_stream_kms_key_id_;
     activity_stream_status = activity_stream_status_;
     activity_stream_mode = activity_stream_mode_;
     http_endpoint_enabled = http_endpoint_enabled_;
     deletion_protection = deletion_protection_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     publicly_accessible = publicly_accessible_;
     io_optimized_next_allowed_modification_time = io_optimized_next_allowed_modification_time_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     storage_type = storage_type_;
     db_cluster_instance_class = db_cluster_instance_class_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     scaling_configuration_info = scaling_configuration_info_;
     engine_mode = engine_mode_;
     pending_modified_values = pending_modified_values_;
     capacity = capacity_;
     enabled_cloudwatch_logs_exports = enabled_cloudwatch_logs_exports_;
     backtrack_consumed_change_records = backtrack_consumed_change_records_;
     backtrack_window = backtrack_window_;
     earliest_backtrack_time = earliest_backtrack_time_;
     cluster_create_time = cluster_create_time_;
     clone_group_id = clone_group_id_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     associated_roles = associated_roles_;
     db_cluster_arn = db_cluster_arn_;
     db_cluster_resource_id = db_cluster_resource_id_;
     kms_key_id = kms_key_id_;
     storage_encryption_type = storage_encryption_type_;
     storage_encrypted = storage_encrypted_;
     hosted_zone_id = hosted_zone_id_;
     vpc_security_groups = vpc_security_groups_;
     db_cluster_members = db_cluster_members_;
     status_infos = status_infos_;
     read_replica_identifiers = read_replica_identifiers_;
     replication_source_identifier = replication_source_identifier_;
     upgrade_rollout_order = upgrade_rollout_order_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     db_cluster_option_group_memberships = db_cluster_option_group_memberships_;
     master_username = master_username_;
     port = port_;
     latest_restorable_time = latest_restorable_time_;
     engine_version = engine_version_;
     engine = engine_;
     multi_a_z = multi_a_z_;
     custom_endpoints = custom_endpoints_;
     reader_endpoint = reader_endpoint_;
     endpoint = endpoint_;
     earliest_restorable_time = earliest_restorable_time_;
     percent_progress = percent_progress_;
     status = status_;
     db_subnet_group = db_subnet_group_;
     db_cluster_parameter_group = db_cluster_parameter_group_;
     db_cluster_identifier = db_cluster_identifier_;
     database_name = database_name_;
     character_set_name = character_set_name_;
     backup_retention_period = backup_retention_period_;
     availability_zones = availability_zones_;
     allocated_storage = allocated_storage_;
   }
    : db_cluster)

let make_stop_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : stop_db_cluster_message)

let make_stop_activity_stream_response ?status:(status_ : activity_stream_status option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({ status = status_; kinesis_stream_name = kinesis_stream_name_; kms_key_id = kms_key_id_ }
    : stop_activity_stream_response)

let make_stop_activity_stream_request
    ?apply_immediately:(apply_immediately_ : boolean_optional option)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ apply_immediately = apply_immediately_; resource_arn = resource_arn_ }
    : stop_activity_stream_request)

let make_start_export_task_message ?export_only:(export_only_ : string_list option)
    ?s3_prefix:(s3_prefix_ : string_ option) ~kms_key_id:(kms_key_id_ : string_)
    ~iam_role_arn:(iam_role_arn_ : string_) ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~source_arn:(source_arn_ : string_) ~export_task_identifier:(export_task_identifier_ : string_)
    () =
  ({
     export_only = export_only_;
     s3_prefix = s3_prefix_;
     kms_key_id = kms_key_id_;
     iam_role_arn = iam_role_arn_;
     s3_bucket_name = s3_bucket_name_;
     source_arn = source_arn_;
     export_task_identifier = export_task_identifier_;
   }
    : start_export_task_message)

let make_export_task ?source_type:(source_type_ : export_source_type option)
    ?warning_message:(warning_message_ : string_ option)
    ?failure_cause:(failure_cause_ : string_ option)
    ?total_extracted_data_in_g_b:(total_extracted_data_in_g_b_ : integer option)
    ?percent_progress:(percent_progress_ : integer option) ?status:(status_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?s3_prefix:(s3_prefix_ : string_ option) ?s3_bucket:(s3_bucket_ : string_ option)
    ?task_end_time:(task_end_time_ : t_stamp option)
    ?task_start_time:(task_start_time_ : t_stamp option)
    ?snapshot_time:(snapshot_time_ : t_stamp option)
    ?export_only:(export_only_ : string_list option) ?source_arn:(source_arn_ : string_ option)
    ?export_task_identifier:(export_task_identifier_ : string_ option) () =
  ({
     source_type = source_type_;
     warning_message = warning_message_;
     failure_cause = failure_cause_;
     total_extracted_data_in_g_b = total_extracted_data_in_g_b_;
     percent_progress = percent_progress_;
     status = status_;
     kms_key_id = kms_key_id_;
     iam_role_arn = iam_role_arn_;
     s3_prefix = s3_prefix_;
     s3_bucket = s3_bucket_;
     task_end_time = task_end_time_;
     task_start_time = task_start_time_;
     snapshot_time = snapshot_time_;
     export_only = export_only_;
     source_arn = source_arn_;
     export_task_identifier = export_task_identifier_;
   }
    : export_task)

let make_start_db_instance_message ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ } : start_db_instance_message)

let make_start_db_instance_automated_backups_replication_message ?tags:(tags_ : tag_list option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ~source_db_instance_arn:(source_db_instance_arn_ : string_) () =
  ({
     tags = tags_;
     pre_signed_url = pre_signed_url_;
     kms_key_id = kms_key_id_;
     backup_retention_period = backup_retention_period_;
     source_db_instance_arn = source_db_instance_arn_;
   }
    : start_db_instance_automated_backups_replication_message)

let make_start_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : start_db_cluster_message)

let make_start_activity_stream_response ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ?mode:(mode_ : activity_stream_mode option) ?status:(status_ : activity_stream_status option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({
     apply_immediately = apply_immediately_;
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
     mode = mode_;
     status = status_;
     kinesis_stream_name = kinesis_stream_name_;
     kms_key_id = kms_key_id_;
   }
    : start_activity_stream_response)

let make_start_activity_stream_request
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ?apply_immediately:(apply_immediately_ : boolean_optional option)
    ~kms_key_id:(kms_key_id_ : string_) ~mode:(mode_ : activity_stream_mode)
    ~resource_arn:(resource_arn_ : string_) () =
  ({
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
     apply_immediately = apply_immediately_;
     kms_key_id = kms_key_id_;
     mode = mode_;
     resource_arn = resource_arn_;
   }
    : start_activity_stream_request)

let make_source_region
    ?supports_db_instance_automated_backups_replication:
      (supports_db_instance_automated_backups_replication_ : boolean_ option)
    ?status:(status_ : string_ option) ?endpoint:(endpoint_ : string_ option)
    ?region_name:(region_name_ : string_ option) () =
  ({
     supports_db_instance_automated_backups_replication =
       supports_db_instance_automated_backups_replication_;
     status = status_;
     endpoint = endpoint_;
     region_name = region_name_;
   }
    : source_region)

let make_source_region_message ?source_regions:(source_regions_ : source_region_list option)
    ?marker:(marker_ : string_ option) () =
  ({ source_regions = source_regions_; marker = marker_ } : source_region_message)

let make_serverless_v2_scaling_configuration
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({
     seconds_until_auto_pause = seconds_until_auto_pause_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
   }
    : serverless_v2_scaling_configuration)

let make_serverless_v2_features_support ?max_capacity:(max_capacity_ : double_optional option)
    ?min_capacity:(min_capacity_ : double_optional option) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ } : serverless_v2_features_support)

let make_serverless_v2_platform_version_info ?is_default:(is_default_ : boolean_ option)
    ?status:(status_ : string_ option)
    ?serverless_v2_features_support:
      (serverless_v2_features_support_ : serverless_v2_features_support option)
    ?engine:(engine_ : string_ option)
    ?serverless_v2_platform_version_description:
      (serverless_v2_platform_version_description_ : string_ option)
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option) () =
  ({
     is_default = is_default_;
     status = status_;
     serverless_v2_features_support = serverless_v2_features_support_;
     engine = engine_;
     serverless_v2_platform_version_description = serverless_v2_platform_version_description_;
     serverless_v2_platform_version = serverless_v2_platform_version_;
   }
    : serverless_v2_platform_version_info)

let make_serverless_v2_platform_versions_message
    ?serverless_v2_platform_versions:
      (serverless_v2_platform_versions_ : serverless_v2_platform_version_list option)
    ?marker:(marker_ : string_ option) () =
  ({ serverless_v2_platform_versions = serverless_v2_platform_versions_; marker = marker_ }
    : serverless_v2_platform_versions_message)

let make_scaling_configuration
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_until_auto_pause:(seconds_until_auto_pause_ : integer_optional option)
    ?auto_pause:(auto_pause_ : boolean_optional option)
    ?max_capacity:(max_capacity_ : integer_optional option)
    ?min_capacity:(min_capacity_ : integer_optional option) () =
  ({
     seconds_before_timeout = seconds_before_timeout_;
     timeout_action = timeout_action_;
     seconds_until_auto_pause = seconds_until_auto_pause_;
     auto_pause = auto_pause_;
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
   }
    : scaling_configuration)

let make_scalar_reference_details ?value:(value_ : double option) () =
  ({ value = value_ } : scalar_reference_details)

let make_ec2_security_group
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_name = ec2_security_group_name_;
     status = status_;
   }
    : ec2_security_group)

let make_ip_range ?cidri_p:(cidri_p_ : string_ option) ?status:(status_ : string_ option) () =
  ({ cidri_p = cidri_p_; status = status_ } : ip_range)

let make_db_security_group ?db_security_group_arn:(db_security_group_arn_ : string_ option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ?ec2_security_groups:(ec2_security_groups_ : ec2_security_group_list option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?db_security_group_description:(db_security_group_description_ : string_ option)
    ?db_security_group_name:(db_security_group_name_ : string_ option)
    ?owner_id:(owner_id_ : string_ option) () =
  ({
     db_security_group_arn = db_security_group_arn_;
     ip_ranges = ip_ranges_;
     ec2_security_groups = ec2_security_groups_;
     vpc_id = vpc_id_;
     db_security_group_description = db_security_group_description_;
     db_security_group_name = db_security_group_name_;
     owner_id = owner_id_;
   }
    : db_security_group)

let make_revoke_db_security_group_ingress_message
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?cidri_p:(cidri_p_ : string_ option) ~db_security_group_name:(db_security_group_name_ : string_)
    () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_name = ec2_security_group_name_;
     cidri_p = cidri_p_;
     db_security_group_name = db_security_group_name_;
   }
    : revoke_db_security_group_ingress_message)

let make_restore_db_instance_to_point_in_time_message
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?backup_target:(backup_target_ : string_ option)
    ?source_db_instance_automated_backups_arn:
      (source_db_instance_automated_backups_arn_ : string_ option)
    ?network_type:(network_type_ : string_ option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?source_dbi_resource_id:(source_dbi_resource_id_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?tags:(tags_ : tag_list option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?engine:(engine_ : string_ option)
    ?db_name:(db_name_ : string_ option) ?license_model:(license_model_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option) ?port:(port_ : integer_optional option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?restore_time:(restore_time_ : t_stamp option)
    ?source_db_instance_identifier:(source_db_instance_identifier_ : string_ option)
    ~target_db_instance_identifier:(target_db_instance_identifier_ : string_) () =
  ({
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     engine_lifecycle_support = engine_lifecycle_support_;
     ca_certificate_identifier = ca_certificate_identifier_;
     dedicated_log_volume = dedicated_log_volume_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     allocated_storage = allocated_storage_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     backup_target = backup_target_;
     source_db_instance_automated_backups_arn = source_db_instance_automated_backups_arn_;
     network_type = network_type_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     max_allocated_storage = max_allocated_storage_;
     source_dbi_resource_id = source_dbi_resource_id_;
     deletion_protection = deletion_protection_;
     db_parameter_group_name = db_parameter_group_name_;
     use_default_processor_features = use_default_processor_features_;
     processor_features = processor_features_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     domain_dns_ips = domain_dns_ips_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_ou = domain_ou_;
     domain_fqdn = domain_fqdn_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     vpc_security_group_ids = vpc_security_group_ids_;
     tde_credential_password = tde_credential_password_;
     tde_credential_arn = tde_credential_arn_;
     storage_type = storage_type_;
     tags = tags_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     engine = engine_;
     db_name = db_name_;
     license_model = license_model_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     publicly_accessible = publicly_accessible_;
     multi_a_z = multi_a_z_;
     db_subnet_group_name = db_subnet_group_name_;
     availability_zone = availability_zone_;
     port = port_;
     db_instance_class = db_instance_class_;
     use_latest_restorable_time = use_latest_restorable_time_;
     restore_time = restore_time_;
     target_db_instance_identifier = target_db_instance_identifier_;
     source_db_instance_identifier = source_db_instance_identifier_;
   }
    : restore_db_instance_to_point_in_time_message)

let make_restore_db_instance_from_s3_message
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?network_type:(network_type_ : string_ option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?s3_prefix:(s3_prefix_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?storage_type:(storage_type_ : string_ option) ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?port:(port_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_security_groups:(db_security_groups_ : db_security_group_name_list option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?master_username:(master_username_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_name:(db_name_ : string_ option) ~s3_ingestion_role_arn:(s3_ingestion_role_arn_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~source_engine_version:(source_engine_version_ : string_)
    ~source_engine:(source_engine_ : string_) ~engine:(engine_ : string_)
    ~db_instance_class:(db_instance_class_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     engine_lifecycle_support = engine_lifecycle_support_;
     ca_certificate_identifier = ca_certificate_identifier_;
     dedicated_log_volume = dedicated_log_volume_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     network_type = network_type_;
     max_allocated_storage = max_allocated_storage_;
     deletion_protection = deletion_protection_;
     use_default_processor_features = use_default_processor_features_;
     processor_features = processor_features_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     s3_ingestion_role_arn = s3_ingestion_role_arn_;
     s3_prefix = s3_prefix_;
     s3_bucket_name = s3_bucket_name_;
     source_engine_version = source_engine_version_;
     source_engine = source_engine_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     storage_type = storage_type_;
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     license_model = license_model_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     port = port_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_parameter_group_name = db_parameter_group_name_;
     preferred_maintenance_window = preferred_maintenance_window_;
     db_subnet_group_name = db_subnet_group_name_;
     availability_zone = availability_zone_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_security_groups = db_security_groups_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     engine = engine_;
     db_instance_class = db_instance_class_;
     allocated_storage = allocated_storage_;
     db_instance_identifier = db_instance_identifier_;
     db_name = db_name_;
   }
    : restore_db_instance_from_s3_message)

let make_restore_db_instance_from_db_snapshot_message
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?backup_target:(backup_target_ : string_ option) ?network_type:(network_type_ : string_ option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_type:(storage_type_ : string_ option) ?tags:(tags_ : tag_list option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?engine:(engine_ : string_ option)
    ?db_name:(db_name_ : string_ option) ?license_model:(license_model_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option) ?port:(port_ : integer_optional option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     engine_lifecycle_support = engine_lifecycle_support_;
     ca_certificate_identifier = ca_certificate_identifier_;
     dedicated_log_volume = dedicated_log_volume_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_;
     allocated_storage = allocated_storage_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     backup_target = backup_target_;
     network_type = network_type_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     deletion_protection = deletion_protection_;
     db_parameter_group_name = db_parameter_group_name_;
     use_default_processor_features = use_default_processor_features_;
     processor_features = processor_features_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     domain_iam_role_name = domain_iam_role_name_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain_dns_ips = domain_dns_ips_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_ou = domain_ou_;
     domain_fqdn = domain_fqdn_;
     domain = domain_;
     vpc_security_group_ids = vpc_security_group_ids_;
     tde_credential_password = tde_credential_password_;
     tde_credential_arn = tde_credential_arn_;
     storage_type = storage_type_;
     tags = tags_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     engine = engine_;
     db_name = db_name_;
     license_model = license_model_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     publicly_accessible = publicly_accessible_;
     multi_a_z = multi_a_z_;
     db_subnet_group_name = db_subnet_group_name_;
     availability_zone = availability_zone_;
     port = port_;
     db_instance_class = db_instance_class_;
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
   }
    : restore_db_instance_from_db_snapshot_message)

let make_restore_db_cluster_to_point_in_time_message
    ?enable_internet_access_gateway:(enable_internet_access_gateway_ : boolean_optional option)
    ?enable_vpc_networking:(enable_vpc_networking_ : boolean_optional option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?source_db_cluster_resource_id:(source_db_cluster_resource_id_ : string_ option)
    ?network_type:(network_type_ : string_ option) ?iops:(iops_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?port:(port_ : integer_optional option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?restore_to_time:(restore_to_time_ : t_stamp option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?restore_type:(restore_type_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     enable_internet_access_gateway = enable_internet_access_gateway_;
     enable_vpc_networking = enable_vpc_networking_;
     tag_specifications = tag_specifications_;
     engine_lifecycle_support = engine_lifecycle_support_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     engine_mode = engine_mode_;
     scaling_configuration = scaling_configuration_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     source_db_cluster_resource_id = source_db_cluster_resource_id_;
     network_type = network_type_;
     iops = iops_;
     publicly_accessible = publicly_accessible_;
     storage_type = storage_type_;
     db_cluster_instance_class = db_cluster_instance_class_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     deletion_protection = deletion_protection_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     backtrack_window = backtrack_window_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     vpc_security_group_ids = vpc_security_group_ids_;
     option_group_name = option_group_name_;
     db_subnet_group_name = db_subnet_group_name_;
     port = port_;
     use_latest_restorable_time = use_latest_restorable_time_;
     restore_to_time = restore_to_time_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     restore_type = restore_type_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : restore_db_cluster_to_point_in_time_message)

let make_restore_db_cluster_from_snapshot_message
    ?enable_internet_access_gateway:(enable_internet_access_gateway_ : boolean_optional option)
    ?enable_vpc_networking:(enable_vpc_networking_ : boolean_optional option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?network_type:(network_type_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?iops:(iops_ : integer_optional option) ?storage_type:(storage_type_ : string_ option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?engine_version:(engine_version_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~engine:(engine_ : string_) ~snapshot_identifier:(snapshot_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     enable_internet_access_gateway = enable_internet_access_gateway_;
     enable_vpc_networking = enable_vpc_networking_;
     tag_specifications = tag_specifications_;
     engine_lifecycle_support = engine_lifecycle_support_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     network_type = network_type_;
     publicly_accessible = publicly_accessible_;
     iops = iops_;
     storage_type = storage_type_;
     db_cluster_instance_class = db_cluster_instance_class_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     deletion_protection = deletion_protection_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     scaling_configuration = scaling_configuration_;
     engine_mode = engine_mode_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     backtrack_window = backtrack_window_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     vpc_security_group_ids = vpc_security_group_ids_;
     option_group_name = option_group_name_;
     database_name = database_name_;
     db_subnet_group_name = db_subnet_group_name_;
     port = port_;
     engine_version = engine_version_;
     engine = engine_;
     snapshot_identifier = snapshot_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     availability_zones = availability_zones_;
   }
    : restore_db_cluster_from_snapshot_message)

let make_restore_db_cluster_from_s3_message
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?network_type:(network_type_ : string_ option) ?storage_type:(storage_type_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?s3_prefix:(s3_prefix_ : string_ option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?port:(port_ : integer_optional option) ?engine_version:(engine_version_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~s3_ingestion_role_arn:(s3_ingestion_role_arn_ : string_)
    ~s3_bucket_name:(s3_bucket_name_ : string_)
    ~source_engine_version:(source_engine_version_ : string_)
    ~source_engine:(source_engine_ : string_) ~master_username:(master_username_ : string_)
    ~engine:(engine_ : string_) ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     tag_specifications = tag_specifications_;
     engine_lifecycle_support = engine_lifecycle_support_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     network_type = network_type_;
     storage_type = storage_type_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     deletion_protection = deletion_protection_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     backtrack_window = backtrack_window_;
     s3_ingestion_role_arn = s3_ingestion_role_arn_;
     s3_prefix = s3_prefix_;
     s3_bucket_name = s3_bucket_name_;
     source_engine_version = source_engine_version_;
     source_engine = source_engine_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     tags = tags_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     option_group_name = option_group_name_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     port = port_;
     engine_version = engine_version_;
     engine = engine_;
     db_subnet_group_name = db_subnet_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     db_cluster_identifier = db_cluster_identifier_;
     database_name = database_name_;
     character_set_name = character_set_name_;
     backup_retention_period = backup_retention_period_;
     availability_zones = availability_zones_;
   }
    : restore_db_cluster_from_s3_message)

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

let make_parameter ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?apply_method:(apply_method_ : apply_method option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?source:(source_ : string_ option)
    ?description:(description_ : string_ option)
    ?parameter_value:(parameter_value_ : potentially_sensitive_parameter_value option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({
     supported_engine_modes = supported_engine_modes_;
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

let make_reset_db_parameter_group_message ?parameters:(parameters_ : parameters_list option)
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({
     parameters = parameters_;
     reset_all_parameters = reset_all_parameters_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : reset_db_parameter_group_message)

let make_db_parameter_group_name_message
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : db_parameter_group_name_message)

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

let make_recurring_charge ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option)
    ?recurring_charge_amount:(recurring_charge_amount_ : double option) () =
  ({
     recurring_charge_frequency = recurring_charge_frequency_;
     recurring_charge_amount = recurring_charge_amount_;
   }
    : recurring_charge)

let make_reserved_db_instances_offering
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?multi_a_z:(multi_a_z_ : boolean_ option) ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?currency_code:(currency_code_ : string_ option) ?usage_price:(usage_price_ : double option)
    ?fixed_price:(fixed_price_ : double option) ?duration:(duration_ : integer option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option) () =
  ({
     recurring_charges = recurring_charges_;
     multi_a_z = multi_a_z_;
     offering_type = offering_type_;
     product_description = product_description_;
     currency_code = currency_code_;
     usage_price = usage_price_;
     fixed_price = fixed_price_;
     duration = duration_;
     db_instance_class = db_instance_class_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
   }
    : reserved_db_instances_offering)

let make_reserved_db_instances_offering_message
    ?reserved_db_instances_offerings:
      (reserved_db_instances_offerings_ : reserved_db_instances_offering_list option)
    ?marker:(marker_ : string_ option) () =
  ({ reserved_db_instances_offerings = reserved_db_instances_offerings_; marker = marker_ }
    : reserved_db_instances_offering_message)

let make_reserved_db_instance ?lease_id:(lease_id_ : string_ option)
    ?reserved_db_instance_arn:(reserved_db_instance_arn_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?state:(state_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?db_instance_count:(db_instance_count_ : integer option)
    ?currency_code:(currency_code_ : string_ option) ?usage_price:(usage_price_ : double option)
    ?fixed_price:(fixed_price_ : double option) ?duration:(duration_ : integer option)
    ?start_time:(start_time_ : t_stamp option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option) () =
  ({
     lease_id = lease_id_;
     reserved_db_instance_arn = reserved_db_instance_arn_;
     recurring_charges = recurring_charges_;
     state = state_;
     multi_a_z = multi_a_z_;
     offering_type = offering_type_;
     product_description = product_description_;
     db_instance_count = db_instance_count_;
     currency_code = currency_code_;
     usage_price = usage_price_;
     fixed_price = fixed_price_;
     duration = duration_;
     start_time = start_time_;
     db_instance_class = db_instance_class_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     reserved_db_instance_id = reserved_db_instance_id_;
   }
    : reserved_db_instance)

let make_reserved_db_instance_message
    ?reserved_db_instances:(reserved_db_instances_ : reserved_db_instance_list option)
    ?marker:(marker_ : string_ option) () =
  ({ reserved_db_instances = reserved_db_instances_; marker = marker_ }
    : reserved_db_instance_message)

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

let make_remove_role_from_db_instance_message ~feature_name:(feature_name_ : string_)
    ~role_arn:(role_arn_ : string_) ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     feature_name = feature_name_;
     role_arn = role_arn_;
     db_instance_identifier = db_instance_identifier_;
   }
    : remove_role_from_db_instance_message)

let make_remove_role_from_db_cluster_message ?feature_name:(feature_name_ : string_ option)
    ~role_arn:(role_arn_ : string_) ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     feature_name = feature_name_;
     role_arn = role_arn_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : remove_role_from_db_cluster_message)

let make_remove_from_global_cluster_message
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     db_cluster_identifier = db_cluster_identifier_;
     global_cluster_identifier = global_cluster_identifier_;
   }
    : remove_from_global_cluster_message)

let make_register_db_proxy_targets_response
    ?db_proxy_targets:(db_proxy_targets_ : target_list option) () =
  ({ db_proxy_targets = db_proxy_targets_ } : register_db_proxy_targets_response)

let make_register_db_proxy_targets_request
    ?db_cluster_identifiers:(db_cluster_identifiers_ : string_list option)
    ?db_instance_identifiers:(db_instance_identifiers_ : string_list option)
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     db_cluster_identifiers = db_cluster_identifiers_;
     db_instance_identifiers = db_instance_identifiers_;
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
   }
    : register_db_proxy_targets_request)

let make_reference_details
    ?scalar_reference_details:(scalar_reference_details_ : scalar_reference_details option) () =
  ({ scalar_reference_details = scalar_reference_details_ } : reference_details)

let make_recommended_action_update ~status:(status_ : string_) ~action_id:(action_id_ : string_) ()
    =
  ({ status = status_; action_id = action_id_ } : recommended_action_update)

let make_recommended_action_parameter ?value:(value_ : string_ option) ?key:(key_ : string_ option)
    () =
  ({ value = value_; key = key_ } : recommended_action_parameter)

let make_metric_reference ?reference_details:(reference_details_ : reference_details option)
    ?name:(name_ : string_ option) () =
  ({ reference_details = reference_details_; name = name_ } : metric_reference)

let make_performance_insights_metric_dimension_group ?limit:(limit_ : integer option)
    ?group:(group_ : string_ option) ?dimensions:(dimensions_ : string_list option) () =
  ({ limit = limit_; group = group_; dimensions = dimensions_ }
    : performance_insights_metric_dimension_group)

let make_performance_insights_metric_query ?metric:(metric_ : string_ option)
    ?group_by:(group_by_ : performance_insights_metric_dimension_group option) () =
  ({ metric = metric_; group_by = group_by_ } : performance_insights_metric_query)

let make_metric_query
    ?performance_insights_metric_query:
      (performance_insights_metric_query_ : performance_insights_metric_query option) () =
  ({ performance_insights_metric_query = performance_insights_metric_query_ } : metric_query)

let make_metric ?metric_query:(metric_query_ : metric_query option)
    ?statistics_details:(statistics_details_ : string_ option)
    ?references:(references_ : metric_reference_list option) ?name:(name_ : string_ option) () =
  ({
     metric_query = metric_query_;
     statistics_details = statistics_details_;
     references = references_;
     name = name_;
   }
    : metric)

let make_performance_issue_details ?analysis:(analysis_ : string_ option)
    ?metrics:(metrics_ : metric_list option) ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) () =
  ({ analysis = analysis_; metrics = metrics_; end_time = end_time_; start_time = start_time_ }
    : performance_issue_details)

let make_issue_details
    ?performance_issue_details:(performance_issue_details_ : performance_issue_details option) () =
  ({ performance_issue_details = performance_issue_details_ } : issue_details)

let make_context_attribute ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : context_attribute)

let make_recommended_action
    ?context_attributes:(context_attributes_ : context_attribute_list option)
    ?issue_details:(issue_details_ : issue_details option) ?status:(status_ : string_ option)
    ?apply_modes:(apply_modes_ : string_list option)
    ?parameters:(parameters_ : recommended_action_parameter_list option)
    ?operation:(operation_ : string_ option) ?description:(description_ : string_ option)
    ?title:(title_ : string_ option) ?action_id:(action_id_ : string_ option) () =
  ({
     context_attributes = context_attributes_;
     issue_details = issue_details_;
     status = status_;
     apply_modes = apply_modes_;
     parameters = parameters_;
     operation = operation_;
     description = description_;
     title = title_;
     action_id = action_id_;
   }
    : recommended_action)

let make_reboot_db_shard_group_message
    ~db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier) () =
  ({ db_shard_group_identifier = db_shard_group_identifier_ } : reboot_db_shard_group_message)

let make_db_shard_group ?tag_list:(tag_list_ : tag_list option)
    ?db_shard_group_arn:(db_shard_group_arn_ : string_ option)
    ?endpoint:(endpoint_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?status:(status_ : string_ option)
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ?min_ac_u:(min_ac_u_ : double_optional option) ?max_ac_u:(max_ac_u_ : double_optional option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier option)
    ?db_shard_group_resource_id:(db_shard_group_resource_id_ : string_ option) () =
  ({
     tag_list = tag_list_;
     db_shard_group_arn = db_shard_group_arn_;
     endpoint = endpoint_;
     publicly_accessible = publicly_accessible_;
     status = status_;
     compute_redundancy = compute_redundancy_;
     min_ac_u = min_ac_u_;
     max_ac_u = max_ac_u_;
     db_cluster_identifier = db_cluster_identifier_;
     db_shard_group_identifier = db_shard_group_identifier_;
     db_shard_group_resource_id = db_shard_group_resource_id_;
   }
    : db_shard_group)

let make_reboot_db_instance_message ?force_failover:(force_failover_ : boolean_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ force_failover = force_failover_; db_instance_identifier = db_instance_identifier_ }
    : reboot_db_instance_message)

let make_reboot_db_cluster_message ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : reboot_db_cluster_message)

let make_purchase_reserved_db_instances_offering_message ?tags:(tags_ : tag_list option)
    ?db_instance_count:(db_instance_count_ : integer_optional option)
    ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option)
    ~reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_) () =
  ({
     tags = tags_;
     db_instance_count = db_instance_count_;
     reserved_db_instance_id = reserved_db_instance_id_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
   }
    : purchase_reserved_db_instances_offering_message)

let make_promote_read_replica_message
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     tag_specifications = tag_specifications_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_instance_identifier = db_instance_identifier_;
   }
    : promote_read_replica_message)

let make_promote_read_replica_db_cluster_message
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({ db_cluster_identifier = db_cluster_identifier_ } : promote_read_replica_db_cluster_message)

let make_pending_maintenance_actions_message ?marker:(marker_ : string_ option)
    ?pending_maintenance_actions:(pending_maintenance_actions_ : pending_maintenance_actions option)
    () =
  ({ marker = marker_; pending_maintenance_actions = pending_maintenance_actions_ }
    : pending_maintenance_actions_message)

let make_available_additional_storage_volumes_option
    ?max_storage_throughput:(max_storage_throughput_ : integer_optional option)
    ?min_storage_throughput:(min_storage_throughput_ : integer_optional option)
    ?max_iops_per_gib:(max_iops_per_gib_ : double_optional option)
    ?min_iops_per_gib:(min_iops_per_gib_ : double_optional option)
    ?max_iops:(max_iops_ : integer_optional option) ?min_iops:(min_iops_ : integer_optional option)
    ?max_storage_size:(max_storage_size_ : integer_optional option)
    ?min_storage_size:(min_storage_size_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) ?supports_iops:(supports_iops_ : boolean_ option)
    ?supports_storage_throughput:(supports_storage_throughput_ : boolean_ option)
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_ option) () =
  ({
     max_storage_throughput = max_storage_throughput_;
     min_storage_throughput = min_storage_throughput_;
     max_iops_per_gib = max_iops_per_gib_;
     min_iops_per_gib = min_iops_per_gib_;
     max_iops = max_iops_;
     min_iops = min_iops_;
     max_storage_size = max_storage_size_;
     min_storage_size = min_storage_size_;
     storage_type = storage_type_;
     supports_iops = supports_iops_;
     supports_storage_throughput = supports_storage_throughput_;
     supports_storage_autoscaling = supports_storage_autoscaling_;
   }
    : available_additional_storage_volumes_option)

let make_orderable_db_instance_option
    ?available_additional_storage_volumes_options:
      (available_additional_storage_volumes_options_ :
         available_additional_storage_volumes_option_list option)
    ?supports_http_endpoint:(supports_http_endpoint_ : boolean_ option)
    ?supports_additional_storage_volumes:
      (supports_additional_storage_volumes_ : boolean_optional option)
    ?supports_dedicated_log_volume:(supports_dedicated_log_volume_ : boolean_ option)
    ?supports_clusters:(supports_clusters_ : boolean_ option)
    ?supported_network_types:(supported_network_types_ : string_list option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option)
    ?supported_activity_stream_modes:
      (supported_activity_stream_modes_ : activity_stream_mode_list option)
    ?outpost_capable:(outpost_capable_ : boolean_ option)
    ?supports_kerberos_authentication:(supports_kerberos_authentication_ : boolean_optional option)
    ?supports_storage_autoscaling:(supports_storage_autoscaling_ : boolean_optional option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?available_processor_features:
      (available_processor_features_ : available_processor_feature_list option)
    ?max_storage_throughput_per_iops:(max_storage_throughput_per_iops_ : double_optional option)
    ?min_storage_throughput_per_iops:(min_storage_throughput_per_iops_ : double_optional option)
    ?max_storage_throughput_per_db_instance:
      (max_storage_throughput_per_db_instance_ : integer_optional option)
    ?min_storage_throughput_per_db_instance:
      (min_storage_throughput_per_db_instance_ : integer_optional option)
    ?max_iops_per_gib:(max_iops_per_gib_ : double_optional option)
    ?min_iops_per_gib:(min_iops_per_gib_ : double_optional option)
    ?max_iops_per_db_instance:(max_iops_per_db_instance_ : integer_optional option)
    ?min_iops_per_db_instance:(min_iops_per_db_instance_ : integer_optional option)
    ?max_storage_size:(max_storage_size_ : integer_optional option)
    ?min_storage_size:(min_storage_size_ : integer_optional option)
    ?supports_performance_insights:(supports_performance_insights_ : boolean_ option)
    ?supports_iam_database_authentication:(supports_iam_database_authentication_ : boolean_ option)
    ?supports_enhanced_monitoring:(supports_enhanced_monitoring_ : boolean_ option)
    ?supports_storage_throughput:(supports_storage_throughput_ : boolean_ option)
    ?supports_iops:(supports_iops_ : boolean_ option) ?storage_type:(storage_type_ : string_ option)
    ?supports_storage_encryption:(supports_storage_encryption_ : boolean_ option)
    ?vpc:(vpc_ : boolean_ option) ?read_replica_capable:(read_replica_capable_ : boolean_ option)
    ?multi_az_capable:(multi_az_capable_ : boolean_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?availability_zone_group:(availability_zone_group_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     available_additional_storage_volumes_options = available_additional_storage_volumes_options_;
     supports_http_endpoint = supports_http_endpoint_;
     supports_additional_storage_volumes = supports_additional_storage_volumes_;
     supports_dedicated_log_volume = supports_dedicated_log_volume_;
     supports_clusters = supports_clusters_;
     supported_network_types = supported_network_types_;
     supports_global_databases = supports_global_databases_;
     supported_activity_stream_modes = supported_activity_stream_modes_;
     outpost_capable = outpost_capable_;
     supports_kerberos_authentication = supports_kerberos_authentication_;
     supports_storage_autoscaling = supports_storage_autoscaling_;
     supported_engine_modes = supported_engine_modes_;
     available_processor_features = available_processor_features_;
     max_storage_throughput_per_iops = max_storage_throughput_per_iops_;
     min_storage_throughput_per_iops = min_storage_throughput_per_iops_;
     max_storage_throughput_per_db_instance = max_storage_throughput_per_db_instance_;
     min_storage_throughput_per_db_instance = min_storage_throughput_per_db_instance_;
     max_iops_per_gib = max_iops_per_gib_;
     min_iops_per_gib = min_iops_per_gib_;
     max_iops_per_db_instance = max_iops_per_db_instance_;
     min_iops_per_db_instance = min_iops_per_db_instance_;
     max_storage_size = max_storage_size_;
     min_storage_size = min_storage_size_;
     supports_performance_insights = supports_performance_insights_;
     supports_iam_database_authentication = supports_iam_database_authentication_;
     supports_enhanced_monitoring = supports_enhanced_monitoring_;
     supports_storage_throughput = supports_storage_throughput_;
     supports_iops = supports_iops_;
     storage_type = storage_type_;
     supports_storage_encryption = supports_storage_encryption_;
     vpc = vpc_;
     read_replica_capable = read_replica_capable_;
     multi_az_capable = multi_az_capable_;
     availability_zones = availability_zones_;
     availability_zone_group = availability_zone_group_;
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

let make_option_setting ?is_collection:(is_collection_ : boolean_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?apply_type:(apply_type_ : string_ option) ?description:(description_ : string_ option)
    ?default_value:(default_value_ : string_ option)
    ?value:(value_ : potentially_sensitive_option_setting_value option)
    ?name:(name_ : string_ option) () =
  ({
     is_collection = is_collection_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     apply_type = apply_type_;
     description = description_;
     default_value = default_value_;
     value = value_;
     name = name_;
   }
    : option_setting)

let make_option_
    ?vpc_security_group_memberships:
      (vpc_security_group_memberships_ : vpc_security_group_membership_list option)
    ?db_security_group_memberships:
      (db_security_group_memberships_ : db_security_group_membership_list option)
    ?option_settings:(option_settings_ : option_setting_configuration_list option)
    ?option_version:(option_version_ : string_ option) ?port:(port_ : integer_optional option)
    ?permanent:(permanent_ : boolean_ option) ?persistent:(persistent_ : boolean_ option)
    ?option_description:(option_description_ : string_ option)
    ?option_name:(option_name_ : string_ option) () =
  ({
     vpc_security_group_memberships = vpc_security_group_memberships_;
     db_security_group_memberships = db_security_group_memberships_;
     option_settings = option_settings_;
     option_version = option_version_;
     port = port_;
     permanent = permanent_;
     persistent = persistent_;
     option_description = option_description_;
     option_name = option_name_;
   }
    : option_)

let make_option_version ?is_default:(is_default_ : boolean_ option)
    ?version:(version_ : string_ option) () =
  ({ is_default = is_default_; version = version_ } : option_version)

let make_option_group ?copy_timestamp:(copy_timestamp_ : t_stamp option)
    ?source_account_id:(source_account_id_ : string_ option)
    ?source_option_group:(source_option_group_ : string_ option)
    ?option_group_arn:(option_group_arn_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?allows_vpc_and_non_vpc_instance_memberships:
      (allows_vpc_and_non_vpc_instance_memberships_ : boolean_ option)
    ?options:(options_ : options_list option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine_name:(engine_name_ : string_ option)
    ?option_group_description:(option_group_description_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option) () =
  ({
     copy_timestamp = copy_timestamp_;
     source_account_id = source_account_id_;
     source_option_group = source_option_group_;
     option_group_arn = option_group_arn_;
     vpc_id = vpc_id_;
     allows_vpc_and_non_vpc_instance_memberships = allows_vpc_and_non_vpc_instance_memberships_;
     options = options_;
     major_engine_version = major_engine_version_;
     engine_name = engine_name_;
     option_group_description = option_group_description_;
     option_group_name = option_group_name_;
   }
    : option_group)

let make_option_groups ?marker:(marker_ : string_ option)
    ?option_groups_list:(option_groups_list_ : option_groups_list option) () =
  ({ marker = marker_; option_groups_list = option_groups_list_ } : option_groups)

let make_minimum_engine_version_per_allowed_value
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?allowed_value:(allowed_value_ : string_ option) () =
  ({ minimum_engine_version = minimum_engine_version_; allowed_value = allowed_value_ }
    : minimum_engine_version_per_allowed_value)

let make_option_group_option_setting
    ?minimum_engine_version_per_allowed_value:
      (minimum_engine_version_per_allowed_value_ :
         minimum_engine_version_per_allowed_value_list option)
    ?is_required:(is_required_ : boolean_ option) ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?apply_type:(apply_type_ : string_ option)
    ?default_value:(default_value_ : string_ option)
    ?setting_description:(setting_description_ : string_ option)
    ?setting_name:(setting_name_ : string_ option) () =
  ({
     minimum_engine_version_per_allowed_value = minimum_engine_version_per_allowed_value_;
     is_required = is_required_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     apply_type = apply_type_;
     default_value = default_value_;
     setting_description = setting_description_;
     setting_name = setting_name_;
   }
    : option_group_option_setting)

let make_option_group_option
    ?copyable_cross_account:(copyable_cross_account_ : boolean_optional option)
    ?option_group_option_versions:
      (option_group_option_versions_ : option_group_option_versions_list option)
    ?option_group_option_settings:
      (option_group_option_settings_ : option_group_option_settings_list option)
    ?supports_option_version_downgrade:
      (supports_option_version_downgrade_ : boolean_optional option)
    ?vpc_only:(vpc_only_ : boolean_ option)
    ?requires_auto_minor_engine_version_upgrade:
      (requires_auto_minor_engine_version_upgrade_ : boolean_ option)
    ?permanent:(permanent_ : boolean_ option) ?persistent:(persistent_ : boolean_ option)
    ?options_conflicts_with:(options_conflicts_with_ : options_conflicts_with option)
    ?options_depended_on:(options_depended_on_ : options_depended_on option)
    ?default_port:(default_port_ : integer_optional option)
    ?port_required:(port_required_ : boolean_ option)
    ?minimum_required_minor_engine_version:(minimum_required_minor_engine_version_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine_name:(engine_name_ : string_ option) ?description:(description_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     copyable_cross_account = copyable_cross_account_;
     option_group_option_versions = option_group_option_versions_;
     option_group_option_settings = option_group_option_settings_;
     supports_option_version_downgrade = supports_option_version_downgrade_;
     vpc_only = vpc_only_;
     requires_auto_minor_engine_version_upgrade = requires_auto_minor_engine_version_upgrade_;
     permanent = permanent_;
     persistent = persistent_;
     options_conflicts_with = options_conflicts_with_;
     options_depended_on = options_depended_on_;
     default_port = default_port_;
     port_required = port_required_;
     minimum_required_minor_engine_version = minimum_required_minor_engine_version_;
     major_engine_version = major_engine_version_;
     engine_name = engine_name_;
     description = description_;
     name = name_;
   }
    : option_group_option)

let make_option_group_options_message ?marker:(marker_ : string_ option)
    ?option_group_options:(option_group_options_ : option_group_options_list option) () =
  ({ marker = marker_; option_group_options = option_group_options_ }
    : option_group_options_message)

let make_option_configuration ?option_settings:(option_settings_ : option_settings_list option)
    ?vpc_security_group_memberships:
      (vpc_security_group_memberships_ : vpc_security_group_id_list option)
    ?db_security_group_memberships:
      (db_security_group_memberships_ : db_security_group_name_list option)
    ?option_version:(option_version_ : string_ option) ?port:(port_ : integer_optional option)
    ~option_name:(option_name_ : string_) () =
  ({
     option_settings = option_settings_;
     vpc_security_group_memberships = vpc_security_group_memberships_;
     db_security_group_memberships = db_security_group_memberships_;
     option_version = option_version_;
     port = port_;
     option_name = option_name_;
   }
    : option_configuration)

let make_modify_tenant_database_message
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?new_tenant_db_name:(new_tenant_db_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ~tenant_db_name:(tenant_db_name_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     rotate_master_user_password = rotate_master_user_password_;
     manage_master_user_password = manage_master_user_password_;
     new_tenant_db_name = new_tenant_db_name_;
     master_user_password = master_user_password_;
     tenant_db_name = tenant_db_name_;
     db_instance_identifier = db_instance_identifier_;
   }
    : modify_tenant_database_message)

let make_modify_option_group_message ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?options_to_remove:(options_to_remove_ : option_names_list option)
    ?options_to_include:(options_to_include_ : option_configuration_list option)
    ~option_group_name:(option_group_name_ : string_) () =
  ({
     apply_immediately = apply_immediately_;
     options_to_remove = options_to_remove_;
     options_to_include = options_to_include_;
     option_group_name = option_group_name_;
   }
    : modify_option_group_message)

let make_modify_integration_message ?description:(description_ : integration_description option)
    ?data_filter:(data_filter_ : data_filter option)
    ?integration_name:(integration_name_ : integration_name option)
    ~integration_identifier:(integration_identifier_ : integration_identifier) () =
  ({
     description = description_;
     data_filter = data_filter_;
     integration_name = integration_name_;
     integration_identifier = integration_identifier_;
   }
    : modify_integration_message)

let make_integration_error ?error_message:(error_message_ : string_ option)
    ~error_code:(error_code_ : string_) () =
  ({ error_message = error_message_; error_code = error_code_ } : integration_error)

let make_integration ?errors:(errors_ : integration_error_list option)
    ?create_time:(create_time_ : t_stamp option)
    ?description:(description_ : integration_description option)
    ?data_filter:(data_filter_ : data_filter option) ?tags:(tags_ : tag_list option)
    ?status:(status_ : integration_status option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?integration_arn:(integration_arn_ : integration_arn option)
    ?integration_name:(integration_name_ : integration_name option)
    ?target_arn:(target_arn_ : arn option) ?source_arn:(source_arn_ : source_arn option) () =
  ({
     errors = errors_;
     create_time = create_time_;
     description = description_;
     data_filter = data_filter_;
     tags = tags_;
     status = status_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_arn = integration_arn_;
     integration_name = integration_name_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : integration)

let make_modify_global_cluster_message
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?new_global_cluster_identifier:
      (new_global_cluster_identifier_ : global_cluster_identifier option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     allow_major_version_upgrade = allow_major_version_upgrade_;
     engine_version = engine_version_;
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

let make_db_snapshot ?snapshot_availability_zone:(snapshot_availability_zone_ : string_ option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_ option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?snapshot_database_time:(snapshot_database_time_ : t_stamp option)
    ?original_snapshot_create_time:(original_snapshot_create_time_ : t_stamp option)
    ?snapshot_target:(snapshot_target_ : string_ option) ?tag_list:(tag_list_ : tag_list option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?timezone:(timezone_ : string_ option) ?db_snapshot_arn:(db_snapshot_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?encrypted:(encrypted_ : boolean_ option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?source_db_snapshot_identifier:(source_db_snapshot_identifier_ : string_ option)
    ?source_region:(source_region_ : string_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?snapshot_type:(snapshot_type_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?instance_create_time:(instance_create_time_ : t_stamp option)
    ?vpc_id:(vpc_id_ : string_ option) ?availability_zone:(availability_zone_ : string_ option)
    ?port:(port_ : integer option) ?status:(status_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option) ?engine:(engine_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option) () =
  ({
     snapshot_availability_zone = snapshot_availability_zone_;
     additional_storage_volumes = additional_storage_volumes_;
     dedicated_log_volume = dedicated_log_volume_;
     multi_tenant = multi_tenant_;
     db_system_id = db_system_id_;
     snapshot_database_time = snapshot_database_time_;
     original_snapshot_create_time = original_snapshot_create_time_;
     snapshot_target = snapshot_target_;
     tag_list = tag_list_;
     dbi_resource_id = dbi_resource_id_;
     processor_features = processor_features_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     timezone = timezone_;
     db_snapshot_arn = db_snapshot_arn_;
     kms_key_id = kms_key_id_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     storage_encryption_type = storage_encryption_type_;
     encrypted = encrypted_;
     tde_credential_arn = tde_credential_arn_;
     storage_type = storage_type_;
     source_db_snapshot_identifier = source_db_snapshot_identifier_;
     source_region = source_region_;
     percent_progress = percent_progress_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     snapshot_type = snapshot_type_;
     license_model = license_model_;
     engine_version = engine_version_;
     master_username = master_username_;
     instance_create_time = instance_create_time_;
     vpc_id = vpc_id_;
     availability_zone = availability_zone_;
     port = port_;
     status = status_;
     allocated_storage = allocated_storage_;
     engine = engine_;
     snapshot_create_time = snapshot_create_time_;
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : db_snapshot)

let make_modify_db_snapshot_message ?option_group_name:(option_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({
     option_group_name = option_group_name_;
     engine_version = engine_version_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : modify_db_snapshot_message)

let make_db_snapshot_attribute ?attribute_values:(attribute_values_ : attribute_value_list option)
    ?attribute_name:(attribute_name_ : string_ option) () =
  ({ attribute_values = attribute_values_; attribute_name = attribute_name_ }
    : db_snapshot_attribute)

let make_modify_db_snapshot_attribute_message
    ?values_to_remove:(values_to_remove_ : attribute_value_list option)
    ?values_to_add:(values_to_add_ : attribute_value_list option)
    ~attribute_name:(attribute_name_ : string_)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({
     values_to_remove = values_to_remove_;
     values_to_add = values_to_add_;
     attribute_name = attribute_name_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : modify_db_snapshot_attribute_message)

let make_modify_db_shard_group_message
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ?min_ac_u:(min_ac_u_ : double_optional option) ?max_ac_u:(max_ac_u_ : double_optional option)
    ~db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier) () =
  ({
     compute_redundancy = compute_redundancy_;
     min_ac_u = min_ac_u_;
     max_ac_u = max_ac_u_;
     db_shard_group_identifier = db_shard_group_identifier_;
   }
    : modify_db_shard_group_message)

let make_modify_db_recommendation_message
    ?recommended_action_updates:
      (recommended_action_updates_ : recommended_action_update_list option)
    ?status:(status_ : string_ option) ?locale:(locale_ : string_ option)
    ~recommendation_id:(recommendation_id_ : string_) () =
  ({
     recommended_action_updates = recommended_action_updates_;
     status = status_;
     locale = locale_;
     recommendation_id = recommendation_id_;
   }
    : modify_db_recommendation_message)

let make_doc_link ?url:(url_ : string_ option) ?text:(text_ : string_ option) () =
  ({ url = url_; text = text_ } : doc_link)

let make_db_recommendation ?issue_details:(issue_details_ : issue_details option)
    ?links:(links_ : doc_link_list option) ?additional_info:(additional_info_ : string_ option)
    ?impact:(impact_ : string_ option) ?type_recommendation:(type_recommendation_ : string_ option)
    ?type_detection:(type_detection_ : string_ option) ?source:(source_ : string_ option)
    ?category:(category_ : string_ option)
    ?recommended_actions:(recommended_actions_ : recommended_action_list option)
    ?reason:(reason_ : string_ option) ?description:(description_ : string_ option)
    ?recommendation:(recommendation_ : string_ option) ?detection:(detection_ : string_ option)
    ?updated_time:(updated_time_ : t_stamp option) ?created_time:(created_time_ : t_stamp option)
    ?status:(status_ : string_ option) ?resource_arn:(resource_arn_ : string_ option)
    ?severity:(severity_ : string_ option) ?type_id:(type_id_ : string_ option)
    ?recommendation_id:(recommendation_id_ : string_ option) () =
  ({
     issue_details = issue_details_;
     links = links_;
     additional_info = additional_info_;
     impact = impact_;
     type_recommendation = type_recommendation_;
     type_detection = type_detection_;
     source = source_;
     category = category_;
     recommended_actions = recommended_actions_;
     reason = reason_;
     description = description_;
     recommendation = recommendation_;
     detection = detection_;
     updated_time = updated_time_;
     created_time = created_time_;
     status = status_;
     resource_arn = resource_arn_;
     severity = severity_;
     type_id = type_id_;
     recommendation_id = recommendation_id_;
   }
    : db_recommendation)

let make_db_recommendation_message
    ?db_recommendation:(db_recommendation_ : db_recommendation option) () =
  ({ db_recommendation = db_recommendation_ } : db_recommendation_message)

let make_modify_db_proxy_target_group_response
    ?db_proxy_target_group:(db_proxy_target_group_ : db_proxy_target_group option) () =
  ({ db_proxy_target_group = db_proxy_target_group_ } : modify_db_proxy_target_group_response)

let make_connection_pool_configuration ?init_query:(init_query_ : operator_sensitive_string option)
    ?session_pinning_filters:(session_pinning_filters_ : string_list option)
    ?connection_borrow_timeout:(connection_borrow_timeout_ : integer_optional option)
    ?max_idle_connections_percent:(max_idle_connections_percent_ : integer_optional option)
    ?max_connections_percent:(max_connections_percent_ : integer_optional option) () =
  ({
     init_query = init_query_;
     session_pinning_filters = session_pinning_filters_;
     connection_borrow_timeout = connection_borrow_timeout_;
     max_idle_connections_percent = max_idle_connections_percent_;
     max_connections_percent = max_connections_percent_;
   }
    : connection_pool_configuration)

let make_modify_db_proxy_target_group_request ?new_name:(new_name_ : string_ option)
    ?connection_pool_config:(connection_pool_config_ : connection_pool_configuration option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name)
    ~target_group_name:(target_group_name_ : db_proxy_target_group_name) () =
  ({
     new_name = new_name_;
     connection_pool_config = connection_pool_config_;
     db_proxy_name = db_proxy_name_;
     target_group_name = target_group_name_;
   }
    : modify_db_proxy_target_group_request)

let make_db_proxy
    ?target_connection_network_type:
      (target_connection_network_type_ : target_connection_network_type option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?updated_date:(updated_date_ : t_stamp option) ?created_date:(created_date_ : t_stamp option)
    ?debug_logging:(debug_logging_ : boolean_ option)
    ?idle_client_timeout:(idle_client_timeout_ : integer option)
    ?require_tl_s:(require_tl_s_ : boolean_ option) ?endpoint:(endpoint_ : string_ option)
    ?role_arn:(role_arn_ : string_ option) ?auth:(auth_ : user_auth_config_info_list option)
    ?default_auth_scheme:(default_auth_scheme_ : string_ option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : string_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?vpc_id:(vpc_id_ : string_ option) ?engine_family:(engine_family_ : string_ option)
    ?status:(status_ : db_proxy_status option) ?db_proxy_arn:(db_proxy_arn_ : string_ option)
    ?db_proxy_name:(db_proxy_name_ : string_ option) () =
  ({
     target_connection_network_type = target_connection_network_type_;
     endpoint_network_type = endpoint_network_type_;
     updated_date = updated_date_;
     created_date = created_date_;
     debug_logging = debug_logging_;
     idle_client_timeout = idle_client_timeout_;
     require_tl_s = require_tl_s_;
     endpoint = endpoint_;
     role_arn = role_arn_;
     auth = auth_;
     default_auth_scheme = default_auth_scheme_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_id = vpc_id_;
     engine_family = engine_family_;
     status = status_;
     db_proxy_arn = db_proxy_arn_;
     db_proxy_name = db_proxy_name_;
   }
    : db_proxy)

let make_modify_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : modify_db_proxy_response)

let make_modify_db_proxy_request ?security_groups:(security_groups_ : string_list option)
    ?role_arn:(role_arn_ : arn option) ?debug_logging:(debug_logging_ : boolean_optional option)
    ?idle_client_timeout:(idle_client_timeout_ : integer_optional option)
    ?require_tl_s:(require_tl_s_ : boolean_optional option)
    ?auth:(auth_ : user_auth_config_list option)
    ?default_auth_scheme:(default_auth_scheme_ : default_auth_scheme option)
    ?new_db_proxy_name:(new_db_proxy_name_ : db_proxy_name option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     security_groups = security_groups_;
     role_arn = role_arn_;
     debug_logging = debug_logging_;
     idle_client_timeout = idle_client_timeout_;
     require_tl_s = require_tl_s_;
     auth = auth_;
     default_auth_scheme = default_auth_scheme_;
     new_db_proxy_name = new_db_proxy_name_;
     db_proxy_name = db_proxy_name_;
   }
    : modify_db_proxy_request)

let make_db_proxy_endpoint
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?is_default:(is_default_ : boolean_ option)
    ?target_role:(target_role_ : db_proxy_endpoint_target_role option)
    ?created_date:(created_date_ : t_stamp option) ?endpoint:(endpoint_ : string_ option)
    ?vpc_subnet_ids:(vpc_subnet_ids_ : string_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?vpc_id:(vpc_id_ : string_ option) ?status:(status_ : db_proxy_endpoint_status option)
    ?db_proxy_name:(db_proxy_name_ : string_ option)
    ?db_proxy_endpoint_arn:(db_proxy_endpoint_arn_ : string_ option)
    ?db_proxy_endpoint_name:(db_proxy_endpoint_name_ : string_ option) () =
  ({
     endpoint_network_type = endpoint_network_type_;
     is_default = is_default_;
     target_role = target_role_;
     created_date = created_date_;
     endpoint = endpoint_;
     vpc_subnet_ids = vpc_subnet_ids_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_id = vpc_id_;
     status = status_;
     db_proxy_name = db_proxy_name_;
     db_proxy_endpoint_arn = db_proxy_endpoint_arn_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
   }
    : db_proxy_endpoint)

let make_modify_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : modify_db_proxy_endpoint_response)

let make_modify_db_proxy_endpoint_request
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?new_db_proxy_endpoint_name:(new_db_proxy_endpoint_name_ : db_proxy_endpoint_name option)
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name) () =
  ({
     vpc_security_group_ids = vpc_security_group_ids_;
     new_db_proxy_endpoint_name = new_db_proxy_endpoint_name_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
   }
    : modify_db_proxy_endpoint_request)

let make_modify_db_parameter_group_message ~parameters:(parameters_ : parameters_list)
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({ parameters = parameters_; db_parameter_group_name = db_parameter_group_name_ }
    : modify_db_parameter_group_message)

let make_cloudwatch_logs_export_configuration
    ?disable_log_types:(disable_log_types_ : log_type_list option)
    ?enable_log_types:(enable_log_types_ : log_type_list option) () =
  ({ disable_log_types = disable_log_types_; enable_log_types = enable_log_types_ }
    : cloudwatch_logs_export_configuration)

let make_modify_additional_storage_volume
    ?set_for_delete:(set_for_delete_ : boolean_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?iop_s:(iop_s_ : integer_optional option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ~volume_name:(volume_name_ : string_) () =
  ({
     set_for_delete = set_for_delete_;
     storage_type = storage_type_;
     storage_throughput = storage_throughput_;
     max_allocated_storage = max_allocated_storage_;
     iop_s = iop_s_;
     allocated_storage = allocated_storage_;
     volume_name = volume_name_;
   }
    : modify_additional_storage_volume)

let make_modify_db_instance_message
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : modify_additional_storage_volumes_list option)
    ?engine:(engine_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?aws_backup_recovery_point_arn:
      (aws_backup_recovery_point_arn_ : aws_backup_recovery_point_arn option)
    ?network_type:(network_type_ : string_ option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?resume_full_automation_mode_minutes:
      (resume_full_automation_mode_minutes_ : integer_optional option)
    ?automation_mode:(automation_mode_ : automation_mode option)
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?certificate_rotation_restart:(certificate_rotation_restart_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?db_port_number:(db_port_number_ : integer_optional option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?disable_domain:(disable_domain_ : boolean_optional option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?new_db_instance_identifier:(new_db_instance_identifier_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_security_groups:(db_security_groups_ : db_security_group_name_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     master_user_authentication_type = master_user_authentication_type_;
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     engine = engine_;
     dedicated_log_volume = dedicated_log_volume_;
     multi_tenant = multi_tenant_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     rotate_master_user_password = rotate_master_user_password_;
     manage_master_user_password = manage_master_user_password_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     network_type = network_type_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     resume_full_automation_mode_minutes = resume_full_automation_mode_minutes_;
     automation_mode = automation_mode_;
     replica_mode = replica_mode_;
     certificate_rotation_restart = certificate_rotation_restart_;
     max_allocated_storage = max_allocated_storage_;
     deletion_protection = deletion_protection_;
     use_default_processor_features = use_default_processor_features_;
     processor_features = processor_features_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     promotion_tier = promotion_tier_;
     domain_iam_role_name = domain_iam_role_name_;
     monitoring_role_arn = monitoring_role_arn_;
     publicly_accessible = publicly_accessible_;
     db_port_number = db_port_number_;
     monitoring_interval = monitoring_interval_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     disable_domain = disable_domain_;
     domain_dns_ips = domain_dns_ips_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_ou = domain_ou_;
     domain_fqdn = domain_fqdn_;
     domain = domain_;
     ca_certificate_identifier = ca_certificate_identifier_;
     tde_credential_password = tde_credential_password_;
     tde_credential_arn = tde_credential_arn_;
     storage_type = storage_type_;
     new_db_instance_identifier = new_db_instance_identifier_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     license_model = license_model_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_parameter_group_name = db_parameter_group_name_;
     master_user_password = master_user_password_;
     apply_immediately = apply_immediately_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_security_groups = db_security_groups_;
     db_subnet_group_name = db_subnet_group_name_;
     db_instance_class = db_instance_class_;
     allocated_storage = allocated_storage_;
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

let make_modify_db_cluster_message
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?enable_limitless_database:(enable_limitless_database_ : boolean_optional option)
    ?aws_backup_recovery_point_arn:
      (aws_backup_recovery_point_arn_ : aws_backup_recovery_point_arn option)
    ?allow_engine_mode_change:(allow_engine_mode_change_ : boolean_ option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?enable_local_write_forwarding:(enable_local_write_forwarding_ : boolean_optional option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_optional option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?network_type:(network_type_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?iops:(iops_ : integer_optional option) ?storage_type:(storage_type_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?enable_global_write_forwarding:(enable_global_write_forwarding_ : boolean_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?enable_http_endpoint:(enable_http_endpoint_ : boolean_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?db_instance_parameter_group_name:(db_instance_parameter_group_name_ : string_ option)
    ?allow_major_version_upgrade:(allow_major_version_upgrade_ : boolean_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?cloudwatch_logs_export_configuration:
      (cloudwatch_logs_export_configuration_ : cloudwatch_logs_export_configuration option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?port:(port_ : integer_optional option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?new_db_cluster_identifier:(new_db_cluster_identifier_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     master_user_authentication_type = master_user_authentication_type_;
     ca_certificate_identifier = ca_certificate_identifier_;
     enable_limitless_database = enable_limitless_database_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     allow_engine_mode_change = allow_engine_mode_change_;
     engine_mode = engine_mode_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     enable_local_write_forwarding = enable_local_write_forwarding_;
     rotate_master_user_password = rotate_master_user_password_;
     manage_master_user_password = manage_master_user_password_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     network_type = network_type_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     iops = iops_;
     storage_type = storage_type_;
     allocated_storage = allocated_storage_;
     db_cluster_instance_class = db_cluster_instance_class_;
     enable_global_write_forwarding = enable_global_write_forwarding_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     enable_http_endpoint = enable_http_endpoint_;
     deletion_protection = deletion_protection_;
     scaling_configuration = scaling_configuration_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     db_instance_parameter_group_name = db_instance_parameter_group_name_;
     allow_major_version_upgrade = allow_major_version_upgrade_;
     engine_version = engine_version_;
     cloudwatch_logs_export_configuration = cloudwatch_logs_export_configuration_;
     backtrack_window = backtrack_window_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     option_group_name = option_group_name_;
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

let make_modify_db_cluster_endpoint_message
    ?excluded_members:(excluded_members_ : string_list option)
    ?static_members:(static_members_ : string_list option)
    ?endpoint_type:(endpoint_type_ : string_ option)
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_) () =
  ({
     excluded_members = excluded_members_;
     static_members = static_members_;
     endpoint_type = endpoint_type_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
   }
    : modify_db_cluster_endpoint_message)

let make_db_cluster_endpoint ?db_cluster_endpoint_arn:(db_cluster_endpoint_arn_ : string_ option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?static_members:(static_members_ : string_list option)
    ?custom_endpoint_type:(custom_endpoint_type_ : string_ option)
    ?endpoint_type:(endpoint_type_ : string_ option) ?status:(status_ : string_ option)
    ?endpoint:(endpoint_ : string_ option)
    ?db_cluster_endpoint_resource_identifier:
      (db_cluster_endpoint_resource_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option) () =
  ({
     db_cluster_endpoint_arn = db_cluster_endpoint_arn_;
     excluded_members = excluded_members_;
     static_members = static_members_;
     custom_endpoint_type = custom_endpoint_type_;
     endpoint_type = endpoint_type_;
     status = status_;
     endpoint = endpoint_;
     db_cluster_endpoint_resource_identifier = db_cluster_endpoint_resource_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
   }
    : db_cluster_endpoint)

let make_modify_custom_db_engine_version_message
    ?status:(status_ : custom_engine_version_status option)
    ?description:(description_ : description option)
    ~engine_version:(engine_version_ : custom_engine_version) ~engine:(engine_ : custom_engine_name)
    () =
  ({
     status = status_;
     description = description_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : modify_custom_db_engine_version_message)

let make_custom_db_engine_version_am_i ?status:(status_ : string_ option)
    ?image_id:(image_id_ : string_ option) () =
  ({ status = status_; image_id = image_id_ } : custom_db_engine_version_am_i)

let make_db_engine_version
    ?serverless_v2_features_support:
      (serverless_v2_features_support_ : serverless_v2_features_support option)
    ?supports_integrations:(supports_integrations_ : boolean_ option)
    ?supports_local_write_forwarding:(supports_local_write_forwarding_ : boolean_optional option)
    ?supported_ca_certificate_identifiers:
      (supported_ca_certificate_identifiers_ : ca_certificate_identifiers_list option)
    ?supports_certificate_rotation_without_restart:
      (supports_certificate_rotation_without_restart_ : boolean_optional option)
    ?supports_limitless_database:(supports_limitless_database_ : boolean_ option)
    ?supports_babelfish:(supports_babelfish_ : boolean_ option)
    ?tag_list:(tag_list_ : tag_list option)
    ?supports_global_databases:(supports_global_databases_ : boolean_ option)
    ?supports_parallel_query:(supports_parallel_query_ : boolean_ option)
    ?status:(status_ : string_ option)
    ?supported_feature_names:(supported_feature_names_ : feature_name_list option)
    ?supported_engine_modes:(supported_engine_modes_ : engine_mode_list option)
    ?supports_read_replica:(supports_read_replica_ : boolean_ option)
    ?supports_log_exports_to_cloudwatch_logs:
      (supports_log_exports_to_cloudwatch_logs_ : boolean_ option)
    ?exportable_log_types:(exportable_log_types_ : log_type_list option)
    ?supported_timezones:(supported_timezones_ : supported_timezones_list option)
    ?valid_upgrade_target:(valid_upgrade_target_ : valid_upgrade_target_list option)
    ?supported_nchar_character_sets:
      (supported_nchar_character_sets_ : supported_character_sets_list option)
    ?supported_character_sets:(supported_character_sets_ : supported_character_sets_list option)
    ?create_time:(create_time_ : t_stamp option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?db_engine_media_type:(db_engine_media_type_ : string_ option)
    ?image:(image_ : custom_db_engine_version_am_i option)
    ?failure_reason:(failure_reason_ : string_ option)
    ?default_character_set:(default_character_set_ : character_set option)
    ?db_engine_version_description:(db_engine_version_description_ : string_ option)
    ?db_engine_version_arn:(db_engine_version_arn_ : string_ option)
    ?db_engine_description:(db_engine_description_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?custom_db_engine_version_manifest:
      (custom_db_engine_version_manifest_ : custom_db_engine_version_manifest option)
    ?database_installation_files:(database_installation_files_ : string_list option)
    ?database_installation_files_s3_prefix:(database_installation_files_s3_prefix_ : string_ option)
    ?database_installation_files_s3_bucket_name:
      (database_installation_files_s3_bucket_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine:(engine_ : string_ option) () =
  ({
     serverless_v2_features_support = serverless_v2_features_support_;
     supports_integrations = supports_integrations_;
     supports_local_write_forwarding = supports_local_write_forwarding_;
     supported_ca_certificate_identifiers = supported_ca_certificate_identifiers_;
     supports_certificate_rotation_without_restart = supports_certificate_rotation_without_restart_;
     supports_limitless_database = supports_limitless_database_;
     supports_babelfish = supports_babelfish_;
     tag_list = tag_list_;
     supports_global_databases = supports_global_databases_;
     supports_parallel_query = supports_parallel_query_;
     status = status_;
     supported_feature_names = supported_feature_names_;
     supported_engine_modes = supported_engine_modes_;
     supports_read_replica = supports_read_replica_;
     supports_log_exports_to_cloudwatch_logs = supports_log_exports_to_cloudwatch_logs_;
     exportable_log_types = exportable_log_types_;
     supported_timezones = supported_timezones_;
     valid_upgrade_target = valid_upgrade_target_;
     supported_nchar_character_sets = supported_nchar_character_sets_;
     supported_character_sets = supported_character_sets_;
     create_time = create_time_;
     kms_key_id = kms_key_id_;
     db_engine_media_type = db_engine_media_type_;
     image = image_;
     failure_reason = failure_reason_;
     default_character_set = default_character_set_;
     db_engine_version_description = db_engine_version_description_;
     db_engine_version_arn = db_engine_version_arn_;
     db_engine_description = db_engine_description_;
     db_parameter_group_family = db_parameter_group_family_;
     custom_db_engine_version_manifest = custom_db_engine_version_manifest_;
     database_installation_files = database_installation_files_;
     database_installation_files_s3_prefix = database_installation_files_s3_prefix_;
     database_installation_files_s3_bucket_name = database_installation_files_s3_bucket_name_;
     engine_version = engine_version_;
     major_engine_version = major_engine_version_;
     engine = engine_;
   }
    : db_engine_version)

let make_modify_current_db_cluster_capacity_message
    ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?capacity:(capacity_ : integer_optional option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     timeout_action = timeout_action_;
     seconds_before_timeout = seconds_before_timeout_;
     capacity = capacity_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : modify_current_db_cluster_capacity_message)

let make_db_cluster_capacity_info ?timeout_action:(timeout_action_ : string_ option)
    ?seconds_before_timeout:(seconds_before_timeout_ : integer_optional option)
    ?current_capacity:(current_capacity_ : integer_optional option)
    ?pending_capacity:(pending_capacity_ : integer_optional option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     timeout_action = timeout_action_;
     seconds_before_timeout = seconds_before_timeout_;
     current_capacity = current_capacity_;
     pending_capacity = pending_capacity_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : db_cluster_capacity_info)

let make_certificate ?customer_override_valid_till:(customer_override_valid_till_ : t_stamp option)
    ?customer_override:(customer_override_ : boolean_optional option)
    ?certificate_arn:(certificate_arn_ : string_ option) ?valid_till:(valid_till_ : t_stamp option)
    ?valid_from:(valid_from_ : t_stamp option) ?thumbprint:(thumbprint_ : string_ option)
    ?certificate_type:(certificate_type_ : string_ option)
    ?certificate_identifier:(certificate_identifier_ : string_ option) () =
  ({
     customer_override_valid_till = customer_override_valid_till_;
     customer_override = customer_override_;
     certificate_arn = certificate_arn_;
     valid_till = valid_till_;
     valid_from = valid_from_;
     thumbprint = thumbprint_;
     certificate_type = certificate_type_;
     certificate_identifier = certificate_identifier_;
   }
    : certificate)

let make_modify_certificates_message
    ?remove_customer_override:(remove_customer_override_ : boolean_optional option)
    ?certificate_identifier:(certificate_identifier_ : string_ option) () =
  ({
     remove_customer_override = remove_customer_override_;
     certificate_identifier = certificate_identifier_;
   }
    : modify_certificates_message)

let make_modify_activity_stream_response
    ?policy_status:(policy_status_ : activity_stream_policy_status option)
    ?engine_native_audit_fields_included:
      (engine_native_audit_fields_included_ : boolean_optional option)
    ?mode:(mode_ : activity_stream_mode option) ?status:(status_ : activity_stream_status option)
    ?kinesis_stream_name:(kinesis_stream_name_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({
     policy_status = policy_status_;
     engine_native_audit_fields_included = engine_native_audit_fields_included_;
     mode = mode_;
     status = status_;
     kinesis_stream_name = kinesis_stream_name_;
     kms_key_id = kms_key_id_;
   }
    : modify_activity_stream_response)

let make_modify_activity_stream_request
    ?audit_policy_state:(audit_policy_state_ : audit_policy_state option)
    ?resource_arn:(resource_arn_ : string_ option) () =
  ({ audit_policy_state = audit_policy_state_; resource_arn = resource_arn_ }
    : modify_activity_stream_request)

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
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     target_db_instance_identifier = target_db_instance_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : failover_db_cluster_message)

let make_export_tasks_message ?export_tasks:(export_tasks_ : export_tasks_list option)
    ?marker:(marker_ : string_ option) () =
  ({ export_tasks = export_tasks_; marker = marker_ } : export_tasks_message)

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

let make_enable_http_endpoint_response
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_ option)
    ?resource_arn:(resource_arn_ : string_ option) () =
  ({ http_endpoint_enabled = http_endpoint_enabled_; resource_arn = resource_arn_ }
    : enable_http_endpoint_response)

let make_enable_http_endpoint_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : enable_http_endpoint_request)

let make_download_db_log_file_portion_message ?number_of_lines:(number_of_lines_ : integer option)
    ?marker:(marker_ : string_ option) ~log_file_name:(log_file_name_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     number_of_lines = number_of_lines_;
     marker = marker_;
     log_file_name = log_file_name_;
     db_instance_identifier = db_instance_identifier_;
   }
    : download_db_log_file_portion_message)

let make_download_db_log_file_portion_details
    ?additional_data_pending:(additional_data_pending_ : boolean_ option)
    ?marker:(marker_ : string_ option) ?log_file_data:(log_file_data_ : sensitive_string option) ()
    =
  ({
     additional_data_pending = additional_data_pending_;
     marker = marker_;
     log_file_data = log_file_data_;
   }
    : download_db_log_file_portion_details)

let make_disable_http_endpoint_response
    ?http_endpoint_enabled:(http_endpoint_enabled_ : boolean_ option)
    ?resource_arn:(resource_arn_ : string_ option) () =
  ({ http_endpoint_enabled = http_endpoint_enabled_; resource_arn = resource_arn_ }
    : disable_http_endpoint_response)

let make_disable_http_endpoint_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : disable_http_endpoint_request)

let make_describe_valid_db_instance_modifications_message
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({ db_instance_identifier = db_instance_identifier_ }
    : describe_valid_db_instance_modifications_message)

let make_describe_tenant_databases_message ?max_records:(max_records_ : integer_optional option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?tenant_db_name:(tenant_db_name_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     tenant_db_name = tenant_db_name_;
     db_instance_identifier = db_instance_identifier_;
   }
    : describe_tenant_databases_message)

let make_describe_source_regions_message ?filters:(filters_ : filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?region_name:(region_name_ : string_ option) () =
  ({ filters = filters_; marker = marker_; max_records = max_records_; region_name = region_name_ }
    : describe_source_regions_message)

let make_describe_serverless_v2_platform_versions_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option)
    ?include_all:(include_all_ : boolean_optional option)
    ?default_only:(default_only_ : boolean_optional option) ?filters:(filters_ : filter_list option)
    ?engine:(engine_ : string_ option)
    ?serverless_v2_platform_version:(serverless_v2_platform_version_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     include_all = include_all_;
     default_only = default_only_;
     filters = filters_;
     engine = engine_;
     serverless_v2_platform_version = serverless_v2_platform_version_;
   }
    : describe_serverless_v2_platform_versions_message)

let make_describe_reserved_db_instances_offerings_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?duration:(duration_ : string_ option) ?db_instance_class:(db_instance_class_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     multi_a_z = multi_a_z_;
     offering_type = offering_type_;
     product_description = product_description_;
     duration = duration_;
     db_instance_class = db_instance_class_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
   }
    : describe_reserved_db_instances_offerings_message)

let make_describe_reserved_db_instances_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?lease_id:(lease_id_ : string_ option) ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?offering_type:(offering_type_ : string_ option)
    ?product_description:(product_description_ : string_ option)
    ?duration:(duration_ : string_ option) ?db_instance_class:(db_instance_class_ : string_ option)
    ?reserved_db_instances_offering_id:(reserved_db_instances_offering_id_ : string_ option)
    ?reserved_db_instance_id:(reserved_db_instance_id_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     lease_id = lease_id_;
     multi_a_z = multi_a_z_;
     offering_type = offering_type_;
     product_description = product_description_;
     duration = duration_;
     db_instance_class = db_instance_class_;
     reserved_db_instances_offering_id = reserved_db_instances_offering_id_;
     reserved_db_instance_id = reserved_db_instance_id_;
   }
    : describe_reserved_db_instances_message)

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
    ?vpc:(vpc_ : boolean_optional option)
    ?availability_zone_group:(availability_zone_group_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ~engine:(engine_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     vpc = vpc_;
     availability_zone_group = availability_zone_group_;
     license_model = license_model_;
     db_instance_class = db_instance_class_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : describe_orderable_db_instance_options_message)

let make_describe_option_groups_message
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine_name:(engine_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option)
    ?option_group_name:(option_group_name_ : string_ option) () =
  ({
     major_engine_version = major_engine_version_;
     engine_name = engine_name_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     option_group_name = option_group_name_;
   }
    : describe_option_groups_message)

let make_describe_option_group_options_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ~engine_name:(engine_name_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     major_engine_version = major_engine_version_;
     engine_name = engine_name_;
   }
    : describe_option_group_options_message)

let make_describe_integrations_response ?integrations:(integrations_ : integration_list option)
    ?marker:(marker_ : marker option) () =
  ({ integrations = integrations_; marker = marker_ } : describe_integrations_response)

let make_describe_integrations_message ?marker:(marker_ : marker option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?integration_identifier:(integration_identifier_ : integration_identifier option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     integration_identifier = integration_identifier_;
   }
    : describe_integrations_message)

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

let make_describe_export_tasks_message ?source_type:(source_type_ : export_source_type option)
    ?max_records:(max_records_ : max_records option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : filter_list option) ?source_arn:(source_arn_ : string_ option)
    ?export_task_identifier:(export_task_identifier_ : string_ option) () =
  ({
     source_type = source_type_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     source_arn = source_arn_;
     export_task_identifier = export_task_identifier_;
   }
    : describe_export_tasks_message)

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

let make_describe_engine_default_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_parameter_group_family = db_parameter_group_family_;
   }
    : describe_engine_default_parameters_message)

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

let make_describe_db_snapshots_message ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?include_public:(include_public_ : boolean_ option)
    ?include_shared:(include_shared_ : boolean_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     dbi_resource_id = dbi_resource_id_;
     include_public = include_public_;
     include_shared = include_shared_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     snapshot_type = snapshot_type_;
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
   }
    : describe_db_snapshots_message)

let make_db_snapshot_message ?db_snapshots:(db_snapshots_ : db_snapshot_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_snapshots = db_snapshots_; marker = marker_ } : db_snapshot_message)

let make_describe_db_snapshot_tenant_databases_message
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option) () =
  ({
     dbi_resource_id = dbi_resource_id_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     snapshot_type = snapshot_type_;
     db_snapshot_identifier = db_snapshot_identifier_;
     db_instance_identifier = db_instance_identifier_;
   }
    : describe_db_snapshot_tenant_databases_message)

let make_db_snapshot_tenant_database ?tag_list:(tag_list_ : tag_list option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?db_snapshot_tenant_database_ar_n:(db_snapshot_tenant_database_ar_n_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?tenant_database_resource_id:(tenant_database_resource_id_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?tenant_db_name:(tenant_db_name_ : string_ option)
    ?tenant_database_create_time:(tenant_database_create_time_ : t_stamp option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?engine_name:(engine_name_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?db_snapshot_identifier:(db_snapshot_identifier_ : string_ option) () =
  ({
     tag_list = tag_list_;
     nchar_character_set_name = nchar_character_set_name_;
     db_snapshot_tenant_database_ar_n = db_snapshot_tenant_database_ar_n_;
     character_set_name = character_set_name_;
     tenant_database_resource_id = tenant_database_resource_id_;
     master_username = master_username_;
     tenant_db_name = tenant_db_name_;
     tenant_database_create_time = tenant_database_create_time_;
     snapshot_type = snapshot_type_;
     engine_name = engine_name_;
     dbi_resource_id = dbi_resource_id_;
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : db_snapshot_tenant_database)

let make_db_snapshot_tenant_databases_message
    ?db_snapshot_tenant_databases:
      (db_snapshot_tenant_databases_ : db_snapshot_tenant_databases_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_snapshot_tenant_databases = db_snapshot_tenant_databases_; marker = marker_ }
    : db_snapshot_tenant_databases_message)

let make_describe_db_snapshot_attributes_message
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({ db_snapshot_identifier = db_snapshot_identifier_ } : describe_db_snapshot_attributes_message)

let make_describe_db_shard_groups_response ?marker:(marker_ : string_ option)
    ?db_shard_groups:(db_shard_groups_ : db_shard_groups_list option) () =
  ({ marker = marker_; db_shard_groups = db_shard_groups_ } : describe_db_shard_groups_response)

let make_describe_db_shard_groups_message ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?db_shard_group_identifier:(db_shard_group_identifier_ : db_shard_group_identifier option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     db_shard_group_identifier = db_shard_group_identifier_;
   }
    : describe_db_shard_groups_message)

let make_describe_db_security_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_security_group_name:(db_security_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_security_group_name = db_security_group_name_;
   }
    : describe_db_security_groups_message)

let make_db_security_group_message
    ?db_security_groups:(db_security_groups_ : db_security_groups option)
    ?marker:(marker_ : string_ option) () =
  ({ db_security_groups = db_security_groups_; marker = marker_ } : db_security_group_message)

let make_describe_db_recommendations_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?locale:(locale_ : string_ option) ?last_updated_before:(last_updated_before_ : t_stamp option)
    ?last_updated_after:(last_updated_after_ : t_stamp option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     locale = locale_;
     last_updated_before = last_updated_before_;
     last_updated_after = last_updated_after_;
   }
    : describe_db_recommendations_message)

let make_db_recommendations_message ?marker:(marker_ : string_ option)
    ?db_recommendations:(db_recommendations_ : db_recommendation_list option) () =
  ({ marker = marker_; db_recommendations = db_recommendations_ } : db_recommendations_message)

let make_describe_db_proxy_targets_response ?marker:(marker_ : string_ option)
    ?targets:(targets_ : target_list option) () =
  ({ marker = marker_; targets = targets_ } : describe_db_proxy_targets_response)

let make_describe_db_proxy_targets_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
   }
    : describe_db_proxy_targets_request)

let make_describe_db_proxy_target_groups_response ?marker:(marker_ : string_ option)
    ?target_groups:(target_groups_ : target_group_list option) () =
  ({ marker = marker_; target_groups = target_groups_ } : describe_db_proxy_target_groups_response)

let make_describe_db_proxy_target_groups_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
   }
    : describe_db_proxy_target_groups_request)

let make_describe_db_proxy_endpoints_response ?marker:(marker_ : string_ option)
    ?db_proxy_endpoints:(db_proxy_endpoints_ : db_proxy_endpoint_list option) () =
  ({ marker = marker_; db_proxy_endpoints = db_proxy_endpoints_ }
    : describe_db_proxy_endpoints_response)

let make_describe_db_proxy_endpoints_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name option)
    ?db_proxy_name:(db_proxy_name_ : db_proxy_name option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     db_proxy_name = db_proxy_name_;
   }
    : describe_db_proxy_endpoints_request)

let make_describe_db_proxies_response ?marker:(marker_ : string_ option)
    ?db_proxies:(db_proxies_ : db_proxy_list option) () =
  ({ marker = marker_; db_proxies = db_proxies_ } : describe_db_proxies_response)

let make_describe_db_proxies_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?db_proxy_name:(db_proxy_name_ : db_proxy_name option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     db_proxy_name = db_proxy_name_;
   }
    : describe_db_proxies_request)

let make_describe_db_parameters_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?source:(source_ : string_ option) ~db_parameter_group_name:(db_parameter_group_name_ : string_)
    () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     source = source_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : describe_db_parameters_message)

let make_db_parameter_group_details ?marker:(marker_ : string_ option)
    ?parameters:(parameters_ : parameters_list option) () =
  ({ marker = marker_; parameters = parameters_ } : db_parameter_group_details)

let make_describe_db_parameter_groups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : describe_db_parameter_groups_message)

let make_db_parameter_group ?db_parameter_group_arn:(db_parameter_group_arn_ : string_ option)
    ?description:(description_ : string_ option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option) () =
  ({
     db_parameter_group_arn = db_parameter_group_arn_;
     description = description_;
     db_parameter_group_family = db_parameter_group_family_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : db_parameter_group)

let make_db_parameter_groups_message
    ?db_parameter_groups:(db_parameter_groups_ : db_parameter_group_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_parameter_groups = db_parameter_groups_; marker = marker_ } : db_parameter_groups_message)

let make_db_major_engine_version
    ?supported_engine_lifecycles:
      (supported_engine_lifecycles_ : supported_engine_lifecycle_list option)
    ?major_engine_version:(major_engine_version_ : string_ option)
    ?engine:(engine_ : string_ option) () =
  ({
     supported_engine_lifecycles = supported_engine_lifecycles_;
     major_engine_version = major_engine_version_;
     engine = engine_;
   }
    : db_major_engine_version)

let make_describe_db_major_engine_versions_response ?marker:(marker_ : string_ option)
    ?db_major_engine_versions:(db_major_engine_versions_ : db_major_engine_versions_list option) ()
    =
  ({ marker = marker_; db_major_engine_versions = db_major_engine_versions_ }
    : describe_db_major_engine_versions_response)

let make_describe_db_major_engine_versions_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : marker option)
    ?major_engine_version:(major_engine_version_ : major_engine_version option)
    ?engine:(engine_ : engine option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     major_engine_version = major_engine_version_;
     engine = engine_;
   }
    : describe_db_major_engine_versions_request)

let make_describe_db_log_files_details ?size:(size_ : long option)
    ?last_written:(last_written_ : long option) ?log_file_name:(log_file_name_ : string_ option) ()
    =
  ({ size = size_; last_written = last_written_; log_file_name = log_file_name_ }
    : describe_db_log_files_details)

let make_describe_db_log_files_response ?marker:(marker_ : string_ option)
    ?describe_db_log_files:(describe_db_log_files_ : describe_db_log_files_list option) () =
  ({ marker = marker_; describe_db_log_files = describe_db_log_files_ }
    : describe_db_log_files_response)

let make_describe_db_log_files_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?file_size:(file_size_ : long option) ?file_last_written:(file_last_written_ : long option)
    ?filename_contains:(filename_contains_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     file_size = file_size_;
     file_last_written = file_last_written_;
     filename_contains = filename_contains_;
     db_instance_identifier = db_instance_identifier_;
   }
    : describe_db_log_files_message)

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

let make_describe_db_instance_automated_backups_message
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?filters:(filters_ : filter_list option)
    ?db_instance_identifier:(db_instance_identifier_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) () =
  ({
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_instance_identifier = db_instance_identifier_;
     dbi_resource_id = dbi_resource_id_;
   }
    : describe_db_instance_automated_backups_message)

let make_db_instance_automated_backup_message
    ?db_instance_automated_backups:
      (db_instance_automated_backups_ : db_instance_automated_backup_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_instance_automated_backups = db_instance_automated_backups_; marker = marker_ }
    : db_instance_automated_backup_message)

let make_describe_db_engine_versions_message ?include_all:(include_all_ : boolean_optional option)
    ?list_supported_timezones:(list_supported_timezones_ : boolean_optional option)
    ?list_supported_character_sets:(list_supported_character_sets_ : boolean_optional option)
    ?default_only:(default_only_ : boolean_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_parameter_group_family:(db_parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     include_all = include_all_;
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

let make_db_engine_version_message
    ?db_engine_versions:(db_engine_versions_ : db_engine_version_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_engine_versions = db_engine_versions_; marker = marker_ } : db_engine_version_message)

let make_describe_db_clusters_message ?include_shared:(include_shared_ : boolean_ option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ?filters:(filters_ : filter_list option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     include_shared = include_shared_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : describe_db_clusters_message)

let make_db_cluster_message ?db_clusters:(db_clusters_ : db_cluster_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_clusters = db_clusters_; marker = marker_ } : db_cluster_message)

let make_describe_db_cluster_snapshots_message
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?include_public:(include_public_ : boolean_ option)
    ?include_shared:(include_shared_ : boolean_ option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     db_cluster_resource_id = db_cluster_resource_id_;
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

let make_db_cluster_snapshot ?db_system_id:(db_system_id_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?storage_type:(storage_type_ : string_ option) ?tag_list:(tag_list_ : tag_list option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?source_db_cluster_snapshot_arn:(source_db_cluster_snapshot_arn_ : string_ option)
    ?db_cluster_snapshot_arn:(db_cluster_snapshot_arn_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?percent_progress:(percent_progress_ : integer option)
    ?snapshot_type:(snapshot_type_ : string_ option)
    ?license_model:(license_model_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option) ?vpc_id:(vpc_id_ : string_ option)
    ?port:(port_ : integer option) ?status:(status_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?engine_mode:(engine_mode_ : string_ option) ?engine:(engine_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({
     db_system_id = db_system_id_;
     db_cluster_resource_id = db_cluster_resource_id_;
     storage_throughput = storage_throughput_;
     storage_type = storage_type_;
     tag_list = tag_list_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     source_db_cluster_snapshot_arn = source_db_cluster_snapshot_arn_;
     db_cluster_snapshot_arn = db_cluster_snapshot_arn_;
     kms_key_id = kms_key_id_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     storage_encryption_type = storage_encryption_type_;
     storage_encrypted = storage_encrypted_;
     percent_progress = percent_progress_;
     snapshot_type = snapshot_type_;
     license_model = license_model_;
     engine_version = engine_version_;
     master_username = master_username_;
     cluster_create_time = cluster_create_time_;
     vpc_id = vpc_id_;
     port = port_;
     status = status_;
     allocated_storage = allocated_storage_;
     engine_mode = engine_mode_;
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

let make_describe_db_cluster_endpoints_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : describe_db_cluster_endpoints_message)

let make_db_cluster_endpoint_message
    ?db_cluster_endpoints:(db_cluster_endpoints_ : db_cluster_endpoint_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_cluster_endpoints = db_cluster_endpoints_; marker = marker_ } : db_cluster_endpoint_message)

let make_describe_db_cluster_backtracks_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?backtrack_identifier:(backtrack_identifier_ : string_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     backtrack_identifier = backtrack_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : describe_db_cluster_backtracks_message)

let make_db_cluster_backtrack ?status:(status_ : string_ option)
    ?backtrack_request_creation_time:(backtrack_request_creation_time_ : t_stamp option)
    ?backtracked_from:(backtracked_from_ : t_stamp option)
    ?backtrack_to:(backtrack_to_ : t_stamp option)
    ?backtrack_identifier:(backtrack_identifier_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) () =
  ({
     status = status_;
     backtrack_request_creation_time = backtrack_request_creation_time_;
     backtracked_from = backtracked_from_;
     backtrack_to = backtrack_to_;
     backtrack_identifier = backtrack_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : db_cluster_backtrack)

let make_db_cluster_backtrack_message
    ?db_cluster_backtracks:(db_cluster_backtracks_ : db_cluster_backtrack_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_cluster_backtracks = db_cluster_backtracks_; marker = marker_ }
    : db_cluster_backtrack_message)

let make_describe_db_cluster_automated_backups_message ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option) () =
  ({
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_resource_id = db_cluster_resource_id_;
   }
    : describe_db_cluster_automated_backups_message)

let make_db_cluster_automated_backup ?tag_list:(tag_list_ : tag_list option)
    ?aws_backup_recovery_point_arn:(aws_backup_recovery_point_arn_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?storage_type:(storage_type_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?port:(port_ : integer option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_cluster_arn:(db_cluster_arn_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer option)
    ?storage_encryption_type:(storage_encryption_type_ : storage_encryption_type option)
    ?storage_encrypted:(storage_encrypted_ : boolean_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?iam_database_authentication_enabled:(iam_database_authentication_enabled_ : boolean_ option)
    ?status:(status_ : string_ option) ?license_model:(license_model_ : string_ option)
    ?region:(region_ : string_ option)
    ?db_cluster_resource_id:(db_cluster_resource_id_ : string_ option)
    ?master_username:(master_username_ : string_ option)
    ?restore_window:(restore_window_ : restore_window option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option)
    ?db_cluster_automated_backups_arn:(db_cluster_automated_backups_arn_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     tag_list = tag_list_;
     aws_backup_recovery_point_arn = aws_backup_recovery_point_arn_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     storage_type = storage_type_;
     kms_key_id = kms_key_id_;
     port = port_;
     availability_zones = availability_zones_;
     engine_mode = engine_mode_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_cluster_arn = db_cluster_arn_;
     engine_version = engine_version_;
     allocated_storage = allocated_storage_;
     storage_encryption_type = storage_encryption_type_;
     storage_encrypted = storage_encrypted_;
     cluster_create_time = cluster_create_time_;
     iam_database_authentication_enabled = iam_database_authentication_enabled_;
     status = status_;
     license_model = license_model_;
     region = region_;
     db_cluster_resource_id = db_cluster_resource_id_;
     master_username = master_username_;
     restore_window = restore_window_;
     db_cluster_identifier = db_cluster_identifier_;
     db_cluster_automated_backups_arn = db_cluster_automated_backups_arn_;
     vpc_id = vpc_id_;
     engine = engine_;
   }
    : db_cluster_automated_backup)

let make_db_cluster_automated_backup_message
    ?db_cluster_automated_backups:
      (db_cluster_automated_backups_ : db_cluster_automated_backup_list option)
    ?marker:(marker_ : string_ option) () =
  ({ db_cluster_automated_backups = db_cluster_automated_backups_; marker = marker_ }
    : db_cluster_automated_backup_message)

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

let make_certificate_message ?marker:(marker_ : string_ option)
    ?certificates:(certificates_ : certificate_list option)
    ?default_certificate_for_new_launches:(default_certificate_for_new_launches_ : string_ option)
    () =
  ({
     marker = marker_;
     certificates = certificates_;
     default_certificate_for_new_launches = default_certificate_for_new_launches_;
   }
    : certificate_message)

let make_describe_blue_green_deployments_response ?marker:(marker_ : string_ option)
    ?blue_green_deployments:(blue_green_deployments_ : blue_green_deployment_list option) () =
  ({ marker = marker_; blue_green_deployments = blue_green_deployments_ }
    : describe_blue_green_deployments_response)

let make_describe_blue_green_deployments_request ?max_records:(max_records_ : max_records option)
    ?marker:(marker_ : string_ option) ?filters:(filters_ : filter_list option)
    ?blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier option) () =
  ({
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
   }
    : describe_blue_green_deployments_request)

let make_describe_account_attributes_message () = (() : unit)

let make_account_quota ?max:(max_ : long option) ?used:(used_ : long option)
    ?account_quota_name:(account_quota_name_ : string_ option) () =
  ({ max = max_; used = used_; account_quota_name = account_quota_name_ } : account_quota)

let make_account_attributes_message ?account_quotas:(account_quotas_ : account_quota_list option) ()
    =
  ({ account_quotas = account_quotas_ } : account_attributes_message)

let make_deregister_db_proxy_targets_response () = (() : unit)

let make_deregister_db_proxy_targets_request
    ?db_cluster_identifiers:(db_cluster_identifiers_ : string_list option)
    ?db_instance_identifiers:(db_instance_identifiers_ : string_list option)
    ?target_group_name:(target_group_name_ : db_proxy_target_group_name option)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     db_cluster_identifiers = db_cluster_identifiers_;
     db_instance_identifiers = db_instance_identifiers_;
     target_group_name = target_group_name_;
     db_proxy_name = db_proxy_name_;
   }
    : deregister_db_proxy_targets_request)

let make_delete_tenant_database_message
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ~tenant_db_name:(tenant_db_name_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     tenant_db_name = tenant_db_name_;
     db_instance_identifier = db_instance_identifier_;
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

let make_delete_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : delete_db_proxy_response)

let make_delete_db_proxy_request ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({ db_proxy_name = db_proxy_name_ } : delete_db_proxy_request)

let make_delete_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : delete_db_proxy_endpoint_response)

let make_delete_db_proxy_endpoint_request
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name) () =
  ({ db_proxy_endpoint_name = db_proxy_endpoint_name_ } : delete_db_proxy_endpoint_request)

let make_delete_db_parameter_group_message
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({ db_parameter_group_name = db_parameter_group_name_ } : delete_db_parameter_group_message)

let make_delete_db_instance_message
    ?delete_automated_backups:(delete_automated_backups_ : boolean_optional option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     delete_automated_backups = delete_automated_backups_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     db_instance_identifier = db_instance_identifier_;
   }
    : delete_db_instance_message)

let make_delete_db_instance_automated_backup_message
    ?db_instance_automated_backups_arn:(db_instance_automated_backups_arn_ : string_ option)
    ?dbi_resource_id:(dbi_resource_id_ : string_ option) () =
  ({
     db_instance_automated_backups_arn = db_instance_automated_backups_arn_;
     dbi_resource_id = dbi_resource_id_;
   }
    : delete_db_instance_automated_backup_message)

let make_delete_db_cluster_snapshot_message
    ~db_cluster_snapshot_identifier:(db_cluster_snapshot_identifier_ : string_) () =
  ({ db_cluster_snapshot_identifier = db_cluster_snapshot_identifier_ }
    : delete_db_cluster_snapshot_message)

let make_delete_db_cluster_parameter_group_message
    ~db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_) () =
  ({ db_cluster_parameter_group_name = db_cluster_parameter_group_name_ }
    : delete_db_cluster_parameter_group_message)

let make_delete_db_cluster_message
    ?delete_automated_backups:(delete_automated_backups_ : boolean_optional option)
    ?final_db_snapshot_identifier:(final_db_snapshot_identifier_ : string_ option)
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     delete_automated_backups = delete_automated_backups_;
     final_db_snapshot_identifier = final_db_snapshot_identifier_;
     skip_final_snapshot = skip_final_snapshot_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : delete_db_cluster_message)

let make_delete_db_cluster_endpoint_message
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_) () =
  ({ db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_ }
    : delete_db_cluster_endpoint_message)

let make_delete_db_cluster_automated_backup_message
    ~db_cluster_resource_id:(db_cluster_resource_id_ : string_) () =
  ({ db_cluster_resource_id = db_cluster_resource_id_ }
    : delete_db_cluster_automated_backup_message)

let make_delete_custom_db_engine_version_message
    ~engine_version:(engine_version_ : custom_engine_version) ~engine:(engine_ : custom_engine_name)
    () =
  ({ engine_version = engine_version_; engine = engine_ } : delete_custom_db_engine_version_message)

let make_delete_blue_green_deployment_response
    ?blue_green_deployment:(blue_green_deployment_ : blue_green_deployment option) () =
  ({ blue_green_deployment = blue_green_deployment_ } : delete_blue_green_deployment_response)

let make_delete_blue_green_deployment_request
    ?delete_target:(delete_target_ : boolean_optional option)
    ~blue_green_deployment_identifier:
      (blue_green_deployment_identifier_ : blue_green_deployment_identifier) () =
  ({
     delete_target = delete_target_;
     blue_green_deployment_identifier = blue_green_deployment_identifier_;
   }
    : delete_blue_green_deployment_request)

let make_create_tenant_database_message ?tags:(tags_ : tag_list option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ~master_username:(master_username_ : string_) ~tenant_db_name:(tenant_db_name_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     tags = tags_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     nchar_character_set_name = nchar_character_set_name_;
     character_set_name = character_set_name_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     tenant_db_name = tenant_db_name_;
     db_instance_identifier = db_instance_identifier_;
   }
    : create_tenant_database_message)

let make_create_option_group_message ?tags:(tags_ : tag_list option)
    ~option_group_description:(option_group_description_ : string_)
    ~major_engine_version:(major_engine_version_ : string_) ~engine_name:(engine_name_ : string_)
    ~option_group_name:(option_group_name_ : string_) () =
  ({
     tags = tags_;
     option_group_description = option_group_description_;
     major_engine_version = major_engine_version_;
     engine_name = engine_name_;
     option_group_name = option_group_name_;
   }
    : create_option_group_message)

let make_create_integration_message ?description:(description_ : integration_description option)
    ?data_filter:(data_filter_ : data_filter option) ?tags:(tags_ : tag_list option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ~integration_name:(integration_name_ : integration_name) ~target_arn:(target_arn_ : arn)
    ~source_arn:(source_arn_ : source_arn) () =
  ({
     description = description_;
     data_filter = data_filter_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_name = integration_name_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : create_integration_message)

let make_create_global_cluster_message ?tags:(tags_ : tag_list option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?database_name:(database_name_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     tags = tags_;
     storage_encrypted = storage_encrypted_;
     database_name = database_name_;
     deletion_protection = deletion_protection_;
     engine_lifecycle_support = engine_lifecycle_support_;
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

let make_create_db_snapshot_message ?tags:(tags_ : tag_list option)
    ~db_instance_identifier:(db_instance_identifier_ : string_)
    ~db_snapshot_identifier:(db_snapshot_identifier_ : string_) () =
  ({
     tags = tags_;
     db_instance_identifier = db_instance_identifier_;
     db_snapshot_identifier = db_snapshot_identifier_;
   }
    : create_db_snapshot_message)

let make_create_db_shard_group_message ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?min_ac_u:(min_ac_u_ : double_optional option)
    ?compute_redundancy:(compute_redundancy_ : integer_optional option)
    ~max_ac_u:(max_ac_u_ : double_optional)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_)
    ~db_shard_group_identifier:(db_shard_group_identifier_ : string_) () =
  ({
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     min_ac_u = min_ac_u_;
     max_ac_u = max_ac_u_;
     compute_redundancy = compute_redundancy_;
     db_cluster_identifier = db_cluster_identifier_;
     db_shard_group_identifier = db_shard_group_identifier_;
   }
    : create_db_shard_group_message)

let make_create_db_security_group_message ?tags:(tags_ : tag_list option)
    ~db_security_group_description:(db_security_group_description_ : string_)
    ~db_security_group_name:(db_security_group_name_ : string_) () =
  ({
     tags = tags_;
     db_security_group_description = db_security_group_description_;
     db_security_group_name = db_security_group_name_;
   }
    : create_db_security_group_message)

let make_create_db_proxy_response ?db_proxy:(db_proxy_ : db_proxy option) () =
  ({ db_proxy = db_proxy_ } : create_db_proxy_response)

let make_create_db_proxy_request
    ?target_connection_network_type:
      (target_connection_network_type_ : target_connection_network_type option)
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?tags:(tags_ : tag_list option) ?debug_logging:(debug_logging_ : boolean_ option)
    ?idle_client_timeout:(idle_client_timeout_ : integer_optional option)
    ?require_tl_s:(require_tl_s_ : boolean_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ?auth:(auth_ : user_auth_config_list option)
    ?default_auth_scheme:(default_auth_scheme_ : default_auth_scheme option)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : string_list) ~role_arn:(role_arn_ : arn)
    ~engine_family:(engine_family_ : engine_family) ~db_proxy_name:(db_proxy_name_ : db_proxy_name)
    () =
  ({
     target_connection_network_type = target_connection_network_type_;
     endpoint_network_type = endpoint_network_type_;
     tags = tags_;
     debug_logging = debug_logging_;
     idle_client_timeout = idle_client_timeout_;
     require_tl_s = require_tl_s_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     role_arn = role_arn_;
     auth = auth_;
     default_auth_scheme = default_auth_scheme_;
     engine_family = engine_family_;
     db_proxy_name = db_proxy_name_;
   }
    : create_db_proxy_request)

let make_create_db_proxy_endpoint_response
    ?db_proxy_endpoint:(db_proxy_endpoint_ : db_proxy_endpoint option) () =
  ({ db_proxy_endpoint = db_proxy_endpoint_ } : create_db_proxy_endpoint_response)

let make_create_db_proxy_endpoint_request
    ?endpoint_network_type:(endpoint_network_type_ : endpoint_network_type option)
    ?tags:(tags_ : tag_list option)
    ?target_role:(target_role_ : db_proxy_endpoint_target_role option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : string_list option)
    ~vpc_subnet_ids:(vpc_subnet_ids_ : string_list)
    ~db_proxy_endpoint_name:(db_proxy_endpoint_name_ : db_proxy_endpoint_name)
    ~db_proxy_name:(db_proxy_name_ : db_proxy_name) () =
  ({
     endpoint_network_type = endpoint_network_type_;
     tags = tags_;
     target_role = target_role_;
     vpc_security_group_ids = vpc_security_group_ids_;
     vpc_subnet_ids = vpc_subnet_ids_;
     db_proxy_endpoint_name = db_proxy_endpoint_name_;
     db_proxy_name = db_proxy_name_;
   }
    : create_db_proxy_endpoint_request)

let make_create_db_parameter_group_message ?tags:(tags_ : tag_list option)
    ~description:(description_ : string_)
    ~db_parameter_group_family:(db_parameter_group_family_ : string_)
    ~db_parameter_group_name:(db_parameter_group_name_ : string_) () =
  ({
     tags = tags_;
     description = description_;
     db_parameter_group_family = db_parameter_group_family_;
     db_parameter_group_name = db_parameter_group_name_;
   }
    : create_db_parameter_group_message)

let make_create_db_instance_read_replica_message
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?upgrade_storage_config:(upgrade_storage_config_ : boolean_optional option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?source_db_cluster_identifier:(source_db_cluster_identifier_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?backup_target:(backup_target_ : string_ option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?network_type:(network_type_ : string_ option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?replica_mode:(replica_mode_ : replica_mode option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?use_default_processor_features:(use_default_processor_features_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?storage_type:(storage_type_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option) ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?port:(port_ : integer_optional option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?db_instance_class:(db_instance_class_ : string_ option)
    ?source_db_instance_identifier:(source_db_instance_identifier_ : string_ option)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     ca_certificate_identifier = ca_certificate_identifier_;
     upgrade_storage_config = upgrade_storage_config_;
     dedicated_log_volume = dedicated_log_volume_;
     source_db_cluster_identifier = source_db_cluster_identifier_;
     allocated_storage = allocated_storage_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     backup_target = backup_target_;
     max_allocated_storage = max_allocated_storage_;
     network_type = network_type_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     replica_mode = replica_mode_;
     domain_dns_ips = domain_dns_ips_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_ou = domain_ou_;
     domain_fqdn = domain_fqdn_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     deletion_protection = deletion_protection_;
     use_default_processor_features = use_default_processor_features_;
     processor_features = processor_features_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     pre_signed_url = pre_signed_url_;
     kms_key_id = kms_key_id_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     storage_type = storage_type_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_subnet_group_name = db_subnet_group_name_;
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     db_parameter_group_name = db_parameter_group_name_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     multi_a_z = multi_a_z_;
     port = port_;
     availability_zone = availability_zone_;
     db_instance_class = db_instance_class_;
     source_db_instance_identifier = source_db_instance_identifier_;
     db_instance_identifier = db_instance_identifier_;
   }
    : create_db_instance_read_replica_message)

let make_create_db_instance_message
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?additional_storage_volumes:
      (additional_storage_volumes_ : additional_storage_volumes_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?dedicated_log_volume:(dedicated_log_volume_ : boolean_optional option)
    ?multi_tenant:(multi_tenant_ : boolean_optional option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?custom_iam_instance_profile:(custom_iam_instance_profile_ : string_ option)
    ?backup_target:(backup_target_ : string_ option) ?network_type:(network_type_ : string_ option)
    ?enable_customer_owned_ip:(enable_customer_owned_ip_ : boolean_optional option)
    ?max_allocated_storage:(max_allocated_storage_ : integer_optional option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?processor_features:(processor_features_ : processor_feature_list option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?timezone:(timezone_ : string_ option)
    ?promotion_tier:(promotion_tier_ : integer_optional option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?domain_dns_ips:(domain_dns_ips_ : string_list option)
    ?domain_auth_secret_arn:(domain_auth_secret_arn_ : string_ option)
    ?domain_ou:(domain_ou_ : string_ option) ?domain_fqdn:(domain_fqdn_ : string_ option)
    ?domain:(domain_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?tde_credential_password:(tde_credential_password_ : sensitive_string option)
    ?tde_credential_arn:(tde_credential_arn_ : string_ option)
    ?storage_type:(storage_type_ : string_ option)
    ?db_cluster_identifier:(db_cluster_identifier_ : string_ option) ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?nchar_character_set_name:(nchar_character_set_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?storage_throughput:(storage_throughput_ : integer_optional option)
    ?iops:(iops_ : integer_optional option) ?license_model:(license_model_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option) ?port:(port_ : integer_optional option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?db_parameter_group_name:(db_parameter_group_name_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_security_groups:(db_security_groups_ : db_security_group_name_list option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?master_username:(master_username_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_name:(db_name_ : string_ option) ~engine:(engine_ : string_)
    ~db_instance_class:(db_instance_class_ : string_)
    ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     master_user_authentication_type = master_user_authentication_type_;
     tag_specifications = tag_specifications_;
     additional_storage_volumes = additional_storage_volumes_;
     engine_lifecycle_support = engine_lifecycle_support_;
     dedicated_log_volume = dedicated_log_volume_;
     multi_tenant = multi_tenant_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     manage_master_user_password = manage_master_user_password_;
     ca_certificate_identifier = ca_certificate_identifier_;
     db_system_id = db_system_id_;
     custom_iam_instance_profile = custom_iam_instance_profile_;
     backup_target = backup_target_;
     network_type = network_type_;
     enable_customer_owned_ip = enable_customer_owned_ip_;
     max_allocated_storage = max_allocated_storage_;
     deletion_protection = deletion_protection_;
     processor_features = processor_features_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     timezone = timezone_;
     promotion_tier = promotion_tier_;
     domain_iam_role_name = domain_iam_role_name_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     domain_dns_ips = domain_dns_ips_;
     domain_auth_secret_arn = domain_auth_secret_arn_;
     domain_ou = domain_ou_;
     domain_fqdn = domain_fqdn_;
     domain = domain_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     tde_credential_password = tde_credential_password_;
     tde_credential_arn = tde_credential_arn_;
     storage_type = storage_type_;
     db_cluster_identifier = db_cluster_identifier_;
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     nchar_character_set_name = nchar_character_set_name_;
     character_set_name = character_set_name_;
     option_group_name = option_group_name_;
     storage_throughput = storage_throughput_;
     iops = iops_;
     license_model = license_model_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     multi_a_z = multi_a_z_;
     port = port_;
     preferred_backup_window = preferred_backup_window_;
     backup_retention_period = backup_retention_period_;
     db_parameter_group_name = db_parameter_group_name_;
     preferred_maintenance_window = preferred_maintenance_window_;
     db_subnet_group_name = db_subnet_group_name_;
     availability_zone = availability_zone_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_security_groups = db_security_groups_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     engine = engine_;
     db_instance_class = db_instance_class_;
     allocated_storage = allocated_storage_;
     db_instance_identifier = db_instance_identifier_;
     db_name = db_name_;
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

let make_create_db_cluster_message
    ?with_express_configuration:(with_express_configuration_ : boolean_optional option)
    ?master_user_authentication_type:
      (master_user_authentication_type_ : master_user_authentication_type option)
    ?tag_specifications:(tag_specifications_ : tag_specification_list option)
    ?engine_lifecycle_support:(engine_lifecycle_support_ : string_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?master_user_secret_kms_key_id:(master_user_secret_kms_key_id_ : string_ option)
    ?enable_local_write_forwarding:(enable_local_write_forwarding_ : boolean_optional option)
    ?manage_master_user_password:(manage_master_user_password_ : boolean_optional option)
    ?db_system_id:(db_system_id_ : string_ option)
    ?cluster_scalability_type:(cluster_scalability_type_ : cluster_scalability_type option)
    ?enable_limitless_database:(enable_limitless_database_ : boolean_optional option)
    ?performance_insights_retention_period:
      (performance_insights_retention_period_ : integer_optional option)
    ?performance_insights_kms_key_id:(performance_insights_kms_key_id_ : string_ option)
    ?enable_performance_insights:(enable_performance_insights_ : boolean_optional option)
    ?database_insights_mode:(database_insights_mode_ : database_insights_mode option)
    ?monitoring_role_arn:(monitoring_role_arn_ : string_ option)
    ?monitoring_interval:(monitoring_interval_ : integer_optional option)
    ?serverless_v2_scaling_configuration:
      (serverless_v2_scaling_configuration_ : serverless_v2_scaling_configuration option)
    ?network_type:(network_type_ : string_ option)
    ?enable_global_write_forwarding:(enable_global_write_forwarding_ : boolean_optional option)
    ?domain_iam_role_name:(domain_iam_role_name_ : string_ option)
    ?domain:(domain_ : string_ option)
    ?copy_tags_to_snapshot:(copy_tags_to_snapshot_ : boolean_optional option)
    ?enable_http_endpoint:(enable_http_endpoint_ : boolean_optional option)
    ?global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier option)
    ?deletion_protection:(deletion_protection_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?iops:(iops_ : integer_optional option) ?storage_type:(storage_type_ : string_ option)
    ?allocated_storage:(allocated_storage_ : integer_optional option)
    ?db_cluster_instance_class:(db_cluster_instance_class_ : string_ option)
    ?rds_custom_cluster_configuration:
      (rds_custom_cluster_configuration_ : rds_custom_cluster_configuration option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration option)
    ?engine_mode:(engine_mode_ : string_ option)
    ?enable_cloudwatch_logs_exports:(enable_cloudwatch_logs_exports_ : log_type_list option)
    ?backtrack_window:(backtrack_window_ : long_optional option)
    ?enable_iam_database_authentication:
      (enable_iam_database_authentication_ : boolean_optional option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?storage_encrypted:(storage_encrypted_ : boolean_optional option)
    ?tags:(tags_ : tag_list option)
    ?replication_source_identifier:(replication_source_identifier_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?master_username:(master_username_ : string_ option) ?port:(port_ : integer_optional option)
    ?engine_version:(engine_version_ : string_ option)
    ?db_subnet_group_name:(db_subnet_group_name_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?db_cluster_parameter_group_name:(db_cluster_parameter_group_name_ : string_ option)
    ?database_name:(database_name_ : string_ option)
    ?character_set_name:(character_set_name_ : string_ option)
    ?backup_retention_period:(backup_retention_period_ : integer_optional option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ~engine:(engine_ : string_) ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     with_express_configuration = with_express_configuration_;
     master_user_authentication_type = master_user_authentication_type_;
     tag_specifications = tag_specifications_;
     engine_lifecycle_support = engine_lifecycle_support_;
     ca_certificate_identifier = ca_certificate_identifier_;
     master_user_secret_kms_key_id = master_user_secret_kms_key_id_;
     enable_local_write_forwarding = enable_local_write_forwarding_;
     manage_master_user_password = manage_master_user_password_;
     db_system_id = db_system_id_;
     cluster_scalability_type = cluster_scalability_type_;
     enable_limitless_database = enable_limitless_database_;
     performance_insights_retention_period = performance_insights_retention_period_;
     performance_insights_kms_key_id = performance_insights_kms_key_id_;
     enable_performance_insights = enable_performance_insights_;
     database_insights_mode = database_insights_mode_;
     monitoring_role_arn = monitoring_role_arn_;
     monitoring_interval = monitoring_interval_;
     serverless_v2_scaling_configuration = serverless_v2_scaling_configuration_;
     network_type = network_type_;
     enable_global_write_forwarding = enable_global_write_forwarding_;
     domain_iam_role_name = domain_iam_role_name_;
     domain = domain_;
     copy_tags_to_snapshot = copy_tags_to_snapshot_;
     enable_http_endpoint = enable_http_endpoint_;
     global_cluster_identifier = global_cluster_identifier_;
     deletion_protection = deletion_protection_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     publicly_accessible = publicly_accessible_;
     iops = iops_;
     storage_type = storage_type_;
     allocated_storage = allocated_storage_;
     db_cluster_instance_class = db_cluster_instance_class_;
     rds_custom_cluster_configuration = rds_custom_cluster_configuration_;
     scaling_configuration = scaling_configuration_;
     engine_mode = engine_mode_;
     enable_cloudwatch_logs_exports = enable_cloudwatch_logs_exports_;
     backtrack_window = backtrack_window_;
     enable_iam_database_authentication = enable_iam_database_authentication_;
     pre_signed_url = pre_signed_url_;
     kms_key_id = kms_key_id_;
     storage_encrypted = storage_encrypted_;
     tags = tags_;
     replication_source_identifier = replication_source_identifier_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     option_group_name = option_group_name_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     port = port_;
     engine_version = engine_version_;
     engine = engine_;
     db_subnet_group_name = db_subnet_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     db_cluster_parameter_group_name = db_cluster_parameter_group_name_;
     db_cluster_identifier = db_cluster_identifier_;
     database_name = database_name_;
     character_set_name = character_set_name_;
     backup_retention_period = backup_retention_period_;
     availability_zones = availability_zones_;
   }
    : create_db_cluster_message)

let make_create_db_cluster_endpoint_message ?tags:(tags_ : tag_list option)
    ?excluded_members:(excluded_members_ : string_list option)
    ?static_members:(static_members_ : string_list option) ~endpoint_type:(endpoint_type_ : string_)
    ~db_cluster_endpoint_identifier:(db_cluster_endpoint_identifier_ : string_)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     tags = tags_;
     excluded_members = excluded_members_;
     static_members = static_members_;
     endpoint_type = endpoint_type_;
     db_cluster_endpoint_identifier = db_cluster_endpoint_identifier_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : create_db_cluster_endpoint_message)

let make_create_custom_db_engine_version_message ?tags:(tags_ : tag_list option)
    ?manifest:(manifest_ : custom_db_engine_version_manifest option)
    ?description:(description_ : description option)
    ?use_aws_provided_latest_image:(use_aws_provided_latest_image_ : boolean_optional option)
    ?source_custom_db_engine_version_identifier:
      (source_custom_db_engine_version_identifier_ : string255 option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option) ?image_id:(image_id_ : string255 option)
    ?database_installation_files:(database_installation_files_ : string_list option)
    ?database_installation_files_s3_prefix:
      (database_installation_files_s3_prefix_ : string255 option)
    ?database_installation_files_s3_bucket_name:
      (database_installation_files_s3_bucket_name_ : bucket_name option)
    ~engine_version:(engine_version_ : custom_engine_version) ~engine:(engine_ : custom_engine_name)
    () =
  ({
     tags = tags_;
     manifest = manifest_;
     description = description_;
     use_aws_provided_latest_image = use_aws_provided_latest_image_;
     source_custom_db_engine_version_identifier = source_custom_db_engine_version_identifier_;
     kms_key_id = kms_key_id_;
     image_id = image_id_;
     database_installation_files = database_installation_files_;
     database_installation_files_s3_prefix = database_installation_files_s3_prefix_;
     database_installation_files_s3_bucket_name = database_installation_files_s3_bucket_name_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : create_custom_db_engine_version_message)

let make_create_blue_green_deployment_response
    ?blue_green_deployment:(blue_green_deployment_ : blue_green_deployment option) () =
  ({ blue_green_deployment = blue_green_deployment_ } : create_blue_green_deployment_response)

let make_create_blue_green_deployment_request
    ?target_storage_throughput:(target_storage_throughput_ : integer_optional option)
    ?target_allocated_storage:(target_allocated_storage_ : integer_optional option)
    ?target_storage_type:(target_storage_type_ : target_storage_type option)
    ?target_iops:(target_iops_ : integer_optional option)
    ?upgrade_target_storage_config:(upgrade_target_storage_config_ : boolean_optional option)
    ?target_db_instance_class:(target_db_instance_class_ : target_db_instance_class option)
    ?tags:(tags_ : tag_list option)
    ?target_db_cluster_parameter_group_name:
      (target_db_cluster_parameter_group_name_ : target_db_cluster_parameter_group_name option)
    ?target_db_parameter_group_name:
      (target_db_parameter_group_name_ : target_db_parameter_group_name option)
    ?target_engine_version:(target_engine_version_ : target_engine_version option)
    ~source:(source_ : database_arn)
    ~blue_green_deployment_name:(blue_green_deployment_name_ : blue_green_deployment_name) () =
  ({
     target_storage_throughput = target_storage_throughput_;
     target_allocated_storage = target_allocated_storage_;
     target_storage_type = target_storage_type_;
     target_iops = target_iops_;
     upgrade_target_storage_config = upgrade_target_storage_config_;
     target_db_instance_class = target_db_instance_class_;
     tags = tags_;
     target_db_cluster_parameter_group_name = target_db_cluster_parameter_group_name_;
     target_db_parameter_group_name = target_db_parameter_group_name_;
     target_engine_version = target_engine_version_;
     source = source_;
     blue_green_deployment_name = blue_green_deployment_name_;
   }
    : create_blue_green_deployment_request)

let make_copy_option_group_message ?tags:(tags_ : tag_list option)
    ~target_option_group_description:(target_option_group_description_ : string_)
    ~target_option_group_identifier:(target_option_group_identifier_ : string_)
    ~source_option_group_identifier:(source_option_group_identifier_ : string_) () =
  ({
     tags = tags_;
     target_option_group_description = target_option_group_description_;
     target_option_group_identifier = target_option_group_identifier_;
     source_option_group_identifier = source_option_group_identifier_;
   }
    : copy_option_group_message)

let make_copy_db_snapshot_message
    ?snapshot_availability_zone:(snapshot_availability_zone_ : string_ option)
    ?copy_option_group:(copy_option_group_ : boolean_optional option)
    ?snapshot_target:(snapshot_target_ : string_ option)
    ?target_custom_availability_zone:(target_custom_availability_zone_ : string_ option)
    ?option_group_name:(option_group_name_ : string_ option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?copy_tags:(copy_tags_ : boolean_optional option) ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ~target_db_snapshot_identifier:(target_db_snapshot_identifier_ : string_)
    ~source_db_snapshot_identifier:(source_db_snapshot_identifier_ : string_) () =
  ({
     snapshot_availability_zone = snapshot_availability_zone_;
     copy_option_group = copy_option_group_;
     snapshot_target = snapshot_target_;
     target_custom_availability_zone = target_custom_availability_zone_;
     option_group_name = option_group_name_;
     pre_signed_url = pre_signed_url_;
     copy_tags = copy_tags_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     target_db_snapshot_identifier = target_db_snapshot_identifier_;
     source_db_snapshot_identifier = source_db_snapshot_identifier_;
   }
    : copy_db_snapshot_message)

let make_copy_db_parameter_group_message ?tags:(tags_ : tag_list option)
    ~target_db_parameter_group_description:(target_db_parameter_group_description_ : string_)
    ~target_db_parameter_group_identifier:(target_db_parameter_group_identifier_ : string_)
    ~source_db_parameter_group_identifier:(source_db_parameter_group_identifier_ : string_) () =
  ({
     tags = tags_;
     target_db_parameter_group_description = target_db_parameter_group_description_;
     target_db_parameter_group_identifier = target_db_parameter_group_identifier_;
     source_db_parameter_group_identifier = source_db_parameter_group_identifier_;
   }
    : copy_db_parameter_group_message)

let make_copy_db_cluster_snapshot_message ?tags:(tags_ : tag_list option)
    ?copy_tags:(copy_tags_ : boolean_optional option)
    ?pre_signed_url:(pre_signed_url_ : sensitive_string option)
    ?kms_key_id:(kms_key_id_ : string_ option)
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

let make_cancel_export_task_message ~export_task_identifier:(export_task_identifier_ : string_) () =
  ({ export_task_identifier = export_task_identifier_ } : cancel_export_task_message)

let make_backtrack_db_cluster_message
    ?use_earliest_time_on_point_in_time_unavailable:
      (use_earliest_time_on_point_in_time_unavailable_ : boolean_optional option)
    ?force:(force_ : boolean_optional option) ~backtrack_to:(backtrack_to_ : t_stamp)
    ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     use_earliest_time_on_point_in_time_unavailable =
       use_earliest_time_on_point_in_time_unavailable_;
     force = force_;
     backtrack_to = backtrack_to_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : backtrack_db_cluster_message)

let make_authorize_db_security_group_ingress_message
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ?ec2_security_group_id:(ec2_security_group_id_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?cidri_p:(cidri_p_ : string_ option) ~db_security_group_name:(db_security_group_name_ : string_)
    () =
  ({
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     ec2_security_group_id = ec2_security_group_id_;
     ec2_security_group_name = ec2_security_group_name_;
     cidri_p = cidri_p_;
     db_security_group_name = db_security_group_name_;
   }
    : authorize_db_security_group_ingress_message)

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

let make_add_role_to_db_instance_message ~feature_name:(feature_name_ : string_)
    ~role_arn:(role_arn_ : string_) ~db_instance_identifier:(db_instance_identifier_ : string_) () =
  ({
     feature_name = feature_name_;
     role_arn = role_arn_;
     db_instance_identifier = db_instance_identifier_;
   }
    : add_role_to_db_instance_message)

let make_add_role_to_db_cluster_message ?feature_name:(feature_name_ : string_ option)
    ~role_arn:(role_arn_ : string_) ~db_cluster_identifier:(db_cluster_identifier_ : string_) () =
  ({
     feature_name = feature_name_;
     role_arn = role_arn_;
     db_cluster_identifier = db_cluster_identifier_;
   }
    : add_role_to_db_cluster_message)
