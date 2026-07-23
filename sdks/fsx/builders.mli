open Types

val make_open_zfs_user_or_group_quota :
  type_:open_zfs_quota_type ->
  id:integer_no_max ->
  storage_capacity_quota_gi_b:integer_no_max ->
  unit ->
  open_zfs_user_or_group_quota

val make_open_zfs_client_configuration :
  clients:open_zfs_clients ->
  options:open_zfs_nfs_export_options ->
  unit ->
  open_zfs_client_configuration

val make_open_zfs_nfs_export :
  client_configurations:open_zfs_client_configurations -> unit -> open_zfs_nfs_export

val make_open_zfs_origin_snapshot_configuration :
  ?snapshot_ar_n:resource_ar_n ->
  ?copy_strategy:open_zfs_copy_strategy ->
  unit ->
  open_zfs_origin_snapshot_configuration

val make_open_zfs_volume_configuration :
  ?parent_volume_id:volume_id ->
  ?volume_path:volume_path ->
  ?storage_capacity_reservation_gi_b:integer_no_max ->
  ?storage_capacity_quota_gi_b:integer_no_max ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?copy_tags_to_snapshots:flag ->
  ?origin_snapshot:open_zfs_origin_snapshot_configuration ->
  ?read_only:read_only ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?restore_to_snapshot:snapshot_id ->
  ?delete_intermediate_snaphots:flag ->
  ?delete_cloned_volumes:flag ->
  ?delete_intermediate_data:flag ->
  ?source_snapshot_ar_n:resource_ar_n ->
  ?destination_snapshot:snapshot_id ->
  ?copy_strategy:open_zfs_copy_strategy ->
  unit ->
  open_zfs_volume_configuration

val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_lifecycle_transition_reason : ?message:error_message -> unit -> lifecycle_transition_reason

val make_administrative_action_failure_details :
  ?message:error_message -> unit -> administrative_action_failure_details

val make_open_zfs_read_cache_configuration :
  ?sizing_mode:open_zfs_read_cache_sizing_mode ->
  ?size_gi_b:storage_capacity ->
  unit ->
  open_zfs_read_cache_configuration

val make_disk_iops_configuration :
  ?mode:disk_iops_configuration_mode -> ?iops:iops -> unit -> disk_iops_configuration

val make_open_zfs_file_system_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?copy_tags_to_volumes:flag ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?deployment_type:open_zfs_deployment_type ->
  ?throughput_capacity:megabytes_per_second ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?root_volume_id:volume_id ->
  ?preferred_subnet_id:subnet_id ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?route_table_ids:route_table_ids ->
  ?endpoint_ip_address:ip_address ->
  ?endpoint_ipv6_address:ip_address ->
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  unit ->
  open_zfs_file_system_configuration

val make_file_system_endpoint :
  ?dns_name:dns_name ->
  ?ip_addresses:ontap_endpoint_ip_addresses ->
  ?ipv6_addresses:ontap_endpoint_ip_addresses ->
  unit ->
  file_system_endpoint

val make_file_system_endpoints :
  ?intercluster:file_system_endpoint ->
  ?management:file_system_endpoint ->
  unit ->
  file_system_endpoints

val make_ontap_file_system_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?deployment_type:ontap_deployment_type ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?endpoints:file_system_endpoints ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?preferred_subnet_id:subnet_id ->
  ?route_table_ids:route_table_ids ->
  ?throughput_capacity:megabytes_per_second ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?fsx_admin_password:admin_password ->
  ?ha_pairs:ha_pairs ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  unit ->
  ontap_file_system_configuration

val make_lustre_read_cache_configuration :
  ?sizing_mode:lustre_read_cache_sizing_mode ->
  ?size_gi_b:storage_capacity ->
  unit ->
  lustre_read_cache_configuration

val make_file_system_lustre_metadata_configuration :
  ?iops:metadata_iops ->
  mode:metadata_configuration_mode ->
  unit ->
  file_system_lustre_metadata_configuration

val make_lustre_root_squash_configuration :
  ?root_squash:lustre_root_squash ->
  ?no_squash_nids:lustre_no_squash_nids ->
  unit ->
  lustre_root_squash_configuration

val make_lustre_log_configuration :
  ?destination:general_ar_n ->
  level:lustre_access_audit_log_level ->
  unit ->
  lustre_log_configuration

val make_data_repository_failure_details :
  ?message:error_message -> unit -> data_repository_failure_details

val make_data_repository_configuration :
  ?lifecycle:data_repository_lifecycle ->
  ?import_path:archive_path ->
  ?export_path:archive_path ->
  ?imported_file_chunk_size:megabytes ->
  ?auto_import_policy:auto_import_policy_type ->
  ?failure_details:data_repository_failure_details ->
  unit ->
  data_repository_configuration

val make_lustre_file_system_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  ?data_repository_configuration:data_repository_configuration ->
  ?deployment_type:lustre_deployment_type ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?mount_name:lustre_file_system_mount_name ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?drive_cache_type:drive_cache_type ->
  ?data_compression_type:data_compression_type ->
  ?log_configuration:lustre_log_configuration ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?metadata_configuration:file_system_lustre_metadata_configuration ->
  ?efa_enabled:flag ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  unit ->
  lustre_file_system_configuration

val make_windows_fsrm_configuration :
  ?event_log_destination:general_ar_n ->
  fsrm_service_enabled:flag ->
  unit ->
  windows_fsrm_configuration

val make_windows_audit_log_configuration :
  ?audit_log_destination:general_ar_n ->
  file_access_audit_log_level:windows_access_audit_log_level ->
  file_share_access_audit_log_level:windows_access_audit_log_level ->
  unit ->
  windows_audit_log_configuration

val make_alias : ?name:alternate_dns_name -> ?lifecycle:alias_lifecycle -> unit -> alias

val make_self_managed_active_directory_attributes :
  ?domain_name:active_directory_fully_qualified_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?user_name:directory_user_name ->
  ?dns_ips:dns_ips ->
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  unit ->
  self_managed_active_directory_attributes

val make_windows_file_system_configuration :
  ?active_directory_id:directory_id ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_attributes ->
  ?deployment_type:windows_deployment_type ->
  ?remote_administration_endpoint:dns_name ->
  ?preferred_subnet_id:subnet_id ->
  ?preferred_file_server_ip:ip_address ->
  ?throughput_capacity:megabytes_per_second ->
  ?maintenance_operations_in_progress:file_system_maintenance_operations ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?aliases:aliases ->
  ?audit_log_configuration:windows_audit_log_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?preferred_file_server_ipv6:ip_address ->
  ?fsrm_configuration:windows_fsrm_configuration ->
  unit ->
  windows_file_system_configuration

val make_file_system_failure_details : ?message:error_message -> unit -> file_system_failure_details

val make_aggregate_configuration :
  ?aggregates:aggregates ->
  ?total_constituents:total_constituents ->
  unit ->
  aggregate_configuration

val make_retention_period :
  ?value:retention_period_value -> type_:retention_period_type -> unit -> retention_period

val make_snaplock_retention_period :
  default_retention:retention_period ->
  minimum_retention:retention_period ->
  maximum_retention:retention_period ->
  unit ->
  snaplock_retention_period

val make_autocommit_period :
  ?value:autocommit_period_value -> type_:autocommit_period_type -> unit -> autocommit_period

val make_snaplock_configuration :
  ?audit_log_volume:flag ->
  ?autocommit_period:autocommit_period ->
  ?privileged_delete:privileged_delete ->
  ?retention_period:snaplock_retention_period ->
  ?snaplock_type:snaplock_type ->
  ?volume_append_mode_enabled:flag ->
  unit ->
  snaplock_configuration

val make_tiering_policy :
  ?cooling_period:cooling_period -> ?name:tiering_policy_name -> unit -> tiering_policy

val make_ontap_volume_configuration :
  ?flex_cache_endpoint_type:flex_cache_endpoint_type ->
  ?junction_path:junction_path ->
  ?security_style:security_style ->
  ?size_in_megabytes:volume_capacity ->
  ?storage_efficiency_enabled:flag ->
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  ?storage_virtual_machine_root:flag ->
  ?tiering_policy:tiering_policy ->
  ?uui_d:uui_d ->
  ?ontap_volume_type:ontap_volume_type ->
  ?snapshot_policy:snapshot_policy ->
  ?copy_tags_to_backups:flag ->
  ?snaplock_configuration:snaplock_configuration ->
  ?volume_style:volume_style ->
  ?aggregate_configuration:aggregate_configuration ->
  ?size_in_bytes:volume_capacity_bytes ->
  unit ->
  ontap_volume_configuration

val make_volume :
  ?creation_time:creation_time ->
  ?file_system_id:file_system_id ->
  ?lifecycle:volume_lifecycle ->
  ?name:volume_name ->
  ?ontap_configuration:ontap_volume_configuration ->
  ?resource_ar_n:resource_ar_n ->
  ?tags:tags ->
  ?volume_id:volume_id ->
  ?volume_type:volume_type ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?administrative_actions:administrative_actions ->
  ?open_zfs_configuration:open_zfs_volume_configuration ->
  unit ->
  volume

val make_snapshot :
  ?resource_ar_n:resource_ar_n ->
  ?snapshot_id:snapshot_id ->
  ?name:snapshot_name ->
  ?volume_id:volume_id ->
  ?creation_time:creation_time ->
  ?lifecycle:snapshot_lifecycle ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?tags:tags ->
  ?administrative_actions:administrative_actions ->
  unit ->
  snapshot

val make_file_system :
  ?owner_id:aws_account_id ->
  ?creation_time:creation_time ->
  ?file_system_id:file_system_id ->
  ?file_system_type:file_system_type ->
  ?lifecycle:file_system_lifecycle ->
  ?failure_details:file_system_failure_details ->
  ?storage_capacity:storage_capacity ->
  ?storage_type:storage_type ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?network_interface_ids:network_interface_ids ->
  ?dns_name:dns_name ->
  ?kms_key_id:kms_key_id ->
  ?resource_ar_n:resource_ar_n ->
  ?tags:tags ->
  ?windows_configuration:windows_file_system_configuration ->
  ?lustre_configuration:lustre_file_system_configuration ->
  ?administrative_actions:administrative_actions ->
  ?ontap_configuration:ontap_file_system_configuration ->
  ?file_system_type_version:file_system_type_version ->
  ?open_zfs_configuration:open_zfs_file_system_configuration ->
  ?network_type:network_type ->
  unit ->
  file_system

val make_administrative_action :
  ?administrative_action_type:administrative_action_type ->
  ?progress_percent:progress_percent ->
  ?request_time:request_time ->
  ?status:status ->
  ?target_file_system_values:file_system ->
  ?failure_details:administrative_action_failure_details ->
  ?target_volume_values:volume ->
  ?target_snapshot_values:snapshot ->
  ?total_transfer_bytes:total_transfer_bytes ->
  ?remaining_transfer_bytes:remaining_transfer_bytes ->
  ?message:error_message ->
  unit ->
  administrative_action

val make_update_volume_response : ?volume:volume -> unit -> update_volume_response

val make_update_open_zfs_volume_configuration :
  ?storage_capacity_reservation_gi_b:integer_no_max_from_negative_one ->
  ?storage_capacity_quota_gi_b:integer_no_max_from_negative_one ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?read_only:read_only ->
  unit ->
  update_open_zfs_volume_configuration

val make_update_snaplock_configuration :
  ?audit_log_volume:flag ->
  ?autocommit_period:autocommit_period ->
  ?privileged_delete:privileged_delete ->
  ?retention_period:snaplock_retention_period ->
  ?volume_append_mode_enabled:flag ->
  unit ->
  update_snaplock_configuration

val make_update_ontap_volume_configuration :
  ?junction_path:junction_path ->
  ?security_style:security_style ->
  ?size_in_megabytes:volume_capacity ->
  ?storage_efficiency_enabled:flag ->
  ?tiering_policy:tiering_policy ->
  ?snapshot_policy:snapshot_policy ->
  ?copy_tags_to_backups:flag ->
  ?snaplock_configuration:update_snaplock_configuration ->
  ?size_in_bytes:volume_capacity_bytes ->
  unit ->
  update_ontap_volume_configuration

val make_update_volume_request :
  ?client_request_token:client_request_token ->
  ?ontap_configuration:update_ontap_volume_configuration ->
  ?name:volume_name ->
  ?open_zfs_configuration:update_open_zfs_volume_configuration ->
  volume_id:volume_id ->
  unit ->
  update_volume_request

val make_svm_endpoint :
  ?dns_name:dns_name ->
  ?ip_addresses:ontap_endpoint_ip_addresses ->
  ?ipv6_addresses:ontap_endpoint_ip_addresses ->
  unit ->
  svm_endpoint

val make_svm_endpoints :
  ?iscsi:svm_endpoint ->
  ?management:svm_endpoint ->
  ?nfs:svm_endpoint ->
  ?smb:svm_endpoint ->
  unit ->
  svm_endpoints

val make_svm_active_directory_configuration :
  ?net_bios_name:net_bios_alias ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_attributes ->
  unit ->
  svm_active_directory_configuration

val make_storage_virtual_machine :
  ?active_directory_configuration:svm_active_directory_configuration ->
  ?creation_time:creation_time ->
  ?endpoints:svm_endpoints ->
  ?file_system_id:file_system_id ->
  ?lifecycle:storage_virtual_machine_lifecycle ->
  ?name:storage_virtual_machine_name ->
  ?resource_ar_n:resource_ar_n ->
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  ?subtype:storage_virtual_machine_subtype ->
  ?uui_d:uui_d ->
  ?tags:tags ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?root_volume_security_style:storage_virtual_machine_root_volume_security_style ->
  unit ->
  storage_virtual_machine

val make_update_storage_virtual_machine_response :
  ?storage_virtual_machine:storage_virtual_machine ->
  unit ->
  update_storage_virtual_machine_response

val make_self_managed_active_directory_configuration_updates :
  ?user_name:directory_user_name ->
  ?password:directory_password ->
  ?dns_ips:dns_ips ->
  ?domain_name:active_directory_fully_qualified_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  unit ->
  self_managed_active_directory_configuration_updates

val make_update_svm_active_directory_configuration :
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration_updates ->
  ?net_bios_name:net_bios_alias ->
  unit ->
  update_svm_active_directory_configuration

val make_update_storage_virtual_machine_request :
  ?active_directory_configuration:update_svm_active_directory_configuration ->
  ?client_request_token:client_request_token ->
  ?svm_admin_password:admin_password ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  update_storage_virtual_machine_request

val make_update_snapshot_response : ?snapshot:snapshot -> unit -> update_snapshot_response

val make_update_snapshot_request :
  ?client_request_token:client_request_token ->
  name:snapshot_name ->
  snapshot_id:snapshot_id ->
  unit ->
  update_snapshot_request

val make_update_shared_vpc_configuration_response :
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  unit ->
  update_shared_vpc_configuration_response

val make_update_shared_vpc_configuration_request :
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  ?client_request_token:client_request_token ->
  unit ->
  update_shared_vpc_configuration_request

val make_update_file_system_response :
  ?file_system:file_system -> unit -> update_file_system_response

val make_update_file_system_open_zfs_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?copy_tags_to_volumes:flag ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?throughput_capacity:megabytes_per_second ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?add_route_table_ids:route_table_ids ->
  ?remove_route_table_ids:route_table_ids ->
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  unit ->
  update_file_system_open_zfs_configuration

val make_update_file_system_ontap_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?fsx_admin_password:admin_password ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?throughput_capacity:megabytes_per_second ->
  ?add_route_table_ids:route_table_ids ->
  ?remove_route_table_ids:route_table_ids ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?ha_pairs:ha_pairs ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  unit ->
  update_file_system_ontap_configuration

val make_update_file_system_lustre_metadata_configuration :
  ?iops:metadata_iops ->
  ?mode:metadata_configuration_mode ->
  unit ->
  update_file_system_lustre_metadata_configuration

val make_lustre_log_create_configuration :
  ?destination:general_ar_n ->
  level:lustre_access_audit_log_level ->
  unit ->
  lustre_log_create_configuration

val make_update_file_system_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?auto_import_policy:auto_import_policy_type ->
  ?data_compression_type:data_compression_type ->
  ?log_configuration:lustre_log_create_configuration ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?metadata_configuration:update_file_system_lustre_metadata_configuration ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  unit ->
  update_file_system_lustre_configuration

val make_windows_audit_log_create_configuration :
  ?audit_log_destination:general_ar_n ->
  file_access_audit_log_level:windows_access_audit_log_level ->
  file_share_access_audit_log_level:windows_access_audit_log_level ->
  unit ->
  windows_audit_log_create_configuration

val make_update_file_system_windows_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?throughput_capacity:megabytes_per_second ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration_updates ->
  ?audit_log_configuration:windows_audit_log_create_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?fsrm_configuration:windows_fsrm_configuration ->
  unit ->
  update_file_system_windows_configuration

val make_update_file_system_request :
  ?client_request_token:client_request_token ->
  ?storage_capacity:storage_capacity ->
  ?windows_configuration:update_file_system_windows_configuration ->
  ?lustre_configuration:update_file_system_lustre_configuration ->
  ?ontap_configuration:update_file_system_ontap_configuration ->
  ?open_zfs_configuration:update_file_system_open_zfs_configuration ->
  ?storage_type:storage_type ->
  ?file_system_type_version:file_system_type_version ->
  ?network_type:network_type ->
  file_system_id:file_system_id ->
  unit ->
  update_file_system_request

val make_file_cache_lustre_metadata_configuration :
  storage_capacity:metadata_storage_capacity -> unit -> file_cache_lustre_metadata_configuration

val make_file_cache_lustre_configuration :
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?deployment_type:file_cache_lustre_deployment_type ->
  ?mount_name:lustre_file_system_mount_name ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?metadata_configuration:file_cache_lustre_metadata_configuration ->
  ?log_configuration:lustre_log_configuration ->
  unit ->
  file_cache_lustre_configuration

val make_file_cache_failure_details : ?message:error_message -> unit -> file_cache_failure_details

val make_file_cache :
  ?owner_id:aws_account_id ->
  ?creation_time:creation_time ->
  ?file_cache_id:file_cache_id ->
  ?file_cache_type:file_cache_type ->
  ?file_cache_type_version:file_system_type_version ->
  ?lifecycle:file_cache_lifecycle ->
  ?failure_details:file_cache_failure_details ->
  ?storage_capacity:storage_capacity ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?network_interface_ids:network_interface_ids ->
  ?dns_name:dns_name ->
  ?kms_key_id:kms_key_id ->
  ?resource_ar_n:resource_ar_n ->
  ?lustre_configuration:file_cache_lustre_configuration ->
  ?data_repository_association_ids:data_repository_association_ids ->
  unit ->
  file_cache

val make_update_file_cache_response : ?file_cache:file_cache -> unit -> update_file_cache_response

val make_update_file_cache_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time -> unit -> update_file_cache_lustre_configuration

val make_update_file_cache_request :
  ?client_request_token:client_request_token ->
  ?lustre_configuration:update_file_cache_lustre_configuration ->
  file_cache_id:file_cache_id ->
  unit ->
  update_file_cache_request

val make_auto_export_policy : ?events:event_types -> unit -> auto_export_policy

val make_nfs_data_repository_configuration :
  ?dns_ips:repository_dns_ips ->
  ?auto_export_policy:auto_export_policy ->
  version:nfs_version ->
  unit ->
  nfs_data_repository_configuration

val make_auto_import_policy : ?events:event_types -> unit -> auto_import_policy

val make_s3_data_repository_configuration :
  ?auto_import_policy:auto_import_policy ->
  ?auto_export_policy:auto_export_policy ->
  unit ->
  s3_data_repository_configuration

val make_data_repository_association :
  ?association_id:data_repository_association_id ->
  ?resource_ar_n:resource_ar_n ->
  ?file_system_id:file_system_id ->
  ?lifecycle:data_repository_lifecycle ->
  ?failure_details:data_repository_failure_details ->
  ?file_system_path:namespace ->
  ?data_repository_path:archive_path ->
  ?batch_import_meta_data_on_create:batch_import_meta_data_on_create ->
  ?imported_file_chunk_size:megabytes ->
  ?s3:s3_data_repository_configuration ->
  ?tags:tags ->
  ?creation_time:creation_time ->
  ?file_cache_id:file_cache_id ->
  ?file_cache_path:namespace ->
  ?data_repository_subdirectories:sub_directories_paths ->
  ?nf_s:nfs_data_repository_configuration ->
  unit ->
  data_repository_association

val make_update_data_repository_association_response :
  ?association:data_repository_association -> unit -> update_data_repository_association_response

val make_update_data_repository_association_request :
  ?client_request_token:client_request_token ->
  ?imported_file_chunk_size:megabytes ->
  ?s3:s3_data_repository_configuration ->
  association_id:data_repository_association_id ->
  unit ->
  update_data_repository_association_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:resource_ar_n -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:resource_ar_n -> tags:tags -> unit -> tag_resource_request

val make_start_misconfigured_state_recovery_response :
  ?file_system:file_system -> unit -> start_misconfigured_state_recovery_response

val make_start_misconfigured_state_recovery_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  start_misconfigured_state_recovery_request

val make_restore_volume_from_snapshot_response :
  ?volume_id:volume_id ->
  ?lifecycle:volume_lifecycle ->
  ?administrative_actions:administrative_actions ->
  unit ->
  restore_volume_from_snapshot_response

val make_restore_volume_from_snapshot_request :
  ?client_request_token:client_request_token ->
  ?options:restore_open_zfs_volume_options ->
  volume_id:volume_id ->
  snapshot_id:snapshot_id ->
  unit ->
  restore_volume_from_snapshot_request

val make_release_file_system_nfs_v3_locks_response :
  ?file_system:file_system -> unit -> release_file_system_nfs_v3_locks_response

val make_release_file_system_nfs_v3_locks_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  unit ->
  release_file_system_nfs_v3_locks_request

val make_list_tags_for_resource_response :
  ?tags:tags -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_ar_n:resource_ar_n ->
  unit ->
  list_tags_for_resource_request

val make_disassociate_file_system_aliases_response :
  ?aliases:aliases -> unit -> disassociate_file_system_aliases_response

val make_disassociate_file_system_aliases_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  aliases:alternate_dns_names ->
  unit ->
  disassociate_file_system_aliases_request

val make_detach_and_delete_s3_access_point_response :
  ?lifecycle:s3_access_point_attachment_lifecycle ->
  ?name:s3_access_point_attachment_name ->
  unit ->
  detach_and_delete_s3_access_point_response

val make_detach_and_delete_s3_access_point_request :
  ?client_request_token:client_request_token ->
  name:s3_access_point_attachment_name ->
  unit ->
  detach_and_delete_s3_access_point_request

val make_describe_volumes_response :
  ?volumes:volumes -> ?next_token:next_token -> unit -> describe_volumes_response

val make_volume_filter :
  ?name:volume_filter_name -> ?values:volume_filter_values -> unit -> volume_filter

val make_describe_volumes_request :
  ?volume_ids:volume_ids ->
  ?filters:volume_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_volumes_request

val make_describe_storage_virtual_machines_response :
  ?storage_virtual_machines:storage_virtual_machines ->
  ?next_token:next_token ->
  unit ->
  describe_storage_virtual_machines_response

val make_storage_virtual_machine_filter :
  ?name:storage_virtual_machine_filter_name ->
  ?values:storage_virtual_machine_filter_values ->
  unit ->
  storage_virtual_machine_filter

val make_describe_storage_virtual_machines_request :
  ?storage_virtual_machine_ids:storage_virtual_machine_ids ->
  ?filters:storage_virtual_machine_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_storage_virtual_machines_request

val make_describe_snapshots_response :
  ?snapshots:snapshots -> ?next_token:next_token -> unit -> describe_snapshots_response

val make_snapshot_filter :
  ?name:snapshot_filter_name -> ?values:snapshot_filter_values -> unit -> snapshot_filter

val make_describe_snapshots_request :
  ?snapshot_ids:snapshot_ids ->
  ?filters:snapshot_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?include_shared:include_shared ->
  unit ->
  describe_snapshots_request

val make_describe_shared_vpc_configuration_response :
  ?enable_fsx_route_table_updates_from_participant_accounts:verbose_flag ->
  unit ->
  describe_shared_vpc_configuration_response

val make_describe_shared_vpc_configuration_request : unit -> unit

val make_s3_access_point_vpc_configuration :
  ?vpc_id:vpc_id -> unit -> s3_access_point_vpc_configuration

val make_s3_access_point :
  ?resource_ar_n:general_ar_n ->
  ?alias:s3_access_point_alias ->
  ?vpc_configuration:s3_access_point_vpc_configuration ->
  unit ->
  s3_access_point

val make_ontap_windows_file_system_user :
  name:ontap_file_system_user_name -> unit -> ontap_windows_file_system_user

val make_ontap_unix_file_system_user :
  name:ontap_file_system_user_name -> unit -> ontap_unix_file_system_user

val make_ontap_file_system_identity :
  ?unix_user:ontap_unix_file_system_user ->
  ?windows_user:ontap_windows_file_system_user ->
  type_:ontap_file_system_user_type ->
  unit ->
  ontap_file_system_identity

val make_s3_access_point_ontap_configuration :
  ?volume_id:volume_id ->
  ?file_system_identity:ontap_file_system_identity ->
  unit ->
  s3_access_point_ontap_configuration

val make_open_zfs_posix_file_system_user :
  ?secondary_gids:file_system_secondary_gi_ds ->
  uid:file_system_ui_d ->
  gid:file_system_gi_d ->
  unit ->
  open_zfs_posix_file_system_user

val make_open_zfs_file_system_identity :
  ?posix_user:open_zfs_posix_file_system_user ->
  type_:open_zfs_file_system_user_type ->
  unit ->
  open_zfs_file_system_identity

val make_s3_access_point_open_zfs_configuration :
  ?volume_id:volume_id ->
  ?file_system_identity:open_zfs_file_system_identity ->
  unit ->
  s3_access_point_open_zfs_configuration

val make_s3_access_point_attachment :
  ?lifecycle:s3_access_point_attachment_lifecycle ->
  ?lifecycle_transition_reason:lifecycle_transition_reason ->
  ?creation_time:creation_time ->
  ?name:s3_access_point_attachment_name ->
  ?type_:s3_access_point_attachment_type ->
  ?open_zfs_configuration:s3_access_point_open_zfs_configuration ->
  ?ontap_configuration:s3_access_point_ontap_configuration ->
  ?s3_access_point:s3_access_point ->
  unit ->
  s3_access_point_attachment

val make_describe_s3_access_point_attachments_response :
  ?s3_access_point_attachments:s3_access_point_attachments ->
  ?next_token:next_token ->
  unit ->
  describe_s3_access_point_attachments_response

val make_s3_access_point_attachments_filter :
  ?name:s3_access_point_attachments_filter_name ->
  ?values:s3_access_point_attachments_filter_values ->
  unit ->
  s3_access_point_attachments_filter

val make_describe_s3_access_point_attachments_request :
  ?names:s3_access_point_attachment_names ->
  ?filters:s3_access_point_attachments_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_s3_access_point_attachments_request

val make_describe_file_systems_response :
  ?file_systems:file_systems -> ?next_token:next_token -> unit -> describe_file_systems_response

val make_describe_file_systems_request :
  ?file_system_ids:file_system_ids ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_file_systems_request

val make_describe_file_system_aliases_response :
  ?aliases:aliases -> ?next_token:next_token -> unit -> describe_file_system_aliases_response

val make_describe_file_system_aliases_request :
  ?client_request_token:client_request_token ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  file_system_id:file_system_id ->
  unit ->
  describe_file_system_aliases_request

val make_describe_file_caches_response :
  ?file_caches:file_caches -> ?next_token:next_token -> unit -> describe_file_caches_response

val make_describe_file_caches_request :
  ?file_cache_ids:file_cache_ids ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_file_caches_request

val make_duration_since_last_access :
  ?unit_:unit_ -> ?value:value -> unit -> duration_since_last_access

val make_release_configuration :
  ?duration_since_last_access:duration_since_last_access -> unit -> release_configuration

val make_completion_report :
  ?path:archive_path ->
  ?format:report_format ->
  ?scope:report_scope ->
  enabled:flag ->
  unit ->
  completion_report

val make_data_repository_task_status :
  ?total_count:total_count ->
  ?succeeded_count:succeeded_count ->
  ?failed_count:failed_count ->
  ?last_updated_time:last_updated_time ->
  ?released_capacity:released_capacity ->
  unit ->
  data_repository_task_status

val make_data_repository_task_failure_details :
  ?message:error_message -> unit -> data_repository_task_failure_details

val make_data_repository_task :
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?resource_ar_n:resource_ar_n ->
  ?tags:tags ->
  ?file_system_id:file_system_id ->
  ?paths:data_repository_task_paths ->
  ?failure_details:data_repository_task_failure_details ->
  ?status:data_repository_task_status ->
  ?report:completion_report ->
  ?capacity_to_release:capacity_to_release ->
  ?file_cache_id:file_cache_id ->
  ?release_configuration:release_configuration ->
  task_id:task_id ->
  lifecycle:data_repository_task_lifecycle ->
  type_:data_repository_task_type ->
  creation_time:creation_time ->
  unit ->
  data_repository_task

val make_describe_data_repository_tasks_response :
  ?data_repository_tasks:data_repository_tasks ->
  ?next_token:next_token ->
  unit ->
  describe_data_repository_tasks_response

val make_data_repository_task_filter :
  ?name:data_repository_task_filter_name ->
  ?values:data_repository_task_filter_values ->
  unit ->
  data_repository_task_filter

val make_describe_data_repository_tasks_request :
  ?task_ids:task_ids ->
  ?filters:data_repository_task_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_data_repository_tasks_request

val make_describe_data_repository_associations_response :
  ?associations:data_repository_associations ->
  ?next_token:next_token ->
  unit ->
  describe_data_repository_associations_response

val make_filter : ?name:filter_name -> ?values:filter_values -> unit -> filter

val make_describe_data_repository_associations_request :
  ?association_ids:data_repository_association_ids ->
  ?filters:filters ->
  ?max_results:limited_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_data_repository_associations_request

val make_active_directory_backup_attributes :
  ?domain_name:active_directory_fully_qualified_name ->
  ?active_directory_id:directory_id ->
  ?resource_ar_n:resource_ar_n ->
  unit ->
  active_directory_backup_attributes

val make_backup_failure_details : ?message:error_message -> unit -> backup_failure_details

val make_backup :
  ?failure_details:backup_failure_details ->
  ?progress_percent:progress_percent ->
  ?kms_key_id:kms_key_id ->
  ?resource_ar_n:resource_ar_n ->
  ?tags:tags ->
  ?directory_information:active_directory_backup_attributes ->
  ?owner_id:aws_account_id ->
  ?source_backup_id:backup_id ->
  ?source_backup_region:region ->
  ?resource_type:resource_type ->
  ?volume:volume ->
  ?size_in_bytes:size_in_bytes ->
  backup_id:backup_id ->
  lifecycle:backup_lifecycle ->
  type_:backup_type ->
  creation_time:creation_time ->
  file_system:file_system ->
  unit ->
  backup

val make_describe_backups_response :
  ?backups:backups -> ?next_token:next_token -> unit -> describe_backups_response

val make_describe_backups_request :
  ?backup_ids:backup_ids ->
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_backups_request

val make_delete_volume_ontap_response :
  ?final_backup_id:backup_id -> ?final_backup_tags:tags -> unit -> delete_volume_ontap_response

val make_delete_volume_response :
  ?volume_id:volume_id ->
  ?lifecycle:volume_lifecycle ->
  ?ontap_response:delete_volume_ontap_response ->
  unit ->
  delete_volume_response

val make_delete_volume_open_zfs_configuration :
  ?options:delete_open_zfs_volume_options -> unit -> delete_volume_open_zfs_configuration

val make_delete_volume_ontap_configuration :
  ?skip_final_backup:flag ->
  ?final_backup_tags:tags ->
  ?bypass_snaplock_enterprise_retention:flag ->
  unit ->
  delete_volume_ontap_configuration

val make_delete_volume_request :
  ?client_request_token:client_request_token ->
  ?ontap_configuration:delete_volume_ontap_configuration ->
  ?open_zfs_configuration:delete_volume_open_zfs_configuration ->
  volume_id:volume_id ->
  unit ->
  delete_volume_request

val make_delete_storage_virtual_machine_response :
  ?storage_virtual_machine_id:storage_virtual_machine_id ->
  ?lifecycle:storage_virtual_machine_lifecycle ->
  unit ->
  delete_storage_virtual_machine_response

val make_delete_storage_virtual_machine_request :
  ?client_request_token:client_request_token ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  delete_storage_virtual_machine_request

val make_delete_snapshot_response :
  ?snapshot_id:snapshot_id -> ?lifecycle:snapshot_lifecycle -> unit -> delete_snapshot_response

val make_delete_snapshot_request :
  ?client_request_token:client_request_token ->
  snapshot_id:snapshot_id ->
  unit ->
  delete_snapshot_request

val make_delete_file_system_open_zfs_response :
  ?final_backup_id:backup_id ->
  ?final_backup_tags:tags ->
  unit ->
  delete_file_system_open_zfs_response

val make_delete_file_system_lustre_response :
  ?final_backup_id:backup_id ->
  ?final_backup_tags:tags ->
  unit ->
  delete_file_system_lustre_response

val make_delete_file_system_windows_response :
  ?final_backup_id:backup_id ->
  ?final_backup_tags:tags ->
  unit ->
  delete_file_system_windows_response

val make_delete_file_system_response :
  ?file_system_id:file_system_id ->
  ?lifecycle:file_system_lifecycle ->
  ?windows_response:delete_file_system_windows_response ->
  ?lustre_response:delete_file_system_lustre_response ->
  ?open_zfs_response:delete_file_system_open_zfs_response ->
  unit ->
  delete_file_system_response

val make_delete_file_system_open_zfs_configuration :
  ?skip_final_backup:flag ->
  ?final_backup_tags:tags ->
  ?options:delete_file_system_open_zfs_options ->
  unit ->
  delete_file_system_open_zfs_configuration

val make_delete_file_system_lustre_configuration :
  ?skip_final_backup:flag ->
  ?final_backup_tags:tags ->
  unit ->
  delete_file_system_lustre_configuration

val make_delete_file_system_windows_configuration :
  ?skip_final_backup:flag ->
  ?final_backup_tags:tags ->
  unit ->
  delete_file_system_windows_configuration

val make_delete_file_system_request :
  ?client_request_token:client_request_token ->
  ?windows_configuration:delete_file_system_windows_configuration ->
  ?lustre_configuration:delete_file_system_lustre_configuration ->
  ?open_zfs_configuration:delete_file_system_open_zfs_configuration ->
  file_system_id:file_system_id ->
  unit ->
  delete_file_system_request

val make_delete_file_cache_response :
  ?file_cache_id:file_cache_id ->
  ?lifecycle:file_cache_lifecycle ->
  unit ->
  delete_file_cache_response

val make_delete_file_cache_request :
  ?client_request_token:client_request_token ->
  file_cache_id:file_cache_id ->
  unit ->
  delete_file_cache_request

val make_delete_data_repository_association_response :
  ?association_id:data_repository_association_id ->
  ?lifecycle:data_repository_lifecycle ->
  ?delete_data_in_file_system:delete_data_in_file_system ->
  unit ->
  delete_data_repository_association_response

val make_delete_data_repository_association_request :
  ?client_request_token:client_request_token ->
  ?delete_data_in_file_system:delete_data_in_file_system ->
  association_id:data_repository_association_id ->
  unit ->
  delete_data_repository_association_request

val make_delete_backup_response :
  ?backup_id:backup_id -> ?lifecycle:backup_lifecycle -> unit -> delete_backup_response

val make_delete_backup_request :
  ?client_request_token:client_request_token -> backup_id:backup_id -> unit -> delete_backup_request

val make_create_volume_from_backup_response :
  ?volume:volume -> unit -> create_volume_from_backup_response

val make_create_aggregate_configuration :
  ?aggregates:aggregates ->
  ?constituents_per_aggregate:aggregate_list_multiplier ->
  unit ->
  create_aggregate_configuration

val make_create_snaplock_configuration :
  ?audit_log_volume:flag ->
  ?autocommit_period:autocommit_period ->
  ?privileged_delete:privileged_delete ->
  ?retention_period:snaplock_retention_period ->
  ?volume_append_mode_enabled:flag ->
  snaplock_type:snaplock_type ->
  unit ->
  create_snaplock_configuration

val make_create_ontap_volume_configuration :
  ?junction_path:junction_path ->
  ?security_style:security_style ->
  ?size_in_megabytes:volume_capacity ->
  ?storage_efficiency_enabled:flag ->
  ?tiering_policy:tiering_policy ->
  ?ontap_volume_type:input_ontap_volume_type ->
  ?snapshot_policy:snapshot_policy ->
  ?copy_tags_to_backups:flag ->
  ?snaplock_configuration:create_snaplock_configuration ->
  ?volume_style:volume_style ->
  ?aggregate_configuration:create_aggregate_configuration ->
  ?size_in_bytes:volume_capacity_bytes ->
  storage_virtual_machine_id:storage_virtual_machine_id ->
  unit ->
  create_ontap_volume_configuration

val make_create_volume_from_backup_request :
  ?client_request_token:client_request_token ->
  ?ontap_configuration:create_ontap_volume_configuration ->
  ?tags:tags ->
  backup_id:backup_id ->
  name:volume_name ->
  unit ->
  create_volume_from_backup_request

val make_create_volume_response : ?volume:volume -> unit -> create_volume_response

val make_create_open_zfs_origin_snapshot_configuration :
  snapshot_ar_n:resource_ar_n ->
  copy_strategy:open_zfs_copy_strategy ->
  unit ->
  create_open_zfs_origin_snapshot_configuration

val make_create_open_zfs_volume_configuration :
  ?storage_capacity_reservation_gi_b:integer_no_max_from_negative_one ->
  ?storage_capacity_quota_gi_b:integer_no_max_from_negative_one ->
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?copy_tags_to_snapshots:flag ->
  ?origin_snapshot:create_open_zfs_origin_snapshot_configuration ->
  ?read_only:read_only ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  parent_volume_id:volume_id ->
  unit ->
  create_open_zfs_volume_configuration

val make_create_volume_request :
  ?client_request_token:client_request_token ->
  ?ontap_configuration:create_ontap_volume_configuration ->
  ?tags:tags ->
  ?open_zfs_configuration:create_open_zfs_volume_configuration ->
  volume_type:volume_type ->
  name:volume_name ->
  unit ->
  create_volume_request

val make_create_storage_virtual_machine_response :
  ?storage_virtual_machine:storage_virtual_machine ->
  unit ->
  create_storage_virtual_machine_response

val make_self_managed_active_directory_configuration :
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?file_system_administrators_group:file_system_administrators_group_name ->
  ?user_name:directory_user_name ->
  ?password:directory_password ->
  ?domain_join_service_account_secret:customer_secrets_manager_ar_n ->
  domain_name:active_directory_fully_qualified_name ->
  dns_ips:dns_ips ->
  unit ->
  self_managed_active_directory_configuration

val make_create_svm_active_directory_configuration :
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration ->
  net_bios_name:net_bios_alias ->
  unit ->
  create_svm_active_directory_configuration

val make_create_storage_virtual_machine_request :
  ?active_directory_configuration:create_svm_active_directory_configuration ->
  ?client_request_token:client_request_token ->
  ?svm_admin_password:admin_password ->
  ?tags:tags ->
  ?root_volume_security_style:storage_virtual_machine_root_volume_security_style ->
  file_system_id:file_system_id ->
  name:storage_virtual_machine_name ->
  unit ->
  create_storage_virtual_machine_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?client_request_token:client_request_token ->
  ?tags:tags ->
  name:snapshot_name ->
  volume_id:volume_id ->
  unit ->
  create_snapshot_request

val make_create_file_system_from_backup_response :
  ?file_system:file_system -> unit -> create_file_system_from_backup_response

val make_open_zfs_create_root_volume_configuration :
  ?record_size_ki_b:integer_record_size_ki_b ->
  ?data_compression_type:open_zfs_data_compression_type ->
  ?nfs_exports:open_zfs_nfs_exports ->
  ?user_and_group_quotas:open_zfs_user_and_group_quotas ->
  ?copy_tags_to_snapshots:flag ->
  ?read_only:read_only ->
  unit ->
  open_zfs_create_root_volume_configuration

val make_create_file_system_open_zfs_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?copy_tags_to_volumes:flag ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?root_volume_configuration:open_zfs_create_root_volume_configuration ->
  ?preferred_subnet_id:subnet_id ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  ?route_table_ids:route_table_ids ->
  ?read_cache_configuration:open_zfs_read_cache_configuration ->
  deployment_type:open_zfs_deployment_type ->
  throughput_capacity:megabytes_per_second ->
  unit ->
  create_file_system_open_zfs_configuration

val make_create_file_system_lustre_metadata_configuration :
  ?iops:metadata_iops ->
  mode:metadata_configuration_mode ->
  unit ->
  create_file_system_lustre_metadata_configuration

val make_create_file_system_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  ?import_path:archive_path ->
  ?export_path:archive_path ->
  ?imported_file_chunk_size:megabytes ->
  ?deployment_type:lustre_deployment_type ->
  ?auto_import_policy:auto_import_policy_type ->
  ?per_unit_storage_throughput:per_unit_storage_throughput ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?drive_cache_type:drive_cache_type ->
  ?data_compression_type:data_compression_type ->
  ?efa_enabled:flag ->
  ?log_configuration:lustre_log_create_configuration ->
  ?root_squash_configuration:lustre_root_squash_configuration ->
  ?metadata_configuration:create_file_system_lustre_metadata_configuration ->
  ?throughput_capacity:throughput_capacity_mbps ->
  ?data_read_cache_configuration:lustre_read_cache_configuration ->
  unit ->
  create_file_system_lustre_configuration

val make_create_file_system_windows_configuration :
  ?active_directory_id:directory_id ->
  ?self_managed_active_directory_configuration:self_managed_active_directory_configuration ->
  ?deployment_type:windows_deployment_type ->
  ?preferred_subnet_id:subnet_id ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?copy_tags_to_backups:flag ->
  ?aliases:alternate_dns_names ->
  ?audit_log_configuration:windows_audit_log_create_configuration ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?fsrm_configuration:windows_fsrm_configuration ->
  throughput_capacity:megabytes_per_second ->
  unit ->
  create_file_system_windows_configuration

val make_create_file_system_from_backup_request :
  ?client_request_token:client_request_token ->
  ?security_group_ids:security_group_ids ->
  ?tags:tags ->
  ?windows_configuration:create_file_system_windows_configuration ->
  ?lustre_configuration:create_file_system_lustre_configuration ->
  ?storage_type:storage_type ->
  ?kms_key_id:kms_key_id ->
  ?file_system_type_version:file_system_type_version ->
  ?open_zfs_configuration:create_file_system_open_zfs_configuration ->
  ?storage_capacity:storage_capacity ->
  ?network_type:network_type ->
  backup_id:backup_id ->
  subnet_ids:subnet_ids ->
  unit ->
  create_file_system_from_backup_request

val make_create_file_system_response :
  ?file_system:file_system -> unit -> create_file_system_response

val make_create_file_system_ontap_configuration :
  ?automatic_backup_retention_days:automatic_backup_retention_days ->
  ?daily_automatic_backup_start_time:daily_time ->
  ?endpoint_ip_address_range:ip_address_range ->
  ?fsx_admin_password:admin_password ->
  ?disk_iops_configuration:disk_iops_configuration ->
  ?preferred_subnet_id:subnet_id ->
  ?route_table_ids:route_table_ids ->
  ?throughput_capacity:megabytes_per_second ->
  ?weekly_maintenance_start_time:weekly_time ->
  ?ha_pairs:ha_pairs ->
  ?throughput_capacity_per_ha_pair:throughput_capacity_per_ha_pair ->
  ?endpoint_ipv6_address_range:ipv6_address_range ->
  deployment_type:ontap_deployment_type ->
  unit ->
  create_file_system_ontap_configuration

val make_create_file_system_request :
  ?client_request_token:client_request_token ->
  ?storage_capacity:storage_capacity ->
  ?storage_type:storage_type ->
  ?security_group_ids:security_group_ids ->
  ?tags:tags ->
  ?kms_key_id:kms_key_id ->
  ?windows_configuration:create_file_system_windows_configuration ->
  ?lustre_configuration:create_file_system_lustre_configuration ->
  ?ontap_configuration:create_file_system_ontap_configuration ->
  ?file_system_type_version:file_system_type_version ->
  ?open_zfs_configuration:create_file_system_open_zfs_configuration ->
  ?network_type:network_type ->
  file_system_type:file_system_type ->
  subnet_ids:subnet_ids ->
  unit ->
  create_file_system_request

val make_file_cache_creating :
  ?owner_id:aws_account_id ->
  ?creation_time:creation_time ->
  ?file_cache_id:file_cache_id ->
  ?file_cache_type:file_cache_type ->
  ?file_cache_type_version:file_system_type_version ->
  ?lifecycle:file_cache_lifecycle ->
  ?failure_details:file_cache_failure_details ->
  ?storage_capacity:storage_capacity ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?network_interface_ids:network_interface_ids ->
  ?dns_name:dns_name ->
  ?kms_key_id:kms_key_id ->
  ?resource_ar_n:resource_ar_n ->
  ?tags:tags ->
  ?copy_tags_to_data_repository_associations:copy_tags_to_data_repository_associations ->
  ?lustre_configuration:file_cache_lustre_configuration ->
  ?data_repository_association_ids:data_repository_association_ids ->
  unit ->
  file_cache_creating

val make_create_file_cache_response :
  ?file_cache:file_cache_creating -> unit -> create_file_cache_response

val make_file_cache_nfs_configuration :
  ?dns_ips:repository_dns_ips -> version:nfs_version -> unit -> file_cache_nfs_configuration

val make_file_cache_data_repository_association :
  ?data_repository_subdirectories:sub_directories_paths ->
  ?nf_s:file_cache_nfs_configuration ->
  file_cache_path:namespace ->
  data_repository_path:archive_path ->
  unit ->
  file_cache_data_repository_association

val make_create_file_cache_lustre_configuration :
  ?weekly_maintenance_start_time:weekly_time ->
  per_unit_storage_throughput:per_unit_storage_throughput ->
  deployment_type:file_cache_lustre_deployment_type ->
  metadata_configuration:file_cache_lustre_metadata_configuration ->
  unit ->
  create_file_cache_lustre_configuration

val make_create_file_cache_request :
  ?client_request_token:client_request_token ->
  ?security_group_ids:security_group_ids ->
  ?tags:tags ->
  ?copy_tags_to_data_repository_associations:copy_tags_to_data_repository_associations ->
  ?kms_key_id:kms_key_id ->
  ?lustre_configuration:create_file_cache_lustre_configuration ->
  ?data_repository_associations:create_file_cache_data_repository_associations ->
  file_cache_type:file_cache_type ->
  file_cache_type_version:file_system_type_version ->
  storage_capacity:storage_capacity ->
  subnet_ids:subnet_ids ->
  unit ->
  create_file_cache_request

val make_create_data_repository_task_response :
  ?data_repository_task:data_repository_task -> unit -> create_data_repository_task_response

val make_create_data_repository_task_request :
  ?paths:data_repository_task_paths ->
  ?client_request_token:client_request_token ->
  ?tags:tags ->
  ?capacity_to_release:capacity_to_release ->
  ?release_configuration:release_configuration ->
  type_:data_repository_task_type ->
  file_system_id:file_system_id ->
  report:completion_report ->
  unit ->
  create_data_repository_task_request

val make_create_data_repository_association_response :
  ?association:data_repository_association -> unit -> create_data_repository_association_response

val make_create_data_repository_association_request :
  ?file_system_path:namespace ->
  ?batch_import_meta_data_on_create:batch_import_meta_data_on_create ->
  ?imported_file_chunk_size:megabytes ->
  ?s3:s3_data_repository_configuration ->
  ?client_request_token:client_request_token ->
  ?tags:tags ->
  file_system_id:file_system_id ->
  data_repository_path:archive_path ->
  unit ->
  create_data_repository_association_request

val make_create_backup_response : ?backup:backup -> unit -> create_backup_response

val make_create_backup_request :
  ?file_system_id:file_system_id ->
  ?client_request_token:client_request_token ->
  ?tags:tags ->
  ?volume_id:volume_id ->
  unit ->
  create_backup_request

val make_create_and_attach_s3_access_point_response :
  ?s3_access_point_attachment:s3_access_point_attachment ->
  unit ->
  create_and_attach_s3_access_point_response

val make_create_and_attach_s3_access_point_s3_configuration :
  ?vpc_configuration:s3_access_point_vpc_configuration ->
  ?policy:access_point_policy ->
  unit ->
  create_and_attach_s3_access_point_s3_configuration

val make_create_and_attach_s3_access_point_ontap_configuration :
  volume_id:volume_id ->
  file_system_identity:ontap_file_system_identity ->
  unit ->
  create_and_attach_s3_access_point_ontap_configuration

val make_create_and_attach_s3_access_point_open_zfs_configuration :
  volume_id:volume_id ->
  file_system_identity:open_zfs_file_system_identity ->
  unit ->
  create_and_attach_s3_access_point_open_zfs_configuration

val make_create_and_attach_s3_access_point_request :
  ?client_request_token:client_request_token ->
  ?open_zfs_configuration:create_and_attach_s3_access_point_open_zfs_configuration ->
  ?ontap_configuration:create_and_attach_s3_access_point_ontap_configuration ->
  ?s3_access_point:create_and_attach_s3_access_point_s3_configuration ->
  name:s3_access_point_attachment_name ->
  type_:s3_access_point_attachment_type ->
  unit ->
  create_and_attach_s3_access_point_request

val make_copy_snapshot_and_update_volume_response :
  ?volume_id:volume_id ->
  ?lifecycle:volume_lifecycle ->
  ?administrative_actions:administrative_actions ->
  unit ->
  copy_snapshot_and_update_volume_response

val make_copy_snapshot_and_update_volume_request :
  ?client_request_token:client_request_token ->
  ?copy_strategy:open_zfs_copy_strategy ->
  ?options:update_open_zfs_volume_options ->
  volume_id:volume_id ->
  source_snapshot_ar_n:resource_ar_n ->
  unit ->
  copy_snapshot_and_update_volume_request

val make_copy_backup_response : ?backup:backup -> unit -> copy_backup_response

val make_copy_backup_request :
  ?client_request_token:client_request_token ->
  ?source_region:region ->
  ?kms_key_id:kms_key_id ->
  ?copy_tags:flag ->
  ?tags:tags ->
  source_backup_id:source_backup_id ->
  unit ->
  copy_backup_request

val make_cancel_data_repository_task_response :
  ?lifecycle:data_repository_task_lifecycle ->
  ?task_id:task_id ->
  unit ->
  cancel_data_repository_task_response

val make_cancel_data_repository_task_request :
  task_id:task_id -> unit -> cancel_data_repository_task_request

val make_associate_file_system_aliases_response :
  ?aliases:aliases -> unit -> associate_file_system_aliases_response

val make_associate_file_system_aliases_request :
  ?client_request_token:client_request_token ->
  file_system_id:file_system_id ->
  aliases:alternate_dns_names ->
  unit ->
  associate_file_system_aliases_request
