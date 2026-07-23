(** odb client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_accept_marketplace_registration_output : unit -> unit

val make_accept_marketplace_registration_input :
  marketplace_registration_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  accept_marketplace_registration_input

val make_associate_iam_role_to_resource_output : unit -> unit

val make_associate_iam_role_to_resource_input :
  iam_role_arn:role_arn ->
  aws_integration:supported_aws_integration ->
  resource_arn:arn ->
  unit ->
  associate_iam_role_to_resource_input

val make_okv_encryption_key_configuration :
  ?certificate_id:Smaws_Lib.Smithy_api.Types.string_ ->
  certificate_directory_name:Smaws_Lib.Smithy_api.Types.string_ ->
  directory_name:Smaws_Lib.Smithy_api.Types.string_ ->
  okv_kms_key:Smaws_Lib.Smithy_api.Types.string_ ->
  okv_uri:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  okv_encryption_key_configuration

val make_oci_encryption_key_configuration :
  kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  vault_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_encryption_key_configuration

val make_aws_encryption_key_configuration :
  ?iam_role_arn:role_arn ->
  ?external_id_type:external_id_type ->
  ?kms_key_id:kms_key_id_or_arn ->
  unit ->
  aws_encryption_key_configuration

val make_encryption_summary :
  ?encryption_key_provider:encryption_key_provider ->
  ?encryption_key_configuration:encryption_key_configuration ->
  unit ->
  encryption_summary

val make_resource_pool_summary :
  ?is_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?pool_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?pool_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_storage_capacity_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?total_compute_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_compute_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  resource_pool_summary

val make_long_term_backup_schedule :
  ?is_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?repeat_cadence:repeat_cadence ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_of_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  long_term_backup_schedule

val make_disaster_recovery_configuration :
  ?disaster_recovery_type:disaster_recovery_type ->
  ?is_replicate_automatic_backups:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_snapshot_standby:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?time_snapshot_standby_enabled_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  disaster_recovery_configuration

val make_day_of_week : ?name:day_of_week_name -> unit -> day_of_week

val make_scheduled_operation_details :
  ?scheduled_start_time:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scheduled_stop_time:Smaws_Lib.Smithy_api.Types.string_ ->
  day_of_week:day_of_week ->
  unit ->
  scheduled_operation_details

val make_database_tool :
  ?is_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?max_idle_time_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  database_tool

val make_autonomous_database_connection_urls :
  ?apex_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_transforms_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?graph_studio_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?machine_learning_notebook_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?machine_learning_user_management_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?mongo_db_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ords_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?spatial_studio_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sql_dev_web_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_connection_urls

val make_database_standby_summary :
  ?availability_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lag_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  database_standby_summary

val make_autonomous_database_apex :
  ?apex_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ords_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_apex

val make_customer_contact : ?email:sensitive_string -> unit -> customer_contact

val make_database_connection_string_profile :
  ?consumer_group:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?host_format:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_regional:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protocol:Smaws_Lib.Smithy_api.Types.string_ ->
  ?session_mode:Smaws_Lib.Smithy_api.Types.string_ ->
  ?syntax_format:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tls_authentication:Smaws_Lib.Smithy_api.Types.string_ ->
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  database_connection_string_profile

val make_autonomous_database_connection_strings :
  ?all_connection_strings:database_connection_string_map ->
  ?dedicated:Smaws_Lib.Smithy_api.Types.string_ ->
  ?high:Smaws_Lib.Smithy_api.Types.string_ ->
  ?medium:Smaws_Lib.Smithy_api.Types.string_ ->
  ?low:Smaws_Lib.Smithy_api.Types.string_ ->
  ?profiles:database_connection_string_profile_list ->
  unit ->
  autonomous_database_connection_strings

val make_autonomous_database :
  ?autonomous_database_id:resource_id_or_arn ->
  ?autonomous_database_arn:resource_arn ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_type:database_type ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_edition:database_edition ->
  ?license_model:license_model ->
  ?open_mode:open_mode ->
  ?permission_level:permission_level ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?net_services_architecture:net_services_architecture ->
  ?available_upgrade_versions:string_list ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?connection_string_details:autonomous_database_connection_strings ->
  ?service_console_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sql_web_developer_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer_contacts:customer_contacts ->
  ?apex_details:autonomous_database_apex ->
  ?standby_db:database_standby_summary ->
  ?local_standby_db:database_standby_summary ->
  ?data_safe_status:data_safe_status ->
  ?database_management_status:database_management_status ->
  ?operations_insights_status:operations_insights_status ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?connection_urls:autonomous_database_connection_urls ->
  ?db_tools_details:database_tool_list ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?resource_pool_leader_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_cpus:integer_list ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?used_data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?actual_used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?allocated_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?in_memory_area_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?odb_network_id:resource_id ->
  ?odb_network_arn:resource_arn ->
  ?private_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?allowlisted_ips:string_list ->
  ?standby_allowlisted_ips:string_list ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_remote_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?local_disaster_recovery_type:disaster_recovery_type ->
  ?role:data_guard_role ->
  ?peer_db_ids:string_list ->
  ?failed_data_recovery_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?remote_disaster_recovery_configuration:disaster_recovery_configuration ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?refreshable_mode:refreshable_mode ->
  ?refreshable_status:refreshable_status ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clone_table_space_list:integer_list ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?total_backup_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?resource_pool_summary:resource_pool_summary ->
  ?encryption_summary:encryption_summary ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_switchover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_failover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh_point:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_next_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_deletion_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_reclamation_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_until_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_long_term_backup_time_stamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_undeleted:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  autonomous_database

val make_autonomous_database_backup :
  ?autonomous_database_backup_id:resource_id ->
  ?autonomous_database_backup_arn:resource_arn ->
  ?autonomous_database_id:resource_id ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_backup_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_automatic:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?time_available_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_started:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_ended:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?type_:autonomous_database_backup_type ->
  unit ->
  autonomous_database_backup

val make_autonomous_database_backup_summary :
  ?autonomous_database_backup_id:resource_id ->
  ?autonomous_database_backup_arn:resource_arn ->
  ?autonomous_database_id:resource_id ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_backup_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_automatic:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?time_available_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_started:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_ended:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?type_:autonomous_database_backup_type ->
  unit ->
  autonomous_database_backup_summary

val make_autonomous_database_character_set_summary :
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_character_set_summary

val make_autonomous_database_summary :
  ?autonomous_database_id:resource_id_or_arn ->
  ?autonomous_database_arn:resource_arn ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_type:database_type ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_edition:database_edition ->
  ?license_model:license_model ->
  ?open_mode:open_mode ->
  ?permission_level:permission_level ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?net_services_architecture:net_services_architecture ->
  ?available_upgrade_versions:string_list ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?connection_string_details:autonomous_database_connection_strings ->
  ?service_console_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sql_web_developer_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer_contacts:customer_contacts ->
  ?apex_details:autonomous_database_apex ->
  ?standby_db:database_standby_summary ->
  ?local_standby_db:database_standby_summary ->
  ?data_safe_status:data_safe_status ->
  ?database_management_status:database_management_status ->
  ?operations_insights_status:operations_insights_status ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?connection_urls:autonomous_database_connection_urls ->
  ?db_tools_details:database_tool_list ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?resource_pool_leader_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_cpus:integer_list ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?used_data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?actual_used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?allocated_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?in_memory_area_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?odb_network_id:resource_id ->
  ?odb_network_arn:resource_arn ->
  ?private_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?allowlisted_ips:string_list ->
  ?standby_allowlisted_ips:string_list ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_remote_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?local_disaster_recovery_type:disaster_recovery_type ->
  ?role:data_guard_role ->
  ?peer_db_ids:string_list ->
  ?failed_data_recovery_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?remote_disaster_recovery_configuration:disaster_recovery_configuration ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?refreshable_mode:refreshable_mode ->
  ?refreshable_status:refreshable_status ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clone_table_space_list:integer_list ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?total_backup_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?resource_pool_summary:resource_pool_summary ->
  ?encryption_summary:encryption_summary ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_switchover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_failover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh_point:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_next_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_deletion_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_reclamation_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_until_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_long_term_backup_time_stamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_undeleted:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  autonomous_database_summary

val make_autonomous_database_peer_summary :
  ?autonomous_database_id:resource_id ->
  ?autonomous_database_arn:resource_arn ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_peer_summary

val make_autonomous_database_version_summary :
  ?db_workload:db_workload ->
  ?details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_version_summary

val make_autonomous_database_wallet_details :
  ?status:autonomous_database_wallet_status ->
  ?time_rotated:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  autonomous_database_wallet_details

val make_autonomous_virtual_machine_summary :
  ?autonomous_virtual_machine_id:resource_id ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vm_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_id:resource_id ->
  ?db_server_display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?client_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_autonomous_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_virtual_machine_summary

val make_aws_encryption_key_configuration_input :
  ?iam_role_arn:role_arn ->
  ?external_id_type:external_id_type ->
  ?kms_key_id:kms_key_id_or_arn ->
  unit ->
  aws_encryption_key_configuration_input

val make_clone_to_refreshable_configuration :
  ?refreshable_mode:refreshable_mode ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?open_mode:open_mode ->
  ?clone_type:clone_type ->
  source_autonomous_database_id:resource_id_or_arn ->
  unit ->
  clone_to_refreshable_configuration

val make_iam_role :
  ?iam_role_arn:role_arn ->
  ?status:iam_role_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?aws_integration:supported_aws_integration ->
  unit ->
  iam_role

val make_month : ?name:month_name -> unit -> month

val make_maintenance_window :
  ?custom_action_timeout_in_mins:Smaws_Lib.Smithy_api.Types.integer ->
  ?days_of_week:days_of_week ->
  ?hours_of_day:hours_of_day ->
  ?is_custom_action_timeout_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?lead_time_in_weeks:Smaws_Lib.Smithy_api.Types.integer ->
  ?months:months ->
  ?patching_mode:patching_mode_type ->
  ?preference:preference_type ->
  ?skip_ru:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?weeks_of_month:weeks_of_month ->
  unit ->
  maintenance_window

val make_cloud_autonomous_vm_cluster :
  ?cloud_autonomous_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_id:resource_id_or_arn ->
  ?odb_network_arn:resource_arn ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?display_name:resource_display_name ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?autonomous_data_storage_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?available_autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?available_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_servers:string_list ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_storage_in_t_bs_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.double ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?maintenance_window:maintenance_window ->
  ?max_acds_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?non_provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisioned_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisioned_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reclaimable_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reserved_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_database_ssl_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_ords_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?iam_roles:iam_role_list ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  cloud_autonomous_vm_cluster

val make_cloud_autonomous_vm_cluster_summary :
  ?cloud_autonomous_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_id:resource_id_or_arn ->
  ?odb_network_arn:resource_arn ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?display_name:resource_display_name ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?autonomous_data_storage_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?available_autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?available_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_servers:string_list ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_storage_in_t_bs_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.double ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?maintenance_window:maintenance_window ->
  ?max_acds_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?non_provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisioned_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisioned_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reclaimable_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reserved_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_database_ssl_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_ords_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?iam_roles:iam_role_list ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  cloud_autonomous_vm_cluster_summary

val make_cloud_autonomous_vm_cluster_resource_details :
  ?cloud_autonomous_vm_cluster_id:resource_id ->
  ?unallocated_adb_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  cloud_autonomous_vm_cluster_resource_details

val make_cloud_exadata_infrastructure :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?activated_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?additional_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_window:maintenance_window ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?max_db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?monthly_db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?total_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?database_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_model:compute_model ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  cloud_exadata_infrastructure

val make_cloud_exadata_infrastructure_summary :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?activated_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?additional_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_window:maintenance_window ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?max_db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?monthly_db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?total_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?database_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_model:compute_model ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  cloud_exadata_infrastructure_summary

val make_cloud_exadata_infrastructure_unallocated_resources :
  ?cloud_autonomous_vm_clusters:cloud_autonomous_vm_cluster_resource_details_list ->
  ?cloud_exadata_infrastructure_display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?local_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?ocpus:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  cloud_exadata_infrastructure_unallocated_resources

val make_db_iorm_config :
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?flash_cache_limit:Smaws_Lib.Smithy_api.Types.string_ ->
  ?share:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  db_iorm_config

val make_exadata_iorm_config :
  ?db_plans:db_iorm_config_list ->
  ?lifecycle_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lifecycle_state:iorm_lifecycle_state ->
  ?objective:objective ->
  unit ->
  exadata_iorm_config

val make_data_collection_options :
  ?is_diagnostics_events_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_health_monitoring_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_incident_logs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  data_collection_options

val make_cloud_vm_cluster :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cluster_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_collection_options:data_collection_options ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_servers:string_list ->
  ?disk_redundancy:disk_redundancy ->
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?iorm_config_cache:exadata_iorm_config ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?last_update_history_entry_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_model:license_model ->
  ?listener_port:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_record_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_ip_ids:string_list ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ssh_public_keys:sensitive_string_list ->
  ?storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vip_ids:string_list ->
  ?odb_network_id:resource_id_or_arn ->
  ?odb_network_arn:resource_arn ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?iam_roles:iam_role_list ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  cloud_vm_cluster

val make_cloud_vm_cluster_summary :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cluster_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_collection_options:data_collection_options ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_servers:string_list ->
  ?disk_redundancy:disk_redundancy ->
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?iorm_config_cache:exadata_iorm_config ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?last_update_history_entry_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_model:license_model ->
  ?listener_port:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_record_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_ip_ids:string_list ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ssh_public_keys:sensitive_string_list ->
  ?storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vip_ids:string_list ->
  ?odb_network_id:resource_id_or_arn ->
  ?odb_network_arn:resource_arn ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?compute_model:compute_model ->
  ?iam_roles:iam_role_list ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  cloud_vm_cluster_summary

val make_create_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_autonomous_database_output

val make_cross_region_disaster_recovery_configuration :
  ?is_replicate_automatic_backups:Smaws_Lib.Smithy_api.Types.boolean_ ->
  source_autonomous_database_arn:arn ->
  remote_disaster_recovery_type:disaster_recovery_type ->
  unit ->
  cross_region_disaster_recovery_configuration

val make_cross_region_data_guard_configuration :
  source_autonomous_database_arn:arn -> unit -> cross_region_data_guard_configuration

val make_point_in_time_restore_configuration :
  ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?use_latest_available_backup_timestamp:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clone_table_space_list:integer_list ->
  source_autonomous_database_id:resource_id_or_arn ->
  clone_type:clone_type ->
  unit ->
  point_in_time_restore_configuration

val make_restore_from_backup_configuration :
  ?clone_table_space_list:integer_list ->
  autonomous_database_backup_id:resource_id_or_arn ->
  clone_type:clone_type ->
  unit ->
  restore_from_backup_configuration

val make_database_clone_configuration :
  source_autonomous_database_id:resource_id_or_arn ->
  clone_type:clone_type ->
  unit ->
  database_clone_configuration

val make_transportable_tablespace :
  ?tts_bundle_url:Smaws_Lib.Smithy_api.Types.string_ -> unit -> transportable_tablespace

val make_create_autonomous_database_input :
  ?odb_network_id:resource_id_or_arn ->
  ?display_name:resource_display_name ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_password:sensitive_string ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_workload:db_workload ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_edition:database_edition ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.double ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_pool_leader_id:resource_id_or_arn ->
  ?resource_pool_summary:resource_pool_summary ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?standby_allowlisted_ips:string_list ->
  ?allowlisted_ips:string_list ->
  ?transportable_tablespace:transportable_tablespace ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?db_tools_details:database_tool_list ->
  ?source:source_type ->
  ?source_configuration:source_configuration ->
  ?encryption_key_provider:encryption_key_provider_input ->
  ?encryption_key_configuration:encryption_key_configuration_input ->
  ?client_token:general_input_string ->
  ?tags:request_tag_map ->
  unit ->
  create_autonomous_database_input

val make_create_autonomous_database_backup_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_autonomous_database_backup_output

val make_create_autonomous_database_backup_input :
  ?display_name:resource_display_name ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?client_token:general_input_string ->
  ?tags:request_tag_map ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  create_autonomous_database_backup_input

val make_create_autonomous_database_wallet_output :
  autonomous_database_wallet_file:autonomous_database_wallet_file ->
  unit ->
  create_autonomous_database_wallet_output

val make_create_autonomous_database_wallet_input :
  ?wallet_type:wallet_type ->
  ?client_token:general_input_string ->
  autonomous_database_id:resource_id_or_arn ->
  password:sensitive_string ->
  unit ->
  create_autonomous_database_wallet_input

val make_create_cloud_autonomous_vm_cluster_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_autonomous_vm_cluster_output

val make_create_cloud_autonomous_vm_cluster_input :
  ?client_token:general_input_string ->
  ?db_servers:string_list ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?maintenance_window:maintenance_window ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?tags:request_tag_map ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  odb_network_id:resource_id_or_arn ->
  display_name:resource_display_name ->
  autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  create_cloud_autonomous_vm_cluster_input

val make_create_cloud_exadata_infrastructure_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_exadata_infrastructure_output

val make_create_cloud_exadata_infrastructure_input :
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:request_tag_map ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?maintenance_window:maintenance_window ->
  ?client_token:general_input_string ->
  ?database_server_type:general_input_string ->
  ?storage_server_type:general_input_string ->
  display_name:resource_display_name ->
  shape:general_input_string ->
  compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  create_cloud_exadata_infrastructure_input

val make_create_cloud_vm_cluster_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_vm_cluster_output

val make_create_cloud_vm_cluster_input :
  ?cluster_name:cluster_name ->
  ?data_collection_options:data_collection_options ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_servers:string_list ->
  ?tags:request_tag_map ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_token:general_input_string ->
  ?scan_listener_port_tcp:Smaws_Lib.Smithy_api.Types.integer ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  display_name:resource_display_name ->
  gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  hostname:hostname ->
  ssh_public_keys:string_list ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  create_cloud_vm_cluster_input

val make_create_odb_network_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_odb_network_output

val make_create_odb_network_input :
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_token:general_input_string ->
  ?s3_access:access ->
  ?zero_etl_access:access ->
  ?sts_access:access ->
  ?kms_access:access ->
  ?s3_policy_document:policy_document ->
  ?sts_policy_document:policy_document ->
  ?kms_policy_document:policy_document ->
  ?cross_region_s3_restore_sources_to_enable:string_list ->
  ?tags:request_tag_map ->
  display_name:resource_display_name ->
  client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_odb_network_input

val make_create_odb_peering_connection_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_odb_peering_connection_output

val make_create_odb_peering_connection_input :
  ?display_name:resource_display_name ->
  ?peer_network_cidrs_to_be_added:peered_cidr_list ->
  ?peer_network_route_table_ids:peer_network_route_table_id_list ->
  ?client_token:general_input_string ->
  ?tags:request_tag_map ->
  odb_network_id:resource_id_or_arn ->
  peer_network_id:resource_id_or_arn ->
  unit ->
  create_odb_peering_connection_input

val make_cross_region_s3_restore_sources_access :
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv4_addresses:string_list ->
  ?status:managed_resource_status ->
  unit ->
  cross_region_s3_restore_sources_access

val make_db_node :
  ?db_node_id:resource_id ->
  ?db_node_arn:resource_arn ->
  ?status:db_node_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_id:resource_id ->
  ?db_system_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?fault_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?host_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_type:db_node_maintenance_type ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?software_storage_size_in_g_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_window_end:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_maintenance_window_start:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?floating_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  db_node

val make_db_node_summary :
  ?db_node_id:resource_id ->
  ?db_node_arn:resource_arn ->
  ?status:db_node_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_id:resource_id ->
  ?db_system_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?fault_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?host_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?maintenance_type:db_node_maintenance_type ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?software_storage_size_in_g_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_window_end:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_maintenance_window_start:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  db_node_summary

val make_db_server_patching_details :
  ?estimated_patch_duration:Smaws_Lib.Smithy_api.Types.integer ->
  ?patching_status:db_server_patching_status ->
  ?time_patching_ended:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_patching_started:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  db_server_patching_details

val make_db_server :
  ?db_server_id:resource_id ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_patching_details:db_server_patching_details ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?vm_cluster_ids:string_list ->
  ?compute_model:compute_model ->
  ?autonomous_vm_cluster_ids:string_list ->
  ?autonomous_virtual_machine_ids:string_list ->
  unit ->
  db_server

val make_db_server_summary :
  ?db_server_id:resource_id ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_patching_details:db_server_patching_details ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?vm_cluster_ids:string_list ->
  ?compute_model:compute_model ->
  ?autonomous_vm_cluster_ids:string_list ->
  ?autonomous_virtual_machine_ids:string_list ->
  unit ->
  db_server_summary

val make_db_system_shape_summary :
  ?available_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_data_storage_per_server_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_db_node_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_memory_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?core_count_increment:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?maximum_node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_db_node_storage_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_memory_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?minimum_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?minimum_node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?runtime_minimum_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape_type:shape_type ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?compute_model:compute_model ->
  ?are_server_types_supported:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  db_system_shape_summary

val make_delete_autonomous_database_output : unit -> unit

val make_delete_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> delete_autonomous_database_input

val make_delete_autonomous_database_backup_output : unit -> unit

val make_delete_autonomous_database_backup_input :
  autonomous_database_backup_id:resource_id -> unit -> delete_autonomous_database_backup_input

val make_delete_cloud_autonomous_vm_cluster_output : unit -> unit

val make_delete_cloud_autonomous_vm_cluster_input :
  cloud_autonomous_vm_cluster_id:resource_id -> unit -> delete_cloud_autonomous_vm_cluster_input

val make_delete_cloud_exadata_infrastructure_output : unit -> unit

val make_delete_cloud_exadata_infrastructure_input :
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  delete_cloud_exadata_infrastructure_input

val make_delete_cloud_vm_cluster_output : unit -> unit

val make_delete_cloud_vm_cluster_input :
  cloud_vm_cluster_id:resource_id -> unit -> delete_cloud_vm_cluster_input

val make_delete_odb_network_output : unit -> unit

val make_delete_odb_network_input :
  odb_network_id:resource_id_or_arn ->
  delete_associated_resources:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  delete_odb_network_input

val make_delete_odb_peering_connection_output : unit -> unit

val make_delete_odb_peering_connection_input :
  odb_peering_connection_id:resource_id_or_arn -> unit -> delete_odb_peering_connection_input

val make_disassociate_iam_role_from_resource_output : unit -> unit

val make_disassociate_iam_role_from_resource_input :
  iam_role_arn:role_arn ->
  aws_integration:supported_aws_integration ->
  resource_arn:arn ->
  unit ->
  disassociate_iam_role_from_resource_input

val make_failover_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  failover_autonomous_database_output

val make_failover_autonomous_database_input :
  ?peer_db_arn:resource_arn ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  failover_autonomous_database_input

val make_get_autonomous_database_output :
  autonomous_database:autonomous_database -> unit -> get_autonomous_database_output

val make_get_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> get_autonomous_database_input

val make_get_autonomous_database_backup_output :
  ?autonomous_database_backup:autonomous_database_backup ->
  unit ->
  get_autonomous_database_backup_output

val make_get_autonomous_database_backup_input :
  autonomous_database_backup_id:resource_id -> unit -> get_autonomous_database_backup_input

val make_get_autonomous_database_wallet_details_output :
  autonomous_database_wallet_details:autonomous_database_wallet_details ->
  unit ->
  get_autonomous_database_wallet_details_output

val make_get_autonomous_database_wallet_details_input :
  autonomous_database_id:resource_id_or_arn -> unit -> get_autonomous_database_wallet_details_input

val make_get_cloud_autonomous_vm_cluster_output :
  ?cloud_autonomous_vm_cluster:cloud_autonomous_vm_cluster ->
  unit ->
  get_cloud_autonomous_vm_cluster_output

val make_get_cloud_autonomous_vm_cluster_input :
  cloud_autonomous_vm_cluster_id:resource_id -> unit -> get_cloud_autonomous_vm_cluster_input

val make_get_cloud_exadata_infrastructure_output :
  ?cloud_exadata_infrastructure:cloud_exadata_infrastructure ->
  unit ->
  get_cloud_exadata_infrastructure_output

val make_get_cloud_exadata_infrastructure_input :
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  get_cloud_exadata_infrastructure_input

val make_get_cloud_exadata_infrastructure_unallocated_resources_output :
  ?cloud_exadata_infrastructure_unallocated_resources:
    cloud_exadata_infrastructure_unallocated_resources ->
  unit ->
  get_cloud_exadata_infrastructure_unallocated_resources_output

val make_get_cloud_exadata_infrastructure_unallocated_resources_input :
  ?db_servers:string_list ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  get_cloud_exadata_infrastructure_unallocated_resources_input

val make_get_cloud_vm_cluster_output :
  ?cloud_vm_cluster:cloud_vm_cluster -> unit -> get_cloud_vm_cluster_output

val make_get_cloud_vm_cluster_input :
  cloud_vm_cluster_id:resource_id -> unit -> get_cloud_vm_cluster_input

val make_get_db_node_output : ?db_node:db_node -> unit -> get_db_node_output

val make_get_db_node_input :
  cloud_vm_cluster_id:resource_id -> db_node_id:resource_id -> unit -> get_db_node_input

val make_get_db_server_output : ?db_server:db_server -> unit -> get_db_server_output

val make_get_db_server_input :
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  db_server_id:resource_id ->
  unit ->
  get_db_server_input

val make_subscription_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ -> unit -> subscription_error

val make_oci_iam_role :
  ?iam_role_arn:role_arn -> ?aws_integration:oci_aws_integration -> unit -> oci_iam_role

val make_oci_identity_domain :
  ?oci_identity_domain_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_identity_domain_resource_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_identity_domain_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_setup_cloud_formation_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_identity_domain

val make_get_oci_onboarding_status_output :
  ?status:oci_onboarding_status ->
  ?existing_tenancy_activation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?new_tenancy_activation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_identity_domain:oci_identity_domain ->
  ?autonomous_database_oci_integration_iam_roles:oci_iam_role_list ->
  ?linked_oci_tenancy_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?linked_oci_compartment_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subscription_errors:subscription_errors ->
  unit ->
  get_oci_onboarding_status_output

val make_get_oci_onboarding_status_input : unit -> unit

val make_kms_access :
  ?status:managed_resource_status ->
  ?ipv4_addresses:string_list ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  kms_access

val make_sts_access :
  ?status:managed_resource_status ->
  ?ipv4_addresses:string_list ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sts_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sts_access

val make_s3_access :
  ?status:managed_resource_status ->
  ?ipv4_addresses:string_list ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?s3_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  s3_access

val make_zero_etl_access :
  ?status:managed_resource_status ->
  ?cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  zero_etl_access

val make_managed_s3_backup_access :
  ?status:managed_resource_status -> ?ipv4_addresses:string_list -> unit -> managed_s3_backup_access

val make_service_network_endpoint :
  ?vpc_endpoint_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_endpoint_type:vpc_endpoint_type ->
  unit ->
  service_network_endpoint

val make_managed_services :
  ?service_network_arn:resource_arn ->
  ?resource_gateway_arn:resource_arn ->
  ?managed_services_ipv4_cidrs:string_list ->
  ?service_network_endpoint:service_network_endpoint ->
  ?managed_s3_backup_access:managed_s3_backup_access ->
  ?zero_etl_access:zero_etl_access ->
  ?s3_access:s3_access ->
  ?sts_access:sts_access ->
  ?kms_access:kms_access ->
  ?cross_region_s3_restore_sources_access:cross_region_s3_restore_sources_access_list ->
  unit ->
  managed_services

val make_oci_dns_forwarding_config :
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_dns_listener_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_dns_forwarding_config

val make_odb_network :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peered_cidrs:string_list ->
  ?oci_network_anchor_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_dns_forwarding_configs:oci_dns_forwarding_config_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?managed_services:managed_services ->
  ?ec2_placement_group_ids:resource_id_list ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  odb_network

val make_get_odb_network_output : ?odb_network:odb_network -> unit -> get_odb_network_output
val make_get_odb_network_input : odb_network_id:resource_id_or_arn -> unit -> get_odb_network_input

val make_odb_peering_connection :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_cidrs:peered_cidr_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  odb_peering_connection

val make_get_odb_peering_connection_output :
  ?odb_peering_connection:odb_peering_connection -> unit -> get_odb_peering_connection_output

val make_get_odb_peering_connection_input :
  odb_peering_connection_id:resource_id_or_arn -> unit -> get_odb_peering_connection_input

val make_gi_version_summary :
  ?version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> gi_version_summary

val make_initialize_service_output : unit -> unit

val make_initialize_service_input :
  ?oci_identity_domain:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> initialize_service_input

val make_list_autonomous_database_backups_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backups:autonomous_database_backup_list ->
  unit ->
  list_autonomous_database_backups_output

val make_list_autonomous_database_backups_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_backup_status ->
  ?type_:autonomous_database_backup_type ->
  autonomous_database_id:resource_id ->
  unit ->
  list_autonomous_database_backups_input

val make_list_autonomous_database_character_sets_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_character_sets:autonomous_database_character_set_list ->
  unit ->
  list_autonomous_database_character_sets_output

val make_list_autonomous_database_character_sets_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?character_set_type:character_set_type ->
  unit ->
  list_autonomous_database_character_sets_input

val make_list_autonomous_database_clones_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_clones:autonomous_database_list ->
  unit ->
  list_autonomous_database_clones_output

val make_list_autonomous_database_clones_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  list_autonomous_database_clones_input

val make_list_autonomous_database_peers_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_peers:autonomous_database_peer_list ->
  unit ->
  list_autonomous_database_peers_output

val make_list_autonomous_database_peers_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  list_autonomous_database_peers_input

val make_list_autonomous_database_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_versions:autonomous_database_version_list ->
  unit ->
  list_autonomous_database_versions_output

val make_list_autonomous_database_versions_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  unit ->
  list_autonomous_database_versions_input

val make_list_autonomous_databases_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_databases:autonomous_database_list ->
  unit ->
  list_autonomous_databases_output

val make_list_autonomous_databases_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_autonomous_databases_input

val make_list_autonomous_virtual_machines_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_virtual_machines:autonomous_virtual_machine_list ->
  unit ->
  list_autonomous_virtual_machines_output

val make_list_autonomous_virtual_machines_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  list_autonomous_virtual_machines_input

val make_list_cloud_autonomous_vm_clusters_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_clusters:cloud_autonomous_vm_cluster_list ->
  unit ->
  list_cloud_autonomous_vm_clusters_output

val make_list_cloud_autonomous_vm_clusters_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  list_cloud_autonomous_vm_clusters_input

val make_list_cloud_exadata_infrastructures_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructures:cloud_exadata_infrastructure_list ->
  unit ->
  list_cloud_exadata_infrastructures_output

val make_list_cloud_exadata_infrastructures_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_cloud_exadata_infrastructures_input

val make_list_cloud_vm_clusters_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_clusters:cloud_vm_cluster_list ->
  unit ->
  list_cloud_vm_clusters_output

val make_list_cloud_vm_clusters_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  list_cloud_vm_clusters_input

val make_list_db_nodes_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_nodes:db_node_list ->
  unit ->
  list_db_nodes_output

val make_list_db_nodes_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  list_db_nodes_input

val make_list_db_servers_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_servers:db_server_list ->
  unit ->
  list_db_servers_output

val make_list_db_servers_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  list_db_servers_input

val make_list_db_system_shapes_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_system_shapes:db_system_shape_list ->
  unit ->
  list_db_system_shapes_output

val make_list_db_system_shapes_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_db_system_shapes_input

val make_list_gi_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  gi_versions:gi_version_list ->
  unit ->
  list_gi_versions_output

val make_list_gi_versions_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_gi_versions_input

val make_odb_network_summary :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peered_cidrs:string_list ->
  ?oci_network_anchor_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_dns_forwarding_configs:oci_dns_forwarding_config_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?managed_services:managed_services ->
  ?ec2_placement_group_ids:resource_id_list ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  odb_network_summary

val make_list_odb_networks_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_networks:odb_network_list ->
  unit ->
  list_odb_networks_output

val make_list_odb_networks_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_odb_networks_input

val make_odb_peering_connection_summary :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_cidrs:peered_cidr_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  odb_peering_connection_summary

val make_list_odb_peering_connections_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connections:odb_peering_connection_list ->
  unit ->
  list_odb_peering_connections_output

val make_list_odb_peering_connections_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_id:resource_id_or_arn ->
  unit ->
  list_odb_peering_connections_input

val make_system_version_summary :
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?system_versions:string_list ->
  unit ->
  system_version_summary

val make_list_system_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  system_versions:system_version_list ->
  unit ->
  list_system_versions_output

val make_list_system_versions_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  shape:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_system_versions_input

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:request_tag_map -> unit -> tag_resource_request

val make_reboot_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  reboot_autonomous_database_output

val make_reboot_autonomous_database_input :
  ?is_online_reboot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  reboot_autonomous_database_input

val make_reboot_db_node_output :
  ?status:db_node_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  reboot_db_node_output

val make_reboot_db_node_input :
  cloud_vm_cluster_id:resource_id -> db_node_id:resource_id -> unit -> reboot_db_node_input

val make_restore_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_autonomous_database_output

val make_restore_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn ->
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  restore_autonomous_database_input

val make_shrink_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  shrink_autonomous_database_output

val make_shrink_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> shrink_autonomous_database_input

val make_start_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  start_autonomous_database_output

val make_start_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> start_autonomous_database_input

val make_start_db_node_output :
  ?status:db_node_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  start_db_node_output

val make_start_db_node_input :
  cloud_vm_cluster_id:resource_id -> db_node_id:resource_id -> unit -> start_db_node_input

val make_stop_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  stop_autonomous_database_output

val make_stop_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> stop_autonomous_database_input

val make_stop_db_node_output :
  ?status:db_node_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  stop_db_node_output

val make_stop_db_node_input :
  cloud_vm_cluster_id:resource_id -> db_node_id:resource_id -> unit -> stop_db_node_input

val make_switchover_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  switchover_autonomous_database_output

val make_switchover_autonomous_database_input :
  ?peer_db_arn:resource_arn ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  switchover_autonomous_database_input

val make_update_autonomous_database_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_autonomous_database_output

val make_update_autonomous_database_input :
  ?admin_password:sensitive_string ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?display_name:resource_display_name ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  ?db_tools_details:database_tool_list ->
  ?database_edition:database_edition ->
  ?license_model:license_model ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_disconnect_peer:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.double ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?open_mode:open_mode ->
  ?permission_level:permission_level ->
  ?refreshable_mode:refreshable_mode ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_db_id:resource_id_or_arn ->
  ?resource_pool_leader_id:resource_id_or_arn ->
  ?resource_pool_summary:resource_pool_summary ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?standby_allowlisted_ips:string_list ->
  ?allowlisted_ips:string_list ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?encryption_key_provider:encryption_key_provider_input ->
  ?encryption_key_configuration:encryption_key_configuration_input ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  update_autonomous_database_input

val make_update_autonomous_database_backup_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_autonomous_database_backup_output

val make_update_autonomous_database_backup_input :
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_database_backup_id:resource_id ->
  unit ->
  update_autonomous_database_backup_input

val make_update_cloud_exadata_infrastructure_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_cloud_exadata_infrastructure_output

val make_update_cloud_exadata_infrastructure_input :
  ?maintenance_window:maintenance_window ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  update_cloud_exadata_infrastructure_input

val make_update_odb_network_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_odb_network_output

val make_update_odb_network_input :
  ?display_name:resource_display_name ->
  ?peered_cidrs_to_be_added:string_list ->
  ?peered_cidrs_to_be_removed:string_list ->
  ?s3_access:access ->
  ?zero_etl_access:access ->
  ?sts_access:access ->
  ?kms_access:access ->
  ?s3_policy_document:policy_document ->
  ?sts_policy_document:policy_document ->
  ?kms_policy_document:policy_document ->
  ?cross_region_s3_restore_sources_to_enable:string_list ->
  ?cross_region_s3_restore_sources_to_disable:string_list ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  update_odb_network_input

val make_update_odb_peering_connection_output :
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_odb_peering_connection_output

val make_update_odb_peering_connection_input :
  ?display_name:resource_display_name ->
  ?peer_network_cidrs_to_be_added:peered_cidr_list ->
  ?peer_network_cidrs_to_be_removed:peered_cidr_list ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  update_odb_peering_connection_input
(** {1:operations Operations} *)

module UpdateOdbPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_odb_peering_connection_input ->
    ( update_odb_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_odb_peering_connection_input ->
    ( update_odb_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings of an Oracle Database\\@Amazon Web Services peering connection. You can \
   update the display name and add or remove CIDR blocks from the peering connection.\n"]

module UpdateOdbNetwork : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_odb_network_input ->
    ( update_odb_network_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_odb_network_input ->
    ( update_odb_network_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates properties of a specified ODB network.\n"]

module UpdateCloudExadataInfrastructure : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cloud_exadata_infrastructure_input ->
    ( update_cloud_exadata_infrastructure_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cloud_exadata_infrastructure_input ->
    ( update_cloud_exadata_infrastructure_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of an Exadata infrastructure resource.\n"]

module UpdateAutonomousDatabaseBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_autonomous_database_backup_input ->
    ( update_autonomous_database_backup_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_autonomous_database_backup_input ->
    ( update_autonomous_database_backup_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of an Autonomous Database backup.\n"]

module UpdateAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_autonomous_database_input ->
    ( update_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_autonomous_database_input ->
    ( update_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the properties of an Autonomous Database.\n"]

module SwitchoverAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    switchover_autonomous_database_input ->
    ( switchover_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    switchover_autonomous_database_input ->
    ( switchover_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Performs a switchover of the specified Autonomous Database to a standby peer database.\n"]

module StopDbNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_node_input ->
    ( stop_db_node_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_node_input ->
    ( stop_db_node_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified DB node in a VM cluster.\n"]

module StopAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_autonomous_database_input ->
    ( stop_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_autonomous_database_input ->
    ( stop_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified Autonomous Database.\n"]

module StartDbNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_node_input ->
    ( start_db_node_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_node_input ->
    ( start_db_node_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified DB node in a VM cluster.\n"]

module StartAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_autonomous_database_input ->
    ( start_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_autonomous_database_input ->
    ( start_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified Autonomous Database.\n"]

module ShrinkAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    shrink_autonomous_database_input ->
    ( shrink_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    shrink_autonomous_database_input ->
    ( shrink_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Shrinks the storage of the specified Autonomous Database to reclaim unused space.\n"]

module RestoreAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_autonomous_database_input ->
    ( restore_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_autonomous_database_input ->
    ( restore_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restores the specified Autonomous Database to a point in time.\n"]

module RebootDbNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_node_input ->
    ( reboot_db_node_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_node_input ->
    ( reboot_db_node_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Reboots the specified DB node in a VM cluster.\n"]

module RebootAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_autonomous_database_input ->
    ( reboot_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_autonomous_database_input ->
    ( reboot_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Reboots the specified Autonomous Database.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Applies tags to the specified resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from the specified resource.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the tags applied to this resource.\n"]

module ListSystemVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_system_versions_input ->
    ( list_system_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_system_versions_input ->
    ( list_system_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the system versions that are available for a VM cluster for the \
   specified [giVersion] and [shape].\n"]

module ListOdbPeeringConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_odb_peering_connections_input ->
    ( list_odb_peering_connections_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_odb_peering_connections_input ->
    ( list_odb_peering_connections_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all ODB peering connections or those associated with a specific ODB network.\n"]

module ListOdbNetworks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_odb_networks_input ->
    ( list_odb_networks_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_odb_networks_input ->
    ( list_odb_networks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the ODB networks owned by your Amazon Web Services account.\n"]

module ListGiVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_gi_versions_input ->
    ( list_gi_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_gi_versions_input ->
    ( list_gi_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about Oracle Grid Infrastructure (GI) software versions that are available \
   for a VM cluster for the specified shape.\n"]

module ListDbSystemShapes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_db_system_shapes_input ->
    ( list_db_system_shapes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_db_system_shapes_input ->
    ( list_db_system_shapes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the shapes that are available for an Exadata infrastructure.\n"]

module ListDbServers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_db_servers_input ->
    ( list_db_servers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_db_servers_input ->
    ( list_db_servers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the database servers that belong to the specified Exadata \
   infrastructure.\n"]

module ListDbNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_db_nodes_input ->
    ( list_db_nodes_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_db_nodes_input ->
    ( list_db_nodes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the DB nodes for the specified VM cluster.\n"]

module ListCloudVmClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_vm_clusters_input ->
    ( list_cloud_vm_clusters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_vm_clusters_input ->
    ( list_cloud_vm_clusters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the VM clusters owned by your Amazon Web Services account or only the \
   ones on the specified Exadata infrastructure.\n"]

module ListCloudExadataInfrastructures : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_exadata_infrastructures_input ->
    ( list_cloud_exadata_infrastructures_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_exadata_infrastructures_input ->
    ( list_cloud_exadata_infrastructures_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the Exadata infrastructures owned by your Amazon Web Services account.\n"]

module ListCloudAutonomousVmClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_autonomous_vm_clusters_input ->
    ( list_cloud_autonomous_vm_clusters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cloud_autonomous_vm_clusters_input ->
    ( list_cloud_autonomous_vm_clusters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all Autonomous VM clusters in a specified Cloud Exadata infrastructure.\n"]

module ListAutonomousVirtualMachines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_virtual_machines_input ->
    ( list_autonomous_virtual_machines_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_virtual_machines_input ->
    ( list_autonomous_virtual_machines_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all Autonomous VMs in an Autonomous VM cluster.\n"]

module ListAutonomousDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_databases_input ->
    ( list_autonomous_databases_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_databases_input ->
    ( list_autonomous_databases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the Autonomous Databases owned by your Amazon Web Services account in \
   the current Amazon Web Services Region.\n"]

module ListAutonomousDatabaseVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_versions_input ->
    ( list_autonomous_database_versions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_versions_input ->
    ( list_autonomous_database_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the available Oracle Database software versions for Autonomous Databases.\n"]

module ListAutonomousDatabasePeers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_peers_input ->
    ( list_autonomous_database_peers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_peers_input ->
    ( list_autonomous_database_peers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the peer databases of the specified Autonomous Database.\n"]

module ListAutonomousDatabaseClones : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_clones_input ->
    ( list_autonomous_database_clones_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_clones_input ->
    ( list_autonomous_database_clones_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the clones of the specified Autonomous Database.\n"]

module ListAutonomousDatabaseCharacterSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_character_sets_input ->
    ( list_autonomous_database_character_sets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_character_sets_input ->
    ( list_autonomous_database_character_sets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the available character sets for Autonomous Databases.\n"]

module ListAutonomousDatabaseBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_backups_input ->
    ( list_autonomous_database_backups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_autonomous_database_backups_input ->
    ( list_autonomous_database_backups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the backups of the specified Autonomous Database.\n"]

module InitializeService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    initialize_service_input ->
    ( initialize_service_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    initialize_service_input ->
    ( initialize_service_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initializes the ODB service for the first time in an account.\n"]

module GetOdbPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_odb_peering_connection_input ->
    ( get_odb_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_odb_peering_connection_input ->
    ( get_odb_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about an ODB peering connection.\n"]

module GetOdbNetwork : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_odb_network_input ->
    ( get_odb_network_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_odb_network_input ->
    ( get_odb_network_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified ODB network.\n"]

module GetOciOnboardingStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_oci_onboarding_status_input ->
    ( get_oci_onboarding_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_oci_onboarding_status_input ->
    ( get_oci_onboarding_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the tenancy activation link and onboarding status for your Amazon Web Services account.\n"]

module GetDbServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_db_server_input ->
    ( get_db_server_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_db_server_input ->
    ( get_db_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified database server.\n"]

module GetDbNode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_db_node_input ->
    ( get_db_node_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_db_node_input ->
    ( get_db_node_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified DB node.\n"]

module GetCloudVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_vm_cluster_input ->
    ( get_cloud_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_vm_cluster_input ->
    ( get_cloud_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified VM cluster.\n"]

module GetCloudExadataInfrastructureUnallocatedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_exadata_infrastructure_unallocated_resources_input ->
    ( get_cloud_exadata_infrastructure_unallocated_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_exadata_infrastructure_unallocated_resources_input ->
    ( get_cloud_exadata_infrastructure_unallocated_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about unallocated resources in a specified Cloud Exadata Infrastructure.\n"]

module GetCloudExadataInfrastructure : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_exadata_infrastructure_input ->
    ( get_cloud_exadata_infrastructure_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_exadata_infrastructure_input ->
    ( get_cloud_exadata_infrastructure_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified Exadata infrastructure.\n"]

module GetCloudAutonomousVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_autonomous_vm_cluster_input ->
    ( get_cloud_autonomous_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cloud_autonomous_vm_cluster_input ->
    ( get_cloud_autonomous_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a specific Autonomous VM cluster.\n"]

module GetAutonomousDatabaseWalletDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_wallet_details_input ->
    ( get_autonomous_database_wallet_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_wallet_details_input ->
    ( get_autonomous_database_wallet_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the wallet details for the specified Autonomous Database.\n"]

module GetAutonomousDatabaseBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_backup_input ->
    ( get_autonomous_database_backup_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_backup_input ->
    ( get_autonomous_database_backup_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a specific Autonomous Database backup.\n"]

module GetAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_input ->
    ( get_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_autonomous_database_input ->
    ( get_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a specific Autonomous Database.\n"]

module FailoverAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_autonomous_database_input ->
    ( failover_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_autonomous_database_input ->
    ( failover_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a failover of the specified Autonomous Database to a standby peer database.\n"]

module DisassociateIamRoleFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_iam_role_from_resource_input ->
    ( disassociate_iam_role_from_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_iam_role_from_resource_input ->
    ( disassociate_iam_role_from_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates an Amazon Web Services Identity and Access Management (IAM) service role from a \
   specified resource to disable Amazon Web Services service integration.\n"]

module DeleteOdbPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_odb_peering_connection_input ->
    ( delete_odb_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_odb_peering_connection_input ->
    ( delete_odb_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an ODB peering connection.\n\n\
  \ When you delete an ODB peering connection, the underlying VPC peering connection is also \
   deleted.\n\
  \ "]

module DeleteOdbNetwork : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_odb_network_input ->
    ( delete_odb_network_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_odb_network_input ->
    ( delete_odb_network_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified ODB network.\n"]

module DeleteCloudVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_vm_cluster_input ->
    ( delete_cloud_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_vm_cluster_input ->
    ( delete_cloud_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified VM cluster.\n"]

module DeleteCloudExadataInfrastructure : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_exadata_infrastructure_input ->
    ( delete_cloud_exadata_infrastructure_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_exadata_infrastructure_input ->
    ( delete_cloud_exadata_infrastructure_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Exadata infrastructure. Before you use this operation, make sure to \
   delete all of the VM clusters that are hosted on this Exadata infrastructure.\n"]

module DeleteCloudAutonomousVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_autonomous_vm_cluster_input ->
    ( delete_cloud_autonomous_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cloud_autonomous_vm_cluster_input ->
    ( delete_cloud_autonomous_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Autonomous VM cluster.\n"]

module DeleteAutonomousDatabaseBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_autonomous_database_backup_input ->
    ( delete_autonomous_database_backup_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_autonomous_database_backup_input ->
    ( delete_autonomous_database_backup_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Autonomous Database backup.\n"]

module DeleteAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_autonomous_database_input ->
    ( delete_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_autonomous_database_input ->
    ( delete_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Autonomous Database.\n"]

module CreateOdbPeeringConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_odb_peering_connection_input ->
    ( create_odb_peering_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_odb_peering_connection_input ->
    ( create_odb_peering_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a peering connection between an ODB network and a VPC.\n\n\
  \ A peering connection enables private connectivity between the networks for application-tier \
   communication.\n\
  \ "]

module CreateOdbNetwork : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_odb_network_input ->
    ( create_odb_network_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_odb_network_input ->
    ( create_odb_network_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an ODB network.\n"]

module CreateCloudVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_vm_cluster_input ->
    ( create_cloud_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_vm_cluster_input ->
    ( create_cloud_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a VM cluster on the specified Exadata infrastructure.\n"]

module CreateCloudExadataInfrastructure : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_exadata_infrastructure_input ->
    ( create_cloud_exadata_infrastructure_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_exadata_infrastructure_input ->
    ( create_cloud_exadata_infrastructure_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Exadata infrastructure.\n"]

module CreateCloudAutonomousVmCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_autonomous_vm_cluster_input ->
    ( create_cloud_autonomous_vm_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cloud_autonomous_vm_cluster_input ->
    ( create_cloud_autonomous_vm_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Autonomous VM cluster in the specified Exadata infrastructure.\n"]

module CreateAutonomousDatabaseWallet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_wallet_input ->
    ( create_autonomous_database_wallet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_wallet_input ->
    ( create_autonomous_database_wallet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new wallet for the specified Autonomous Database.\n"]

module CreateAutonomousDatabaseBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_backup_input ->
    ( create_autonomous_database_backup_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_backup_input ->
    ( create_autonomous_database_backup_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new backup of the specified Autonomous Database.\n"]

module CreateAutonomousDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_input ->
    ( create_autonomous_database_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_autonomous_database_input ->
    ( create_autonomous_database_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Autonomous Database.\n"]

module AssociateIamRoleToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_iam_role_to_resource_input ->
    ( associate_iam_role_to_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_iam_role_to_resource_input ->
    ( associate_iam_role_to_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Amazon Web Services Identity and Access Management (IAM) service role with a \
   specified resource to enable Amazon Web Services service integration.\n"]

(** {1:Serialization and Deserialization} *)
module AcceptMarketplaceRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_marketplace_registration_input ->
    ( accept_marketplace_registration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_marketplace_registration_input ->
    ( accept_marketplace_registration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the Amazon Web Services Marketplace token for your Amazon Web Services account to \
   activate your Oracle Database\\@Amazon Web Services subscription.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
