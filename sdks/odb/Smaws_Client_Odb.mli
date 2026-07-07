(** odb client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_zero_etl_access :
  ?cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:managed_resource_status ->
  unit ->
  zero_etl_access

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_odb_peering_connection_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_odb_peering_connection_output

val make_update_odb_peering_connection_input :
  ?peer_network_cidrs_to_be_removed:peered_cidr_list ->
  ?peer_network_cidrs_to_be_added:peered_cidr_list ->
  ?display_name:resource_display_name ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  update_odb_peering_connection_input

val make_update_odb_network_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_odb_network_output

val make_update_odb_network_input :
  ?cross_region_s3_restore_sources_to_disable:string_list ->
  ?cross_region_s3_restore_sources_to_enable:string_list ->
  ?kms_policy_document:policy_document ->
  ?sts_policy_document:policy_document ->
  ?s3_policy_document:policy_document ->
  ?kms_access:access ->
  ?sts_access:access ->
  ?zero_etl_access:access ->
  ?s3_access:access ->
  ?peered_cidrs_to_be_removed:string_list ->
  ?peered_cidrs_to_be_added:string_list ->
  ?display_name:resource_display_name ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  update_odb_network_input

val make_update_cloud_exadata_infrastructure_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_cloud_exadata_infrastructure_output

val make_day_of_week : ?name:day_of_week_name -> unit -> day_of_week
val make_month : ?name:month_name -> unit -> month

val make_maintenance_window :
  ?weeks_of_month:weeks_of_month ->
  ?skip_ru:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?preference:preference_type ->
  ?patching_mode:patching_mode_type ->
  ?months:months ->
  ?lead_time_in_weeks:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_custom_action_timeout_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?hours_of_day:hours_of_day ->
  ?days_of_week:days_of_week ->
  ?custom_action_timeout_in_mins:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  maintenance_window

val make_update_cloud_exadata_infrastructure_input :
  ?maintenance_window:maintenance_window ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  update_cloud_exadata_infrastructure_input

val make_update_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_autonomous_database_output

val make_database_tool :
  ?max_idle_time_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  database_tool

val make_customer_contact : ?email:sensitive_string -> unit -> customer_contact

val make_scheduled_operation_details :
  ?scheduled_stop_time:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scheduled_start_time:Smaws_Lib.Smithy_api.Types.string_ ->
  day_of_week:day_of_week ->
  unit ->
  scheduled_operation_details

val make_long_term_backup_schedule :
  ?time_of_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?repeat_cadence:repeat_cadence ->
  ?is_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  long_term_backup_schedule

val make_resource_pool_summary :
  ?available_compute_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?total_compute_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_storage_capacity_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?pool_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?pool_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_disabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  resource_pool_summary

val make_aws_encryption_key_configuration_input :
  ?kms_key_id:kms_key_id_or_arn ->
  ?external_id_type:external_id_type ->
  ?iam_role_arn:role_arn ->
  unit ->
  aws_encryption_key_configuration_input

val make_update_autonomous_database_input :
  ?encryption_key_configuration:encryption_key_configuration_input ->
  ?encryption_key_provider:encryption_key_provider_input ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?allowlisted_ips:string_list ->
  ?standby_allowlisted_ips:string_list ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?resource_pool_summary:resource_pool_summary ->
  ?resource_pool_leader_id:resource_id_or_arn ->
  ?peer_db_id:resource_id_or_arn ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?refreshable_mode:refreshable_mode ->
  ?permission_level:permission_level ->
  ?open_mode:open_mode ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.double ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_disconnect_peer:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?license_model:license_model ->
  ?database_edition:database_edition ->
  ?db_tools_details:database_tool_list ->
  ?db_workload:db_workload ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:resource_display_name ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?admin_password:sensitive_string ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  update_autonomous_database_input

val make_update_autonomous_database_backup_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_autonomous_database_backup_output

val make_update_autonomous_database_backup_input :
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_database_backup_id:resource_id ->
  unit ->
  update_autonomous_database_backup_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_transportable_tablespace :
  ?tts_bundle_url:Smaws_Lib.Smithy_api.Types.string_ -> unit -> transportable_tablespace

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:request_tag_map -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_system_version_summary :
  ?system_versions:string_list ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  system_version_summary

val make_switchover_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  switchover_autonomous_database_output

val make_switchover_autonomous_database_input :
  ?peer_db_arn:resource_arn ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  switchover_autonomous_database_input

val make_subscription_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ -> unit -> subscription_error

val make_sts_access :
  ?sts_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv4_addresses:string_list ->
  ?status:managed_resource_status ->
  unit ->
  sts_access

val make_stop_db_node_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:db_node_resource_status ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  stop_db_node_output

val make_stop_db_node_input :
  db_node_id:resource_id -> cloud_vm_cluster_id:resource_id -> unit -> stop_db_node_input

val make_stop_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  stop_autonomous_database_output

val make_stop_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> stop_autonomous_database_input

val make_start_db_node_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:db_node_resource_status ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  start_db_node_output

val make_start_db_node_input :
  db_node_id:resource_id -> cloud_vm_cluster_id:resource_id -> unit -> start_db_node_input

val make_start_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  start_autonomous_database_output

val make_start_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> start_autonomous_database_input

val make_database_clone_configuration :
  clone_type:clone_type ->
  source_autonomous_database_id:resource_id_or_arn ->
  unit ->
  database_clone_configuration

val make_restore_from_backup_configuration :
  ?clone_table_space_list:integer_list ->
  clone_type:clone_type ->
  autonomous_database_backup_id:resource_id_or_arn ->
  unit ->
  restore_from_backup_configuration

val make_point_in_time_restore_configuration :
  ?clone_table_space_list:integer_list ->
  ?use_latest_available_backup_timestamp:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  clone_type:clone_type ->
  source_autonomous_database_id:resource_id_or_arn ->
  unit ->
  point_in_time_restore_configuration

val make_cross_region_data_guard_configuration :
  source_autonomous_database_arn:arn -> unit -> cross_region_data_guard_configuration

val make_cross_region_disaster_recovery_configuration :
  ?is_replicate_automatic_backups:Smaws_Lib.Smithy_api.Types.boolean_ ->
  remote_disaster_recovery_type:disaster_recovery_type ->
  source_autonomous_database_arn:arn ->
  unit ->
  cross_region_disaster_recovery_configuration

val make_clone_to_refreshable_configuration :
  ?clone_type:clone_type ->
  ?open_mode:open_mode ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?refreshable_mode:refreshable_mode ->
  source_autonomous_database_id:resource_id_or_arn ->
  unit ->
  clone_to_refreshable_configuration

val make_shrink_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  shrink_autonomous_database_output

val make_shrink_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> shrink_autonomous_database_input

val make_service_network_endpoint :
  ?vpc_endpoint_type:vpc_endpoint_type ->
  ?vpc_endpoint_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  service_network_endpoint

val make_s3_access :
  ?s3_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv4_addresses:string_list ->
  ?status:managed_resource_status ->
  unit ->
  s3_access

val make_restore_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_autonomous_database_output

val make_restore_autonomous_database_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  restore_autonomous_database_input

val make_reboot_db_node_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:db_node_resource_status ->
  db_node_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  reboot_db_node_output

val make_reboot_db_node_input :
  db_node_id:resource_id -> cloud_vm_cluster_id:resource_id -> unit -> reboot_db_node_input

val make_reboot_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  reboot_autonomous_database_output

val make_reboot_autonomous_database_input :
  ?is_online_reboot:Smaws_Lib.Smithy_api.Types.boolean_ ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  reboot_autonomous_database_input

val make_okv_encryption_key_configuration :
  ?certificate_id:Smaws_Lib.Smithy_api.Types.string_ ->
  okv_uri:Smaws_Lib.Smithy_api.Types.string_ ->
  okv_kms_key:Smaws_Lib.Smithy_api.Types.string_ ->
  directory_name:Smaws_Lib.Smithy_api.Types.string_ ->
  certificate_directory_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  okv_encryption_key_configuration

val make_odb_peering_connection_summary :
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?peer_network_cidrs:peered_cidr_list ->
  ?odb_peering_connection_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  odb_peering_connection_summary

val make_odb_peering_connection :
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?peer_network_cidrs:peered_cidr_list ->
  ?odb_peering_connection_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peer_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_peering_connection_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:resource_id_or_arn ->
  unit ->
  odb_peering_connection

val make_oci_dns_forwarding_config :
  ?oci_dns_listener_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_dns_forwarding_config

val make_managed_s3_backup_access :
  ?ipv4_addresses:string_list -> ?status:managed_resource_status -> unit -> managed_s3_backup_access

val make_kms_access :
  ?kms_policy_document:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv4_addresses:string_list ->
  ?status:managed_resource_status ->
  unit ->
  kms_access

val make_cross_region_s3_restore_sources_access :
  ?status:managed_resource_status ->
  ?ipv4_addresses:string_list ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cross_region_s3_restore_sources_access

val make_managed_services :
  ?cross_region_s3_restore_sources_access:cross_region_s3_restore_sources_access_list ->
  ?kms_access:kms_access ->
  ?sts_access:sts_access ->
  ?s3_access:s3_access ->
  ?zero_etl_access:zero_etl_access ->
  ?managed_s3_backup_access:managed_s3_backup_access ->
  ?service_network_endpoint:service_network_endpoint ->
  ?managed_services_ipv4_cidrs:string_list ->
  ?resource_gateway_arn:resource_arn ->
  ?service_network_arn:resource_arn ->
  unit ->
  managed_services

val make_odb_network_summary :
  ?ec2_placement_group_ids:resource_id_list ->
  ?managed_services:managed_services ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?oci_dns_forwarding_configs:oci_dns_forwarding_config_list ->
  ?oci_vcn_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peered_cidrs:string_list ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  odb_network_summary

val make_odb_network :
  ?ec2_placement_group_ids:resource_id_list ->
  ?managed_services:managed_services ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?oci_dns_forwarding_configs:oci_dns_forwarding_config_list ->
  ?oci_vcn_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_vcn_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_network_anchor_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?peered_cidrs:string_list ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  odb_network

val make_list_tags_for_resource_response :
  ?tags:response_tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_system_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  system_versions:system_version_list ->
  unit ->
  list_system_versions_output

val make_list_system_versions_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  shape:Smaws_Lib.Smithy_api.Types.string_ ->
  gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_system_versions_input

val make_gi_version_summary :
  ?version:Smaws_Lib.Smithy_api.Types.string_ -> unit -> gi_version_summary

val make_list_gi_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  gi_versions:gi_version_list ->
  unit ->
  list_gi_versions_output

val make_list_gi_versions_input :
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_gi_versions_input

val make_db_system_shape_summary :
  ?are_server_types_supported:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?compute_model:compute_model ->
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?shape_type:shape_type ->
  ?shape_family:Smaws_Lib.Smithy_api.Types.string_ ->
  ?runtime_minimum_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?minimum_node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?minimum_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_memory_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_db_node_storage_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?maximum_node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?core_count_increment:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_memory_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_db_node_per_node_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_data_storage_per_server_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  db_system_shape_summary

val make_list_db_system_shapes_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_system_shapes:db_system_shape_list ->
  unit ->
  list_db_system_shapes_output

val make_list_db_system_shapes_input :
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_db_system_shapes_input

val make_autonomous_database_version_summary :
  ?version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  unit ->
  autonomous_database_version_summary

val make_list_autonomous_database_versions_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_versions:autonomous_database_version_list ->
  unit ->
  list_autonomous_database_versions_output

val make_list_autonomous_database_versions_input :
  ?db_workload:db_workload ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_autonomous_database_versions_input

val make_autonomous_database_character_set_summary :
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_character_set_summary

val make_list_autonomous_database_character_sets_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_character_sets:autonomous_database_character_set_list ->
  unit ->
  list_autonomous_database_character_sets_output

val make_list_autonomous_database_character_sets_input :
  ?character_set_type:character_set_type ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_autonomous_database_character_sets_input

val make_initialize_service_output : unit -> unit

val make_initialize_service_input :
  ?oci_identity_domain:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> initialize_service_input

val make_oci_identity_domain :
  ?account_setup_cloud_formation_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?oci_identity_domain_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_identity_domain_resource_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_identity_domain_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_identity_domain

val make_oci_iam_role :
  ?aws_integration:oci_aws_integration -> ?iam_role_arn:role_arn -> unit -> oci_iam_role

val make_get_oci_onboarding_status_output :
  ?subscription_errors:subscription_errors ->
  ?linked_oci_compartment_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?linked_oci_tenancy_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_oci_integration_iam_roles:oci_iam_role_list ->
  ?oci_identity_domain:oci_identity_domain ->
  ?new_tenancy_activation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?existing_tenancy_activation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:oci_onboarding_status ->
  unit ->
  get_oci_onboarding_status_output

val make_get_oci_onboarding_status_input : unit -> unit
val make_disassociate_iam_role_from_resource_output : unit -> unit

val make_disassociate_iam_role_from_resource_input :
  resource_arn:arn ->
  aws_integration:supported_aws_integration ->
  iam_role_arn:role_arn ->
  unit ->
  disassociate_iam_role_from_resource_input

val make_associate_iam_role_to_resource_output : unit -> unit

val make_associate_iam_role_to_resource_input :
  resource_arn:arn ->
  aws_integration:supported_aws_integration ->
  iam_role_arn:role_arn ->
  unit ->
  associate_iam_role_to_resource_input

val make_accept_marketplace_registration_output : unit -> unit

val make_accept_marketplace_registration_input :
  marketplace_registration_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  accept_marketplace_registration_input

val make_oci_encryption_key_configuration :
  vault_id:Smaws_Lib.Smithy_api.Types.string_ ->
  kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  oci_encryption_key_configuration

val make_list_odb_peering_connections_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connections:odb_peering_connection_list ->
  unit ->
  list_odb_peering_connections_output

val make_list_odb_peering_connections_input :
  ?odb_network_id:resource_id_or_arn ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_odb_peering_connections_input

val make_list_odb_networks_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_networks:odb_network_list ->
  unit ->
  list_odb_networks_output

val make_list_odb_networks_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_odb_networks_input

val make_db_server_patching_details :
  ?time_patching_started:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_patching_ended:Smaws_Lib.Smithy_api.Types.string_ ->
  ?patching_status:db_server_patching_status ->
  ?estimated_patch_duration:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  db_server_patching_details

val make_db_server_summary :
  ?autonomous_virtual_machine_ids:string_list ->
  ?autonomous_vm_cluster_ids:string_list ->
  ?compute_model:compute_model ->
  ?vm_cluster_ids:string_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_patching_details:db_server_patching_details ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?db_server_id:resource_id ->
  unit ->
  db_server_summary

val make_list_db_servers_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_servers:db_server_list ->
  unit ->
  list_db_servers_output

val make_list_db_servers_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  list_db_servers_input

val make_db_node_summary :
  ?vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_maintenance_window_start:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_maintenance_window_end:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?software_storage_size_in_g_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_type:db_node_maintenance_type ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?host_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?fault_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_system_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_id:resource_id ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?backup_vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:db_node_resource_status ->
  ?db_node_arn:resource_arn ->
  ?db_node_id:resource_id ->
  unit ->
  db_node_summary

val make_list_db_nodes_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  db_nodes:db_node_list ->
  unit ->
  list_db_nodes_output

val make_list_db_nodes_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  list_db_nodes_input

val make_data_collection_options :
  ?is_incident_logs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_health_monitoring_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_diagnostics_events_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  data_collection_options

val make_db_iorm_config :
  ?share:Smaws_Lib.Smithy_api.Types.integer ->
  ?flash_cache_limit:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  db_iorm_config

val make_exadata_iorm_config :
  ?objective:objective ->
  ?lifecycle_state:iorm_lifecycle_state ->
  ?lifecycle_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_plans:db_iorm_config_list ->
  unit ->
  exadata_iorm_config

val make_iam_role :
  ?aws_integration:supported_aws_integration ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:iam_role_status ->
  ?iam_role_arn:role_arn ->
  unit ->
  iam_role

val make_cloud_vm_cluster_summary :
  ?iam_roles:iam_role_list ->
  ?compute_model:compute_model ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id_or_arn ->
  ?vip_ids:string_list ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?ssh_public_keys:sensitive_string_list ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_ip_ids:string_list ->
  ?scan_dns_record_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?listener_port:Smaws_Lib.Smithy_api.Types.integer ->
  ?license_model:license_model ->
  ?last_update_history_entry_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?iorm_config_cache:exadata_iorm_config ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?disk_redundancy:disk_redundancy ->
  ?db_servers:string_list ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_collection_options:data_collection_options ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cluster_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  cloud_vm_cluster_summary

val make_list_cloud_vm_clusters_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_clusters:cloud_vm_cluster_list ->
  unit ->
  list_cloud_vm_clusters_output

val make_list_cloud_vm_clusters_input :
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_cloud_vm_clusters_input

val make_cloud_exadata_infrastructure_summary :
  ?compute_model:compute_model ->
  ?storage_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?total_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_window:maintenance_window ->
  ?last_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?available_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?additional_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?activated_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cloud_exadata_infrastructure_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  cloud_exadata_infrastructure_summary

val make_list_cloud_exadata_infrastructures_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructures:cloud_exadata_infrastructure_list ->
  unit ->
  list_cloud_exadata_infrastructures_output

val make_list_cloud_exadata_infrastructures_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_cloud_exadata_infrastructures_input

val make_cloud_autonomous_vm_cluster_summary :
  ?iam_roles:iam_role_list ->
  ?total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_ords_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_database_ssl_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?reserved_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reclaimable_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?provisioned_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?provisioned_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?non_provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_acds_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_window:maintenance_window ->
  ?license_model:license_model ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_storage_in_t_bs_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.double ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_servers:string_list ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?cpu_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_model:compute_model ->
  ?available_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?available_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?autonomous_data_storage_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:resource_display_name ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id_or_arn ->
  ?cloud_autonomous_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  cloud_autonomous_vm_cluster_summary

val make_list_cloud_autonomous_vm_clusters_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_clusters:cloud_autonomous_vm_cluster_list ->
  unit ->
  list_cloud_autonomous_vm_clusters_output

val make_list_cloud_autonomous_vm_clusters_input :
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_cloud_autonomous_vm_clusters_input

val make_autonomous_virtual_machine_summary :
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_autonomous_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?client_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_server_display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_id:resource_id ->
  ?vm_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?autonomous_virtual_machine_id:resource_id ->
  unit ->
  autonomous_virtual_machine_summary

val make_list_autonomous_virtual_machines_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_virtual_machines:autonomous_virtual_machine_list ->
  unit ->
  list_autonomous_virtual_machines_output

val make_list_autonomous_virtual_machines_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  list_autonomous_virtual_machines_input

val make_database_connection_string_profile :
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tls_authentication:Smaws_Lib.Smithy_api.Types.string_ ->
  ?syntax_format:Smaws_Lib.Smithy_api.Types.string_ ->
  ?session_mode:Smaws_Lib.Smithy_api.Types.string_ ->
  ?protocol:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_regional:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?host_format:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?consumer_group:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  database_connection_string_profile

val make_autonomous_database_connection_strings :
  ?profiles:database_connection_string_profile_list ->
  ?low:Smaws_Lib.Smithy_api.Types.string_ ->
  ?medium:Smaws_Lib.Smithy_api.Types.string_ ->
  ?high:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dedicated:Smaws_Lib.Smithy_api.Types.string_ ->
  ?all_connection_strings:database_connection_string_map ->
  unit ->
  autonomous_database_connection_strings

val make_autonomous_database_apex :
  ?ords_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?apex_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_apex

val make_database_standby_summary :
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?lag_time_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?availability_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  database_standby_summary

val make_autonomous_database_connection_urls :
  ?sql_dev_web_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?spatial_studio_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ords_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?mongo_db_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?machine_learning_user_management_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?machine_learning_notebook_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?graph_studio_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_transforms_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?apex_url:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  autonomous_database_connection_urls

val make_disaster_recovery_configuration :
  ?time_snapshot_standby_enabled_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?is_snapshot_standby:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_replicate_automatic_backups:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?disaster_recovery_type:disaster_recovery_type ->
  unit ->
  disaster_recovery_configuration

val make_aws_encryption_key_configuration :
  ?kms_key_id:kms_key_id_or_arn ->
  ?external_id_type:external_id_type ->
  ?iam_role_arn:role_arn ->
  unit ->
  aws_encryption_key_configuration

val make_encryption_summary :
  ?encryption_key_configuration:encryption_key_configuration ->
  ?encryption_key_provider:encryption_key_provider ->
  unit ->
  encryption_summary

val make_autonomous_database_summary :
  ?time_undeleted:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_long_term_backup_time_stamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_until_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_reclamation_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_deletion_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_next_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh_point:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_failover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_switchover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?encryption_summary:encryption_summary ->
  ?resource_pool_summary:resource_pool_summary ->
  ?total_backup_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?clone_table_space_list:integer_list ->
  ?is_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?refreshable_status:refreshable_status ->
  ?refreshable_mode:refreshable_mode ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?remote_disaster_recovery_configuration:disaster_recovery_configuration ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?failed_data_recovery_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?peer_db_ids:string_list ->
  ?role:data_guard_role ->
  ?local_disaster_recovery_type:disaster_recovery_type ->
  ?is_remote_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?standby_allowlisted_ips:string_list ->
  ?allowlisted_ips:string_list ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?in_memory_area_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?allocated_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?actual_used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?used_data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?provisionable_cpus:integer_list ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_model:compute_model ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.float_ ->
  ?resource_pool_leader_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?db_tools_details:database_tool_list ->
  ?connection_urls:autonomous_database_connection_urls ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?operations_insights_status:operations_insights_status ->
  ?database_management_status:database_management_status ->
  ?data_safe_status:data_safe_status ->
  ?local_standby_db:database_standby_summary ->
  ?standby_db:database_standby_summary ->
  ?apex_details:autonomous_database_apex ->
  ?customer_contacts:customer_contacts ->
  ?sql_web_developer_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service_console_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?connection_string_details:autonomous_database_connection_strings ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_upgrade_versions:string_list ->
  ?net_services_architecture:net_services_architecture ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?permission_level:permission_level ->
  ?open_mode:open_mode ->
  ?license_model:license_model ->
  ?database_edition:database_edition ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_type:database_type ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?source_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_arn:resource_arn ->
  ?autonomous_database_id:resource_id_or_arn ->
  unit ->
  autonomous_database_summary

val make_list_autonomous_databases_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_databases:autonomous_database_list ->
  unit ->
  list_autonomous_databases_output

val make_list_autonomous_databases_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_autonomous_databases_input

val make_autonomous_database_peer_summary :
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_arn:resource_arn ->
  ?autonomous_database_id:resource_id ->
  unit ->
  autonomous_database_peer_summary

val make_list_autonomous_database_peers_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_peers:autonomous_database_peer_list ->
  unit ->
  list_autonomous_database_peers_output

val make_list_autonomous_database_peers_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  list_autonomous_database_peers_input

val make_list_autonomous_database_clones_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_clones:autonomous_database_list ->
  unit ->
  list_autonomous_database_clones_output

val make_list_autonomous_database_clones_input :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  list_autonomous_database_clones_input

val make_autonomous_database_backup_summary :
  ?type_:autonomous_database_backup_type ->
  ?time_ended:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_started:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_available_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_automatic:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_backup_status ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_id:resource_id ->
  ?autonomous_database_backup_arn:resource_arn ->
  ?autonomous_database_backup_id:resource_id ->
  unit ->
  autonomous_database_backup_summary

val make_list_autonomous_database_backups_output :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backups:autonomous_database_backup_list ->
  unit ->
  list_autonomous_database_backups_output

val make_list_autonomous_database_backups_input :
  ?type_:autonomous_database_backup_type ->
  ?status:autonomous_database_backup_status ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_database_id:resource_id ->
  unit ->
  list_autonomous_database_backups_input

val make_get_odb_peering_connection_output :
  ?odb_peering_connection:odb_peering_connection -> unit -> get_odb_peering_connection_output

val make_get_odb_peering_connection_input :
  odb_peering_connection_id:resource_id_or_arn -> unit -> get_odb_peering_connection_input

val make_get_odb_network_output : ?odb_network:odb_network -> unit -> get_odb_network_output
val make_get_odb_network_input : odb_network_id:resource_id_or_arn -> unit -> get_odb_network_input

val make_db_server :
  ?autonomous_virtual_machine_ids:string_list ->
  ?autonomous_vm_cluster_ids:string_list ->
  ?compute_model:compute_model ->
  ?vm_cluster_ids:string_list ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_patching_details:db_server_patching_details ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?db_server_id:resource_id ->
  unit ->
  db_server

val make_get_db_server_output : ?db_server:db_server -> unit -> get_db_server_output

val make_get_db_server_input :
  db_server_id:resource_id ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  get_db_server_input

val make_db_node :
  ?floating_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_maintenance_window_start:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_maintenance_window_end:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?software_storage_size_in_g_b:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_type:db_node_maintenance_type ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?host_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?fault_domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_system_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_id:resource_id ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?backup_vnic_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_vnic2_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_ip_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_details:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:db_node_resource_status ->
  ?db_node_arn:resource_arn ->
  ?db_node_id:resource_id ->
  unit ->
  db_node

val make_get_db_node_output : ?db_node:db_node -> unit -> get_db_node_output

val make_get_db_node_input :
  db_node_id:resource_id -> cloud_vm_cluster_id:resource_id -> unit -> get_db_node_input

val make_cloud_vm_cluster :
  ?iam_roles:iam_role_list ->
  ?compute_model:compute_model ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id_or_arn ->
  ?vip_ids:string_list ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?ssh_public_keys:sensitive_string_list ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_ip_ids:string_list ->
  ?scan_dns_record_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_dns_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?listener_port:Smaws_Lib.Smithy_api.Types.integer ->
  ?license_model:license_model ->
  ?last_update_history_entry_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?iorm_config_cache:exadata_iorm_config ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?disk_redundancy:disk_redundancy ->
  ?db_servers:string_list ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_collection_options:data_collection_options ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cluster_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_cluster_id:resource_id ->
  unit ->
  cloud_vm_cluster

val make_get_cloud_vm_cluster_output :
  ?cloud_vm_cluster:cloud_vm_cluster -> unit -> get_cloud_vm_cluster_output

val make_get_cloud_vm_cluster_input :
  cloud_vm_cluster_id:resource_id -> unit -> get_cloud_vm_cluster_input

val make_cloud_autonomous_vm_cluster_resource_details :
  ?unallocated_adb_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  cloud_autonomous_vm_cluster_resource_details

val make_cloud_exadata_infrastructure_unallocated_resources :
  ?ocpus:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?local_storage_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?exadata_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?cloud_exadata_infrastructure_display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cloud_autonomous_vm_clusters:cloud_autonomous_vm_cluster_resource_details_list ->
  unit ->
  cloud_exadata_infrastructure_unallocated_resources

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

val make_cloud_exadata_infrastructure :
  ?compute_model:compute_model ->
  ?storage_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_server_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?total_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_storage_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?monthly_db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_memory_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_data_storage_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?max_cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_window:maintenance_window ->
  ?last_maintenance_run_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_server_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?cpu_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?available_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?additional_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?activated_storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?cloud_exadata_infrastructure_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  cloud_exadata_infrastructure

val make_get_cloud_exadata_infrastructure_output :
  ?cloud_exadata_infrastructure:cloud_exadata_infrastructure ->
  unit ->
  get_cloud_exadata_infrastructure_output

val make_get_cloud_exadata_infrastructure_input :
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  get_cloud_exadata_infrastructure_input

val make_cloud_autonomous_vm_cluster :
  ?iam_roles:iam_role_list ->
  ?total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?time_ords_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_database_ssl_certificate_expires:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?shape:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?reserved_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?reclaimable_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?provisioned_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?provisioned_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?non_provisionable_autonomous_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?node_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_acds_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_window:maintenance_window ->
  ?license_model:license_model ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?exadata_storage_in_t_bs_lowest_scaled_value:Smaws_Lib.Smithy_api.Types.double ->
  ?domain:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_servers:string_list ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?cpu_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_model:compute_model ->
  ?available_cpus:Smaws_Lib.Smithy_api.Types.float_ ->
  ?available_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?autonomous_data_storage_percentage:Smaws_Lib.Smithy_api.Types.float_ ->
  ?cloud_exadata_infrastructure_arn:resource_arn ->
  ?cloud_exadata_infrastructure_id:resource_id_or_arn ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:resource_display_name ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id_or_arn ->
  ?cloud_autonomous_vm_cluster_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_cluster_id:resource_id ->
  unit ->
  cloud_autonomous_vm_cluster

val make_get_cloud_autonomous_vm_cluster_output :
  ?cloud_autonomous_vm_cluster:cloud_autonomous_vm_cluster ->
  unit ->
  get_cloud_autonomous_vm_cluster_output

val make_get_cloud_autonomous_vm_cluster_input :
  cloud_autonomous_vm_cluster_id:resource_id -> unit -> get_cloud_autonomous_vm_cluster_input

val make_autonomous_database_wallet_details :
  ?time_rotated:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:autonomous_database_wallet_status ->
  unit ->
  autonomous_database_wallet_details

val make_get_autonomous_database_wallet_details_output :
  autonomous_database_wallet_details:autonomous_database_wallet_details ->
  unit ->
  get_autonomous_database_wallet_details_output

val make_get_autonomous_database_wallet_details_input :
  autonomous_database_id:resource_id_or_arn -> unit -> get_autonomous_database_wallet_details_input

val make_autonomous_database :
  ?time_undeleted:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_long_term_backup_time_stamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_until_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_disaster_recovery_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_reclamation_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_deletion_of_free_autonomous_database:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_auto_refresh_start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_next_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh_point:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_refresh:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_failover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_switchover:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_data_guard_role_changed:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_end:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_maintenance_begin:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_of_last_backup:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?encryption_summary:encryption_summary ->
  ?resource_pool_summary:resource_pool_summary ->
  ?total_backup_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?long_term_backup_schedule:long_term_backup_schedule ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?clone_table_space_list:integer_list ->
  ?is_reconnect_clone_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?auto_refresh_point_lag_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?auto_refresh_frequency_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?refreshable_status:refreshable_status ->
  ?refreshable_mode:refreshable_mode ->
  ?is_refreshable_clone:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?remote_disaster_recovery_configuration:disaster_recovery_configuration ->
  ?local_adg_auto_failover_max_data_loss_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?failed_data_recovery_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?peer_db_ids:string_list ->
  ?role:data_guard_role ->
  ?local_disaster_recovery_type:disaster_recovery_type ->
  ?is_remote_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?standby_allowlisted_ips:string_list ->
  ?allowlisted_ips:string_list ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint:Smaws_Lib.Smithy_api.Types.string_ ->
  ?odb_network_arn:resource_arn ->
  ?odb_network_id:resource_id ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?in_memory_area_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?allocated_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?actual_used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?used_data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?used_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?provisionable_cpus:integer_list ->
  ?memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_model:compute_model ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.float_ ->
  ?resource_pool_leader_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?db_tools_details:database_tool_list ->
  ?connection_urls:autonomous_database_connection_urls ->
  ?maintenance_target_component:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?operations_insights_status:operations_insights_status ->
  ?database_management_status:database_management_status ->
  ?data_safe_status:data_safe_status ->
  ?local_standby_db:database_standby_summary ->
  ?standby_db:database_standby_summary ->
  ?apex_details:autonomous_database_apex ->
  ?customer_contacts:customer_contacts ->
  ?sql_web_developer_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?service_console_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?connection_string_details:autonomous_database_connection_strings ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.integer ->
  ?available_upgrade_versions:string_list ->
  ?net_services_architecture:net_services_architecture ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?permission_level:permission_level ->
  ?open_mode:open_mode ->
  ?license_model:license_model ->
  ?database_edition:database_edition ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_workload:db_workload ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?database_type:database_type ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?source_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?oci_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?percent_progress:Smaws_Lib.Smithy_api.Types.float_ ->
  ?oci_resource_anchor_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_arn:resource_arn ->
  ?autonomous_database_id:resource_id_or_arn ->
  unit ->
  autonomous_database

val make_get_autonomous_database_output :
  autonomous_database:autonomous_database -> unit -> get_autonomous_database_output

val make_get_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> get_autonomous_database_input

val make_autonomous_database_backup :
  ?type_:autonomous_database_backup_type ->
  ?time_ended:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_started:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?time_available_till:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?is_automatic:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_backup_status ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ocid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?autonomous_database_id:resource_id ->
  ?autonomous_database_backup_arn:resource_arn ->
  ?autonomous_database_backup_id:resource_id ->
  unit ->
  autonomous_database_backup

val make_get_autonomous_database_backup_output :
  ?autonomous_database_backup:autonomous_database_backup ->
  unit ->
  get_autonomous_database_backup_output

val make_get_autonomous_database_backup_input :
  autonomous_database_backup_id:resource_id -> unit -> get_autonomous_database_backup_input

val make_failover_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  failover_autonomous_database_output

val make_failover_autonomous_database_input :
  ?peer_db_arn:resource_arn ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  failover_autonomous_database_input

val make_delete_odb_peering_connection_output : unit -> unit

val make_delete_odb_peering_connection_input :
  odb_peering_connection_id:resource_id_or_arn -> unit -> delete_odb_peering_connection_input

val make_delete_odb_network_output : unit -> unit

val make_delete_odb_network_input :
  delete_associated_resources:Smaws_Lib.Smithy_api.Types.boolean_ ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  delete_odb_network_input

val make_delete_cloud_vm_cluster_output : unit -> unit

val make_delete_cloud_vm_cluster_input :
  cloud_vm_cluster_id:resource_id -> unit -> delete_cloud_vm_cluster_input

val make_delete_cloud_exadata_infrastructure_output : unit -> unit

val make_delete_cloud_exadata_infrastructure_input :
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  delete_cloud_exadata_infrastructure_input

val make_delete_cloud_autonomous_vm_cluster_output : unit -> unit

val make_delete_cloud_autonomous_vm_cluster_input :
  cloud_autonomous_vm_cluster_id:resource_id -> unit -> delete_cloud_autonomous_vm_cluster_input

val make_delete_autonomous_database_output : unit -> unit

val make_delete_autonomous_database_input :
  autonomous_database_id:resource_id_or_arn -> unit -> delete_autonomous_database_input

val make_delete_autonomous_database_backup_output : unit -> unit

val make_delete_autonomous_database_backup_input :
  autonomous_database_backup_id:resource_id -> unit -> delete_autonomous_database_backup_input

val make_create_odb_peering_connection_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_peering_connection_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_odb_peering_connection_output

val make_create_odb_peering_connection_input :
  ?tags:request_tag_map ->
  ?client_token:general_input_string ->
  ?peer_network_route_table_ids:peer_network_route_table_id_list ->
  ?peer_network_cidrs_to_be_added:peered_cidr_list ->
  ?display_name:resource_display_name ->
  peer_network_id:resource_id_or_arn ->
  odb_network_id:resource_id_or_arn ->
  unit ->
  create_odb_peering_connection_input

val make_create_odb_network_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  odb_network_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_odb_network_output

val make_create_odb_network_input :
  ?tags:request_tag_map ->
  ?cross_region_s3_restore_sources_to_enable:string_list ->
  ?kms_policy_document:policy_document ->
  ?sts_policy_document:policy_document ->
  ?s3_policy_document:policy_document ->
  ?kms_access:access ->
  ?sts_access:access ->
  ?zero_etl_access:access ->
  ?s3_access:access ->
  ?client_token:general_input_string ->
  ?default_dns_prefix:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?backup_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  client_subnet_cidr:Smaws_Lib.Smithy_api.Types.string_ ->
  display_name:resource_display_name ->
  unit ->
  create_odb_network_input

val make_create_cloud_vm_cluster_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_vm_cluster_output

val make_create_cloud_vm_cluster_input :
  ?scan_listener_port_tcp:Smaws_Lib.Smithy_api.Types.integer ->
  ?client_token:general_input_string ->
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?system_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?memory_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?license_model:license_model ->
  ?is_sparse_diskgroup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_backup_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:request_tag_map ->
  ?db_servers:string_list ->
  ?db_node_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  ?data_collection_options:data_collection_options ->
  ?cluster_name:cluster_name ->
  odb_network_id:resource_id_or_arn ->
  ssh_public_keys:string_list ->
  hostname:hostname ->
  gi_version:Smaws_Lib.Smithy_api.Types.string_ ->
  display_name:resource_display_name ->
  cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  create_cloud_vm_cluster_input

val make_create_cloud_exadata_infrastructure_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_exadata_infrastructure_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_exadata_infrastructure_output

val make_create_cloud_exadata_infrastructure_input :
  ?storage_server_type:general_input_string ->
  ?database_server_type:general_input_string ->
  ?client_token:general_input_string ->
  ?maintenance_window:maintenance_window ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?tags:request_tag_map ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  storage_count:Smaws_Lib.Smithy_api.Types.integer ->
  compute_count:Smaws_Lib.Smithy_api.Types.integer ->
  shape:general_input_string ->
  display_name:resource_display_name ->
  unit ->
  create_cloud_exadata_infrastructure_input

val make_create_cloud_autonomous_vm_cluster_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  cloud_autonomous_vm_cluster_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_cloud_autonomous_vm_cluster_output

val make_create_cloud_autonomous_vm_cluster_input :
  ?time_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:request_tag_map ->
  ?scan_listener_port_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?scan_listener_port_non_tls:Smaws_Lib.Smithy_api.Types.integer ->
  ?maintenance_window:maintenance_window ->
  ?license_model:license_model ->
  ?is_mtls_enabled_vm_cluster:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_servers:string_list ->
  ?client_token:general_input_string ->
  total_container_databases:Smaws_Lib.Smithy_api.Types.integer ->
  memory_per_oracle_compute_unit_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  cpu_core_count_per_node:Smaws_Lib.Smithy_api.Types.integer ->
  autonomous_data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.double ->
  display_name:resource_display_name ->
  odb_network_id:resource_id_or_arn ->
  cloud_exadata_infrastructure_id:resource_id_or_arn ->
  unit ->
  create_cloud_autonomous_vm_cluster_input

val make_create_autonomous_database_wallet_output :
  autonomous_database_wallet_file:autonomous_database_wallet_file ->
  unit ->
  create_autonomous_database_wallet_output

val make_create_autonomous_database_wallet_input :
  ?client_token:general_input_string ->
  ?wallet_type:wallet_type ->
  password:sensitive_string ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  create_autonomous_database_wallet_input

val make_create_autonomous_database_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:autonomous_database_resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_autonomous_database_output

val make_create_autonomous_database_input :
  ?tags:request_tag_map ->
  ?client_token:general_input_string ->
  ?encryption_key_configuration:encryption_key_configuration_input ->
  ?encryption_key_provider:encryption_key_provider_input ->
  ?source_configuration:source_configuration ->
  ?source:source_type ->
  ?db_tools_details:database_tool_list ->
  ?is_mtls_connection_required:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_local_data_guard_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_backup_retention_locked:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?transportable_tablespace:transportable_tablespace ->
  ?allowlisted_ips:string_list ->
  ?standby_allowlisted_ips:string_list ->
  ?scheduled_operations:scheduled_operation_details_list ->
  ?resource_pool_summary:resource_pool_summary ->
  ?resource_pool_leader_id:resource_id_or_arn ->
  ?private_endpoint_label:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_endpoint_ip:Smaws_Lib.Smithy_api.Types.string_ ->
  ?customer_contacts_to_send_to_oc_i:customer_contacts ->
  ?cpu_core_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?byol_compute_count_limit:Smaws_Lib.Smithy_api.Types.double ->
  ?backup_retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?autonomous_maintenance_schedule_type:autonomous_maintenance_schedule_type ->
  ?standby_allowlisted_ips_source:standby_allowlisted_ips_source ->
  ?database_edition:database_edition ->
  ?db_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ncharacter_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?character_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?license_model:license_model ->
  ?is_auto_scaling_for_storage_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?is_auto_scaling_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?db_workload:db_workload ->
  ?data_storage_size_in_g_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?data_storage_size_in_t_bs:Smaws_Lib.Smithy_api.Types.integer ->
  ?compute_count:Smaws_Lib.Smithy_api.Types.double ->
  ?admin_password:sensitive_string ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?display_name:resource_display_name ->
  ?odb_network_id:resource_id_or_arn ->
  unit ->
  create_autonomous_database_input

val make_create_autonomous_database_backup_output :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:resource_status ->
  ?display_name:Smaws_Lib.Smithy_api.Types.string_ ->
  autonomous_database_backup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_autonomous_database_backup_output

val make_create_autonomous_database_backup_input :
  ?tags:request_tag_map ->
  ?client_token:general_input_string ->
  ?retention_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?display_name:resource_display_name ->
  autonomous_database_id:resource_id_or_arn ->
  unit ->
  create_autonomous_database_backup_input
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
