open Types

let make_windows_fsrm_configuration
    ?event_log_destination:(event_log_destination_ : general_ar_n option)
    ~fsrm_service_enabled:(fsrm_service_enabled_ : flag) () =
  ({ event_log_destination = event_log_destination_; fsrm_service_enabled = fsrm_service_enabled_ }
    : windows_fsrm_configuration)

let make_self_managed_active_directory_attributes
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option)
    ?dns_ips:(dns_ips_ : dns_ips option) ?user_name:(user_name_ : directory_user_name option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option) () =
  ({
     domain_join_service_account_secret = domain_join_service_account_secret_;
     dns_ips = dns_ips_;
     user_name = user_name_;
     file_system_administrators_group = file_system_administrators_group_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     domain_name = domain_name_;
   }
    : self_managed_active_directory_attributes)

let make_alias ?lifecycle:(lifecycle_ : alias_lifecycle option)
    ?name:(name_ : alternate_dns_name option) () =
  ({ lifecycle = lifecycle_; name = name_ } : alias)

let make_windows_audit_log_configuration
    ?audit_log_destination:(audit_log_destination_ : general_ar_n option)
    ~file_share_access_audit_log_level:
      (file_share_access_audit_log_level_ : windows_access_audit_log_level)
    ~file_access_audit_log_level:(file_access_audit_log_level_ : windows_access_audit_log_level) ()
    =
  ({
     audit_log_destination = audit_log_destination_;
     file_share_access_audit_log_level = file_share_access_audit_log_level_;
     file_access_audit_log_level = file_access_audit_log_level_;
   }
    : windows_audit_log_configuration)

let make_disk_iops_configuration ?iops:(iops_ : iops option)
    ?mode:(mode_ : disk_iops_configuration_mode option) () =
  ({ iops = iops_; mode = mode_ } : disk_iops_configuration)

let make_windows_file_system_configuration
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option)
    ?preferred_file_server_ipv6:(preferred_file_server_ipv6_ : ip_address option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?audit_log_configuration:(audit_log_configuration_ : windows_audit_log_configuration option)
    ?aliases:(aliases_ : aliases option) ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?maintenance_operations_in_progress:
      (maintenance_operations_in_progress_ : file_system_maintenance_operations option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?preferred_file_server_ip:(preferred_file_server_ip_ : ip_address option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?remote_administration_endpoint:(remote_administration_endpoint_ : dns_name option)
    ?deployment_type:(deployment_type_ : windows_deployment_type option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_attributes option)
    ?active_directory_id:(active_directory_id_ : directory_id option) () =
  ({
     fsrm_configuration = fsrm_configuration_;
     preferred_file_server_ipv6 = preferred_file_server_ipv6_;
     disk_iops_configuration = disk_iops_configuration_;
     audit_log_configuration = audit_log_configuration_;
     aliases = aliases_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     maintenance_operations_in_progress = maintenance_operations_in_progress_;
     throughput_capacity = throughput_capacity_;
     preferred_file_server_ip = preferred_file_server_ip_;
     preferred_subnet_id = preferred_subnet_id_;
     remote_administration_endpoint = remote_administration_endpoint_;
     deployment_type = deployment_type_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     active_directory_id = active_directory_id_;
   }
    : windows_file_system_configuration)

let make_windows_audit_log_create_configuration
    ?audit_log_destination:(audit_log_destination_ : general_ar_n option)
    ~file_share_access_audit_log_level:
      (file_share_access_audit_log_level_ : windows_access_audit_log_level)
    ~file_access_audit_log_level:(file_access_audit_log_level_ : windows_access_audit_log_level) ()
    =
  ({
     audit_log_destination = audit_log_destination_;
     file_share_access_audit_log_level = file_share_access_audit_log_level_;
     file_access_audit_log_level = file_access_audit_log_level_;
   }
    : windows_audit_log_create_configuration)

let make_tiering_policy ?name:(name_ : tiering_policy_name option)
    ?cooling_period:(cooling_period_ : cooling_period option) () =
  ({ name = name_; cooling_period = cooling_period_ } : tiering_policy)

let make_autocommit_period ?value:(value_ : autocommit_period_value option)
    ~type_:(type__ : autocommit_period_type) () =
  ({ value = value_; type_ = type__ } : autocommit_period)

let make_retention_period ?value:(value_ : retention_period_value option)
    ~type_:(type__ : retention_period_type) () =
  ({ value = value_; type_ = type__ } : retention_period)

let make_snaplock_retention_period ~maximum_retention:(maximum_retention_ : retention_period)
    ~minimum_retention:(minimum_retention_ : retention_period)
    ~default_retention:(default_retention_ : retention_period) () =
  ({
     maximum_retention = maximum_retention_;
     minimum_retention = minimum_retention_;
     default_retention = default_retention_;
   }
    : snaplock_retention_period)

let make_snaplock_configuration
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option)
    ?snaplock_type:(snaplock_type_ : snaplock_type option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?audit_log_volume:(audit_log_volume_ : flag option) () =
  ({
     volume_append_mode_enabled = volume_append_mode_enabled_;
     snaplock_type = snaplock_type_;
     retention_period = retention_period_;
     privileged_delete = privileged_delete_;
     autocommit_period = autocommit_period_;
     audit_log_volume = audit_log_volume_;
   }
    : snaplock_configuration)

let make_aggregate_configuration
    ?total_constituents:(total_constituents_ : total_constituents option)
    ?aggregates:(aggregates_ : aggregates option) () =
  ({ total_constituents = total_constituents_; aggregates = aggregates_ } : aggregate_configuration)

let make_ontap_volume_configuration ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option)
    ?aggregate_configuration:(aggregate_configuration_ : aggregate_configuration option)
    ?volume_style:(volume_style_ : volume_style option)
    ?snaplock_configuration:(snaplock_configuration_ : snaplock_configuration option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?ontap_volume_type:(ontap_volume_type_ : ontap_volume_type option)
    ?uui_d:(uui_d_ : uui_d option) ?tiering_policy:(tiering_policy_ : tiering_policy option)
    ?storage_virtual_machine_root:(storage_virtual_machine_root_ : flag option)
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?security_style:(security_style_ : security_style option)
    ?junction_path:(junction_path_ : junction_path option)
    ?flex_cache_endpoint_type:(flex_cache_endpoint_type_ : flex_cache_endpoint_type option) () =
  ({
     size_in_bytes = size_in_bytes_;
     aggregate_configuration = aggregate_configuration_;
     volume_style = volume_style_;
     snaplock_configuration = snaplock_configuration_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snapshot_policy = snapshot_policy_;
     ontap_volume_type = ontap_volume_type_;
     uui_d = uui_d_;
     tiering_policy = tiering_policy_;
     storage_virtual_machine_root = storage_virtual_machine_root_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     size_in_megabytes = size_in_megabytes_;
     security_style = security_style_;
     junction_path = junction_path_;
     flex_cache_endpoint_type = flex_cache_endpoint_type_;
   }
    : ontap_volume_configuration)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_lifecycle_transition_reason ?message:(message_ : error_message option) () =
  ({ message = message_ } : lifecycle_transition_reason)

let make_file_system_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : file_system_failure_details)

let make_data_repository_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : data_repository_failure_details)

let make_data_repository_configuration
    ?failure_details:(failure_details_ : data_repository_failure_details option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?export_path:(export_path_ : archive_path option)
    ?import_path:(import_path_ : archive_path option)
    ?lifecycle:(lifecycle_ : data_repository_lifecycle option) () =
  ({
     failure_details = failure_details_;
     auto_import_policy = auto_import_policy_;
     imported_file_chunk_size = imported_file_chunk_size_;
     export_path = export_path_;
     import_path = import_path_;
     lifecycle = lifecycle_;
   }
    : data_repository_configuration)

let make_lustre_log_configuration ?destination:(destination_ : general_ar_n option)
    ~level:(level_ : lustre_access_audit_log_level) () =
  ({ destination = destination_; level = level_ } : lustre_log_configuration)

let make_lustre_root_squash_configuration
    ?no_squash_nids:(no_squash_nids_ : lustre_no_squash_nids option)
    ?root_squash:(root_squash_ : lustre_root_squash option) () =
  ({ no_squash_nids = no_squash_nids_; root_squash = root_squash_ }
    : lustre_root_squash_configuration)

let make_file_system_lustre_metadata_configuration ?iops:(iops_ : metadata_iops option)
    ~mode:(mode_ : metadata_configuration_mode) () =
  ({ mode = mode_; iops = iops_ } : file_system_lustre_metadata_configuration)

let make_lustre_read_cache_configuration ?size_gi_b:(size_gi_b_ : storage_capacity option)
    ?sizing_mode:(sizing_mode_ : lustre_read_cache_sizing_mode option) () =
  ({ size_gi_b = size_gi_b_; sizing_mode = sizing_mode_ } : lustre_read_cache_configuration)

let make_lustre_file_system_configuration
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?efa_enabled:(efa_enabled_ : flag option)
    ?metadata_configuration:
      (metadata_configuration_ : file_system_lustre_metadata_configuration option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?log_configuration:(log_configuration_ : lustre_log_configuration option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?drive_cache_type:(drive_cache_type_ : drive_cache_type option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?mount_name:(mount_name_ : lustre_file_system_mount_name option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?deployment_type:(deployment_type_ : lustre_deployment_type option)
    ?data_repository_configuration:
      (data_repository_configuration_ : data_repository_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({
     data_read_cache_configuration = data_read_cache_configuration_;
     throughput_capacity = throughput_capacity_;
     efa_enabled = efa_enabled_;
     metadata_configuration = metadata_configuration_;
     root_squash_configuration = root_squash_configuration_;
     log_configuration = log_configuration_;
     data_compression_type = data_compression_type_;
     drive_cache_type = drive_cache_type_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     mount_name = mount_name_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     deployment_type = deployment_type_;
     data_repository_configuration = data_repository_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
   }
    : lustre_file_system_configuration)

let make_file_system_endpoint ?ipv6_addresses:(ipv6_addresses_ : ontap_endpoint_ip_addresses option)
    ?ip_addresses:(ip_addresses_ : ontap_endpoint_ip_addresses option)
    ?dns_name:(dns_name_ : dns_name option) () =
  ({ ipv6_addresses = ipv6_addresses_; ip_addresses = ip_addresses_; dns_name = dns_name_ }
    : file_system_endpoint)

let make_file_system_endpoints ?management:(management_ : file_system_endpoint option)
    ?intercluster:(intercluster_ : file_system_endpoint option) () =
  ({ management = management_; intercluster = intercluster_ } : file_system_endpoints)

let make_ontap_file_system_configuration
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?endpoints:(endpoints_ : file_system_endpoints option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?deployment_type:(deployment_type_ : ontap_deployment_type option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option) () =
  ({
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     ha_pairs = ha_pairs_;
     fsx_admin_password = fsx_admin_password_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     route_table_ids = route_table_ids_;
     preferred_subnet_id = preferred_subnet_id_;
     disk_iops_configuration = disk_iops_configuration_;
     endpoints = endpoints_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     deployment_type = deployment_type_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : ontap_file_system_configuration)

let make_open_zfs_read_cache_configuration ?size_gi_b:(size_gi_b_ : storage_capacity option)
    ?sizing_mode:(sizing_mode_ : open_zfs_read_cache_sizing_mode option) () =
  ({ size_gi_b = size_gi_b_; sizing_mode = sizing_mode_ } : open_zfs_read_cache_configuration)

let make_open_zfs_file_system_configuration
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    ?endpoint_ipv6_address:(endpoint_ipv6_address_ : ip_address option)
    ?endpoint_ip_address:(endpoint_ip_address_ : ip_address option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?root_volume_id:(root_volume_id_ : volume_id option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?deployment_type:(deployment_type_ : open_zfs_deployment_type option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option) () =
  ({
     read_cache_configuration = read_cache_configuration_;
     endpoint_ipv6_address = endpoint_ipv6_address_;
     endpoint_ip_address = endpoint_ip_address_;
     route_table_ids = route_table_ids_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     preferred_subnet_id = preferred_subnet_id_;
     root_volume_id = root_volume_id_;
     disk_iops_configuration = disk_iops_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     deployment_type = deployment_type_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : open_zfs_file_system_configuration)

let make_administrative_action_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : administrative_action_failure_details)

let make_open_zfs_origin_snapshot_configuration
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option)
    ?snapshot_ar_n:(snapshot_ar_n_ : resource_ar_n option) () =
  ({ copy_strategy = copy_strategy_; snapshot_ar_n = snapshot_ar_n_ }
    : open_zfs_origin_snapshot_configuration)

let make_open_zfs_client_configuration ~options:(options_ : open_zfs_nfs_export_options)
    ~clients:(clients_ : open_zfs_clients) () =
  ({ options = options_; clients = clients_ } : open_zfs_client_configuration)

let make_open_zfs_nfs_export
    ~client_configurations:(client_configurations_ : open_zfs_client_configurations) () =
  ({ client_configurations = client_configurations_ } : open_zfs_nfs_export)

let make_open_zfs_user_or_group_quota
    ~storage_capacity_quota_gi_b:(storage_capacity_quota_gi_b_ : integer_no_max)
    ~id:(id_ : integer_no_max) ~type_:(type__ : open_zfs_quota_type) () =
  ({ storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_; id = id_; type_ = type__ }
    : open_zfs_user_or_group_quota)

let make_open_zfs_volume_configuration
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option)
    ?destination_snapshot:(destination_snapshot_ : snapshot_id option)
    ?source_snapshot_ar_n:(source_snapshot_ar_n_ : resource_ar_n option)
    ?delete_intermediate_data:(delete_intermediate_data_ : flag option)
    ?delete_cloned_volumes:(delete_cloned_volumes_ : flag option)
    ?delete_intermediate_snaphots:(delete_intermediate_snaphots_ : flag option)
    ?restore_to_snapshot:(restore_to_snapshot_ : snapshot_id option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?read_only:(read_only_ : read_only option)
    ?origin_snapshot:(origin_snapshot_ : open_zfs_origin_snapshot_configuration option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?storage_capacity_quota_gi_b:(storage_capacity_quota_gi_b_ : integer_no_max option)
    ?storage_capacity_reservation_gi_b:(storage_capacity_reservation_gi_b_ : integer_no_max option)
    ?volume_path:(volume_path_ : volume_path option)
    ?parent_volume_id:(parent_volume_id_ : volume_id option) () =
  ({
     copy_strategy = copy_strategy_;
     destination_snapshot = destination_snapshot_;
     source_snapshot_ar_n = source_snapshot_ar_n_;
     delete_intermediate_data = delete_intermediate_data_;
     delete_cloned_volumes = delete_cloned_volumes_;
     delete_intermediate_snaphots = delete_intermediate_snaphots_;
     restore_to_snapshot = restore_to_snapshot_;
     user_and_group_quotas = user_and_group_quotas_;
     nfs_exports = nfs_exports_;
     read_only = read_only_;
     origin_snapshot = origin_snapshot_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     data_compression_type = data_compression_type_;
     record_size_ki_b = record_size_ki_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
     volume_path = volume_path_;
     parent_volume_id = parent_volume_id_;
   }
    : open_zfs_volume_configuration)

let make_administrative_action ?message:(message_ : error_message option)
    ?remaining_transfer_bytes:(remaining_transfer_bytes_ : remaining_transfer_bytes option)
    ?total_transfer_bytes:(total_transfer_bytes_ : total_transfer_bytes option)
    ?target_snapshot_values:(target_snapshot_values_ : snapshot option)
    ?target_volume_values:(target_volume_values_ : volume option)
    ?failure_details:(failure_details_ : administrative_action_failure_details option)
    ?target_file_system_values:(target_file_system_values_ : file_system option)
    ?status:(status_ : status option) ?request_time:(request_time_ : request_time option)
    ?progress_percent:(progress_percent_ : progress_percent option)
    ?administrative_action_type:(administrative_action_type_ : administrative_action_type option) ()
    =
  ({
     message = message_;
     remaining_transfer_bytes = remaining_transfer_bytes_;
     total_transfer_bytes = total_transfer_bytes_;
     target_snapshot_values = target_snapshot_values_;
     target_volume_values = target_volume_values_;
     failure_details = failure_details_;
     target_file_system_values = target_file_system_values_;
     status = status_;
     request_time = request_time_;
     progress_percent = progress_percent_;
     administrative_action_type = administrative_action_type_;
   }
    : administrative_action)

let make_file_system ?network_type:(network_type_ : network_type option)
    ?open_zfs_configuration:(open_zfs_configuration_ : open_zfs_file_system_configuration option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?ontap_configuration:(ontap_configuration_ : ontap_file_system_configuration option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?lustre_configuration:(lustre_configuration_ : lustre_file_system_configuration option)
    ?windows_configuration:(windows_configuration_ : windows_file_system_configuration option)
    ?tags:(tags_ : tags option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?dns_name:(dns_name_ : dns_name option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?storage_type:(storage_type_ : storage_type option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?failure_details:(failure_details_ : file_system_failure_details option)
    ?lifecycle:(lifecycle_ : file_system_lifecycle option)
    ?file_system_type:(file_system_type_ : file_system_type option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?owner_id:(owner_id_ : aws_account_id option) () =
  ({
     network_type = network_type_;
     open_zfs_configuration = open_zfs_configuration_;
     file_system_type_version = file_system_type_version_;
     ontap_configuration = ontap_configuration_;
     administrative_actions = administrative_actions_;
     lustre_configuration = lustre_configuration_;
     windows_configuration = windows_configuration_;
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     kms_key_id = kms_key_id_;
     dns_name = dns_name_;
     network_interface_ids = network_interface_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     storage_type = storage_type_;
     storage_capacity = storage_capacity_;
     failure_details = failure_details_;
     lifecycle = lifecycle_;
     file_system_type = file_system_type_;
     file_system_id = file_system_id_;
     creation_time = creation_time_;
     owner_id = owner_id_;
   }
    : file_system)

let make_snapshot ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?tags:(tags_ : tags option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?lifecycle:(lifecycle_ : snapshot_lifecycle option)
    ?creation_time:(creation_time_ : creation_time option)
    ?volume_id:(volume_id_ : volume_id option) ?name:(name_ : snapshot_name option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) () =
  ({
     administrative_actions = administrative_actions_;
     tags = tags_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     lifecycle = lifecycle_;
     creation_time = creation_time_;
     volume_id = volume_id_;
     name = name_;
     snapshot_id = snapshot_id_;
     resource_ar_n = resource_ar_n_;
   }
    : snapshot)

let make_volume
    ?open_zfs_configuration:(open_zfs_configuration_ : open_zfs_volume_configuration option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?volume_type:(volume_type_ : volume_type option) ?volume_id:(volume_id_ : volume_id option)
    ?tags:(tags_ : tags option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?ontap_configuration:(ontap_configuration_ : ontap_volume_configuration option)
    ?name:(name_ : volume_name option) ?lifecycle:(lifecycle_ : volume_lifecycle option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?creation_time:(creation_time_ : creation_time option) () =
  ({
     open_zfs_configuration = open_zfs_configuration_;
     administrative_actions = administrative_actions_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     volume_type = volume_type_;
     volume_id = volume_id_;
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     ontap_configuration = ontap_configuration_;
     name = name_;
     lifecycle = lifecycle_;
     file_system_id = file_system_id_;
     creation_time = creation_time_;
   }
    : volume)

let make_volume_filter ?values:(values_ : volume_filter_values option)
    ?name:(name_ : volume_filter_name option) () =
  ({ values = values_; name = name_ } : volume_filter)

let make_update_volume_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : update_volume_response)

let make_update_snaplock_configuration
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?audit_log_volume:(audit_log_volume_ : flag option) () =
  ({
     volume_append_mode_enabled = volume_append_mode_enabled_;
     retention_period = retention_period_;
     privileged_delete = privileged_delete_;
     autocommit_period = autocommit_period_;
     audit_log_volume = audit_log_volume_;
   }
    : update_snaplock_configuration)

let make_update_ontap_volume_configuration
    ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option)
    ?snaplock_configuration:(snaplock_configuration_ : update_snaplock_configuration option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?tiering_policy:(tiering_policy_ : tiering_policy option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?security_style:(security_style_ : security_style option)
    ?junction_path:(junction_path_ : junction_path option) () =
  ({
     size_in_bytes = size_in_bytes_;
     snaplock_configuration = snaplock_configuration_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snapshot_policy = snapshot_policy_;
     tiering_policy = tiering_policy_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     size_in_megabytes = size_in_megabytes_;
     security_style = security_style_;
     junction_path = junction_path_;
   }
    : update_ontap_volume_configuration)

let make_update_open_zfs_volume_configuration ?read_only:(read_only_ : read_only option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?storage_capacity_quota_gi_b:
      (storage_capacity_quota_gi_b_ : integer_no_max_from_negative_one option)
    ?storage_capacity_reservation_gi_b:
      (storage_capacity_reservation_gi_b_ : integer_no_max_from_negative_one option) () =
  ({
     read_only = read_only_;
     user_and_group_quotas = user_and_group_quotas_;
     nfs_exports = nfs_exports_;
     data_compression_type = data_compression_type_;
     record_size_ki_b = record_size_ki_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
   }
    : update_open_zfs_volume_configuration)

let make_update_volume_request
    ?open_zfs_configuration:(open_zfs_configuration_ : update_open_zfs_volume_configuration option)
    ?name:(name_ : volume_name option)
    ?ontap_configuration:(ontap_configuration_ : update_ontap_volume_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     open_zfs_configuration = open_zfs_configuration_;
     name = name_;
     ontap_configuration = ontap_configuration_;
     volume_id = volume_id_;
     client_request_token = client_request_token_;
   }
    : update_volume_request)

let make_self_managed_active_directory_configuration_updates
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option)
    ?dns_ips:(dns_ips_ : dns_ips option) ?password:(password_ : directory_password option)
    ?user_name:(user_name_ : directory_user_name option) () =
  ({
     domain_join_service_account_secret = domain_join_service_account_secret_;
     file_system_administrators_group = file_system_administrators_group_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     domain_name = domain_name_;
     dns_ips = dns_ips_;
     password = password_;
     user_name = user_name_;
   }
    : self_managed_active_directory_configuration_updates)

let make_update_svm_active_directory_configuration
    ?net_bios_name:(net_bios_name_ : net_bios_alias option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration_updates option) () =
  ({
     net_bios_name = net_bios_name_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
   }
    : update_svm_active_directory_configuration)

let make_svm_active_directory_configuration
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_attributes option)
    ?net_bios_name:(net_bios_name_ : net_bios_alias option) () =
  ({
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     net_bios_name = net_bios_name_;
   }
    : svm_active_directory_configuration)

let make_svm_endpoint ?ipv6_addresses:(ipv6_addresses_ : ontap_endpoint_ip_addresses option)
    ?ip_addresses:(ip_addresses_ : ontap_endpoint_ip_addresses option)
    ?dns_name:(dns_name_ : dns_name option) () =
  ({ ipv6_addresses = ipv6_addresses_; ip_addresses = ip_addresses_; dns_name = dns_name_ }
    : svm_endpoint)

let make_svm_endpoints ?smb:(smb_ : svm_endpoint option) ?nfs:(nfs_ : svm_endpoint option)
    ?management:(management_ : svm_endpoint option) ?iscsi:(iscsi_ : svm_endpoint option) () =
  ({ smb = smb_; nfs = nfs_; management = management_; iscsi = iscsi_ } : svm_endpoints)

let make_storage_virtual_machine
    ?root_volume_security_style:
      (root_volume_security_style_ : storage_virtual_machine_root_volume_security_style option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?tags:(tags_ : tags option) ?uui_d:(uui_d_ : uui_d option)
    ?subtype:(subtype_ : storage_virtual_machine_subtype option)
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?name:(name_ : storage_virtual_machine_name option)
    ?lifecycle:(lifecycle_ : storage_virtual_machine_lifecycle option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?endpoints:(endpoints_ : svm_endpoints option)
    ?creation_time:(creation_time_ : creation_time option)
    ?active_directory_configuration:
      (active_directory_configuration_ : svm_active_directory_configuration option) () =
  ({
     root_volume_security_style = root_volume_security_style_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     tags = tags_;
     uui_d = uui_d_;
     subtype = subtype_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     resource_ar_n = resource_ar_n_;
     name = name_;
     lifecycle = lifecycle_;
     file_system_id = file_system_id_;
     endpoints = endpoints_;
     creation_time = creation_time_;
     active_directory_configuration = active_directory_configuration_;
   }
    : storage_virtual_machine)

let make_update_storage_virtual_machine_response
    ?storage_virtual_machine:(storage_virtual_machine_ : storage_virtual_machine option) () =
  ({ storage_virtual_machine = storage_virtual_machine_ } : update_storage_virtual_machine_response)

let make_update_storage_virtual_machine_request
    ?svm_admin_password:(svm_admin_password_ : admin_password option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?active_directory_configuration:
      (active_directory_configuration_ : update_svm_active_directory_configuration option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     svm_admin_password = svm_admin_password_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     client_request_token = client_request_token_;
     active_directory_configuration = active_directory_configuration_;
   }
    : update_storage_virtual_machine_request)

let make_update_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : update_snapshot_response)

let make_update_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~snapshot_id:(snapshot_id_ : snapshot_id) ~name:(name_ : snapshot_name) () =
  ({ snapshot_id = snapshot_id_; name = name_; client_request_token = client_request_token_ }
    : update_snapshot_request)

let make_update_shared_vpc_configuration_response
    ?enable_fsx_route_table_updates_from_participant_accounts:
      (enable_fsx_route_table_updates_from_participant_accounts_ : verbose_flag option) () =
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       enable_fsx_route_table_updates_from_participant_accounts_;
   }
    : update_shared_vpc_configuration_response)

let make_update_shared_vpc_configuration_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?enable_fsx_route_table_updates_from_participant_accounts:
      (enable_fsx_route_table_updates_from_participant_accounts_ : verbose_flag option) () =
  ({
     client_request_token = client_request_token_;
     enable_fsx_route_table_updates_from_participant_accounts =
       enable_fsx_route_table_updates_from_participant_accounts_;
   }
    : update_shared_vpc_configuration_request)

let make_update_file_system_windows_configuration
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?audit_log_configuration:
      (audit_log_configuration_ : windows_audit_log_create_configuration option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration_updates option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({
     fsrm_configuration = fsrm_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     audit_log_configuration = audit_log_configuration_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     throughput_capacity = throughput_capacity_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
   }
    : update_file_system_windows_configuration)

let make_update_file_system_response ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : update_file_system_response)

let make_lustre_log_create_configuration ?destination:(destination_ : general_ar_n option)
    ~level:(level_ : lustre_access_audit_log_level) () =
  ({ destination = destination_; level = level_ } : lustre_log_create_configuration)

let make_update_file_system_lustre_metadata_configuration
    ?mode:(mode_ : metadata_configuration_mode option) ?iops:(iops_ : metadata_iops option) () =
  ({ mode = mode_; iops = iops_ } : update_file_system_lustre_metadata_configuration)

let make_update_file_system_lustre_configuration
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?metadata_configuration:
      (metadata_configuration_ : update_file_system_lustre_metadata_configuration option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?log_configuration:(log_configuration_ : lustre_log_create_configuration option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({
     data_read_cache_configuration = data_read_cache_configuration_;
     throughput_capacity = throughput_capacity_;
     metadata_configuration = metadata_configuration_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     root_squash_configuration = root_squash_configuration_;
     log_configuration = log_configuration_;
     data_compression_type = data_compression_type_;
     auto_import_policy = auto_import_policy_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
   }
    : update_file_system_lustre_configuration)

let make_update_file_system_ontap_configuration
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?remove_route_table_ids:(remove_route_table_ids_ : route_table_ids option)
    ?add_route_table_ids:(add_route_table_ids_ : route_table_ids option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option) () =
  ({
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     ha_pairs = ha_pairs_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     remove_route_table_ids = remove_route_table_ids_;
     add_route_table_ids = add_route_table_ids_;
     throughput_capacity = throughput_capacity_;
     disk_iops_configuration = disk_iops_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     fsx_admin_password = fsx_admin_password_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : update_file_system_ontap_configuration)

let make_update_file_system_open_zfs_configuration
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    ?remove_route_table_ids:(remove_route_table_ids_ : route_table_ids option)
    ?add_route_table_ids:(add_route_table_ids_ : route_table_ids option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option) () =
  ({
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     read_cache_configuration = read_cache_configuration_;
     remove_route_table_ids = remove_route_table_ids_;
     add_route_table_ids = add_route_table_ids_;
     disk_iops_configuration = disk_iops_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : update_file_system_open_zfs_configuration)

let make_update_file_system_request ?network_type:(network_type_ : network_type option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?storage_type:(storage_type_ : storage_type option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : update_file_system_open_zfs_configuration option)
    ?ontap_configuration:(ontap_configuration_ : update_file_system_ontap_configuration option)
    ?lustre_configuration:(lustre_configuration_ : update_file_system_lustre_configuration option)
    ?windows_configuration:
      (windows_configuration_ : update_file_system_windows_configuration option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     network_type = network_type_;
     file_system_type_version = file_system_type_version_;
     storage_type = storage_type_;
     open_zfs_configuration = open_zfs_configuration_;
     ontap_configuration = ontap_configuration_;
     lustre_configuration = lustre_configuration_;
     windows_configuration = windows_configuration_;
     storage_capacity = storage_capacity_;
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
   }
    : update_file_system_request)

let make_file_cache_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : file_cache_failure_details)

let make_file_cache_lustre_metadata_configuration
    ~storage_capacity:(storage_capacity_ : metadata_storage_capacity) () =
  ({ storage_capacity = storage_capacity_ } : file_cache_lustre_metadata_configuration)

let make_file_cache_lustre_configuration
    ?log_configuration:(log_configuration_ : lustre_log_configuration option)
    ?metadata_configuration:
      (metadata_configuration_ : file_cache_lustre_metadata_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?mount_name:(mount_name_ : lustre_file_system_mount_name option)
    ?deployment_type:(deployment_type_ : file_cache_lustre_deployment_type option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    () =
  ({
     log_configuration = log_configuration_;
     metadata_configuration = metadata_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     mount_name = mount_name_;
     deployment_type = deployment_type_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
   }
    : file_cache_lustre_configuration)

let make_file_cache
    ?data_repository_association_ids:
      (data_repository_association_ids_ : data_repository_association_ids option)
    ?lustre_configuration:(lustre_configuration_ : file_cache_lustre_configuration option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?dns_name:(dns_name_ : dns_name option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?failure_details:(failure_details_ : file_cache_failure_details option)
    ?lifecycle:(lifecycle_ : file_cache_lifecycle option)
    ?file_cache_type_version:(file_cache_type_version_ : file_system_type_version option)
    ?file_cache_type:(file_cache_type_ : file_cache_type option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?owner_id:(owner_id_ : aws_account_id option) () =
  ({
     data_repository_association_ids = data_repository_association_ids_;
     lustre_configuration = lustre_configuration_;
     resource_ar_n = resource_ar_n_;
     kms_key_id = kms_key_id_;
     dns_name = dns_name_;
     network_interface_ids = network_interface_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     storage_capacity = storage_capacity_;
     failure_details = failure_details_;
     lifecycle = lifecycle_;
     file_cache_type_version = file_cache_type_version_;
     file_cache_type = file_cache_type_;
     file_cache_id = file_cache_id_;
     creation_time = creation_time_;
     owner_id = owner_id_;
   }
    : file_cache)

let make_update_file_cache_response ?file_cache:(file_cache_ : file_cache option) () =
  ({ file_cache = file_cache_ } : update_file_cache_response)

let make_update_file_cache_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({ weekly_maintenance_start_time = weekly_maintenance_start_time_ }
    : update_file_cache_lustre_configuration)

let make_update_file_cache_request
    ?lustre_configuration:(lustre_configuration_ : update_file_cache_lustre_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_cache_id:(file_cache_id_ : file_cache_id) () =
  ({
     lustre_configuration = lustre_configuration_;
     client_request_token = client_request_token_;
     file_cache_id = file_cache_id_;
   }
    : update_file_cache_request)

let make_auto_import_policy ?events:(events_ : event_types option) () =
  ({ events = events_ } : auto_import_policy)

let make_auto_export_policy ?events:(events_ : event_types option) () =
  ({ events = events_ } : auto_export_policy)

let make_s3_data_repository_configuration
    ?auto_export_policy:(auto_export_policy_ : auto_export_policy option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy option) () =
  ({ auto_export_policy = auto_export_policy_; auto_import_policy = auto_import_policy_ }
    : s3_data_repository_configuration)

let make_nfs_data_repository_configuration
    ?auto_export_policy:(auto_export_policy_ : auto_export_policy option)
    ?dns_ips:(dns_ips_ : repository_dns_ips option) ~version:(version_ : nfs_version) () =
  ({ auto_export_policy = auto_export_policy_; dns_ips = dns_ips_; version = version_ }
    : nfs_data_repository_configuration)

let make_data_repository_association ?nf_s:(nf_s_ : nfs_data_repository_configuration option)
    ?data_repository_subdirectories:(data_repository_subdirectories_ : sub_directories_paths option)
    ?file_cache_path:(file_cache_path_ : namespace option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?creation_time:(creation_time_ : creation_time option) ?tags:(tags_ : tags option)
    ?s3:(s3_ : s3_data_repository_configuration option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?batch_import_meta_data_on_create:
      (batch_import_meta_data_on_create_ : batch_import_meta_data_on_create option)
    ?data_repository_path:(data_repository_path_ : archive_path option)
    ?file_system_path:(file_system_path_ : namespace option)
    ?failure_details:(failure_details_ : data_repository_failure_details option)
    ?lifecycle:(lifecycle_ : data_repository_lifecycle option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?association_id:(association_id_ : data_repository_association_id option) () =
  ({
     nf_s = nf_s_;
     data_repository_subdirectories = data_repository_subdirectories_;
     file_cache_path = file_cache_path_;
     file_cache_id = file_cache_id_;
     creation_time = creation_time_;
     tags = tags_;
     s3 = s3_;
     imported_file_chunk_size = imported_file_chunk_size_;
     batch_import_meta_data_on_create = batch_import_meta_data_on_create_;
     data_repository_path = data_repository_path_;
     file_system_path = file_system_path_;
     failure_details = failure_details_;
     lifecycle = lifecycle_;
     file_system_id = file_system_id_;
     resource_ar_n = resource_ar_n_;
     association_id = association_id_;
   }
    : data_repository_association)

let make_update_data_repository_association_response
    ?association:(association_ : data_repository_association option) () =
  ({ association = association_ } : update_data_repository_association_response)

let make_update_data_repository_association_request
    ?s3:(s3_ : s3_data_repository_configuration option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~association_id:(association_id_ : data_repository_association_id) () =
  ({
     s3 = s3_;
     imported_file_chunk_size = imported_file_chunk_size_;
     client_request_token = client_request_token_;
     association_id = association_id_;
   }
    : update_data_repository_association_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_storage_virtual_machine_filter
    ?values:(values_ : storage_virtual_machine_filter_values option)
    ?name:(name_ : storage_virtual_machine_filter_name option) () =
  ({ values = values_; name = name_ } : storage_virtual_machine_filter)

let make_start_misconfigured_state_recovery_response
    ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : start_misconfigured_state_recovery_response)

let make_start_misconfigured_state_recovery_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_; client_request_token = client_request_token_ }
    : start_misconfigured_state_recovery_request)

let make_snapshot_filter ?values:(values_ : snapshot_filter_values option)
    ?name:(name_ : snapshot_filter_name option) () =
  ({ values = values_; name = name_ } : snapshot_filter)

let make_self_managed_active_directory_configuration
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option)
    ?password:(password_ : directory_password option)
    ?user_name:(user_name_ : directory_user_name option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ~dns_ips:(dns_ips_ : dns_ips)
    ~domain_name:(domain_name_ : active_directory_fully_qualified_name) () =
  ({
     domain_join_service_account_secret = domain_join_service_account_secret_;
     dns_ips = dns_ips_;
     password = password_;
     user_name = user_name_;
     file_system_administrators_group = file_system_administrators_group_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     domain_name = domain_name_;
   }
    : self_managed_active_directory_configuration)

let make_s3_access_point_vpc_configuration ?vpc_id:(vpc_id_ : vpc_id option) () =
  ({ vpc_id = vpc_id_ } : s3_access_point_vpc_configuration)

let make_open_zfs_posix_file_system_user
    ?secondary_gids:(secondary_gids_ : file_system_secondary_gi_ds option)
    ~gid:(gid_ : file_system_gi_d) ~uid:(uid_ : file_system_ui_d) () =
  ({ secondary_gids = secondary_gids_; gid = gid_; uid = uid_ } : open_zfs_posix_file_system_user)

let make_open_zfs_file_system_identity
    ?posix_user:(posix_user_ : open_zfs_posix_file_system_user option)
    ~type_:(type__ : open_zfs_file_system_user_type) () =
  ({ posix_user = posix_user_; type_ = type__ } : open_zfs_file_system_identity)

let make_s3_access_point_open_zfs_configuration
    ?file_system_identity:(file_system_identity_ : open_zfs_file_system_identity option)
    ?volume_id:(volume_id_ : volume_id option) () =
  ({ file_system_identity = file_system_identity_; volume_id = volume_id_ }
    : s3_access_point_open_zfs_configuration)

let make_ontap_unix_file_system_user ~name:(name_ : ontap_file_system_user_name) () =
  ({ name = name_ } : ontap_unix_file_system_user)

let make_ontap_windows_file_system_user ~name:(name_ : ontap_file_system_user_name) () =
  ({ name = name_ } : ontap_windows_file_system_user)

let make_ontap_file_system_identity
    ?windows_user:(windows_user_ : ontap_windows_file_system_user option)
    ?unix_user:(unix_user_ : ontap_unix_file_system_user option)
    ~type_:(type__ : ontap_file_system_user_type) () =
  ({ windows_user = windows_user_; unix_user = unix_user_; type_ = type__ }
    : ontap_file_system_identity)

let make_s3_access_point_ontap_configuration
    ?file_system_identity:(file_system_identity_ : ontap_file_system_identity option)
    ?volume_id:(volume_id_ : volume_id option) () =
  ({ file_system_identity = file_system_identity_; volume_id = volume_id_ }
    : s3_access_point_ontap_configuration)

let make_s3_access_point_attachments_filter
    ?values:(values_ : s3_access_point_attachments_filter_values option)
    ?name:(name_ : s3_access_point_attachments_filter_name option) () =
  ({ values = values_; name = name_ } : s3_access_point_attachments_filter)

let make_s3_access_point
    ?vpc_configuration:(vpc_configuration_ : s3_access_point_vpc_configuration option)
    ?alias:(alias_ : s3_access_point_alias option)
    ?resource_ar_n:(resource_ar_n_ : general_ar_n option) () =
  ({ vpc_configuration = vpc_configuration_; alias = alias_; resource_ar_n = resource_ar_n_ }
    : s3_access_point)

let make_s3_access_point_attachment ?s3_access_point:(s3_access_point_ : s3_access_point option)
    ?ontap_configuration:(ontap_configuration_ : s3_access_point_ontap_configuration option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : s3_access_point_open_zfs_configuration option)
    ?type_:(type__ : s3_access_point_attachment_type option)
    ?name:(name_ : s3_access_point_attachment_name option)
    ?creation_time:(creation_time_ : creation_time option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?lifecycle:(lifecycle_ : s3_access_point_attachment_lifecycle option) () =
  ({
     s3_access_point = s3_access_point_;
     ontap_configuration = ontap_configuration_;
     open_zfs_configuration = open_zfs_configuration_;
     type_ = type__;
     name = name_;
     creation_time = creation_time_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     lifecycle = lifecycle_;
   }
    : s3_access_point_attachment)

let make_restore_volume_from_snapshot_response
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option) ?volume_id:(volume_id_ : volume_id option) ()
    =
  ({
     administrative_actions = administrative_actions_;
     lifecycle = lifecycle_;
     volume_id = volume_id_;
   }
    : restore_volume_from_snapshot_response)

let make_restore_volume_from_snapshot_request
    ?options:(options_ : restore_open_zfs_volume_options option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~snapshot_id:(snapshot_id_ : snapshot_id) ~volume_id:(volume_id_ : volume_id) () =
  ({
     options = options_;
     snapshot_id = snapshot_id_;
     volume_id = volume_id_;
     client_request_token = client_request_token_;
   }
    : restore_volume_from_snapshot_request)

let make_release_file_system_nfs_v3_locks_response ?file_system:(file_system_ : file_system option)
    () =
  ({ file_system = file_system_ } : release_file_system_nfs_v3_locks_response)

let make_release_file_system_nfs_v3_locks_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ client_request_token = client_request_token_; file_system_id = file_system_id_ }
    : release_file_system_nfs_v3_locks_request)

let make_duration_since_last_access ?value:(value_ : value option) ?unit_:(unit__ : unit_ option) ()
    =
  ({ value = value_; unit_ = unit__ } : duration_since_last_access)

let make_release_configuration
    ?duration_since_last_access:(duration_since_last_access_ : duration_since_last_access option) ()
    =
  ({ duration_since_last_access = duration_since_last_access_ } : release_configuration)

let make_open_zfs_create_root_volume_configuration ?read_only:(read_only_ : read_only option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option) () =
  ({
     read_only = read_only_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     user_and_group_quotas = user_and_group_quotas_;
     nfs_exports = nfs_exports_;
     data_compression_type = data_compression_type_;
     record_size_ki_b = record_size_ki_b_;
   }
    : open_zfs_create_root_volume_configuration)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tags option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    () =
  ({ next_token = next_token_; max_results = max_results_; resource_ar_n = resource_ar_n_ }
    : list_tags_for_resource_request)

let make_filter ?values:(values_ : filter_values option) ?name:(name_ : filter_name option) () =
  ({ values = values_; name = name_ } : filter)

let make_file_cache_nfs_configuration ?dns_ips:(dns_ips_ : repository_dns_ips option)
    ~version:(version_ : nfs_version) () =
  ({ dns_ips = dns_ips_; version = version_ } : file_cache_nfs_configuration)

let make_file_cache_data_repository_association ?nf_s:(nf_s_ : file_cache_nfs_configuration option)
    ?data_repository_subdirectories:(data_repository_subdirectories_ : sub_directories_paths option)
    ~data_repository_path:(data_repository_path_ : archive_path)
    ~file_cache_path:(file_cache_path_ : namespace) () =
  ({
     nf_s = nf_s_;
     data_repository_subdirectories = data_repository_subdirectories_;
     data_repository_path = data_repository_path_;
     file_cache_path = file_cache_path_;
   }
    : file_cache_data_repository_association)

let make_file_cache_creating
    ?data_repository_association_ids:
      (data_repository_association_ids_ : data_repository_association_ids option)
    ?lustre_configuration:(lustre_configuration_ : file_cache_lustre_configuration option)
    ?copy_tags_to_data_repository_associations:
      (copy_tags_to_data_repository_associations_ : copy_tags_to_data_repository_associations option)
    ?tags:(tags_ : tags option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?dns_name:(dns_name_ : dns_name option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?failure_details:(failure_details_ : file_cache_failure_details option)
    ?lifecycle:(lifecycle_ : file_cache_lifecycle option)
    ?file_cache_type_version:(file_cache_type_version_ : file_system_type_version option)
    ?file_cache_type:(file_cache_type_ : file_cache_type option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?owner_id:(owner_id_ : aws_account_id option) () =
  ({
     data_repository_association_ids = data_repository_association_ids_;
     lustre_configuration = lustre_configuration_;
     copy_tags_to_data_repository_associations = copy_tags_to_data_repository_associations_;
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     kms_key_id = kms_key_id_;
     dns_name = dns_name_;
     network_interface_ids = network_interface_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     storage_capacity = storage_capacity_;
     failure_details = failure_details_;
     lifecycle = lifecycle_;
     file_cache_type_version = file_cache_type_version_;
     file_cache_type = file_cache_type_;
     file_cache_id = file_cache_id_;
     creation_time = creation_time_;
     owner_id = owner_id_;
   }
    : file_cache_creating)

let make_disassociate_file_system_aliases_response ?aliases:(aliases_ : aliases option) () =
  ({ aliases = aliases_ } : disassociate_file_system_aliases_response)

let make_disassociate_file_system_aliases_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~aliases:(aliases_ : alternate_dns_names) ~file_system_id:(file_system_id_ : file_system_id) ()
    =
  ({
     aliases = aliases_;
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
   }
    : disassociate_file_system_aliases_request)

let make_detach_and_delete_s3_access_point_response
    ?name:(name_ : s3_access_point_attachment_name option)
    ?lifecycle:(lifecycle_ : s3_access_point_attachment_lifecycle option) () =
  ({ name = name_; lifecycle = lifecycle_ } : detach_and_delete_s3_access_point_response)

let make_detach_and_delete_s3_access_point_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : s3_access_point_attachment_name) () =
  ({ name = name_; client_request_token = client_request_token_ }
    : detach_and_delete_s3_access_point_request)

let make_describe_volumes_response ?next_token:(next_token_ : next_token option)
    ?volumes:(volumes_ : volumes option) () =
  ({ next_token = next_token_; volumes = volumes_ } : describe_volumes_response)

let make_describe_volumes_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : volume_filters option)
    ?volume_ids:(volume_ids_ : volume_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     volume_ids = volume_ids_;
   }
    : describe_volumes_request)

let make_describe_storage_virtual_machines_response ?next_token:(next_token_ : next_token option)
    ?storage_virtual_machines:(storage_virtual_machines_ : storage_virtual_machines option) () =
  ({ next_token = next_token_; storage_virtual_machines = storage_virtual_machines_ }
    : describe_storage_virtual_machines_response)

let make_describe_storage_virtual_machines_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : storage_virtual_machine_filters option)
    ?storage_virtual_machine_ids:(storage_virtual_machine_ids_ : storage_virtual_machine_ids option)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     storage_virtual_machine_ids = storage_virtual_machine_ids_;
   }
    : describe_storage_virtual_machines_request)

let make_describe_snapshots_response ?next_token:(next_token_ : next_token option)
    ?snapshots:(snapshots_ : snapshots option) () =
  ({ next_token = next_token_; snapshots = snapshots_ } : describe_snapshots_response)

let make_describe_snapshots_request ?include_shared:(include_shared_ : include_shared option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : snapshot_filters option)
    ?snapshot_ids:(snapshot_ids_ : snapshot_ids option) () =
  ({
     include_shared = include_shared_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     snapshot_ids = snapshot_ids_;
   }
    : describe_snapshots_request)

let make_describe_shared_vpc_configuration_response
    ?enable_fsx_route_table_updates_from_participant_accounts:
      (enable_fsx_route_table_updates_from_participant_accounts_ : verbose_flag option) () =
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       enable_fsx_route_table_updates_from_participant_accounts_;
   }
    : describe_shared_vpc_configuration_response)

let make_describe_shared_vpc_configuration_request () = (() : unit)

let make_describe_s3_access_point_attachments_response ?next_token:(next_token_ : next_token option)
    ?s3_access_point_attachments:(s3_access_point_attachments_ : s3_access_point_attachments option)
    () =
  ({ next_token = next_token_; s3_access_point_attachments = s3_access_point_attachments_ }
    : describe_s3_access_point_attachments_response)

let make_describe_s3_access_point_attachments_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : s3_access_point_attachments_filters option)
    ?names:(names_ : s3_access_point_attachment_names option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_; names = names_ }
    : describe_s3_access_point_attachments_request)

let make_describe_file_systems_response ?next_token:(next_token_ : next_token option)
    ?file_systems:(file_systems_ : file_systems option) () =
  ({ next_token = next_token_; file_systems = file_systems_ } : describe_file_systems_response)

let make_describe_file_systems_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?file_system_ids:(file_system_ids_ : file_system_ids option) () =
  ({ next_token = next_token_; max_results = max_results_; file_system_ids = file_system_ids_ }
    : describe_file_systems_request)

let make_describe_file_system_aliases_response ?next_token:(next_token_ : next_token option)
    ?aliases:(aliases_ : aliases option) () =
  ({ next_token = next_token_; aliases = aliases_ } : describe_file_system_aliases_response)

let make_describe_file_system_aliases_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
   }
    : describe_file_system_aliases_request)

let make_describe_file_caches_response ?next_token:(next_token_ : next_token option)
    ?file_caches:(file_caches_ : file_caches option) () =
  ({ next_token = next_token_; file_caches = file_caches_ } : describe_file_caches_response)

let make_describe_file_caches_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?file_cache_ids:(file_cache_ids_ : file_cache_ids option) () =
  ({ next_token = next_token_; max_results = max_results_; file_cache_ids = file_cache_ids_ }
    : describe_file_caches_request)

let make_data_repository_task_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : data_repository_task_failure_details)

let make_data_repository_task_status
    ?released_capacity:(released_capacity_ : released_capacity option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?failed_count:(failed_count_ : failed_count option)
    ?succeeded_count:(succeeded_count_ : succeeded_count option)
    ?total_count:(total_count_ : total_count option) () =
  ({
     released_capacity = released_capacity_;
     last_updated_time = last_updated_time_;
     failed_count = failed_count_;
     succeeded_count = succeeded_count_;
     total_count = total_count_;
   }
    : data_repository_task_status)

let make_completion_report ?scope:(scope_ : report_scope option)
    ?format:(format_ : report_format option) ?path:(path_ : archive_path option)
    ~enabled:(enabled_ : flag) () =
  ({ scope = scope_; format = format_; path = path_; enabled = enabled_ } : completion_report)

let make_data_repository_task
    ?release_configuration:(release_configuration_ : release_configuration option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?capacity_to_release:(capacity_to_release_ : capacity_to_release option)
    ?report:(report_ : completion_report option)
    ?status:(status_ : data_repository_task_status option)
    ?failure_details:(failure_details_ : data_repository_task_failure_details option)
    ?paths:(paths_ : data_repository_task_paths option)
    ?file_system_id:(file_system_id_ : file_system_id option) ?tags:(tags_ : tags option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ?end_time:(end_time_ : end_time option)
    ?start_time:(start_time_ : start_time option) ~creation_time:(creation_time_ : creation_time)
    ~type_:(type__ : data_repository_task_type)
    ~lifecycle:(lifecycle_ : data_repository_task_lifecycle) ~task_id:(task_id_ : task_id) () =
  ({
     release_configuration = release_configuration_;
     file_cache_id = file_cache_id_;
     capacity_to_release = capacity_to_release_;
     report = report_;
     status = status_;
     failure_details = failure_details_;
     paths = paths_;
     file_system_id = file_system_id_;
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     end_time = end_time_;
     start_time = start_time_;
     creation_time = creation_time_;
     type_ = type__;
     lifecycle = lifecycle_;
     task_id = task_id_;
   }
    : data_repository_task)

let make_describe_data_repository_tasks_response ?next_token:(next_token_ : next_token option)
    ?data_repository_tasks:(data_repository_tasks_ : data_repository_tasks option) () =
  ({ next_token = next_token_; data_repository_tasks = data_repository_tasks_ }
    : describe_data_repository_tasks_response)

let make_data_repository_task_filter ?values:(values_ : data_repository_task_filter_values option)
    ?name:(name_ : data_repository_task_filter_name option) () =
  ({ values = values_; name = name_ } : data_repository_task_filter)

let make_describe_data_repository_tasks_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : data_repository_task_filters option)
    ?task_ids:(task_ids_ : task_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     task_ids = task_ids_;
   }
    : describe_data_repository_tasks_request)

let make_describe_data_repository_associations_response
    ?next_token:(next_token_ : next_token option)
    ?associations:(associations_ : data_repository_associations option) () =
  ({ next_token = next_token_; associations = associations_ }
    : describe_data_repository_associations_response)

let make_describe_data_repository_associations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : limited_max_results option) ?filters:(filters_ : filters option)
    ?association_ids:(association_ids_ : data_repository_association_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     association_ids = association_ids_;
   }
    : describe_data_repository_associations_request)

let make_backup_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : backup_failure_details)

let make_active_directory_backup_attributes ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?active_directory_id:(active_directory_id_ : directory_id option)
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option) () =
  ({
     resource_ar_n = resource_ar_n_;
     active_directory_id = active_directory_id_;
     domain_name = domain_name_;
   }
    : active_directory_backup_attributes)

let make_backup ?size_in_bytes:(size_in_bytes_ : size_in_bytes option)
    ?volume:(volume_ : volume option) ?resource_type:(resource_type_ : resource_type option)
    ?source_backup_region:(source_backup_region_ : region option)
    ?source_backup_id:(source_backup_id_ : backup_id option)
    ?owner_id:(owner_id_ : aws_account_id option)
    ?directory_information:(directory_information_ : active_directory_backup_attributes option)
    ?tags:(tags_ : tags option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?progress_percent:(progress_percent_ : progress_percent option)
    ?failure_details:(failure_details_ : backup_failure_details option)
    ~file_system:(file_system_ : file_system) ~creation_time:(creation_time_ : creation_time)
    ~type_:(type__ : backup_type) ~lifecycle:(lifecycle_ : backup_lifecycle)
    ~backup_id:(backup_id_ : backup_id) () =
  ({
     size_in_bytes = size_in_bytes_;
     volume = volume_;
     resource_type = resource_type_;
     source_backup_region = source_backup_region_;
     source_backup_id = source_backup_id_;
     owner_id = owner_id_;
     directory_information = directory_information_;
     file_system = file_system_;
     tags = tags_;
     resource_ar_n = resource_ar_n_;
     kms_key_id = kms_key_id_;
     creation_time = creation_time_;
     progress_percent = progress_percent_;
     type_ = type__;
     failure_details = failure_details_;
     lifecycle = lifecycle_;
     backup_id = backup_id_;
   }
    : backup)

let make_describe_backups_response ?next_token:(next_token_ : next_token option)
    ?backups:(backups_ : backups option) () =
  ({ next_token = next_token_; backups = backups_ } : describe_backups_response)

let make_describe_backups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option)
    ?backup_ids:(backup_ids_ : backup_ids option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     backup_ids = backup_ids_;
   }
    : describe_backups_request)

let make_delete_volume_ontap_response ?final_backup_tags:(final_backup_tags_ : tags option)
    ?final_backup_id:(final_backup_id_ : backup_id option) () =
  ({ final_backup_tags = final_backup_tags_; final_backup_id = final_backup_id_ }
    : delete_volume_ontap_response)

let make_delete_volume_response
    ?ontap_response:(ontap_response_ : delete_volume_ontap_response option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option) ?volume_id:(volume_id_ : volume_id option) ()
    =
  ({ ontap_response = ontap_response_; lifecycle = lifecycle_; volume_id = volume_id_ }
    : delete_volume_response)

let make_delete_volume_ontap_configuration
    ?bypass_snaplock_enterprise_retention:(bypass_snaplock_enterprise_retention_ : flag option)
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?skip_final_backup:(skip_final_backup_ : flag option) () =
  ({
     bypass_snaplock_enterprise_retention = bypass_snaplock_enterprise_retention_;
     final_backup_tags = final_backup_tags_;
     skip_final_backup = skip_final_backup_;
   }
    : delete_volume_ontap_configuration)

let make_delete_volume_open_zfs_configuration
    ?options:(options_ : delete_open_zfs_volume_options option) () =
  ({ options = options_ } : delete_volume_open_zfs_configuration)

let make_delete_volume_request
    ?open_zfs_configuration:(open_zfs_configuration_ : delete_volume_open_zfs_configuration option)
    ?ontap_configuration:(ontap_configuration_ : delete_volume_ontap_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     open_zfs_configuration = open_zfs_configuration_;
     ontap_configuration = ontap_configuration_;
     volume_id = volume_id_;
     client_request_token = client_request_token_;
   }
    : delete_volume_request)

let make_delete_storage_virtual_machine_response
    ?lifecycle:(lifecycle_ : storage_virtual_machine_lifecycle option)
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option) ()
    =
  ({ lifecycle = lifecycle_; storage_virtual_machine_id = storage_virtual_machine_id_ }
    : delete_storage_virtual_machine_response)

let make_delete_storage_virtual_machine_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     storage_virtual_machine_id = storage_virtual_machine_id_;
     client_request_token = client_request_token_;
   }
    : delete_storage_virtual_machine_request)

let make_delete_snapshot_response ?lifecycle:(lifecycle_ : snapshot_lifecycle option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option) () =
  ({ lifecycle = lifecycle_; snapshot_id = snapshot_id_ } : delete_snapshot_response)

let make_delete_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ snapshot_id = snapshot_id_; client_request_token = client_request_token_ }
    : delete_snapshot_request)

let make_delete_file_system_windows_response ?final_backup_tags:(final_backup_tags_ : tags option)
    ?final_backup_id:(final_backup_id_ : backup_id option) () =
  ({ final_backup_tags = final_backup_tags_; final_backup_id = final_backup_id_ }
    : delete_file_system_windows_response)

let make_delete_file_system_windows_configuration
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?skip_final_backup:(skip_final_backup_ : flag option) () =
  ({ final_backup_tags = final_backup_tags_; skip_final_backup = skip_final_backup_ }
    : delete_file_system_windows_configuration)

let make_delete_file_system_lustre_response ?final_backup_tags:(final_backup_tags_ : tags option)
    ?final_backup_id:(final_backup_id_ : backup_id option) () =
  ({ final_backup_tags = final_backup_tags_; final_backup_id = final_backup_id_ }
    : delete_file_system_lustre_response)

let make_delete_file_system_open_zfs_response ?final_backup_tags:(final_backup_tags_ : tags option)
    ?final_backup_id:(final_backup_id_ : backup_id option) () =
  ({ final_backup_tags = final_backup_tags_; final_backup_id = final_backup_id_ }
    : delete_file_system_open_zfs_response)

let make_delete_file_system_response
    ?open_zfs_response:(open_zfs_response_ : delete_file_system_open_zfs_response option)
    ?lustre_response:(lustre_response_ : delete_file_system_lustre_response option)
    ?windows_response:(windows_response_ : delete_file_system_windows_response option)
    ?lifecycle:(lifecycle_ : file_system_lifecycle option)
    ?file_system_id:(file_system_id_ : file_system_id option) () =
  ({
     open_zfs_response = open_zfs_response_;
     lustre_response = lustre_response_;
     windows_response = windows_response_;
     lifecycle = lifecycle_;
     file_system_id = file_system_id_;
   }
    : delete_file_system_response)

let make_delete_file_system_lustre_configuration
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?skip_final_backup:(skip_final_backup_ : flag option) () =
  ({ final_backup_tags = final_backup_tags_; skip_final_backup = skip_final_backup_ }
    : delete_file_system_lustre_configuration)

let make_delete_file_system_open_zfs_configuration
    ?options:(options_ : delete_file_system_open_zfs_options option)
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?skip_final_backup:(skip_final_backup_ : flag option) () =
  ({
     options = options_;
     final_backup_tags = final_backup_tags_;
     skip_final_backup = skip_final_backup_;
   }
    : delete_file_system_open_zfs_configuration)

let make_delete_file_system_request
    ?open_zfs_configuration:
      (open_zfs_configuration_ : delete_file_system_open_zfs_configuration option)
    ?lustre_configuration:(lustre_configuration_ : delete_file_system_lustre_configuration option)
    ?windows_configuration:
      (windows_configuration_ : delete_file_system_windows_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     open_zfs_configuration = open_zfs_configuration_;
     lustre_configuration = lustre_configuration_;
     windows_configuration = windows_configuration_;
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
   }
    : delete_file_system_request)

let make_delete_file_cache_response ?lifecycle:(lifecycle_ : file_cache_lifecycle option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option) () =
  ({ lifecycle = lifecycle_; file_cache_id = file_cache_id_ } : delete_file_cache_response)

let make_delete_file_cache_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_cache_id:(file_cache_id_ : file_cache_id) () =
  ({ client_request_token = client_request_token_; file_cache_id = file_cache_id_ }
    : delete_file_cache_request)

let make_delete_data_repository_association_response
    ?delete_data_in_file_system:(delete_data_in_file_system_ : delete_data_in_file_system option)
    ?lifecycle:(lifecycle_ : data_repository_lifecycle option)
    ?association_id:(association_id_ : data_repository_association_id option) () =
  ({
     delete_data_in_file_system = delete_data_in_file_system_;
     lifecycle = lifecycle_;
     association_id = association_id_;
   }
    : delete_data_repository_association_response)

let make_delete_data_repository_association_request
    ?delete_data_in_file_system:(delete_data_in_file_system_ : delete_data_in_file_system option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~association_id:(association_id_ : data_repository_association_id) () =
  ({
     delete_data_in_file_system = delete_data_in_file_system_;
     client_request_token = client_request_token_;
     association_id = association_id_;
   }
    : delete_data_repository_association_request)

let make_delete_backup_response ?lifecycle:(lifecycle_ : backup_lifecycle option)
    ?backup_id:(backup_id_ : backup_id option) () =
  ({ lifecycle = lifecycle_; backup_id = backup_id_ } : delete_backup_response)

let make_delete_backup_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~backup_id:(backup_id_ : backup_id) () =
  ({ client_request_token = client_request_token_; backup_id = backup_id_ } : delete_backup_request)

let make_create_volume_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : create_volume_response)

let make_create_snaplock_configuration
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?audit_log_volume:(audit_log_volume_ : flag option)
    ~snaplock_type:(snaplock_type_ : snaplock_type) () =
  ({
     volume_append_mode_enabled = volume_append_mode_enabled_;
     snaplock_type = snaplock_type_;
     retention_period = retention_period_;
     privileged_delete = privileged_delete_;
     autocommit_period = autocommit_period_;
     audit_log_volume = audit_log_volume_;
   }
    : create_snaplock_configuration)

let make_create_aggregate_configuration
    ?constituents_per_aggregate:(constituents_per_aggregate_ : aggregate_list_multiplier option)
    ?aggregates:(aggregates_ : aggregates option) () =
  ({ constituents_per_aggregate = constituents_per_aggregate_; aggregates = aggregates_ }
    : create_aggregate_configuration)

let make_create_ontap_volume_configuration
    ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option)
    ?aggregate_configuration:(aggregate_configuration_ : create_aggregate_configuration option)
    ?volume_style:(volume_style_ : volume_style option)
    ?snaplock_configuration:(snaplock_configuration_ : create_snaplock_configuration option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?ontap_volume_type:(ontap_volume_type_ : input_ontap_volume_type option)
    ?tiering_policy:(tiering_policy_ : tiering_policy option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?security_style:(security_style_ : security_style option)
    ?junction_path:(junction_path_ : junction_path option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     size_in_bytes = size_in_bytes_;
     aggregate_configuration = aggregate_configuration_;
     volume_style = volume_style_;
     snaplock_configuration = snaplock_configuration_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snapshot_policy = snapshot_policy_;
     ontap_volume_type = ontap_volume_type_;
     tiering_policy = tiering_policy_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     size_in_megabytes = size_in_megabytes_;
     security_style = security_style_;
     junction_path = junction_path_;
   }
    : create_ontap_volume_configuration)

let make_create_open_zfs_origin_snapshot_configuration
    ~copy_strategy:(copy_strategy_ : open_zfs_copy_strategy)
    ~snapshot_ar_n:(snapshot_ar_n_ : resource_ar_n) () =
  ({ copy_strategy = copy_strategy_; snapshot_ar_n = snapshot_ar_n_ }
    : create_open_zfs_origin_snapshot_configuration)

let make_create_open_zfs_volume_configuration
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?read_only:(read_only_ : read_only option)
    ?origin_snapshot:(origin_snapshot_ : create_open_zfs_origin_snapshot_configuration option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?storage_capacity_quota_gi_b:
      (storage_capacity_quota_gi_b_ : integer_no_max_from_negative_one option)
    ?storage_capacity_reservation_gi_b:
      (storage_capacity_reservation_gi_b_ : integer_no_max_from_negative_one option)
    ~parent_volume_id:(parent_volume_id_ : volume_id) () =
  ({
     user_and_group_quotas = user_and_group_quotas_;
     nfs_exports = nfs_exports_;
     read_only = read_only_;
     origin_snapshot = origin_snapshot_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     data_compression_type = data_compression_type_;
     record_size_ki_b = record_size_ki_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
     parent_volume_id = parent_volume_id_;
   }
    : create_open_zfs_volume_configuration)

let make_create_volume_request
    ?open_zfs_configuration:(open_zfs_configuration_ : create_open_zfs_volume_configuration option)
    ?tags:(tags_ : tags option)
    ?ontap_configuration:(ontap_configuration_ : create_ontap_volume_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : volume_name) ~volume_type:(volume_type_ : volume_type) () =
  ({
     open_zfs_configuration = open_zfs_configuration_;
     tags = tags_;
     ontap_configuration = ontap_configuration_;
     name = name_;
     volume_type = volume_type_;
     client_request_token = client_request_token_;
   }
    : create_volume_request)

let make_create_volume_from_backup_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : create_volume_from_backup_response)

let make_create_volume_from_backup_request ?tags:(tags_ : tags option)
    ?ontap_configuration:(ontap_configuration_ : create_ontap_volume_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : volume_name) ~backup_id:(backup_id_ : backup_id) () =
  ({
     tags = tags_;
     ontap_configuration = ontap_configuration_;
     name = name_;
     client_request_token = client_request_token_;
     backup_id = backup_id_;
   }
    : create_volume_from_backup_request)

let make_create_svm_active_directory_configuration
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration option)
    ~net_bios_name:(net_bios_name_ : net_bios_alias) () =
  ({
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     net_bios_name = net_bios_name_;
   }
    : create_svm_active_directory_configuration)

let make_create_storage_virtual_machine_response
    ?storage_virtual_machine:(storage_virtual_machine_ : storage_virtual_machine option) () =
  ({ storage_virtual_machine = storage_virtual_machine_ } : create_storage_virtual_machine_response)

let make_create_storage_virtual_machine_request
    ?root_volume_security_style:
      (root_volume_security_style_ : storage_virtual_machine_root_volume_security_style option)
    ?tags:(tags_ : tags option) ?svm_admin_password:(svm_admin_password_ : admin_password option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?active_directory_configuration:
      (active_directory_configuration_ : create_svm_active_directory_configuration option)
    ~name:(name_ : storage_virtual_machine_name) ~file_system_id:(file_system_id_ : file_system_id)
    () =
  ({
     root_volume_security_style = root_volume_security_style_;
     tags = tags_;
     svm_admin_password = svm_admin_password_;
     name = name_;
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
     active_directory_configuration = active_directory_configuration_;
   }
    : create_storage_virtual_machine_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request ?tags:(tags_ : tags option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~volume_id:(volume_id_ : volume_id) ~name:(name_ : snapshot_name) () =
  ({
     tags = tags_;
     volume_id = volume_id_;
     name = name_;
     client_request_token = client_request_token_;
   }
    : create_snapshot_request)

let make_create_file_system_windows_configuration
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?audit_log_configuration:
      (audit_log_configuration_ : windows_audit_log_create_configuration option)
    ?aliases:(aliases_ : alternate_dns_names option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?deployment_type:(deployment_type_ : windows_deployment_type option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration option)
    ?active_directory_id:(active_directory_id_ : directory_id option)
    ~throughput_capacity:(throughput_capacity_ : megabytes_per_second) () =
  ({
     fsrm_configuration = fsrm_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     audit_log_configuration = audit_log_configuration_;
     aliases = aliases_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     preferred_subnet_id = preferred_subnet_id_;
     deployment_type = deployment_type_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     active_directory_id = active_directory_id_;
   }
    : create_file_system_windows_configuration)

let make_create_file_system_response ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : create_file_system_response)

let make_create_file_system_lustre_metadata_configuration ?iops:(iops_ : metadata_iops option)
    ~mode:(mode_ : metadata_configuration_mode) () =
  ({ mode = mode_; iops = iops_ } : create_file_system_lustre_metadata_configuration)

let make_create_file_system_lustre_configuration
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?metadata_configuration:
      (metadata_configuration_ : create_file_system_lustre_metadata_configuration option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?log_configuration:(log_configuration_ : lustre_log_create_configuration option)
    ?efa_enabled:(efa_enabled_ : flag option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?drive_cache_type:(drive_cache_type_ : drive_cache_type option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?deployment_type:(deployment_type_ : lustre_deployment_type option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?export_path:(export_path_ : archive_path option)
    ?import_path:(import_path_ : archive_path option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({
     data_read_cache_configuration = data_read_cache_configuration_;
     throughput_capacity = throughput_capacity_;
     metadata_configuration = metadata_configuration_;
     root_squash_configuration = root_squash_configuration_;
     log_configuration = log_configuration_;
     efa_enabled = efa_enabled_;
     data_compression_type = data_compression_type_;
     drive_cache_type = drive_cache_type_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     auto_import_policy = auto_import_policy_;
     deployment_type = deployment_type_;
     imported_file_chunk_size = imported_file_chunk_size_;
     export_path = export_path_;
     import_path = import_path_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
   }
    : create_file_system_lustre_configuration)

let make_create_file_system_ontap_configuration
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ~deployment_type:(deployment_type_ : ontap_deployment_type) () =
  ({
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     ha_pairs = ha_pairs_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     route_table_ids = route_table_ids_;
     preferred_subnet_id = preferred_subnet_id_;
     disk_iops_configuration = disk_iops_configuration_;
     fsx_admin_password = fsx_admin_password_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     deployment_type = deployment_type_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : create_file_system_ontap_configuration)

let make_create_file_system_open_zfs_configuration
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?root_volume_configuration:
      (root_volume_configuration_ : open_zfs_create_root_volume_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ~throughput_capacity:(throughput_capacity_ : megabytes_per_second)
    ~deployment_type:(deployment_type_ : open_zfs_deployment_type) () =
  ({
     read_cache_configuration = read_cache_configuration_;
     route_table_ids = route_table_ids_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     preferred_subnet_id = preferred_subnet_id_;
     root_volume_configuration = root_volume_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     throughput_capacity = throughput_capacity_;
     deployment_type = deployment_type_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     copy_tags_to_backups = copy_tags_to_backups_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
   }
    : create_file_system_open_zfs_configuration)

let make_create_file_system_request ?network_type:(network_type_ : network_type option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_file_system_open_zfs_configuration option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?ontap_configuration:(ontap_configuration_ : create_file_system_ontap_configuration option)
    ?lustre_configuration:(lustre_configuration_ : create_file_system_lustre_configuration option)
    ?windows_configuration:
      (windows_configuration_ : create_file_system_windows_configuration option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tags option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?storage_type:(storage_type_ : storage_type option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~file_system_type:(file_system_type_ : file_system_type)
    () =
  ({
     network_type = network_type_;
     open_zfs_configuration = open_zfs_configuration_;
     file_system_type_version = file_system_type_version_;
     ontap_configuration = ontap_configuration_;
     lustre_configuration = lustre_configuration_;
     windows_configuration = windows_configuration_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     storage_type = storage_type_;
     storage_capacity = storage_capacity_;
     file_system_type = file_system_type_;
     client_request_token = client_request_token_;
   }
    : create_file_system_request)

let make_create_file_system_from_backup_response ?file_system:(file_system_ : file_system option) ()
    =
  ({ file_system = file_system_ } : create_file_system_from_backup_response)

let make_create_file_system_from_backup_request ?network_type:(network_type_ : network_type option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_file_system_open_zfs_configuration option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?storage_type:(storage_type_ : storage_type option)
    ?lustre_configuration:(lustre_configuration_ : create_file_system_lustre_configuration option)
    ?windows_configuration:
      (windows_configuration_ : create_file_system_windows_configuration option)
    ?tags:(tags_ : tags option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~backup_id:(backup_id_ : backup_id) () =
  ({
     network_type = network_type_;
     storage_capacity = storage_capacity_;
     open_zfs_configuration = open_zfs_configuration_;
     file_system_type_version = file_system_type_version_;
     kms_key_id = kms_key_id_;
     storage_type = storage_type_;
     lustre_configuration = lustre_configuration_;
     windows_configuration = windows_configuration_;
     tags = tags_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     client_request_token = client_request_token_;
     backup_id = backup_id_;
   }
    : create_file_system_from_backup_request)

let make_create_file_cache_response ?file_cache:(file_cache_ : file_cache_creating option) () =
  ({ file_cache = file_cache_ } : create_file_cache_response)

let make_create_file_cache_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ~metadata_configuration:(metadata_configuration_ : file_cache_lustre_metadata_configuration)
    ~deployment_type:(deployment_type_ : file_cache_lustre_deployment_type)
    ~per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput) () =
  ({
     metadata_configuration = metadata_configuration_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     deployment_type = deployment_type_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
   }
    : create_file_cache_lustre_configuration)

let make_create_file_cache_request
    ?data_repository_associations:
      (data_repository_associations_ : create_file_cache_data_repository_associations option)
    ?lustre_configuration:(lustre_configuration_ : create_file_cache_lustre_configuration option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?copy_tags_to_data_repository_associations:
      (copy_tags_to_data_repository_associations_ : copy_tags_to_data_repository_associations option)
    ?tags:(tags_ : tags option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~storage_capacity:(storage_capacity_ : storage_capacity)
    ~file_cache_type_version:(file_cache_type_version_ : file_system_type_version)
    ~file_cache_type:(file_cache_type_ : file_cache_type) () =
  ({
     data_repository_associations = data_repository_associations_;
     lustre_configuration = lustre_configuration_;
     kms_key_id = kms_key_id_;
     copy_tags_to_data_repository_associations = copy_tags_to_data_repository_associations_;
     tags = tags_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     storage_capacity = storage_capacity_;
     file_cache_type_version = file_cache_type_version_;
     file_cache_type = file_cache_type_;
     client_request_token = client_request_token_;
   }
    : create_file_cache_request)

let make_create_data_repository_task_response
    ?data_repository_task:(data_repository_task_ : data_repository_task option) () =
  ({ data_repository_task = data_repository_task_ } : create_data_repository_task_response)

let make_create_data_repository_task_request
    ?release_configuration:(release_configuration_ : release_configuration option)
    ?capacity_to_release:(capacity_to_release_ : capacity_to_release option)
    ?tags:(tags_ : tags option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?paths:(paths_ : data_repository_task_paths option) ~report:(report_ : completion_report)
    ~file_system_id:(file_system_id_ : file_system_id) ~type_:(type__ : data_repository_task_type)
    () =
  ({
     release_configuration = release_configuration_;
     capacity_to_release = capacity_to_release_;
     tags = tags_;
     client_request_token = client_request_token_;
     report = report_;
     file_system_id = file_system_id_;
     paths = paths_;
     type_ = type__;
   }
    : create_data_repository_task_request)

let make_create_data_repository_association_response
    ?association:(association_ : data_repository_association option) () =
  ({ association = association_ } : create_data_repository_association_response)

let make_create_data_repository_association_request ?tags:(tags_ : tags option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?s3:(s3_ : s3_data_repository_configuration option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?batch_import_meta_data_on_create:
      (batch_import_meta_data_on_create_ : batch_import_meta_data_on_create option)
    ?file_system_path:(file_system_path_ : namespace option)
    ~data_repository_path:(data_repository_path_ : archive_path)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     tags = tags_;
     client_request_token = client_request_token_;
     s3 = s3_;
     imported_file_chunk_size = imported_file_chunk_size_;
     batch_import_meta_data_on_create = batch_import_meta_data_on_create_;
     data_repository_path = data_repository_path_;
     file_system_path = file_system_path_;
     file_system_id = file_system_id_;
   }
    : create_data_repository_association_request)

let make_create_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : create_backup_response)

let make_create_backup_request ?volume_id:(volume_id_ : volume_id option)
    ?tags:(tags_ : tags option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?file_system_id:(file_system_id_ : file_system_id option) () =
  ({
     volume_id = volume_id_;
     tags = tags_;
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
   }
    : create_backup_request)

let make_create_and_attach_s3_access_point_s3_configuration
    ?policy:(policy_ : access_point_policy option)
    ?vpc_configuration:(vpc_configuration_ : s3_access_point_vpc_configuration option) () =
  ({ policy = policy_; vpc_configuration = vpc_configuration_ }
    : create_and_attach_s3_access_point_s3_configuration)

let make_create_and_attach_s3_access_point_response
    ?s3_access_point_attachment:(s3_access_point_attachment_ : s3_access_point_attachment option) ()
    =
  ({ s3_access_point_attachment = s3_access_point_attachment_ }
    : create_and_attach_s3_access_point_response)

let make_create_and_attach_s3_access_point_open_zfs_configuration
    ~file_system_identity:(file_system_identity_ : open_zfs_file_system_identity)
    ~volume_id:(volume_id_ : volume_id) () =
  ({ file_system_identity = file_system_identity_; volume_id = volume_id_ }
    : create_and_attach_s3_access_point_open_zfs_configuration)

let make_create_and_attach_s3_access_point_ontap_configuration
    ~file_system_identity:(file_system_identity_ : ontap_file_system_identity)
    ~volume_id:(volume_id_ : volume_id) () =
  ({ file_system_identity = file_system_identity_; volume_id = volume_id_ }
    : create_and_attach_s3_access_point_ontap_configuration)

let make_create_and_attach_s3_access_point_request
    ?s3_access_point:(s3_access_point_ : create_and_attach_s3_access_point_s3_configuration option)
    ?ontap_configuration:
      (ontap_configuration_ : create_and_attach_s3_access_point_ontap_configuration option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_and_attach_s3_access_point_open_zfs_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~type_:(type__ : s3_access_point_attachment_type)
    ~name:(name_ : s3_access_point_attachment_name) () =
  ({
     s3_access_point = s3_access_point_;
     ontap_configuration = ontap_configuration_;
     open_zfs_configuration = open_zfs_configuration_;
     type_ = type__;
     name = name_;
     client_request_token = client_request_token_;
   }
    : create_and_attach_s3_access_point_request)

let make_copy_snapshot_and_update_volume_response
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option) ?volume_id:(volume_id_ : volume_id option) ()
    =
  ({
     administrative_actions = administrative_actions_;
     lifecycle = lifecycle_;
     volume_id = volume_id_;
   }
    : copy_snapshot_and_update_volume_response)

let make_copy_snapshot_and_update_volume_request
    ?options:(options_ : update_open_zfs_volume_options option)
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~source_snapshot_ar_n:(source_snapshot_ar_n_ : resource_ar_n)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     options = options_;
     copy_strategy = copy_strategy_;
     source_snapshot_ar_n = source_snapshot_ar_n_;
     volume_id = volume_id_;
     client_request_token = client_request_token_;
   }
    : copy_snapshot_and_update_volume_request)

let make_copy_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : copy_backup_response)

let make_copy_backup_request ?tags:(tags_ : tags option) ?copy_tags:(copy_tags_ : flag option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?source_region:(source_region_ : region option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~source_backup_id:(source_backup_id_ : source_backup_id) () =
  ({
     tags = tags_;
     copy_tags = copy_tags_;
     kms_key_id = kms_key_id_;
     source_region = source_region_;
     source_backup_id = source_backup_id_;
     client_request_token = client_request_token_;
   }
    : copy_backup_request)

let make_cancel_data_repository_task_response ?task_id:(task_id_ : task_id option)
    ?lifecycle:(lifecycle_ : data_repository_task_lifecycle option) () =
  ({ task_id = task_id_; lifecycle = lifecycle_ } : cancel_data_repository_task_response)

let make_cancel_data_repository_task_request ~task_id:(task_id_ : task_id) () =
  ({ task_id = task_id_ } : cancel_data_repository_task_request)

let make_associate_file_system_aliases_response ?aliases:(aliases_ : aliases option) () =
  ({ aliases = aliases_ } : associate_file_system_aliases_response)

let make_associate_file_system_aliases_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~aliases:(aliases_ : alternate_dns_names) ~file_system_id:(file_system_id_ : file_system_id) ()
    =
  ({
     aliases = aliases_;
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
   }
    : associate_file_system_aliases_request)
