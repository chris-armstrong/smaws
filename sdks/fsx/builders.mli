open Types

val make_windows_fsrm_configuration :
  ?event_log_destination:general_ar_n ->
  fsrm_service_enabled:flag ->
  unit ->
  windows_fsrm_configuration

val make_self_managed_active_directory_attributes :
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  ?dns_ips:dns_ips ->
  ?user_name:directory_user_name ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?domain_name:active_directory_fully_qualified_name ->
  unit ->
  self_managed_active_directory_attributes

val make_alias : ?lifecycle:alias_lifecycle -> ?name:alternate_dns_name -> unit -> alias

val make_windows_audit_log_configuration :
  ?audit_log_destination:general_ar_n ->
  file_share_access_audit_log_level:windows_access_audit_log_level ->
  file_access_audit_log_level:windows_access_audit_log_level ->
  unit ->
  windows_audit_log_configuration

val make_disk_iops_configuration :
  ?iops:iops -> ?mode:disk_iops_configuration_mode -> unit -> disk_iops_configuration

val make_windows_file_system_configuration :
  ?fsrm_configuration:windows_fsrm_configuration ->
  ?preferred_file_server_ipv6:ip_address ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?audit_log_configuration:windows_audit_log_configuration ->
  ?aliases:aliases ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?maintenance_operations_in_progress:file_system_maintenance_operations ->
  ?throughput_capacity:megabytes_per_second ->
  ?preferred_file_server_ip:ip_address ->
  ?preferred_subnet_id:subnet_id ->
  ?remote_administration_endpoint:dns_name ->
  ?deployment_type:windows_deployment_type ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_attributes ->
  ?active_directory_id:directory_id ->
  unit ->
  windows_file_system_configuration

val make_windows_audit_log_create_configuration :
  ?audit_log_destination:general_ar_n ->
  file_share_access_audit_log_level:windows_access_audit_log_level ->
  file_access_audit_log_level:windows_access_audit_log_level ->
  unit ->
  windows_audit_log_create_configuration

val make_tiering_policy :
  ?name:tiering_policy_name -> ?cooling_period:cooling_period -> unit -> tiering_policy

val make_autocommit_period :
  ?value:autocommit_period_value -> type_:autocommit_period_type -> unit -> autocommit_period

val make_retention_period :
  ?value:retention_period_value -> type_:retention_period_type -> unit -> retention_period

val make_snaplock_retention_period :
  maximum_retention:retention_period ->
  minimum_retention:retention_period ->
  default_retention:retention_period ->
  unit ->
  snaplock_retention_period

val make_snaplock_configuration :
  ?volume_append_mode_enabled:flag ->
  ?snaplock_type:snaplock_type ->
  ?retention_period:snaplock_retention_period ->
  ?privileged_delete:privileged_delete ->
  ?autocommit_period:autocommit_period ->
  ?audit_log_volume:flag ->
  unit ->
  snaplock_configuration

val make_aggregate_configuration :
  ?total_constituents:total_constituents ->
  ?aggregates:aggregates ->
  unit ->
  aggregate_configuration

val make_ontap_volume_configuration :
  ?size_in_bytes:volume_capacity_bytes ->
  ?aggregate_configuration:aggregate_configuration ->
  ?volume_style:volume_style ->
  ?snaplock_configuration:snaplock_configuration ->
  ?copy_tags_to_backups:flag ->
  ?snapshot_policy:snapshot_policy ->
  ?ontap_volume_type:ontap_volume_type ->
  ?uui_d:uui_d ->
  ?tiering_policy:tiering_policy ->
  ?storage_virtual_machine_root:flag ->
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  ?storage_efficiency_enabled:flag ->
  ?size_in_megabytes:volume_capacity ->
  ?security_style:security_style ->
  ?junction_path:junction_path ->
  ?flex_cache_endpoint_type:flex_cache_endpoint_type ->
  unit ->
  ontap_volume_configuration

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_lifecycle_transition_reason : ?message:error_message -> unit -> lifecycle_transition_reason
val make_file_system_failure_details : ?message:error_message -> unit -> file_system_failure_details

val make_data_repository_failure_details :
  ?message:error_message -> unit -> data_repository_failure_details

val make_data_repository_configuration :
  ?failure_details:data_repository_failure_details ->
  ?auto_import_policy:auto_import_policy_type ->
  ?imported_file_chunk_size:megabytes ->
  ?export_path:archive_path ->
  ?import_path:archive_path ->
  ?lifecycle:data_repository_lifecycle ->
  unit ->
  data_repository_configuration

val make_lustre_log_configuration :
  ?destination:general_ar_n ->
  level:lustre_access_audit_log_level ->
  unit ->
  lustre_log_configuration

val make_lustre_root_squash_configuration :
  ?no_squash_nids:lustre_no_squash_nids ->
  ?root_squash:lustre_root_squash ->
  unit ->
  lustre_root_squash_configuration

val make_file_system_lustre_metadata_configuration :
  ?iops:metadata_iops ->
  mode:metadata_configuration_mode ->
  unit ->
  file_system_lustre_metadata_configuration

val make_lustre_read_cache_configuration :
  ?size_gi_b:storage_capacity ->
  ?sizing_mode:lustre_read_cache_sizing_mode ->
  unit ->
  lustre_read_cache_configuration

val make_lustre_file_system_configuration :
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?efa_enabled:flag ->
  ?metadata_configuration:file_system_lustre_metadata_configuration ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?log_configuration:lustre_log_configuration ->
  ?data_compression_type:data_compression_type ->
  ?drive_cache_type:drive_cache_type ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?mount_name:lustre_file_system_mount_name ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?deployment_type:lustre_deployment_type ->
  ?data_repository_configuration:data_repository_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  unit ->
  lustre_file_system_configuration

val make_file_system_endpoint :
  ?ipv6_addresses:ontap_endpoint_ip_addresses ->
  ?ip_addresses:ontap_endpoint_ip_addresses ->
  ?dns_name:dns_name ->
  unit ->
  file_system_endpoint

val make_file_system_endpoints :
  ?management:file_system_endpoint ->
  ?intercluster:file_system_endpoint ->
  unit ->
  file_system_endpoints

val make_ontap_file_system_configuration :
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?ha_pairs:ha_pairs ->
  ?fsx_admin_password:admin_password ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?throughput_capacity:megabytes_per_second ->
  ?route_table_ids:route_table_ids ->
  ?preferred_subnet_id:subnet_id ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?endpoints:file_system_endpoints ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?deployment_type:ontap_deployment_type ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  unit ->
  ontap_file_system_configuration

val make_open_zfs_read_cache_configuration :
  ?size_gi_b:storage_capacity ->
  ?sizing_mode:open_zfs_read_cache_sizing_mode ->
  unit ->
  open_zfs_read_cache_configuration

val make_open_zfs_file_system_configuration :
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  ?endpoint_ipv6_address:ip_address ->
  ?endpoint_ip_address:ip_address ->
  ?route_table_ids:route_table_ids ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?preferred_subnet_id:subnet_id ->
  ?root_volume_id:volume_id ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?throughput_capacity:megabytes_per_second ->
  ?deployment_type:open_zfs_deployment_type ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?copy_tags_to_volumes:flag ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  unit ->
  open_zfs_file_system_configuration

val make_administrative_action_failure_details :
  ?message:error_message -> unit -> administrative_action_failure_details

val make_open_zfs_origin_snapshot_configuration :
  ?copy_strategy:open_zfs_copy_strategy ->
  ?snapshot_ar_n:resource_ar_n ->
  unit ->
  open_zfs_origin_snapshot_configuration

val make_open_zfs_client_configuration :
  options:open_zfs_nfs_export_options ->
  clients:open_zfs_clients ->
  unit ->
  open_zfs_client_configuration

val make_open_zfs_nfs_export :
  client_configurations:open_zfs_client_configurations -> unit -> open_zfs_nfs_export

val make_open_zfs_user_or_group_quota :
  storage_capacity_quota_gi_b:integer_no_max ->
  id:integer_no_max ->
  type_:open_zfs_quota_type ->
  unit ->
  open_zfs_user_or_group_quota

val make_open_zfs_volume_configuration :
  ?copy_strategy:open_zfs_copy_strategy ->
  ?destination_snapshot:snapshot_id ->
  ?source_snapshot_ar_n:resource_ar_n ->
  ?delete_intermediate_data:flag ->
  ?delete_cloned_volumes:flag ->
  ?delete_intermediate_snaphots:flag ->
  ?restore_to_snapshot:snapshot_id ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?read_only:read_only ->
  ?origin_snapshot:open_zfs_origin_snapshot_configuration ->
  ?copy_tags_to_snapshots:flag ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?storage_capacity_quota_gi_b:integer_no_max ->
  ?storage_capacity_reservation_gi_b:integer_no_max ->
  ?volume_path:volume_path ->
  ?parent_volume_id:volume_id ->
  unit ->
  open_zfs_volume_configuration

val make_administrative_action :
  ?message:error_message ->
  ?remaining_transfer_bytes:remaining_transfer_bytes ->
  ?total_transfer_bytes:total_transfer_bytes ->
  ?target_snapshot_values:snapshot ->
  ?target_volume_values:volume ->
  ?failure_details:administrative_action_failure_details ->
  ?target_file_system_values:file_system ->
  ?status:status ->
  ?request_time:request_time ->
  ?progress_percent:progress_percent ->
  ?administrative_action_type:administrative_action_type ->
  unit ->
  administrative_action

val make_file_system :
  ?network_type:network_type ->
  ?open_zfs_configuration:open_zfs_file_system_configuration ->
  ?file_system_type_version:file_system_type_version ->
  ?ontap_configuration:ontap_file_system_configuration ->
  ?administrative_actions:administrative_actions ->
  ?lustre_configuration:lustre_file_system_configuration ->
  ?windows_configuration:windows_file_system_configuration ->
  ?tags:tags ->
  ?resource_ar_n:resource_ar_n ->
  ?kms_key_id:kms_key_id ->
  ?dns_name:dns_name ->
  ?network_interface_ids:network_interface_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?storage_type:storage_type ->
  ?storage_capacity:storage_capacity ->
  ?failure_details:file_system_failure_details ->
  ?lifecycle:file_system_lifecycle ->
  ?file_system_type:file_system_type ->
  ?file_system_id:file_system_id ->
  ?creation_time:creation_time ->
  ?owner_id:aws_account_id ->
  unit ->
  file_system

val make_snapshot :
  ?administrative_actions:administrative_actions ->
  ?tags:tags ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?lifecycle:snapshot_lifecycle ->
  ?creation_time:creation_time ->
  ?volume_id:volume_id ->
  ?name:snapshot_name ->
  ?snapshot_id:snapshot_id ->
  ?resource_ar_n:resource_ar_n ->
  unit ->
  snapshot

val make_volume :
  ?open_zfs_configuration:open_zfs_volume_configuration ->
  ?administrative_actions:administrative_actions ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?volume_type:volume_type ->
  ?volume_id:volume_id ->
  ?tags:tags ->
  ?resource_ar_n:resource_ar_n ->
  ?ontap_configuration:ontap_volume_configuration ->
  ?name:volume_name ->
  ?lifecycle:volume_lifecycle ->
  ?file_system_id:file_system_id ->
  ?creation_time:creation_time ->
  unit ->
  volume

val make_volume_filter :
  ?values:volume_filter_values -> ?name:volume_filter_name -> unit -> volume_filter

val make_update_volume_response : ?volume:volume -> unit -> update_volume_response

val make_update_snaplock_configuration :
  ?volume_append_mode_enabled:flag ->
  ?retention_period:snaplock_retention_period ->
  ?privileged_delete:privileged_delete ->
  ?autocommit_period:autocommit_period ->
  ?audit_log_volume:flag ->
  unit ->
  update_snaplock_configuration

val make_update_ontap_volume_configuration :
  ?size_in_bytes:volume_capacity_bytes ->
  ?snaplock_configuration:update_snaplock_configuration ->
  ?copy_tags_to_backups:flag ->
  ?snapshot_policy:snapshot_policy ->
  ?tiering_policy:tiering_policy ->
  ?storage_efficiency_enabled:flag ->
  ?size_in_megabytes:volume_capacity ->
  ?security_style:security_style ->
  ?junction_path:junction_path ->
  unit ->
  update_ontap_volume_configuration

val make_update_open_zfs_volume_configuration :
  ?read_only:read_only ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?storage_capacity_quota_gi_b:integer_no_max_from_negative_one ->
  ?storage_capacity_reservation_gi_b:integer_no_max_from_negative_one ->
  unit ->
  update_open_zfs_volume_configuration

val make_update_volume_request :
  ?open_zfs_configuration:update_open_zfs_volume_configuration ->
  ?name:volume_name ->
  ?ontap_configuration:update_ontap_volume_configuration ->
  ?client_request_token:client_request_token ->
  volume_id:volume_id ->
  unit ->
  update_volume_request

val make_self_managed_active_directory_configuration_updates :
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?domain_name:active_directory_fully_qualified_name ->
  ?dns_ips:dns_ips ->
  ?password:directory_password ->
  ?user_name:directory_user_name ->
  unit ->
  self_managed_active_directory_configuration_updates

val make_update_svm_active_directory_configuration :
  ?net_bios_name:net_bios_alias ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration_updates ->
  unit ->
  update_svm_active_directory_configuration

val make_svm_active_directory_configuration :
  ?self_managed_active_directory_configuration:self_managed_active_directory_attributes ->
  ?net_bios_name:net_bios_alias ->
  unit ->
  svm_active_directory_configuration

val make_svm_endpoint :
  ?ipv6_addresses:ontap_endpoint_ip_addresses ->
  ?ip_addresses:ontap_endpoint_ip_addresses ->
  ?dns_name:dns_name ->
  unit ->
  svm_endpoint

val make_svm_endpoints :
  ?smb:svm_endpoint ->
  ?nfs:svm_endpoint ->
  ?management:svm_endpoint ->
  ?iscsi:svm_endpoint ->
  unit ->
  svm_endpoints

val make_storage_virtual_machine :
  ?root_volume_security_style:storage_virtual_machine_root_volume_security_style ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?tags:tags ->
  ?uui_d:uui_d ->
  ?subtype:storage_virtual_machine_subtype ->
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  ?resource_ar_n:resource_ar_n ->
  ?name:storage_virtual_machine_name ->
  ?lifecycle:storage_virtual_machine_lifecycle ->
  ?file_system_id:file_system_id ->
  ?endpoints:svm_endpoints ->
  ?creation_time:creation_time ->
  ?active_directory_configuration:svm_active_directory_configuration ->
  unit ->
  storage_virtual_machine

val make_update_storage_virtual_machine_response :
  ?storage_virtual_machine:storage_virtual_machine ->
  unit ->
  update_storage_virtual_machine_response

val make_update_storage_virtual_machine_request :
  ?svm_admin_password:admin_password ->
  ?client_request_token:client_request_token ->
  ?active_directory_configuration:update_svm_active_directory_configuration ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  update_storage_virtual_machine_request

val make_update_snapshot_response : ?snapshot:snapshot -> unit -> update_snapshot_response

val make_update_snapshot_request :
  ?client_request_token:client_request_token ->
  snapshot_id:snapshot_id ->
  name:snapshot_name ->
  unit ->
  update_snapshot_request

val make_update_shared_vpc_configuration_response :
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  unit ->
  update_shared_vpc_configuration_response

val make_update_shared_vpc_configuration_request :
  ?client_request_token:client_request_token ->
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  unit ->
  update_shared_vpc_configuration_request

val make_update_file_system_windows_configuration :
  ?fsrm_configuration:windows_fsrm_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?audit_log_configuration:windows_audit_log_create_configuration ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration_updates ->
  ?throughput_capacity:megabytes_per_second ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?weekly_maintenance_start_time:weekly_time ->
  unit ->
  update_file_system_windows_configuration

val make_update_file_system_response :
  ?file_system:file_system -> unit -> update_file_system_response

val make_lustre_log_create_configuration :
  ?destination:general_ar_n ->
  level:lustre_access_audit_log_level ->
  unit ->
  lustre_log_create_configuration

val make_update_file_system_lustre_metadata_configuration :
  ?mode:metadata_configuration_mode ->
  ?iops:metadata_iops ->
  unit ->
  update_file_system_lustre_metadata_configuration

val make_update_file_system_lustre_configuration :
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?metadata_configuration:update_file_system_lustre_metadata_configuration ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?log_configuration:lustre_log_create_configuration ->
  ?data_compression_type:data_compression_type ->
  ?auto_import_policy:auto_import_policy_type ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?weekly_maintenance_start_time:weekly_time ->
  unit ->
  update_file_system_lustre_configuration

val make_update_file_system_ontap_configuration :
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?ha_pairs:ha_pairs ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?remove_route_table_ids:route_table_ids ->
  ?add_route_table_ids:route_table_ids ->
  ?throughput_capacity:megabytes_per_second ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?fsx_admin_password:admin_password ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  unit ->
  update_file_system_ontap_configuration

val make_update_file_system_open_zfs_configuration :
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  ?remove_route_table_ids:route_table_ids ->
  ?add_route_table_ids:route_table_ids ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?throughput_capacity:megabytes_per_second ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?copy_tags_to_volumes:flag ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  unit ->
  update_file_system_open_zfs_configuration

val make_update_file_system_request :
  ?network_type:network_type ->
  ?file_system_type_version:file_system_type_version ->
  ?storage_type:storage_type ->
  ?open_zfs_configuration:update_file_system_open_zfs_configuration ->
  ?ontap_configuration:update_file_system_ontap_configuration ->
  ?lustre_configuration:update_file_system_lustre_configuration ->
  ?windows_configuration:update_file_system_windows_configuration ->
  ?storage_capacity:storage_capacity ->
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  update_file_system_request

val make_file_cache_failure_details : ?message:error_message -> unit -> file_cache_failure_details

val make_file_cache_lustre_metadata_configuration :
  storage_capacity:metadata_storage_capacity -> unit -> file_cache_lustre_metadata_configuration

val make_file_cache_lustre_configuration :
  ?log_configuration:lustre_log_configuration ->
  ?metadata_configuration:file_cache_lustre_metadata_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?mount_name:lustre_file_system_mount_name ->
  ?deployment_type:file_cache_lustre_deployment_type ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  unit ->
  file_cache_lustre_configuration

val make_file_cache :
  ?data_repository_association_ids:data_repository_association_ids ->
  ?lustre_configuration:file_cache_lustre_configuration ->
  ?resource_ar_n:resource_ar_n ->
  ?kms_key_id:kms_key_id ->
  ?dns_name:dns_name ->
  ?network_interface_ids:network_interface_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?storage_capacity:storage_capacity ->
  ?failure_details:file_cache_failure_details ->
  ?lifecycle:file_cache_lifecycle ->
  ?file_cache_type_version:file_system_type_version ->
  ?file_cache_type:file_cache_type ->
  ?file_cache_id:file_cache_id ->
  ?creation_time:creation_time ->
  ?owner_id:aws_account_id ->
  unit ->
  file_cache

val make_update_file_cache_response : ?file_cache:file_cache -> unit -> update_file_cache_response

val make_update_file_cache_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time -> unit -> update_file_cache_lustre_configuration

val make_update_file_cache_request :
  ?lustre_configuration:update_file_cache_lustre_configuration ->
  ?client_request_token:client_request_token ->
  file_cache_id:file_cache_id ->
  unit ->
  update_file_cache_request

val make_auto_import_policy : ?events:event_types -> unit -> auto_import_policy
val make_auto_export_policy : ?events:event_types -> unit -> auto_export_policy

val make_s3_data_repository_configuration :
  ?auto_export_policy:auto_export_policy ->
  ?auto_import_policy:auto_import_policy ->
  unit ->
  s3_data_repository_configuration

val make_nfs_data_repository_configuration :
  ?auto_export_policy:auto_export_policy ->
  ?dns_ips:repository_dns_ips ->
  version:nfs_version ->
  unit ->
  nfs_data_repository_configuration

val make_data_repository_association :
  ?nf_s:nfs_data_repository_configuration ->
  ?data_repository_subdirectories:sub_directories_paths ->
  ?file_cache_path:namespace ->
  ?file_cache_id:file_cache_id ->
  ?creation_time:creation_time ->
  ?tags:tags ->
  ?s3:s3_data_repository_configuration ->
  ?imported_file_chunk_size:megabytes ->
  ?batch_import_meta_data_on_create:batch_import_meta_data_on_create ->
  ?data_repository_path:archive_path ->
  ?file_system_path:namespace ->
  ?failure_details:data_repository_failure_details ->
  ?lifecycle:data_repository_lifecycle ->
  ?file_system_id:file_system_id ->
  ?resource_ar_n:resource_ar_n ->
  ?association_id:data_repository_association_id ->
  unit ->
  data_repository_association

val make_update_data_repository_association_response :
  ?association:data_repository_association -> unit -> update_data_repository_association_response

val make_update_data_repository_association_request :
  ?s3:s3_data_repository_configuration ->
  ?imported_file_chunk_size:megabytes ->
  ?client_request_token:client_request_token ->
  association_id:data_repository_association_id ->
  unit ->
  update_data_repository_association_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_ar_n:resource_ar_n -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tags -> resource_ar_n:resource_ar_n -> unit -> tag_resource_request

val make_storage_virtual_machine_filter :
  ?values:storage_virtual_machine_filter_values ->
  ?name:storage_virtual_machine_filter_name ->
  unit ->
  storage_virtual_machine_filter

val make_start_misconfigured_state_recovery_response :
  ?file_system:file_system -> unit -> start_misconfigured_state_recovery_response

val make_start_misconfigured_state_recovery_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  start_misconfigured_state_recovery_request

val make_snapshot_filter :
  ?values:snapshot_filter_values -> ?name:snapshot_filter_name -> unit -> snapshot_filter

val make_self_managed_active_directory_configuration :
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  ?password:directory_password ->
  ?user_name:directory_user_name ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  dns_ips:dns_ips ->
  domain_name:active_directory_fully_qualified_name ->
  unit ->
  self_managed_active_directory_configuration

val make_s3_access_point_vpc_configuration :
  ?vpc_id:vpc_id -> unit -> s3_access_point_vpc_configuration

val make_open_zfs_posix_file_system_user :
  ?secondary_gids:file_system_secondary_gi_ds ->
  gid:file_system_gi_d ->
  uid:file_system_ui_d ->
  unit ->
  open_zfs_posix_file_system_user

val make_open_zfs_file_system_identity :
  ?posix_user:open_zfs_posix_file_system_user ->
  type_:open_zfs_file_system_user_type ->
  unit ->
  open_zfs_file_system_identity

val make_s3_access_point_open_zfs_configuration :
  ?file_system_identity:open_zfs_file_system_identity ->
  ?volume_id:volume_id ->
  unit ->
  s3_access_point_open_zfs_configuration

val make_ontap_unix_file_system_user :
  name:ontap_file_system_user_name -> unit -> ontap_unix_file_system_user

val make_ontap_windows_file_system_user :
  name:ontap_file_system_user_name -> unit -> ontap_windows_file_system_user

val make_ontap_file_system_identity :
  ?windows_user:ontap_windows_file_system_user ->
  ?unix_user:ontap_unix_file_system_user ->
  type_:ontap_file_system_user_type ->
  unit ->
  ontap_file_system_identity

val make_s3_access_point_ontap_configuration :
  ?file_system_identity:ontap_file_system_identity ->
  ?volume_id:volume_id ->
  unit ->
  s3_access_point_ontap_configuration

val make_s3_access_point_attachments_filter :
  ?values:s3_access_point_attachments_filter_values ->
  ?name:s3_access_point_attachments_filter_name ->
  unit ->
  s3_access_point_attachments_filter

val make_s3_access_point :
  ?vpc_configuration:s3_access_point_vpc_configuration ->
  ?alias:s3_access_point_alias ->
  ?resource_ar_n:general_ar_n ->
  unit ->
  s3_access_point

val make_s3_access_point_attachment :
  ?s3_access_point:s3_access_point ->
  ?ontap_configuration:s3_access_point_ontap_configuration ->
  ?open_zfs_configuration:s3_access_point_open_zfs_configuration ->
  ?type_:s3_access_point_attachment_type ->
  ?name:s3_access_point_attachment_name ->
  ?creation_time:creation_time ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?lifecycle:s3_access_point_attachment_lifecycle ->
  unit ->
  s3_access_point_attachment

val make_restore_volume_from_snapshot_response :
  ?administrative_actions:administrative_actions ->
  ?lifecycle:volume_lifecycle ->
  ?volume_id:volume_id ->
  unit ->
  restore_volume_from_snapshot_response

val make_restore_volume_from_snapshot_request :
  ?options:restore_open_zfs_volume_options ->
  ?client_request_token:client_request_token ->
  snapshot_id:snapshot_id ->
  volume_id:volume_id ->
  unit ->
  restore_volume_from_snapshot_request

val make_release_file_system_nfs_v3_locks_response :
  ?file_system:file_system -> unit -> release_file_system_nfs_v3_locks_response

val make_release_file_system_nfs_v3_locks_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  release_file_system_nfs_v3_locks_request

val make_duration_since_last_access :
  ?value:value -> ?unit_:unit_ -> unit -> duration_since_last_access

val make_release_configuration :
  ?duration_since_last_access:duration_since_last_access -> unit -> release_configuration

val make_open_zfs_create_root_volume_configuration :
  ?read_only:read_only ->
  ?copy_tags_to_snapshots:flag ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  unit ->
  open_zfs_create_root_volume_configuration

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_ar_n:resource_ar_n ->
  unit ->
  list_tags_for_resource_request

val make_filter : ?values:filter_values -> ?name:filter_name -> unit -> filter

val make_file_cache_nfs_configuration :
  ?dns_ips:repository_dns_ips -> version:nfs_version -> unit -> file_cache_nfs_configuration

val make_file_cache_data_repository_association :
  ?nf_s:file_cache_nfs_configuration ->
  ?data_repository_subdirectories:sub_directories_paths ->
  data_repository_path:archive_path ->
  file_cache_path:namespace ->
  unit ->
  file_cache_data_repository_association

val make_file_cache_creating :
  ?data_repository_association_ids:data_repository_association_ids ->
  ?lustre_configuration:file_cache_lustre_configuration ->
  ?copy_tags_to_data_repository_associations:copy_tags_to_data_repository_associations ->
  ?tags:tags ->
  ?resource_ar_n:resource_ar_n ->
  ?kms_key_id:kms_key_id ->
  ?dns_name:dns_name ->
  ?network_interface_ids:network_interface_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?storage_capacity:storage_capacity ->
  ?failure_details:file_cache_failure_details ->
  ?lifecycle:file_cache_lifecycle ->
  ?file_cache_type_version:file_system_type_version ->
  ?file_cache_type:file_cache_type ->
  ?file_cache_id:file_cache_id ->
  ?creation_time:creation_time ->
  ?owner_id:aws_account_id ->
  unit ->
  file_cache_creating

val make_disassociate_file_system_aliases_response :
  ?aliases:aliases -> unit -> disassociate_file_system_aliases_response

val make_disassociate_file_system_aliases_request :
  ?client_request_token:client_request_token ->
  aliases:alternate_dns_names ->
  file_system_id:file_system_id ->
  unit ->
  disassociate_file_system_aliases_request

val make_detach_and_delete_s3_access_point_response :
  ?name:s3_access_point_attachment_name ->
  ?lifecycle:s3_access_point_attachment_lifecycle ->
  unit ->
  detach_and_delete_s3_access_point_response

val make_detach_and_delete_s3_access_point_request :
  ?client_request_token:client_request_token ->
  name:s3_access_point_attachment_name ->
  unit ->
  detach_and_delete_s3_access_point_request

val make_describe_volumes_response :
  ?next_token:next_token -> ?volumes:volumes -> unit -> describe_volumes_response

val make_describe_volumes_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:volume_filters ->
  ?volume_ids:volume_ids ->
  unit ->
  describe_volumes_request

val make_describe_storage_virtual_machines_response :
  ?next_token:next_token ->
  ?storage_virtual_machines:storage_virtual_machines ->
  unit ->
  describe_storage_virtual_machines_response

val make_describe_storage_virtual_machines_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:storage_virtual_machine_filters ->
  ?storage_virtual_machine_ids:storage_virtual_machine_ids ->
  unit ->
  describe_storage_virtual_machines_request

val make_describe_snapshots_response :
  ?next_token:next_token -> ?snapshots:snapshots -> unit -> describe_snapshots_response

val make_describe_snapshots_request :
  ?include_shared:include_shared ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:snapshot_filters ->
  ?snapshot_ids:snapshot_ids ->
  unit ->
  describe_snapshots_request

val make_describe_shared_vpc_configuration_response :
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  unit ->
  describe_shared_vpc_configuration_response

val make_describe_shared_vpc_configuration_request : unit -> unit

val make_describe_s3_access_point_attachments_response :
  ?next_token:next_token ->
  ?s3_access_point_attachments:s3_access_point_attachments ->
  unit ->
  describe_s3_access_point_attachments_response

val make_describe_s3_access_point_attachments_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:s3_access_point_attachments_filters ->
  ?names:s3_access_point_attachment_names ->
  unit ->
  describe_s3_access_point_attachments_request

val make_describe_file_systems_response :
  ?next_token:next_token -> ?file_systems:file_systems -> unit -> describe_file_systems_response

val make_describe_file_systems_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?file_system_ids:file_system_ids ->
  unit ->
  describe_file_systems_request

val make_describe_file_system_aliases_response :
  ?next_token:next_token -> ?aliases:aliases -> unit -> describe_file_system_aliases_response

val make_describe_file_system_aliases_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  describe_file_system_aliases_request

val make_describe_file_caches_response :
  ?next_token:next_token -> ?file_caches:file_caches -> unit -> describe_file_caches_response

val make_describe_file_caches_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?file_cache_ids:file_cache_ids ->
  unit ->
  describe_file_caches_request

val make_data_repository_task_failure_details :
  ?message:error_message -> unit -> data_repository_task_failure_details

val make_data_repository_task_status :
  ?released_capacity:released_capacity ->
  ?last_updated_time:last_updated_time ->
  ?failed_count:failed_count ->
  ?succeeded_count:succeeded_count ->
  ?total_count:total_count ->
  unit ->
  data_repository_task_status

val make_completion_report :
  ?scope:report_scope ->
  ?format:report_format ->
  ?path:archive_path ->
  enabled:flag ->
  unit ->
  completion_report

val make_data_repository_task :
  ?release_configuration:release_configuration ->
  ?file_cache_id:file_cache_id ->
  ?capacity_to_release:capacity_to_release ->
  ?report:completion_report ->
  ?status:data_repository_task_status ->
  ?failure_details:data_repository_task_failure_details ->
  ?paths:data_repository_task_paths ->
  ?file_system_id:file_system_id ->
  ?tags:tags ->
  ?resource_ar_n:resource_ar_n ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  creation_time:creation_time ->
  type_:data_repository_task_type ->
  lifecycle:data_repository_task_lifecycle ->
  task_id:task_id ->
  unit ->
  data_repository_task

val make_describe_data_repository_tasks_response :
  ?next_token:next_token ->
  ?data_repository_tasks:data_repository_tasks ->
  unit ->
  describe_data_repository_tasks_response

val make_data_repository_task_filter :
  ?values:data_repository_task_filter_values ->
  ?name:data_repository_task_filter_name ->
  unit ->
  data_repository_task_filter

val make_describe_data_repository_tasks_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:data_repository_task_filters ->
  ?task_ids:task_ids ->
  unit ->
  describe_data_repository_tasks_request

val make_describe_data_repository_associations_response :
  ?next_token:next_token ->
  ?associations:data_repository_associations ->
  unit ->
  describe_data_repository_associations_response

val make_describe_data_repository_associations_request :
  ?next_token:next_token ->
  ?max_results:limited_max_results ->
  ?filters:filters ->
  ?association_ids:data_repository_association_ids ->
  unit ->
  describe_data_repository_associations_request

val make_backup_failure_details : ?message:error_message -> unit -> backup_failure_details

val make_active_directory_backup_attributes :
  ?resource_ar_n:resource_ar_n ->
  ?active_directory_id:directory_id ->
  ?domain_name:active_directory_fully_qualified_name ->
  unit ->
  active_directory_backup_attributes

val make_backup :
  ?size_in_bytes:size_in_bytes ->
  ?volume:volume ->
  ?resource_type:resource_type ->
  ?source_backup_region:region ->
  ?source_backup_id:backup_id ->
  ?owner_id:aws_account_id ->
  ?directory_information:active_directory_backup_attributes ->
  ?tags:tags ->
  ?resource_ar_n:resource_ar_n ->
  ?kms_key_id:kms_key_id ->
  ?progress_percent:progress_percent ->
  ?failure_details:backup_failure_details ->
  file_system:file_system ->
  creation_time:creation_time ->
  type_:backup_type ->
  lifecycle:backup_lifecycle ->
  backup_id:backup_id ->
  unit ->
  backup

val make_describe_backups_response :
  ?next_token:next_token -> ?backups:backups -> unit -> describe_backups_response

val make_describe_backups_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  ?backup_ids:backup_ids ->
  unit ->
  describe_backups_request

val make_delete_volume_ontap_response :
  ?final_backup_tags:tags -> ?final_backup_id:backup_id -> unit -> delete_volume_ontap_response

val make_delete_volume_response :
  ?ontap_response:delete_volume_ontap_response ->
  ?lifecycle:volume_lifecycle ->
  ?volume_id:volume_id ->
  unit ->
  delete_volume_response

val make_delete_volume_ontap_configuration :
  ?bypass_snaplock_enterprise_retention:flag ->
  ?final_backup_tags:tags ->
  ?skip_final_backup:flag ->
  unit ->
  delete_volume_ontap_configuration

val make_delete_volume_open_zfs_configuration :
  ?options:delete_open_zfs_volume_options -> unit -> delete_volume_open_zfs_configuration

val make_delete_volume_request :
  ?open_zfs_configuration:delete_volume_open_zfs_configuration ->
  ?ontap_configuration:delete_volume_ontap_configuration ->
  ?client_request_token:client_request_token ->
  volume_id:volume_id ->
  unit ->
  delete_volume_request

val make_delete_storage_virtual_machine_response :
  ?lifecycle:storage_virtual_machine_lifecycle ->
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  delete_storage_virtual_machine_response

val make_delete_storage_virtual_machine_request :
  ?client_request_token:client_request_token ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  delete_storage_virtual_machine_request

val make_delete_snapshot_response :
  ?lifecycle:snapshot_lifecycle -> ?snapshot_id:snapshot_id -> unit -> delete_snapshot_response

val make_delete_snapshot_request :
  ?client_request_token:client_request_token ->
  snapshot_id:snapshot_id ->
  unit ->
  delete_snapshot_request

val make_delete_file_system_windows_response :
  ?final_backup_tags:tags ->
  ?final_backup_id:backup_id ->
  unit ->
  delete_file_system_windows_response

val make_delete_file_system_windows_configuration :
  ?final_backup_tags:tags ->
  ?skip_final_backup:flag ->
  unit ->
  delete_file_system_windows_configuration

val make_delete_file_system_lustre_response :
  ?final_backup_tags:tags ->
  ?final_backup_id:backup_id ->
  unit ->
  delete_file_system_lustre_response

val make_delete_file_system_open_zfs_response :
  ?final_backup_tags:tags ->
  ?final_backup_id:backup_id ->
  unit ->
  delete_file_system_open_zfs_response

val make_delete_file_system_response :
  ?open_zfs_response:delete_file_system_open_zfs_response ->
  ?lustre_response:delete_file_system_lustre_response ->
  ?windows_response:delete_file_system_windows_response ->
  ?lifecycle:file_system_lifecycle ->
  ?file_system_id:file_system_id ->
  unit ->
  delete_file_system_response

val make_delete_file_system_lustre_configuration :
  ?final_backup_tags:tags ->
  ?skip_final_backup:flag ->
  unit ->
  delete_file_system_lustre_configuration

val make_delete_file_system_open_zfs_configuration :
  ?options:delete_file_system_open_zfs_options ->
  ?final_backup_tags:tags ->
  ?skip_final_backup:flag ->
  unit ->
  delete_file_system_open_zfs_configuration

val make_delete_file_system_request :
  ?open_zfs_configuration:delete_file_system_open_zfs_configuration ->
  ?lustre_configuration:delete_file_system_lustre_configuration ->
  ?windows_configuration:delete_file_system_windows_configuration ->
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  delete_file_system_request

val make_delete_file_cache_response :
  ?lifecycle:file_cache_lifecycle ->
  ?file_cache_id:file_cache_id ->
  unit ->
  delete_file_cache_response

val make_delete_file_cache_request :
  ?client_request_token:client_request_token ->
  file_cache_id:file_cache_id ->
  unit ->
  delete_file_cache_request

val make_delete_data_repository_association_response :
  ?delete_data_in_file_system:delete_data_in_file_system ->
  ?lifecycle:data_repository_lifecycle ->
  ?association_id:data_repository_association_id ->
  unit ->
  delete_data_repository_association_response

val make_delete_data_repository_association_request :
  ?delete_data_in_file_system:delete_data_in_file_system ->
  ?client_request_token:client_request_token ->
  association_id:data_repository_association_id ->
  unit ->
  delete_data_repository_association_request

val make_delete_backup_response :
  ?lifecycle:backup_lifecycle -> ?backup_id:backup_id -> unit -> delete_backup_response

val make_delete_backup_request :
  ?client_request_token:client_request_token -> backup_id:backup_id -> unit -> delete_backup_request

val make_create_volume_response : ?volume:volume -> unit -> create_volume_response

val make_create_snaplock_configuration :
  ?volume_append_mode_enabled:flag ->
  ?retention_period:snaplock_retention_period ->
  ?privileged_delete:privileged_delete ->
  ?autocommit_period:autocommit_period ->
  ?audit_log_volume:flag ->
  snaplock_type:snaplock_type ->
  unit ->
  create_snaplock_configuration

val make_create_aggregate_configuration :
  ?constituents_per_aggregate:aggregate_list_multiplier ->
  ?aggregates:aggregates ->
  unit ->
  create_aggregate_configuration

val make_create_ontap_volume_configuration :
  ?size_in_bytes:volume_capacity_bytes ->
  ?aggregate_configuration:create_aggregate_configuration ->
  ?volume_style:volume_style ->
  ?snaplock_configuration:create_snaplock_configuration ->
  ?copy_tags_to_backups:flag ->
  ?snapshot_policy:snapshot_policy ->
  ?ontap_volume_type:input_ontap_volume_type ->
  ?tiering_policy:tiering_policy ->
  ?storage_efficiency_enabled:flag ->
  ?size_in_megabytes:volume_capacity ->
  ?security_style:security_style ->
  ?junction_path:junction_path ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  create_ontap_volume_configuration

val make_create_open_zfs_origin_snapshot_configuration :
  copy_strategy:open_zfs_copy_strategy ->
  snapshot_ar_n:resource_ar_n ->
  unit ->
  create_open_zfs_origin_snapshot_configuration

val make_create_open_zfs_volume_configuration :
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?read_only:read_only ->
  ?origin_snapshot:create_open_zfs_origin_snapshot_configuration ->
  ?copy_tags_to_snapshots:flag ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?storage_capacity_quota_gi_b:integer_no_max_from_negative_one ->
  ?storage_capacity_reservation_gi_b:integer_no_max_from_negative_one ->
  parent_volume_id:volume_id ->
  unit ->
  create_open_zfs_volume_configuration

val make_create_volume_request :
  ?open_zfs_configuration:create_open_zfs_volume_configuration ->
  ?tags:tags ->
  ?ontap_configuration:create_ontap_volume_configuration ->
  ?client_request_token:client_request_token ->
  name:volume_name ->
  volume_type:volume_type ->
  unit ->
  create_volume_request

val make_create_volume_from_backup_response :
  ?volume:volume -> unit -> create_volume_from_backup_response

val make_create_volume_from_backup_request :
  ?tags:tags ->
  ?ontap_configuration:create_ontap_volume_configuration ->
  ?client_request_token:client_request_token ->
  name:volume_name ->
  backup_id:backup_id ->
  unit ->
  create_volume_from_backup_request

val make_create_svm_active_directory_configuration :
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration ->
  net_bios_name:net_bios_alias ->
  unit ->
  create_svm_active_directory_configuration

val make_create_storage_virtual_machine_response :
  ?storage_virtual_machine:storage_virtual_machine ->
  unit ->
  create_storage_virtual_machine_response

val make_create_storage_virtual_machine_request :
  ?root_volume_security_style:storage_virtual_machine_root_volume_security_style ->
  ?tags:tags ->
  ?svm_admin_password:admin_password ->
  ?client_request_token:client_request_token ->
  ?active_directory_configuration:create_svm_active_directory_configuration ->
  name:storage_virtual_machine_name ->
  file_system_id:file_system_id ->
  unit ->
  create_storage_virtual_machine_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?tags:tags ->
  ?client_request_token:client_request_token ->
  volume_id:volume_id ->
  name:snapshot_name ->
  unit ->
  create_snapshot_request

val make_create_file_system_windows_configuration :
  ?fsrm_configuration:windows_fsrm_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?audit_log_configuration:windows_audit_log_create_configuration ->
  ?aliases:alternate_dns_names ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?preferred_subnet_id:subnet_id ->
  ?deployment_type:windows_deployment_type ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration ->
  ?active_directory_id:directory_id ->
  throughput_capacity:megabytes_per_second ->
  unit ->
  create_file_system_windows_configuration

val make_create_file_system_response :
  ?file_system:file_system -> unit -> create_file_system_response

val make_create_file_system_lustre_metadata_configuration :
  ?iops:metadata_iops ->
  mode:metadata_configuration_mode ->
  unit ->
  create_file_system_lustre_metadata_configuration

val make_create_file_system_lustre_configuration :
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?metadata_configuration:create_file_system_lustre_metadata_configuration ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?log_configuration:lustre_log_create_configuration ->
  ?efa_enabled:flag ->
  ?data_compression_type:data_compression_type ->
  ?drive_cache_type:drive_cache_type ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?auto_import_policy:auto_import_policy_type ->
  ?deployment_type:lustre_deployment_type ->
  ?imported_file_chunk_size:megabytes ->
  ?export_path:archive_path ->
  ?import_path:archive_path ->
  ?weekly_maintenance_start_time:weekly_time ->
  unit ->
  create_file_system_lustre_configuration

val make_create_file_system_ontap_configuration :
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?ha_pairs:ha_pairs ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?throughput_capacity:megabytes_per_second ->
  ?route_table_ids:route_table_ids ->
  ?preferred_subnet_id:subnet_id ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?fsx_admin_password:admin_password ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  deployment_type:ontap_deployment_type ->
  unit ->
  create_file_system_ontap_configuration

val make_create_file_system_open_zfs_configuration :
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  ?route_table_ids:route_table_ids ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?preferred_subnet_id:subnet_id ->
  ?root_volume_configuration:open_zfs_create_root_volume_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?copy_tags_to_volumes:flag ->
  ?copy_tags_to_backups:flag ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  throughput_capacity:megabytes_per_second ->
  deployment_type:open_zfs_deployment_type ->
  unit ->
  create_file_system_open_zfs_configuration

val make_create_file_system_request :
  ?network_type:network_type ->
  ?open_zfs_configuration:create_file_system_open_zfs_configuration ->
  ?file_system_type_version:file_system_type_version ->
  ?ontap_configuration:create_file_system_ontap_configuration ->
  ?lustre_configuration:create_file_system_lustre_configuration ->
  ?windows_configuration:create_file_system_windows_configuration ->
  ?kms_key_id:kms_key_id ->
  ?tags:tags ->
  ?security_group_ids:security_group_ids ->
  ?storage_type:storage_type ->
  ?storage_capacity:storage_capacity ->
  ?client_request_token:client_request_token ->
  subnet_ids:subnet_ids ->
  file_system_type:file_system_type ->
  unit ->
  create_file_system_request

val make_create_file_system_from_backup_response :
  ?file_system:file_system -> unit -> create_file_system_from_backup_response

val make_create_file_system_from_backup_request :
  ?network_type:network_type ->
  ?storage_capacity:storage_capacity ->
  ?open_zfs_configuration:create_file_system_open_zfs_configuration ->
  ?file_system_type_version:file_system_type_version ->
  ?kms_key_id:kms_key_id ->
  ?storage_type:storage_type ->
  ?lustre_configuration:create_file_system_lustre_configuration ->
  ?windows_configuration:create_file_system_windows_configuration ->
  ?tags:tags ->
  ?security_group_ids:security_group_ids ->
  ?client_request_token:client_request_token ->
  subnet_ids:subnet_ids ->
  backup_id:backup_id ->
  unit ->
  create_file_system_from_backup_request

val make_create_file_cache_response :
  ?file_cache:file_cache_creating -> unit -> create_file_cache_response

val make_create_file_cache_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  metadata_configuration:file_cache_lustre_metadata_configuration ->
  deployment_type:file_cache_lustre_deployment_type ->
  per_unit_storage_throughput:per_unit_storage_throughput ->
  unit ->
  create_file_cache_lustre_configuration

val make_create_file_cache_request :
  ?data_repository_associations:create_file_cache_data_repository_associations ->
  ?lustre_configuration:create_file_cache_lustre_configuration ->
  ?kms_key_id:kms_key_id ->
  ?copy_tags_to_data_repository_associations:copy_tags_to_data_repository_associations ->
  ?tags:tags ->
  ?security_group_ids:security_group_ids ->
  ?client_request_token:client_request_token ->
  subnet_ids:subnet_ids ->
  storage_capacity:storage_capacity ->
  file_cache_type_version:file_system_type_version ->
  file_cache_type:file_cache_type ->
  unit ->
  create_file_cache_request

val make_create_data_repository_task_response :
  ?data_repository_task:data_repository_task -> unit -> create_data_repository_task_response

val make_create_data_repository_task_request :
  ?release_configuration:release_configuration ->
  ?capacity_to_release:capacity_to_release ->
  ?tags:tags ->
  ?client_request_token:client_request_token ->
  ?paths:data_repository_task_paths ->
  report:completion_report ->
  file_system_id:file_system_id ->
  type_:data_repository_task_type ->
  unit ->
  create_data_repository_task_request

val make_create_data_repository_association_response :
  ?association:data_repository_association -> unit -> create_data_repository_association_response

val make_create_data_repository_association_request :
  ?tags:tags ->
  ?client_request_token:client_request_token ->
  ?s3:s3_data_repository_configuration ->
  ?imported_file_chunk_size:megabytes ->
  ?batch_import_meta_data_on_create:batch_import_meta_data_on_create ->
  ?file_system_path:namespace ->
  data_repository_path:archive_path ->
  file_system_id:file_system_id ->
  unit ->
  create_data_repository_association_request

val make_create_backup_response : ?backup:backup -> unit -> create_backup_response

val make_create_backup_request :
  ?volume_id:volume_id ->
  ?tags:tags ->
  ?client_request_token:client_request_token ->
  ?file_system_id:file_system_id ->
  unit ->
  create_backup_request

val make_create_and_attach_s3_access_point_s3_configuration :
  ?policy:access_point_policy ->
  ?vpc_configuration:s3_access_point_vpc_configuration ->
  unit ->
  create_and_attach_s3_access_point_s3_configuration

val make_create_and_attach_s3_access_point_response :
  ?s3_access_point_attachment:s3_access_point_attachment ->
  unit ->
  create_and_attach_s3_access_point_response

val make_create_and_attach_s3_access_point_open_zfs_configuration :
  file_system_identity:open_zfs_file_system_identity ->
  volume_id:volume_id ->
  unit ->
  create_and_attach_s3_access_point_open_zfs_configuration

val make_create_and_attach_s3_access_point_ontap_configuration :
  file_system_identity:ontap_file_system_identity ->
  volume_id:volume_id ->
  unit ->
  create_and_attach_s3_access_point_ontap_configuration

val make_create_and_attach_s3_access_point_request :
  ?s3_access_point:create_and_attach_s3_access_point_s3_configuration ->
  ?ontap_configuration:create_and_attach_s3_access_point_ontap_configuration ->
  ?open_zfs_configuration:create_and_attach_s3_access_point_open_zfs_configuration ->
  ?client_request_token:client_request_token ->
  type_:s3_access_point_attachment_type ->
  name:s3_access_point_attachment_name ->
  unit ->
  create_and_attach_s3_access_point_request

val make_copy_snapshot_and_update_volume_response :
  ?administrative_actions:administrative_actions ->
  ?lifecycle:volume_lifecycle ->
  ?volume_id:volume_id ->
  unit ->
  copy_snapshot_and_update_volume_response

val make_copy_snapshot_and_update_volume_request :
  ?options:update_open_zfs_volume_options ->
  ?copy_strategy:open_zfs_copy_strategy ->
  ?client_request_token:client_request_token ->
  source_snapshot_ar_n:resource_ar_n ->
  volume_id:volume_id ->
  unit ->
  copy_snapshot_and_update_volume_request

val make_copy_backup_response : ?backup:backup -> unit -> copy_backup_response

val make_copy_backup_request :
  ?tags:tags ->
  ?copy_tags:flag ->
  ?kms_key_id:kms_key_id ->
  ?source_region:region ->
  ?client_request_token:client_request_token ->
  source_backup_id:source_backup_id ->
  unit ->
  copy_backup_request

val make_cancel_data_repository_task_response :
  ?task_id:task_id ->
  ?lifecycle:data_repository_task_lifecycle ->
  unit ->
  cancel_data_repository_task_response

val make_cancel_data_repository_task_request :
  task_id:task_id -> unit -> cancel_data_repository_task_request

val make_associate_file_system_aliases_response :
  ?aliases:aliases -> unit -> associate_file_system_aliases_response

val make_associate_file_system_aliases_request :
  ?client_request_token:client_request_token ->
  aliases:alternate_dns_names ->
  file_system_id:file_system_id ->
  unit ->
  associate_file_system_aliases_request
