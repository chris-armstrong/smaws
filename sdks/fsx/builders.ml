open Types

let make_open_zfs_user_or_group_quota ~type_:(type__ : open_zfs_quota_type)
    ~id:(id_ : integer_no_max)
    ~storage_capacity_quota_gi_b:(storage_capacity_quota_gi_b_ : integer_no_max) () =
  ({ type_ = type__; id = id_; storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_ }
    : open_zfs_user_or_group_quota)

let make_open_zfs_client_configuration ~clients:(clients_ : open_zfs_clients)
    ~options:(options_ : open_zfs_nfs_export_options) () =
  ({ clients = clients_; options = options_ } : open_zfs_client_configuration)

let make_open_zfs_nfs_export
    ~client_configurations:(client_configurations_ : open_zfs_client_configurations) () =
  ({ client_configurations = client_configurations_ } : open_zfs_nfs_export)

let make_open_zfs_origin_snapshot_configuration
    ?snapshot_ar_n:(snapshot_ar_n_ : resource_ar_n option)
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option) () =
  ({ snapshot_ar_n = snapshot_ar_n_; copy_strategy = copy_strategy_ }
    : open_zfs_origin_snapshot_configuration)

let make_open_zfs_volume_configuration ?parent_volume_id:(parent_volume_id_ : volume_id option)
    ?volume_path:(volume_path_ : volume_path option)
    ?storage_capacity_reservation_gi_b:(storage_capacity_reservation_gi_b_ : integer_no_max option)
    ?storage_capacity_quota_gi_b:(storage_capacity_quota_gi_b_ : integer_no_max option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?origin_snapshot:(origin_snapshot_ : open_zfs_origin_snapshot_configuration option)
    ?read_only:(read_only_ : read_only option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?restore_to_snapshot:(restore_to_snapshot_ : snapshot_id option)
    ?delete_intermediate_snaphots:(delete_intermediate_snaphots_ : flag option)
    ?delete_cloned_volumes:(delete_cloned_volumes_ : flag option)
    ?delete_intermediate_data:(delete_intermediate_data_ : flag option)
    ?source_snapshot_ar_n:(source_snapshot_ar_n_ : resource_ar_n option)
    ?destination_snapshot:(destination_snapshot_ : snapshot_id option)
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option) () =
  ({
     parent_volume_id = parent_volume_id_;
     volume_path = volume_path_;
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     record_size_ki_b = record_size_ki_b_;
     data_compression_type = data_compression_type_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     origin_snapshot = origin_snapshot_;
     read_only = read_only_;
     nfs_exports = nfs_exports_;
     user_and_group_quotas = user_and_group_quotas_;
     restore_to_snapshot = restore_to_snapshot_;
     delete_intermediate_snaphots = delete_intermediate_snaphots_;
     delete_cloned_volumes = delete_cloned_volumes_;
     delete_intermediate_data = delete_intermediate_data_;
     source_snapshot_ar_n = source_snapshot_ar_n_;
     destination_snapshot = destination_snapshot_;
     copy_strategy = copy_strategy_;
   }
    : open_zfs_volume_configuration)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_lifecycle_transition_reason ?message:(message_ : error_message option) () =
  ({ message = message_ } : lifecycle_transition_reason)

let make_administrative_action_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : administrative_action_failure_details)

let make_open_zfs_read_cache_configuration
    ?sizing_mode:(sizing_mode_ : open_zfs_read_cache_sizing_mode option)
    ?size_gi_b:(size_gi_b_ : storage_capacity option) () =
  ({ sizing_mode = sizing_mode_; size_gi_b = size_gi_b_ } : open_zfs_read_cache_configuration)

let make_disk_iops_configuration ?mode:(mode_ : disk_iops_configuration_mode option)
    ?iops:(iops_ : iops option) () =
  ({ mode = mode_; iops = iops_ } : disk_iops_configuration)

let make_open_zfs_file_system_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?deployment_type:(deployment_type_ : open_zfs_deployment_type option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?root_volume_id:(root_volume_id_ : volume_id option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?endpoint_ip_address:(endpoint_ip_address_ : ip_address option)
    ?endpoint_ipv6_address:(endpoint_ipv6_address_ : ip_address option)
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     deployment_type = deployment_type_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     disk_iops_configuration = disk_iops_configuration_;
     root_volume_id = root_volume_id_;
     preferred_subnet_id = preferred_subnet_id_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     route_table_ids = route_table_ids_;
     endpoint_ip_address = endpoint_ip_address_;
     endpoint_ipv6_address = endpoint_ipv6_address_;
     read_cache_configuration = read_cache_configuration_;
   }
    : open_zfs_file_system_configuration)

let make_file_system_endpoint ?dns_name:(dns_name_ : dns_name option)
    ?ip_addresses:(ip_addresses_ : ontap_endpoint_ip_addresses option)
    ?ipv6_addresses:(ipv6_addresses_ : ontap_endpoint_ip_addresses option) () =
  ({ dns_name = dns_name_; ip_addresses = ip_addresses_; ipv6_addresses = ipv6_addresses_ }
    : file_system_endpoint)

let make_file_system_endpoints ?intercluster:(intercluster_ : file_system_endpoint option)
    ?management:(management_ : file_system_endpoint option) () =
  ({ intercluster = intercluster_; management = management_ } : file_system_endpoints)

let make_ontap_file_system_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?deployment_type:(deployment_type_ : ontap_deployment_type option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?endpoints:(endpoints_ : file_system_endpoints option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option) () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     deployment_type = deployment_type_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     endpoints = endpoints_;
     disk_iops_configuration = disk_iops_configuration_;
     preferred_subnet_id = preferred_subnet_id_;
     route_table_ids = route_table_ids_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     fsx_admin_password = fsx_admin_password_;
     ha_pairs = ha_pairs_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
   }
    : ontap_file_system_configuration)

let make_lustre_read_cache_configuration
    ?sizing_mode:(sizing_mode_ : lustre_read_cache_sizing_mode option)
    ?size_gi_b:(size_gi_b_ : storage_capacity option) () =
  ({ sizing_mode = sizing_mode_; size_gi_b = size_gi_b_ } : lustre_read_cache_configuration)

let make_file_system_lustre_metadata_configuration ?iops:(iops_ : metadata_iops option)
    ~mode:(mode_ : metadata_configuration_mode) () =
  ({ iops = iops_; mode = mode_ } : file_system_lustre_metadata_configuration)

let make_lustre_root_squash_configuration ?root_squash:(root_squash_ : lustre_root_squash option)
    ?no_squash_nids:(no_squash_nids_ : lustre_no_squash_nids option) () =
  ({ root_squash = root_squash_; no_squash_nids = no_squash_nids_ }
    : lustre_root_squash_configuration)

let make_lustre_log_configuration ?destination:(destination_ : general_ar_n option)
    ~level:(level_ : lustre_access_audit_log_level) () =
  ({ level = level_; destination = destination_ } : lustre_log_configuration)

let make_data_repository_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : data_repository_failure_details)

let make_data_repository_configuration ?lifecycle:(lifecycle_ : data_repository_lifecycle option)
    ?import_path:(import_path_ : archive_path option)
    ?export_path:(export_path_ : archive_path option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?failure_details:(failure_details_ : data_repository_failure_details option) () =
  ({
     lifecycle = lifecycle_;
     import_path = import_path_;
     export_path = export_path_;
     imported_file_chunk_size = imported_file_chunk_size_;
     auto_import_policy = auto_import_policy_;
     failure_details = failure_details_;
   }
    : data_repository_configuration)

let make_lustre_file_system_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?data_repository_configuration:
      (data_repository_configuration_ : data_repository_configuration option)
    ?deployment_type:(deployment_type_ : lustre_deployment_type option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?mount_name:(mount_name_ : lustre_file_system_mount_name option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?drive_cache_type:(drive_cache_type_ : drive_cache_type option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?log_configuration:(log_configuration_ : lustre_log_configuration option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?metadata_configuration:
      (metadata_configuration_ : file_system_lustre_metadata_configuration option)
    ?efa_enabled:(efa_enabled_ : flag option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option) () =
  ({
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     data_repository_configuration = data_repository_configuration_;
     deployment_type = deployment_type_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     mount_name = mount_name_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     drive_cache_type = drive_cache_type_;
     data_compression_type = data_compression_type_;
     log_configuration = log_configuration_;
     root_squash_configuration = root_squash_configuration_;
     metadata_configuration = metadata_configuration_;
     efa_enabled = efa_enabled_;
     throughput_capacity = throughput_capacity_;
     data_read_cache_configuration = data_read_cache_configuration_;
   }
    : lustre_file_system_configuration)

let make_windows_fsrm_configuration
    ?event_log_destination:(event_log_destination_ : general_ar_n option)
    ~fsrm_service_enabled:(fsrm_service_enabled_ : flag) () =
  ({ fsrm_service_enabled = fsrm_service_enabled_; event_log_destination = event_log_destination_ }
    : windows_fsrm_configuration)

let make_windows_audit_log_configuration
    ?audit_log_destination:(audit_log_destination_ : general_ar_n option)
    ~file_access_audit_log_level:(file_access_audit_log_level_ : windows_access_audit_log_level)
    ~file_share_access_audit_log_level:
      (file_share_access_audit_log_level_ : windows_access_audit_log_level) () =
  ({
     file_access_audit_log_level = file_access_audit_log_level_;
     file_share_access_audit_log_level = file_share_access_audit_log_level_;
     audit_log_destination = audit_log_destination_;
   }
    : windows_audit_log_configuration)

let make_alias ?name:(name_ : alternate_dns_name option)
    ?lifecycle:(lifecycle_ : alias_lifecycle option) () =
  ({ name = name_; lifecycle = lifecycle_ } : alias)

let make_self_managed_active_directory_attributes
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?user_name:(user_name_ : directory_user_name option) ?dns_ips:(dns_ips_ : dns_ips option)
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option) () =
  ({
     domain_name = domain_name_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     file_system_administrators_group = file_system_administrators_group_;
     user_name = user_name_;
     dns_ips = dns_ips_;
     domain_join_service_account_secret = domain_join_service_account_secret_;
   }
    : self_managed_active_directory_attributes)

let make_windows_file_system_configuration
    ?active_directory_id:(active_directory_id_ : directory_id option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_attributes option)
    ?deployment_type:(deployment_type_ : windows_deployment_type option)
    ?remote_administration_endpoint:(remote_administration_endpoint_ : dns_name option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?preferred_file_server_ip:(preferred_file_server_ip_ : ip_address option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?maintenance_operations_in_progress:
      (maintenance_operations_in_progress_ : file_system_maintenance_operations option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option) ?aliases:(aliases_ : aliases option)
    ?audit_log_configuration:(audit_log_configuration_ : windows_audit_log_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?preferred_file_server_ipv6:(preferred_file_server_ipv6_ : ip_address option)
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option) () =
  ({
     active_directory_id = active_directory_id_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     deployment_type = deployment_type_;
     remote_administration_endpoint = remote_administration_endpoint_;
     preferred_subnet_id = preferred_subnet_id_;
     preferred_file_server_ip = preferred_file_server_ip_;
     throughput_capacity = throughput_capacity_;
     maintenance_operations_in_progress = maintenance_operations_in_progress_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     aliases = aliases_;
     audit_log_configuration = audit_log_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     preferred_file_server_ipv6 = preferred_file_server_ipv6_;
     fsrm_configuration = fsrm_configuration_;
   }
    : windows_file_system_configuration)

let make_file_system_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : file_system_failure_details)

let make_aggregate_configuration ?aggregates:(aggregates_ : aggregates option)
    ?total_constituents:(total_constituents_ : total_constituents option) () =
  ({ aggregates = aggregates_; total_constituents = total_constituents_ } : aggregate_configuration)

let make_retention_period ?value:(value_ : retention_period_value option)
    ~type_:(type__ : retention_period_type) () =
  ({ type_ = type__; value = value_ } : retention_period)

let make_snaplock_retention_period ~default_retention:(default_retention_ : retention_period)
    ~minimum_retention:(minimum_retention_ : retention_period)
    ~maximum_retention:(maximum_retention_ : retention_period) () =
  ({
     default_retention = default_retention_;
     minimum_retention = minimum_retention_;
     maximum_retention = maximum_retention_;
   }
    : snaplock_retention_period)

let make_autocommit_period ?value:(value_ : autocommit_period_value option)
    ~type_:(type__ : autocommit_period_type) () =
  ({ type_ = type__; value = value_ } : autocommit_period)

let make_snaplock_configuration ?audit_log_volume:(audit_log_volume_ : flag option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?snaplock_type:(snaplock_type_ : snaplock_type option)
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option) () =
  ({
     audit_log_volume = audit_log_volume_;
     autocommit_period = autocommit_period_;
     privileged_delete = privileged_delete_;
     retention_period = retention_period_;
     snaplock_type = snaplock_type_;
     volume_append_mode_enabled = volume_append_mode_enabled_;
   }
    : snaplock_configuration)

let make_tiering_policy ?cooling_period:(cooling_period_ : cooling_period option)
    ?name:(name_ : tiering_policy_name option) () =
  ({ cooling_period = cooling_period_; name = name_ } : tiering_policy)

let make_ontap_volume_configuration
    ?flex_cache_endpoint_type:(flex_cache_endpoint_type_ : flex_cache_endpoint_type option)
    ?junction_path:(junction_path_ : junction_path option)
    ?security_style:(security_style_ : security_style option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option)
    ?storage_virtual_machine_root:(storage_virtual_machine_root_ : flag option)
    ?tiering_policy:(tiering_policy_ : tiering_policy option) ?uui_d:(uui_d_ : uui_d option)
    ?ontap_volume_type:(ontap_volume_type_ : ontap_volume_type option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snaplock_configuration:(snaplock_configuration_ : snaplock_configuration option)
    ?volume_style:(volume_style_ : volume_style option)
    ?aggregate_configuration:(aggregate_configuration_ : aggregate_configuration option)
    ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option) () =
  ({
     flex_cache_endpoint_type = flex_cache_endpoint_type_;
     junction_path = junction_path_;
     security_style = security_style_;
     size_in_megabytes = size_in_megabytes_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     storage_virtual_machine_root = storage_virtual_machine_root_;
     tiering_policy = tiering_policy_;
     uui_d = uui_d_;
     ontap_volume_type = ontap_volume_type_;
     snapshot_policy = snapshot_policy_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snaplock_configuration = snaplock_configuration_;
     volume_style = volume_style_;
     aggregate_configuration = aggregate_configuration_;
     size_in_bytes = size_in_bytes_;
   }
    : ontap_volume_configuration)

let make_volume ?creation_time:(creation_time_ : creation_time option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option) ?name:(name_ : volume_name option)
    ?ontap_configuration:(ontap_configuration_ : ontap_volume_configuration option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ?tags:(tags_ : tags option)
    ?volume_id:(volume_id_ : volume_id option) ?volume_type:(volume_type_ : volume_type option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?open_zfs_configuration:(open_zfs_configuration_ : open_zfs_volume_configuration option) () =
  ({
     creation_time = creation_time_;
     file_system_id = file_system_id_;
     lifecycle = lifecycle_;
     name = name_;
     ontap_configuration = ontap_configuration_;
     resource_ar_n = resource_ar_n_;
     tags = tags_;
     volume_id = volume_id_;
     volume_type = volume_type_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     administrative_actions = administrative_actions_;
     open_zfs_configuration = open_zfs_configuration_;
   }
    : volume)

let make_snapshot ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option) ?name:(name_ : snapshot_name option)
    ?volume_id:(volume_id_ : volume_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?lifecycle:(lifecycle_ : snapshot_lifecycle option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?tags:(tags_ : tags option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option) () =
  ({
     resource_ar_n = resource_ar_n_;
     snapshot_id = snapshot_id_;
     name = name_;
     volume_id = volume_id_;
     creation_time = creation_time_;
     lifecycle = lifecycle_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     tags = tags_;
     administrative_actions = administrative_actions_;
   }
    : snapshot)

let make_file_system ?owner_id:(owner_id_ : aws_account_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?file_system_type:(file_system_type_ : file_system_type option)
    ?lifecycle:(lifecycle_ : file_system_lifecycle option)
    ?failure_details:(failure_details_ : file_system_failure_details option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?storage_type:(storage_type_ : storage_type option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?dns_name:(dns_name_ : dns_name option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ?tags:(tags_ : tags option)
    ?windows_configuration:(windows_configuration_ : windows_file_system_configuration option)
    ?lustre_configuration:(lustre_configuration_ : lustre_file_system_configuration option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option)
    ?ontap_configuration:(ontap_configuration_ : ontap_file_system_configuration option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?open_zfs_configuration:(open_zfs_configuration_ : open_zfs_file_system_configuration option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     owner_id = owner_id_;
     creation_time = creation_time_;
     file_system_id = file_system_id_;
     file_system_type = file_system_type_;
     lifecycle = lifecycle_;
     failure_details = failure_details_;
     storage_capacity = storage_capacity_;
     storage_type = storage_type_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     network_interface_ids = network_interface_ids_;
     dns_name = dns_name_;
     kms_key_id = kms_key_id_;
     resource_ar_n = resource_ar_n_;
     tags = tags_;
     windows_configuration = windows_configuration_;
     lustre_configuration = lustre_configuration_;
     administrative_actions = administrative_actions_;
     ontap_configuration = ontap_configuration_;
     file_system_type_version = file_system_type_version_;
     open_zfs_configuration = open_zfs_configuration_;
     network_type = network_type_;
   }
    : file_system)

let make_administrative_action
    ?administrative_action_type:(administrative_action_type_ : administrative_action_type option)
    ?progress_percent:(progress_percent_ : progress_percent option)
    ?request_time:(request_time_ : request_time option) ?status:(status_ : status option)
    ?target_file_system_values:(target_file_system_values_ : file_system option)
    ?failure_details:(failure_details_ : administrative_action_failure_details option)
    ?target_volume_values:(target_volume_values_ : volume option)
    ?target_snapshot_values:(target_snapshot_values_ : snapshot option)
    ?total_transfer_bytes:(total_transfer_bytes_ : total_transfer_bytes option)
    ?remaining_transfer_bytes:(remaining_transfer_bytes_ : remaining_transfer_bytes option)
    ?message:(message_ : error_message option) () =
  ({
     administrative_action_type = administrative_action_type_;
     progress_percent = progress_percent_;
     request_time = request_time_;
     status = status_;
     target_file_system_values = target_file_system_values_;
     failure_details = failure_details_;
     target_volume_values = target_volume_values_;
     target_snapshot_values = target_snapshot_values_;
     total_transfer_bytes = total_transfer_bytes_;
     remaining_transfer_bytes = remaining_transfer_bytes_;
     message = message_;
   }
    : administrative_action)

let make_update_volume_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : update_volume_response)

let make_update_open_zfs_volume_configuration
    ?storage_capacity_reservation_gi_b:
      (storage_capacity_reservation_gi_b_ : integer_no_max_from_negative_one option)
    ?storage_capacity_quota_gi_b:
      (storage_capacity_quota_gi_b_ : integer_no_max_from_negative_one option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?read_only:(read_only_ : read_only option) () =
  ({
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     record_size_ki_b = record_size_ki_b_;
     data_compression_type = data_compression_type_;
     nfs_exports = nfs_exports_;
     user_and_group_quotas = user_and_group_quotas_;
     read_only = read_only_;
   }
    : update_open_zfs_volume_configuration)

let make_update_snaplock_configuration ?audit_log_volume:(audit_log_volume_ : flag option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option) () =
  ({
     audit_log_volume = audit_log_volume_;
     autocommit_period = autocommit_period_;
     privileged_delete = privileged_delete_;
     retention_period = retention_period_;
     volume_append_mode_enabled = volume_append_mode_enabled_;
   }
    : update_snaplock_configuration)

let make_update_ontap_volume_configuration ?junction_path:(junction_path_ : junction_path option)
    ?security_style:(security_style_ : security_style option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?tiering_policy:(tiering_policy_ : tiering_policy option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snaplock_configuration:(snaplock_configuration_ : update_snaplock_configuration option)
    ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option) () =
  ({
     junction_path = junction_path_;
     security_style = security_style_;
     size_in_megabytes = size_in_megabytes_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     tiering_policy = tiering_policy_;
     snapshot_policy = snapshot_policy_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snaplock_configuration = snaplock_configuration_;
     size_in_bytes = size_in_bytes_;
   }
    : update_ontap_volume_configuration)

let make_update_volume_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?ontap_configuration:(ontap_configuration_ : update_ontap_volume_configuration option)
    ?name:(name_ : volume_name option)
    ?open_zfs_configuration:(open_zfs_configuration_ : update_open_zfs_volume_configuration option)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     client_request_token = client_request_token_;
     volume_id = volume_id_;
     ontap_configuration = ontap_configuration_;
     name = name_;
     open_zfs_configuration = open_zfs_configuration_;
   }
    : update_volume_request)

let make_svm_endpoint ?dns_name:(dns_name_ : dns_name option)
    ?ip_addresses:(ip_addresses_ : ontap_endpoint_ip_addresses option)
    ?ipv6_addresses:(ipv6_addresses_ : ontap_endpoint_ip_addresses option) () =
  ({ dns_name = dns_name_; ip_addresses = ip_addresses_; ipv6_addresses = ipv6_addresses_ }
    : svm_endpoint)

let make_svm_endpoints ?iscsi:(iscsi_ : svm_endpoint option)
    ?management:(management_ : svm_endpoint option) ?nfs:(nfs_ : svm_endpoint option)
    ?smb:(smb_ : svm_endpoint option) () =
  ({ iscsi = iscsi_; management = management_; nfs = nfs_; smb = smb_ } : svm_endpoints)

let make_svm_active_directory_configuration ?net_bios_name:(net_bios_name_ : net_bios_alias option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_attributes option) () =
  ({
     net_bios_name = net_bios_name_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
   }
    : svm_active_directory_configuration)

let make_storage_virtual_machine
    ?active_directory_configuration:
      (active_directory_configuration_ : svm_active_directory_configuration option)
    ?creation_time:(creation_time_ : creation_time option)
    ?endpoints:(endpoints_ : svm_endpoints option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?lifecycle:(lifecycle_ : storage_virtual_machine_lifecycle option)
    ?name:(name_ : storage_virtual_machine_name option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option)
    ?subtype:(subtype_ : storage_virtual_machine_subtype option) ?uui_d:(uui_d_ : uui_d option)
    ?tags:(tags_ : tags option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?root_volume_security_style:
      (root_volume_security_style_ : storage_virtual_machine_root_volume_security_style option) () =
  ({
     active_directory_configuration = active_directory_configuration_;
     creation_time = creation_time_;
     endpoints = endpoints_;
     file_system_id = file_system_id_;
     lifecycle = lifecycle_;
     name = name_;
     resource_ar_n = resource_ar_n_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     subtype = subtype_;
     uui_d = uui_d_;
     tags = tags_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     root_volume_security_style = root_volume_security_style_;
   }
    : storage_virtual_machine)

let make_update_storage_virtual_machine_response
    ?storage_virtual_machine:(storage_virtual_machine_ : storage_virtual_machine option) () =
  ({ storage_virtual_machine = storage_virtual_machine_ } : update_storage_virtual_machine_response)

let make_self_managed_active_directory_configuration_updates
    ?user_name:(user_name_ : directory_user_name option)
    ?password:(password_ : directory_password option) ?dns_ips:(dns_ips_ : dns_ips option)
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option) () =
  ({
     user_name = user_name_;
     password = password_;
     dns_ips = dns_ips_;
     domain_name = domain_name_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     file_system_administrators_group = file_system_administrators_group_;
     domain_join_service_account_secret = domain_join_service_account_secret_;
   }
    : self_managed_active_directory_configuration_updates)

let make_update_svm_active_directory_configuration
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration_updates option)
    ?net_bios_name:(net_bios_name_ : net_bios_alias option) () =
  ({
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     net_bios_name = net_bios_name_;
   }
    : update_svm_active_directory_configuration)

let make_update_storage_virtual_machine_request
    ?active_directory_configuration:
      (active_directory_configuration_ : update_svm_active_directory_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?svm_admin_password:(svm_admin_password_ : admin_password option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     active_directory_configuration = active_directory_configuration_;
     client_request_token = client_request_token_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     svm_admin_password = svm_admin_password_;
   }
    : update_storage_virtual_machine_request)

let make_update_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : update_snapshot_response)

let make_update_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : snapshot_name) ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ client_request_token = client_request_token_; name = name_; snapshot_id = snapshot_id_ }
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
    ?enable_fsx_route_table_updates_from_participant_accounts:
      (enable_fsx_route_table_updates_from_participant_accounts_ : verbose_flag option)
    ?client_request_token:(client_request_token_ : client_request_token option) () =
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       enable_fsx_route_table_updates_from_participant_accounts_;
     client_request_token = client_request_token_;
   }
    : update_shared_vpc_configuration_request)

let make_update_file_system_response ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : update_file_system_response)

let make_update_file_system_open_zfs_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?add_route_table_ids:(add_route_table_ids_ : route_table_ids option)
    ?remove_route_table_ids:(remove_route_table_ids_ : route_table_ids option)
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option) () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     disk_iops_configuration = disk_iops_configuration_;
     add_route_table_ids = add_route_table_ids_;
     remove_route_table_ids = remove_route_table_ids_;
     read_cache_configuration = read_cache_configuration_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
   }
    : update_file_system_open_zfs_configuration)

let make_update_file_system_ontap_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?add_route_table_ids:(add_route_table_ids_ : route_table_ids option)
    ?remove_route_table_ids:(remove_route_table_ids_ : route_table_ids option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option) () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     fsx_admin_password = fsx_admin_password_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     disk_iops_configuration = disk_iops_configuration_;
     throughput_capacity = throughput_capacity_;
     add_route_table_ids = add_route_table_ids_;
     remove_route_table_ids = remove_route_table_ids_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     ha_pairs = ha_pairs_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
   }
    : update_file_system_ontap_configuration)

let make_update_file_system_lustre_metadata_configuration ?iops:(iops_ : metadata_iops option)
    ?mode:(mode_ : metadata_configuration_mode option) () =
  ({ iops = iops_; mode = mode_ } : update_file_system_lustre_metadata_configuration)

let make_lustre_log_create_configuration ?destination:(destination_ : general_ar_n option)
    ~level:(level_ : lustre_access_audit_log_level) () =
  ({ level = level_; destination = destination_ } : lustre_log_create_configuration)

let make_update_file_system_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?log_configuration:(log_configuration_ : lustre_log_create_configuration option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?metadata_configuration:
      (metadata_configuration_ : update_file_system_lustre_metadata_configuration option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option) () =
  ({
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     auto_import_policy = auto_import_policy_;
     data_compression_type = data_compression_type_;
     log_configuration = log_configuration_;
     root_squash_configuration = root_squash_configuration_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     metadata_configuration = metadata_configuration_;
     throughput_capacity = throughput_capacity_;
     data_read_cache_configuration = data_read_cache_configuration_;
   }
    : update_file_system_lustre_configuration)

let make_windows_audit_log_create_configuration
    ?audit_log_destination:(audit_log_destination_ : general_ar_n option)
    ~file_access_audit_log_level:(file_access_audit_log_level_ : windows_access_audit_log_level)
    ~file_share_access_audit_log_level:
      (file_share_access_audit_log_level_ : windows_access_audit_log_level) () =
  ({
     file_access_audit_log_level = file_access_audit_log_level_;
     file_share_access_audit_log_level = file_share_access_audit_log_level_;
     audit_log_destination = audit_log_destination_;
   }
    : windows_audit_log_create_configuration)

let make_update_file_system_windows_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration_updates option)
    ?audit_log_configuration:
      (audit_log_configuration_ : windows_audit_log_create_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option) () =
  ({
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     throughput_capacity = throughput_capacity_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     audit_log_configuration = audit_log_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     fsrm_configuration = fsrm_configuration_;
   }
    : update_file_system_windows_configuration)

let make_update_file_system_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?windows_configuration:
      (windows_configuration_ : update_file_system_windows_configuration option)
    ?lustre_configuration:(lustre_configuration_ : update_file_system_lustre_configuration option)
    ?ontap_configuration:(ontap_configuration_ : update_file_system_ontap_configuration option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : update_file_system_open_zfs_configuration option)
    ?storage_type:(storage_type_ : storage_type option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?network_type:(network_type_ : network_type option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
     storage_capacity = storage_capacity_;
     windows_configuration = windows_configuration_;
     lustre_configuration = lustre_configuration_;
     ontap_configuration = ontap_configuration_;
     open_zfs_configuration = open_zfs_configuration_;
     storage_type = storage_type_;
     file_system_type_version = file_system_type_version_;
     network_type = network_type_;
   }
    : update_file_system_request)

let make_file_cache_lustre_metadata_configuration
    ~storage_capacity:(storage_capacity_ : metadata_storage_capacity) () =
  ({ storage_capacity = storage_capacity_ } : file_cache_lustre_metadata_configuration)

let make_file_cache_lustre_configuration
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?deployment_type:(deployment_type_ : file_cache_lustre_deployment_type option)
    ?mount_name:(mount_name_ : lustre_file_system_mount_name option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?metadata_configuration:
      (metadata_configuration_ : file_cache_lustre_metadata_configuration option)
    ?log_configuration:(log_configuration_ : lustre_log_configuration option) () =
  ({
     per_unit_storage_throughput = per_unit_storage_throughput_;
     deployment_type = deployment_type_;
     mount_name = mount_name_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     metadata_configuration = metadata_configuration_;
     log_configuration = log_configuration_;
   }
    : file_cache_lustre_configuration)

let make_file_cache_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : file_cache_failure_details)

let make_file_cache ?owner_id:(owner_id_ : aws_account_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?file_cache_type:(file_cache_type_ : file_cache_type option)
    ?file_cache_type_version:(file_cache_type_version_ : file_system_type_version option)
    ?lifecycle:(lifecycle_ : file_cache_lifecycle option)
    ?failure_details:(failure_details_ : file_cache_failure_details option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?dns_name:(dns_name_ : dns_name option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?lustre_configuration:(lustre_configuration_ : file_cache_lustre_configuration option)
    ?data_repository_association_ids:
      (data_repository_association_ids_ : data_repository_association_ids option) () =
  ({
     owner_id = owner_id_;
     creation_time = creation_time_;
     file_cache_id = file_cache_id_;
     file_cache_type = file_cache_type_;
     file_cache_type_version = file_cache_type_version_;
     lifecycle = lifecycle_;
     failure_details = failure_details_;
     storage_capacity = storage_capacity_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     network_interface_ids = network_interface_ids_;
     dns_name = dns_name_;
     kms_key_id = kms_key_id_;
     resource_ar_n = resource_ar_n_;
     lustre_configuration = lustre_configuration_;
     data_repository_association_ids = data_repository_association_ids_;
   }
    : file_cache)

let make_update_file_cache_response ?file_cache:(file_cache_ : file_cache option) () =
  ({ file_cache = file_cache_ } : update_file_cache_response)

let make_update_file_cache_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option) () =
  ({ weekly_maintenance_start_time = weekly_maintenance_start_time_ }
    : update_file_cache_lustre_configuration)

let make_update_file_cache_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?lustre_configuration:(lustre_configuration_ : update_file_cache_lustre_configuration option)
    ~file_cache_id:(file_cache_id_ : file_cache_id) () =
  ({
     file_cache_id = file_cache_id_;
     client_request_token = client_request_token_;
     lustre_configuration = lustre_configuration_;
   }
    : update_file_cache_request)

let make_auto_export_policy ?events:(events_ : event_types option) () =
  ({ events = events_ } : auto_export_policy)

let make_nfs_data_repository_configuration ?dns_ips:(dns_ips_ : repository_dns_ips option)
    ?auto_export_policy:(auto_export_policy_ : auto_export_policy option)
    ~version:(version_ : nfs_version) () =
  ({ version = version_; dns_ips = dns_ips_; auto_export_policy = auto_export_policy_ }
    : nfs_data_repository_configuration)

let make_auto_import_policy ?events:(events_ : event_types option) () =
  ({ events = events_ } : auto_import_policy)

let make_s3_data_repository_configuration
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy option)
    ?auto_export_policy:(auto_export_policy_ : auto_export_policy option) () =
  ({ auto_import_policy = auto_import_policy_; auto_export_policy = auto_export_policy_ }
    : s3_data_repository_configuration)

let make_data_repository_association
    ?association_id:(association_id_ : data_repository_association_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?file_system_id:(file_system_id_ : file_system_id option)
    ?lifecycle:(lifecycle_ : data_repository_lifecycle option)
    ?failure_details:(failure_details_ : data_repository_failure_details option)
    ?file_system_path:(file_system_path_ : namespace option)
    ?data_repository_path:(data_repository_path_ : archive_path option)
    ?batch_import_meta_data_on_create:
      (batch_import_meta_data_on_create_ : batch_import_meta_data_on_create option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?s3:(s3_ : s3_data_repository_configuration option) ?tags:(tags_ : tags option)
    ?creation_time:(creation_time_ : creation_time option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?file_cache_path:(file_cache_path_ : namespace option)
    ?data_repository_subdirectories:(data_repository_subdirectories_ : sub_directories_paths option)
    ?nf_s:(nf_s_ : nfs_data_repository_configuration option) () =
  ({
     association_id = association_id_;
     resource_ar_n = resource_ar_n_;
     file_system_id = file_system_id_;
     lifecycle = lifecycle_;
     failure_details = failure_details_;
     file_system_path = file_system_path_;
     data_repository_path = data_repository_path_;
     batch_import_meta_data_on_create = batch_import_meta_data_on_create_;
     imported_file_chunk_size = imported_file_chunk_size_;
     s3 = s3_;
     tags = tags_;
     creation_time = creation_time_;
     file_cache_id = file_cache_id_;
     file_cache_path = file_cache_path_;
     data_repository_subdirectories = data_repository_subdirectories_;
     nf_s = nf_s_;
   }
    : data_repository_association)

let make_update_data_repository_association_response
    ?association:(association_ : data_repository_association option) () =
  ({ association = association_ } : update_data_repository_association_response)

let make_update_data_repository_association_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?s3:(s3_ : s3_data_repository_configuration option)
    ~association_id:(association_id_ : data_repository_association_id) () =
  ({
     association_id = association_id_;
     client_request_token = client_request_token_;
     imported_file_chunk_size = imported_file_chunk_size_;
     s3 = s3_;
   }
    : update_data_repository_association_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : resource_ar_n) ~tags:(tags_ : tags)
    () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_start_misconfigured_state_recovery_response
    ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : start_misconfigured_state_recovery_response)

let make_start_misconfigured_state_recovery_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ client_request_token = client_request_token_; file_system_id = file_system_id_ }
    : start_misconfigured_state_recovery_request)

let make_restore_volume_from_snapshot_response ?volume_id:(volume_id_ : volume_id option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option) () =
  ({
     volume_id = volume_id_;
     lifecycle = lifecycle_;
     administrative_actions = administrative_actions_;
   }
    : restore_volume_from_snapshot_response)

let make_restore_volume_from_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?options:(options_ : restore_open_zfs_volume_options option) ~volume_id:(volume_id_ : volume_id)
    ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({
     client_request_token = client_request_token_;
     volume_id = volume_id_;
     snapshot_id = snapshot_id_;
     options = options_;
   }
    : restore_volume_from_snapshot_request)

let make_release_file_system_nfs_v3_locks_response ?file_system:(file_system_ : file_system option)
    () =
  ({ file_system = file_system_ } : release_file_system_nfs_v3_locks_response)

let make_release_file_system_nfs_v3_locks_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_; client_request_token = client_request_token_ }
    : release_file_system_nfs_v3_locks_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_ar_n:(resource_ar_n_ : resource_ar_n) ()
    =
  ({ resource_ar_n = resource_ar_n_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_disassociate_file_system_aliases_response ?aliases:(aliases_ : aliases option) () =
  ({ aliases = aliases_ } : disassociate_file_system_aliases_response)

let make_disassociate_file_system_aliases_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) ~aliases:(aliases_ : alternate_dns_names) ()
    =
  ({
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
     aliases = aliases_;
   }
    : disassociate_file_system_aliases_request)

let make_detach_and_delete_s3_access_point_response
    ?lifecycle:(lifecycle_ : s3_access_point_attachment_lifecycle option)
    ?name:(name_ : s3_access_point_attachment_name option) () =
  ({ lifecycle = lifecycle_; name = name_ } : detach_and_delete_s3_access_point_response)

let make_detach_and_delete_s3_access_point_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~name:(name_ : s3_access_point_attachment_name) () =
  ({ client_request_token = client_request_token_; name = name_ }
    : detach_and_delete_s3_access_point_request)

let make_describe_volumes_response ?volumes:(volumes_ : volumes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ volumes = volumes_; next_token = next_token_ } : describe_volumes_response)

let make_volume_filter ?name:(name_ : volume_filter_name option)
    ?values:(values_ : volume_filter_values option) () =
  ({ name = name_; values = values_ } : volume_filter)

let make_describe_volumes_request ?volume_ids:(volume_ids_ : volume_ids option)
    ?filters:(filters_ : volume_filters option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     volume_ids = volume_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_volumes_request)

let make_describe_storage_virtual_machines_response
    ?storage_virtual_machines:(storage_virtual_machines_ : storage_virtual_machines option)
    ?next_token:(next_token_ : next_token option) () =
  ({ storage_virtual_machines = storage_virtual_machines_; next_token = next_token_ }
    : describe_storage_virtual_machines_response)

let make_storage_virtual_machine_filter ?name:(name_ : storage_virtual_machine_filter_name option)
    ?values:(values_ : storage_virtual_machine_filter_values option) () =
  ({ name = name_; values = values_ } : storage_virtual_machine_filter)

let make_describe_storage_virtual_machines_request
    ?storage_virtual_machine_ids:(storage_virtual_machine_ids_ : storage_virtual_machine_ids option)
    ?filters:(filters_ : storage_virtual_machine_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     storage_virtual_machine_ids = storage_virtual_machine_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_storage_virtual_machines_request)

let make_describe_snapshots_response ?snapshots:(snapshots_ : snapshots option)
    ?next_token:(next_token_ : next_token option) () =
  ({ snapshots = snapshots_; next_token = next_token_ } : describe_snapshots_response)

let make_snapshot_filter ?name:(name_ : snapshot_filter_name option)
    ?values:(values_ : snapshot_filter_values option) () =
  ({ name = name_; values = values_ } : snapshot_filter)

let make_describe_snapshots_request ?snapshot_ids:(snapshot_ids_ : snapshot_ids option)
    ?filters:(filters_ : snapshot_filters option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?include_shared:(include_shared_ : include_shared option) () =
  ({
     snapshot_ids = snapshot_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     include_shared = include_shared_;
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

let make_s3_access_point_vpc_configuration ?vpc_id:(vpc_id_ : vpc_id option) () =
  ({ vpc_id = vpc_id_ } : s3_access_point_vpc_configuration)

let make_s3_access_point ?resource_ar_n:(resource_ar_n_ : general_ar_n option)
    ?alias:(alias_ : s3_access_point_alias option)
    ?vpc_configuration:(vpc_configuration_ : s3_access_point_vpc_configuration option) () =
  ({ resource_ar_n = resource_ar_n_; alias = alias_; vpc_configuration = vpc_configuration_ }
    : s3_access_point)

let make_ontap_windows_file_system_user ~name:(name_ : ontap_file_system_user_name) () =
  ({ name = name_ } : ontap_windows_file_system_user)

let make_ontap_unix_file_system_user ~name:(name_ : ontap_file_system_user_name) () =
  ({ name = name_ } : ontap_unix_file_system_user)

let make_ontap_file_system_identity ?unix_user:(unix_user_ : ontap_unix_file_system_user option)
    ?windows_user:(windows_user_ : ontap_windows_file_system_user option)
    ~type_:(type__ : ontap_file_system_user_type) () =
  ({ type_ = type__; unix_user = unix_user_; windows_user = windows_user_ }
    : ontap_file_system_identity)

let make_s3_access_point_ontap_configuration ?volume_id:(volume_id_ : volume_id option)
    ?file_system_identity:(file_system_identity_ : ontap_file_system_identity option) () =
  ({ volume_id = volume_id_; file_system_identity = file_system_identity_ }
    : s3_access_point_ontap_configuration)

let make_open_zfs_posix_file_system_user
    ?secondary_gids:(secondary_gids_ : file_system_secondary_gi_ds option)
    ~uid:(uid_ : file_system_ui_d) ~gid:(gid_ : file_system_gi_d) () =
  ({ uid = uid_; gid = gid_; secondary_gids = secondary_gids_ } : open_zfs_posix_file_system_user)

let make_open_zfs_file_system_identity
    ?posix_user:(posix_user_ : open_zfs_posix_file_system_user option)
    ~type_:(type__ : open_zfs_file_system_user_type) () =
  ({ type_ = type__; posix_user = posix_user_ } : open_zfs_file_system_identity)

let make_s3_access_point_open_zfs_configuration ?volume_id:(volume_id_ : volume_id option)
    ?file_system_identity:(file_system_identity_ : open_zfs_file_system_identity option) () =
  ({ volume_id = volume_id_; file_system_identity = file_system_identity_ }
    : s3_access_point_open_zfs_configuration)

let make_s3_access_point_attachment
    ?lifecycle:(lifecycle_ : s3_access_point_attachment_lifecycle option)
    ?lifecycle_transition_reason:(lifecycle_transition_reason_ : lifecycle_transition_reason option)
    ?creation_time:(creation_time_ : creation_time option)
    ?name:(name_ : s3_access_point_attachment_name option)
    ?type_:(type__ : s3_access_point_attachment_type option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : s3_access_point_open_zfs_configuration option)
    ?ontap_configuration:(ontap_configuration_ : s3_access_point_ontap_configuration option)
    ?s3_access_point:(s3_access_point_ : s3_access_point option) () =
  ({
     lifecycle = lifecycle_;
     lifecycle_transition_reason = lifecycle_transition_reason_;
     creation_time = creation_time_;
     name = name_;
     type_ = type__;
     open_zfs_configuration = open_zfs_configuration_;
     ontap_configuration = ontap_configuration_;
     s3_access_point = s3_access_point_;
   }
    : s3_access_point_attachment)

let make_describe_s3_access_point_attachments_response
    ?s3_access_point_attachments:(s3_access_point_attachments_ : s3_access_point_attachments option)
    ?next_token:(next_token_ : next_token option) () =
  ({ s3_access_point_attachments = s3_access_point_attachments_; next_token = next_token_ }
    : describe_s3_access_point_attachments_response)

let make_s3_access_point_attachments_filter
    ?name:(name_ : s3_access_point_attachments_filter_name option)
    ?values:(values_ : s3_access_point_attachments_filter_values option) () =
  ({ name = name_; values = values_ } : s3_access_point_attachments_filter)

let make_describe_s3_access_point_attachments_request
    ?names:(names_ : s3_access_point_attachment_names option)
    ?filters:(filters_ : s3_access_point_attachments_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ names = names_; filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_s3_access_point_attachments_request)

let make_describe_file_systems_response ?file_systems:(file_systems_ : file_systems option)
    ?next_token:(next_token_ : next_token option) () =
  ({ file_systems = file_systems_; next_token = next_token_ } : describe_file_systems_response)

let make_describe_file_systems_request ?file_system_ids:(file_system_ids_ : file_system_ids option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ file_system_ids = file_system_ids_; max_results = max_results_; next_token = next_token_ }
    : describe_file_systems_request)

let make_describe_file_system_aliases_response ?aliases:(aliases_ : aliases option)
    ?next_token:(next_token_ : next_token option) () =
  ({ aliases = aliases_; next_token = next_token_ } : describe_file_system_aliases_response)

let make_describe_file_system_aliases_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_file_system_aliases_request)

let make_describe_file_caches_response ?file_caches:(file_caches_ : file_caches option)
    ?next_token:(next_token_ : next_token option) () =
  ({ file_caches = file_caches_; next_token = next_token_ } : describe_file_caches_response)

let make_describe_file_caches_request ?file_cache_ids:(file_cache_ids_ : file_cache_ids option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ file_cache_ids = file_cache_ids_; max_results = max_results_; next_token = next_token_ }
    : describe_file_caches_request)

let make_duration_since_last_access ?unit_:(unit__ : unit_ option) ?value:(value_ : value option) ()
    =
  ({ unit_ = unit__; value = value_ } : duration_since_last_access)

let make_release_configuration
    ?duration_since_last_access:(duration_since_last_access_ : duration_since_last_access option) ()
    =
  ({ duration_since_last_access = duration_since_last_access_ } : release_configuration)

let make_completion_report ?path:(path_ : archive_path option)
    ?format:(format_ : report_format option) ?scope:(scope_ : report_scope option)
    ~enabled:(enabled_ : flag) () =
  ({ enabled = enabled_; path = path_; format = format_; scope = scope_ } : completion_report)

let make_data_repository_task_status ?total_count:(total_count_ : total_count option)
    ?succeeded_count:(succeeded_count_ : succeeded_count option)
    ?failed_count:(failed_count_ : failed_count option)
    ?last_updated_time:(last_updated_time_ : last_updated_time option)
    ?released_capacity:(released_capacity_ : released_capacity option) () =
  ({
     total_count = total_count_;
     succeeded_count = succeeded_count_;
     failed_count = failed_count_;
     last_updated_time = last_updated_time_;
     released_capacity = released_capacity_;
   }
    : data_repository_task_status)

let make_data_repository_task_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : data_repository_task_failure_details)

let make_data_repository_task ?start_time:(start_time_ : start_time option)
    ?end_time:(end_time_ : end_time option) ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?tags:(tags_ : tags option) ?file_system_id:(file_system_id_ : file_system_id option)
    ?paths:(paths_ : data_repository_task_paths option)
    ?failure_details:(failure_details_ : data_repository_task_failure_details option)
    ?status:(status_ : data_repository_task_status option)
    ?report:(report_ : completion_report option)
    ?capacity_to_release:(capacity_to_release_ : capacity_to_release option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?release_configuration:(release_configuration_ : release_configuration option)
    ~task_id:(task_id_ : task_id) ~lifecycle:(lifecycle_ : data_repository_task_lifecycle)
    ~type_:(type__ : data_repository_task_type) ~creation_time:(creation_time_ : creation_time) () =
  ({
     task_id = task_id_;
     lifecycle = lifecycle_;
     type_ = type__;
     creation_time = creation_time_;
     start_time = start_time_;
     end_time = end_time_;
     resource_ar_n = resource_ar_n_;
     tags = tags_;
     file_system_id = file_system_id_;
     paths = paths_;
     failure_details = failure_details_;
     status = status_;
     report = report_;
     capacity_to_release = capacity_to_release_;
     file_cache_id = file_cache_id_;
     release_configuration = release_configuration_;
   }
    : data_repository_task)

let make_describe_data_repository_tasks_response
    ?data_repository_tasks:(data_repository_tasks_ : data_repository_tasks option)
    ?next_token:(next_token_ : next_token option) () =
  ({ data_repository_tasks = data_repository_tasks_; next_token = next_token_ }
    : describe_data_repository_tasks_response)

let make_data_repository_task_filter ?name:(name_ : data_repository_task_filter_name option)
    ?values:(values_ : data_repository_task_filter_values option) () =
  ({ name = name_; values = values_ } : data_repository_task_filter)

let make_describe_data_repository_tasks_request ?task_ids:(task_ids_ : task_ids option)
    ?filters:(filters_ : data_repository_task_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     task_ids = task_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_data_repository_tasks_request)

let make_describe_data_repository_associations_response
    ?associations:(associations_ : data_repository_associations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ associations = associations_; next_token = next_token_ }
    : describe_data_repository_associations_response)

let make_filter ?name:(name_ : filter_name option) ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : filter)

let make_describe_data_repository_associations_request
    ?association_ids:(association_ids_ : data_repository_association_ids option)
    ?filters:(filters_ : filters option) ?max_results:(max_results_ : limited_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     association_ids = association_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_data_repository_associations_request)

let make_active_directory_backup_attributes
    ?domain_name:(domain_name_ : active_directory_fully_qualified_name option)
    ?active_directory_id:(active_directory_id_ : directory_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) () =
  ({
     domain_name = domain_name_;
     active_directory_id = active_directory_id_;
     resource_ar_n = resource_ar_n_;
   }
    : active_directory_backup_attributes)

let make_backup_failure_details ?message:(message_ : error_message option) () =
  ({ message = message_ } : backup_failure_details)

let make_backup ?failure_details:(failure_details_ : backup_failure_details option)
    ?progress_percent:(progress_percent_ : progress_percent option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ?tags:(tags_ : tags option)
    ?directory_information:(directory_information_ : active_directory_backup_attributes option)
    ?owner_id:(owner_id_ : aws_account_id option)
    ?source_backup_id:(source_backup_id_ : backup_id option)
    ?source_backup_region:(source_backup_region_ : region option)
    ?resource_type:(resource_type_ : resource_type option) ?volume:(volume_ : volume option)
    ?size_in_bytes:(size_in_bytes_ : size_in_bytes option) ~backup_id:(backup_id_ : backup_id)
    ~lifecycle:(lifecycle_ : backup_lifecycle) ~type_:(type__ : backup_type)
    ~creation_time:(creation_time_ : creation_time) ~file_system:(file_system_ : file_system) () =
  ({
     backup_id = backup_id_;
     lifecycle = lifecycle_;
     failure_details = failure_details_;
     type_ = type__;
     progress_percent = progress_percent_;
     creation_time = creation_time_;
     kms_key_id = kms_key_id_;
     resource_ar_n = resource_ar_n_;
     tags = tags_;
     file_system = file_system_;
     directory_information = directory_information_;
     owner_id = owner_id_;
     source_backup_id = source_backup_id_;
     source_backup_region = source_backup_region_;
     resource_type = resource_type_;
     volume = volume_;
     size_in_bytes = size_in_bytes_;
   }
    : backup)

let make_describe_backups_response ?backups:(backups_ : backups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ backups = backups_; next_token = next_token_ } : describe_backups_response)

let make_describe_backups_request ?backup_ids:(backup_ids_ : backup_ids option)
    ?filters:(filters_ : filters option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     backup_ids = backup_ids_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_backups_request)

let make_delete_volume_ontap_response ?final_backup_id:(final_backup_id_ : backup_id option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ final_backup_id = final_backup_id_; final_backup_tags = final_backup_tags_ }
    : delete_volume_ontap_response)

let make_delete_volume_response ?volume_id:(volume_id_ : volume_id option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option)
    ?ontap_response:(ontap_response_ : delete_volume_ontap_response option) () =
  ({ volume_id = volume_id_; lifecycle = lifecycle_; ontap_response = ontap_response_ }
    : delete_volume_response)

let make_delete_volume_open_zfs_configuration
    ?options:(options_ : delete_open_zfs_volume_options option) () =
  ({ options = options_ } : delete_volume_open_zfs_configuration)

let make_delete_volume_ontap_configuration ?skip_final_backup:(skip_final_backup_ : flag option)
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?bypass_snaplock_enterprise_retention:(bypass_snaplock_enterprise_retention_ : flag option) () =
  ({
     skip_final_backup = skip_final_backup_;
     final_backup_tags = final_backup_tags_;
     bypass_snaplock_enterprise_retention = bypass_snaplock_enterprise_retention_;
   }
    : delete_volume_ontap_configuration)

let make_delete_volume_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?ontap_configuration:(ontap_configuration_ : delete_volume_ontap_configuration option)
    ?open_zfs_configuration:(open_zfs_configuration_ : delete_volume_open_zfs_configuration option)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     client_request_token = client_request_token_;
     volume_id = volume_id_;
     ontap_configuration = ontap_configuration_;
     open_zfs_configuration = open_zfs_configuration_;
   }
    : delete_volume_request)

let make_delete_storage_virtual_machine_response
    ?storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id option)
    ?lifecycle:(lifecycle_ : storage_virtual_machine_lifecycle option) () =
  ({ storage_virtual_machine_id = storage_virtual_machine_id_; lifecycle = lifecycle_ }
    : delete_storage_virtual_machine_response)

let make_delete_storage_virtual_machine_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     client_request_token = client_request_token_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
   }
    : delete_storage_virtual_machine_request)

let make_delete_snapshot_response ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?lifecycle:(lifecycle_ : snapshot_lifecycle option) () =
  ({ snapshot_id = snapshot_id_; lifecycle = lifecycle_ } : delete_snapshot_response)

let make_delete_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ client_request_token = client_request_token_; snapshot_id = snapshot_id_ }
    : delete_snapshot_request)

let make_delete_file_system_open_zfs_response ?final_backup_id:(final_backup_id_ : backup_id option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ final_backup_id = final_backup_id_; final_backup_tags = final_backup_tags_ }
    : delete_file_system_open_zfs_response)

let make_delete_file_system_lustre_response ?final_backup_id:(final_backup_id_ : backup_id option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ final_backup_id = final_backup_id_; final_backup_tags = final_backup_tags_ }
    : delete_file_system_lustre_response)

let make_delete_file_system_windows_response ?final_backup_id:(final_backup_id_ : backup_id option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ final_backup_id = final_backup_id_; final_backup_tags = final_backup_tags_ }
    : delete_file_system_windows_response)

let make_delete_file_system_response ?file_system_id:(file_system_id_ : file_system_id option)
    ?lifecycle:(lifecycle_ : file_system_lifecycle option)
    ?windows_response:(windows_response_ : delete_file_system_windows_response option)
    ?lustre_response:(lustre_response_ : delete_file_system_lustre_response option)
    ?open_zfs_response:(open_zfs_response_ : delete_file_system_open_zfs_response option) () =
  ({
     file_system_id = file_system_id_;
     lifecycle = lifecycle_;
     windows_response = windows_response_;
     lustre_response = lustre_response_;
     open_zfs_response = open_zfs_response_;
   }
    : delete_file_system_response)

let make_delete_file_system_open_zfs_configuration
    ?skip_final_backup:(skip_final_backup_ : flag option)
    ?final_backup_tags:(final_backup_tags_ : tags option)
    ?options:(options_ : delete_file_system_open_zfs_options option) () =
  ({
     skip_final_backup = skip_final_backup_;
     final_backup_tags = final_backup_tags_;
     options = options_;
   }
    : delete_file_system_open_zfs_configuration)

let make_delete_file_system_lustre_configuration
    ?skip_final_backup:(skip_final_backup_ : flag option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ skip_final_backup = skip_final_backup_; final_backup_tags = final_backup_tags_ }
    : delete_file_system_lustre_configuration)

let make_delete_file_system_windows_configuration
    ?skip_final_backup:(skip_final_backup_ : flag option)
    ?final_backup_tags:(final_backup_tags_ : tags option) () =
  ({ skip_final_backup = skip_final_backup_; final_backup_tags = final_backup_tags_ }
    : delete_file_system_windows_configuration)

let make_delete_file_system_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?windows_configuration:
      (windows_configuration_ : delete_file_system_windows_configuration option)
    ?lustre_configuration:(lustre_configuration_ : delete_file_system_lustre_configuration option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : delete_file_system_open_zfs_configuration option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
     windows_configuration = windows_configuration_;
     lustre_configuration = lustre_configuration_;
     open_zfs_configuration = open_zfs_configuration_;
   }
    : delete_file_system_request)

let make_delete_file_cache_response ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?lifecycle:(lifecycle_ : file_cache_lifecycle option) () =
  ({ file_cache_id = file_cache_id_; lifecycle = lifecycle_ } : delete_file_cache_response)

let make_delete_file_cache_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_cache_id:(file_cache_id_ : file_cache_id) () =
  ({ file_cache_id = file_cache_id_; client_request_token = client_request_token_ }
    : delete_file_cache_request)

let make_delete_data_repository_association_response
    ?association_id:(association_id_ : data_repository_association_id option)
    ?lifecycle:(lifecycle_ : data_repository_lifecycle option)
    ?delete_data_in_file_system:(delete_data_in_file_system_ : delete_data_in_file_system option) ()
    =
  ({
     association_id = association_id_;
     lifecycle = lifecycle_;
     delete_data_in_file_system = delete_data_in_file_system_;
   }
    : delete_data_repository_association_response)

let make_delete_data_repository_association_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?delete_data_in_file_system:(delete_data_in_file_system_ : delete_data_in_file_system option)
    ~association_id:(association_id_ : data_repository_association_id) () =
  ({
     association_id = association_id_;
     client_request_token = client_request_token_;
     delete_data_in_file_system = delete_data_in_file_system_;
   }
    : delete_data_repository_association_request)

let make_delete_backup_response ?backup_id:(backup_id_ : backup_id option)
    ?lifecycle:(lifecycle_ : backup_lifecycle option) () =
  ({ backup_id = backup_id_; lifecycle = lifecycle_ } : delete_backup_response)

let make_delete_backup_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~backup_id:(backup_id_ : backup_id) () =
  ({ backup_id = backup_id_; client_request_token = client_request_token_ } : delete_backup_request)

let make_create_volume_from_backup_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : create_volume_from_backup_response)

let make_create_aggregate_configuration ?aggregates:(aggregates_ : aggregates option)
    ?constituents_per_aggregate:(constituents_per_aggregate_ : aggregate_list_multiplier option) ()
    =
  ({ aggregates = aggregates_; constituents_per_aggregate = constituents_per_aggregate_ }
    : create_aggregate_configuration)

let make_create_snaplock_configuration ?audit_log_volume:(audit_log_volume_ : flag option)
    ?autocommit_period:(autocommit_period_ : autocommit_period option)
    ?privileged_delete:(privileged_delete_ : privileged_delete option)
    ?retention_period:(retention_period_ : snaplock_retention_period option)
    ?volume_append_mode_enabled:(volume_append_mode_enabled_ : flag option)
    ~snaplock_type:(snaplock_type_ : snaplock_type) () =
  ({
     audit_log_volume = audit_log_volume_;
     autocommit_period = autocommit_period_;
     privileged_delete = privileged_delete_;
     retention_period = retention_period_;
     snaplock_type = snaplock_type_;
     volume_append_mode_enabled = volume_append_mode_enabled_;
   }
    : create_snaplock_configuration)

let make_create_ontap_volume_configuration ?junction_path:(junction_path_ : junction_path option)
    ?security_style:(security_style_ : security_style option)
    ?size_in_megabytes:(size_in_megabytes_ : volume_capacity option)
    ?storage_efficiency_enabled:(storage_efficiency_enabled_ : flag option)
    ?tiering_policy:(tiering_policy_ : tiering_policy option)
    ?ontap_volume_type:(ontap_volume_type_ : input_ontap_volume_type option)
    ?snapshot_policy:(snapshot_policy_ : snapshot_policy option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?snaplock_configuration:(snaplock_configuration_ : create_snaplock_configuration option)
    ?volume_style:(volume_style_ : volume_style option)
    ?aggregate_configuration:(aggregate_configuration_ : create_aggregate_configuration option)
    ?size_in_bytes:(size_in_bytes_ : volume_capacity_bytes option)
    ~storage_virtual_machine_id:(storage_virtual_machine_id_ : storage_virtual_machine_id) () =
  ({
     junction_path = junction_path_;
     security_style = security_style_;
     size_in_megabytes = size_in_megabytes_;
     storage_efficiency_enabled = storage_efficiency_enabled_;
     storage_virtual_machine_id = storage_virtual_machine_id_;
     tiering_policy = tiering_policy_;
     ontap_volume_type = ontap_volume_type_;
     snapshot_policy = snapshot_policy_;
     copy_tags_to_backups = copy_tags_to_backups_;
     snaplock_configuration = snaplock_configuration_;
     volume_style = volume_style_;
     aggregate_configuration = aggregate_configuration_;
     size_in_bytes = size_in_bytes_;
   }
    : create_ontap_volume_configuration)

let make_create_volume_from_backup_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?ontap_configuration:(ontap_configuration_ : create_ontap_volume_configuration option)
    ?tags:(tags_ : tags option) ~backup_id:(backup_id_ : backup_id) ~name:(name_ : volume_name) () =
  ({
     backup_id = backup_id_;
     client_request_token = client_request_token_;
     name = name_;
     ontap_configuration = ontap_configuration_;
     tags = tags_;
   }
    : create_volume_from_backup_request)

let make_create_volume_response ?volume:(volume_ : volume option) () =
  ({ volume = volume_ } : create_volume_response)

let make_create_open_zfs_origin_snapshot_configuration
    ~snapshot_ar_n:(snapshot_ar_n_ : resource_ar_n)
    ~copy_strategy:(copy_strategy_ : open_zfs_copy_strategy) () =
  ({ snapshot_ar_n = snapshot_ar_n_; copy_strategy = copy_strategy_ }
    : create_open_zfs_origin_snapshot_configuration)

let make_create_open_zfs_volume_configuration
    ?storage_capacity_reservation_gi_b:
      (storage_capacity_reservation_gi_b_ : integer_no_max_from_negative_one option)
    ?storage_capacity_quota_gi_b:
      (storage_capacity_quota_gi_b_ : integer_no_max_from_negative_one option)
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?origin_snapshot:(origin_snapshot_ : create_open_zfs_origin_snapshot_configuration option)
    ?read_only:(read_only_ : read_only option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ~parent_volume_id:(parent_volume_id_ : volume_id) () =
  ({
     parent_volume_id = parent_volume_id_;
     storage_capacity_reservation_gi_b = storage_capacity_reservation_gi_b_;
     storage_capacity_quota_gi_b = storage_capacity_quota_gi_b_;
     record_size_ki_b = record_size_ki_b_;
     data_compression_type = data_compression_type_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     origin_snapshot = origin_snapshot_;
     read_only = read_only_;
     nfs_exports = nfs_exports_;
     user_and_group_quotas = user_and_group_quotas_;
   }
    : create_open_zfs_volume_configuration)

let make_create_volume_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?ontap_configuration:(ontap_configuration_ : create_ontap_volume_configuration option)
    ?tags:(tags_ : tags option)
    ?open_zfs_configuration:(open_zfs_configuration_ : create_open_zfs_volume_configuration option)
    ~volume_type:(volume_type_ : volume_type) ~name:(name_ : volume_name) () =
  ({
     client_request_token = client_request_token_;
     volume_type = volume_type_;
     name = name_;
     ontap_configuration = ontap_configuration_;
     tags = tags_;
     open_zfs_configuration = open_zfs_configuration_;
   }
    : create_volume_request)

let make_create_storage_virtual_machine_response
    ?storage_virtual_machine:(storage_virtual_machine_ : storage_virtual_machine option) () =
  ({ storage_virtual_machine = storage_virtual_machine_ } : create_storage_virtual_machine_response)

let make_self_managed_active_directory_configuration
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?file_system_administrators_group:
      (file_system_administrators_group_ : file_system_administrators_group_name option)
    ?user_name:(user_name_ : directory_user_name option)
    ?password:(password_ : directory_password option)
    ?domain_join_service_account_secret:
      (domain_join_service_account_secret_ : customer_secrets_manager_ar_n option)
    ~domain_name:(domain_name_ : active_directory_fully_qualified_name)
    ~dns_ips:(dns_ips_ : dns_ips) () =
  ({
     domain_name = domain_name_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     file_system_administrators_group = file_system_administrators_group_;
     user_name = user_name_;
     password = password_;
     dns_ips = dns_ips_;
     domain_join_service_account_secret = domain_join_service_account_secret_;
   }
    : self_managed_active_directory_configuration)

let make_create_svm_active_directory_configuration
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration option)
    ~net_bios_name:(net_bios_name_ : net_bios_alias) () =
  ({
     net_bios_name = net_bios_name_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
   }
    : create_svm_active_directory_configuration)

let make_create_storage_virtual_machine_request
    ?active_directory_configuration:
      (active_directory_configuration_ : create_svm_active_directory_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?svm_admin_password:(svm_admin_password_ : admin_password option) ?tags:(tags_ : tags option)
    ?root_volume_security_style:
      (root_volume_security_style_ : storage_virtual_machine_root_volume_security_style option)
    ~file_system_id:(file_system_id_ : file_system_id) ~name:(name_ : storage_virtual_machine_name)
    () =
  ({
     active_directory_configuration = active_directory_configuration_;
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
     name = name_;
     svm_admin_password = svm_admin_password_;
     tags = tags_;
     root_volume_security_style = root_volume_security_style_;
   }
    : create_storage_virtual_machine_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tags option) ~name:(name_ : snapshot_name) ~volume_id:(volume_id_ : volume_id) ()
    =
  ({
     client_request_token = client_request_token_;
     name = name_;
     volume_id = volume_id_;
     tags = tags_;
   }
    : create_snapshot_request)

let make_create_file_system_from_backup_response ?file_system:(file_system_ : file_system option) ()
    =
  ({ file_system = file_system_ } : create_file_system_from_backup_response)

let make_open_zfs_create_root_volume_configuration
    ?record_size_ki_b:(record_size_ki_b_ : integer_record_size_ki_b option)
    ?data_compression_type:(data_compression_type_ : open_zfs_data_compression_type option)
    ?nfs_exports:(nfs_exports_ : open_zfs_nfs_exports option)
    ?user_and_group_quotas:(user_and_group_quotas_ : open_zfs_user_and_group_quotas option)
    ?copy_tags_to_snapshots:(copy_tags_to_snapshots_ : flag option)
    ?read_only:(read_only_ : read_only option) () =
  ({
     record_size_ki_b = record_size_ki_b_;
     data_compression_type = data_compression_type_;
     nfs_exports = nfs_exports_;
     user_and_group_quotas = user_and_group_quotas_;
     copy_tags_to_snapshots = copy_tags_to_snapshots_;
     read_only = read_only_;
   }
    : open_zfs_create_root_volume_configuration)

let make_create_file_system_open_zfs_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?copy_tags_to_volumes:(copy_tags_to_volumes_ : flag option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?root_volume_configuration:
      (root_volume_configuration_ : open_zfs_create_root_volume_configuration option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?read_cache_configuration:(read_cache_configuration_ : open_zfs_read_cache_configuration option)
    ~deployment_type:(deployment_type_ : open_zfs_deployment_type)
    ~throughput_capacity:(throughput_capacity_ : megabytes_per_second) () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     copy_tags_to_volumes = copy_tags_to_volumes_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     deployment_type = deployment_type_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     disk_iops_configuration = disk_iops_configuration_;
     root_volume_configuration = root_volume_configuration_;
     preferred_subnet_id = preferred_subnet_id_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
     route_table_ids = route_table_ids_;
     read_cache_configuration = read_cache_configuration_;
   }
    : create_file_system_open_zfs_configuration)

let make_create_file_system_lustre_metadata_configuration ?iops:(iops_ : metadata_iops option)
    ~mode:(mode_ : metadata_configuration_mode) () =
  ({ iops = iops_; mode = mode_ } : create_file_system_lustre_metadata_configuration)

let make_create_file_system_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?import_path:(import_path_ : archive_path option)
    ?export_path:(export_path_ : archive_path option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?deployment_type:(deployment_type_ : lustre_deployment_type option)
    ?auto_import_policy:(auto_import_policy_ : auto_import_policy_type option)
    ?per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?drive_cache_type:(drive_cache_type_ : drive_cache_type option)
    ?data_compression_type:(data_compression_type_ : data_compression_type option)
    ?efa_enabled:(efa_enabled_ : flag option)
    ?log_configuration:(log_configuration_ : lustre_log_create_configuration option)
    ?root_squash_configuration:
      (root_squash_configuration_ : lustre_root_squash_configuration option)
    ?metadata_configuration:
      (metadata_configuration_ : create_file_system_lustre_metadata_configuration option)
    ?throughput_capacity:(throughput_capacity_ : throughput_capacity_mbps option)
    ?data_read_cache_configuration:
      (data_read_cache_configuration_ : lustre_read_cache_configuration option) () =
  ({
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     import_path = import_path_;
     export_path = export_path_;
     imported_file_chunk_size = imported_file_chunk_size_;
     deployment_type = deployment_type_;
     auto_import_policy = auto_import_policy_;
     per_unit_storage_throughput = per_unit_storage_throughput_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     drive_cache_type = drive_cache_type_;
     data_compression_type = data_compression_type_;
     efa_enabled = efa_enabled_;
     log_configuration = log_configuration_;
     root_squash_configuration = root_squash_configuration_;
     metadata_configuration = metadata_configuration_;
     throughput_capacity = throughput_capacity_;
     data_read_cache_configuration = data_read_cache_configuration_;
   }
    : create_file_system_lustre_configuration)

let make_create_file_system_windows_configuration
    ?active_directory_id:(active_directory_id_ : directory_id option)
    ?self_managed_active_directory_configuration:
      (self_managed_active_directory_configuration_ :
         self_managed_active_directory_configuration option)
    ?deployment_type:(deployment_type_ : windows_deployment_type option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?copy_tags_to_backups:(copy_tags_to_backups_ : flag option)
    ?aliases:(aliases_ : alternate_dns_names option)
    ?audit_log_configuration:
      (audit_log_configuration_ : windows_audit_log_create_configuration option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?fsrm_configuration:(fsrm_configuration_ : windows_fsrm_configuration option)
    ~throughput_capacity:(throughput_capacity_ : megabytes_per_second) () =
  ({
     active_directory_id = active_directory_id_;
     self_managed_active_directory_configuration = self_managed_active_directory_configuration_;
     deployment_type = deployment_type_;
     preferred_subnet_id = preferred_subnet_id_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     automatic_backup_retention_days = automatic_backup_retention_days_;
     copy_tags_to_backups = copy_tags_to_backups_;
     aliases = aliases_;
     audit_log_configuration = audit_log_configuration_;
     disk_iops_configuration = disk_iops_configuration_;
     fsrm_configuration = fsrm_configuration_;
   }
    : create_file_system_windows_configuration)

let make_create_file_system_from_backup_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?tags:(tags_ : tags option)
    ?windows_configuration:
      (windows_configuration_ : create_file_system_windows_configuration option)
    ?lustre_configuration:(lustre_configuration_ : create_file_system_lustre_configuration option)
    ?storage_type:(storage_type_ : storage_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_file_system_open_zfs_configuration option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?network_type:(network_type_ : network_type option) ~backup_id:(backup_id_ : backup_id)
    ~subnet_ids:(subnet_ids_ : subnet_ids) () =
  ({
     backup_id = backup_id_;
     client_request_token = client_request_token_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     tags = tags_;
     windows_configuration = windows_configuration_;
     lustre_configuration = lustre_configuration_;
     storage_type = storage_type_;
     kms_key_id = kms_key_id_;
     file_system_type_version = file_system_type_version_;
     open_zfs_configuration = open_zfs_configuration_;
     storage_capacity = storage_capacity_;
     network_type = network_type_;
   }
    : create_file_system_from_backup_request)

let make_create_file_system_response ?file_system:(file_system_ : file_system option) () =
  ({ file_system = file_system_ } : create_file_system_response)

let make_create_file_system_ontap_configuration
    ?automatic_backup_retention_days:
      (automatic_backup_retention_days_ : automatic_backup_retention_days option)
    ?daily_automatic_backup_start_time:(daily_automatic_backup_start_time_ : daily_time option)
    ?endpoint_ip_address_range:(endpoint_ip_address_range_ : ip_address_range option)
    ?fsx_admin_password:(fsx_admin_password_ : admin_password option)
    ?disk_iops_configuration:(disk_iops_configuration_ : disk_iops_configuration option)
    ?preferred_subnet_id:(preferred_subnet_id_ : subnet_id option)
    ?route_table_ids:(route_table_ids_ : route_table_ids option)
    ?throughput_capacity:(throughput_capacity_ : megabytes_per_second option)
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ?ha_pairs:(ha_pairs_ : ha_pairs option)
    ?throughput_capacity_per_ha_pair:
      (throughput_capacity_per_ha_pair_ : throughput_capacity_per_ha_pair option)
    ?endpoint_ipv6_address_range:(endpoint_ipv6_address_range_ : ipv6_address_range option)
    ~deployment_type:(deployment_type_ : ontap_deployment_type) () =
  ({
     automatic_backup_retention_days = automatic_backup_retention_days_;
     daily_automatic_backup_start_time = daily_automatic_backup_start_time_;
     deployment_type = deployment_type_;
     endpoint_ip_address_range = endpoint_ip_address_range_;
     fsx_admin_password = fsx_admin_password_;
     disk_iops_configuration = disk_iops_configuration_;
     preferred_subnet_id = preferred_subnet_id_;
     route_table_ids = route_table_ids_;
     throughput_capacity = throughput_capacity_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     ha_pairs = ha_pairs_;
     throughput_capacity_per_ha_pair = throughput_capacity_per_ha_pair_;
     endpoint_ipv6_address_range = endpoint_ipv6_address_range_;
   }
    : create_file_system_ontap_configuration)

let make_create_file_system_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?storage_type:(storage_type_ : storage_type option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?tags:(tags_ : tags option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?windows_configuration:
      (windows_configuration_ : create_file_system_windows_configuration option)
    ?lustre_configuration:(lustre_configuration_ : create_file_system_lustre_configuration option)
    ?ontap_configuration:(ontap_configuration_ : create_file_system_ontap_configuration option)
    ?file_system_type_version:(file_system_type_version_ : file_system_type_version option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_file_system_open_zfs_configuration option)
    ?network_type:(network_type_ : network_type option)
    ~file_system_type:(file_system_type_ : file_system_type) ~subnet_ids:(subnet_ids_ : subnet_ids)
    () =
  ({
     client_request_token = client_request_token_;
     file_system_type = file_system_type_;
     storage_capacity = storage_capacity_;
     storage_type = storage_type_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     windows_configuration = windows_configuration_;
     lustre_configuration = lustre_configuration_;
     ontap_configuration = ontap_configuration_;
     file_system_type_version = file_system_type_version_;
     open_zfs_configuration = open_zfs_configuration_;
     network_type = network_type_;
   }
    : create_file_system_request)

let make_file_cache_creating ?owner_id:(owner_id_ : aws_account_id option)
    ?creation_time:(creation_time_ : creation_time option)
    ?file_cache_id:(file_cache_id_ : file_cache_id option)
    ?file_cache_type:(file_cache_type_ : file_cache_type option)
    ?file_cache_type_version:(file_cache_type_version_ : file_system_type_version option)
    ?lifecycle:(lifecycle_ : file_cache_lifecycle option)
    ?failure_details:(failure_details_ : file_cache_failure_details option)
    ?storage_capacity:(storage_capacity_ : storage_capacity option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?network_interface_ids:(network_interface_ids_ : network_interface_ids option)
    ?dns_name:(dns_name_ : dns_name option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ?tags:(tags_ : tags option)
    ?copy_tags_to_data_repository_associations:
      (copy_tags_to_data_repository_associations_ : copy_tags_to_data_repository_associations option)
    ?lustre_configuration:(lustre_configuration_ : file_cache_lustre_configuration option)
    ?data_repository_association_ids:
      (data_repository_association_ids_ : data_repository_association_ids option) () =
  ({
     owner_id = owner_id_;
     creation_time = creation_time_;
     file_cache_id = file_cache_id_;
     file_cache_type = file_cache_type_;
     file_cache_type_version = file_cache_type_version_;
     lifecycle = lifecycle_;
     failure_details = failure_details_;
     storage_capacity = storage_capacity_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     network_interface_ids = network_interface_ids_;
     dns_name = dns_name_;
     kms_key_id = kms_key_id_;
     resource_ar_n = resource_ar_n_;
     tags = tags_;
     copy_tags_to_data_repository_associations = copy_tags_to_data_repository_associations_;
     lustre_configuration = lustre_configuration_;
     data_repository_association_ids = data_repository_association_ids_;
   }
    : file_cache_creating)

let make_create_file_cache_response ?file_cache:(file_cache_ : file_cache_creating option) () =
  ({ file_cache = file_cache_ } : create_file_cache_response)

let make_file_cache_nfs_configuration ?dns_ips:(dns_ips_ : repository_dns_ips option)
    ~version:(version_ : nfs_version) () =
  ({ version = version_; dns_ips = dns_ips_ } : file_cache_nfs_configuration)

let make_file_cache_data_repository_association
    ?data_repository_subdirectories:(data_repository_subdirectories_ : sub_directories_paths option)
    ?nf_s:(nf_s_ : file_cache_nfs_configuration option)
    ~file_cache_path:(file_cache_path_ : namespace)
    ~data_repository_path:(data_repository_path_ : archive_path) () =
  ({
     file_cache_path = file_cache_path_;
     data_repository_path = data_repository_path_;
     data_repository_subdirectories = data_repository_subdirectories_;
     nf_s = nf_s_;
   }
    : file_cache_data_repository_association)

let make_create_file_cache_lustre_configuration
    ?weekly_maintenance_start_time:(weekly_maintenance_start_time_ : weekly_time option)
    ~per_unit_storage_throughput:(per_unit_storage_throughput_ : per_unit_storage_throughput)
    ~deployment_type:(deployment_type_ : file_cache_lustre_deployment_type)
    ~metadata_configuration:(metadata_configuration_ : file_cache_lustre_metadata_configuration) ()
    =
  ({
     per_unit_storage_throughput = per_unit_storage_throughput_;
     deployment_type = deployment_type_;
     weekly_maintenance_start_time = weekly_maintenance_start_time_;
     metadata_configuration = metadata_configuration_;
   }
    : create_file_cache_lustre_configuration)

let make_create_file_cache_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?tags:(tags_ : tags option)
    ?copy_tags_to_data_repository_associations:
      (copy_tags_to_data_repository_associations_ : copy_tags_to_data_repository_associations option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?lustre_configuration:(lustre_configuration_ : create_file_cache_lustre_configuration option)
    ?data_repository_associations:
      (data_repository_associations_ : create_file_cache_data_repository_associations option)
    ~file_cache_type:(file_cache_type_ : file_cache_type)
    ~file_cache_type_version:(file_cache_type_version_ : file_system_type_version)
    ~storage_capacity:(storage_capacity_ : storage_capacity) ~subnet_ids:(subnet_ids_ : subnet_ids)
    () =
  ({
     client_request_token = client_request_token_;
     file_cache_type = file_cache_type_;
     file_cache_type_version = file_cache_type_version_;
     storage_capacity = storage_capacity_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     tags = tags_;
     copy_tags_to_data_repository_associations = copy_tags_to_data_repository_associations_;
     kms_key_id = kms_key_id_;
     lustre_configuration = lustre_configuration_;
     data_repository_associations = data_repository_associations_;
   }
    : create_file_cache_request)

let make_create_data_repository_task_response
    ?data_repository_task:(data_repository_task_ : data_repository_task option) () =
  ({ data_repository_task = data_repository_task_ } : create_data_repository_task_response)

let make_create_data_repository_task_request ?paths:(paths_ : data_repository_task_paths option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tags option)
    ?capacity_to_release:(capacity_to_release_ : capacity_to_release option)
    ?release_configuration:(release_configuration_ : release_configuration option)
    ~type_:(type__ : data_repository_task_type) ~file_system_id:(file_system_id_ : file_system_id)
    ~report:(report_ : completion_report) () =
  ({
     type_ = type__;
     paths = paths_;
     file_system_id = file_system_id_;
     report = report_;
     client_request_token = client_request_token_;
     tags = tags_;
     capacity_to_release = capacity_to_release_;
     release_configuration = release_configuration_;
   }
    : create_data_repository_task_request)

let make_create_data_repository_association_response
    ?association:(association_ : data_repository_association option) () =
  ({ association = association_ } : create_data_repository_association_response)

let make_create_data_repository_association_request
    ?file_system_path:(file_system_path_ : namespace option)
    ?batch_import_meta_data_on_create:
      (batch_import_meta_data_on_create_ : batch_import_meta_data_on_create option)
    ?imported_file_chunk_size:(imported_file_chunk_size_ : megabytes option)
    ?s3:(s3_ : s3_data_repository_configuration option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tags option) ~file_system_id:(file_system_id_ : file_system_id)
    ~data_repository_path:(data_repository_path_ : archive_path) () =
  ({
     file_system_id = file_system_id_;
     file_system_path = file_system_path_;
     data_repository_path = data_repository_path_;
     batch_import_meta_data_on_create = batch_import_meta_data_on_create_;
     imported_file_chunk_size = imported_file_chunk_size_;
     s3 = s3_;
     client_request_token = client_request_token_;
     tags = tags_;
   }
    : create_data_repository_association_request)

let make_create_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : create_backup_response)

let make_create_backup_request ?file_system_id:(file_system_id_ : file_system_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tags option) ?volume_id:(volume_id_ : volume_id option) () =
  ({
     file_system_id = file_system_id_;
     client_request_token = client_request_token_;
     tags = tags_;
     volume_id = volume_id_;
   }
    : create_backup_request)

let make_create_and_attach_s3_access_point_response
    ?s3_access_point_attachment:(s3_access_point_attachment_ : s3_access_point_attachment option) ()
    =
  ({ s3_access_point_attachment = s3_access_point_attachment_ }
    : create_and_attach_s3_access_point_response)

let make_create_and_attach_s3_access_point_s3_configuration
    ?vpc_configuration:(vpc_configuration_ : s3_access_point_vpc_configuration option)
    ?policy:(policy_ : access_point_policy option) () =
  ({ vpc_configuration = vpc_configuration_; policy = policy_ }
    : create_and_attach_s3_access_point_s3_configuration)

let make_create_and_attach_s3_access_point_ontap_configuration ~volume_id:(volume_id_ : volume_id)
    ~file_system_identity:(file_system_identity_ : ontap_file_system_identity) () =
  ({ volume_id = volume_id_; file_system_identity = file_system_identity_ }
    : create_and_attach_s3_access_point_ontap_configuration)

let make_create_and_attach_s3_access_point_open_zfs_configuration
    ~volume_id:(volume_id_ : volume_id)
    ~file_system_identity:(file_system_identity_ : open_zfs_file_system_identity) () =
  ({ volume_id = volume_id_; file_system_identity = file_system_identity_ }
    : create_and_attach_s3_access_point_open_zfs_configuration)

let make_create_and_attach_s3_access_point_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?open_zfs_configuration:
      (open_zfs_configuration_ : create_and_attach_s3_access_point_open_zfs_configuration option)
    ?ontap_configuration:
      (ontap_configuration_ : create_and_attach_s3_access_point_ontap_configuration option)
    ?s3_access_point:(s3_access_point_ : create_and_attach_s3_access_point_s3_configuration option)
    ~name:(name_ : s3_access_point_attachment_name)
    ~type_:(type__ : s3_access_point_attachment_type) () =
  ({
     client_request_token = client_request_token_;
     name = name_;
     type_ = type__;
     open_zfs_configuration = open_zfs_configuration_;
     ontap_configuration = ontap_configuration_;
     s3_access_point = s3_access_point_;
   }
    : create_and_attach_s3_access_point_request)

let make_copy_snapshot_and_update_volume_response ?volume_id:(volume_id_ : volume_id option)
    ?lifecycle:(lifecycle_ : volume_lifecycle option)
    ?administrative_actions:(administrative_actions_ : administrative_actions option) () =
  ({
     volume_id = volume_id_;
     lifecycle = lifecycle_;
     administrative_actions = administrative_actions_;
   }
    : copy_snapshot_and_update_volume_response)

let make_copy_snapshot_and_update_volume_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?copy_strategy:(copy_strategy_ : open_zfs_copy_strategy option)
    ?options:(options_ : update_open_zfs_volume_options option) ~volume_id:(volume_id_ : volume_id)
    ~source_snapshot_ar_n:(source_snapshot_ar_n_ : resource_ar_n) () =
  ({
     client_request_token = client_request_token_;
     volume_id = volume_id_;
     source_snapshot_ar_n = source_snapshot_ar_n_;
     copy_strategy = copy_strategy_;
     options = options_;
   }
    : copy_snapshot_and_update_volume_request)

let make_copy_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : copy_backup_response)

let make_copy_backup_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?source_region:(source_region_ : region option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?copy_tags:(copy_tags_ : flag option) ?tags:(tags_ : tags option)
    ~source_backup_id:(source_backup_id_ : source_backup_id) () =
  ({
     client_request_token = client_request_token_;
     source_backup_id = source_backup_id_;
     source_region = source_region_;
     kms_key_id = kms_key_id_;
     copy_tags = copy_tags_;
     tags = tags_;
   }
    : copy_backup_request)

let make_cancel_data_repository_task_response
    ?lifecycle:(lifecycle_ : data_repository_task_lifecycle option)
    ?task_id:(task_id_ : task_id option) () =
  ({ lifecycle = lifecycle_; task_id = task_id_ } : cancel_data_repository_task_response)

let make_cancel_data_repository_task_request ~task_id:(task_id_ : task_id) () =
  ({ task_id = task_id_ } : cancel_data_repository_task_request)

let make_associate_file_system_aliases_response ?aliases:(aliases_ : aliases option) () =
  ({ aliases = aliases_ } : associate_file_system_aliases_response)

let make_associate_file_system_aliases_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~file_system_id:(file_system_id_ : file_system_id) ~aliases:(aliases_ : alternate_dns_names) ()
    =
  ({
     client_request_token = client_request_token_;
     file_system_id = file_system_id_;
     aliases = aliases_;
   }
    : associate_file_system_aliases_request)
