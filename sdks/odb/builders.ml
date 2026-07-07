open Types

let make_zero_etl_access ?cidr:(cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : managed_resource_status option) () =
  ({ cidr = cidr_; status = status_ } : zero_etl_access)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_update_odb_peering_connection_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     odb_peering_connection_id = odb_peering_connection_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : update_odb_peering_connection_output)

let make_update_odb_peering_connection_input
    ?peer_network_cidrs_to_be_removed:(peer_network_cidrs_to_be_removed_ : peered_cidr_list option)
    ?peer_network_cidrs_to_be_added:(peer_network_cidrs_to_be_added_ : peered_cidr_list option)
    ?display_name:(display_name_ : resource_display_name option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     peer_network_cidrs_to_be_removed = peer_network_cidrs_to_be_removed_;
     peer_network_cidrs_to_be_added = peer_network_cidrs_to_be_added_;
     display_name = display_name_;
     odb_peering_connection_id = odb_peering_connection_id_;
   }
    : update_odb_peering_connection_input)

let make_update_odb_network_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     odb_network_id = odb_network_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : update_odb_network_output)

let make_update_odb_network_input
    ?cross_region_s3_restore_sources_to_disable:
      (cross_region_s3_restore_sources_to_disable_ : string_list option)
    ?cross_region_s3_restore_sources_to_enable:
      (cross_region_s3_restore_sources_to_enable_ : string_list option)
    ?kms_policy_document:(kms_policy_document_ : policy_document option)
    ?sts_policy_document:(sts_policy_document_ : policy_document option)
    ?s3_policy_document:(s3_policy_document_ : policy_document option)
    ?kms_access:(kms_access_ : access option) ?sts_access:(sts_access_ : access option)
    ?zero_etl_access:(zero_etl_access_ : access option) ?s3_access:(s3_access_ : access option)
    ?peered_cidrs_to_be_removed:(peered_cidrs_to_be_removed_ : string_list option)
    ?peered_cidrs_to_be_added:(peered_cidrs_to_be_added_ : string_list option)
    ?display_name:(display_name_ : resource_display_name option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     cross_region_s3_restore_sources_to_disable = cross_region_s3_restore_sources_to_disable_;
     cross_region_s3_restore_sources_to_enable = cross_region_s3_restore_sources_to_enable_;
     kms_policy_document = kms_policy_document_;
     sts_policy_document = sts_policy_document_;
     s3_policy_document = s3_policy_document_;
     kms_access = kms_access_;
     sts_access = sts_access_;
     zero_etl_access = zero_etl_access_;
     s3_access = s3_access_;
     peered_cidrs_to_be_removed = peered_cidrs_to_be_removed_;
     peered_cidrs_to_be_added = peered_cidrs_to_be_added_;
     display_name = display_name_;
     odb_network_id = odb_network_id_;
   }
    : update_odb_network_input)

let make_update_cloud_exadata_infrastructure_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : update_cloud_exadata_infrastructure_output)

let make_day_of_week ?name:(name_ : day_of_week_name option) () = ({ name = name_ } : day_of_week)
let make_month ?name:(name_ : month_name option) () = ({ name = name_ } : month)

let make_maintenance_window ?weeks_of_month:(weeks_of_month_ : weeks_of_month option)
    ?skip_ru:(skip_ru_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?preference:(preference_ : preference_type option)
    ?patching_mode:(patching_mode_ : patching_mode_type option) ?months:(months_ : months option)
    ?lead_time_in_weeks:(lead_time_in_weeks_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_custom_action_timeout_enabled:
      (is_custom_action_timeout_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?hours_of_day:(hours_of_day_ : hours_of_day option)
    ?days_of_week:(days_of_week_ : days_of_week option)
    ?custom_action_timeout_in_mins:
      (custom_action_timeout_in_mins_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     weeks_of_month = weeks_of_month_;
     skip_ru = skip_ru_;
     preference = preference_;
     patching_mode = patching_mode_;
     months = months_;
     lead_time_in_weeks = lead_time_in_weeks_;
     is_custom_action_timeout_enabled = is_custom_action_timeout_enabled_;
     hours_of_day = hours_of_day_;
     days_of_week = days_of_week_;
     custom_action_timeout_in_mins = custom_action_timeout_in_mins_;
   }
    : maintenance_window)

let make_update_cloud_exadata_infrastructure_input
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     maintenance_window = maintenance_window_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : update_cloud_exadata_infrastructure_input)

let make_update_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : update_autonomous_database_output)

let make_database_tool
    ?max_idle_time_in_minutes:
      (max_idle_time_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_enabled:(is_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     max_idle_time_in_minutes = max_idle_time_in_minutes_;
     compute_count = compute_count_;
     name = name_;
     is_enabled = is_enabled_;
   }
    : database_tool)

let make_customer_contact ?email:(email_ : sensitive_string option) () =
  ({ email = email_ } : customer_contact)

let make_scheduled_operation_details
    ?scheduled_stop_time:(scheduled_stop_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scheduled_start_time:(scheduled_start_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~day_of_week:(day_of_week_ : day_of_week) () =
  ({
     scheduled_stop_time = scheduled_stop_time_;
     scheduled_start_time = scheduled_start_time_;
     day_of_week = day_of_week_;
   }
    : scheduled_operation_details)

let make_long_term_backup_schedule
    ?time_of_backup:(time_of_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?repeat_cadence:(repeat_cadence_ : repeat_cadence option)
    ?is_disabled:(is_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     time_of_backup = time_of_backup_;
     retention_period_in_days = retention_period_in_days_;
     repeat_cadence = repeat_cadence_;
     is_disabled = is_disabled_;
   }
    : long_term_backup_schedule)

let make_resource_pool_summary
    ?available_compute_capacity:
      (available_compute_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?total_compute_capacity:(total_compute_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_storage_capacity_in_t_bs:
      (available_storage_capacity_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?pool_storage_size_in_t_bs:
      (pool_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?pool_size:(pool_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_disabled:(is_disabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     available_compute_capacity = available_compute_capacity_;
     total_compute_capacity = total_compute_capacity_;
     available_storage_capacity_in_t_bs = available_storage_capacity_in_t_bs_;
     pool_storage_size_in_t_bs = pool_storage_size_in_t_bs_;
     pool_size = pool_size_;
     is_disabled = is_disabled_;
   }
    : resource_pool_summary)

let make_aws_encryption_key_configuration_input ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option)
    ?external_id_type:(external_id_type_ : external_id_type option)
    ?iam_role_arn:(iam_role_arn_ : role_arn option) () =
  ({ kms_key_id = kms_key_id_; external_id_type = external_id_type_; iam_role_arn = iam_role_arn_ }
    : aws_encryption_key_configuration_input)

let make_update_autonomous_database_input
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration_input option)
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider_input option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : resource_id_or_arn option)
    ?peer_db_id:(peer_db_id_ : resource_id_or_arn option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?permission_level:(permission_level_ : permission_level option)
    ?open_mode:(open_mode_ : open_mode option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?byol_compute_count_limit:(byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.double option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_disconnect_peer:(is_disconnect_peer_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?license_model:(license_model_ : license_model option)
    ?database_edition:(database_edition_ : database_edition option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?db_workload:(db_workload_ : db_workload option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : resource_display_name option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?admin_password:(admin_password_ : sensitive_string option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     encryption_key_configuration = encryption_key_configuration_;
     encryption_key_provider = encryption_key_provider_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     allowlisted_ips = allowlisted_ips_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     resource_pool_summary = resource_pool_summary_;
     resource_pool_leader_id = resource_pool_leader_id_;
     peer_db_id = peer_db_id_;
     private_endpoint_label = private_endpoint_label_;
     private_endpoint_ip = private_endpoint_ip_;
     refreshable_mode = refreshable_mode_;
     permission_level = permission_level_;
     open_mode = open_mode_;
     long_term_backup_schedule = long_term_backup_schedule_;
     scheduled_operations = scheduled_operations_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     byol_compute_count_limit = byol_compute_count_limit_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     is_disconnect_peer = is_disconnect_peer_;
     is_refreshable_clone = is_refreshable_clone_;
     is_mtls_connection_required = is_mtls_connection_required_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_backup_retention_locked = is_backup_retention_locked_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     license_model = license_model_;
     database_edition = database_edition_;
     db_tools_details = db_tools_details_;
     db_workload = db_workload_;
     db_version = db_version_;
     db_name = db_name_;
     display_name = display_name_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     cpu_core_count = cpu_core_count_;
     compute_count = compute_count_;
     admin_password = admin_password_;
     autonomous_database_id = autonomous_database_id_;
   }
    : update_autonomous_database_input)

let make_update_autonomous_database_backup_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backup_id:
      (autonomous_database_backup_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : update_autonomous_database_backup_output)

let make_update_autonomous_database_backup_input
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({
     retention_period_in_days = retention_period_in_days_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : update_autonomous_database_backup_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_transportable_tablespace
    ?tts_bundle_url:(tts_bundle_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ tts_bundle_url = tts_bundle_url_ } : transportable_tablespace)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : request_tag_map)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_system_version_summary ?system_versions:(system_versions_ : string_list option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ system_versions = system_versions_; shape = shape_; gi_version = gi_version_ }
    : system_version_summary)

let make_switchover_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : switchover_autonomous_database_output)

let make_switchover_autonomous_database_input ?peer_db_arn:(peer_db_arn_ : resource_arn option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ peer_db_arn = peer_db_arn_; autonomous_database_id = autonomous_database_id_ }
    : switchover_autonomous_database_input)

let make_subscription_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ error_message = error_message_ } : subscription_error)

let make_sts_access
    ?sts_policy_document:(sts_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?status:(status_ : managed_resource_status option) () =
  ({
     sts_policy_document = sts_policy_document_;
     domain_name = domain_name_;
     ipv4_addresses = ipv4_addresses_;
     status = status_;
   }
    : sts_access)

let make_stop_db_node_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : db_node_resource_status option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ status_reason = status_reason_; status = status_; db_node_id = db_node_id_ }
    : stop_db_node_output)

let make_stop_db_node_input ~db_node_id:(db_node_id_ : resource_id)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ db_node_id = db_node_id_; cloud_vm_cluster_id = cloud_vm_cluster_id_ } : stop_db_node_input)

let make_stop_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : stop_autonomous_database_output)

let make_stop_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : stop_autonomous_database_input)

let make_start_db_node_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : db_node_resource_status option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ status_reason = status_reason_; status = status_; db_node_id = db_node_id_ }
    : start_db_node_output)

let make_start_db_node_input ~db_node_id:(db_node_id_ : resource_id)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ db_node_id = db_node_id_; cloud_vm_cluster_id = cloud_vm_cluster_id_ } : start_db_node_input)

let make_start_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : start_autonomous_database_output)

let make_start_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : start_autonomous_database_input)

let make_database_clone_configuration ~clone_type:(clone_type_ : clone_type)
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn) () =
  ({ clone_type = clone_type_; source_autonomous_database_id = source_autonomous_database_id_ }
    : database_clone_configuration)

let make_restore_from_backup_configuration
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ~clone_type:(clone_type_ : clone_type)
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id_or_arn) () =
  ({
     clone_table_space_list = clone_table_space_list_;
     clone_type = clone_type_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : restore_from_backup_configuration)

let make_point_in_time_restore_configuration
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ?use_latest_available_backup_timestamp:
      (use_latest_available_backup_timestamp_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~clone_type:(clone_type_ : clone_type)
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn) () =
  ({
     clone_table_space_list = clone_table_space_list_;
     use_latest_available_backup_timestamp = use_latest_available_backup_timestamp_;
     timestamp = timestamp_;
     clone_type = clone_type_;
     source_autonomous_database_id = source_autonomous_database_id_;
   }
    : point_in_time_restore_configuration)

let make_cross_region_data_guard_configuration
    ~source_autonomous_database_arn:(source_autonomous_database_arn_ : arn) () =
  ({ source_autonomous_database_arn = source_autonomous_database_arn_ }
    : cross_region_data_guard_configuration)

let make_cross_region_disaster_recovery_configuration
    ?is_replicate_automatic_backups:
      (is_replicate_automatic_backups_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~remote_disaster_recovery_type:(remote_disaster_recovery_type_ : disaster_recovery_type)
    ~source_autonomous_database_arn:(source_autonomous_database_arn_ : arn) () =
  ({
     is_replicate_automatic_backups = is_replicate_automatic_backups_;
     remote_disaster_recovery_type = remote_disaster_recovery_type_;
     source_autonomous_database_arn = source_autonomous_database_arn_;
   }
    : cross_region_disaster_recovery_configuration)

let make_clone_to_refreshable_configuration ?clone_type:(clone_type_ : clone_type option)
    ?open_mode:(open_mode_ : open_mode option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ~source_autonomous_database_id:(source_autonomous_database_id_ : resource_id_or_arn) () =
  ({
     clone_type = clone_type_;
     open_mode = open_mode_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     refreshable_mode = refreshable_mode_;
     source_autonomous_database_id = source_autonomous_database_id_;
   }
    : clone_to_refreshable_configuration)

let make_shrink_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : shrink_autonomous_database_output)

let make_shrink_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : shrink_autonomous_database_input)

let make_service_network_endpoint ?vpc_endpoint_type:(vpc_endpoint_type_ : vpc_endpoint_type option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ vpc_endpoint_type = vpc_endpoint_type_; vpc_endpoint_id = vpc_endpoint_id_ }
    : service_network_endpoint)

let make_s3_access
    ?s3_policy_document:(s3_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?status:(status_ : managed_resource_status option) () =
  ({
     s3_policy_document = s3_policy_document_;
     domain_name = domain_name_;
     ipv4_addresses = ipv4_addresses_;
     status = status_;
   }
    : s3_access)

let make_restore_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : restore_autonomous_database_output)

let make_restore_autonomous_database_input
    ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ timestamp = timestamp_; autonomous_database_id = autonomous_database_id_ }
    : restore_autonomous_database_input)

let make_reboot_db_node_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : db_node_resource_status option)
    ~db_node_id:(db_node_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ status_reason = status_reason_; status = status_; db_node_id = db_node_id_ }
    : reboot_db_node_output)

let make_reboot_db_node_input ~db_node_id:(db_node_id_ : resource_id)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ db_node_id = db_node_id_; cloud_vm_cluster_id = cloud_vm_cluster_id_ } : reboot_db_node_input)

let make_reboot_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : reboot_autonomous_database_output)

let make_reboot_autonomous_database_input
    ?is_online_reboot:(is_online_reboot_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ is_online_reboot = is_online_reboot_; autonomous_database_id = autonomous_database_id_ }
    : reboot_autonomous_database_input)

let make_okv_encryption_key_configuration
    ?certificate_id:(certificate_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~okv_uri:(okv_uri_ : Smaws_Lib.Smithy_api.Types.string_)
    ~okv_kms_key:(okv_kms_key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~directory_name:(directory_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~certificate_directory_name:(certificate_directory_name_ : Smaws_Lib.Smithy_api.Types.string_)
    () =
  ({
     okv_uri = okv_uri_;
     okv_kms_key = okv_kms_key_;
     directory_name = directory_name_;
     certificate_id = certificate_id_;
     certificate_directory_name = certificate_directory_name_;
   }
    : okv_encryption_key_configuration)

let make_odb_peering_connection_summary
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?peer_network_cidrs:(peer_network_cidrs_ : peered_cidr_list option)
    ?odb_peering_connection_type:
      (odb_peering_connection_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_arn:(peer_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_arn:
      (odb_peering_connection_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     percent_progress = percent_progress_;
     created_at = created_at_;
     peer_network_cidrs = peer_network_cidrs_;
     odb_peering_connection_type = odb_peering_connection_type_;
     peer_network_arn = peer_network_arn_;
     odb_network_arn = odb_network_arn_;
     odb_peering_connection_arn = odb_peering_connection_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     odb_peering_connection_id = odb_peering_connection_id_;
   }
    : odb_peering_connection_summary)

let make_odb_peering_connection
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?peer_network_cidrs:(peer_network_cidrs_ : peered_cidr_list option)
    ?odb_peering_connection_type:
      (odb_peering_connection_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peer_network_arn:(peer_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_peering_connection_arn:
      (odb_peering_connection_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({
     percent_progress = percent_progress_;
     created_at = created_at_;
     peer_network_cidrs = peer_network_cidrs_;
     odb_peering_connection_type = odb_peering_connection_type_;
     peer_network_arn = peer_network_arn_;
     odb_network_arn = odb_network_arn_;
     odb_peering_connection_arn = odb_peering_connection_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     odb_peering_connection_id = odb_peering_connection_id_;
   }
    : odb_peering_connection)

let make_oci_dns_forwarding_config
    ?oci_dns_listener_ip:(oci_dns_listener_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ oci_dns_listener_ip = oci_dns_listener_ip_; domain_name = domain_name_ }
    : oci_dns_forwarding_config)

let make_managed_s3_backup_access ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?status:(status_ : managed_resource_status option) () =
  ({ ipv4_addresses = ipv4_addresses_; status = status_ } : managed_s3_backup_access)

let make_kms_access
    ?kms_policy_document:(kms_policy_document_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain_name:(domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?status:(status_ : managed_resource_status option) () =
  ({
     kms_policy_document = kms_policy_document_;
     domain_name = domain_name_;
     ipv4_addresses = ipv4_addresses_;
     status = status_;
   }
    : kms_access)

let make_cross_region_s3_restore_sources_access ?status:(status_ : managed_resource_status option)
    ?ipv4_addresses:(ipv4_addresses_ : string_list option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ status = status_; ipv4_addresses = ipv4_addresses_; region = region_ }
    : cross_region_s3_restore_sources_access)

let make_managed_services
    ?cross_region_s3_restore_sources_access:
      (cross_region_s3_restore_sources_access_ : cross_region_s3_restore_sources_access_list option)
    ?kms_access:(kms_access_ : kms_access option) ?sts_access:(sts_access_ : sts_access option)
    ?s3_access:(s3_access_ : s3_access option)
    ?zero_etl_access:(zero_etl_access_ : zero_etl_access option)
    ?managed_s3_backup_access:(managed_s3_backup_access_ : managed_s3_backup_access option)
    ?service_network_endpoint:(service_network_endpoint_ : service_network_endpoint option)
    ?managed_services_ipv4_cidrs:(managed_services_ipv4_cidrs_ : string_list option)
    ?resource_gateway_arn:(resource_gateway_arn_ : resource_arn option)
    ?service_network_arn:(service_network_arn_ : resource_arn option) () =
  ({
     cross_region_s3_restore_sources_access = cross_region_s3_restore_sources_access_;
     kms_access = kms_access_;
     sts_access = sts_access_;
     s3_access = s3_access_;
     zero_etl_access = zero_etl_access_;
     managed_s3_backup_access = managed_s3_backup_access_;
     service_network_endpoint = service_network_endpoint_;
     managed_services_ipv4_cidrs = managed_services_ipv4_cidrs_;
     resource_gateway_arn = resource_gateway_arn_;
     service_network_arn = service_network_arn_;
   }
    : managed_services)

let make_odb_network_summary
    ?ec2_placement_group_ids:(ec2_placement_group_ids_ : resource_id_list option)
    ?managed_services:(managed_services_ : managed_services option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?oci_dns_forwarding_configs:
      (oci_dns_forwarding_configs_ : oci_dns_forwarding_config_list option)
    ?oci_vcn_url:(oci_vcn_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_id:(oci_vcn_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_url:(oci_network_anchor_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_id:(oci_network_anchor_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peered_cidrs:(peered_cidrs_ : string_list option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     ec2_placement_group_ids = ec2_placement_group_ids_;
     managed_services = managed_services_;
     percent_progress = percent_progress_;
     created_at = created_at_;
     oci_dns_forwarding_configs = oci_dns_forwarding_configs_;
     oci_vcn_url = oci_vcn_url_;
     oci_vcn_id = oci_vcn_id_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_network_anchor_url = oci_network_anchor_url_;
     oci_network_anchor_id = oci_network_anchor_id_;
     peered_cidrs = peered_cidrs_;
     default_dns_prefix = default_dns_prefix_;
     custom_domain_name = custom_domain_name_;
     backup_subnet_cidr = backup_subnet_cidr_;
     client_subnet_cidr = client_subnet_cidr_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     odb_network_arn = odb_network_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     odb_network_id = odb_network_id_;
   }
    : odb_network_summary)

let make_odb_network ?ec2_placement_group_ids:(ec2_placement_group_ids_ : resource_id_list option)
    ?managed_services:(managed_services_ : managed_services option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?oci_dns_forwarding_configs:
      (oci_dns_forwarding_configs_ : oci_dns_forwarding_config_list option)
    ?oci_vcn_url:(oci_vcn_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_vcn_id:(oci_vcn_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_url:(oci_network_anchor_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_network_anchor_id:(oci_network_anchor_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?peered_cidrs:(peered_cidrs_ : string_list option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     ec2_placement_group_ids = ec2_placement_group_ids_;
     managed_services = managed_services_;
     percent_progress = percent_progress_;
     created_at = created_at_;
     oci_dns_forwarding_configs = oci_dns_forwarding_configs_;
     oci_vcn_url = oci_vcn_url_;
     oci_vcn_id = oci_vcn_id_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     oci_network_anchor_url = oci_network_anchor_url_;
     oci_network_anchor_id = oci_network_anchor_id_;
     peered_cidrs = peered_cidrs_;
     default_dns_prefix = default_dns_prefix_;
     custom_domain_name = custom_domain_name_;
     backup_subnet_cidr = backup_subnet_cidr_;
     client_subnet_cidr = client_subnet_cidr_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     odb_network_arn = odb_network_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     odb_network_id = odb_network_id_;
   }
    : odb_network)

let make_list_tags_for_resource_response ?tags:(tags_ : response_tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_system_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~system_versions:(system_versions_ : system_version_list) () =
  ({ system_versions = system_versions_; next_token = next_token_ } : list_system_versions_output)

let make_list_system_versions_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_)
    ~gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     shape = shape_;
     gi_version = gi_version_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_system_versions_input)

let make_gi_version_summary ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ version = version_ } : gi_version_summary)

let make_list_gi_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~gi_versions:(gi_versions_ : gi_version_list) () =
  ({ gi_versions = gi_versions_; next_token = next_token_ } : list_gi_versions_output)

let make_list_gi_versions_input ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ shape = shape_; next_token = next_token_; max_results = max_results_ }
    : list_gi_versions_input)

let make_db_system_shape_summary
    ?are_server_types_supported:
      (are_server_types_supported_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?compute_model:(compute_model_ : compute_model option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?shape_type:(shape_type_ : shape_type option)
    ?shape_family:(shape_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?runtime_minimum_core_count:
      (runtime_minimum_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?minimum_node_count:(minimum_node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?minimum_core_count:(minimum_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_storage_count:(min_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_memory_per_node_in_g_bs:
      (min_memory_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_db_node_storage_per_node_in_g_bs:
      (min_db_node_storage_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_data_storage_in_t_bs:
      (min_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_core_count_per_node:(min_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maximum_node_count:(maximum_node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_storage_count:(max_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?core_count_increment:(core_count_increment_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_memory_per_node_in_g_bs:
      (available_memory_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_memory_in_g_bs:
      (available_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_db_node_storage_in_g_bs:
      (available_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_db_node_per_node_in_g_bs:
      (available_db_node_per_node_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_data_storage_per_server_in_t_bs:
      (available_data_storage_per_server_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_data_storage_in_t_bs:
      (available_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_core_count_per_node:
      (available_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_core_count:(available_core_count_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     are_server_types_supported = are_server_types_supported_;
     compute_model = compute_model_;
     name = name_;
     shape_type = shape_type_;
     shape_family = shape_family_;
     runtime_minimum_core_count = runtime_minimum_core_count_;
     minimum_node_count = minimum_node_count_;
     minimum_core_count = minimum_core_count_;
     min_storage_count = min_storage_count_;
     min_memory_per_node_in_g_bs = min_memory_per_node_in_g_bs_;
     min_db_node_storage_per_node_in_g_bs = min_db_node_storage_per_node_in_g_bs_;
     min_data_storage_in_t_bs = min_data_storage_in_t_bs_;
     min_core_count_per_node = min_core_count_per_node_;
     maximum_node_count = maximum_node_count_;
     max_storage_count = max_storage_count_;
     core_count_increment = core_count_increment_;
     available_memory_per_node_in_g_bs = available_memory_per_node_in_g_bs_;
     available_memory_in_g_bs = available_memory_in_g_bs_;
     available_db_node_storage_in_g_bs = available_db_node_storage_in_g_bs_;
     available_db_node_per_node_in_g_bs = available_db_node_per_node_in_g_bs_;
     available_data_storage_per_server_in_t_bs = available_data_storage_per_server_in_t_bs_;
     available_data_storage_in_t_bs = available_data_storage_in_t_bs_;
     available_core_count_per_node = available_core_count_per_node_;
     available_core_count = available_core_count_;
   }
    : db_system_shape_summary)

let make_list_db_system_shapes_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_system_shapes:(db_system_shapes_ : db_system_shape_list) () =
  ({ db_system_shapes = db_system_shapes_; next_token = next_token_ }
    : list_db_system_shapes_output)

let make_list_db_system_shapes_input
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_db_system_shapes_input)

let make_autonomous_database_version_summary
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?details:(details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option) () =
  ({ version = version_; details = details_; db_workload = db_workload_ }
    : autonomous_database_version_summary)

let make_list_autonomous_database_versions_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_versions:(autonomous_database_versions_ : autonomous_database_version_list)
    () =
  ({ autonomous_database_versions = autonomous_database_versions_; next_token = next_token_ }
    : list_autonomous_database_versions_output)

let make_list_autonomous_database_versions_input ?db_workload:(db_workload_ : db_workload option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ db_workload = db_workload_; next_token = next_token_; max_results = max_results_ }
    : list_autonomous_database_versions_input)

let make_autonomous_database_character_set_summary
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ character_set = character_set_ } : autonomous_database_character_set_summary)

let make_list_autonomous_database_character_sets_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_character_sets:
      (autonomous_database_character_sets_ : autonomous_database_character_set_list) () =
  ({
     autonomous_database_character_sets = autonomous_database_character_sets_;
     next_token = next_token_;
   }
    : list_autonomous_database_character_sets_output)

let make_list_autonomous_database_character_sets_input
    ?character_set_type:(character_set_type_ : character_set_type option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     character_set_type = character_set_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_autonomous_database_character_sets_input)

let make_initialize_service_output () = (() : unit)

let make_initialize_service_input
    ?oci_identity_domain:(oci_identity_domain_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ oci_identity_domain = oci_identity_domain_ } : initialize_service_input)

let make_oci_identity_domain
    ?account_setup_cloud_formation_url:
      (account_setup_cloud_formation_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?oci_identity_domain_url:(oci_identity_domain_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_identity_domain_resource_url:
      (oci_identity_domain_resource_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_identity_domain_id:(oci_identity_domain_id_ : Smaws_Lib.Smithy_api.Types.string_ option) ()
    =
  ({
     account_setup_cloud_formation_url = account_setup_cloud_formation_url_;
     status_reason = status_reason_;
     status = status_;
     oci_identity_domain_url = oci_identity_domain_url_;
     oci_identity_domain_resource_url = oci_identity_domain_resource_url_;
     oci_identity_domain_id = oci_identity_domain_id_;
   }
    : oci_identity_domain)

let make_oci_iam_role ?aws_integration:(aws_integration_ : oci_aws_integration option)
    ?iam_role_arn:(iam_role_arn_ : role_arn option) () =
  ({ aws_integration = aws_integration_; iam_role_arn = iam_role_arn_ } : oci_iam_role)

let make_get_oci_onboarding_status_output
    ?subscription_errors:(subscription_errors_ : subscription_errors option)
    ?linked_oci_compartment_id:
      (linked_oci_compartment_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?linked_oci_tenancy_id:(linked_oci_tenancy_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_oci_integration_iam_roles:
      (autonomous_database_oci_integration_iam_roles_ : oci_iam_role_list option)
    ?oci_identity_domain:(oci_identity_domain_ : oci_identity_domain option)
    ?new_tenancy_activation_link:
      (new_tenancy_activation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?existing_tenancy_activation_link:
      (existing_tenancy_activation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : oci_onboarding_status option) () =
  ({
     subscription_errors = subscription_errors_;
     linked_oci_compartment_id = linked_oci_compartment_id_;
     linked_oci_tenancy_id = linked_oci_tenancy_id_;
     autonomous_database_oci_integration_iam_roles = autonomous_database_oci_integration_iam_roles_;
     oci_identity_domain = oci_identity_domain_;
     new_tenancy_activation_link = new_tenancy_activation_link_;
     existing_tenancy_activation_link = existing_tenancy_activation_link_;
     status = status_;
   }
    : get_oci_onboarding_status_output)

let make_get_oci_onboarding_status_input () = (() : unit)
let make_disassociate_iam_role_from_resource_output () = (() : unit)

let make_disassociate_iam_role_from_resource_input ~resource_arn:(resource_arn_ : arn)
    ~aws_integration:(aws_integration_ : supported_aws_integration)
    ~iam_role_arn:(iam_role_arn_ : role_arn) () =
  ({
     resource_arn = resource_arn_;
     aws_integration = aws_integration_;
     iam_role_arn = iam_role_arn_;
   }
    : disassociate_iam_role_from_resource_input)

let make_associate_iam_role_to_resource_output () = (() : unit)

let make_associate_iam_role_to_resource_input ~resource_arn:(resource_arn_ : arn)
    ~aws_integration:(aws_integration_ : supported_aws_integration)
    ~iam_role_arn:(iam_role_arn_ : role_arn) () =
  ({
     resource_arn = resource_arn_;
     aws_integration = aws_integration_;
     iam_role_arn = iam_role_arn_;
   }
    : associate_iam_role_to_resource_input)

let make_accept_marketplace_registration_output () = (() : unit)

let make_accept_marketplace_registration_input
    ~marketplace_registration_token:
      (marketplace_registration_token_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ marketplace_registration_token = marketplace_registration_token_ }
    : accept_marketplace_registration_input)

let make_oci_encryption_key_configuration ~vault_id:(vault_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ vault_id = vault_id_; kms_key_id = kms_key_id_ } : oci_encryption_key_configuration)

let make_list_odb_peering_connections_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connections:(odb_peering_connections_ : odb_peering_connection_list) () =
  ({ odb_peering_connections = odb_peering_connections_; next_token = next_token_ }
    : list_odb_peering_connections_output)

let make_list_odb_peering_connections_input
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ odb_network_id = odb_network_id_; next_token = next_token_; max_results = max_results_ }
    : list_odb_peering_connections_input)

let make_list_odb_networks_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_networks:(odb_networks_ : odb_network_list) () =
  ({ odb_networks = odb_networks_; next_token = next_token_ } : list_odb_networks_output)

let make_list_odb_networks_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_odb_networks_input)

let make_db_server_patching_details
    ?time_patching_started:(time_patching_started_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_patching_ended:(time_patching_ended_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?patching_status:(patching_status_ : db_server_patching_status option)
    ?estimated_patch_duration:
      (estimated_patch_duration_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     time_patching_started = time_patching_started_;
     time_patching_ended = time_patching_ended_;
     patching_status = patching_status_;
     estimated_patch_duration = estimated_patch_duration_;
   }
    : db_server_patching_details)

let make_db_server_summary
    ?autonomous_virtual_machine_ids:(autonomous_virtual_machine_ids_ : string_list option)
    ?autonomous_vm_cluster_ids:(autonomous_vm_cluster_ids_ : string_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?vm_cluster_ids:(vm_cluster_ids_ : string_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_in_g_bs:
      (max_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_infrastructure_id:
      (exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_patching_details:(db_server_patching_details_ : db_server_patching_details option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option) ?db_server_id:(db_server_id_ : resource_id option) ()
    =
  ({
     autonomous_virtual_machine_ids = autonomous_virtual_machine_ids_;
     autonomous_vm_cluster_ids = autonomous_vm_cluster_ids_;
     compute_model = compute_model_;
     vm_cluster_ids = vm_cluster_ids_;
     created_at = created_at_;
     shape = shape_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     max_db_node_storage_in_g_bs = max_db_node_storage_in_g_bs_;
     max_cpu_count = max_cpu_count_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     exadata_infrastructure_id = exadata_infrastructure_id_;
     display_name = display_name_;
     db_server_patching_details = db_server_patching_details_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     status_reason = status_reason_;
     status = status_;
     db_server_id = db_server_id_;
   }
    : db_server_summary)

let make_list_db_servers_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_servers:(db_servers_ : db_server_list) () =
  ({ db_servers = db_servers_; next_token = next_token_ } : list_db_servers_output)

let make_list_db_servers_input ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : list_db_servers_input)

let make_db_node_summary ?vnic_id:(vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vnic2_id:(vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_cpu_core_count:(total_cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_maintenance_window_start:
      (time_maintenance_window_start_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_maintenance_window_end:
      (time_maintenance_window_end_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?software_storage_size_in_g_b:
      (software_storage_size_in_g_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_type:(maintenance_type_ : db_node_maintenance_type option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?host_ip_id:(host_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?fault_domain:(fault_domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_system_id:(db_system_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?backup_vnic_id:(backup_vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic2_id:(backup_vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_ip_id:(backup_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_details:(additional_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : db_node_resource_status option)
    ?db_node_arn:(db_node_arn_ : resource_arn option) ?db_node_id:(db_node_id_ : resource_id option)
    () =
  ({
     vnic_id = vnic_id_;
     vnic2_id = vnic2_id_;
     total_cpu_core_count = total_cpu_core_count_;
     time_maintenance_window_start = time_maintenance_window_start_;
     time_maintenance_window_end = time_maintenance_window_end_;
     created_at = created_at_;
     software_storage_size_in_g_b = software_storage_size_in_g_b_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     maintenance_type = maintenance_type_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     hostname = hostname_;
     host_ip_id = host_ip_id_;
     fault_domain = fault_domain_;
     db_system_id = db_system_id_;
     db_server_id = db_server_id_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     backup_vnic_id = backup_vnic_id_;
     backup_vnic2_id = backup_vnic2_id_;
     backup_ip_id = backup_ip_id_;
     additional_details = additional_details_;
     status_reason = status_reason_;
     status = status_;
     db_node_arn = db_node_arn_;
     db_node_id = db_node_id_;
   }
    : db_node_summary)

let make_list_db_nodes_output ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_nodes:(db_nodes_ : db_node_list) () =
  ({ db_nodes = db_nodes_; next_token = next_token_ } : list_db_nodes_output)

let make_list_db_nodes_input ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_db_nodes_input)

let make_data_collection_options
    ?is_incident_logs_enabled:
      (is_incident_logs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_health_monitoring_enabled:
      (is_health_monitoring_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_diagnostics_events_enabled:
      (is_diagnostics_events_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     is_incident_logs_enabled = is_incident_logs_enabled_;
     is_health_monitoring_enabled = is_health_monitoring_enabled_;
     is_diagnostics_events_enabled = is_diagnostics_events_enabled_;
   }
    : data_collection_options)

let make_db_iorm_config ?share:(share_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?flash_cache_limit:(flash_cache_limit_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ share = share_; flash_cache_limit = flash_cache_limit_; db_name = db_name_ } : db_iorm_config)

let make_exadata_iorm_config ?objective:(objective_ : objective option)
    ?lifecycle_state:(lifecycle_state_ : iorm_lifecycle_state option)
    ?lifecycle_details:(lifecycle_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_plans:(db_plans_ : db_iorm_config_list option) () =
  ({
     objective = objective_;
     lifecycle_state = lifecycle_state_;
     lifecycle_details = lifecycle_details_;
     db_plans = db_plans_;
   }
    : exadata_iorm_config)

let make_iam_role ?aws_integration:(aws_integration_ : supported_aws_integration option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : iam_role_status option) ?iam_role_arn:(iam_role_arn_ : role_arn option) () =
  ({
     aws_integration = aws_integration_;
     status_reason = status_reason_;
     status = status_;
     iam_role_arn = iam_role_arn_;
   }
    : iam_role)

let make_cloud_vm_cluster_summary ?iam_roles:(iam_roles_ : iam_role_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?vip_ids:(vip_ids_ : string_list option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_size_in_g_bs:(storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ssh_public_keys:(ssh_public_keys_ : sensitive_string_list option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_ip_ids:(scan_ip_ids_ : string_list option)
    ?scan_dns_record_id:(scan_dns_record_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_name:(scan_dns_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?listener_port:(listener_port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?license_model:(license_model_ : license_model option)
    ?last_update_history_entry_id:
      (last_update_history_entry_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?iorm_config_cache:(iorm_config_cache_ : exadata_iorm_config option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?disk_redundancy:(disk_redundancy_ : disk_redundancy option)
    ?db_servers:(db_servers_ : string_list option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cluster_name:(cluster_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_vm_cluster_arn:(cloud_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     iam_roles = iam_roles_;
     compute_model = compute_model_;
     percent_progress = percent_progress_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     vip_ids = vip_ids_;
     time_zone = time_zone_;
     created_at = created_at_;
     system_version = system_version_;
     storage_size_in_g_bs = storage_size_in_g_bs_;
     ssh_public_keys = ssh_public_keys_;
     shape = shape_;
     scan_ip_ids = scan_ip_ids_;
     scan_dns_record_id = scan_dns_record_id_;
     scan_dns_name = scan_dns_name_;
     domain = domain_;
     oci_url = oci_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     node_count = node_count_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     listener_port = listener_port_;
     license_model = license_model_;
     last_update_history_entry_id = last_update_history_entry_id_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     is_local_backup_enabled = is_local_backup_enabled_;
     iorm_config_cache = iorm_config_cache_;
     hostname = hostname_;
     gi_version = gi_version_;
     disk_redundancy = disk_redundancy_;
     db_servers = db_servers_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_collection_options = data_collection_options_;
     cpu_core_count = cpu_core_count_;
     cluster_name = cluster_name_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_vm_cluster_arn = cloud_vm_cluster_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
   }
    : cloud_vm_cluster_summary)

let make_list_cloud_vm_clusters_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_clusters:(cloud_vm_clusters_ : cloud_vm_cluster_list) () =
  ({ cloud_vm_clusters = cloud_vm_clusters_; next_token = next_token_ }
    : list_cloud_vm_clusters_output)

let make_list_cloud_vm_clusters_input
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_cloud_vm_clusters_input)

let make_cloud_exadata_infrastructure_summary ?compute_model:(compute_model_ : compute_model option)
    ?storage_server_type:(storage_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_server_type:(database_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?total_storage_size_in_g_bs:
      (total_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?storage_server_version:(storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_maintenance_run_id:(next_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_storage_server_version:
      (monthly_storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_db_server_version:
      (monthly_db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_size_in_g_bs:
      (max_db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_data_storage_in_t_bs:(max_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?last_maintenance_run_id:(last_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_version:(db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?cpu_count:(cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?available_storage_size_in_g_bs:
      (available_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?additional_storage_count:
      (additional_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?activated_storage_count:(activated_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cloud_exadata_infrastructure_arn:
      (cloud_exadata_infrastructure_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     compute_model = compute_model_;
     storage_server_type = storage_server_type_;
     database_server_type = database_server_type_;
     percent_progress = percent_progress_;
     total_storage_size_in_g_bs = total_storage_size_in_g_bs_;
     created_at = created_at_;
     storage_server_version = storage_server_version_;
     storage_count = storage_count_;
     shape = shape_;
     ocid = ocid_;
     oci_url = oci_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     next_maintenance_run_id = next_maintenance_run_id_;
     monthly_storage_server_version = monthly_storage_server_version_;
     monthly_db_server_version = monthly_db_server_version_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     max_db_node_storage_size_in_g_bs = max_db_node_storage_size_in_g_bs_;
     max_data_storage_in_t_bs = max_data_storage_in_t_bs_;
     max_cpu_count = max_cpu_count_;
     maintenance_window = maintenance_window_;
     last_maintenance_run_id = last_maintenance_run_id_;
     db_server_version = db_server_version_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     cpu_count = cpu_count_;
     compute_count = compute_count_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     available_storage_size_in_g_bs = available_storage_size_in_g_bs_;
     additional_storage_count = additional_storage_count_;
     activated_storage_count = activated_storage_count_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : cloud_exadata_infrastructure_summary)

let make_list_cloud_exadata_infrastructures_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructures:
      (cloud_exadata_infrastructures_ : cloud_exadata_infrastructure_list) () =
  ({ cloud_exadata_infrastructures = cloud_exadata_infrastructures_; next_token = next_token_ }
    : list_cloud_exadata_infrastructures_output)

let make_list_cloud_exadata_infrastructures_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_cloud_exadata_infrastructures_input)

let make_cloud_autonomous_vm_cluster_summary ?iam_roles:(iam_roles_ : iam_role_list option)
    ?total_container_databases:
      (total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_ords_certificate_expires:
      (time_ords_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_database_ssl_certificate_expires:
      (time_database_ssl_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?reserved_cpus:(reserved_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reclaimable_cpus:(reclaimable_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?provisioned_cpus:(provisioned_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?provisioned_autonomous_container_databases:
      (provisioned_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_autonomous_container_databases:
      (provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?non_provisionable_autonomous_container_databases:
      (non_provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_acds_lowest_scaled_value:
      (max_acds_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?license_model:(license_model_ : license_model option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_storage_in_t_bs_lowest_scaled_value:
      (exadata_storage_in_t_bs_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.double option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_servers:(db_servers_ : string_list option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cpu_percentage:(cpu_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_model:(compute_model_ : compute_model option)
    ?available_cpus:(available_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?available_container_databases:
      (available_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_autonomous_data_storage_size_in_t_bs:
      (available_autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?autonomous_data_storage_percentage:
      (autonomous_data_storage_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : resource_display_name option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?cloud_autonomous_vm_cluster_arn:
      (cloud_autonomous_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     iam_roles = iam_roles_;
     total_container_databases = total_container_databases_;
     time_zone = time_zone_;
     time_ords_certificate_expires = time_ords_certificate_expires_;
     time_database_ssl_certificate_expires = time_database_ssl_certificate_expires_;
     created_at = created_at_;
     shape = shape_;
     scan_listener_port_tls = scan_listener_port_tls_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     reserved_cpus = reserved_cpus_;
     reclaimable_cpus = reclaimable_cpus_;
     provisioned_cpus = provisioned_cpus_;
     provisioned_autonomous_container_databases = provisioned_autonomous_container_databases_;
     provisionable_autonomous_container_databases = provisionable_autonomous_container_databases_;
     non_provisionable_autonomous_container_databases =
       non_provisionable_autonomous_container_databases_;
     node_count = node_count_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     max_acds_lowest_scaled_value = max_acds_lowest_scaled_value_;
     maintenance_window = maintenance_window_;
     license_model = license_model_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     oci_url = oci_url_;
     ocid = ocid_;
     hostname = hostname_;
     exadata_storage_in_t_bs_lowest_scaled_value = exadata_storage_in_t_bs_lowest_scaled_value_;
     domain = domain_;
     description = description_;
     db_servers = db_servers_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     cpu_percentage = cpu_percentage_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     cpu_core_count = cpu_core_count_;
     compute_model = compute_model_;
     available_cpus = available_cpus_;
     available_container_databases = available_container_databases_;
     available_autonomous_data_storage_size_in_t_bs =
       available_autonomous_data_storage_size_in_t_bs_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     autonomous_data_storage_percentage = autonomous_data_storage_percentage_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     percent_progress = percent_progress_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     cloud_autonomous_vm_cluster_arn = cloud_autonomous_vm_cluster_arn_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
   }
    : cloud_autonomous_vm_cluster_summary)

let make_list_cloud_autonomous_vm_clusters_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_clusters:(cloud_autonomous_vm_clusters_ : cloud_autonomous_vm_cluster_list)
    () =
  ({ cloud_autonomous_vm_clusters = cloud_autonomous_vm_clusters_; next_token = next_token_ }
    : list_cloud_autonomous_vm_clusters_output)

let make_list_cloud_autonomous_vm_clusters_input
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_cloud_autonomous_vm_clusters_input)

let make_autonomous_virtual_machine_summary
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_autonomous_vm_cluster_id:
      (cloud_autonomous_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?client_ip_address:(client_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_server_display_name:(db_server_display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?vm_name:(vm_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?autonomous_virtual_machine_id:(autonomous_virtual_machine_id_ : resource_id option) () =
  ({
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     client_ip_address = client_ip_address_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     db_server_display_name = db_server_display_name_;
     db_server_id = db_server_id_;
     vm_name = vm_name_;
     status_reason = status_reason_;
     status = status_;
     autonomous_virtual_machine_id = autonomous_virtual_machine_id_;
   }
    : autonomous_virtual_machine_summary)

let make_list_autonomous_virtual_machines_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_virtual_machines:(autonomous_virtual_machines_ : autonomous_virtual_machine_list) ()
    =
  ({ autonomous_virtual_machines = autonomous_virtual_machines_; next_token = next_token_ }
    : list_autonomous_virtual_machines_output)

let make_list_autonomous_virtual_machines_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_autonomous_virtual_machines_input)

let make_database_connection_string_profile
    ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tls_authentication:(tls_authentication_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?syntax_format:(syntax_format_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?session_mode:(session_mode_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?protocol:(protocol_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_regional:(is_regional_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?host_format:(host_format_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?consumer_group:(consumer_group_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     value = value_;
     tls_authentication = tls_authentication_;
     syntax_format = syntax_format_;
     session_mode = session_mode_;
     protocol = protocol_;
     is_regional = is_regional_;
     host_format = host_format_;
     display_name = display_name_;
     consumer_group = consumer_group_;
   }
    : database_connection_string_profile)

let make_autonomous_database_connection_strings
    ?profiles:(profiles_ : database_connection_string_profile_list option)
    ?low:(low_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?medium:(medium_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?high:(high_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?dedicated:(dedicated_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?all_connection_strings:(all_connection_strings_ : database_connection_string_map option) () =
  ({
     profiles = profiles_;
     low = low_;
     medium = medium_;
     high = high_;
     dedicated = dedicated_;
     all_connection_strings = all_connection_strings_;
   }
    : autonomous_database_connection_strings)

let make_autonomous_database_apex
    ?ords_version:(ords_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?apex_version:(apex_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ ords_version = ords_version_; apex_version = apex_version_ } : autonomous_database_apex)

let make_database_standby_summary
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?lag_time_in_seconds:(lag_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?availability_domain:(availability_domain_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     time_maintenance_end = time_maintenance_end_;
     time_maintenance_begin = time_maintenance_begin_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     maintenance_target_component = maintenance_target_component_;
     status_reason = status_reason_;
     status = status_;
     lag_time_in_seconds = lag_time_in_seconds_;
     availability_domain = availability_domain_;
   }
    : database_standby_summary)

let make_autonomous_database_connection_urls
    ?sql_dev_web_url:(sql_dev_web_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?spatial_studio_url:(spatial_studio_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ords_url:(ords_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?mongo_db_url:(mongo_db_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?machine_learning_user_management_url:
      (machine_learning_user_management_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?machine_learning_notebook_url:
      (machine_learning_notebook_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?graph_studio_url:(graph_studio_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_transforms_url:(database_transforms_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?apex_url:(apex_url_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     sql_dev_web_url = sql_dev_web_url_;
     spatial_studio_url = spatial_studio_url_;
     ords_url = ords_url_;
     mongo_db_url = mongo_db_url_;
     machine_learning_user_management_url = machine_learning_user_management_url_;
     machine_learning_notebook_url = machine_learning_notebook_url_;
     graph_studio_url = graph_studio_url_;
     database_transforms_url = database_transforms_url_;
     apex_url = apex_url_;
   }
    : autonomous_database_connection_urls)

let make_disaster_recovery_configuration
    ?time_snapshot_standby_enabled_till:
      (time_snapshot_standby_enabled_till_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?is_snapshot_standby:(is_snapshot_standby_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_replicate_automatic_backups:
      (is_replicate_automatic_backups_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?disaster_recovery_type:(disaster_recovery_type_ : disaster_recovery_type option) () =
  ({
     time_snapshot_standby_enabled_till = time_snapshot_standby_enabled_till_;
     is_snapshot_standby = is_snapshot_standby_;
     is_replicate_automatic_backups = is_replicate_automatic_backups_;
     disaster_recovery_type = disaster_recovery_type_;
   }
    : disaster_recovery_configuration)

let make_aws_encryption_key_configuration ?kms_key_id:(kms_key_id_ : kms_key_id_or_arn option)
    ?external_id_type:(external_id_type_ : external_id_type option)
    ?iam_role_arn:(iam_role_arn_ : role_arn option) () =
  ({ kms_key_id = kms_key_id_; external_id_type = external_id_type_; iam_role_arn = iam_role_arn_ }
    : aws_encryption_key_configuration)

let make_encryption_summary
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration option)
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider option) () =
  ({
     encryption_key_configuration = encryption_key_configuration_;
     encryption_key_provider = encryption_key_provider_;
   }
    : encryption_summary)

let make_autonomous_database_summary
    ?time_undeleted:(time_undeleted_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_long_term_backup_time_stamp:
      (next_long_term_backup_time_stamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_until_reconnect_clone_enabled:
      (time_until_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_reclamation_of_free_autonomous_database:
      (time_reclamation_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_deletion_of_free_autonomous_database:
      (time_deletion_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_next_refresh:(time_of_next_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh_point:
      (time_of_last_refresh_point_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh:(time_of_last_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_failover:(time_of_last_failover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_switchover:
      (time_of_last_switchover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_local_data_guard_enabled:
      (time_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_backup:(time_of_last_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?encryption_summary:(encryption_summary_ : encryption_summary option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?total_backup_storage_size_in_g_bs:
      (total_backup_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ?is_reconnect_clone_enabled:
      (is_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?refreshable_status:(refreshable_status_ : refreshable_status option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?remote_disaster_recovery_configuration:
      (remote_disaster_recovery_configuration_ : disaster_recovery_configuration option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?failed_data_recovery_in_seconds:
      (failed_data_recovery_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?peer_db_ids:(peer_db_ids_ : string_list option) ?role:(role_ : data_guard_role option)
    ?local_disaster_recovery_type:(local_disaster_recovery_type_ : disaster_recovery_type option)
    ?is_remote_data_guard_enabled:
      (is_remote_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint:(private_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?in_memory_area_in_g_bs:(in_memory_area_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?allocated_storage_size_in_t_bs:
      (allocated_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?actual_used_data_storage_size_in_t_bs:
      (actual_used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?used_data_storage_size_in_g_bs:
      (used_data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?used_data_storage_size_in_t_bs:
      (used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?provisionable_cpus:(provisionable_cpus_ : integer_list option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_model:(compute_model_ : compute_model option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?connection_urls:(connection_urls_ : autonomous_database_connection_urls option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?operations_insights_status:(operations_insights_status_ : operations_insights_status option)
    ?database_management_status:(database_management_status_ : database_management_status option)
    ?data_safe_status:(data_safe_status_ : data_safe_status option)
    ?local_standby_db:(local_standby_db_ : database_standby_summary option)
    ?standby_db:(standby_db_ : database_standby_summary option)
    ?apex_details:(apex_details_ : autonomous_database_apex option)
    ?customer_contacts:(customer_contacts_ : customer_contacts option)
    ?sql_web_developer_url:(sql_web_developer_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service_console_url:(service_console_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?connection_string_details:
      (connection_string_details_ : autonomous_database_connection_strings option)
    ?byol_compute_count_limit:
      (byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_upgrade_versions:(available_upgrade_versions_ : string_list option)
    ?net_services_architecture:(net_services_architecture_ : net_services_architecture option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?permission_level:(permission_level_ : permission_level option)
    ?open_mode:(open_mode_ : open_mode option)
    ?license_model:(license_model_ : license_model option)
    ?database_edition:(database_edition_ : database_edition option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_type:(database_type_ : database_type option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?source_id:(source_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn option) () =
  ({
     time_undeleted = time_undeleted_;
     next_long_term_backup_time_stamp = next_long_term_backup_time_stamp_;
     time_until_reconnect_clone_enabled = time_until_reconnect_clone_enabled_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_reclamation_of_free_autonomous_database = time_reclamation_of_free_autonomous_database_;
     time_deletion_of_free_autonomous_database = time_deletion_of_free_autonomous_database_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     time_of_next_refresh = time_of_next_refresh_;
     time_of_last_refresh_point = time_of_last_refresh_point_;
     time_of_last_refresh = time_of_last_refresh_;
     time_of_last_failover = time_of_last_failover_;
     time_of_last_switchover = time_of_last_switchover_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     time_local_data_guard_enabled = time_local_data_guard_enabled_;
     time_maintenance_end = time_maintenance_end_;
     time_maintenance_begin = time_maintenance_begin_;
     time_of_last_backup = time_of_last_backup_;
     created_at = created_at_;
     encryption_summary = encryption_summary_;
     resource_pool_summary = resource_pool_summary_;
     total_backup_storage_size_in_g_bs = total_backup_storage_size_in_g_bs_;
     is_backup_retention_locked = is_backup_retention_locked_;
     long_term_backup_schedule = long_term_backup_schedule_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     clone_table_space_list = clone_table_space_list_;
     is_reconnect_clone_enabled = is_reconnect_clone_enabled_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     refreshable_status = refreshable_status_;
     refreshable_mode = refreshable_mode_;
     is_refreshable_clone = is_refreshable_clone_;
     remote_disaster_recovery_configuration = remote_disaster_recovery_configuration_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     failed_data_recovery_in_seconds = failed_data_recovery_in_seconds_;
     peer_db_ids = peer_db_ids_;
     role = role_;
     local_disaster_recovery_type = local_disaster_recovery_type_;
     is_remote_data_guard_enabled = is_remote_data_guard_enabled_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     allowlisted_ips = allowlisted_ips_;
     private_endpoint_label = private_endpoint_label_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint = private_endpoint_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     in_memory_area_in_g_bs = in_memory_area_in_g_bs_;
     allocated_storage_size_in_t_bs = allocated_storage_size_in_t_bs_;
     actual_used_data_storage_size_in_t_bs = actual_used_data_storage_size_in_t_bs_;
     used_data_storage_size_in_g_bs = used_data_storage_size_in_g_bs_;
     used_data_storage_size_in_t_bs = used_data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     provisionable_cpus = provisionable_cpus_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     compute_model = compute_model_;
     compute_count = compute_count_;
     resource_pool_leader_id = resource_pool_leader_id_;
     scheduled_operations = scheduled_operations_;
     db_tools_details = db_tools_details_;
     connection_urls = connection_urls_;
     maintenance_target_component = maintenance_target_component_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     operations_insights_status = operations_insights_status_;
     database_management_status = database_management_status_;
     data_safe_status = data_safe_status_;
     local_standby_db = local_standby_db_;
     standby_db = standby_db_;
     apex_details = apex_details_;
     customer_contacts = customer_contacts_;
     sql_web_developer_url = sql_web_developer_url_;
     service_console_url = service_console_url_;
     connection_string_details = connection_string_details_;
     byol_compute_count_limit = byol_compute_count_limit_;
     available_upgrade_versions = available_upgrade_versions_;
     net_services_architecture = net_services_architecture_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     is_mtls_connection_required = is_mtls_connection_required_;
     permission_level = permission_level_;
     open_mode = open_mode_;
     license_model = license_model_;
     database_edition = database_edition_;
     ncharacter_set = ncharacter_set_;
     character_set = character_set_;
     db_workload = db_workload_;
     db_version = db_version_;
     database_type = database_type_;
     status_reason = status_reason_;
     status = status_;
     source_id = source_id_;
     db_name = db_name_;
     display_name = display_name_;
     oci_url = oci_url_;
     ocid = ocid_;
     percent_progress = percent_progress_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     autonomous_database_arn = autonomous_database_arn_;
     autonomous_database_id = autonomous_database_id_;
   }
    : autonomous_database_summary)

let make_list_autonomous_databases_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_databases:(autonomous_databases_ : autonomous_database_list) () =
  ({ autonomous_databases = autonomous_databases_; next_token = next_token_ }
    : list_autonomous_databases_output)

let make_list_autonomous_databases_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_autonomous_databases_input)

let make_autonomous_database_peer_summary
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option) () =
  ({
     region = region_;
     ocid = ocid_;
     autonomous_database_arn = autonomous_database_arn_;
     autonomous_database_id = autonomous_database_id_;
   }
    : autonomous_database_peer_summary)

let make_list_autonomous_database_peers_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_peers:(autonomous_database_peers_ : autonomous_database_peer_list) () =
  ({ autonomous_database_peers = autonomous_database_peers_; next_token = next_token_ }
    : list_autonomous_database_peers_output)

let make_list_autonomous_database_peers_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_autonomous_database_peers_input)

let make_list_autonomous_database_clones_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_clones:(autonomous_database_clones_ : autonomous_database_list) () =
  ({ autonomous_database_clones = autonomous_database_clones_; next_token = next_token_ }
    : list_autonomous_database_clones_output)

let make_list_autonomous_database_clones_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     autonomous_database_id = autonomous_database_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_autonomous_database_clones_input)

let make_autonomous_database_backup_summary ?type_:(type__ : autonomous_database_backup_type option)
    ?time_ended:(time_ended_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_started:(time_started_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_available_till:(time_available_till_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?size_in_t_bs:(size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_automatic:(is_automatic_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option)
    ?autonomous_database_backup_arn:(autonomous_database_backup_arn_ : resource_arn option)
    ?autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id option) () =
  ({
     type_ = type__;
     time_ended = time_ended_;
     time_started = time_started_;
     time_available_till = time_available_till_;
     size_in_t_bs = size_in_t_bs_;
     retention_period_in_days = retention_period_in_days_;
     is_automatic = is_automatic_;
     status_reason = status_reason_;
     status = status_;
     db_version = db_version_;
     display_name = display_name_;
     ocid = ocid_;
     autonomous_database_id = autonomous_database_id_;
     autonomous_database_backup_arn = autonomous_database_backup_arn_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : autonomous_database_backup_summary)

let make_list_autonomous_database_backups_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backups:(autonomous_database_backups_ : autonomous_database_backup_list) ()
    =
  ({ autonomous_database_backups = autonomous_database_backups_; next_token = next_token_ }
    : list_autonomous_database_backups_output)

let make_list_autonomous_database_backups_input
    ?type_:(type__ : autonomous_database_backup_type option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id) () =
  ({
     type_ = type__;
     status = status_;
     autonomous_database_id = autonomous_database_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_autonomous_database_backups_input)

let make_get_odb_peering_connection_output
    ?odb_peering_connection:(odb_peering_connection_ : odb_peering_connection option) () =
  ({ odb_peering_connection = odb_peering_connection_ } : get_odb_peering_connection_output)

let make_get_odb_peering_connection_input
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({ odb_peering_connection_id = odb_peering_connection_id_ } : get_odb_peering_connection_input)

let make_get_odb_network_output ?odb_network:(odb_network_ : odb_network option) () =
  ({ odb_network = odb_network_ } : get_odb_network_output)

let make_get_odb_network_input ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({ odb_network_id = odb_network_id_ } : get_odb_network_input)

let make_db_server
    ?autonomous_virtual_machine_ids:(autonomous_virtual_machine_ids_ : string_list option)
    ?autonomous_vm_cluster_ids:(autonomous_vm_cluster_ids_ : string_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?vm_cluster_ids:(vm_cluster_ids_ : string_list option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_in_g_bs:
      (max_db_node_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_infrastructure_id:
      (exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_patching_details:(db_server_patching_details_ : db_server_patching_details option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option) ?db_server_id:(db_server_id_ : resource_id option) ()
    =
  ({
     autonomous_virtual_machine_ids = autonomous_virtual_machine_ids_;
     autonomous_vm_cluster_ids = autonomous_vm_cluster_ids_;
     compute_model = compute_model_;
     vm_cluster_ids = vm_cluster_ids_;
     created_at = created_at_;
     shape = shape_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     max_db_node_storage_in_g_bs = max_db_node_storage_in_g_bs_;
     max_cpu_count = max_cpu_count_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     exadata_infrastructure_id = exadata_infrastructure_id_;
     display_name = display_name_;
     db_server_patching_details = db_server_patching_details_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     status_reason = status_reason_;
     status = status_;
     db_server_id = db_server_id_;
   }
    : db_server)

let make_get_db_server_output ?db_server:(db_server_ : db_server option) () =
  ({ db_server = db_server_ } : get_db_server_output)

let make_get_db_server_input ~db_server_id:(db_server_id_ : resource_id)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     db_server_id = db_server_id_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : get_db_server_input)

let make_db_node
    ?floating_ip_address:(floating_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vnic_id:(vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vnic2_id:(vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_cpu_core_count:(total_cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_maintenance_window_start:
      (time_maintenance_window_start_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_maintenance_window_end:
      (time_maintenance_window_end_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?software_storage_size_in_g_b:
      (software_storage_size_in_g_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_type:(maintenance_type_ : db_node_maintenance_type option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?host_ip_id:(host_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?fault_domain:(fault_domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_system_id:(db_system_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_id:(db_server_id_ : resource_id option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?backup_vnic_id:(backup_vnic_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_vnic2_id:(backup_vnic2_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_ip_id:(backup_ip_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_details:(additional_details_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : db_node_resource_status option)
    ?db_node_arn:(db_node_arn_ : resource_arn option) ?db_node_id:(db_node_id_ : resource_id option)
    () =
  ({
     floating_ip_address = floating_ip_address_;
     private_ip_address = private_ip_address_;
     vnic_id = vnic_id_;
     vnic2_id = vnic2_id_;
     total_cpu_core_count = total_cpu_core_count_;
     time_maintenance_window_start = time_maintenance_window_start_;
     time_maintenance_window_end = time_maintenance_window_end_;
     created_at = created_at_;
     software_storage_size_in_g_b = software_storage_size_in_g_b_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     maintenance_type = maintenance_type_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     hostname = hostname_;
     host_ip_id = host_ip_id_;
     fault_domain = fault_domain_;
     db_system_id = db_system_id_;
     db_server_id = db_server_id_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     backup_vnic_id = backup_vnic_id_;
     backup_vnic2_id = backup_vnic2_id_;
     backup_ip_id = backup_ip_id_;
     additional_details = additional_details_;
     status_reason = status_reason_;
     status = status_;
     db_node_arn = db_node_arn_;
     db_node_id = db_node_id_;
   }
    : db_node)

let make_get_db_node_output ?db_node:(db_node_ : db_node option) () =
  ({ db_node = db_node_ } : get_db_node_output)

let make_get_db_node_input ~db_node_id:(db_node_id_ : resource_id)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ db_node_id = db_node_id_; cloud_vm_cluster_id = cloud_vm_cluster_id_ } : get_db_node_input)

let make_cloud_vm_cluster ?iam_roles:(iam_roles_ : iam_role_list option)
    ?compute_model:(compute_model_ : compute_model option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?vip_ids:(vip_ids_ : string_list option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_size_in_g_bs:(storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ssh_public_keys:(ssh_public_keys_ : sensitive_string_list option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_ip_ids:(scan_ip_ids_ : string_list option)
    ?scan_dns_record_id:(scan_dns_record_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_dns_name:(scan_dns_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?listener_port:(listener_port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?license_model:(license_model_ : license_model option)
    ?last_update_history_entry_id:
      (last_update_history_entry_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?iorm_config_cache:(iorm_config_cache_ : exadata_iorm_config option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?disk_redundancy:(disk_redundancy_ : disk_redundancy option)
    ?db_servers:(db_servers_ : string_list option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cluster_name:(cluster_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_vm_cluster_arn:(cloud_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({
     iam_roles = iam_roles_;
     compute_model = compute_model_;
     percent_progress = percent_progress_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     vip_ids = vip_ids_;
     time_zone = time_zone_;
     created_at = created_at_;
     system_version = system_version_;
     storage_size_in_g_bs = storage_size_in_g_bs_;
     ssh_public_keys = ssh_public_keys_;
     shape = shape_;
     scan_ip_ids = scan_ip_ids_;
     scan_dns_record_id = scan_dns_record_id_;
     scan_dns_name = scan_dns_name_;
     domain = domain_;
     oci_url = oci_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     ocid = ocid_;
     node_count = node_count_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     listener_port = listener_port_;
     license_model = license_model_;
     last_update_history_entry_id = last_update_history_entry_id_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     is_local_backup_enabled = is_local_backup_enabled_;
     iorm_config_cache = iorm_config_cache_;
     hostname = hostname_;
     gi_version = gi_version_;
     disk_redundancy = disk_redundancy_;
     db_servers = db_servers_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_collection_options = data_collection_options_;
     cpu_core_count = cpu_core_count_;
     cluster_name = cluster_name_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     cloud_vm_cluster_arn = cloud_vm_cluster_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
   }
    : cloud_vm_cluster)

let make_get_cloud_vm_cluster_output ?cloud_vm_cluster:(cloud_vm_cluster_ : cloud_vm_cluster option)
    () =
  ({ cloud_vm_cluster = cloud_vm_cluster_ } : get_cloud_vm_cluster_output)

let make_get_cloud_vm_cluster_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) () =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_ } : get_cloud_vm_cluster_input)

let make_cloud_autonomous_vm_cluster_resource_details
    ?unallocated_adb_storage_in_t_bs:
      (unallocated_adb_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id option) () =
  ({
     unallocated_adb_storage_in_t_bs = unallocated_adb_storage_in_t_bs_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
   }
    : cloud_autonomous_vm_cluster_resource_details)

let make_cloud_exadata_infrastructure_unallocated_resources
    ?ocpus:(ocpus_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_in_g_bs:(memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?local_storage_in_g_bs:(local_storage_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?exadata_storage_in_t_bs:(exadata_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cloud_exadata_infrastructure_display_name:
      (cloud_exadata_infrastructure_display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cloud_autonomous_vm_clusters:
      (cloud_autonomous_vm_clusters_ : cloud_autonomous_vm_cluster_resource_details_list option) ()
    =
  ({
     ocpus = ocpus_;
     memory_in_g_bs = memory_in_g_bs_;
     local_storage_in_g_bs = local_storage_in_g_bs_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     exadata_storage_in_t_bs = exadata_storage_in_t_bs_;
     cloud_exadata_infrastructure_display_name = cloud_exadata_infrastructure_display_name_;
     cloud_autonomous_vm_clusters = cloud_autonomous_vm_clusters_;
   }
    : cloud_exadata_infrastructure_unallocated_resources)

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
  ({ db_servers = db_servers_; cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_ }
    : get_cloud_exadata_infrastructure_unallocated_resources_input)

let make_cloud_exadata_infrastructure ?compute_model:(compute_model_ : compute_model option)
    ?storage_server_type:(storage_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_server_type:(database_server_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?total_storage_size_in_g_bs:
      (total_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?storage_server_version:(storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_maintenance_run_id:(next_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_storage_server_version:
      (monthly_storage_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_db_server_version:
      (monthly_db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_memory_in_g_bs:(max_memory_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_db_node_storage_size_in_g_bs:
      (max_db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_data_storage_in_t_bs:(max_data_storage_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?max_cpu_count:(max_cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?last_maintenance_run_id:(last_maintenance_run_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_server_version:(db_server_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?cpu_count:(cpu_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?available_storage_size_in_g_bs:
      (available_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?additional_storage_count:
      (additional_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?activated_storage_count:(activated_storage_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cloud_exadata_infrastructure_arn:
      (cloud_exadata_infrastructure_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     compute_model = compute_model_;
     storage_server_type = storage_server_type_;
     database_server_type = database_server_type_;
     percent_progress = percent_progress_;
     total_storage_size_in_g_bs = total_storage_size_in_g_bs_;
     created_at = created_at_;
     storage_server_version = storage_server_version_;
     storage_count = storage_count_;
     shape = shape_;
     ocid = ocid_;
     oci_url = oci_url_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     next_maintenance_run_id = next_maintenance_run_id_;
     monthly_storage_server_version = monthly_storage_server_version_;
     monthly_db_server_version = monthly_db_server_version_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     max_memory_in_g_bs = max_memory_in_g_bs_;
     max_db_node_storage_size_in_g_bs = max_db_node_storage_size_in_g_bs_;
     max_data_storage_in_t_bs = max_data_storage_in_t_bs_;
     max_cpu_count = max_cpu_count_;
     maintenance_window = maintenance_window_;
     last_maintenance_run_id = last_maintenance_run_id_;
     db_server_version = db_server_version_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     cpu_count = cpu_count_;
     compute_count = compute_count_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     available_storage_size_in_g_bs = available_storage_size_in_g_bs_;
     additional_storage_count = additional_storage_count_;
     activated_storage_count = activated_storage_count_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : cloud_exadata_infrastructure)

let make_get_cloud_exadata_infrastructure_output
    ?cloud_exadata_infrastructure:
      (cloud_exadata_infrastructure_ : cloud_exadata_infrastructure option) () =
  ({ cloud_exadata_infrastructure = cloud_exadata_infrastructure_ }
    : get_cloud_exadata_infrastructure_output)

let make_get_cloud_exadata_infrastructure_input
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({ cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_ }
    : get_cloud_exadata_infrastructure_input)

let make_cloud_autonomous_vm_cluster ?iam_roles:(iam_roles_ : iam_role_list option)
    ?total_container_databases:
      (total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?time_ords_certificate_expires:
      (time_ords_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_database_ssl_certificate_expires:
      (time_database_ssl_certificate_expires_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?shape:(shape_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?reserved_cpus:(reserved_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?reclaimable_cpus:(reclaimable_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?provisioned_cpus:(provisioned_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?provisioned_autonomous_container_databases:
      (provisioned_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?provisionable_autonomous_container_databases:
      (provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?non_provisionable_autonomous_container_databases:
      (non_provisionable_autonomous_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?node_count:(node_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_acds_lowest_scaled_value:
      (max_acds_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?license_model:(license_model_ : license_model option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hostname:(hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?exadata_storage_in_t_bs_lowest_scaled_value:
      (exadata_storage_in_t_bs_lowest_scaled_value_ : Smaws_Lib.Smithy_api.Types.double option)
    ?domain:(domain_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_servers:(db_servers_ : string_list option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cpu_percentage:(cpu_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_model:(compute_model_ : compute_model option)
    ?available_cpus:(available_cpus_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?available_container_databases:
      (available_container_databases_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_autonomous_data_storage_size_in_t_bs:
      (available_autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?autonomous_data_storage_percentage:
      (autonomous_data_storage_percentage_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?cloud_exadata_infrastructure_arn:(cloud_exadata_infrastructure_arn_ : resource_arn option)
    ?cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : resource_display_name option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option)
    ?cloud_autonomous_vm_cluster_arn:
      (cloud_autonomous_vm_cluster_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({
     iam_roles = iam_roles_;
     total_container_databases = total_container_databases_;
     time_zone = time_zone_;
     time_ords_certificate_expires = time_ords_certificate_expires_;
     time_database_ssl_certificate_expires = time_database_ssl_certificate_expires_;
     created_at = created_at_;
     shape = shape_;
     scan_listener_port_tls = scan_listener_port_tls_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     reserved_cpus = reserved_cpus_;
     reclaimable_cpus = reclaimable_cpus_;
     provisioned_cpus = provisioned_cpus_;
     provisioned_autonomous_container_databases = provisioned_autonomous_container_databases_;
     provisionable_autonomous_container_databases = provisionable_autonomous_container_databases_;
     non_provisionable_autonomous_container_databases =
       non_provisionable_autonomous_container_databases_;
     node_count = node_count_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     max_acds_lowest_scaled_value = max_acds_lowest_scaled_value_;
     maintenance_window = maintenance_window_;
     license_model = license_model_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     oci_url = oci_url_;
     ocid = ocid_;
     hostname = hostname_;
     exadata_storage_in_t_bs_lowest_scaled_value = exadata_storage_in_t_bs_lowest_scaled_value_;
     domain = domain_;
     description = description_;
     db_servers = db_servers_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     cpu_percentage = cpu_percentage_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     cpu_core_count = cpu_core_count_;
     compute_model = compute_model_;
     available_cpus = available_cpus_;
     available_container_databases = available_container_databases_;
     available_autonomous_data_storage_size_in_t_bs =
       available_autonomous_data_storage_size_in_t_bs_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     autonomous_data_storage_percentage = autonomous_data_storage_percentage_;
     cloud_exadata_infrastructure_arn = cloud_exadata_infrastructure_arn_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     percent_progress = percent_progress_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     cloud_autonomous_vm_cluster_arn = cloud_autonomous_vm_cluster_arn_;
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
   }
    : cloud_autonomous_vm_cluster)

let make_get_cloud_autonomous_vm_cluster_output
    ?cloud_autonomous_vm_cluster:(cloud_autonomous_vm_cluster_ : cloud_autonomous_vm_cluster option)
    () =
  ({ cloud_autonomous_vm_cluster = cloud_autonomous_vm_cluster_ }
    : get_cloud_autonomous_vm_cluster_output)

let make_get_cloud_autonomous_vm_cluster_input
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({ cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_ }
    : get_cloud_autonomous_vm_cluster_input)

let make_autonomous_database_wallet_details
    ?time_rotated:(time_rotated_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : autonomous_database_wallet_status option) () =
  ({ time_rotated = time_rotated_; status = status_ } : autonomous_database_wallet_details)

let make_get_autonomous_database_wallet_details_output
    ~autonomous_database_wallet_details:
      (autonomous_database_wallet_details_ : autonomous_database_wallet_details) () =
  ({ autonomous_database_wallet_details = autonomous_database_wallet_details_ }
    : get_autonomous_database_wallet_details_output)

let make_get_autonomous_database_wallet_details_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ }
    : get_autonomous_database_wallet_details_input)

let make_autonomous_database
    ?time_undeleted:(time_undeleted_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_long_term_backup_time_stamp:
      (next_long_term_backup_time_stamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_until_reconnect_clone_enabled:
      (time_until_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_disaster_recovery_role_changed:
      (time_disaster_recovery_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_reclamation_of_free_autonomous_database:
      (time_reclamation_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_deletion_of_free_autonomous_database:
      (time_deletion_of_free_autonomous_database_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_auto_refresh_start:
      (time_of_auto_refresh_start_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_next_refresh:(time_of_next_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh_point:
      (time_of_last_refresh_point_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_refresh:(time_of_last_refresh_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_failover:(time_of_last_failover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_switchover:
      (time_of_last_switchover_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_data_guard_role_changed:
      (time_data_guard_role_changed_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_local_data_guard_enabled:
      (time_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_end:(time_maintenance_end_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_maintenance_begin:(time_maintenance_begin_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_of_last_backup:(time_of_last_backup_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?encryption_summary:(encryption_summary_ : encryption_summary option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?total_backup_storage_size_in_g_bs:
      (total_backup_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?long_term_backup_schedule:(long_term_backup_schedule_ : long_term_backup_schedule option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?clone_table_space_list:(clone_table_space_list_ : integer_list option)
    ?is_reconnect_clone_enabled:
      (is_reconnect_clone_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?auto_refresh_point_lag_in_seconds:
      (auto_refresh_point_lag_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?auto_refresh_frequency_in_seconds:
      (auto_refresh_frequency_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?refreshable_status:(refreshable_status_ : refreshable_status option)
    ?refreshable_mode:(refreshable_mode_ : refreshable_mode option)
    ?is_refreshable_clone:(is_refreshable_clone_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?remote_disaster_recovery_configuration:
      (remote_disaster_recovery_configuration_ : disaster_recovery_configuration option)
    ?local_adg_auto_failover_max_data_loss_limit:
      (local_adg_auto_failover_max_data_loss_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?failed_data_recovery_in_seconds:
      (failed_data_recovery_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?peer_db_ids:(peer_db_ids_ : string_list option) ?role:(role_ : data_guard_role option)
    ?local_disaster_recovery_type:(local_disaster_recovery_type_ : disaster_recovery_type option)
    ?is_remote_data_guard_enabled:
      (is_remote_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint:(private_endpoint_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?odb_network_arn:(odb_network_arn_ : resource_arn option)
    ?odb_network_id:(odb_network_id_ : resource_id option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?in_memory_area_in_g_bs:(in_memory_area_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?allocated_storage_size_in_t_bs:
      (allocated_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?actual_used_data_storage_size_in_t_bs:
      (actual_used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?used_data_storage_size_in_g_bs:
      (used_data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?used_data_storage_size_in_t_bs:
      (used_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?provisionable_cpus:(provisionable_cpus_ : integer_list option)
    ?memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_model:(compute_model_ : compute_model option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?connection_urls:(connection_urls_ : autonomous_database_connection_urls option)
    ?maintenance_target_component:
      (maintenance_target_component_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?operations_insights_status:(operations_insights_status_ : operations_insights_status option)
    ?database_management_status:(database_management_status_ : database_management_status option)
    ?data_safe_status:(data_safe_status_ : data_safe_status option)
    ?local_standby_db:(local_standby_db_ : database_standby_summary option)
    ?standby_db:(standby_db_ : database_standby_summary option)
    ?apex_details:(apex_details_ : autonomous_database_apex option)
    ?customer_contacts:(customer_contacts_ : customer_contacts option)
    ?sql_web_developer_url:(sql_web_developer_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service_console_url:(service_console_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?connection_string_details:
      (connection_string_details_ : autonomous_database_connection_strings option)
    ?byol_compute_count_limit:
      (byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?available_upgrade_versions:(available_upgrade_versions_ : string_list option)
    ?net_services_architecture:(net_services_architecture_ : net_services_architecture option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?permission_level:(permission_level_ : permission_level option)
    ?open_mode:(open_mode_ : open_mode option)
    ?license_model:(license_model_ : license_model option)
    ?database_edition:(database_edition_ : database_edition option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_type:(database_type_ : database_type option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?source_id:(source_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?oci_url:(oci_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?percent_progress:(percent_progress_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?oci_resource_anchor_name:
      (oci_resource_anchor_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_arn:(autonomous_database_arn_ : resource_arn option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn option) () =
  ({
     time_undeleted = time_undeleted_;
     next_long_term_backup_time_stamp = next_long_term_backup_time_stamp_;
     time_until_reconnect_clone_enabled = time_until_reconnect_clone_enabled_;
     time_disaster_recovery_role_changed = time_disaster_recovery_role_changed_;
     time_reclamation_of_free_autonomous_database = time_reclamation_of_free_autonomous_database_;
     time_deletion_of_free_autonomous_database = time_deletion_of_free_autonomous_database_;
     time_of_auto_refresh_start = time_of_auto_refresh_start_;
     time_of_next_refresh = time_of_next_refresh_;
     time_of_last_refresh_point = time_of_last_refresh_point_;
     time_of_last_refresh = time_of_last_refresh_;
     time_of_last_failover = time_of_last_failover_;
     time_of_last_switchover = time_of_last_switchover_;
     time_data_guard_role_changed = time_data_guard_role_changed_;
     time_local_data_guard_enabled = time_local_data_guard_enabled_;
     time_maintenance_end = time_maintenance_end_;
     time_maintenance_begin = time_maintenance_begin_;
     time_of_last_backup = time_of_last_backup_;
     created_at = created_at_;
     encryption_summary = encryption_summary_;
     resource_pool_summary = resource_pool_summary_;
     total_backup_storage_size_in_g_bs = total_backup_storage_size_in_g_bs_;
     is_backup_retention_locked = is_backup_retention_locked_;
     long_term_backup_schedule = long_term_backup_schedule_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     clone_table_space_list = clone_table_space_list_;
     is_reconnect_clone_enabled = is_reconnect_clone_enabled_;
     auto_refresh_point_lag_in_seconds = auto_refresh_point_lag_in_seconds_;
     auto_refresh_frequency_in_seconds = auto_refresh_frequency_in_seconds_;
     refreshable_status = refreshable_status_;
     refreshable_mode = refreshable_mode_;
     is_refreshable_clone = is_refreshable_clone_;
     remote_disaster_recovery_configuration = remote_disaster_recovery_configuration_;
     local_adg_auto_failover_max_data_loss_limit = local_adg_auto_failover_max_data_loss_limit_;
     failed_data_recovery_in_seconds = failed_data_recovery_in_seconds_;
     peer_db_ids = peer_db_ids_;
     role = role_;
     local_disaster_recovery_type = local_disaster_recovery_type_;
     is_remote_data_guard_enabled = is_remote_data_guard_enabled_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     allowlisted_ips = allowlisted_ips_;
     private_endpoint_label = private_endpoint_label_;
     private_endpoint_ip = private_endpoint_ip_;
     private_endpoint = private_endpoint_;
     odb_network_arn = odb_network_arn_;
     odb_network_id = odb_network_id_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     in_memory_area_in_g_bs = in_memory_area_in_g_bs_;
     allocated_storage_size_in_t_bs = allocated_storage_size_in_t_bs_;
     actual_used_data_storage_size_in_t_bs = actual_used_data_storage_size_in_t_bs_;
     used_data_storage_size_in_g_bs = used_data_storage_size_in_g_bs_;
     used_data_storage_size_in_t_bs = used_data_storage_size_in_t_bs_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     provisionable_cpus = provisionable_cpus_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     cpu_core_count = cpu_core_count_;
     compute_model = compute_model_;
     compute_count = compute_count_;
     resource_pool_leader_id = resource_pool_leader_id_;
     scheduled_operations = scheduled_operations_;
     db_tools_details = db_tools_details_;
     connection_urls = connection_urls_;
     maintenance_target_component = maintenance_target_component_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     operations_insights_status = operations_insights_status_;
     database_management_status = database_management_status_;
     data_safe_status = data_safe_status_;
     local_standby_db = local_standby_db_;
     standby_db = standby_db_;
     apex_details = apex_details_;
     customer_contacts = customer_contacts_;
     sql_web_developer_url = sql_web_developer_url_;
     service_console_url = service_console_url_;
     connection_string_details = connection_string_details_;
     byol_compute_count_limit = byol_compute_count_limit_;
     available_upgrade_versions = available_upgrade_versions_;
     net_services_architecture = net_services_architecture_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     is_mtls_connection_required = is_mtls_connection_required_;
     permission_level = permission_level_;
     open_mode = open_mode_;
     license_model = license_model_;
     database_edition = database_edition_;
     ncharacter_set = ncharacter_set_;
     character_set = character_set_;
     db_workload = db_workload_;
     db_version = db_version_;
     database_type = database_type_;
     status_reason = status_reason_;
     status = status_;
     source_id = source_id_;
     db_name = db_name_;
     display_name = display_name_;
     oci_url = oci_url_;
     ocid = ocid_;
     percent_progress = percent_progress_;
     oci_resource_anchor_name = oci_resource_anchor_name_;
     autonomous_database_arn = autonomous_database_arn_;
     autonomous_database_id = autonomous_database_id_;
   }
    : autonomous_database)

let make_get_autonomous_database_output
    ~autonomous_database:(autonomous_database_ : autonomous_database) () =
  ({ autonomous_database = autonomous_database_ } : get_autonomous_database_output)

let make_get_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : get_autonomous_database_input)

let make_autonomous_database_backup ?type_:(type__ : autonomous_database_backup_type option)
    ?time_ended:(time_ended_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_started:(time_started_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?time_available_till:(time_available_till_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?size_in_t_bs:(size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?is_automatic:(is_automatic_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_backup_status option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ocid:(ocid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?autonomous_database_id:(autonomous_database_id_ : resource_id option)
    ?autonomous_database_backup_arn:(autonomous_database_backup_arn_ : resource_arn option)
    ?autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id option) () =
  ({
     type_ = type__;
     time_ended = time_ended_;
     time_started = time_started_;
     time_available_till = time_available_till_;
     size_in_t_bs = size_in_t_bs_;
     retention_period_in_days = retention_period_in_days_;
     is_automatic = is_automatic_;
     status_reason = status_reason_;
     status = status_;
     db_version = db_version_;
     display_name = display_name_;
     ocid = ocid_;
     autonomous_database_id = autonomous_database_id_;
     autonomous_database_backup_arn = autonomous_database_backup_arn_;
     autonomous_database_backup_id = autonomous_database_backup_id_;
   }
    : autonomous_database_backup)

let make_get_autonomous_database_backup_output
    ?autonomous_database_backup:(autonomous_database_backup_ : autonomous_database_backup option) ()
    =
  ({ autonomous_database_backup = autonomous_database_backup_ }
    : get_autonomous_database_backup_output)

let make_get_autonomous_database_backup_input
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({ autonomous_database_backup_id = autonomous_database_backup_id_ }
    : get_autonomous_database_backup_input)

let make_failover_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : failover_autonomous_database_output)

let make_failover_autonomous_database_input ?peer_db_arn:(peer_db_arn_ : resource_arn option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ peer_db_arn = peer_db_arn_; autonomous_database_id = autonomous_database_id_ }
    : failover_autonomous_database_input)

let make_delete_odb_peering_connection_output () = (() : unit)

let make_delete_odb_peering_connection_input
    ~odb_peering_connection_id:(odb_peering_connection_id_ : resource_id_or_arn) () =
  ({ odb_peering_connection_id = odb_peering_connection_id_ } : delete_odb_peering_connection_input)

let make_delete_odb_network_output () = (() : unit)

let make_delete_odb_network_input
    ~delete_associated_resources:
      (delete_associated_resources_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({ delete_associated_resources = delete_associated_resources_; odb_network_id = odb_network_id_ }
    : delete_odb_network_input)

let make_delete_cloud_vm_cluster_output () = (() : unit)

let make_delete_cloud_vm_cluster_input ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : resource_id) ()
    =
  ({ cloud_vm_cluster_id = cloud_vm_cluster_id_ } : delete_cloud_vm_cluster_input)

let make_delete_cloud_exadata_infrastructure_output () = (() : unit)

let make_delete_cloud_exadata_infrastructure_input
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({ cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_ }
    : delete_cloud_exadata_infrastructure_input)

let make_delete_cloud_autonomous_vm_cluster_output () = (() : unit)

let make_delete_cloud_autonomous_vm_cluster_input
    ~cloud_autonomous_vm_cluster_id:(cloud_autonomous_vm_cluster_id_ : resource_id) () =
  ({ cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_ }
    : delete_cloud_autonomous_vm_cluster_input)

let make_delete_autonomous_database_output () = (() : unit)

let make_delete_autonomous_database_input
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({ autonomous_database_id = autonomous_database_id_ } : delete_autonomous_database_input)

let make_delete_autonomous_database_backup_output () = (() : unit)

let make_delete_autonomous_database_backup_input
    ~autonomous_database_backup_id:(autonomous_database_backup_id_ : resource_id) () =
  ({ autonomous_database_backup_id = autonomous_database_backup_id_ }
    : delete_autonomous_database_backup_input)

let make_create_odb_peering_connection_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_peering_connection_id:(odb_peering_connection_id_ : Smaws_Lib.Smithy_api.Types.string_) ()
    =
  ({
     odb_peering_connection_id = odb_peering_connection_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_odb_peering_connection_output)

let make_create_odb_peering_connection_input ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : general_input_string option)
    ?peer_network_route_table_ids:
      (peer_network_route_table_ids_ : peer_network_route_table_id_list option)
    ?peer_network_cidrs_to_be_added:(peer_network_cidrs_to_be_added_ : peered_cidr_list option)
    ?display_name:(display_name_ : resource_display_name option)
    ~peer_network_id:(peer_network_id_ : resource_id_or_arn)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn) () =
  ({
     tags = tags_;
     client_token = client_token_;
     peer_network_route_table_ids = peer_network_route_table_ids_;
     peer_network_cidrs_to_be_added = peer_network_cidrs_to_be_added_;
     display_name = display_name_;
     peer_network_id = peer_network_id_;
     odb_network_id = odb_network_id_;
   }
    : create_odb_peering_connection_input)

let make_create_odb_network_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~odb_network_id:(odb_network_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     odb_network_id = odb_network_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_odb_network_output)

let make_create_odb_network_input ?tags:(tags_ : request_tag_map option)
    ?cross_region_s3_restore_sources_to_enable:
      (cross_region_s3_restore_sources_to_enable_ : string_list option)
    ?kms_policy_document:(kms_policy_document_ : policy_document option)
    ?sts_policy_document:(sts_policy_document_ : policy_document option)
    ?s3_policy_document:(s3_policy_document_ : policy_document option)
    ?kms_access:(kms_access_ : access option) ?sts_access:(sts_access_ : access option)
    ?zero_etl_access:(zero_etl_access_ : access option) ?s3_access:(s3_access_ : access option)
    ?client_token:(client_token_ : general_input_string option)
    ?default_dns_prefix:(default_dns_prefix_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_name:(custom_domain_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?backup_subnet_cidr:(backup_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~client_subnet_cidr:(client_subnet_cidr_ : Smaws_Lib.Smithy_api.Types.string_)
    ~display_name:(display_name_ : resource_display_name) () =
  ({
     tags = tags_;
     cross_region_s3_restore_sources_to_enable = cross_region_s3_restore_sources_to_enable_;
     kms_policy_document = kms_policy_document_;
     sts_policy_document = sts_policy_document_;
     s3_policy_document = s3_policy_document_;
     kms_access = kms_access_;
     sts_access = sts_access_;
     zero_etl_access = zero_etl_access_;
     s3_access = s3_access_;
     client_token = client_token_;
     default_dns_prefix = default_dns_prefix_;
     custom_domain_name = custom_domain_name_;
     backup_subnet_cidr = backup_subnet_cidr_;
     client_subnet_cidr = client_subnet_cidr_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     display_name = display_name_;
   }
    : create_odb_network_input)

let make_create_cloud_vm_cluster_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_vm_cluster_id:(cloud_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     cloud_vm_cluster_id = cloud_vm_cluster_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_cloud_vm_cluster_output)

let make_create_cloud_vm_cluster_input
    ?scan_listener_port_tcp:(scan_listener_port_tcp_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?client_token:(client_token_ : general_input_string option)
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?system_version:(system_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_g_bs:(memory_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?license_model:(license_model_ : license_model option)
    ?is_sparse_diskgroup_enabled:
      (is_sparse_diskgroup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_backup_enabled:(is_local_backup_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : request_tag_map option) ?db_servers:(db_servers_ : string_list option)
    ?db_node_storage_size_in_g_bs:
      (db_node_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double option)
    ?data_collection_options:(data_collection_options_ : data_collection_options option)
    ?cluster_name:(cluster_name_ : cluster_name option)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn)
    ~ssh_public_keys:(ssh_public_keys_ : string_list) ~hostname:(hostname_ : hostname)
    ~gi_version:(gi_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~display_name:(display_name_ : resource_display_name)
    ~cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     scan_listener_port_tcp = scan_listener_port_tcp_;
     client_token = client_token_;
     time_zone = time_zone_;
     system_version = system_version_;
     memory_size_in_g_bs = memory_size_in_g_bs_;
     license_model = license_model_;
     is_sparse_diskgroup_enabled = is_sparse_diskgroup_enabled_;
     is_local_backup_enabled = is_local_backup_enabled_;
     tags = tags_;
     db_servers = db_servers_;
     db_node_storage_size_in_g_bs = db_node_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     data_collection_options = data_collection_options_;
     cluster_name = cluster_name_;
     odb_network_id = odb_network_id_;
     ssh_public_keys = ssh_public_keys_;
     hostname = hostname_;
     gi_version = gi_version_;
     display_name = display_name_;
     cpu_core_count = cpu_core_count_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : create_cloud_vm_cluster_input)

let make_create_cloud_exadata_infrastructure_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_exadata_infrastructure_id:
      (cloud_exadata_infrastructure_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_cloud_exadata_infrastructure_output)

let make_create_cloud_exadata_infrastructure_input
    ?storage_server_type:(storage_server_type_ : general_input_string option)
    ?database_server_type:(database_server_type_ : general_input_string option)
    ?client_token:(client_token_ : general_input_string option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?tags:(tags_ : request_tag_map option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~storage_count:(storage_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~shape:(shape_ : general_input_string) ~display_name:(display_name_ : resource_display_name) ()
    =
  ({
     storage_server_type = storage_server_type_;
     database_server_type = database_server_type_;
     client_token = client_token_;
     storage_count = storage_count_;
     maintenance_window = maintenance_window_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     compute_count = compute_count_;
     tags = tags_;
     availability_zone_id = availability_zone_id_;
     availability_zone = availability_zone_;
     shape = shape_;
     display_name = display_name_;
   }
    : create_cloud_exadata_infrastructure_input)

let make_create_cloud_autonomous_vm_cluster_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cloud_autonomous_vm_cluster_id:
      (cloud_autonomous_vm_cluster_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     cloud_autonomous_vm_cluster_id = cloud_autonomous_vm_cluster_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_cloud_autonomous_vm_cluster_output)

let make_create_cloud_autonomous_vm_cluster_input
    ?time_zone:(time_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : request_tag_map option)
    ?scan_listener_port_tls:(scan_listener_port_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scan_listener_port_non_tls:
      (scan_listener_port_non_tls_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?license_model:(license_model_ : license_model option)
    ?is_mtls_enabled_vm_cluster:
      (is_mtls_enabled_vm_cluster_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_servers:(db_servers_ : string_list option)
    ?client_token:(client_token_ : general_input_string option)
    ~total_container_databases:(total_container_databases_ : Smaws_Lib.Smithy_api.Types.integer)
    ~memory_per_oracle_compute_unit_in_g_bs:
      (memory_per_oracle_compute_unit_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer)
    ~cpu_core_count_per_node:(cpu_core_count_per_node_ : Smaws_Lib.Smithy_api.Types.integer)
    ~autonomous_data_storage_size_in_t_bs:
      (autonomous_data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.double)
    ~display_name:(display_name_ : resource_display_name)
    ~odb_network_id:(odb_network_id_ : resource_id_or_arn)
    ~cloud_exadata_infrastructure_id:(cloud_exadata_infrastructure_id_ : resource_id_or_arn) () =
  ({
     total_container_databases = total_container_databases_;
     time_zone = time_zone_;
     tags = tags_;
     scan_listener_port_tls = scan_listener_port_tls_;
     scan_listener_port_non_tls = scan_listener_port_non_tls_;
     memory_per_oracle_compute_unit_in_g_bs = memory_per_oracle_compute_unit_in_g_bs_;
     maintenance_window = maintenance_window_;
     license_model = license_model_;
     is_mtls_enabled_vm_cluster = is_mtls_enabled_vm_cluster_;
     description = description_;
     db_servers = db_servers_;
     cpu_core_count_per_node = cpu_core_count_per_node_;
     autonomous_data_storage_size_in_t_bs = autonomous_data_storage_size_in_t_bs_;
     client_token = client_token_;
     display_name = display_name_;
     odb_network_id = odb_network_id_;
     cloud_exadata_infrastructure_id = cloud_exadata_infrastructure_id_;
   }
    : create_cloud_autonomous_vm_cluster_input)

let make_create_autonomous_database_wallet_output
    ~autonomous_database_wallet_file:
      (autonomous_database_wallet_file_ : autonomous_database_wallet_file) () =
  ({ autonomous_database_wallet_file = autonomous_database_wallet_file_ }
    : create_autonomous_database_wallet_output)

let make_create_autonomous_database_wallet_input
    ?client_token:(client_token_ : general_input_string option)
    ?wallet_type:(wallet_type_ : wallet_type option) ~password:(password_ : sensitive_string)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     client_token = client_token_;
     password = password_;
     wallet_type = wallet_type_;
     autonomous_database_id = autonomous_database_id_;
   }
    : create_autonomous_database_wallet_input)

let make_create_autonomous_database_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : autonomous_database_resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_id:(autonomous_database_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : create_autonomous_database_output)

let make_create_autonomous_database_input ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : general_input_string option)
    ?encryption_key_configuration:
      (encryption_key_configuration_ : encryption_key_configuration_input option)
    ?encryption_key_provider:(encryption_key_provider_ : encryption_key_provider_input option)
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?source:(source_ : source_type option)
    ?db_tools_details:(db_tools_details_ : database_tool_list option)
    ?is_mtls_connection_required:
      (is_mtls_connection_required_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_local_data_guard_enabled:
      (is_local_data_guard_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_backup_retention_locked:
      (is_backup_retention_locked_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?transportable_tablespace:(transportable_tablespace_ : transportable_tablespace option)
    ?allowlisted_ips:(allowlisted_ips_ : string_list option)
    ?standby_allowlisted_ips:(standby_allowlisted_ips_ : string_list option)
    ?scheduled_operations:(scheduled_operations_ : scheduled_operation_details_list option)
    ?resource_pool_summary:(resource_pool_summary_ : resource_pool_summary option)
    ?resource_pool_leader_id:(resource_pool_leader_id_ : resource_id_or_arn option)
    ?private_endpoint_label:(private_endpoint_label_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_endpoint_ip:(private_endpoint_ip_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?customer_contacts_to_send_to_oc_i:
      (customer_contacts_to_send_to_oc_i_ : customer_contacts option)
    ?cpu_core_count:(cpu_core_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?byol_compute_count_limit:(byol_compute_count_limit_ : Smaws_Lib.Smithy_api.Types.double option)
    ?backup_retention_period_in_days:
      (backup_retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?autonomous_maintenance_schedule_type:
      (autonomous_maintenance_schedule_type_ : autonomous_maintenance_schedule_type option)
    ?standby_allowlisted_ips_source:
      (standby_allowlisted_ips_source_ : standby_allowlisted_ips_source option)
    ?database_edition:(database_edition_ : database_edition option)
    ?db_version:(db_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ncharacter_set:(ncharacter_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?character_set:(character_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_model:(license_model_ : license_model option)
    ?is_auto_scaling_for_storage_enabled:
      (is_auto_scaling_for_storage_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?is_auto_scaling_enabled:(is_auto_scaling_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?db_workload:(db_workload_ : db_workload option)
    ?data_storage_size_in_g_bs:
      (data_storage_size_in_g_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?data_storage_size_in_t_bs:
      (data_storage_size_in_t_bs_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?compute_count:(compute_count_ : Smaws_Lib.Smithy_api.Types.double option)
    ?admin_password:(admin_password_ : sensitive_string option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?display_name:(display_name_ : resource_display_name option)
    ?odb_network_id:(odb_network_id_ : resource_id_or_arn option) () =
  ({
     tags = tags_;
     client_token = client_token_;
     encryption_key_configuration = encryption_key_configuration_;
     encryption_key_provider = encryption_key_provider_;
     source_configuration = source_configuration_;
     source = source_;
     db_tools_details = db_tools_details_;
     is_mtls_connection_required = is_mtls_connection_required_;
     is_local_data_guard_enabled = is_local_data_guard_enabled_;
     is_backup_retention_locked = is_backup_retention_locked_;
     transportable_tablespace = transportable_tablespace_;
     allowlisted_ips = allowlisted_ips_;
     standby_allowlisted_ips = standby_allowlisted_ips_;
     scheduled_operations = scheduled_operations_;
     resource_pool_summary = resource_pool_summary_;
     resource_pool_leader_id = resource_pool_leader_id_;
     private_endpoint_label = private_endpoint_label_;
     private_endpoint_ip = private_endpoint_ip_;
     customer_contacts_to_send_to_oc_i = customer_contacts_to_send_to_oc_i_;
     cpu_core_count = cpu_core_count_;
     byol_compute_count_limit = byol_compute_count_limit_;
     backup_retention_period_in_days = backup_retention_period_in_days_;
     autonomous_maintenance_schedule_type = autonomous_maintenance_schedule_type_;
     standby_allowlisted_ips_source = standby_allowlisted_ips_source_;
     database_edition = database_edition_;
     db_version = db_version_;
     ncharacter_set = ncharacter_set_;
     character_set = character_set_;
     license_model = license_model_;
     is_auto_scaling_for_storage_enabled = is_auto_scaling_for_storage_enabled_;
     is_auto_scaling_enabled = is_auto_scaling_enabled_;
     db_workload = db_workload_;
     data_storage_size_in_g_bs = data_storage_size_in_g_bs_;
     data_storage_size_in_t_bs = data_storage_size_in_t_bs_;
     compute_count = compute_count_;
     admin_password = admin_password_;
     db_name = db_name_;
     display_name = display_name_;
     odb_network_id = odb_network_id_;
   }
    : create_autonomous_database_input)

let make_create_autonomous_database_backup_output
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : resource_status option)
    ?display_name:(display_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~autonomous_database_backup_id:
      (autonomous_database_backup_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     autonomous_database_backup_id = autonomous_database_backup_id_;
     status_reason = status_reason_;
     status = status_;
     display_name = display_name_;
   }
    : create_autonomous_database_backup_output)

let make_create_autonomous_database_backup_input ?tags:(tags_ : request_tag_map option)
    ?client_token:(client_token_ : general_input_string option)
    ?retention_period_in_days:
      (retention_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?display_name:(display_name_ : resource_display_name option)
    ~autonomous_database_id:(autonomous_database_id_ : resource_id_or_arn) () =
  ({
     tags = tags_;
     client_token = client_token_;
     retention_period_in_days = retention_period_in_days_;
     display_name = display_name_;
     autonomous_database_id = autonomous_database_id_;
   }
    : create_autonomous_database_backup_input)
