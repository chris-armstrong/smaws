(** FSx client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AssociateFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_aliases_request ->
    ( associate_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_file_system_aliases_request ->
    ( associate_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this action to associate one or more Domain Name Server (DNS) aliases with an existing \
   Amazon FSx for Windows File Server file system. A file system can have a maximum of 50 DNS \
   aliases associated with it at any one time. If you try to associate a DNS alias that is already \
   associated with the file system, FSx takes no action on that alias in the request. For more \
   information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}Working with \
   DNS Aliases} and \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/walkthrough05-file-system-custom-CNAME.html}Walkthrough \
   5: Using DNS aliases to access your file system}, including additional steps you must take to \
   be able to access your file system using a DNS alias.\n\n\
  \ The system response shows the DNS aliases that Amazon FSx is attempting to associate with the \
   file system. Use the API operation to monitor the status of the aliases Amazon FSx is \
   associating with the file system.\n\
  \ "]

module CancelDataRepositoryTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskEnded of data_repository_task_ended
    | `DataRepositoryTaskNotFound of data_repository_task_not_found
    | `InternalServerError of internal_server_error
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_repository_task_request ->
    ( cancel_data_repository_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskEnded of data_repository_task_ended
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `InternalServerError of internal_server_error
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_repository_task_request ->
    ( cancel_data_repository_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskEnded of data_repository_task_ended
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `InternalServerError of internal_server_error
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the \
   [PENDING] or [EXECUTING] state. When you cancel an export task, Amazon FSx does the following.\n\n\
  \ {ul\n\
  \       {-  Any files that FSx has already exported are not reverted.\n\
  \           \n\
  \            }\n\
  \       {-  FSx continues to export any files that are in-flight when the cancel operation is \
   received.\n\
  \           \n\
  \            }\n\
  \       {-  FSx does not export any files that have not yet been exported.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For a release task, Amazon FSx will stop releasing files upon cancellation. Any files that \
   have already been released will remain in the released state.\n\
  \   "]

module CopyBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
    | `InternalServerError of internal_server_error
    | `InvalidDestinationKmsKey of invalid_destination_kms_key
    | `InvalidRegion of invalid_region
    | `InvalidSourceKmsKey of invalid_source_kms_key
    | `ServiceLimitExceeded of service_limit_exceeded
    | `SourceBackupUnavailable of source_backup_unavailable
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_request ->
    ( copy_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
      | `InternalServerError of internal_server_error
      | `InvalidDestinationKmsKey of invalid_destination_kms_key
      | `InvalidRegion of invalid_region
      | `InvalidSourceKmsKey of invalid_source_kms_key
      | `ServiceLimitExceeded of service_limit_exceeded
      | `SourceBackupUnavailable of source_backup_unavailable
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_backup_request ->
    ( copy_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `IncompatibleRegionForMultiAZ of incompatible_region_for_multi_a_z
      | `InternalServerError of internal_server_error
      | `InvalidDestinationKmsKey of invalid_destination_kms_key
      | `InvalidRegion of invalid_region
      | `InvalidSourceKmsKey of invalid_source_kms_key
      | `ServiceLimitExceeded of service_limit_exceeded
      | `SourceBackupUnavailable of source_backup_unavailable
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies an existing backup within the same Amazon Web Services account to another Amazon Web \
   Services Region (cross-Region copy) or within the same Amazon Web Services Region (in-Region \
   copy). You can have up to five backup copy requests in progress to a single destination Region \
   per account.\n\n\
  \ You can use cross-Region backup copies for cross-Region disaster recovery. You can \
   periodically take backups and copy them to another Region so that in the event of a disaster in \
   the primary Region, you can restore from backup and recover availability quickly in the other \
   Region. You can make cross-Region copies only within your Amazon Web Services partition. A \
   partition is a grouping of Regions. Amazon Web Services currently has three partitions: [aws] \
   (Standard Regions), [aws-cn] (China Regions), and [aws-us-gov] (Amazon Web Services GovCloud \
   \\[US\\] Regions).\n\
  \ \n\
  \  You can also use backup copies to clone your file dataset to another Region or within the \
   same Region.\n\
  \  \n\
  \   You can use the [SourceRegion] parameter to specify the Amazon Web Services Region from \
   which the backup will be copied. For example, if you make the call from the [us-west-1] Region \
   and want to copy a backup from the [us-east-2] Region, you specify [us-east-2] in the \
   [SourceRegion] parameter to make a cross-Region copy. If you don't specify a Region, the backup \
   copy is created in the same Region where the request is sent from (in-Region copy).\n\
  \   \n\
  \    For more information about creating backup copies, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#copy-backups} Copying \
   backups} in the {i Amazon FSx for Windows User Guide}, \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html#copy-backups}Copying \
   backups} in the {i Amazon FSx for Lustre User Guide}, and \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html#copy-backups}Copying \
   backups} in the {i Amazon FSx for OpenZFS User Guide}.\n\
  \    "]

module CopySnapshotAndUpdateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_and_update_volume_request ->
    ( copy_snapshot_and_update_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_snapshot_and_update_volume_request ->
    ( copy_snapshot_and_update_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing volume by using a snapshot from another Amazon FSx for OpenZFS file system. \
   For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/on-demand-replication.html}on-demand \
   data replication} in the Amazon FSx for OpenZFS User Guide.\n"]

module CreateAndAttachS3AccessPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidAccessPoint of invalid_access_point
    | `InvalidRequest of invalid_request
    | `TooManyAccessPoints of too_many_access_points
    | `UnsupportedOperation of unsupported_operation
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_and_attach_s3_access_point_request ->
    ( create_and_attach_s3_access_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidAccessPoint of invalid_access_point
      | `InvalidRequest of invalid_request
      | `TooManyAccessPoints of too_many_access_points
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_and_attach_s3_access_point_request ->
    ( create_and_attach_s3_access_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessPointAlreadyOwnedByYou of access_point_already_owned_by_you
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidAccessPoint of invalid_access_point
      | `InvalidRequest of invalid_request
      | `TooManyAccessPoints of too_many_access_points
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an S3 access point and attaches it to an Amazon FSx volume. For FSx for OpenZFS file \
   systems, the volume must be hosted on a high-availability file system, either Single-AZ or \
   Multi-AZ. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/s3accesspoints-for-FSx.html}Accessing \
   your data using Amazon S3 access points}. in the Amazon FSx for OpenZFS User Guide. \n\n\
  \ The requester requires the following permissions to perform these actions:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:CreateAndAttachS3AccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:CreateAccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:GetAccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:PutAccessPointPolicy] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:DeleteAccessPoint] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   The following actions are related to [CreateAndAttachS3AccessPoint]:\n\
  \   \n\
  \    {ul\n\
  \          {-   [DescribeS3AccessPointAttachments] \n\
  \              \n\
  \               }\n\
  \          {-   [DetachAndDeleteS3AccessPoint] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupInProgress of backup_in_progress
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_backup_request ->
    ( create_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupInProgress of backup_in_progress
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_backup_request ->
    ( create_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupInProgress of backup_in_progress
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a backup of an existing Amazon FSx for Windows File Server file system, Amazon FSx for \
   Lustre file system, Amazon FSx for NetApp ONTAP volume, or Amazon FSx for OpenZFS file system. \
   We recommend creating regular backups so that you can restore a file system or volume from a \
   backup if an issue arises with the original file system or volume.\n\n\
  \ For Amazon FSx for Lustre file systems, you can create a backup only for file systems that \
   have the following configuration:\n\
  \ \n\
  \  {ul\n\
  \        {-  A Persistent deployment type\n\
  \            \n\
  \             }\n\
  \        {-  Are {i not} linked to a data repository\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about backups, see the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  For Amazon FSx for Lustre, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html}Working with FSx \
   for Lustre backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for Windows, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html}Working with FSx for \
   Windows backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for NetApp ONTAP, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/using-backups.html}Working with FSx for \
   NetApp ONTAP backups}.\n\
  \              \n\
  \               }\n\
  \          {-  For Amazon FSx for OpenZFS, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html}Working with FSx for \
   OpenZFS backups}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If a backup with the specified client request token exists and the parameters match, this \
   operation returns the description of the existing backup. If a backup with the specified client \
   request token exists and the parameters don't match, this operation returns \
   [IncompatibleParameterError]. If a backup with the specified client request token doesn't \
   exist, [CreateBackup] does the following: \n\
  \   \n\
  \    {ul\n\
  \          {-  Creates a new Amazon FSx backup with an assigned ID, and an initial lifecycle \
   state of [CREATING].\n\
  \              \n\
  \               }\n\
  \          {-  Returns the description of the backup.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   By using the idempotent operation, you can retry a [CreateBackup] operation without the risk \
   of creating an extra backup. This approach can be useful when an initial call fails in a way \
   that makes it unclear whether a backup was created. If you use the same client request token \
   and the initial call created a backup, the operation returns a successful result because all \
   the parameters are the same.\n\
  \   \n\
  \    The [CreateBackup] operation returns while the backup's lifecycle state is still \
   [CREATING]. You can check the backup creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeBackups.html}DescribeBackups} \
   operation, which returns the backup state along with other information.\n\
  \    "]

module CreateDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_association_request ->
    ( create_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_association_request ->
    ( create_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon FSx for Lustre data repository association (DRA). A data repository \
   association is a link between a directory on the file system and an Amazon S3 bucket or prefix. \
   You can have a maximum of 8 data repository associations on a file system. Data repository \
   associations are supported on all FSx for Lustre 2.12 and 2.15 file systems, excluding \
   [scratch_1] deployment type.\n\n\
  \ Each data repository association must have a unique Amazon FSx file system directory and a \
   unique S3 bucket or prefix associated with it. You can configure a data repository association \
   for automatic import only, for automatic export only, or for both. To learn more about linking \
   a data repository to your file system, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html}Linking \
   your file system to an S3 bucket}.\n\
  \ \n\
  \    [CreateDataRepositoryAssociation] isn't supported on Amazon File Cache resources. To create \
   a DRA on Amazon File Cache, use the [CreateFileCache] operation.\n\
  \   \n\
  \    "]

module CreateDataRepositoryTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskExecuting of data_repository_task_executing
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_task_request ->
    ( create_data_repository_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskExecuting of data_repository_task_executing
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_repository_task_request ->
    ( create_data_repository_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskExecuting of data_repository_task_executing
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon FSx for Lustre data repository task. A [CreateDataRepositoryTask] operation \
   will fail if a data repository is not linked to the FSx file system.\n\n\
  \ You use import and export data repository tasks to perform bulk operations between your FSx \
   for Lustre file system and its linked data repositories. An example of a data repository task \
   is exporting any data and metadata changes, including POSIX metadata, to files, directories, \
   and symbolic links (symlinks) from your FSx file system to a linked data repository.\n\
  \ \n\
  \  You use release data repository tasks to release data from your file system for files that \
   are exported to S3. The metadata of released files remains on the file system so users or \
   applications can still access released files by reading the files again, which will restore \
   data from Amazon S3 to the FSx for Lustre file system.\n\
  \  \n\
  \   To learn more about data repository tasks, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html}Data \
   Repository Tasks}. To learn more about linking a data repository to your file system, see \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html}Linking \
   your file system to an S3 bucket}.\n\
  \   "]

module CreateFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileCacheConfiguration of missing_file_cache_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_cache_request ->
    ( create_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_cache_request ->
    ( create_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon File Cache resource.\n\n\
  \ You can use this operation with a client request token in the request that Amazon File Cache \
   uses to ensure idempotent creation. If a cache with the specified client request token exists \
   and the parameters match, [CreateFileCache] returns the description of the existing cache. If a \
   cache with the specified client request token exists and the parameters don't match, this call \
   returns [IncompatibleParameterError]. If a file cache with the specified client request token \
   doesn't exist, [CreateFileCache] does the following: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new, empty Amazon File Cache resource with an assigned ID, and an initial \
   lifecycle state of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the cache in JSON format.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    The [CreateFileCache] call returns while the cache's lifecycle state is still [CREATING]. \
   You can check the cache creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html}DescribeFileCaches} \
   operation, which returns the cache state along with other information.\n\
  \    \n\
  \     "]

module CreateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidExportPath of invalid_export_path
    | `InvalidImportPath of invalid_import_path
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_request ->
    ( create_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidExportPath of invalid_export_path
      | `InvalidImportPath of invalid_import_path
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_request ->
    ( create_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidExportPath of invalid_export_path
      | `InvalidImportPath of invalid_import_path
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new, empty Amazon FSx file system. You can create the following supported Amazon FSx \
   file systems using the [CreateFileSystem] API operation:\n\n\
  \ {ul\n\
  \       {-  Amazon FSx for Lustre\n\
  \           \n\
  \            }\n\
  \       {-  Amazon FSx for NetApp ONTAP\n\
  \           \n\
  \            }\n\
  \       {-  Amazon FSx for OpenZFS\n\
  \           \n\
  \            }\n\
  \       {-  Amazon FSx for Windows File Server\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   This operation requires a client request token in the request that Amazon FSx uses to ensure \
   idempotent creation. This means that calling the operation multiple times with the same client \
   request token has no effect. By using the idempotent operation, you can retry a \
   [CreateFileSystem] operation without the risk of creating an extra file system. This approach \
   can be useful when an initial call fails in a way that makes it unclear whether a file system \
   was created. Examples are if a transport level timeout occurred, or your connection was reset. \
   If you use the same client request token and the initial call created a file system, the client \
   receives success as long as the parameters are the same.\n\
  \   \n\
  \    If a file system with the specified client request token exists and the parameters match, \
   [CreateFileSystem] returns the description of the existing file system. If a file system with \
   the specified client request token exists and the parameters don't match, this call returns \
   [IncompatibleParameterError]. If a file system with the specified client request token doesn't \
   exist, [CreateFileSystem] does the following:\n\
  \    \n\
  \     {ul\n\
  \           {-  Creates a new, empty Amazon FSx file system with an assigned ID, and an initial \
   lifecycle state of [CREATING].\n\
  \               \n\
  \                }\n\
  \           {-  Returns the description of the file system in JSON format.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    The [CreateFileSystem] call returns while the file system's lifecycle state is still \
   [CREATING]. You can check the file-system creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html}DescribeFileSystems} \
   operation, which returns the file system state along with other information.\n\
  \    \n\
  \     "]

module CreateFileSystemFromBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_from_backup_request ->
    ( create_file_system_from_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_file_system_from_backup_request ->
    ( create_file_system_from_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `InvalidPerUnitStorageThroughput of invalid_per_unit_storage_throughput
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon FSx for Lustre, Amazon FSx for Windows File Server, or Amazon FSx for \
   OpenZFS file system from an existing Amazon FSx backup.\n\n\
  \ If a file system with the specified client request token exists and the parameters match, this \
   operation returns the description of the file system. If a file system with the specified \
   client request token exists but the parameters don't match, this call returns \
   [IncompatibleParameterError]. If a file system with the specified client request token doesn't \
   exist, this operation does the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new Amazon FSx file system from backup with an assigned ID, and an \
   initial lifecycle state of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the file system.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Parameters like the Active Directory, default share name, automatic backup, and backup \
   settings default to the parameters of the file system that was backed up, unless overridden. \
   You can explicitly supply other settings.\n\
  \   \n\
  \    By using the idempotent operation, you can retry a [CreateFileSystemFromBackup] call \
   without the risk of creating an extra file system. This approach can be useful when an initial \
   call fails in a way that makes it unclear whether a file system was created. Examples are if a \
   transport level timeout occurred, or your connection was reset. If you use the same client \
   request token and the initial call created a file system, the client receives a success message \
   as long as the parameters are the same.\n\
  \    \n\
  \      The [CreateFileSystemFromBackup] call returns while the file system's lifecycle state is \
   still [CREATING]. You can check the file-system creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html} \
   DescribeFileSystems} operation, which returns the file system state along with other \
   information.\n\
  \      \n\
  \       "]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of an existing Amazon FSx for OpenZFS volume. With snapshots, you can easily \
   undo file changes and compare file versions by restoring the volume to a previous version.\n\n\
  \ If a snapshot with the specified client request token exists, and the parameters match, this \
   operation returns the description of the existing snapshot. If a snapshot with the specified \
   client request token exists, and the parameters don't match, this operation returns \
   [IncompatibleParameterError]. If a snapshot with the specified client request token doesn't \
   exist, [CreateSnapshot] does the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a new OpenZFS snapshot with an assigned ID, and an initial lifecycle state \
   of [CREATING].\n\
  \            \n\
  \             }\n\
  \        {-  Returns the description of the snapshot.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   By using the idempotent operation, you can retry a [CreateSnapshot] operation without the \
   risk of creating an extra snapshot. This approach can be useful when an initial call fails in a \
   way that makes it unclear whether a snapshot was created. If you use the same client request \
   token and the initial call created a snapshot, the operation returns a successful result \
   because all the parameters are the same.\n\
  \   \n\
  \    The [CreateSnapshot] operation returns while the snapshot's lifecycle state is still \
   [CREATING]. You can check the snapshot creation status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeSnapshots.html}DescribeSnapshots} \
   operation, which returns the snapshot state along with other information.\n\
  \    "]

module CreateStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActiveDirectoryError of active_directory_error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_storage_virtual_machine_request ->
    ( create_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_storage_virtual_machine_request ->
    ( create_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActiveDirectoryError of active_directory_error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a storage virtual machine (SVM) for an Amazon FSx for ONTAP file system.\n"]

module CreateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_volume_request ->
    ( create_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_volume_request ->
    ( create_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an FSx for ONTAP or Amazon FSx for OpenZFS storage volume.\n"]

module CreateVolumeFromBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_volume_from_backup_request ->
    ( create_volume_from_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_volume_from_backup_request ->
    ( create_volume_from_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon FSx for NetApp ONTAP volume from an existing Amazon FSx volume backup.\n"]

module DeleteBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupBeingCopied of backup_being_copied
    | `BackupInProgress of backup_in_progress
    | `BackupNotFound of backup_not_found
    | `BackupRestoring of backup_restoring
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupBeingCopied of backup_being_copied
      | `BackupInProgress of backup_in_progress
      | `BackupNotFound of backup_not_found
      | `BackupRestoring of backup_restoring
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_backup_request ->
    ( delete_backup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupBeingCopied of backup_being_copied
      | `BackupInProgress of backup_in_progress
      | `BackupNotFound of backup_not_found
      | `BackupRestoring of backup_restoring
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon FSx backup. After deletion, the backup no longer exists, and its data is \
   gone.\n\n\
  \ The [DeleteBackup] call returns instantly. The backup won't show up in later [DescribeBackups] \
   calls.\n\
  \ \n\
  \   The data in a deleted backup is also deleted and can't be recovered by any means.\n\
  \   \n\
  \    "]

module DeleteDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_repository_association_request ->
    ( delete_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_repository_association_request ->
    ( delete_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a data repository association on an Amazon FSx for Lustre file system. Deleting the \
   data repository association unlinks the file system from the Amazon S3 bucket. When deleting a \
   data repository association, you have the option of deleting the data in the file system that \
   corresponds to the data repository association. Data repository associations are supported on \
   all FSx for Lustre 2.12 and 2.15 file systems, excluding [scratch_1] deployment type.\n"]

module DeleteFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_cache_request ->
    ( delete_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_cache_request ->
    ( delete_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon File Cache resource. After deletion, the cache no longer exists, and its data \
   is gone.\n\n\
  \ The [DeleteFileCache] operation returns while the cache has the [DELETING] status. You can \
   check the cache deletion status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html}DescribeFileCaches} \
   operation, which returns a list of caches in your account. If you pass the cache ID for a \
   deleted cache, the [DescribeFileCaches] operation returns a [FileCacheNotFound] error.\n\
  \ \n\
  \   The data in a deleted cache is also deleted and can't be recovered by any means.\n\
  \   \n\
  \    "]

module DeleteFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_file_system_request ->
    ( delete_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_file_system_request ->
    ( delete_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a file system. After deletion, the file system no longer exists, and its data is gone. \
   Any existing automatic backups and snapshots are also deleted.\n\n\
  \ To delete an Amazon FSx for NetApp ONTAP file system, first delete all the volumes and storage \
   virtual machines (SVMs) on the file system. Then provide a [FileSystemId] value to the \
   [DeleteFileSystem] operation.\n\
  \ \n\
  \  Before deleting an Amazon FSx for OpenZFS file system, make sure that there aren't any Amazon \
   S3 access points attached to any volume. For more information on how to list S3 access points \
   that are attached to volumes, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/access-points-list.html}Listing S3 \
   access point attachments}. For more information on how to delete S3 access points, see \
   {{:https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/delete-access-point.html}Deleting an S3 \
   access point attachment}.\n\
  \  \n\
  \   By default, when you delete an Amazon FSx for Windows File Server file system, a final \
   backup is created upon deletion. This final backup isn't subject to the file system's retention \
   policy, and must be manually deleted.\n\
  \   \n\
  \    To delete an Amazon FSx for Lustre file system, first \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/unmounting-fs.html}unmount} it from every \
   connected Amazon EC2 instance, then provide a [FileSystemId] value to the [DeleteFileSystem] \
   operation. By default, Amazon FSx will not take a final backup when the [DeleteFileSystem] \
   operation is invoked. On file systems not linked to an Amazon S3 bucket, set [SkipFinalBackup] \
   to [false] to take a final backup of the file system you are deleting. Backups cannot be \
   enabled on S3-linked file systems. To ensure all of your data is written back to S3 before \
   deleting your file system, you can either monitor for the \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/monitoring-cloudwatch.html#auto-import-export-metrics}AgeOfOldestQueuedMessage} \
   metric to be zero (if using automatic export) or you can run an \
   {{:https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repo-task-dra.html}export \
   data repository task}. If you have automatic export enabled and want to use an export data \
   repository task, you have to disable automatic export before executing the export data \
   repository task.\n\
  \    \n\
  \     The [DeleteFileSystem] operation returns while the file system has the [DELETING] status. \
   You can check the file system deletion status by calling the \
   {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html}DescribeFileSystems} \
   operation, which returns a list of file systems in your account. If you pass the file system ID \
   for a deleted file system, the [DescribeFileSystems] operation returns a [FileSystemNotFound] \
   error.\n\
  \     \n\
  \       If a data repository task is in a [PENDING] or [EXECUTING] state, deleting an Amazon FSx \
   for Lustre file system will fail with an HTTP status code 400 (Bad Request).\n\
  \       \n\
  \          The data in a deleted file system is also deleted and can't be recovered by any means.\n\
  \          \n\
  \           "]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon FSx for OpenZFS snapshot. After deletion, the snapshot no longer exists, and \
   its data is gone. Deleting a snapshot doesn't affect snapshots stored in a file system backup. \
   \n\n\
  \ The [DeleteSnapshot] operation returns instantly. The snapshot appears with the lifecycle \
   status of [DELETING] until the deletion is complete.\n\
  \ "]

module DeleteStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_storage_virtual_machine_request ->
    ( delete_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_storage_virtual_machine_request ->
    ( delete_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing Amazon FSx for ONTAP storage virtual machine (SVM). Prior to deleting an \
   SVM, you must delete all non-root volumes in the SVM, otherwise the operation will fail.\n"]

module DeleteVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_request ->
    ( delete_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_volume_request ->
    ( delete_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.\n"]

module DescribeBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackupNotFound of backup_not_found
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_backups_request ->
    ( describe_backups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackupNotFound of backup_not_found
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of a specific Amazon FSx backup, if a [BackupIds] value is provided for \
   that backup. Otherwise, it returns all backups owned by your Amazon Web Services account in the \
   Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all backups, you can optionally specify the [MaxResults] parameter to limit \
   the number of backups in a response. If more backups remain, Amazon FSx returns a [NextToken] \
   value in the response. In this case, send a later request with the [NextToken] request \
   parameter set to the value of the [NextToken] value from the last response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your backups. \
   [DescribeBackups] is called first without a [NextToken] value. Then the operation continues to \
   be called with the [NextToken] parameter set to the value of the last [NextToken] value until a \
   response has no [NextToken] value.\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The operation might return fewer than the [MaxResults] value of backup \
   descriptions while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of the backups returned in the response of one [DescribeBackups] call \
   and the order of the backups returned across the responses of a multi-call iteration is \
   unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeDataRepositoryAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error
    | `InvalidDataRepositoryType of invalid_data_repository_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_associations_request ->
    ( describe_data_repository_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `InvalidDataRepositoryType of invalid_data_repository_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_associations_request ->
    ( describe_data_repository_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error
      | `InvalidDataRepositoryType of invalid_data_repository_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository \
   associations, if one or more [AssociationIds] values are provided in the request, or if filters \
   are used in the request. Data repository associations are supported on Amazon File Cache \
   resources and all FSx for Lustre 2.12 and 2,15 file systems, excluding [scratch_1] deployment \
   type.\n\n\
  \ You can use filters to narrow the response to include just data repository associations for \
   specific file systems (use the [file-system-id] filter with the ID of the file system) or \
   caches (use the [file-cache-id] filter with the ID of the cache), or data repository \
   associations for a specific repository type (use the [data-repository-type] filter with a value \
   of [S3] or [NFS]). If you don't use filters, the response returns all data repository \
   associations owned by your Amazon Web Services account in the Amazon Web Services Region of the \
   endpoint that you're calling.\n\
  \ \n\
  \  When retrieving all data repository associations, you can paginate the response by using the \
   optional [MaxResults] parameter to limit the number of data repository associations returned in \
   a response. If more data repository associations remain, a [NextToken] value is returned in the \
   response. In this case, send a later request with the [NextToken] request parameter set to the \
   value of [NextToken] from the last response.\n\
  \  "]

module DescribeDataRepositoryTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryTaskNotFound of data_repository_task_not_found
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_tasks_request ->
    ( describe_data_repository_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_repository_tasks_request ->
    ( describe_data_repository_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryTaskNotFound of data_repository_task_not_found
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for Lustre or Amazon File Cache data repository \
   tasks, if one or more [TaskIds] values are provided in the request, or if filters are used in \
   the request. You can use filters to narrow the response to include just tasks for specific file \
   systems or caches, or tasks in a specific lifecycle state. Otherwise, it returns all data \
   repository tasks owned by your Amazon Web Services account in the Amazon Web Services Region of \
   the endpoint that you're calling.\n\n\
  \ When retrieving all tasks, you can paginate the response by using the optional [MaxResults] \
   parameter to limit the number of tasks returned in a response. If more tasks remain, a \
   [NextToken] value is returned in the response. In this case, send a later request with the \
   [NextToken] request parameter set to the value of [NextToken] from the last response.\n\
  \ "]

module DescribeFileCaches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_caches_request ->
    ( describe_file_caches_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_caches_request ->
    ( describe_file_caches_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of a specific Amazon File Cache resource, if a [FileCacheIds] value is \
   provided for that cache. Otherwise, it returns descriptions of all caches owned by your Amazon \
   Web Services account in the Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all cache descriptions, you can optionally specify the [MaxResults] parameter \
   to limit the number of descriptions in a response. If more cache descriptions remain, the \
   operation returns a [NextToken] value in the response. In this case, send a later request with \
   the [NextToken] request parameter set to the value of [NextToken] from the last response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your cache descriptions. \
   [DescribeFileCaches] is called first without a [NextToken]value. Then the operation continues \
   to be called with the [NextToken] parameter set to the value of the last [NextToken] value \
   until a response has no [NextToken].\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] cache descriptions while \
   still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of caches returned in the response of one [DescribeFileCaches] call and \
   the order of caches returned across the responses of a multicall iteration is unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_aliases_request ->
    ( describe_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_system_aliases_request ->
    ( describe_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the DNS aliases that are associated with the specified Amazon FSx for Windows File \
   Server file system. A history of all DNS aliases that have been associated with and \
   disassociated from the file system is available in the list of [AdministrativeAction] provided \
   in the [DescribeFileSystems] operation response.\n"]

module DescribeFileSystems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_file_systems_request ->
    ( describe_file_systems_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_file_systems_request ->
    ( describe_file_systems_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx file systems, if a [FileSystemIds] value is \
   provided for that file system. Otherwise, it returns descriptions of all file systems owned by \
   your Amazon Web Services account in the Amazon Web Services Region of the endpoint that you're \
   calling.\n\n\
  \ When retrieving all file system descriptions, you can optionally specify the [MaxResults] \
   parameter to limit the number of descriptions in a response. If more file system descriptions \
   remain, Amazon FSx returns a [NextToken] value in the response. In this case, send a later \
   request with the [NextToken] request parameter set to the value of [NextToken] from the last \
   response.\n\
  \ \n\
  \  This operation is used in an iterative process to retrieve a list of your file system \
   descriptions. [DescribeFileSystems] is called first without a [NextToken]value. Then the \
   operation continues to be called with the [NextToken] parameter set to the value of the last \
   [NextToken] value until a response has no [NextToken].\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] file system descriptions \
   while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of file systems returned in the response of one [DescribeFileSystems] \
   call and the order of file systems returned across the responses of a multicall iteration is \
   unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeS3AccessPointAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_s3_access_point_attachments_request ->
    ( describe_s3_access_point_attachments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_s3_access_point_attachments_request ->
    ( describe_s3_access_point_attachments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more S3 access points attached to Amazon FSx volumes.\n\n\
  \ The requester requires the following permission to perform this action:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:DescribeS3AccessPointAttachments] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeSharedVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_vpc_configuration_request ->
    ( describe_shared_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_vpc_configuration_request ->
    ( describe_shared_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Indicates whether participant accounts in your organization can create Amazon FSx for NetApp \
   ONTAP Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. \
   For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/creating-file-systems.html#fsxn-vpc-shared-subnets}Creating \
   FSx for ONTAP file systems in shared subnets}. \n"]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of specific Amazon FSx for OpenZFS snapshots, if a [SnapshotIds] value \
   is provided. Otherwise, this operation returns all snapshots owned by your Amazon Web Services \
   account in the Amazon Web Services Region of the endpoint that you're calling.\n\n\
  \ When retrieving all snapshots, you can optionally specify the [MaxResults] parameter to limit \
   the number of snapshots in a response. If more backups remain, Amazon FSx returns a [NextToken] \
   value in the response. In this case, send a later request with the [NextToken] request \
   parameter set to the value of [NextToken] from the last response. \n\
  \ \n\
  \  Use this operation in an iterative process to retrieve a list of your snapshots. \
   [DescribeSnapshots] is called first without a [NextToken] value. Then the operation continues \
   to be called with the [NextToken] parameter set to the value of the last [NextToken] value \
   until a response has no [NextToken] value.\n\
  \  \n\
  \   When using this operation, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The operation might return fewer than the [MaxResults] value of snapshot \
   descriptions while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of snapshots returned in the response of one [DescribeSnapshots] call \
   and the order of backups returned across the responses of a multi-call iteration is \
   unspecified. \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DescribeStorageVirtualMachines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_storage_virtual_machines_request ->
    ( describe_storage_virtual_machines_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_storage_virtual_machines_request ->
    ( describe_storage_virtual_machines_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more Amazon FSx for NetApp ONTAP storage virtual machines (SVMs).\n"]

module DescribeVolumes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_volumes_request ->
    ( describe_volumes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_volumes_request ->
    ( describe_volumes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volumes.\n"]

module DetachAndDeleteS3AccessPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_and_delete_s3_access_point_request ->
    ( detach_and_delete_s3_access_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_and_delete_s3_access_point_request ->
    ( detach_and_delete_s3_access_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `S3AccessPointAttachmentNotFound of s3_access_point_attachment_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches an S3 access point from an Amazon FSx volume and deletes the S3 access point.\n\n\
  \ The requester requires the following permission to perform this action:\n\
  \ \n\
  \  {ul\n\
  \        {-   [fsx:DetachAndDeleteS3AccessPoint] \n\
  \            \n\
  \             }\n\
  \        {-   [s3:DeleteAccessPoint] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DisassociateFileSystemAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_aliases_request ->
    ( disassociate_file_system_aliases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_file_system_aliases_request ->
    ( disassociate_file_system_aliases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this action to disassociate, or remove, one or more Domain Name Service (DNS) aliases from \
   an Amazon FSx for Windows File Server file system. If you attempt to disassociate a DNS alias \
   that is not associated with the file system, Amazon FSx responds with an HTTP status code 400 \
   (Bad Request). For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html}Working with \
   DNS Aliases}.\n\n\
  \ The system generated response showing the DNS aliases that Amazon FSx is attempting to \
   disassociate from the file system. Use the API operation to monitor the status of the aliases \
   Amazon FSx is disassociating with the file system.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists tags for Amazon FSx resources.\n\n\
  \ When retrieving all tags, you can optionally specify the [MaxResults] parameter to limit the \
   number of tags in a response. If more tags remain, Amazon FSx returns a [NextToken] value in \
   the response. In this case, send a later request with the [NextToken] request parameter set to \
   the value of [NextToken] from the last response.\n\
  \ \n\
  \  This action is used in an iterative process to retrieve a list of your tags. \
   [ListTagsForResource] is called first without a [NextToken]value. Then the action continues to \
   be called with the [NextToken] parameter set to the value of the last [NextToken] value until a \
   response has no [NextToken].\n\
  \  \n\
  \   When using this action, keep the following in mind:\n\
  \   \n\
  \    {ul\n\
  \          {-  The implementation might return fewer than [MaxResults] file system descriptions \
   while still including a [NextToken] value.\n\
  \              \n\
  \               }\n\
  \          {-  The order of tags returned in the response of one [ListTagsForResource] call and \
   the order of tags returned across the responses of a multi-call iteration is unspecified.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ReleaseFileSystemNfsV3Locks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    release_file_system_nfs_v3_locks_request ->
    ( release_file_system_nfs_v3_locks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    release_file_system_nfs_v3_locks_request ->
    ( release_file_system_nfs_v3_locks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Releases the file system lock from an Amazon FSx for OpenZFS file system.\n"]

module RestoreVolumeFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_volume_from_snapshot_request ->
    ( restore_volume_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_volume_from_snapshot_request ->
    ( restore_volume_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an Amazon FSx for OpenZFS volume to the state saved by the specified snapshot.\n"]

module StartMisconfiguredStateRecovery : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_misconfigured_state_recovery_request ->
    ( start_misconfigured_state_recovery_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_misconfigured_state_recovery_request ->
    ( start_misconfigured_state_recovery_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "After performing steps to repair the Active Directory configuration of an FSx for Windows File \
   Server file system, use this action to initiate the process of Amazon FSx attempting to \
   reconnect to the file system.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Tags an Amazon FSx resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `NotServiceResourceError of not_service_resource_error
    | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
    | `ResourceNotFound of resource_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `NotServiceResourceError of not_service_resource_error
      | `ResourceDoesNotSupportTagging of resource_does_not_support_tagging
      | `ResourceNotFound of resource_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This action removes a tag from an Amazon FSx resource.\n"]

module UpdateDataRepositoryAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `DataRepositoryAssociationNotFound of data_repository_association_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `ServiceLimitExceeded of service_limit_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_repository_association_request ->
    ( update_data_repository_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_repository_association_request ->
    ( update_data_repository_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `DataRepositoryAssociationNotFound of data_repository_association_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `ServiceLimitExceeded of service_limit_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing data repository association on an Amazon FSx for \
   Lustre file system. Data repository associations are supported on all FSx for Lustre 2.12 and \
   2.15 file systems, excluding [scratch_1] deployment type.\n"]

module UpdateFileCache : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileCacheNotFound of file_cache_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingFileCacheConfiguration of missing_file_cache_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_file_cache_request ->
    ( update_file_cache_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_file_cache_request ->
    ( update_file_cache_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileCacheNotFound of file_cache_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingFileCacheConfiguration of missing_file_cache_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing Amazon File Cache resource. You can update multiple \
   properties in a single request.\n"]

module UpdateFileSystem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `FileSystemNotFound of file_system_not_found
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `InvalidNetworkSettings of invalid_network_settings
    | `MissingFileSystemConfiguration of missing_file_system_configuration
    | `ServiceLimitExceeded of service_limit_exceeded
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_request ->
    ( update_file_system_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_file_system_request ->
    ( update_file_system_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `FileSystemNotFound of file_system_not_found
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `InvalidNetworkSettings of invalid_network_settings
      | `MissingFileSystemConfiguration of missing_file_system_configuration
      | `ServiceLimitExceeded of service_limit_exceeded
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this operation to update the configuration of an existing Amazon FSx file system. You can \
   update multiple properties in a single request.\n\n\
  \ For FSx for Windows File Server file systems, you can update the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [AuditLogConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [AutomaticBackupRetentionDays] \n\
  \            \n\
  \             }\n\
  \        {-   [DailyAutomaticBackupStartTime] \n\
  \            \n\
  \             }\n\
  \        {-   [DiskIopsConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [SelfManagedActiveDirectoryConfiguration] \n\
  \            \n\
  \             }\n\
  \        {-   [StorageCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [StorageType] \n\
  \            \n\
  \             }\n\
  \        {-   [ThroughputCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [WeeklyMaintenanceStartTime] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For FSx for Lustre file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AutoImportPolicy] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DataCompressionType] \n\
  \              \n\
  \               }\n\
  \          {-   [FileSystemTypeVersion] \n\
  \              \n\
  \               }\n\
  \          {-   [LogConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [LustreReadCacheConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [LustreRootSquashConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [MetadataConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [PerUnitStorageThroughput] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For FSx for ONTAP file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AddRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DiskIopsConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [EndpointIpv6AddressRange] \n\
  \              \n\
  \               }\n\
  \          {-   [FsxAdminPassword] \n\
  \              \n\
  \               }\n\
  \          {-   [HAPairs] \n\
  \              \n\
  \               }\n\
  \          {-   [RemoveRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacityPerHAPair] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For FSx for OpenZFS file systems, you can update the following properties:\n\
  \   \n\
  \    {ul\n\
  \          {-   [AddRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [AutomaticBackupRetentionDays] \n\
  \              \n\
  \               }\n\
  \          {-   [CopyTagsToBackups] \n\
  \              \n\
  \               }\n\
  \          {-   [CopyTagsToVolumes] \n\
  \              \n\
  \               }\n\
  \          {-   [DailyAutomaticBackupStartTime] \n\
  \              \n\
  \               }\n\
  \          {-   [DiskIopsConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [EndpointIpv6AddressRange] \n\
  \              \n\
  \               }\n\
  \          {-   [ReadCacheConfiguration] \n\
  \              \n\
  \               }\n\
  \          {-   [RemoveRouteTableIds] \n\
  \              \n\
  \               }\n\
  \          {-   [StorageCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [ThroughputCapacity] \n\
  \              \n\
  \               }\n\
  \          {-   [WeeklyMaintenanceStartTime] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module UpdateSharedVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_shared_vpc_configuration_request ->
    ( update_shared_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_shared_vpc_configuration_request ->
    ( update_shared_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures whether participant accounts in your organization can create Amazon FSx for NetApp \
   ONTAP Multi-AZ file systems in subnets that are shared by a virtual private cloud (VPC) owner. \
   For more information, see the \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html}Amazon FSx for NetApp \
   ONTAP User Guide}.\n\n\
  \  We strongly recommend that participant-created Multi-AZ file systems in the shared VPC are \
   deleted before you disable this feature. Once the feature is disabled, these file systems will \
   enter a [MISCONFIGURED] state and behave like Single-AZ file systems. For more information, see \
   {{:https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html#disabling-maz-vpc-sharing}Important \
   considerations before disabling shared VPC support for Multi-AZ file systems}.\n\
  \  \n\
  \   "]

module UpdateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `InternalServerError of internal_server_error
    | `SnapshotNotFound of snapshot_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `InternalServerError of internal_server_error
      | `SnapshotNotFound of snapshot_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of an Amazon FSx for OpenZFS snapshot.\n"]

module UpdateStorageVirtualMachine : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
    | `UnsupportedOperation of unsupported_operation ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_storage_virtual_machine_request ->
    ( update_storage_virtual_machine_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_storage_virtual_machine_request ->
    ( update_storage_virtual_machine_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `StorageVirtualMachineNotFound of storage_virtual_machine_not_found
      | `UnsupportedOperation of unsupported_operation ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an FSx for ONTAP storage virtual machine (SVM).\n"]

(** {1:Serialization and Deserialization} *)
module UpdateVolume : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequest of bad_request
    | `IncompatibleParameterError of incompatible_parameter_error
    | `InternalServerError of internal_server_error
    | `MissingVolumeConfiguration of missing_volume_configuration
    | `VolumeNotFound of volume_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_volume_request ->
    ( update_volume_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `VolumeNotFound of volume_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_volume_request ->
    ( update_volume_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequest of bad_request
      | `IncompatibleParameterError of incompatible_parameter_error
      | `InternalServerError of internal_server_error
      | `MissingVolumeConfiguration of missing_volume_configuration
      | `VolumeNotFound of volume_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
