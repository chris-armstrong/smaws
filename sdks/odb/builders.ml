open Types

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_accept_marketplace_registration_output () = (() : unit)

let make_accept_marketplace_registration_input
    ~marketplace_registration_token:
      (marketplace_registration_token_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ marketplace_registration_token = marketplace_registration_token_ }
    : accept_marketplace_registration_input)

let make_associate_iam_role_to_resource_output () = (() : unit)

let make_associate_iam_role_to_resource_input ~iam_role_arn:(iam_role_arn_ : role_arn)
    ~aws_integration:(aws_integration_ : supported_aws_integration)
    ~resource_arn:(resource_arn_ : arn) () =
  ({
     iam_role_arn = iam_role_arn_;
     aws_integration = aws_integration_;
     resource_arn = resource_arn_;
   }
    : associate_iam_role_to_resource_input)

let make_okv_encryption_key_configuration
    ?certificate_id:(certificate_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~certificate_directory_name:(certificate_directory_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~directory_name:(directory_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~okv_kms_key:(okv_kms_key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~okv_uri:(okv_uri_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     certificate_directory_name = certificate_directory_name_;
     certificate_id = certificate_id_;
     directory_name = directory_name_;
     okv_kms_key = okv_kms_key_;
     okv_uri = okv_uri_;
   }
    : okv_encryption_key_configuration)

let make_oci_encryption_key_configuration
    ~kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~vault_id:(vault_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ kms_key_id = kms_key_id_; vault_id = vault_id_ } : oci_encryption_key_configuration)

let make_aws_encryption_key_configuration ?iam_role_arn:(iam_role_arn_ : role_arn option)
    ?external_id_type:(external_id_type_ : external_id_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option) () =
  ({ iam_role_arn = iam_role_arn_; external_id_type = external_id_type_; kms_key_id = kms_key_id_ }
    : aws_encryption_key_configuration)

let make_encryption_summary
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider option)
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration option) () =
  ({
     encryption_key_provider = encryption_key_provider_;
     encryption_key_configuration = encryption_key_configuration_;
   }
    : encryption_summary)

let make_resource_pool_summary
    ?is_disabled:(is_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?pool_size:(pool_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?pool_storage_size_in_t_bs:
      (pool_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_storage_capacity_in_t_bs:
      (available_storage_capacity_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?total_compute_capacity:(total_compute_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_compute_capacity:
      (available_compute_capacity_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     is_disabled = is_disabled_;
     pool_size = pool_size_;
     pool_storage_size_in_t_bs = pool_storage_size_in_t_bs_;
     available_storage_capacity_in_t_bs = available_storage_capacity_in_t_bs_;
     total_compute_capacity = total_compute_capacity_;
     available_compute_capacity = available_compute_capacity_;
   }
    : resource_pool_summary)

let make_long_term_backup_schedule
    ?is_disabled:(is_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?repeat_cadence:(repeat_cadence_ : repeat_cadence option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_of_backup:(time_of_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     is_disabled = is_disabled_;
     repeat_cadence = repeat_cadence_;
     retention_period_in_days = retention_period_in_days_;
     time_of_backup = time_of_backup_;
   }
    : long_term_backup_schedule)

let make_disaster_recovery_configuration
    ?disaster_recovery_type:(disaster_recovery_type_ : disaster_recovery_type option)
    ?is_replicate_automatic_backups:
      (is_replicate_automatic_backups_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_snapshot_standby:(is_snapshot_standby_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?time_snapshot_standby_enabled_till:
      (time_snapshot_standby_enabled_till_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     disaster_recovery_type = disaster_recovery_type_;
     is_replicate_automatic_backups = is_replicate_automatic_backups_;
     is_snapshot_standby = is_snapshot_standby_;
     time_snapshot_standby_enabled_till = time_snapshot_standby_enabled_till_;
   }
    : disaster_recovery_configuration)

let make_day_of_week ?name:(name_ : day_of_week_name option) () = ({ name = name_ } : day_of_week)

let make_scheduled_operation_details
    ?scheduled_start_time:(scheduled_start_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scheduled_stop_time:(scheduled_stop_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~day_of_week:(day_of_week_ : day_of_week) () =
  ({
     day_of_week = day_of_week_;
     scheduled_start_time = scheduled_start_time_;
     scheduled_stop_time = scheduled_stop_time_;
   }
    : scheduled_operation_details)

let make_database_tool ?is_enabled:(is_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?max_idle_time_in_minutes:
      (max_idle_time_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     is_enabled = is_enabled_;
     name = name_;
     compute_count = compute_count_;
     max_idle_time_in_minutes = max_idle_time_in_minutes_;
   }
    : database_tool)

let make_autonomous_database_connection_urls
    ?apex_url:(apex_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_transforms_url:(database_transforms_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?graph_studio_url:(graph_studio_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?machine_learning_notebook_url:
      (machine_learning_notebook_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?machine_learning_user_management_url:
      (machine_learning_user_management_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?mongo_db_url:(mongo_db_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ords_url:(ords_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?spatial_studio_url:(spatial_studio_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sql_dev_web_url:(sql_dev_web_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     apex_url = apex_url_;
     database_transforms_url = database_transforms_url_;
     graph_studio_url = graph_studio_url_;
     machine_learning_notebook_url = machine_learning_notebook_url_;
     machine_learning_user_management_url = machine_learning_user_management_url_;
     mongo_db_url = mongo_db_url_;
     ords_url = ords_url_;
     spatial_studio_url = spatial_studio_url_;
     sql_dev_web_url = sql_dev_web_url_;
   }
    : autonomous_database_connection_urls)

let make_database_standby_summary
    ?availability_domain:(availability_domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lag_time_in_seconds:(lag_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     availability_domain = availability_domain_;
     lag_time_in_seconds = lag_time_in_seconds_;
     status = status_;
     status_reason = status_reason_;
     maintenance_target_component = maintenance_target_component_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_maintenance_begin = time_maintenance_begin_;
     time_maintenance_end = time_maintenance_end_;
   }
    : database_standby_summary)

let make_autonomous_database_apex
    ?apex_version:(apex_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ords_version:(ords_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ apex_version = apex_version_; ords_version = ords_version_ } : autonomous_database_apex)

let make_customer_contact ?email:(email_ : sensitive_string option) () =
  ({ email = email_ } : customer_contact)

let make_database_connection_string_profile
    ?consumer_group:(consumer_group_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?host_format:(host_format_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_regional:(is_regional_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?protocol:(protocol_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?session_mode:(session_mode_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?syntax_format:(syntax_format_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tls_authentication:(tls_authentication_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     consumer_group = consumer_group_;
     display_name = display_name_;
     host_format = host_format_;
     is_regional = is_regional_;
     protocol = protocol_;
     session_mode = session_mode_;
     syntax_format = syntax_format_;
     tls_authentication = tls_authentication_;
     value = value_;
   }
    : database_connection_string_profile)

let make_autonomous_database_connection_strings
    ?all_connection_strings:(all_connection_strings_ : database_connection_string_map option)
    ?dedicated:(dedicated_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?high:(high_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?medium:(medium_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?low:(low_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?profiles:(profiles_ : database_connection_string_profile_list option) () =
  ({
     all_connection_strings = all_connection_strings_;
     dedicated = dedicated_;
     high = high_;
     medium = medium_;
     low = low_;
     profiles = profiles_;
   }
    : autonomous_database_connection_strings)

let make_autonomous_database
    ?autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_id:(source_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_type:(database_type_ : database_type option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_edition:(database_edition_ : database_edition option)
    ?license_model:(license_model_ : license_model option)
    ?open_mode:(open_mode_ : open_mode option)
    ?permission_level:(permission_level_ : permission_level option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?net_services_architecture:(net_services_architecture_ : net_services_architecture option)
    ?available_upgrade_versions:(available_upgrade_versions_ : string_list option)
    ?byol_compute_count_limit:
      (byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?connection_string_details:
      (connection_string_details_ : autonomous_database_connection_strings option)
    ?service_console_url:(service_console_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sql_web_developer_url:(sql_web_developer_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer_contacts:(customer_contacts_ : customer_contacts option)
    ?apex_details:(apex_details_ : autonomous_database_apex option)
    ?standby_db:(standby_db_ : database_standby_summary option)
    ?local_standby_db:(local_standby_db_ : database_standby_summary option)
    ?data_safe_status:(data_safe_status_ : data_safe_status option)
    ?database_management_status:(database_management_status_ : database_management_status option)
    ?operations_insights_status:(operations_insights_status_ : operations_insights_status option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?connection_urls:(connection_urls_ : autonomous_database_connection_urls option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_cpus:(provisionable_cpus_ : integer_list option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?used_data_storage_size_in_t_bs:
      (used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?used_data_storage_size_in_g_bs:
      (used_data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?actual_used_data_storage_size_in_t_bs:
      (actual_used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?allocated_storage_size_in_t_bs:
      (allocated_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?in_memory_area_in_g_bs:(in_memory_area_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?odb_network_id:(odb_network_id_ : resource_id option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?private_endpoint:(private_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_remote_data_guard_enabled:
      (is_remote_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?local_disaster_recovery_type:(local_disaster_recovery_type_ : disaster_recovery_type option)
    ?role:(role_ : data_guard_role option) ?peer_db_ids:(peer_db_ids_ : string_list option)
    ?failed_data_recovery_in_seconds:
      (failed_data_recovery_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?remote_disaster_recovery_configuration:
      (remote_disaster_recovery_configuration_ : disaster_recovery_configuration option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?refreshable_status:(refreshable_status_ : refreshable_status option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_reconnect_clone_enabled:
      (is_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?total_backup_storage_size_in_g_bs:
      (total_backup_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?encryption_summary:(encryption_summary_ : encryption_summary option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_backup:(time_of_last_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_local_data_guard_enabled:
      (time_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_switchover:
      (time_of_last_switchover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_failover:(time_of_last_failover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh:(time_of_last_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh_point:
      (time_of_last_refresh_point_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_next_refresh:(time_of_next_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_deletion_of_free_autonomous_database:
      (time_deletion_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_reclamation_of_free_autonomous_database:
      (time_reclamation_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_until_reconnect_clone_enabled:
      (time_until_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_long_term_backup_time_stamp:
      (next_long_term_backup_time_stamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_undeleted:(time_undeleted_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     autonomous_database_arn = autonomous_database_arn_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     percent_progress = percent_progress_;
     ocid = ocid_;
     oci_url = oci_url_;
     display_name = display_name_;
     db_name = db_name_;
     source_id = source_id_;
     status = status_;
     status_reason = status_reason_;
     database_type = database_type_;
     db_version = db_version_;
     db_workload = db_workload_;
     character_set = character_set_;
     ncharacter_set = ncharacter_set_;
     database_edition = database_edition_;
     license_model = license_model_;
     open_mode = open_mode_;
     permission_level = permission_level_;
     is_mtls_connection_required = is_mtls_connection_required_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     net_services_architecture = net_services_architecture_;
     available_upgrade_versions = available_upgrade_versions_;
     byol_compute_count_limit = byol_compute_count_limit_;
     connection_string_details = connection_string_details_;
     service_console_url = service_console_url_;
     sql_web_developer_url = sql_web_developer_url_;
     customer_contacts = customer_contacts_;
     apex_details = apex_details_;
     standby_db = standby_db_;
     local_standby_db = local_standby_db_;
     data_safe_status = data_safe_status_;
     database_management_status = database_management_status_;
     operations_insights_status = operations_insights_status_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     maintenance_target_component = maintenance_target_component_;
     connection_urls = connection_urls_;
     db_tools_details = db_tools_details_;
     scheduled_operations = scheduled_operations_;
     resource_pool_leader_id = resource_pool_leader_id_;
     compute_count = compute_count_;
     compute_model = compute_model_;
     cpu_core_count = cpu_core_count_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     provisionable_cpus = provisionable_cpus_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     used_data_storage_size_in_t_bs = used_data_storage_size_in_t_bs_;
     used_data_storage_size_in_g_bs = used_data_storage_size_in_g_bs_;
     actual_used_data_storage_size_in_t_bs = actual_used_data_storage_size_in_t_bs_;
     allocated_storage_size_in_t_bs = allocated_storage_size_in_t_bs_;
     in_memory_area_in_g_bs = in_memory_area_in_g_bs_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     private_endpoint = private_endpoint_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint_label = private_endpoint_label_;
     allowlisted_ips = allowlisted_ips_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_remote_data_guard_enabled = is_remote_data_guard_enabled_;
     local_disaster_recovery_type = local_disaster_recovery_type_;
     role = role_;
     peer_db_ids = peer_db_ids_;
     failed_data_recovery_in_seconds = failed_data_recovery_in_seconds_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     remote_disaster_recovery_configuration = remote_disaster_recovery_configuration_;
     is_refreshable_clone = is_refreshable_clone_;
     refreshable_mode = refreshable_mode_;
     refreshable_status = refreshable_status_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     is_reconnect_clone_enabled = is_reconnect_clone_enabled_;
     clone_table_space_list = clone_table_space_list_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     long_term_backup_schedule = long_term_backup_schedule_;
     is_backup_retention_locked = is_backup_retention_locked_;
     total_backup_storage_size_in_g_bs = total_backup_storage_size_in_g_bs_;
     resource_pool_summary = resource_pool_summary_;
     encryption_summary = encryption_summary_;
     created_at = created_at_;
     time_of_last_backup = time_of_last_backup_;
     time_maintenance_begin = time_maintenance_begin_;
     time_maintenance_end = time_maintenance_end_;
     time_local_data_guard_enabled = time_local_data_guard_enabled_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     time_of_last_switchover = time_of_last_switchover_;
     time_of_last_failover = time_of_last_failover_;
     time_of_last_refresh = time_of_last_refresh_;
     time_of_last_refresh_point = time_of_last_refresh_point_;
     time_of_next_refresh = time_of_next_refresh_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     time_deletion_of_free_autonomous_database = time_deletion_of_free_autonomous_database_;
     time_reclamation_of_free_autonomous_database = time_reclamation_of_free_autonomous_database_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_until_reconnect_clone_enabled = time_until_reconnect_clone_enabled_;
     next_long_term_backup_time_stamp = next_long_term_backup_time_stamp_;
     time_undeleted = time_undeleted_;
   }
    : autonomous_database)

let make_autonomous_database_backup
    ?autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id option)
    ?autonomous_database_backup_arn:(autonomous_database_backup_arn_ : resource_arn option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_automatic:(is_automatic_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?size_in_t_bs:(size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?time_available_till:(time_available_till_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_started:(time_started_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_ended:(time_ended_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?type_:(type__ : autonomous_database_backup_type option) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     autonomous_database_backup_arn = autonomous_database_backup_arn_;
     autonomous_database_id = autonomous_database_id_;
     ocid = ocid_;
     display_name = display_name_;
     db_version = db_version_;
     status = status_;
     status_reason = status_reason_;
     is_automatic = is_automatic_;
     retention_period_in_days = retention_period_in_days_;
     size_in_t_bs = size_in_t_bs_;
     time_available_till = time_available_till_;
     time_started = time_started_;
     time_ended = time_ended_;
     type_ = type__;
   }
    : autonomous_database_backup)

let make_autonomous_database_backup_summary
    ?autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id option)
    ?autonomous_database_backup_arn:(autonomous_database_backup_arn_ : resource_arn option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_automatic:(is_automatic_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?size_in_t_bs:(size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?time_available_till:(time_available_till_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_started:(time_started_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_ended:(time_ended_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?type_:(type__ : autonomous_database_backup_type option) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     autonomous_database_backup_arn = autonomous_database_backup_arn_;
     autonomous_database_id = autonomous_database_id_;
     ocid = ocid_;
     display_name = display_name_;
     db_version = db_version_;
     status = status_;
     status_reason = status_reason_;
     is_automatic = is_automatic_;
     retention_period_in_days = retention_period_in_days_;
     size_in_t_bs = size_in_t_bs_;
     time_available_till = time_available_till_;
     time_started = time_started_;
     time_ended = time_ended_;
     type_ = type__;
   }
    : autonomous_database_backup_summary)

let make_autonomous_database_character_set_summary
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ character_set = character_set_ } : autonomous_database_character_set_summary)

let make_autonomous_database_summary
    ?autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_id:(source_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_type:(database_type_ : database_type option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_edition:(database_edition_ : database_edition option)
    ?license_model:(license_model_ : license_model option)
    ?open_mode:(open_mode_ : open_mode option)
    ?permission_level:(permission_level_ : permission_level option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?net_services_architecture:(net_services_architecture_ : net_services_architecture option)
    ?available_upgrade_versions:(available_upgrade_versions_ : string_list option)
    ?byol_compute_count_limit:
      (byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?connection_string_details:
      (connection_string_details_ : autonomous_database_connection_strings option)
    ?service_console_url:(service_console_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sql_web_developer_url:(sql_web_developer_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer_contacts:(customer_contacts_ : customer_contacts option)
    ?apex_details:(apex_details_ : autonomous_database_apex option)
    ?standby_db:(standby_db_ : database_standby_summary option)
    ?local_standby_db:(local_standby_db_ : database_standby_summary option)
    ?data_safe_status:(data_safe_status_ : data_safe_status option)
    ?database_management_status:(database_management_status_ : database_management_status option)
    ?operations_insights_status:(operations_insights_status_ : operations_insights_status option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?connection_urls:(connection_urls_ : autonomous_database_connection_urls option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_cpus:(provisionable_cpus_ : integer_list option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?used_data_storage_size_in_t_bs:
      (used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?used_data_storage_size_in_g_bs:
      (used_data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?actual_used_data_storage_size_in_t_bs:
      (actual_used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?allocated_storage_size_in_t_bs:
      (allocated_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?in_memory_area_in_g_bs:(in_memory_area_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?odb_network_id:(odb_network_id_ : resource_id option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?private_endpoint:(private_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_remote_data_guard_enabled:
      (is_remote_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?local_disaster_recovery_type:(local_disaster_recovery_type_ : disaster_recovery_type option)
    ?role:(role_ : data_guard_role option) ?peer_db_ids:(peer_db_ids_ : string_list option)
    ?failed_data_recovery_in_seconds:
      (failed_data_recovery_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?remote_disaster_recovery_configuration:
      (remote_disaster_recovery_configuration_ : disaster_recovery_configuration option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?refreshable_status:(refreshable_status_ : refreshable_status option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_reconnect_clone_enabled:
      (is_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?total_backup_storage_size_in_g_bs:
      (total_backup_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?encryption_summary:(encryption_summary_ : encryption_summary option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_backup:(time_of_last_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_local_data_guard_enabled:
      (time_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_switchover:
      (time_of_last_switchover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_failover:(time_of_last_failover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh:(time_of_last_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh_point:
      (time_of_last_refresh_point_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_next_refresh:(time_of_next_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_deletion_of_free_autonomous_database:
      (time_deletion_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_reclamation_of_free_autonomous_database:
      (time_reclamation_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_until_reconnect_clone_enabled:
      (time_until_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_long_term_backup_time_stamp:
      (next_long_term_backup_time_stamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_undeleted:(time_undeleted_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     autonomous_database_arn = autonomous_database_arn_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     percent_progress = percent_progress_;
     ocid = ocid_;
     oci_url = oci_url_;
     display_name = display_name_;
     db_name = db_name_;
     source_id = source_id_;
     status = status_;
     status_reason = status_reason_;
     database_type = database_type_;
     db_version = db_version_;
     db_workload = db_workload_;
     character_set = character_set_;
     ncharacter_set = ncharacter_set_;
     database_edition = database_edition_;
     license_model = license_model_;
     open_mode = open_mode_;
     permission_level = permission_level_;
     is_mtls_connection_required = is_mtls_connection_required_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     net_services_architecture = net_services_architecture_;
     available_upgrade_versions = available_upgrade_versions_;
     byol_compute_count_limit = byol_compute_count_limit_;
     connection_string_details = connection_string_details_;
     service_console_url = service_console_url_;
     sql_web_developer_url = sql_web_developer_url_;
     customer_contacts = customer_contacts_;
     apex_details = apex_details_;
     standby_db = standby_db_;
     local_standby_db = local_standby_db_;
     data_safe_status = data_safe_status_;
     database_management_status = database_management_status_;
     operations_insights_status = operations_insights_status_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     maintenance_target_component = maintenance_target_component_;
     connection_urls = connection_urls_;
     db_tools_details = db_tools_details_;
     scheduled_operations = scheduled_operations_;
     resource_pool_leader_id = resource_pool_leader_id_;
     compute_count = compute_count_;
     compute_model = compute_model_;
     cpu_core_count = cpu_core_count_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     provisionable_cpus = provisionable_cpus_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     used_data_storage_size_in_t_bs = used_data_storage_size_in_t_bs_;
     used_data_storage_size_in_g_bs = used_data_storage_size_in_g_bs_;
     actual_used_data_storage_size_in_t_bs = actual_used_data_storage_size_in_t_bs_;
     allocated_storage_size_in_t_bs = allocated_storage_size_in_t_bs_;
     in_memory_area_in_g_bs = in_memory_area_in_g_bs_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     private_endpoint = private_endpoint_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint_label = private_endpoint_label_;
     allowlisted_ips = allowlisted_ips_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_remote_data_guard_enabled = is_remote_data_guard_enabled_;
     local_disaster_recovery_type = local_disaster_recovery_type_;
     role = role_;
     peer_db_ids = peer_db_ids_;
     failed_data_recovery_in_seconds = failed_data_recovery_in_seconds_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     remote_disaster_recovery_configuration = remote_disaster_recovery_configuration_;
     is_refreshable_clone = is_refreshable_clone_;
     refreshable_mode = refreshable_mode_;
     refreshable_status = refreshable_status_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     is_reconnect_clone_enabled = is_reconnect_clone_enabled_;
     clone_table_space_list = clone_table_space_list_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     long_term_backup_schedule = long_term_backup_schedule_;
     is_backup_retention_locked = is_backup_retention_locked_;
     total_backup_storage_size_in_g_bs = total_backup_storage_size_in_g_bs_;
     resource_pool_summary = resource_pool_summary_;
     encryption_summary = encryption_summary_;
     created_at = created_at_;
     time_of_last_backup = time_of_last_backup_;
     time_maintenance_begin = time_maintenance_begin_;
     time_maintenance_end = time_maintenance_end_;
     time_local_data_guard_enabled = time_local_data_guard_enabled_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     time_of_last_switchover = time_of_last_switchover_;
     time_of_last_failover = time_of_last_failover_;
     time_of_last_refresh = time_of_last_refresh_;
     time_of_last_refresh_point = time_of_last_refresh_point_;
     time_of_next_refresh = time_of_next_refresh_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     time_deletion_of_free_autonomous_database = time_deletion_of_free_autonomous_database_;
     time_reclamation_of_free_autonomous_database = time_reclamation_of_free_autonomous_database_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_until_reconnect_clone_enabled = time_until_reconnect_clone_enabled_;
     next_long_term_backup_time_stamp = next_long_term_backup_time_stamp_;
     time_undeleted = time_undeleted_;
   }
    : autonomous_database_summary)

let make_autonomous_database_peer_summary
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     autonomous_database_arn = autonomous_database_arn_;
     ocid = ocid_;
     region = region_;
   }
    : autonomous_database_peer_summary)

let make_autonomous_database_version_summary ?db_workload:(db_workload_ : db_workload option)
    ?details:(details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ db_workload = db_workload_; details = details_; version = version_ }
    : autonomous_database_version_summary)

let make_autonomous_database_wallet_details
    ?status:(status_ : autonomous_database_wallet_status option)
    ?time_rotated:(time_rotated_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ status = status_; time_rotated = time_rotated_ } : autonomous_database_wallet_details)

let make_autonomous_virtual_machine_summary
    ?autonomous_virtual_machine_id:(autonomous_virtual_machine_id_ : resource_id option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vm_name:(vm_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?db_server_display_name:(db_server_display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?client_ip_address:(client_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_autonomous_vm_cluster_id:
      (cloud_autonomous_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     autonomous_virtual_machine_id = autonomous_virtual_machine_id_;
     status = status_;
     status_reason = status_reason_;
     vm_name = vm_name_;
     db_server_id = db_server_id_;
     db_server_display_name = db_server_display_name_;
     cpu_core_count = cpu_core_count_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     client_ip_address = client_ip_address_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
   }
    : autonomous_virtual_machine_summary)

let make_aws_encryption_key_configuration_input ?iam_role_arn:(iam_role_arn_ : role_arn option)
    ?external_id_type:(external_id_type_ : external_id_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option) () =
  ({ iam_role_arn = iam_role_arn_; external_id_type = external_id_type_; kms_key_id = kms_key_id_ }
    : aws_encryption_key_configuration_input)

let make_clone_to_refreshable_configuration
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?open_mode:(open_mode_ : open_mode option) ?clone_type:(clone_type_ : clone_type option)
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn) () =
  ({
     source_autonomous_database_id = source_autonomous_database_id_;
     refreshable_mode = refreshable_mode_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     open_mode = open_mode_;
     clone_type = clone_type_;
   }
    : clone_to_refreshable_configuration)

let make_iam_role ?iam_role_arn:(iam_role_arn_ : role_arn option)
    ?status:(status_ : iam_role_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?aws_integration:(aws_integration_ : supported_aws_integration option) () =
  ({
     iam_role_arn = iam_role_arn_;
     status = status_;
     status_reason = status_reason_;
     aws_integration = aws_integration_;
   }
    : iam_role)

let make_month ?name:(name_ : month_name option) () = ({ name = name_ } : month)

let make_maintenance_window
    ?custom_action_timeout_in_mins:
      (custom_action_timeout_in_mins_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?days_of_week:(days_of_week_ : days_of_week option)
    ?hours_of_day:(hours_of_day_ : hours_of_day option)
    ?is_custom_action_timeout_enabled:
      (is_custom_action_timeout_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?lead_time_in_weeks:(lead_time_in_weeks_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?months:(months_ : months option) ?patching_mode:(patching_mode_ : patching_mode_type option)
    ?preference:(preference_ : preference_type option)
    ?skip_ru:(skip_ru_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?weeks_of_month:(weeks_of_month_ : weeks_of_month option) () =
  ({
     custom_action_timeout_in_mins = custom_action_timeout_in_mins_;
     days_of_week = days_of_week_;
     hours_of_day = hours_of_day_;
     is_custom_action_timeout_enabled = is_custom_action_timeout_enabled_;
     lead_time_in_weeks = lead_time_in_weeks_;
     months = months_;
     patching_mode = patching_mode_;
     preference = preference_;
     skip_ru = skip_ru_;
     weeks_of_month = weeks_of_month_;
   }
    : maintenance_window)

let make_cloud_autonomous_vm_cluster
    ?cloud_autonomous_vm_cluster_arn:
      (cloud_autonomous_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?display_name:(display_name_ : resource_display_name option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?autonomous_data_storage_percentage:
      (autonomous_data_storage_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?available_autonomous_data_storage_size_in_t_bs:
      (available_autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?available_container_databases:
      (available_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_cpus:(available_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_percentage:(cpu_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_servers:(db_servers_ : string_list option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_storage_in_t_bs_lowest_scaled_value:
      (exadata_storage_in_t_bs_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.double option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?max_acds_lowest_scaled_value:
      (max_acds_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?non_provisionable_autonomous_container_databases:
      (non_provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_autonomous_container_databases:
      (provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisioned_autonomous_container_databases:
      (provisioned_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisioned_cpus:(provisioned_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reclaimable_cpus:(reclaimable_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reserved_cpus:(reserved_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_database_ssl_certificate_expires:
      (time_database_ssl_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_ords_certificate_expires:
      (time_ords_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_container_databases:
      (total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?iam_roles:(iam_roles_ : iam_role_list option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     cloud_autonomous_vm_cluster_arn = cloud_autonomous_vm_cluster_arn_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     percent_progress = percent_progress_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     autonomous_data_storage_percentage = autonomous_data_storage_percentage_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     available_autonomous_data_storage_size_in_t_bs =
       available_autonomous_data_storage_size_in_t_bs_;
     available_container_databases = available_container_databases_;
     available_cpus = available_cpus_;
     compute_model = compute_model_;
     cpu_core_count = cpu_core_count_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     cpu_percentage = cpu_percentage_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_servers = db_servers_;
     description = description_;
     domain = domain_;
     exadata_storage_in_t_bs_lowest_scaled_value = exadata_storage_in_t_bs_lowest_scaled_value_;
     hostname = hostname_;
     ocid = ocid_;
     oci_url = oci_url_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     license_model = license_model_;
     maintenance_window = maintenance_window_;
     max_acds_lowest_scaled_value = max_acds_lowest_scaled_value_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     node_count = node_count_;
     non_provisionable_autonomous_container_databases =
       non_provisionable_autonomous_container_databases_;
     provisionable_autonomous_container_databases = provisionable_autonomous_container_databases_;
     provisioned_autonomous_container_databases = provisioned_autonomous_container_databases_;
     provisioned_cpus = provisioned_cpus_;
     reclaimable_cpus = reclaimable_cpus_;
     reserved_cpus = reserved_cpus_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     scan_listener_port_tls = scan_listener_port_tls_;
     shape = shape_;
     created_at = created_at_;
     time_database_ssl_certificate_expires = time_database_ssl_certificate_expires_;
     time_ords_certificate_expires = time_ords_certificate_expires_;
     time_zone = time_zone_;
     total_container_databases = total_container_databases_;
     iam_roles = iam_roles_;
   }
    : cloud_autonomous_vm_cluster)

let make_cloud_autonomous_vm_cluster_summary
    ?cloud_autonomous_vm_cluster_arn:
      (cloud_autonomous_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?display_name:(display_name_ : resource_display_name option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?autonomous_data_storage_percentage:
      (autonomous_data_storage_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?available_autonomous_data_storage_size_in_t_bs:
      (available_autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?available_container_databases:
      (available_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_cpus:(available_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_percentage:(cpu_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_servers:(db_servers_ : string_list option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_storage_in_t_bs_lowest_scaled_value:
      (exadata_storage_in_t_bs_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.double option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?max_acds_lowest_scaled_value:
      (max_acds_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?non_provisionable_autonomous_container_databases:
      (non_provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_autonomous_container_databases:
      (provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisioned_autonomous_container_databases:
      (provisioned_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisioned_cpus:(provisioned_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reclaimable_cpus:(reclaimable_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reserved_cpus:(reserved_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_database_ssl_certificate_expires:
      (time_database_ssl_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_ords_certificate_expires:
      (time_ords_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_container_databases:
      (total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?iam_roles:(iam_roles_ : iam_role_list option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     cloud_autonomous_vm_cluster_arn = cloud_autonomous_vm_cluster_arn_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     percent_progress = percent_progress_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     autonomous_data_storage_percentage = autonomous_data_storage_percentage_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     available_autonomous_data_storage_size_in_t_bs =
       available_autonomous_data_storage_size_in_t_bs_;
     available_container_databases = available_container_databases_;
     available_cpus = available_cpus_;
     compute_model = compute_model_;
     cpu_core_count = cpu_core_count_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     cpu_percentage = cpu_percentage_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_servers = db_servers_;
     description = description_;
     domain = domain_;
     exadata_storage_in_t_bs_lowest_scaled_value = exadata_storage_in_t_bs_lowest_scaled_value_;
     hostname = hostname_;
     ocid = ocid_;
     oci_url = oci_url_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     license_model = license_model_;
     maintenance_window = maintenance_window_;
     max_acds_lowest_scaled_value = max_acds_lowest_scaled_value_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     node_count = node_count_;
     non_provisionable_autonomous_container_databases =
       non_provisionable_autonomous_container_databases_;
     provisionable_autonomous_container_databases = provisionable_autonomous_container_databases_;
     provisioned_autonomous_container_databases = provisioned_autonomous_container_databases_;
     provisioned_cpus = provisioned_cpus_;
     reclaimable_cpus = reclaimable_cpus_;
     reserved_cpus = reserved_cpus_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     scan_listener_port_tls = scan_listener_port_tls_;
     shape = shape_;
     created_at = created_at_;
     time_database_ssl_certificate_expires = time_database_ssl_certificate_expires_;
     time_ords_certificate_expires = time_ords_certificate_expires_;
     time_zone = time_zone_;
     total_container_databases = total_container_databases_;
     iam_roles = iam_roles_;
   }
    : cloud_autonomous_vm_cluster_summary)

let make_cloud_autonomous_vm_cluster_resource_details
    ?cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id option)
    ?unallocated_adb_storage_in_t_bs:
      (unallocated_adb_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     unallocated_adb_storage_in_t_bs = unallocated_adb_storage_in_t_bs_;
   }
    : cloud_autonomous_vm_cluster_resource_details)

let make_cloud_exadata_infrastructure
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:
      (cloud_exadata_infrastructure_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activated_storage_count:(activated_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?additional_storage_count:
      (additional_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_storage_size_in_g_bs:
      (available_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_count:(cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_version:(db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_maintenance_run_id:(last_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_data_storage_in_t_bs:(max_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?max_db_node_storage_size_in_g_bs:
      (max_db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?monthly_db_server_version:
      (monthly_db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_storage_server_version:
      (monthly_storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_maintenance_run_id:(next_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_server_version:(storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?total_storage_size_in_g_bs:
      (total_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?database_server_type:(database_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_server_type:(storage_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     activated_storage_count = activated_storage_count_;
     additional_storage_count = additional_storage_count_;
     available_storage_size_in_g_bs = available_storage_size_in_g_bs_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     compute_count = compute_count_;
     cpu_count = cpu_count_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_version = db_server_version_;
     last_maintenance_run_id = last_maintenance_run_id_;
     maintenance_window = maintenance_window_;
     max_cpu_count = max_cpu_count_;
     max_data_storage_in_t_bs = max_data_storage_in_t_bs_;
     max_db_node_storage_size_in_g_bs = max_db_node_storage_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     monthly_db_server_version = monthly_db_server_version_;
     monthly_storage_server_version = monthly_storage_server_version_;
     next_maintenance_run_id = next_maintenance_run_id_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_url = oci_url_;
     ocid = ocid_;
     shape = shape_;
     storage_count = storage_count_;
     storage_server_version = storage_server_version_;
     created_at = created_at_;
     total_storage_size_in_g_bs = total_storage_size_in_g_bs_;
     percent_progress = percent_progress_;
     database_server_type = database_server_type_;
     storage_server_type = storage_server_type_;
     compute_model = compute_model_;
   }
    : cloud_exadata_infrastructure)

let make_cloud_exadata_infrastructure_summary
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:
      (cloud_exadata_infrastructure_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activated_storage_count:(activated_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?additional_storage_count:
      (additional_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_storage_size_in_g_bs:
      (available_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_count:(cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_version:(db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_maintenance_run_id:(last_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_data_storage_in_t_bs:(max_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?max_db_node_storage_size_in_g_bs:
      (max_db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?monthly_db_server_version:
      (monthly_db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_storage_server_version:
      (monthly_storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_maintenance_run_id:(next_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?storage_server_version:(storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?total_storage_size_in_g_bs:
      (total_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?database_server_type:(database_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_server_type:(storage_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     activated_storage_count = activated_storage_count_;
     additional_storage_count = additional_storage_count_;
     available_storage_size_in_g_bs = available_storage_size_in_g_bs_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     compute_count = compute_count_;
     cpu_count = cpu_count_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_version = db_server_version_;
     last_maintenance_run_id = last_maintenance_run_id_;
     maintenance_window = maintenance_window_;
     max_cpu_count = max_cpu_count_;
     max_data_storage_in_t_bs = max_data_storage_in_t_bs_;
     max_db_node_storage_size_in_g_bs = max_db_node_storage_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     monthly_db_server_version = monthly_db_server_version_;
     monthly_storage_server_version = monthly_storage_server_version_;
     next_maintenance_run_id = next_maintenance_run_id_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_url = oci_url_;
     ocid = ocid_;
     shape = shape_;
     storage_count = storage_count_;
     storage_server_version = storage_server_version_;
     created_at = created_at_;
     total_storage_size_in_g_bs = total_storage_size_in_g_bs_;
     percent_progress = percent_progress_;
     database_server_type = database_server_type_;
     storage_server_type = storage_server_type_;
     compute_model = compute_model_;
   }
    : cloud_exadata_infrastructure_summary)

let make_cloud_exadata_infrastructure_unallocated_resources
    ?cloud_autonomous_vm_clusters:
      (cloud_autonomous_vm_clusters_ : cloud_autonomous_vm_cluster_resource_details_list option)
    ?cloud_exadata_infrastructure_display_name:
      (cloud_exadata_infrastructure_display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_storage_in_t_bs:(exadata_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?local_storage_in_g_bs:(local_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_in_g_bs:(memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ocpus:(ocpus_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     cloud_autonomous_vm_clusters = cloud_autonomous_vm_clusters_;
     cloud_exadata_infrastructure_display_name = cloud_exadata_infrastructure_display_name_;
     exadata_storage_in_t_bs = exadata_storage_in_t_bs_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     local_storage_in_g_bs = local_storage_in_g_bs_;
     memory_in_g_bs = memory_in_g_bs_;
     ocpus = ocpus_;
   }
    : cloud_exadata_infrastructure_unallocated_resources)

let make_db_iorm_config ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?flash_cache_limit:(flash_cache_limit_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?share:(share_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ db_name = db_name_; flash_cache_limit = flash_cache_limit_; share = share_ } : db_iorm_config)

let make_exadata_iorm_config ?db_plans:(db_plans_ : db_iorm_config_list option)
    ?lifecycle_details:(lifecycle_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lifecycle_state:(lifecycle_state_ : iorm_lifecycle_state option)
    ?objective:(objective_ : objective option) () =
  ({
     db_plans = db_plans_;
     lifecycle_details = lifecycle_details_;
     lifecycle_state = lifecycle_state_;
     objective = objective_;
   }
    : exadata_iorm_config)

let make_data_collection_options
    ?is_diagnostics_events_enabled:
      (is_diagnostics_events_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_health_monitoring_enabled:
      (is_health_monitoring_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_incident_logs_enabled:
      (is_incident_logs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     is_diagnostics_events_enabled = is_diagnostics_events_enabled_;
     is_health_monitoring_enabled = is_health_monitoring_enabled_;
     is_incident_logs_enabled = is_incident_logs_enabled_;
   }
    : data_collection_options)

let make_cloud_vm_cluster ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_vm_cluster_arn:(cloud_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cluster_name:(cluster_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_servers:(db_servers_ : string_list option)
    ?disk_redundancy:(disk_redundancy_ : disk_redundancy option)
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?iorm_config_cache:(iorm_config_cache_ : exadata_iorm_config option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?last_update_history_entry_id:
      (last_update_history_entry_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_model:(license_model_ : license_model option)
    ?listener_port:(listener_port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_name:(scan_dns_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_record_id:(scan_dns_record_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_ip_ids:(scan_ip_ids_ : string_list option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ssh_public_keys:(ssh_public_keys_ : sensitive_string_list option)
    ?storage_size_in_g_bs:(storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vip_ids:(vip_ids_ : string_list option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?iam_roles:(iam_roles_ : iam_role_list option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_vm_cluster_arn = cloud_vm_cluster_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cluster_name = cluster_name_;
     cpu_core_count = cpu_core_count_;
     data_collection_options = data_collection_options_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_servers = db_servers_;
     disk_redundancy = disk_redundancy_;
     gi_version = gi_version_;
     hostname = hostname_;
     iorm_config_cache = iorm_config_cache_;
     is_local_backup_enabled = is_local_backup_enabled_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     last_update_history_entry_id = last_update_history_entry_id_;
     license_model = license_model_;
     listener_port = listener_port_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     node_count = node_count_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_url = oci_url_;
     domain = domain_;
     scan_dns_name = scan_dns_name_;
     scan_dns_record_id = scan_dns_record_id_;
     scan_ip_ids = scan_ip_ids_;
     shape = shape_;
     ssh_public_keys = ssh_public_keys_;
     storage_size_in_g_bs = storage_size_in_g_bs_;
     system_version = system_version_;
     created_at = created_at_;
     time_zone = time_zone_;
     vip_ids = vip_ids_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     percent_progress = percent_progress_;
     compute_model = compute_model_;
     iam_roles = iam_roles_;
   }
    : cloud_vm_cluster)

let make_cloud_vm_cluster_summary
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_vm_cluster_arn:(cloud_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cluster_name:(cluster_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_servers:(db_servers_ : string_list option)
    ?disk_redundancy:(disk_redundancy_ : disk_redundancy option)
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?iorm_config_cache:(iorm_config_cache_ : exadata_iorm_config option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?last_update_history_entry_id:
      (last_update_history_entry_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_model:(license_model_ : license_model option)
    ?listener_port:(listener_port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_name:(scan_dns_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_record_id:(scan_dns_record_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_ip_ids:(scan_ip_ids_ : string_list option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ssh_public_keys:(ssh_public_keys_ : sensitive_string_list option)
    ?storage_size_in_g_bs:(storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vip_ids:(vip_ids_ : string_list option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?iam_roles:(iam_roles_ : iam_role_list option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_vm_cluster_arn = cloud_vm_cluster_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cluster_name = cluster_name_;
     cpu_core_count = cpu_core_count_;
     data_collection_options = data_collection_options_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_servers = db_servers_;
     disk_redundancy = disk_redundancy_;
     gi_version = gi_version_;
     hostname = hostname_;
     iorm_config_cache = iorm_config_cache_;
     is_local_backup_enabled = is_local_backup_enabled_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     last_update_history_entry_id = last_update_history_entry_id_;
     license_model = license_model_;
     listener_port = listener_port_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     node_count = node_count_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_url = oci_url_;
     domain = domain_;
     scan_dns_name = scan_dns_name_;
     scan_dns_record_id = scan_dns_record_id_;
     scan_ip_ids = scan_ip_ids_;
     shape = shape_;
     ssh_public_keys = ssh_public_keys_;
     storage_size_in_g_bs = storage_size_in_g_bs_;
     system_version = system_version_;
     created_at = created_at_;
     time_zone = time_zone_;
     vip_ids = vip_ids_;
     odb_network_id = odb_network_id_;
     odb_network_arn = odb_network_arn_;
     percent_progress = percent_progress_;
     compute_model = compute_model_;
     iam_roles = iam_roles_;
   }
    : cloud_vm_cluster_summary)

let make_create_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : create_autonomous_database_output)

let make_cross_region_disaster_recovery_configuration
    ?is_replicate_automatic_backups:
      (is_replicate_automatic_backups_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~source_autonomous_database_arn:(source_autonomous_database_arn_ : arn)
    ~remote_disaster_recovery_type:(remote_disaster_recovery_type_ : disaster_recovery_type) () =
  ({
     source_autonomous_database_arn = source_autonomous_database_arn_;
     remote_disaster_recovery_type = remote_disaster_recovery_type_;
     is_replicate_automatic_backups = is_replicate_automatic_backups_;
   }
    : cross_region_disaster_recovery_configuration)

let make_cross_region_data_guard_configuration
    ~source_autonomous_database_arn:(source_autonomous_database_arn_ : arn) () =
  ({ source_autonomous_database_arn = source_autonomous_database_arn_ }
    : cross_region_data_guard_configuration)

let make_point_in_time_restore_configuration
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?use_latest_available_backup_timestamp:
      (use_latest_available_backup_timestamp_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn)
    ~clone_type:(clone_type_ : clone_type) () =
  ({
     source_autonomous_database_id = source_autonomous_database_id_;
     clone_type = clone_type_;
     timestamp = timestamp_;
     use_latest_available_backup_timestamp = use_latest_available_backup_timestamp_;
     clone_table_space_list = clone_table_space_list_;
   }
    : point_in_time_restore_configuration)

let make_restore_from_backup_configuration
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id_or_arn)
    ~clone_type:(clone_type_ : clone_type) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     clone_type = clone_type_;
     clone_table_space_list = clone_table_space_list_;
   }
    : restore_from_backup_configuration)

let make_database_clone_configuration
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn)
    ~clone_type:(clone_type_ : clone_type) () =
  ({ source_autonomous_database_id = source_autonomous_database_id_; clone_type = clone_type_ }
    : database_clone_configuration)

let make_transportable_tablespace
    ?tts_bundle_url:(tts_bundle_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ tts_bundle_url = tts_bundle_url_ } : transportable_tablespace)

let make_create_autonomous_database_input
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?display_name:(display_name_ : resource_display_name option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_password:(admin_password_ : sensitive_string option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_workload:(db_workload_ : db_workload option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_edition:(database_edition_ : database_edition option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?byol_compute_count_limit:(byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : resource_id_or_arn option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?transportable_tablespace:(transportable_tablespace_ : transportable_tablespace option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?source:(source_ : source_type option)
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider_input option)
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration_input option)
    ?client_token:(client_token_ : general_input_string option)
    ?tags:(tags_ : request_tag_map option) () =
  ({
     odb_network_id = odb_network_id_;
     display_name = display_name_;
     db_name = db_name_;
     admin_password = admin_password_;
     compute_count = compute_count_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     db_workload = db_workload_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     license_model = license_model_;
     character_set = character_set_;
     ncharacter_set = ncharacter_set_;
     db_version = db_version_;
     database_edition = database_edition_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     byol_compute_count_limit = byol_compute_count_limit_;
     cpu_core_count = cpu_core_count_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint_label = private_endpoint_label_;
     resource_pool_leader_id = resource_pool_leader_id_;
     resource_pool_summary = resource_pool_summary_;
     scheduled_operations = scheduled_operations_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     allowlisted_ips = allowlisted_ips_;
     transportable_tablespace = transportable_tablespace_;
     is_backup_retention_locked = is_backup_retention_locked_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_mtls_connection_required = is_mtls_connection_required_;
     db_tools_details = db_tools_details_;
     source = source_;
     source_configuration = source_configuration_;
     encryption_key_provider = encryption_key_provider_;
     encryption_key_configuration = encryption_key_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_autonomous_database_input)

let make_create_autonomous_database_backup_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backup_id:
      (autonomous_database_backup_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : create_autonomous_database_backup_output)

let make_create_autonomous_database_backup_input
    ?display_name:(display_name_ : resource_display_name option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?client_token:(client_token_ : general_input_string option)
    ?tags:(tags_ : request_tag_map option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     retention_period_in_days = retention_period_in_days_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_autonomous_database_backup_input)

let make_create_autonomous_database_wallet_output
    ~autonomous_database_wallet_file:
      (autonomous_database_wallet_file_ : autonomous_database_wallet_file) () =
  ({ autonomous_database_wallet_file = autonomous_database_wallet_file_ }
    : create_autonomous_database_wallet_output)

let make_create_autonomous_database_wallet_input ?wallet_type:(wallet_type_ : wallet_type option)
    ?client_token:(client_token_ : general_input_string option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn)
    ~password:(password_ : sensitive_string) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     wallet_type = wallet_type_;
     password = password_;
     client_token = client_token_;
   }
    : create_autonomous_database_wallet_input)

let make_create_cloud_autonomous_vm_cluster_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_cluster_id:
      (cloud_autonomous_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
   }
    : create_cloud_autonomous_vm_cluster_output)

let make_create_cloud_autonomous_vm_cluster_input
    ?client_token:(client_token_ : general_input_string option)
    ?db_servers:(db_servers_ : string_list option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?tags:(tags_ : request_tag_map option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn)
    ~display_name:(display_name_ : resource_display_name)
    ~autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double)
    ~cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer)
    ~memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer)
    ~total_container_databases:(total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer) ()
    =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     odb_network_id = odb_network_id_;
     display_name = display_name_;
     client_token = client_token_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     db_servers = db_servers_;
     description = description_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     license_model = license_model_;
     maintenance_window = maintenance_window_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     scan_listener_port_tls = scan_listener_port_tls_;
     tags = tags_;
     time_zone = time_zone_;
     total_container_databases = total_container_databases_;
   }
    : create_cloud_autonomous_vm_cluster_input)

let make_create_cloud_exadata_infrastructure_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : create_cloud_exadata_infrastructure_output)

let make_create_cloud_exadata_infrastructure_input
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : request_tag_map option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?client_token:(client_token_ : general_input_string option)
    ?database_server_type:(database_server_type_ : general_input_string option)
    ?storage_server_type:(storage_server_type_ : general_input_string option)
    ~display_name:(display_name_ : resource_display_name) ~shape:(shape_ : general_input_string)
    ~compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     display_name = display_name_;
     shape = shape_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     tags = tags_;
     compute_count = compute_count_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     maintenance_window = maintenance_window_;
     storage_count = storage_count_;
     client_token = client_token_;
     database_server_type = database_server_type_;
     storage_server_type = storage_server_type_;
   }
    : create_cloud_exadata_infrastructure_input)

let make_create_cloud_vm_cluster_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
   }
    : create_cloud_vm_cluster_output)

let make_create_cloud_vm_cluster_input ?cluster_name:(cluster_name_ : cluster_name option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_servers:(db_servers_ : string_list option) ?tags:(tags_ : request_tag_map option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_token:(client_token_ : general_input_string option)
    ?scan_listener_port_tcp:(scan_listener_port_tcp_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn)
    ~cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~display_name:(display_name_ : resource_display_name)
    ~gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_) ~hostname:(hostname_ : hostname)
    ~ssh_public_keys:(ssh_public_keys_ : string_list)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cpu_core_count = cpu_core_count_;
     display_name = display_name_;
     gi_version = gi_version_;
     hostname = hostname_;
     ssh_public_keys = ssh_public_keys_;
     odb_network_id = odb_network_id_;
     cluster_name = cluster_name_;
     data_collection_options = data_collection_options_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_servers = db_servers_;
     tags = tags_;
     is_local_backup_enabled = is_local_backup_enabled_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     license_model = license_model_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     system_version = system_version_;
     time_zone = time_zone_;
     client_token = client_token_;
     scan_listener_port_tcp = scan_listener_port_tcp_;
   }
    : create_cloud_vm_cluster_input)

let make_create_odb_network_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_network_id = odb_network_id_;
   }
    : create_odb_network_output)

let make_create_odb_network_input
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_token:(client_token_ : general_input_string option)
    ?s3_access:(s3_access_ : access option) ?zero_etl_access:(zero_etl_access_ : access option)
    ?sts_access:(sts_access_ : access option) ?kms_access:(kms_access_ : access option)
    ?s3_policy_document:(s3_policy_document_ : policy_document option)
    ?sts_policy_document:(sts_policy_document_ : policy_document option)
    ?kms_policy_document:(kms_policy_document_ : policy_document option)
    ?cross_region_s3_restore_sources_to_enable:
      (cross_region_s3_restore_sources_to_enable_ : string_list option)
    ?tags:(tags_ : request_tag_map option) ~display_name:(display_name_ : resource_display_name)
    ~client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     client_subnet_cidr = client_subnet_cidr_;
     backup_subnet_cidr = backup_subnet_cidr_;
     custom_domain_name = custom_domain_name_;
     default_dns_prefix = default_dns_prefix_;
     client_token = client_token_;
     s3_access = s3_access_;
     zero_etl_access = zero_etl_access_;
     sts_access = sts_access_;
     kms_access = kms_access_;
     s3_policy_document = s3_policy_document_;
     sts_policy_document = sts_policy_document_;
     kms_policy_document = kms_policy_document_;
     cross_region_s3_restore_sources_to_enable = cross_region_s3_restore_sources_to_enable_;
     tags = tags_;
   }
    : create_odb_network_input)

let make_create_odb_peering_connection_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_peering_connection_id = odb_peering_connection_id_;
   }
    : create_odb_peering_connection_output)

let make_create_odb_peering_connection_input
    ?display_name:(display_name_ : resource_display_name option)
    ?peer_network_cidrs_to_be_added:(peer_network_cidrs_to_be_added_ : peered_cidr_list option)
    ?peer_network_route_table_ids:
      (peer_network_route_table_ids_ : peer_network_route_table_id_list option)
    ?client_token:(client_token_ : general_input_string option)
    ?tags:(tags_ : request_tag_map option) ~odb_network_id:(odb_network_id_ : resource_id_or_arn)
    ~peer_network_id:(peer_network_id_ : resource_id_or_arn) () =
  ({
     odb_network_id = odb_network_id_;
     peer_network_id = peer_network_id_;
     display_name = display_name_;
     peer_network_cidrs_to_be_added = peer_network_cidrs_to_be_added_;
     peer_network_route_table_ids = peer_network_route_table_ids_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_odb_peering_connection_input)

let make_cross_region_s3_restore_sources_access
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?status:(status_ : managed_resource_status option) () =
  ({ region = region_; ipv4_addresses = ipv4_addresses_; status = status_ }
    : cross_region_s3_restore_sources_access)

let make_db_node ?db_node_id:(db_node_id_ : resource_id option)
    ?db_node_arn:(db_node_arn_ : resource_arn option)
    ?status:(status_ : db_node_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_details:(additional_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_ip_id:(backup_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic2_id:(backup_vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic_id:(backup_vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?db_system_id:(db_system_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?fault_domain:(fault_domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?host_ip_id:(host_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_type:(maintenance_type_ : db_node_maintenance_type option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?software_storage_size_in_g_b:
      (software_storage_size_in_g_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_window_end:
      (time_maintenance_window_end_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_maintenance_window_start:
      (time_maintenance_window_start_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_cpu_core_count:(total_cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?vnic2_id:(vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vnic_id:(vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?floating_ip_address:(floating_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     db_node_id = db_node_id_;
     db_node_arn = db_node_arn_;
     status = status_;
     status_reason = status_reason_;
     additional_details = additional_details_;
     backup_ip_id = backup_ip_id_;
     backup_vnic2_id = backup_vnic2_id_;
     backup_vnic_id = backup_vnic_id_;
     cpu_core_count = cpu_core_count_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_id = db_server_id_;
     db_system_id = db_system_id_;
     fault_domain = fault_domain_;
     host_ip_id = host_ip_id_;
     hostname = hostname_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     maintenance_type = maintenance_type_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     software_storage_size_in_g_b = software_storage_size_in_g_b_;
     created_at = created_at_;
     time_maintenance_window_end = time_maintenance_window_end_;
     time_maintenance_window_start = time_maintenance_window_start_;
     total_cpu_core_count = total_cpu_core_count_;
     vnic2_id = vnic2_id_;
     vnic_id = vnic_id_;
     private_ip_address = private_ip_address_;
     floating_ip_address = floating_ip_address_;
   }
    : db_node)

let make_db_node_summary ?db_node_id:(db_node_id_ : resource_id option)
    ?db_node_arn:(db_node_arn_ : resource_arn option)
    ?status:(status_ : db_node_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_details:(additional_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_ip_id:(backup_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic2_id:(backup_vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic_id:(backup_vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?db_system_id:(db_system_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?fault_domain:(fault_domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?host_ip_id:(host_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maintenance_type:(maintenance_type_ : db_node_maintenance_type option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?software_storage_size_in_g_b:
      (software_storage_size_in_g_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_window_end:
      (time_maintenance_window_end_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_maintenance_window_start:
      (time_maintenance_window_start_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_cpu_core_count:(total_cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?vnic2_id:(vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vnic_id:(vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     db_node_id = db_node_id_;
     db_node_arn = db_node_arn_;
     status = status_;
     status_reason = status_reason_;
     additional_details = additional_details_;
     backup_ip_id = backup_ip_id_;
     backup_vnic2_id = backup_vnic2_id_;
     backup_vnic_id = backup_vnic_id_;
     cpu_core_count = cpu_core_count_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_id = db_server_id_;
     db_system_id = db_system_id_;
     fault_domain = fault_domain_;
     host_ip_id = host_ip_id_;
     hostname = hostname_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     maintenance_type = maintenance_type_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     software_storage_size_in_g_b = software_storage_size_in_g_b_;
     created_at = created_at_;
     time_maintenance_window_end = time_maintenance_window_end_;
     time_maintenance_window_start = time_maintenance_window_start_;
     total_cpu_core_count = total_cpu_core_count_;
     vnic2_id = vnic2_id_;
     vnic_id = vnic_id_;
   }
    : db_node_summary)

let make_db_server_patching_details
    ?estimated_patch_duration:
      (estimated_patch_duration_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?patching_status:(patching_status_ : db_server_patching_status option)
    ?time_patching_ended:(time_patching_ended_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_patching_started:(time_patching_started_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     estimated_patch_duration = estimated_patch_duration_;
     patching_status = patching_status_;
     time_patching_ended = time_patching_ended_;
     time_patching_started = time_patching_started_;
   }
    : db_server_patching_details)

let make_db_server ?db_server_id:(db_server_id_ : resource_id option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_patching_details:(db_server_patching_details_ : db_server_patching_details option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_infrastructure_id:
      (exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_in_g_bs:
      (max_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?vm_cluster_ids:(vm_cluster_ids_ : string_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?autonomous_vm_cluster_ids:(autonomous_vm_cluster_ids_ : string_list option)
    ?autonomous_virtual_machine_ids:(autonomous_virtual_machine_ids_ : string_list option) () =
  ({
     db_server_id = db_server_id_;
     status = status_;
     status_reason = status_reason_;
     cpu_core_count = cpu_core_count_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_patching_details = db_server_patching_details_;
     display_name = display_name_;
     exadata_infrastructure_id = exadata_infrastructure_id_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     max_cpu_count = max_cpu_count_;
     max_db_node_storage_in_g_bs = max_db_node_storage_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     shape = shape_;
     created_at = created_at_;
     vm_cluster_ids = vm_cluster_ids_;
     compute_model = compute_model_;
     autonomous_vm_cluster_ids = autonomous_vm_cluster_ids_;
     autonomous_virtual_machine_ids = autonomous_virtual_machine_ids_;
   }
    : db_server)

let make_db_server_summary ?db_server_id:(db_server_id_ : resource_id option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_patching_details:(db_server_patching_details_ : db_server_patching_details option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_infrastructure_id:
      (exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_in_g_bs:
      (max_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?vm_cluster_ids:(vm_cluster_ids_ : string_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?autonomous_vm_cluster_ids:(autonomous_vm_cluster_ids_ : string_list option)
    ?autonomous_virtual_machine_ids:(autonomous_virtual_machine_ids_ : string_list option) () =
  ({
     db_server_id = db_server_id_;
     status = status_;
     status_reason = status_reason_;
     cpu_core_count = cpu_core_count_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     db_server_patching_details = db_server_patching_details_;
     display_name = display_name_;
     exadata_infrastructure_id = exadata_infrastructure_id_;
     ocid = ocid_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     max_cpu_count = max_cpu_count_;
     max_db_node_storage_in_g_bs = max_db_node_storage_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     shape = shape_;
     created_at = created_at_;
     vm_cluster_ids = vm_cluster_ids_;
     compute_model = compute_model_;
     autonomous_vm_cluster_ids = autonomous_vm_cluster_ids_;
     autonomous_virtual_machine_ids = autonomous_virtual_machine_ids_;
   }
    : db_server_summary)

let make_db_system_shape_summary
    ?available_core_count:(available_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_core_count_per_node:
      (available_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_data_storage_in_t_bs:
      (available_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_data_storage_per_server_in_t_bs:
      (available_data_storage_per_server_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_db_node_per_node_in_g_bs:
      (available_db_node_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_db_node_storage_in_g_bs:
      (available_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_memory_in_g_bs:
      (available_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_memory_per_node_in_g_bs:
      (available_memory_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?core_count_increment:(core_count_increment_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_storage_count:(max_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maximum_node_count:(maximum_node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_core_count_per_node:(min_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_data_storage_in_t_bs:
      (min_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_db_node_storage_per_node_in_g_bs:
      (min_db_node_storage_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_memory_per_node_in_g_bs:
      (min_memory_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_storage_count:(min_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?minimum_core_count:(minimum_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?minimum_node_count:(minimum_node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?runtime_minimum_core_count:
      (runtime_minimum_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape_family:(shape_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape_type:(shape_type_ : shape_type option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?are_server_types_supported:
      (are_server_types_supported_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     available_core_count = available_core_count_;
     available_core_count_per_node = available_core_count_per_node_;
     available_data_storage_in_t_bs = available_data_storage_in_t_bs_;
     available_data_storage_per_server_in_t_bs = available_data_storage_per_server_in_t_bs_;
     available_db_node_per_node_in_g_bs = available_db_node_per_node_in_g_bs_;
     available_db_node_storage_in_g_bs = available_db_node_storage_in_g_bs_;
     available_memory_in_g_bs = available_memory_in_g_bs_;
     available_memory_per_node_in_g_bs = available_memory_per_node_in_g_bs_;
     core_count_increment = core_count_increment_;
     max_storage_count = max_storage_count_;
     maximum_node_count = maximum_node_count_;
     min_core_count_per_node = min_core_count_per_node_;
     min_data_storage_in_t_bs = min_data_storage_in_t_bs_;
     min_db_node_storage_per_node_in_g_bs = min_db_node_storage_per_node_in_g_bs_;
     min_memory_per_node_in_g_bs = min_memory_per_node_in_g_bs_;
     min_storage_count = min_storage_count_;
     minimum_core_count = minimum_core_count_;
     minimum_node_count = minimum_node_count_;
     runtime_minimum_core_count = runtime_minimum_core_count_;
     shape_family = shape_family_;
     shape_type = shape_type_;
     name = name_;
     compute_model = compute_model_;
     are_server_types_supported = are_server_types_supported_;
   }
    : db_system_shape_summary)

let make_delete_autonomous_database_output () = (() : unit)

let make_delete_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : delete_autonomous_database_input)

let make_delete_autonomous_database_backup_output () = (() : unit)

let make_delete_autonomous_database_backup_input
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({ autonomous_database_backup_id = autonomous_database_backup_id_ }
    : delete_autonomous_database_backup_input)

let make_delete_cloud_autonomous_vm_cluster_output () = (() : unit)

let make_delete_cloud_autonomous_vm_cluster_input
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({ cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_ }
    : delete_cloud_autonomous_vm_cluster_input)

let make_delete_cloud_exadata_infrastructure_output () = (() : unit)

let make_delete_cloud_exadata_infrastructure_input
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({ cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_ }
    : delete_cloud_exadata_infrastructure_input)

let make_delete_cloud_vm_cluster_output () = (() : unit)

let make_delete_cloud_vm_cluster_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) ()
    =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_ } : delete_cloud_vm_cluster_input)

let make_delete_odb_network_output () = (() : unit)

let make_delete_odb_network_input ~odb_network_id:(odb_network_id_ : resource_id_or_arn)
    ~delete_associated_resources:
      (delete_associated_resources_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({ odb_network_id = odb_network_id_; delete_associated_resources = delete_associated_resources_ }
    : delete_odb_network_input)

let make_delete_odb_peering_connection_output () = (() : unit)

let make_delete_odb_peering_connection_input
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({ odb_peering_connection_id = odb_peering_connection_id_ } : delete_odb_peering_connection_input)

let make_disassociate_iam_role_from_resource_output () = (() : unit)

let make_disassociate_iam_role_from_resource_input ~iam_role_arn:(iam_role_arn_ : role_arn)
    ~aws_integration:(aws_integration_ : supported_aws_integration)
    ~resource_arn:(resource_arn_ : arn) () =
  ({
     iam_role_arn = iam_role_arn_;
     aws_integration = aws_integration_;
     resource_arn = resource_arn_;
   }
    : disassociate_iam_role_from_resource_input)

let make_failover_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : failover_autonomous_database_output)

let make_failover_autonomous_database_input ?peer_db_arn:(peer_db_arn_ : resource_arn option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_; peer_db_arn = peer_db_arn_ }
    : failover_autonomous_database_input)

let make_get_autonomous_database_output
    ~autonomous_database:(autonomous_database_ : autonomous_database) () =
  ({ autonomous_database = autonomous_database_ } : get_autonomous_database_output)

let make_get_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : get_autonomous_database_input)

let make_get_autonomous_database_backup_output
    ?autonomous_database_backup:(autonomous_database_backup_ : autonomous_database_backup option) ()
    =
  ({ autonomous_database_backup = autonomous_database_backup_ }
    : get_autonomous_database_backup_output)

let make_get_autonomous_database_backup_input
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({ autonomous_database_backup_id = autonomous_database_backup_id_ }
    : get_autonomous_database_backup_input)

let make_get_autonomous_database_wallet_details_output
    ~autonomous_database_wallet_details:
      (autonomous_database_wallet_details_ : autonomous_database_wallet_details) () =
  ({ autonomous_database_wallet_details = autonomous_database_wallet_details_ }
    : get_autonomous_database_wallet_details_output)

let make_get_autonomous_database_wallet_details_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ }
    : get_autonomous_database_wallet_details_input)

let make_get_cloud_autonomous_vm_cluster_output
    ?cloud_autonomous_vm_cluster:(cloud_autonomous_vm_cluster_ : cloud_autonomous_vm_cluster option)
    () =
  ({ cloud_autonomous_vm_cluster = cloud_autonomous_vm_cluster_ }
    : get_cloud_autonomous_vm_cluster_output)

let make_get_cloud_autonomous_vm_cluster_input
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({ cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_ }
    : get_cloud_autonomous_vm_cluster_input)

let make_get_cloud_exadata_infrastructure_output
    ?cloud_exadata_infrastructure:
      (cloud_exadata_infrastructure_ : cloud_exadata_infrastructure option) () =
  ({ cloud_exadata_infrastructure = cloud_exadata_infrastructure_ }
    : get_cloud_exadata_infrastructure_output)

let make_get_cloud_exadata_infrastructure_input
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({ cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_ }
    : get_cloud_exadata_infrastructure_input)

let make_get_cloud_exadata_infrastructure_unallocated_resources_output
    ?cloud_exadata_infrastructure_unallocated_resources:
      (cloud_exadata_infrastructure_unallocated_resources_ :
         cloud_exadata_infrastructure_unallocated_resources option) () =
  ({
     cloud_exadata_infrastructure_unallocated_resources =
       cloud_exadata_infrastructure_unallocated_resources_;
   }
    : get_cloud_exadata_infrastructure_unallocated_resources_output)

let make_get_cloud_exadata_infrastructure_unallocated_resources_input
    ?db_servers:(db_servers_ : string_list option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({ cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_; db_servers = db_servers_ }
    : get_cloud_exadata_infrastructure_unallocated_resources_input)

let make_get_cloud_vm_cluster_output ?cloud_vm_cluster:(cloud_vm_cluster_ : cloud_vm_cluster option)
    () =
  ({ cloud_vm_cluster = cloud_vm_cluster_ } : get_cloud_vm_cluster_output)

let make_get_cloud_vm_cluster_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_ } : get_cloud_vm_cluster_input)

let make_get_db_node_output ?db_node:(db_node_ : db_node option) () =
  ({ db_node = db_node_ } : get_db_node_output)

let make_get_db_node_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id)
    ~db_node_id:(db_node_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_; db_node_id = db_node_id_ } : get_db_node_input)

let make_get_db_server_output ?db_server:(db_server_ : db_server option) () =
  ({ db_server = db_server_ } : get_db_server_output)

let make_get_db_server_input
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn)
    ~db_server_id:(db_server_id_ : resource_id) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     db_server_id = db_server_id_;
   }
    : get_db_server_input)

let make_subscription_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ error_message = error_message_ } : subscription_error)

let make_oci_iam_role ?iam_role_arn:(iam_role_arn_ : role_arn option)
    ?aws_integration:(aws_integration_ : oci_aws_integration option) () =
  ({ iam_role_arn = iam_role_arn_; aws_integration = aws_integration_ } : oci_iam_role)

let make_oci_identity_domain
    ?oci_identity_domain_id:(oci_identity_domain_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_identity_domain_resource_url:
      (oci_identity_domain_resource_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_identity_domain_url:(oci_identity_domain_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_setup_cloud_formation_url:
      (account_setup_cloud_formation_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     oci_identity_domain_id = oci_identity_domain_id_;
     oci_identity_domain_resource_url = oci_identity_domain_resource_url_;
     oci_identity_domain_url = oci_identity_domain_url_;
     status = status_;
     status_reason = status_reason_;
     account_setup_cloud_formation_url = account_setup_cloud_formation_url_;
   }
    : oci_identity_domain)

let make_get_oci_onboarding_status_output ?status:(status_ : oci_onboarding_status option)
    ?existing_tenancy_activation_link:
      (existing_tenancy_activation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?new_tenancy_activation_link:
      (new_tenancy_activation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_identity_domain:(oci_identity_domain_ : oci_identity_domain option)
    ?autonomous_database_oci_integration_iam_roles:
      (autonomous_database_oci_integration_iam_roles_ : oci_iam_role_list option)
    ?linked_oci_tenancy_id:(linked_oci_tenancy_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?linked_oci_compartment_id:
      (linked_oci_compartment_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subscription_errors:(subscription_errors_ : subscription_errors option) () =
  ({
     status = status_;
     existing_tenancy_activation_link = existing_tenancy_activation_link_;
     new_tenancy_activation_link = new_tenancy_activation_link_;
     oci_identity_domain = oci_identity_domain_;
     autonomous_database_oci_integration_iam_roles = autonomous_database_oci_integration_iam_roles_;
     linked_oci_tenancy_id = linked_oci_tenancy_id_;
     linked_oci_compartment_id = linked_oci_compartment_id_;
     subscription_errors = subscription_errors_;
   }
    : get_oci_onboarding_status_output)

let make_get_oci_onboarding_status_input () = (() : unit)

let make_kms_access ?status:(status_ : managed_resource_status option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_policy_document:(kms_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     status = status_;
     ipv4_addresses = ipv4_addresses_;
     domain_name = domain_name_;
     kms_policy_document = kms_policy_document_;
   }
    : kms_access)

let make_sts_access ?status:(status_ : managed_resource_status option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sts_policy_document:(sts_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     status = status_;
     ipv4_addresses = ipv4_addresses_;
     domain_name = domain_name_;
     sts_policy_document = sts_policy_document_;
   }
    : sts_access)

let make_s3_access ?status:(status_ : managed_resource_status option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?s3_policy_document:(s3_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     status = status_;
     ipv4_addresses = ipv4_addresses_;
     domain_name = domain_name_;
     s3_policy_document = s3_policy_document_;
   }
    : s3_access)

let make_zero_etl_access ?status:(status_ : managed_resource_status option)
    ?cidr:(cidr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ status = status_; cidr = cidr_ } : zero_etl_access)

let make_managed_s3_backup_access ?status:(status_ : managed_resource_status option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option) () =
  ({ status = status_; ipv4_addresses = ipv4_addresses_ } : managed_s3_backup_access)

let make_service_network_endpoint
    ?vpc_endpoint_id:(vpc_endpoint_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_endpoint_type:(vpc_endpoint_type_ : vpc_endpoint_type option) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; vpc_endpoint_type = vpc_endpoint_type_ }
    : service_network_endpoint)

let make_managed_services ?service_network_arn:(service_network_arn_ : resource_arn option)
    ?resource_gateway_arn:(resource_gateway_arn_ : resource_arn option)
    ?managed_services_ipv4_cidrs:(managed_services_ipv4_cidrs_ : string_list option)
    ?service_network_endpoint:(service_network_endpoint_ : service_network_endpoint option)
    ?managed_s3_backup_access:(managed_s3_backup_access_ : managed_s3_backup_access option)
    ?zero_etl_access:(zero_etl_access_ : zero_etl_access option)
    ?s3_access:(s3_access_ : s3_access option) ?sts_access:(sts_access_ : sts_access option)
    ?kms_access:(kms_access_ : kms_access option)
    ?cross_region_s3_restore_sources_access:
      (cross_region_s3_restore_sources_access_ : cross_region_s3_restore_sources_access_list option)
    () =
  ({
     service_network_arn = service_network_arn_;
     resource_gateway_arn = resource_gateway_arn_;
     managed_services_ipv4_cidrs = managed_services_ipv4_cidrs_;
     service_network_endpoint = service_network_endpoint_;
     managed_s3_backup_access = managed_s3_backup_access_;
     zero_etl_access = zero_etl_access_;
     s3_access = s3_access_;
     sts_access = sts_access_;
     kms_access = kms_access_;
     cross_region_s3_restore_sources_access = cross_region_s3_restore_sources_access_;
   }
    : managed_services)

let make_oci_dns_forwarding_config
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_dns_listener_ip:(oci_dns_listener_ip_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ domain_name = domain_name_; oci_dns_listener_ip = oci_dns_listener_ip_ }
    : oci_dns_forwarding_config)

let make_odb_network ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peered_cidrs:(peered_cidrs_ : string_list option)
    ?oci_network_anchor_id:(oci_network_anchor_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_url:(oci_network_anchor_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_id:(oci_vcn_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_url:(oci_vcn_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_dns_forwarding_configs:
      (oci_dns_forwarding_configs_ : oci_dns_forwarding_config_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?managed_services:(managed_services_ : managed_services option)
    ?ec2_placement_group_ids:(ec2_placement_group_ids_ : resource_id_list option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     odb_network_id = odb_network_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_network_arn = odb_network_arn_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     client_subnet_cidr = client_subnet_cidr_;
     backup_subnet_cidr = backup_subnet_cidr_;
     custom_domain_name = custom_domain_name_;
     default_dns_prefix = default_dns_prefix_;
     peered_cidrs = peered_cidrs_;
     oci_network_anchor_id = oci_network_anchor_id_;
     oci_network_anchor_url = oci_network_anchor_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_vcn_id = oci_vcn_id_;
     oci_vcn_url = oci_vcn_url_;
     oci_dns_forwarding_configs = oci_dns_forwarding_configs_;
     created_at = created_at_;
     percent_progress = percent_progress_;
     managed_services = managed_services_;
     ec2_placement_group_ids = ec2_placement_group_ids_;
   }
    : odb_network)

let make_get_odb_network_output ?odb_network:(odb_network_ : odb_network option) () =
  ({ odb_network = odb_network_ } : get_odb_network_output)

let make_get_odb_network_input ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({ odb_network_id = odb_network_id_ } : get_odb_network_input)

let make_odb_peering_connection
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_arn:
      (odb_peering_connection_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_arn:(peer_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_type:
      (odb_peering_connection_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_cidrs:(peer_network_cidrs_ : peered_cidr_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     odb_peering_connection_id = odb_peering_connection_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_peering_connection_arn = odb_peering_connection_arn_;
     odb_network_arn = odb_network_arn_;
     peer_network_arn = peer_network_arn_;
     odb_peering_connection_type = odb_peering_connection_type_;
     peer_network_cidrs = peer_network_cidrs_;
     created_at = created_at_;
     percent_progress = percent_progress_;
   }
    : odb_peering_connection)

let make_get_odb_peering_connection_output
    ?odb_peering_connection:(odb_peering_connection_ : odb_peering_connection option) () =
  ({ odb_peering_connection = odb_peering_connection_ } : get_odb_peering_connection_output)

let make_get_odb_peering_connection_input
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({ odb_peering_connection_id = odb_peering_connection_id_ } : get_odb_peering_connection_input)

let make_gi_version_summary ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ version = version_ } : gi_version_summary)

let make_initialize_service_output () = (() : unit)

let make_initialize_service_input
    ?oci_identity_domain:(oci_identity_domain_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ oci_identity_domain = oci_identity_domain_ } : initialize_service_input)

let make_list_autonomous_database_backups_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backups:(autonomous_database_backups_ : autonomous_database_backup_list) ()
    =
  ({ next_token = next_token_; autonomous_database_backups = autonomous_database_backups_ }
    : list_autonomous_database_backups_output)

let make_list_autonomous_database_backups_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?type_:(type__ : autonomous_database_backup_type option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     autonomous_database_id = autonomous_database_id_;
     status = status_;
     type_ = type__;
   }
    : list_autonomous_database_backups_input)

let make_list_autonomous_database_character_sets_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_character_sets:
      (autonomous_database_character_sets_ : autonomous_database_character_set_list) () =
  ({
     next_token = next_token_;
     autonomous_database_character_sets = autonomous_database_character_sets_;
   }
    : list_autonomous_database_character_sets_output)

let make_list_autonomous_database_character_sets_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?character_set_type:(character_set_type_ : character_set_type option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     character_set_type = character_set_type_;
   }
    : list_autonomous_database_character_sets_input)

let make_list_autonomous_database_clones_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_clones:(autonomous_database_clones_ : autonomous_database_list) () =
  ({ next_token = next_token_; autonomous_database_clones = autonomous_database_clones_ }
    : list_autonomous_database_clones_output)

let make_list_autonomous_database_clones_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     autonomous_database_id = autonomous_database_id_;
   }
    : list_autonomous_database_clones_input)

let make_list_autonomous_database_peers_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_peers:(autonomous_database_peers_ : autonomous_database_peer_list) () =
  ({ next_token = next_token_; autonomous_database_peers = autonomous_database_peers_ }
    : list_autonomous_database_peers_output)

let make_list_autonomous_database_peers_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     autonomous_database_id = autonomous_database_id_;
   }
    : list_autonomous_database_peers_input)

let make_list_autonomous_database_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_versions:(autonomous_database_versions_ : autonomous_database_version_list)
    () =
  ({ next_token = next_token_; autonomous_database_versions = autonomous_database_versions_ }
    : list_autonomous_database_versions_output)

let make_list_autonomous_database_versions_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option) () =
  ({ max_results = max_results_; next_token = next_token_; db_workload = db_workload_ }
    : list_autonomous_database_versions_input)

let make_list_autonomous_databases_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_databases:(autonomous_databases_ : autonomous_database_list) () =
  ({ next_token = next_token_; autonomous_databases = autonomous_databases_ }
    : list_autonomous_databases_output)

let make_list_autonomous_databases_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_autonomous_databases_input)

let make_list_autonomous_virtual_machines_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_virtual_machines:(autonomous_virtual_machines_ : autonomous_virtual_machine_list) ()
    =
  ({ next_token = next_token_; autonomous_virtual_machines = autonomous_virtual_machines_ }
    : list_autonomous_virtual_machines_output)

let make_list_autonomous_virtual_machines_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
   }
    : list_autonomous_virtual_machines_input)

let make_list_cloud_autonomous_vm_clusters_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_clusters:(cloud_autonomous_vm_clusters_ : cloud_autonomous_vm_cluster_list)
    () =
  ({ next_token = next_token_; cloud_autonomous_vm_clusters = cloud_autonomous_vm_clusters_ }
    : list_cloud_autonomous_vm_clusters_output)

let make_list_cloud_autonomous_vm_clusters_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : list_cloud_autonomous_vm_clusters_input)

let make_list_cloud_exadata_infrastructures_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructures:
      (cloud_exadata_infrastructures_ : cloud_exadata_infrastructure_list) () =
  ({ next_token = next_token_; cloud_exadata_infrastructures = cloud_exadata_infrastructures_ }
    : list_cloud_exadata_infrastructures_output)

let make_list_cloud_exadata_infrastructures_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_cloud_exadata_infrastructures_input)

let make_list_cloud_vm_clusters_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_clusters:(cloud_vm_clusters_ : cloud_vm_cluster_list) () =
  ({ next_token = next_token_; cloud_vm_clusters = cloud_vm_clusters_ }
    : list_cloud_vm_clusters_output)

let make_list_cloud_vm_clusters_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : list_cloud_vm_clusters_input)

let make_list_db_nodes_output ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_nodes:(db_nodes_ : db_node_list) () =
  ({ next_token = next_token_; db_nodes = db_nodes_ } : list_db_nodes_output)

let make_list_db_nodes_input ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
   }
    : list_db_nodes_input)

let make_list_db_servers_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_servers:(db_servers_ : db_server_list) () =
  ({ next_token = next_token_; db_servers = db_servers_ } : list_db_servers_output)

let make_list_db_servers_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_db_servers_input)

let make_list_db_system_shapes_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_system_shapes:(db_system_shapes_ : db_system_shape_list) () =
  ({ next_token = next_token_; db_system_shapes = db_system_shapes_ }
    : list_db_system_shapes_output)

let make_list_db_system_shapes_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
   }
    : list_db_system_shapes_input)

let make_list_gi_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~gi_versions:(gi_versions_ : gi_version_list) () =
  ({ next_token = next_token_; gi_versions = gi_versions_ } : list_gi_versions_output)

let make_list_gi_versions_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_; shape = shape_ }
    : list_gi_versions_input)

let make_odb_network_summary
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peered_cidrs:(peered_cidrs_ : string_list option)
    ?oci_network_anchor_id:(oci_network_anchor_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_url:(oci_network_anchor_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_id:(oci_vcn_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_url:(oci_vcn_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_dns_forwarding_configs:
      (oci_dns_forwarding_configs_ : oci_dns_forwarding_config_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?managed_services:(managed_services_ : managed_services option)
    ?ec2_placement_group_ids:(ec2_placement_group_ids_ : resource_id_list option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     odb_network_id = odb_network_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_network_arn = odb_network_arn_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     client_subnet_cidr = client_subnet_cidr_;
     backup_subnet_cidr = backup_subnet_cidr_;
     custom_domain_name = custom_domain_name_;
     default_dns_prefix = default_dns_prefix_;
     peered_cidrs = peered_cidrs_;
     oci_network_anchor_id = oci_network_anchor_id_;
     oci_network_anchor_url = oci_network_anchor_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_vcn_id = oci_vcn_id_;
     oci_vcn_url = oci_vcn_url_;
     oci_dns_forwarding_configs = oci_dns_forwarding_configs_;
     created_at = created_at_;
     percent_progress = percent_progress_;
     managed_services = managed_services_;
     ec2_placement_group_ids = ec2_placement_group_ids_;
   }
    : odb_network_summary)

let make_list_odb_networks_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_networks:(odb_networks_ : odb_network_list) () =
  ({ next_token = next_token_; odb_networks = odb_networks_ } : list_odb_networks_output)

let make_list_odb_networks_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_odb_networks_input)

let make_odb_peering_connection_summary
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_arn:
      (odb_peering_connection_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_arn:(peer_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_type:
      (odb_peering_connection_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_cidrs:(peer_network_cidrs_ : peered_cidr_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     odb_peering_connection_id = odb_peering_connection_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_peering_connection_arn = odb_peering_connection_arn_;
     odb_network_arn = odb_network_arn_;
     peer_network_arn = peer_network_arn_;
     odb_peering_connection_type = odb_peering_connection_type_;
     peer_network_cidrs = peer_network_cidrs_;
     created_at = created_at_;
     percent_progress = percent_progress_;
   }
    : odb_peering_connection_summary)

let make_list_odb_peering_connections_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connections:(odb_peering_connections_ : odb_peering_connection_list) () =
  ({ next_token = next_token_; odb_peering_connections = odb_peering_connections_ }
    : list_odb_peering_connections_output)

let make_list_odb_peering_connections_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option) () =
  ({ max_results = max_results_; next_token = next_token_; odb_network_id = odb_network_id_ }
    : list_odb_peering_connections_input)

let make_system_version_summary
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?system_versions:(system_versions_ : string_list option) () =
  ({ gi_version = gi_version_; shape = shape_; system_versions = system_versions_ }
    : system_version_summary)

let make_list_system_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~system_versions:(system_versions_ : system_version_list) () =
  ({ next_token = next_token_; system_versions = system_versions_ } : list_system_versions_output)

let make_list_system_versions_input
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     gi_version = gi_version_;
     shape = shape_;
   }
    : list_system_versions_input)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tags:(tags_ : request_tag_map) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_reboot_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : reboot_autonomous_database_output)

let make_reboot_autonomous_database_input
    ?is_online_reboot:(is_online_reboot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_; is_online_reboot = is_online_reboot_ }
    : reboot_autonomous_database_input)

let make_reboot_db_node_output ?status:(status_ : db_node_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ db_node_id = db_node_id_; status = status_; status_reason = status_reason_ }
    : reboot_db_node_output)

let make_reboot_db_node_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id)
    ~db_node_id:(db_node_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_; db_node_id = db_node_id_ } : reboot_db_node_input)

let make_restore_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : restore_autonomous_database_output)

let make_restore_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn)
    ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ autonomous_database_id = autonomous_database_id_; timestamp = timestamp_ }
    : restore_autonomous_database_input)

let make_shrink_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : shrink_autonomous_database_output)

let make_shrink_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : shrink_autonomous_database_input)

let make_start_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : start_autonomous_database_output)

let make_start_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : start_autonomous_database_input)

let make_start_db_node_output ?status:(status_ : db_node_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ db_node_id = db_node_id_; status = status_; status_reason = status_reason_ }
    : start_db_node_output)

let make_start_db_node_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id)
    ~db_node_id:(db_node_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_; db_node_id = db_node_id_ } : start_db_node_input)

let make_stop_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : stop_autonomous_database_output)

let make_stop_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : stop_autonomous_database_input)

let make_stop_db_node_output ?status:(status_ : db_node_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ db_node_id = db_node_id_; status = status_; status_reason = status_reason_ }
    : stop_db_node_output)

let make_stop_db_node_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id)
    ~db_node_id:(db_node_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_; db_node_id = db_node_id_ } : stop_db_node_input)

let make_switchover_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : switchover_autonomous_database_output)

let make_switchover_autonomous_database_input ?peer_db_arn:(peer_db_arn_ : resource_arn option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_; peer_db_arn = peer_db_arn_ }
    : switchover_autonomous_database_input)

let make_update_autonomous_database_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
   }
    : update_autonomous_database_output)

let make_update_autonomous_database_input
    ?admin_password:(admin_password_ : sensitive_string option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?display_name:(display_name_ : resource_display_name option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?database_edition:(database_edition_ : database_edition option)
    ?license_model:(license_model_ : license_model option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_disconnect_peer:(is_disconnect_peer_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?byol_compute_count_limit:(byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.double option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?open_mode:(open_mode_ : open_mode option)
    ?permission_level:(permission_level_ : permission_level option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_db_id:(peer_db_id_ : resource_id_or_arn option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : resource_id_or_arn option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider_input option)
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration_input option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     admin_password = admin_password_;
     compute_count = compute_count_;
     cpu_core_count = cpu_core_count_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     display_name = display_name_;
     db_name = db_name_;
     db_version = db_version_;
     db_workload = db_workload_;
     db_tools_details = db_tools_details_;
     database_edition = database_edition_;
     license_model = license_model_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     is_backup_retention_locked = is_backup_retention_locked_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_mtls_connection_required = is_mtls_connection_required_;
     is_refreshable_clone = is_refreshable_clone_;
     is_disconnect_peer = is_disconnect_peer_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     byol_compute_count_limit = byol_compute_count_limit_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     scheduled_operations = scheduled_operations_;
     long_term_backup_schedule = long_term_backup_schedule_;
     open_mode = open_mode_;
     permission_level = permission_level_;
     refreshable_mode = refreshable_mode_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint_label = private_endpoint_label_;
     peer_db_id = peer_db_id_;
     resource_pool_leader_id = resource_pool_leader_id_;
     resource_pool_summary = resource_pool_summary_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     allowlisted_ips = allowlisted_ips_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     encryption_key_provider = encryption_key_provider_;
     encryption_key_configuration = encryption_key_configuration_;
   }
    : update_autonomous_database_input)

let make_update_autonomous_database_backup_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backup_id:
      (autonomous_database_backup_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : update_autonomous_database_backup_output)

let make_update_autonomous_database_backup_input
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     retention_period_in_days = retention_period_in_days_;
   }
    : update_autonomous_database_backup_input)

let make_update_cloud_exadata_infrastructure_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : update_cloud_exadata_infrastructure_output)

let make_update_cloud_exadata_infrastructure_input
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     maintenance_window = maintenance_window_;
   }
    : update_cloud_exadata_infrastructure_input)

let make_update_odb_network_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_network_id = odb_network_id_;
   }
    : update_odb_network_output)

let make_update_odb_network_input ?display_name:(display_name_ : resource_display_name option)
    ?peered_cidrs_to_be_added:(peered_cidrs_to_be_added_ : string_list option)
    ?peered_cidrs_to_be_removed:(peered_cidrs_to_be_removed_ : string_list option)
    ?s3_access:(s3_access_ : access option) ?zero_etl_access:(zero_etl_access_ : access option)
    ?sts_access:(sts_access_ : access option) ?kms_access:(kms_access_ : access option)
    ?s3_policy_document:(s3_policy_document_ : policy_document option)
    ?sts_policy_document:(sts_policy_document_ : policy_document option)
    ?kms_policy_document:(kms_policy_document_ : policy_document option)
    ?cross_region_s3_restore_sources_to_enable:
      (cross_region_s3_restore_sources_to_enable_ : string_list option)
    ?cross_region_s3_restore_sources_to_disable:
      (cross_region_s3_restore_sources_to_disable_ : string_list option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     odb_network_id = odb_network_id_;
     display_name = display_name_;
     peered_cidrs_to_be_added = peered_cidrs_to_be_added_;
     peered_cidrs_to_be_removed = peered_cidrs_to_be_removed_;
     s3_access = s3_access_;
     zero_etl_access = zero_etl_access_;
     sts_access = sts_access_;
     kms_access = kms_access_;
     s3_policy_document = s3_policy_document_;
     sts_policy_document = sts_policy_document_;
     kms_policy_document = kms_policy_document_;
     cross_region_s3_restore_sources_to_enable = cross_region_s3_restore_sources_to_enable_;
     cross_region_s3_restore_sources_to_disable = cross_region_s3_restore_sources_to_disable_;
   }
    : update_odb_network_input)

let make_update_odb_peering_connection_output
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     display_name = display_name_;
     status = status_;
     status_reason = status_reason_;
     odb_peering_connection_id = odb_peering_connection_id_;
   }
    : update_odb_peering_connection_output)

let make_update_odb_peering_connection_input
    ?display_name:(display_name_ : resource_display_name option)
    ?peer_network_cidrs_to_be_added:(peer_network_cidrs_to_be_added_ : peered_cidr_list option)
    ?peer_network_cidrs_to_be_removed:(peer_network_cidrs_to_be_removed_ : peered_cidr_list option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     odb_peering_connection_id = odb_peering_connection_id_;
     display_name = display_name_;
     peer_network_cidrs_to_be_added = peer_network_cidrs_to_be_added_;
     peer_network_cidrs_to_be_removed = peer_network_cidrs_to_be_removed_;
   }
    : update_odb_peering_connection_input)
