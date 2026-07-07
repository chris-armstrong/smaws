open Types

val make_volumei_scsi_attributes :
  ?chap_enabled:boolean2 ->
  ?lun_number:positive_int_object ->
  ?network_interface_port:integer ->
  ?network_interface_id:network_interface_id ->
  ?target_ar_n:target_ar_n ->
  unit ->
  volumei_scsi_attributes

val make_volume_recovery_point_info :
  ?volume_recovery_point_time:string_ ->
  ?volume_usage_in_bytes:long ->
  ?volume_size_in_bytes:long ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  volume_recovery_point_info

val make_volume_info :
  ?volume_attachment_status:volume_attachment_status ->
  ?volume_size_in_bytes:long ->
  ?volume_type:volume_type ->
  ?gateway_id:gateway_id ->
  ?gateway_ar_n:gateway_ar_n ->
  ?volume_id:volume_id ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  volume_info

val make_devicei_scsi_attributes :
  ?chap_enabled:boolean2 ->
  ?network_interface_port:integer ->
  ?network_interface_id:network_interface_id ->
  ?target_ar_n:target_ar_n ->
  unit ->
  devicei_scsi_attributes

val make_vtl_device :
  ?devicei_scsi_attributes:devicei_scsi_attributes ->
  ?vtl_device_product_identifier:vtl_device_product_identifier ->
  ?vtl_device_vendor:vtl_device_vendor ->
  ?vtl_device_type:vtl_device_type ->
  ?vtl_device_ar_n:vtl_device_ar_n ->
  unit ->
  vtl_device

val make_update_vtl_device_type_output :
  ?vtl_device_ar_n:vtl_device_ar_n -> unit -> update_vtl_device_type_output

val make_update_vtl_device_type_input :
  device_type:device_type -> vtl_device_ar_n:vtl_device_ar_n -> unit -> update_vtl_device_type_input

val make_storage_gateway_error :
  ?error_details:error_details -> ?error_code:error_code -> unit -> storage_gateway_error

val make_update_snapshot_schedule_output :
  ?volume_ar_n:volume_ar_n -> unit -> update_snapshot_schedule_output

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_update_snapshot_schedule_input :
  ?tags:tags ->
  ?description:description ->
  recurrence_in_hours:recurrence_in_hours ->
  start_at:hour_of_day ->
  volume_ar_n:volume_ar_n ->
  unit ->
  update_snapshot_schedule_input

val make_update_smb_security_strategy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_security_strategy_output

val make_update_smb_security_strategy_input :
  smb_security_strategy:smb_security_strategy ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_smb_security_strategy_input

val make_update_smb_local_groups_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_local_groups_output

val make_smb_local_groups : ?gateway_admins:user_list -> unit -> smb_local_groups

val make_update_smb_local_groups_input :
  smb_local_groups:smb_local_groups ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_smb_local_groups_input

val make_update_smb_file_share_visibility_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_file_share_visibility_output

val make_update_smb_file_share_visibility_input :
  file_shares_visible:boolean_ ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_smb_file_share_visibility_input

val make_update_smb_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> update_smb_file_share_output

val make_cache_attributes :
  ?cache_stale_timeout_in_seconds:cache_stale_timeout_in_seconds -> unit -> cache_attributes

val make_update_smb_file_share_input :
  ?oplocks_enabled:boolean_ ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?case_sensitivity:case_sensitivity ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?invalid_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?admin_user_list:user_list ->
  ?access_based_enumeration:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?encryption_type:encryption_type ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  update_smb_file_share_input

val make_update_nfs_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> update_nfs_file_share_output

val make_nfs_file_share_defaults :
  ?owner_id:permission_id ->
  ?group_id:permission_id ->
  ?directory_mode:permission_mode ->
  ?file_mode:permission_mode ->
  unit ->
  nfs_file_share_defaults

val make_update_nfs_file_share_input :
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?squash:squash ->
  ?client_list:file_share_client_list ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?encryption_type:encryption_type ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  update_nfs_file_share_input

val make_update_maintenance_start_time_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_maintenance_start_time_output

val make_software_update_preferences :
  ?automatic_update_policy:automatic_update_policy -> unit -> software_update_preferences

val make_update_maintenance_start_time_input :
  ?software_update_preferences:software_update_preferences ->
  ?day_of_month:day_of_month ->
  ?day_of_week:day_of_week ->
  ?minute_of_hour:minute_of_hour ->
  ?hour_of_day:hour_of_day ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_maintenance_start_time_input

val make_update_gateway_software_now_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_gateway_software_now_output

val make_update_gateway_software_now_input :
  gateway_ar_n:gateway_ar_n -> unit -> update_gateway_software_now_input

val make_update_gateway_information_output :
  ?gateway_name:string_ -> ?gateway_ar_n:gateway_ar_n -> unit -> update_gateway_information_output

val make_update_gateway_information_input :
  ?gateway_capacity:gateway_capacity ->
  ?cloud_watch_log_group_ar_n:cloud_watch_log_group_ar_n ->
  ?gateway_timezone:gateway_timezone ->
  ?gateway_name:gateway_name ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_gateway_information_input

val make_update_file_system_association_output :
  ?file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  update_file_system_association_output

val make_update_file_system_association_input :
  ?cache_attributes:cache_attributes ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?password:domain_user_password ->
  ?user_name:domain_user_name ->
  file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  update_file_system_association_input

val make_update_chap_credentials_output :
  ?initiator_name:iqn_name -> ?target_ar_n:target_ar_n -> unit -> update_chap_credentials_output

val make_update_chap_credentials_input :
  ?secret_to_authenticate_target:chap_secret ->
  initiator_name:iqn_name ->
  secret_to_authenticate_initiator:chap_secret ->
  target_ar_n:target_ar_n ->
  unit ->
  update_chap_credentials_input

val make_update_bandwidth_rate_limit_schedule_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_bandwidth_rate_limit_schedule_output

val make_bandwidth_rate_limit_interval :
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  days_of_week:days_of_week ->
  end_minute_of_hour:minute_of_hour ->
  end_hour_of_day:hour_of_day ->
  start_minute_of_hour:minute_of_hour ->
  start_hour_of_day:hour_of_day ->
  unit ->
  bandwidth_rate_limit_interval

val make_update_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_bandwidth_rate_limit_schedule_input

val make_update_bandwidth_rate_limit_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_bandwidth_rate_limit_output

val make_update_bandwidth_rate_limit_input :
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_bandwidth_rate_limit_input

val make_update_automatic_tape_creation_policy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_automatic_tape_creation_policy_output

val make_automatic_tape_creation_rule :
  ?worm:boolean2 ->
  minimum_num_tapes:minimum_num_tapes ->
  tape_size_in_bytes:tape_size ->
  pool_id:pool_id ->
  tape_barcode_prefix:tape_barcode_prefix ->
  unit ->
  automatic_tape_creation_rule

val make_update_automatic_tape_creation_policy_input :
  gateway_ar_n:gateway_ar_n ->
  automatic_tape_creation_rules:automatic_tape_creation_rules ->
  unit ->
  update_automatic_tape_creation_policy_input

val make_tape :
  ?pool_entry_date:time ->
  ?retention_start_date:time ->
  ?worm:boolean2 ->
  ?pool_id:pool_id ->
  ?kms_key:kms_key ->
  ?tape_used_in_bytes:tape_usage ->
  ?progress:double_object ->
  ?vtl_device:vtl_device_ar_n ->
  ?tape_status:tape_status ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_created_date:time ->
  ?tape_barcode:tape_barcode ->
  ?tape_ar_n:tape_ar_n ->
  unit ->
  tape

val make_tape_recovery_point_info :
  ?tape_status:tape_recovery_point_status ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_recovery_point_time:time ->
  ?tape_ar_n:tape_ar_n ->
  unit ->
  tape_recovery_point_info

val make_tape_info :
  ?pool_entry_date:time ->
  ?retention_start_date:time ->
  ?pool_id:pool_id ->
  ?gateway_ar_n:gateway_ar_n ->
  ?tape_status:tape_status ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_barcode:tape_barcode ->
  ?tape_ar_n:tape_ar_n ->
  unit ->
  tape_info

val make_tape_archive :
  ?pool_entry_date:time ->
  ?retention_start_date:time ->
  ?worm:boolean2 ->
  ?pool_id:pool_id ->
  ?kms_key:kms_key ->
  ?tape_used_in_bytes:tape_usage ->
  ?tape_status:tape_archive_status ->
  ?retrieved_to:gateway_ar_n ->
  ?completion_time:time ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_created_date:time ->
  ?tape_barcode:tape_barcode ->
  ?tape_ar_n:tape_ar_n ->
  unit ->
  tape_archive

val make_storedi_scsi_volume :
  ?target_name:target_name ->
  ?kms_key:kms_key ->
  ?volume_used_in_bytes:volume_used_in_bytes ->
  ?created_date:created_date ->
  ?volumei_scsi_attributes:volumei_scsi_attributes ->
  ?preserved_existing_data:boolean2 ->
  ?source_snapshot_id:snapshot_id ->
  ?volume_disk_id:disk_id ->
  ?volume_progress:double_object ->
  ?volume_size_in_bytes:long ->
  ?volume_attachment_status:volume_attachment_status ->
  ?volume_status:volume_status ->
  ?volume_type:volume_type ->
  ?volume_id:volume_id ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  storedi_scsi_volume

val make_start_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> start_gateway_output
val make_start_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> start_gateway_input

val make_start_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> start_cache_report_output

val make_cache_report_filter :
  values:cache_report_filter_values -> name:cache_report_filter_name -> unit -> cache_report_filter

val make_start_cache_report_input :
  ?tags:tags ->
  ?exclusion_filters:cache_report_filter_list ->
  ?inclusion_filters:cache_report_filter_list ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  client_token:client_token ->
  bucket_region:region_id ->
  location_ar_n:location_ar_n ->
  role:role ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  start_cache_report_input

val make_start_availability_monitor_test_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> start_availability_monitor_test_output

val make_start_availability_monitor_test_input :
  gateway_ar_n:gateway_ar_n -> unit -> start_availability_monitor_test_input

val make_shutdown_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> shutdown_gateway_output
val make_shutdown_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> shutdown_gateway_input

val make_set_smb_guest_password_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> set_smb_guest_password_output

val make_set_smb_guest_password_input :
  password:smb_guest_password -> gateway_ar_n:gateway_ar_n -> unit -> set_smb_guest_password_input

val make_set_local_console_password_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> set_local_console_password_output

val make_set_local_console_password_input :
  local_console_password:local_console_password ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  set_local_console_password_input

val make_retrieve_tape_recovery_point_output :
  ?tape_ar_n:tape_ar_n -> unit -> retrieve_tape_recovery_point_output

val make_retrieve_tape_recovery_point_input :
  gateway_ar_n:gateway_ar_n -> tape_ar_n:tape_ar_n -> unit -> retrieve_tape_recovery_point_input

val make_retrieve_tape_archive_output : ?tape_ar_n:tape_ar_n -> unit -> retrieve_tape_archive_output

val make_retrieve_tape_archive_input :
  gateway_ar_n:gateway_ar_n -> tape_ar_n:tape_ar_n -> unit -> retrieve_tape_archive_input

val make_reset_cache_output : ?gateway_ar_n:gateway_ar_n -> unit -> reset_cache_output
val make_reset_cache_input : gateway_ar_n:gateway_ar_n -> unit -> reset_cache_input

val make_remove_tags_from_resource_output :
  ?resource_ar_n:resource_ar_n -> unit -> remove_tags_from_resource_output

val make_remove_tags_from_resource_input :
  tag_keys:tag_keys -> resource_ar_n:resource_ar_n -> unit -> remove_tags_from_resource_input

val make_refresh_cache_output :
  ?notification_id:notification_id ->
  ?file_share_ar_n:file_share_ar_n ->
  unit ->
  refresh_cache_output

val make_refresh_cache_input :
  ?recursive:boolean_ ->
  ?folder_list:folder_list ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  refresh_cache_input

val make_notify_when_uploaded_output :
  ?notification_id:notification_id ->
  ?file_share_ar_n:file_share_ar_n ->
  unit ->
  notify_when_uploaded_output

val make_notify_when_uploaded_input :
  file_share_ar_n:file_share_ar_n -> unit -> notify_when_uploaded_input

val make_list_volumes_output :
  ?volume_infos:volume_infos ->
  ?marker:marker ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  list_volumes_output

val make_list_volumes_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  list_volumes_input

val make_list_volume_recovery_points_output :
  ?volume_recovery_point_infos:volume_recovery_point_infos ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  list_volume_recovery_points_output

val make_list_volume_recovery_points_input :
  gateway_ar_n:gateway_ar_n -> unit -> list_volume_recovery_points_input

val make_list_volume_initiators_output :
  ?initiators:initiators -> unit -> list_volume_initiators_output

val make_list_volume_initiators_input :
  volume_ar_n:volume_ar_n -> unit -> list_volume_initiators_input

val make_list_tapes_output : ?marker:marker -> ?tape_infos:tape_infos -> unit -> list_tapes_output

val make_list_tapes_input :
  ?limit:positive_int_object -> ?marker:marker -> ?tape_ar_ns:tape_ar_ns -> unit -> list_tapes_input

val make_pool_info :
  ?pool_status:pool_status ->
  ?retention_lock_time_in_days:retention_lock_time_in_days ->
  ?retention_lock_type:retention_lock_type ->
  ?storage_class:tape_storage_class ->
  ?pool_name:pool_name ->
  ?pool_ar_n:pool_ar_n ->
  unit ->
  pool_info

val make_list_tape_pools_output :
  ?marker:marker -> ?pool_infos:pool_infos -> unit -> list_tape_pools_output

val make_list_tape_pools_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  ?pool_ar_ns:pool_ar_ns ->
  unit ->
  list_tape_pools_input

val make_list_tags_for_resource_output :
  ?tags:tags ->
  ?marker:marker ->
  ?resource_ar_n:resource_ar_n ->
  unit ->
  list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  resource_ar_n:resource_ar_n ->
  unit ->
  list_tags_for_resource_input

val make_disk :
  ?disk_attribute_list:disk_attribute_list ->
  ?disk_allocation_resource:string_ ->
  ?disk_allocation_type:disk_allocation_type ->
  ?disk_size_in_bytes:long ->
  ?disk_status:string_ ->
  ?disk_node:string_ ->
  ?disk_path:string_ ->
  ?disk_id:disk_id ->
  unit ->
  disk

val make_list_local_disks_output :
  ?disks:disks -> ?gateway_ar_n:gateway_ar_n -> unit -> list_local_disks_output

val make_list_local_disks_input : gateway_ar_n:gateway_ar_n -> unit -> list_local_disks_input

val make_gateway_info :
  ?software_version:software_version ->
  ?deprecation_date:deprecation_date ->
  ?host_environment_id:host_environment_id ->
  ?host_environment:host_environment ->
  ?ec2_instance_region:ec2_instance_region ->
  ?ec2_instance_id:ec2_instance_id ->
  ?gateway_name:string_ ->
  ?gateway_operational_state:gateway_operational_state ->
  ?gateway_type:gateway_type ->
  ?gateway_ar_n:gateway_ar_n ->
  ?gateway_id:gateway_id ->
  unit ->
  gateway_info

val make_list_gateways_output : ?marker:marker -> ?gateways:gateways -> unit -> list_gateways_output

val make_list_gateways_input :
  ?limit:positive_int_object -> ?marker:marker -> unit -> list_gateways_input

val make_file_system_association_summary :
  ?gateway_ar_n:gateway_ar_n ->
  ?file_system_association_status:file_system_association_status ->
  ?file_system_association_ar_n:file_system_association_ar_n ->
  ?file_system_association_id:file_system_association_id ->
  unit ->
  file_system_association_summary

val make_list_file_system_associations_output :
  ?file_system_association_summary_list:file_system_association_summary_list ->
  ?next_marker:marker ->
  ?marker:marker ->
  unit ->
  list_file_system_associations_output

val make_list_file_system_associations_input :
  ?marker:marker ->
  ?limit:positive_int_object ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  list_file_system_associations_input

val make_file_share_info :
  ?gateway_ar_n:gateway_ar_n ->
  ?file_share_status:file_share_status ->
  ?file_share_id:file_share_id ->
  ?file_share_ar_n:file_share_ar_n ->
  ?file_share_type:file_share_type ->
  unit ->
  file_share_info

val make_list_file_shares_output :
  ?file_share_info_list:file_share_info_list ->
  ?next_marker:marker ->
  ?marker:marker ->
  unit ->
  list_file_shares_output

val make_list_file_shares_input :
  ?marker:marker ->
  ?limit:positive_int_object ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  list_file_shares_input

val make_cache_report_info :
  ?tags:tags ->
  ?report_name:cache_report_name ->
  ?exclusion_filters:cache_report_filter_list ->
  ?inclusion_filters:cache_report_filter_list ->
  ?start_time:time ->
  ?location_ar_n:location_ar_n ->
  ?file_share_ar_n:file_share_ar_n ->
  ?role:role ->
  ?end_time:time ->
  ?report_completion_percent:report_completion_percent ->
  ?cache_report_status:cache_report_status ->
  ?cache_report_ar_n:cache_report_ar_n ->
  unit ->
  cache_report_info

val make_list_cache_reports_output :
  ?marker:marker -> ?cache_report_list:cache_report_list -> unit -> list_cache_reports_output

val make_list_cache_reports_input : ?marker:marker -> unit -> list_cache_reports_input

val make_automatic_tape_creation_policy_info :
  ?gateway_ar_n:gateway_ar_n ->
  ?automatic_tape_creation_rules:automatic_tape_creation_rules ->
  unit ->
  automatic_tape_creation_policy_info

val make_list_automatic_tape_creation_policies_output :
  ?automatic_tape_creation_policy_infos:automatic_tape_creation_policy_infos ->
  unit ->
  list_automatic_tape_creation_policies_output

val make_list_automatic_tape_creation_policies_input :
  ?gateway_ar_n:gateway_ar_n -> unit -> list_automatic_tape_creation_policies_input

val make_join_domain_output :
  ?active_directory_status:active_directory_status ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  join_domain_output

val make_join_domain_input :
  ?timeout_in_seconds:timeout_in_seconds ->
  ?domain_controllers:hosts ->
  ?organizational_unit:organizational_unit ->
  password:domain_user_password ->
  user_name:domain_user_name ->
  domain_name:domain_name ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  join_domain_input

val make_evict_files_failing_upload_output :
  ?notification_id:string_ -> unit -> evict_files_failing_upload_output

val make_evict_files_failing_upload_input :
  ?force_remove:boolean2 ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  evict_files_failing_upload_input

val make_disassociate_file_system_output :
  ?file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  disassociate_file_system_output

val make_disassociate_file_system_input :
  ?force_delete:boolean2 ->
  file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  disassociate_file_system_input

val make_disable_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> disable_gateway_output
val make_disable_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> disable_gateway_input
val make_detach_volume_output : ?volume_ar_n:volume_ar_n -> unit -> detach_volume_output

val make_detach_volume_input :
  ?force_detach:boolean_ -> volume_ar_n:volume_ar_n -> unit -> detach_volume_input

val make_describe_working_storage_output :
  ?working_storage_allocated_in_bytes:long ->
  ?working_storage_used_in_bytes:long ->
  ?disk_ids:disk_ids ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_working_storage_output

val make_describe_working_storage_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_working_storage_input

val make_describe_vtl_devices_output :
  ?marker:marker ->
  ?vtl_devices:vtl_devices ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_vtl_devices_output

val make_describe_vtl_devices_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  ?vtl_device_ar_ns:vtl_device_ar_ns ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_vtl_devices_input

val make_describe_upload_buffer_output :
  ?upload_buffer_allocated_in_bytes:long ->
  ?upload_buffer_used_in_bytes:long ->
  ?disk_ids:disk_ids ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_upload_buffer_output

val make_describe_upload_buffer_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_upload_buffer_input

val make_describe_tapes_output : ?marker:marker -> ?tapes:tapes -> unit -> describe_tapes_output

val make_describe_tapes_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  ?tape_ar_ns:tape_ar_ns ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_tapes_input

val make_describe_tape_recovery_points_output :
  ?marker:marker ->
  ?tape_recovery_point_infos:tape_recovery_point_infos ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_tape_recovery_points_output

val make_describe_tape_recovery_points_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_tape_recovery_points_input

val make_describe_tape_archives_output :
  ?marker:marker -> ?tape_archives:tape_archives -> unit -> describe_tape_archives_output

val make_describe_tape_archives_input :
  ?limit:positive_int_object ->
  ?marker:marker ->
  ?tape_ar_ns:tape_ar_ns ->
  unit ->
  describe_tape_archives_input

val make_describe_storedi_scsi_volumes_output :
  ?storedi_scsi_volumes:storedi_scsi_volumes -> unit -> describe_storedi_scsi_volumes_output

val make_describe_storedi_scsi_volumes_input :
  volume_ar_ns:volume_ar_ns -> unit -> describe_storedi_scsi_volumes_input

val make_describe_snapshot_schedule_output :
  ?tags:tags ->
  ?timezone:gateway_timezone ->
  ?description:description ->
  ?recurrence_in_hours:recurrence_in_hours ->
  ?start_at:hour_of_day ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  describe_snapshot_schedule_output

val make_describe_snapshot_schedule_input :
  volume_ar_n:volume_ar_n -> unit -> describe_snapshot_schedule_input

val make_describe_smb_settings_output :
  ?smb_local_groups:smb_local_groups ->
  ?file_shares_visible:boolean_ ->
  ?smb_security_strategy:smb_security_strategy ->
  ?smb_guest_password_set:boolean_ ->
  ?active_directory_status:active_directory_status ->
  ?domain_name:domain_name ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_smb_settings_output

val make_describe_smb_settings_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_smb_settings_input

val make_smb_file_share_info :
  ?oplocks_enabled:boolean_ ->
  ?bucket_region:region_id ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?tags:tags ->
  ?case_sensitivity:case_sensitivity ->
  ?authentication:authentication ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?invalid_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?admin_user_list:user_list ->
  ?access_based_enumeration:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?location_ar_n:location_ar_n ->
  ?role:role ->
  ?path:path ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean2 ->
  ?encryption_type:encryption_type ->
  ?gateway_ar_n:gateway_ar_n ->
  ?file_share_status:file_share_status ->
  ?file_share_id:file_share_id ->
  ?file_share_ar_n:file_share_ar_n ->
  unit ->
  smb_file_share_info

val make_describe_smb_file_shares_output :
  ?smb_file_share_info_list:smb_file_share_info_list -> unit -> describe_smb_file_shares_output

val make_describe_smb_file_shares_input :
  file_share_arn_list:file_share_arn_list -> unit -> describe_smb_file_shares_input

val make_nfs_file_share_info :
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?bucket_region:region_id ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?tags:tags ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?squash:squash ->
  ?client_list:file_share_client_list ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?location_ar_n:location_ar_n ->
  ?role:role ->
  ?path:path ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean2 ->
  ?encryption_type:encryption_type ->
  ?gateway_ar_n:gateway_ar_n ->
  ?file_share_status:file_share_status ->
  ?file_share_id:file_share_id ->
  ?file_share_ar_n:file_share_ar_n ->
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  unit ->
  nfs_file_share_info

val make_describe_nfs_file_shares_output :
  ?nfs_file_share_info_list:nfs_file_share_info_list -> unit -> describe_nfs_file_shares_output

val make_describe_nfs_file_shares_input :
  file_share_arn_list:file_share_arn_list -> unit -> describe_nfs_file_shares_input

val make_describe_maintenance_start_time_output :
  ?software_update_preferences:software_update_preferences ->
  ?timezone:gateway_timezone ->
  ?day_of_month:day_of_month ->
  ?day_of_week:day_of_week ->
  ?minute_of_hour:minute_of_hour ->
  ?hour_of_day:hour_of_day ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_maintenance_start_time_output

val make_describe_maintenance_start_time_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_maintenance_start_time_input

val make_network_interface :
  ?ipv6_address:string_ ->
  ?mac_address:string_ ->
  ?ipv4_address:string_ ->
  unit ->
  network_interface

val make_describe_gateway_information_output :
  ?software_version:software_version ->
  ?host_environment_id:host_environment_id ->
  ?supported_gateway_capacities:supported_gateway_capacities ->
  ?gateway_capacity:gateway_capacity ->
  ?deprecation_date:deprecation_date ->
  ?software_updates_end_date:software_updates_end_date ->
  ?endpoint_type:endpoint_type ->
  ?host_environment:host_environment ->
  ?cloud_watch_log_group_ar_n:cloud_watch_log_group_ar_n ->
  ?vpc_endpoint:string_ ->
  ?tags:tags ->
  ?ec2_instance_region:ec2_instance_region ->
  ?ec2_instance_id:ec2_instance_id ->
  ?last_software_update:last_software_update ->
  ?next_update_availability_date:next_update_availability_date ->
  ?gateway_type:gateway_type ->
  ?gateway_network_interfaces:gateway_network_interfaces ->
  ?gateway_state:gateway_state ->
  ?gateway_timezone:gateway_timezone ->
  ?gateway_name:string_ ->
  ?gateway_id:gateway_id ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_gateway_information_output

val make_describe_gateway_information_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_gateway_information_input

val make_endpoint_network_configuration :
  ?ip_addresses:ip_address_list -> unit -> endpoint_network_configuration

val make_file_system_association_status_detail :
  ?error_code:file_system_association_sync_error_code ->
  unit ->
  file_system_association_status_detail

val make_file_system_association_info :
  ?file_system_association_status_details:file_system_association_status_details ->
  ?endpoint_network_configuration:endpoint_network_configuration ->
  ?cache_attributes:cache_attributes ->
  ?tags:tags ->
  ?gateway_ar_n:gateway_ar_n ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?file_system_association_status:file_system_association_status ->
  ?location_ar_n:file_system_location_ar_n ->
  ?file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  file_system_association_info

val make_describe_file_system_associations_output :
  ?file_system_association_info_list:file_system_association_info_list ->
  unit ->
  describe_file_system_associations_output

val make_describe_file_system_associations_input :
  file_system_association_arn_list:file_system_association_arn_list ->
  unit ->
  describe_file_system_associations_input

val make_chap_info :
  ?secret_to_authenticate_target:chap_secret ->
  ?initiator_name:iqn_name ->
  ?secret_to_authenticate_initiator:chap_secret ->
  ?target_ar_n:target_ar_n ->
  unit ->
  chap_info

val make_describe_chap_credentials_output :
  ?chap_credentials:chap_credentials -> unit -> describe_chap_credentials_output

val make_describe_chap_credentials_input :
  target_ar_n:target_ar_n -> unit -> describe_chap_credentials_input

val make_describe_cache_report_output :
  ?cache_report_info:cache_report_info -> unit -> describe_cache_report_output

val make_describe_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> describe_cache_report_input

val make_cachedi_scsi_volume :
  ?target_name:target_name ->
  ?kms_key:kms_key ->
  ?volume_used_in_bytes:volume_used_in_bytes ->
  ?created_date:created_date ->
  ?volumei_scsi_attributes:volumei_scsi_attributes ->
  ?source_snapshot_id:snapshot_id ->
  ?volume_progress:double_object ->
  ?volume_size_in_bytes:long ->
  ?volume_attachment_status:volume_attachment_status ->
  ?volume_status:volume_status ->
  ?volume_type:volume_type ->
  ?volume_id:volume_id ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  cachedi_scsi_volume

val make_describe_cachedi_scsi_volumes_output :
  ?cachedi_scsi_volumes:cachedi_scsi_volumes -> unit -> describe_cachedi_scsi_volumes_output

val make_describe_cachedi_scsi_volumes_input :
  volume_ar_ns:volume_ar_ns -> unit -> describe_cachedi_scsi_volumes_input

val make_describe_cache_output :
  ?cache_miss_percentage:double ->
  ?cache_hit_percentage:double ->
  ?cache_dirty_percentage:double ->
  ?cache_used_percentage:double ->
  ?cache_allocated_in_bytes:long ->
  ?disk_ids:disk_ids ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_cache_output

val make_describe_cache_input : gateway_ar_n:gateway_ar_n -> unit -> describe_cache_input

val make_describe_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_bandwidth_rate_limit_schedule_output

val make_describe_bandwidth_rate_limit_schedule_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_bandwidth_rate_limit_schedule_input

val make_describe_bandwidth_rate_limit_output :
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_bandwidth_rate_limit_output

val make_describe_bandwidth_rate_limit_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_bandwidth_rate_limit_input

val make_describe_availability_monitor_test_output :
  ?start_time:time ->
  ?status:availability_monitor_test_status ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_availability_monitor_test_output

val make_describe_availability_monitor_test_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_availability_monitor_test_input

val make_delete_volume_output : ?volume_ar_n:volume_ar_n -> unit -> delete_volume_output
val make_delete_volume_input : volume_ar_n:volume_ar_n -> unit -> delete_volume_input
val make_delete_tape_pool_output : ?pool_ar_n:pool_ar_n -> unit -> delete_tape_pool_output
val make_delete_tape_pool_input : pool_ar_n:pool_ar_n -> unit -> delete_tape_pool_input
val make_delete_tape_archive_output : ?tape_ar_n:tape_ar_n -> unit -> delete_tape_archive_output

val make_delete_tape_archive_input :
  ?bypass_governance_retention:boolean2 -> tape_ar_n:tape_ar_n -> unit -> delete_tape_archive_input

val make_delete_tape_output : ?tape_ar_n:tape_ar_n -> unit -> delete_tape_output

val make_delete_tape_input :
  ?bypass_governance_retention:boolean2 ->
  tape_ar_n:tape_ar_n ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  delete_tape_input

val make_delete_snapshot_schedule_output :
  ?volume_ar_n:volume_ar_n -> unit -> delete_snapshot_schedule_output

val make_delete_snapshot_schedule_input :
  volume_ar_n:volume_ar_n -> unit -> delete_snapshot_schedule_input

val make_delete_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> delete_gateway_output
val make_delete_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> delete_gateway_input

val make_delete_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> delete_file_share_output

val make_delete_file_share_input :
  ?force_delete:boolean2 -> file_share_ar_n:file_share_ar_n -> unit -> delete_file_share_input

val make_delete_chap_credentials_output :
  ?initiator_name:iqn_name -> ?target_ar_n:target_ar_n -> unit -> delete_chap_credentials_output

val make_delete_chap_credentials_input :
  initiator_name:iqn_name -> target_ar_n:target_ar_n -> unit -> delete_chap_credentials_input

val make_delete_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> delete_cache_report_output

val make_delete_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> delete_cache_report_input

val make_delete_bandwidth_rate_limit_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> delete_bandwidth_rate_limit_output

val make_delete_bandwidth_rate_limit_input :
  bandwidth_type:bandwidth_type ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  delete_bandwidth_rate_limit_input

val make_delete_automatic_tape_creation_policy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> delete_automatic_tape_creation_policy_output

val make_delete_automatic_tape_creation_policy_input :
  gateway_ar_n:gateway_ar_n -> unit -> delete_automatic_tape_creation_policy_input

val make_create_tape_with_barcode_output :
  ?tape_ar_n:tape_ar_n -> unit -> create_tape_with_barcode_output

val make_create_tape_with_barcode_input :
  ?tags:tags ->
  ?worm:boolean2 ->
  ?pool_id:pool_id ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  tape_barcode:tape_barcode ->
  tape_size_in_bytes:tape_size ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  create_tape_with_barcode_input

val make_create_tapes_output : ?tape_ar_ns:tape_ar_ns -> unit -> create_tapes_output

val make_create_tapes_input :
  ?tags:tags ->
  ?worm:boolean2 ->
  ?pool_id:pool_id ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  tape_barcode_prefix:tape_barcode_prefix ->
  num_tapes_to_create:num_tapes_to_create ->
  client_token:client_token ->
  tape_size_in_bytes:tape_size ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  create_tapes_input

val make_create_tape_pool_output : ?pool_ar_n:pool_ar_n -> unit -> create_tape_pool_output

val make_create_tape_pool_input :
  ?tags:tags ->
  ?retention_lock_time_in_days:retention_lock_time_in_days ->
  ?retention_lock_type:retention_lock_type ->
  storage_class:tape_storage_class ->
  pool_name:pool_name ->
  unit ->
  create_tape_pool_input

val make_create_storedi_scsi_volume_output :
  ?target_ar_n:target_ar_n ->
  ?volume_size_in_bytes:long ->
  ?volume_ar_n:volume_ar_n ->
  unit ->
  create_storedi_scsi_volume_output

val make_create_storedi_scsi_volume_input :
  ?tags:tags ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?snapshot_id:snapshot_id ->
  network_interface_id:network_interface_id ->
  target_name:target_name ->
  preserve_existing_data:boolean2 ->
  disk_id:disk_id ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  create_storedi_scsi_volume_input

val make_create_snapshot_from_volume_recovery_point_output :
  ?volume_recovery_point_time:string_ ->
  ?volume_ar_n:volume_ar_n ->
  ?snapshot_id:snapshot_id ->
  unit ->
  create_snapshot_from_volume_recovery_point_output

val make_create_snapshot_from_volume_recovery_point_input :
  ?tags:tags ->
  snapshot_description:snapshot_description ->
  volume_ar_n:volume_ar_n ->
  unit ->
  create_snapshot_from_volume_recovery_point_input

val make_create_snapshot_output :
  ?snapshot_id:snapshot_id -> ?volume_ar_n:volume_ar_n -> unit -> create_snapshot_output

val make_create_snapshot_input :
  ?tags:tags ->
  snapshot_description:snapshot_description ->
  volume_ar_n:volume_ar_n ->
  unit ->
  create_snapshot_input

val make_create_smb_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> create_smb_file_share_output

val make_create_smb_file_share_input :
  ?oplocks_enabled:boolean_ ->
  ?bucket_region:region_id ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?tags:tags ->
  ?case_sensitivity:case_sensitivity ->
  ?authentication:authentication ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?invalid_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?admin_user_list:user_list ->
  ?access_based_enumeration:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?encryption_type:encryption_type ->
  location_ar_n:location_ar_n ->
  role:role ->
  gateway_ar_n:gateway_ar_n ->
  client_token:client_token ->
  unit ->
  create_smb_file_share_input

val make_create_nfs_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> create_nfs_file_share_output

val make_create_nfs_file_share_input :
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?bucket_region:region_id ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?notification_policy:notification_policy ->
  ?cache_attributes:cache_attributes ->
  ?file_share_name:file_share_name ->
  ?tags:tags ->
  ?requester_pays:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?read_only:boolean_ ->
  ?squash:squash ->
  ?client_list:file_share_client_list ->
  ?object_ac_l:object_ac_l ->
  ?default_storage_class:storage_class ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?encryption_type:encryption_type ->
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  location_ar_n:location_ar_n ->
  role:role ->
  gateway_ar_n:gateway_ar_n ->
  client_token:client_token ->
  unit ->
  create_nfs_file_share_input

val make_create_cachedi_scsi_volume_output :
  ?target_ar_n:target_ar_n -> ?volume_ar_n:volume_ar_n -> unit -> create_cachedi_scsi_volume_output

val make_create_cachedi_scsi_volume_input :
  ?tags:tags ->
  ?kms_key:kms_key ->
  ?kms_encrypted:boolean_ ->
  ?source_volume_ar_n:volume_ar_n ->
  ?snapshot_id:snapshot_id ->
  client_token:client_token ->
  network_interface_id:network_interface_id ->
  target_name:target_name ->
  volume_size_in_bytes:long ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  create_cachedi_scsi_volume_input

val make_cancel_retrieval_output : ?tape_ar_n:tape_ar_n -> unit -> cancel_retrieval_output

val make_cancel_retrieval_input :
  tape_ar_n:tape_ar_n -> gateway_ar_n:gateway_ar_n -> unit -> cancel_retrieval_input

val make_cancel_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> cancel_cache_report_output

val make_cancel_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> cancel_cache_report_input

val make_cancel_archival_output : ?tape_ar_n:tape_ar_n -> unit -> cancel_archival_output

val make_cancel_archival_input :
  tape_ar_n:tape_ar_n -> gateway_ar_n:gateway_ar_n -> unit -> cancel_archival_input

val make_attach_volume_output :
  ?target_ar_n:target_ar_n -> ?volume_ar_n:volume_ar_n -> unit -> attach_volume_output

val make_attach_volume_input :
  ?disk_id:disk_id ->
  ?target_name:target_name ->
  network_interface_id:network_interface_id ->
  volume_ar_n:volume_ar_n ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  attach_volume_input

val make_associate_file_system_output :
  ?file_system_association_ar_n:file_system_association_ar_n -> unit -> associate_file_system_output

val make_associate_file_system_input :
  ?endpoint_network_configuration:endpoint_network_configuration ->
  ?cache_attributes:cache_attributes ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?tags:tags ->
  location_ar_n:file_system_location_ar_n ->
  gateway_ar_n:gateway_ar_n ->
  client_token:client_token ->
  password:domain_user_password ->
  user_name:domain_user_name ->
  unit ->
  associate_file_system_input

val make_assign_tape_pool_output : ?tape_ar_n:tape_ar_n -> unit -> assign_tape_pool_output

val make_assign_tape_pool_input :
  ?bypass_governance_retention:boolean2 ->
  pool_id:pool_id ->
  tape_ar_n:tape_ar_n ->
  unit ->
  assign_tape_pool_input

val make_add_working_storage_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> add_working_storage_output

val make_add_working_storage_input :
  disk_ids:disk_ids -> gateway_ar_n:gateway_ar_n -> unit -> add_working_storage_input

val make_add_upload_buffer_output : ?gateway_ar_n:gateway_ar_n -> unit -> add_upload_buffer_output

val make_add_upload_buffer_input :
  disk_ids:disk_ids -> gateway_ar_n:gateway_ar_n -> unit -> add_upload_buffer_input

val make_add_tags_to_resource_output :
  ?resource_ar_n:resource_ar_n -> unit -> add_tags_to_resource_output

val make_add_tags_to_resource_input :
  tags:tags -> resource_ar_n:resource_ar_n -> unit -> add_tags_to_resource_input

val make_add_cache_output : ?gateway_ar_n:gateway_ar_n -> unit -> add_cache_output
val make_add_cache_input : disk_ids:disk_ids -> gateway_ar_n:gateway_ar_n -> unit -> add_cache_input
val make_activate_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> activate_gateway_output

val make_activate_gateway_input :
  ?tags:tags ->
  ?medium_changer_type:medium_changer_type ->
  ?tape_drive_type:tape_drive_type ->
  ?gateway_type:gateway_type ->
  gateway_region:region_id ->
  gateway_timezone:gateway_timezone ->
  gateway_name:gateway_name ->
  activation_key:activation_key ->
  unit ->
  activate_gateway_input
