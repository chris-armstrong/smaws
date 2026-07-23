open Types

val make_storage_gateway_error :
  ?error_code:error_code -> ?error_details:error_details -> unit -> storage_gateway_error

val make_activate_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> activate_gateway_output
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_activate_gateway_input :
  ?gateway_type:gateway_type ->
  ?tape_drive_type:tape_drive_type ->
  ?medium_changer_type:medium_changer_type ->
  ?tags:tags ->
  activation_key:activation_key ->
  gateway_name:gateway_name ->
  gateway_timezone:gateway_timezone ->
  gateway_region:region_id ->
  unit ->
  activate_gateway_input

val make_add_cache_output : ?gateway_ar_n:gateway_ar_n -> unit -> add_cache_output
val make_add_cache_input : gateway_ar_n:gateway_ar_n -> disk_ids:disk_ids -> unit -> add_cache_input

val make_add_tags_to_resource_output :
  ?resource_ar_n:resource_ar_n -> unit -> add_tags_to_resource_output

val make_add_tags_to_resource_input :
  resource_ar_n:resource_ar_n -> tags:tags -> unit -> add_tags_to_resource_input

val make_add_upload_buffer_output : ?gateway_ar_n:gateway_ar_n -> unit -> add_upload_buffer_output

val make_add_upload_buffer_input :
  gateway_ar_n:gateway_ar_n -> disk_ids:disk_ids -> unit -> add_upload_buffer_input

val make_add_working_storage_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> add_working_storage_output

val make_add_working_storage_input :
  gateway_ar_n:gateway_ar_n -> disk_ids:disk_ids -> unit -> add_working_storage_input

val make_assign_tape_pool_output : ?tape_ar_n:tape_ar_n -> unit -> assign_tape_pool_output

val make_assign_tape_pool_input :
  ?bypass_governance_retention:boolean2 ->
  tape_ar_n:tape_ar_n ->
  pool_id:pool_id ->
  unit ->
  assign_tape_pool_input

val make_associate_file_system_output :
  ?file_system_association_ar_n:file_system_association_ar_n -> unit -> associate_file_system_output

val make_endpoint_network_configuration :
  ?ip_addresses:ip_address_list -> unit -> endpoint_network_configuration

val make_cache_attributes :
  ?cache_stale_timeout_in_seconds:cache_stale_timeout_in_seconds -> unit -> cache_attributes

val make_associate_file_system_input :
  ?tags:tags ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?cache_attributes:cache_attributes ->
  ?endpoint_network_configuration:endpoint_network_configuration ->
  user_name:domain_user_name ->
  password:domain_user_password ->
  client_token:client_token ->
  gateway_ar_n:gateway_ar_n ->
  location_ar_n:file_system_location_ar_n ->
  unit ->
  associate_file_system_input

val make_attach_volume_output :
  ?volume_ar_n:volume_ar_n -> ?target_ar_n:target_ar_n -> unit -> attach_volume_output

val make_attach_volume_input :
  ?target_name:target_name ->
  ?disk_id:disk_id ->
  gateway_ar_n:gateway_ar_n ->
  volume_ar_n:volume_ar_n ->
  network_interface_id:network_interface_id ->
  unit ->
  attach_volume_input

val make_automatic_tape_creation_rule :
  ?worm:boolean2 ->
  tape_barcode_prefix:tape_barcode_prefix ->
  pool_id:pool_id ->
  tape_size_in_bytes:tape_size ->
  minimum_num_tapes:minimum_num_tapes ->
  unit ->
  automatic_tape_creation_rule

val make_automatic_tape_creation_policy_info :
  ?automatic_tape_creation_rules:automatic_tape_creation_rules ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  automatic_tape_creation_policy_info

val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  start_hour_of_day:hour_of_day ->
  start_minute_of_hour:minute_of_hour ->
  end_hour_of_day:hour_of_day ->
  end_minute_of_hour:minute_of_hour ->
  days_of_week:days_of_week ->
  unit ->
  bandwidth_rate_limit_interval

val make_cache_report_filter :
  name:cache_report_filter_name -> values:cache_report_filter_values -> unit -> cache_report_filter

val make_cache_report_info :
  ?cache_report_ar_n:cache_report_ar_n ->
  ?cache_report_status:cache_report_status ->
  ?report_completion_percent:report_completion_percent ->
  ?end_time:time ->
  ?role:role ->
  ?file_share_ar_n:file_share_ar_n ->
  ?location_ar_n:location_ar_n ->
  ?start_time:time ->
  ?inclusion_filters:cache_report_filter_list ->
  ?exclusion_filters:cache_report_filter_list ->
  ?report_name:cache_report_name ->
  ?tags:tags ->
  unit ->
  cache_report_info

val make_volumei_scsi_attributes :
  ?target_ar_n:target_ar_n ->
  ?network_interface_id:network_interface_id ->
  ?network_interface_port:integer ->
  ?lun_number:positive_int_object ->
  ?chap_enabled:boolean2 ->
  unit ->
  volumei_scsi_attributes

val make_cachedi_scsi_volume :
  ?volume_ar_n:volume_ar_n ->
  ?volume_id:volume_id ->
  ?volume_type:volume_type ->
  ?volume_status:volume_status ->
  ?volume_attachment_status:volume_attachment_status ->
  ?volume_size_in_bytes:long ->
  ?volume_progress:double_object ->
  ?source_snapshot_id:snapshot_id ->
  ?volumei_scsi_attributes:volumei_scsi_attributes ->
  ?created_date:created_date ->
  ?volume_used_in_bytes:volume_used_in_bytes ->
  ?kms_key:kms_key ->
  ?target_name:target_name ->
  unit ->
  cachedi_scsi_volume

val make_cancel_archival_output : ?tape_ar_n:tape_ar_n -> unit -> cancel_archival_output

val make_cancel_archival_input :
  gateway_ar_n:gateway_ar_n -> tape_ar_n:tape_ar_n -> unit -> cancel_archival_input

val make_cancel_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> cancel_cache_report_output

val make_cancel_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> cancel_cache_report_input

val make_cancel_retrieval_output : ?tape_ar_n:tape_ar_n -> unit -> cancel_retrieval_output

val make_cancel_retrieval_input :
  gateway_ar_n:gateway_ar_n -> tape_ar_n:tape_ar_n -> unit -> cancel_retrieval_input

val make_chap_info :
  ?target_ar_n:target_ar_n ->
  ?secret_to_authenticate_initiator:chap_secret ->
  ?initiator_name:iqn_name ->
  ?secret_to_authenticate_target:chap_secret ->
  unit ->
  chap_info

val make_create_cachedi_scsi_volume_output :
  ?volume_ar_n:volume_ar_n -> ?target_ar_n:target_ar_n -> unit -> create_cachedi_scsi_volume_output

val make_create_cachedi_scsi_volume_input :
  ?snapshot_id:snapshot_id ->
  ?source_volume_ar_n:volume_ar_n ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?tags:tags ->
  gateway_ar_n:gateway_ar_n ->
  volume_size_in_bytes:long ->
  target_name:target_name ->
  network_interface_id:network_interface_id ->
  client_token:client_token ->
  unit ->
  create_cachedi_scsi_volume_input

val make_create_nfs_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> create_nfs_file_share_output

val make_nfs_file_share_defaults :
  ?file_mode:permission_mode ->
  ?directory_mode:permission_mode ->
  ?group_id:permission_id ->
  ?owner_id:permission_id ->
  unit ->
  nfs_file_share_defaults

val make_create_nfs_file_share_input :
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?client_list:file_share_client_list ->
  ?squash:squash ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?tags:tags ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?bucket_region:region_id ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  client_token:client_token ->
  gateway_ar_n:gateway_ar_n ->
  role:role ->
  location_ar_n:location_ar_n ->
  unit ->
  create_nfs_file_share_input

val make_create_smb_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> create_smb_file_share_output

val make_create_smb_file_share_input :
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?access_based_enumeration:boolean_ ->
  ?admin_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?invalid_user_list:user_list ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?authentication:authentication ->
  ?case_sensitivity:case_sensitivity ->
  ?tags:tags ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?bucket_region:region_id ->
  ?oplocks_enabled:boolean_ ->
  client_token:client_token ->
  gateway_ar_n:gateway_ar_n ->
  role:role ->
  location_ar_n:location_ar_n ->
  unit ->
  create_smb_file_share_input

val make_create_snapshot_output :
  ?volume_ar_n:volume_ar_n -> ?snapshot_id:snapshot_id -> unit -> create_snapshot_output

val make_create_snapshot_input :
  ?tags:tags ->
  volume_ar_n:volume_ar_n ->
  snapshot_description:snapshot_description ->
  unit ->
  create_snapshot_input

val make_create_snapshot_from_volume_recovery_point_output :
  ?snapshot_id:snapshot_id ->
  ?volume_ar_n:volume_ar_n ->
  ?volume_recovery_point_time:string_ ->
  unit ->
  create_snapshot_from_volume_recovery_point_output

val make_create_snapshot_from_volume_recovery_point_input :
  ?tags:tags ->
  volume_ar_n:volume_ar_n ->
  snapshot_description:snapshot_description ->
  unit ->
  create_snapshot_from_volume_recovery_point_input

val make_create_storedi_scsi_volume_output :
  ?volume_ar_n:volume_ar_n ->
  ?volume_size_in_bytes:long ->
  ?target_ar_n:target_ar_n ->
  unit ->
  create_storedi_scsi_volume_output

val make_create_storedi_scsi_volume_input :
  ?snapshot_id:snapshot_id ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?tags:tags ->
  gateway_ar_n:gateway_ar_n ->
  disk_id:disk_id ->
  preserve_existing_data:boolean2 ->
  target_name:target_name ->
  network_interface_id:network_interface_id ->
  unit ->
  create_storedi_scsi_volume_input

val make_create_tape_pool_output : ?pool_ar_n:pool_ar_n -> unit -> create_tape_pool_output

val make_create_tape_pool_input :
  ?retention_lock_type:retention_lock_type ->
  ?retention_lock_time_in_days:retention_lock_time_in_days ->
  ?tags:tags ->
  pool_name:pool_name ->
  storage_class:tape_storage_class ->
  unit ->
  create_tape_pool_input

val make_create_tape_with_barcode_output :
  ?tape_ar_n:tape_ar_n -> unit -> create_tape_with_barcode_output

val make_create_tape_with_barcode_input :
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?pool_id:pool_id ->
  ?worm:boolean2 ->
  ?tags:tags ->
  gateway_ar_n:gateway_ar_n ->
  tape_size_in_bytes:tape_size ->
  tape_barcode:tape_barcode ->
  unit ->
  create_tape_with_barcode_input

val make_create_tapes_output : ?tape_ar_ns:tape_ar_ns -> unit -> create_tapes_output

val make_create_tapes_input :
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?pool_id:pool_id ->
  ?worm:boolean2 ->
  ?tags:tags ->
  gateway_ar_n:gateway_ar_n ->
  tape_size_in_bytes:tape_size ->
  client_token:client_token ->
  num_tapes_to_create:num_tapes_to_create ->
  tape_barcode_prefix:tape_barcode_prefix ->
  unit ->
  create_tapes_input

val make_delete_automatic_tape_creation_policy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> delete_automatic_tape_creation_policy_output

val make_delete_automatic_tape_creation_policy_input :
  gateway_ar_n:gateway_ar_n -> unit -> delete_automatic_tape_creation_policy_input

val make_delete_bandwidth_rate_limit_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> delete_bandwidth_rate_limit_output

val make_delete_bandwidth_rate_limit_input :
  gateway_ar_n:gateway_ar_n ->
  bandwidth_type:bandwidth_type ->
  unit ->
  delete_bandwidth_rate_limit_input

val make_delete_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> delete_cache_report_output

val make_delete_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> delete_cache_report_input

val make_delete_chap_credentials_output :
  ?target_ar_n:target_ar_n -> ?initiator_name:iqn_name -> unit -> delete_chap_credentials_output

val make_delete_chap_credentials_input :
  target_ar_n:target_ar_n -> initiator_name:iqn_name -> unit -> delete_chap_credentials_input

val make_delete_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> delete_file_share_output

val make_delete_file_share_input :
  ?force_delete:boolean2 -> file_share_ar_n:file_share_ar_n -> unit -> delete_file_share_input

val make_delete_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> delete_gateway_output
val make_delete_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> delete_gateway_input

val make_delete_snapshot_schedule_output :
  ?volume_ar_n:volume_ar_n -> unit -> delete_snapshot_schedule_output

val make_delete_snapshot_schedule_input :
  volume_ar_n:volume_ar_n -> unit -> delete_snapshot_schedule_input

val make_delete_tape_output : ?tape_ar_n:tape_ar_n -> unit -> delete_tape_output

val make_delete_tape_input :
  ?bypass_governance_retention:boolean2 ->
  gateway_ar_n:gateway_ar_n ->
  tape_ar_n:tape_ar_n ->
  unit ->
  delete_tape_input

val make_delete_tape_archive_output : ?tape_ar_n:tape_ar_n -> unit -> delete_tape_archive_output

val make_delete_tape_archive_input :
  ?bypass_governance_retention:boolean2 -> tape_ar_n:tape_ar_n -> unit -> delete_tape_archive_input

val make_delete_tape_pool_output : ?pool_ar_n:pool_ar_n -> unit -> delete_tape_pool_output
val make_delete_tape_pool_input : pool_ar_n:pool_ar_n -> unit -> delete_tape_pool_input
val make_delete_volume_output : ?volume_ar_n:volume_ar_n -> unit -> delete_volume_output
val make_delete_volume_input : volume_ar_n:volume_ar_n -> unit -> delete_volume_input

val make_describe_availability_monitor_test_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?status:availability_monitor_test_status ->
  ?start_time:time ->
  unit ->
  describe_availability_monitor_test_output

val make_describe_availability_monitor_test_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_availability_monitor_test_input

val make_describe_bandwidth_rate_limit_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  unit ->
  describe_bandwidth_rate_limit_output

val make_describe_bandwidth_rate_limit_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_bandwidth_rate_limit_input

val make_describe_bandwidth_rate_limit_schedule_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  unit ->
  describe_bandwidth_rate_limit_schedule_output

val make_describe_bandwidth_rate_limit_schedule_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_bandwidth_rate_limit_schedule_input

val make_describe_cache_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?disk_ids:disk_ids ->
  ?cache_allocated_in_bytes:long ->
  ?cache_used_percentage:double ->
  ?cache_dirty_percentage:double ->
  ?cache_hit_percentage:double ->
  ?cache_miss_percentage:double ->
  unit ->
  describe_cache_output

val make_describe_cache_input : gateway_ar_n:gateway_ar_n -> unit -> describe_cache_input

val make_describe_cache_report_output :
  ?cache_report_info:cache_report_info -> unit -> describe_cache_report_output

val make_describe_cache_report_input :
  cache_report_ar_n:cache_report_ar_n -> unit -> describe_cache_report_input

val make_describe_cachedi_scsi_volumes_output :
  ?cachedi_scsi_volumes:cachedi_scsi_volumes -> unit -> describe_cachedi_scsi_volumes_output

val make_describe_cachedi_scsi_volumes_input :
  volume_ar_ns:volume_ar_ns -> unit -> describe_cachedi_scsi_volumes_input

val make_describe_chap_credentials_output :
  ?chap_credentials:chap_credentials -> unit -> describe_chap_credentials_output

val make_describe_chap_credentials_input :
  target_ar_n:target_ar_n -> unit -> describe_chap_credentials_input

val make_file_system_association_status_detail :
  ?error_code:file_system_association_sync_error_code ->
  unit ->
  file_system_association_status_detail

val make_file_system_association_info :
  ?file_system_association_ar_n:file_system_association_ar_n ->
  ?location_ar_n:file_system_location_ar_n ->
  ?file_system_association_status:file_system_association_status ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?gateway_ar_n:gateway_ar_n ->
  ?tags:tags ->
  ?cache_attributes:cache_attributes ->
  ?endpoint_network_configuration:endpoint_network_configuration ->
  ?file_system_association_status_details:file_system_association_status_details ->
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

val make_network_interface :
  ?ipv4_address:string_ ->
  ?mac_address:string_ ->
  ?ipv6_address:string_ ->
  unit ->
  network_interface

val make_describe_gateway_information_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?gateway_id:gateway_id ->
  ?gateway_name:string_ ->
  ?gateway_timezone:gateway_timezone ->
  ?gateway_state:gateway_state ->
  ?gateway_network_interfaces:gateway_network_interfaces ->
  ?gateway_type:gateway_type ->
  ?next_update_availability_date:next_update_availability_date ->
  ?last_software_update:last_software_update ->
  ?ec2_instance_id:ec2_instance_id ->
  ?ec2_instance_region:ec2_instance_region ->
  ?tags:tags ->
  ?vpc_endpoint:string_ ->
  ?cloud_watch_log_group_ar_n:cloud_watch_log_group_ar_n ->
  ?host_environment:host_environment ->
  ?endpoint_type:endpoint_type ->
  ?software_updates_end_date:software_updates_end_date ->
  ?deprecation_date:deprecation_date ->
  ?gateway_capacity:gateway_capacity ->
  ?supported_gateway_capacities:supported_gateway_capacities ->
  ?host_environment_id:host_environment_id ->
  ?software_version:software_version ->
  unit ->
  describe_gateway_information_output

val make_describe_gateway_information_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_gateway_information_input

val make_software_update_preferences :
  ?automatic_update_policy:automatic_update_policy -> unit -> software_update_preferences

val make_describe_maintenance_start_time_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?hour_of_day:hour_of_day ->
  ?minute_of_hour:minute_of_hour ->
  ?day_of_week:day_of_week ->
  ?day_of_month:day_of_month ->
  ?timezone:gateway_timezone ->
  ?software_update_preferences:software_update_preferences ->
  unit ->
  describe_maintenance_start_time_output

val make_describe_maintenance_start_time_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_maintenance_start_time_input

val make_nfs_file_share_info :
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  ?file_share_ar_n:file_share_ar_n ->
  ?file_share_id:file_share_id ->
  ?file_share_status:file_share_status ->
  ?gateway_ar_n:gateway_ar_n ->
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean2 ->
  ?kms_key:kms_key ->
  ?path:path ->
  ?role:role ->
  ?location_ar_n:location_ar_n ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?client_list:file_share_client_list ->
  ?squash:squash ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?tags:tags ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?bucket_region:region_id ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  unit ->
  nfs_file_share_info

val make_describe_nfs_file_shares_output :
  ?nfs_file_share_info_list:nfs_file_share_info_list -> unit -> describe_nfs_file_shares_output

val make_describe_nfs_file_shares_input :
  file_share_arn_list:file_share_arn_list -> unit -> describe_nfs_file_shares_input

val make_smb_file_share_info :
  ?file_share_ar_n:file_share_ar_n ->
  ?file_share_id:file_share_id ->
  ?file_share_status:file_share_status ->
  ?gateway_ar_n:gateway_ar_n ->
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean2 ->
  ?kms_key:kms_key ->
  ?path:path ->
  ?role:role ->
  ?location_ar_n:location_ar_n ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?access_based_enumeration:boolean_ ->
  ?admin_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?invalid_user_list:user_list ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?authentication:authentication ->
  ?case_sensitivity:case_sensitivity ->
  ?tags:tags ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?bucket_region:region_id ->
  ?oplocks_enabled:boolean_ ->
  unit ->
  smb_file_share_info

val make_describe_smb_file_shares_output :
  ?smb_file_share_info_list:smb_file_share_info_list -> unit -> describe_smb_file_shares_output

val make_describe_smb_file_shares_input :
  file_share_arn_list:file_share_arn_list -> unit -> describe_smb_file_shares_input

val make_smb_local_groups : ?gateway_admins:user_list -> unit -> smb_local_groups

val make_describe_smb_settings_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?domain_name:domain_name ->
  ?active_directory_status:active_directory_status ->
  ?smb_guest_password_set:boolean_ ->
  ?smb_security_strategy:smb_security_strategy ->
  ?file_shares_visible:boolean_ ->
  ?smb_local_groups:smb_local_groups ->
  unit ->
  describe_smb_settings_output

val make_describe_smb_settings_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_smb_settings_input

val make_describe_snapshot_schedule_output :
  ?volume_ar_n:volume_ar_n ->
  ?start_at:hour_of_day ->
  ?recurrence_in_hours:recurrence_in_hours ->
  ?description:description ->
  ?timezone:gateway_timezone ->
  ?tags:tags ->
  unit ->
  describe_snapshot_schedule_output

val make_describe_snapshot_schedule_input :
  volume_ar_n:volume_ar_n -> unit -> describe_snapshot_schedule_input

val make_storedi_scsi_volume :
  ?volume_ar_n:volume_ar_n ->
  ?volume_id:volume_id ->
  ?volume_type:volume_type ->
  ?volume_status:volume_status ->
  ?volume_attachment_status:volume_attachment_status ->
  ?volume_size_in_bytes:long ->
  ?volume_progress:double_object ->
  ?volume_disk_id:disk_id ->
  ?source_snapshot_id:snapshot_id ->
  ?preserved_existing_data:boolean2 ->
  ?volumei_scsi_attributes:volumei_scsi_attributes ->
  ?created_date:created_date ->
  ?volume_used_in_bytes:volume_used_in_bytes ->
  ?kms_key:kms_key ->
  ?target_name:target_name ->
  unit ->
  storedi_scsi_volume

val make_describe_storedi_scsi_volumes_output :
  ?storedi_scsi_volumes:storedi_scsi_volumes -> unit -> describe_storedi_scsi_volumes_output

val make_describe_storedi_scsi_volumes_input :
  volume_ar_ns:volume_ar_ns -> unit -> describe_storedi_scsi_volumes_input

val make_tape_archive :
  ?tape_ar_n:tape_ar_n ->
  ?tape_barcode:tape_barcode ->
  ?tape_created_date:time ->
  ?tape_size_in_bytes:tape_size ->
  ?completion_time:time ->
  ?retrieved_to:gateway_ar_n ->
  ?tape_status:tape_archive_status ->
  ?tape_used_in_bytes:tape_usage ->
  ?kms_key:kms_key ->
  ?pool_id:pool_id ->
  ?worm:boolean2 ->
  ?retention_start_date:time ->
  ?pool_entry_date:time ->
  unit ->
  tape_archive

val make_describe_tape_archives_output :
  ?tape_archives:tape_archives -> ?marker:marker -> unit -> describe_tape_archives_output

val make_describe_tape_archives_input :
  ?tape_ar_ns:tape_ar_ns ->
  ?marker:marker ->
  ?limit:positive_int_object ->
  unit ->
  describe_tape_archives_input

val make_tape_recovery_point_info :
  ?tape_ar_n:tape_ar_n ->
  ?tape_recovery_point_time:time ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_status:tape_recovery_point_status ->
  unit ->
  tape_recovery_point_info

val make_describe_tape_recovery_points_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?tape_recovery_point_infos:tape_recovery_point_infos ->
  ?marker:marker ->
  unit ->
  describe_tape_recovery_points_output

val make_describe_tape_recovery_points_input :
  ?marker:marker ->
  ?limit:positive_int_object ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_tape_recovery_points_input

val make_tape :
  ?tape_ar_n:tape_ar_n ->
  ?tape_barcode:tape_barcode ->
  ?tape_created_date:time ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_status:tape_status ->
  ?vtl_device:vtl_device_ar_n ->
  ?progress:double_object ->
  ?tape_used_in_bytes:tape_usage ->
  ?kms_key:kms_key ->
  ?pool_id:pool_id ->
  ?worm:boolean2 ->
  ?retention_start_date:time ->
  ?pool_entry_date:time ->
  unit ->
  tape

val make_describe_tapes_output : ?tapes:tapes -> ?marker:marker -> unit -> describe_tapes_output

val make_describe_tapes_input :
  ?tape_ar_ns:tape_ar_ns ->
  ?marker:marker ->
  ?limit:positive_int_object ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_tapes_input

val make_describe_upload_buffer_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?disk_ids:disk_ids ->
  ?upload_buffer_used_in_bytes:long ->
  ?upload_buffer_allocated_in_bytes:long ->
  unit ->
  describe_upload_buffer_output

val make_describe_upload_buffer_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_upload_buffer_input

val make_devicei_scsi_attributes :
  ?target_ar_n:target_ar_n ->
  ?network_interface_id:network_interface_id ->
  ?network_interface_port:integer ->
  ?chap_enabled:boolean2 ->
  unit ->
  devicei_scsi_attributes

val make_vtl_device :
  ?vtl_device_ar_n:vtl_device_ar_n ->
  ?vtl_device_type:vtl_device_type ->
  ?vtl_device_vendor:vtl_device_vendor ->
  ?vtl_device_product_identifier:vtl_device_product_identifier ->
  ?devicei_scsi_attributes:devicei_scsi_attributes ->
  unit ->
  vtl_device

val make_describe_vtl_devices_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?vtl_devices:vtl_devices ->
  ?marker:marker ->
  unit ->
  describe_vtl_devices_output

val make_describe_vtl_devices_input :
  ?vtl_device_ar_ns:vtl_device_ar_ns ->
  ?marker:marker ->
  ?limit:positive_int_object ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  describe_vtl_devices_input

val make_describe_working_storage_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?disk_ids:disk_ids ->
  ?working_storage_used_in_bytes:long ->
  ?working_storage_allocated_in_bytes:long ->
  unit ->
  describe_working_storage_output

val make_describe_working_storage_input :
  gateway_ar_n:gateway_ar_n -> unit -> describe_working_storage_input

val make_detach_volume_output : ?volume_ar_n:volume_ar_n -> unit -> detach_volume_output

val make_detach_volume_input :
  ?force_detach:boolean_ -> volume_ar_n:volume_ar_n -> unit -> detach_volume_input

val make_disable_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> disable_gateway_output
val make_disable_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> disable_gateway_input

val make_disassociate_file_system_output :
  ?file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  disassociate_file_system_output

val make_disassociate_file_system_input :
  ?force_delete:boolean2 ->
  file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  disassociate_file_system_input

val make_disk :
  ?disk_id:disk_id ->
  ?disk_path:string_ ->
  ?disk_node:string_ ->
  ?disk_status:string_ ->
  ?disk_size_in_bytes:long ->
  ?disk_allocation_type:disk_allocation_type ->
  ?disk_allocation_resource:string_ ->
  ?disk_attribute_list:disk_attribute_list ->
  unit ->
  disk

val make_evict_files_failing_upload_output :
  ?notification_id:string_ -> unit -> evict_files_failing_upload_output

val make_evict_files_failing_upload_input :
  ?force_remove:boolean2 ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  evict_files_failing_upload_input

val make_file_share_info :
  ?file_share_type:file_share_type ->
  ?file_share_ar_n:file_share_ar_n ->
  ?file_share_id:file_share_id ->
  ?file_share_status:file_share_status ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  file_share_info

val make_file_system_association_summary :
  ?file_system_association_id:file_system_association_id ->
  ?file_system_association_ar_n:file_system_association_ar_n ->
  ?file_system_association_status:file_system_association_status ->
  ?gateway_ar_n:gateway_ar_n ->
  unit ->
  file_system_association_summary

val make_gateway_info :
  ?gateway_id:gateway_id ->
  ?gateway_ar_n:gateway_ar_n ->
  ?gateway_type:gateway_type ->
  ?gateway_operational_state:gateway_operational_state ->
  ?gateway_name:string_ ->
  ?ec2_instance_id:ec2_instance_id ->
  ?ec2_instance_region:ec2_instance_region ->
  ?host_environment:host_environment ->
  ?host_environment_id:host_environment_id ->
  ?deprecation_date:deprecation_date ->
  ?software_version:software_version ->
  unit ->
  gateway_info

val make_join_domain_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?active_directory_status:active_directory_status ->
  unit ->
  join_domain_output

val make_join_domain_input :
  ?organizational_unit:organizational_unit ->
  ?domain_controllers:hosts ->
  ?timeout_in_seconds:timeout_in_seconds ->
  gateway_ar_n:gateway_ar_n ->
  domain_name:domain_name ->
  user_name:domain_user_name ->
  password:domain_user_password ->
  unit ->
  join_domain_input

val make_list_automatic_tape_creation_policies_output :
  ?automatic_tape_creation_policy_infos:automatic_tape_creation_policy_infos ->
  unit ->
  list_automatic_tape_creation_policies_output

val make_list_automatic_tape_creation_policies_input :
  ?gateway_ar_n:gateway_ar_n -> unit -> list_automatic_tape_creation_policies_input

val make_list_cache_reports_output :
  ?cache_report_list:cache_report_list -> ?marker:marker -> unit -> list_cache_reports_output

val make_list_cache_reports_input : ?marker:marker -> unit -> list_cache_reports_input

val make_list_file_shares_output :
  ?marker:marker ->
  ?next_marker:marker ->
  ?file_share_info_list:file_share_info_list ->
  unit ->
  list_file_shares_output

val make_list_file_shares_input :
  ?gateway_ar_n:gateway_ar_n ->
  ?limit:positive_int_object ->
  ?marker:marker ->
  unit ->
  list_file_shares_input

val make_list_file_system_associations_output :
  ?marker:marker ->
  ?next_marker:marker ->
  ?file_system_association_summary_list:file_system_association_summary_list ->
  unit ->
  list_file_system_associations_output

val make_list_file_system_associations_input :
  ?gateway_ar_n:gateway_ar_n ->
  ?limit:positive_int_object ->
  ?marker:marker ->
  unit ->
  list_file_system_associations_input

val make_list_gateways_output : ?gateways:gateways -> ?marker:marker -> unit -> list_gateways_output

val make_list_gateways_input :
  ?marker:marker -> ?limit:positive_int_object -> unit -> list_gateways_input

val make_list_local_disks_output :
  ?gateway_ar_n:gateway_ar_n -> ?disks:disks -> unit -> list_local_disks_output

val make_list_local_disks_input : gateway_ar_n:gateway_ar_n -> unit -> list_local_disks_input

val make_list_tags_for_resource_output :
  ?resource_ar_n:resource_ar_n ->
  ?marker:marker ->
  ?tags:tags ->
  unit ->
  list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?marker:marker ->
  ?limit:positive_int_object ->
  resource_ar_n:resource_ar_n ->
  unit ->
  list_tags_for_resource_input

val make_pool_info :
  ?pool_ar_n:pool_ar_n ->
  ?pool_name:pool_name ->
  ?storage_class:tape_storage_class ->
  ?retention_lock_type:retention_lock_type ->
  ?retention_lock_time_in_days:retention_lock_time_in_days ->
  ?pool_status:pool_status ->
  unit ->
  pool_info

val make_list_tape_pools_output :
  ?pool_infos:pool_infos -> ?marker:marker -> unit -> list_tape_pools_output

val make_list_tape_pools_input :
  ?pool_ar_ns:pool_ar_ns ->
  ?marker:marker ->
  ?limit:positive_int_object ->
  unit ->
  list_tape_pools_input

val make_tape_info :
  ?tape_ar_n:tape_ar_n ->
  ?tape_barcode:tape_barcode ->
  ?tape_size_in_bytes:tape_size ->
  ?tape_status:tape_status ->
  ?gateway_ar_n:gateway_ar_n ->
  ?pool_id:pool_id ->
  ?retention_start_date:time ->
  ?pool_entry_date:time ->
  unit ->
  tape_info

val make_list_tapes_output : ?tape_infos:tape_infos -> ?marker:marker -> unit -> list_tapes_output

val make_list_tapes_input :
  ?tape_ar_ns:tape_ar_ns -> ?marker:marker -> ?limit:positive_int_object -> unit -> list_tapes_input

val make_list_volume_initiators_output :
  ?initiators:initiators -> unit -> list_volume_initiators_output

val make_list_volume_initiators_input :
  volume_ar_n:volume_ar_n -> unit -> list_volume_initiators_input

val make_volume_recovery_point_info :
  ?volume_ar_n:volume_ar_n ->
  ?volume_size_in_bytes:long ->
  ?volume_usage_in_bytes:long ->
  ?volume_recovery_point_time:string_ ->
  unit ->
  volume_recovery_point_info

val make_list_volume_recovery_points_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?volume_recovery_point_infos:volume_recovery_point_infos ->
  unit ->
  list_volume_recovery_points_output

val make_list_volume_recovery_points_input :
  gateway_ar_n:gateway_ar_n -> unit -> list_volume_recovery_points_input

val make_volume_info :
  ?volume_ar_n:volume_ar_n ->
  ?volume_id:volume_id ->
  ?gateway_ar_n:gateway_ar_n ->
  ?gateway_id:gateway_id ->
  ?volume_type:volume_type ->
  ?volume_size_in_bytes:long ->
  ?volume_attachment_status:volume_attachment_status ->
  unit ->
  volume_info

val make_list_volumes_output :
  ?gateway_ar_n:gateway_ar_n ->
  ?marker:marker ->
  ?volume_infos:volume_infos ->
  unit ->
  list_volumes_output

val make_list_volumes_input :
  ?gateway_ar_n:gateway_ar_n ->
  ?marker:marker ->
  ?limit:positive_int_object ->
  unit ->
  list_volumes_input

val make_notify_when_uploaded_output :
  ?file_share_ar_n:file_share_ar_n ->
  ?notification_id:notification_id ->
  unit ->
  notify_when_uploaded_output

val make_notify_when_uploaded_input :
  file_share_ar_n:file_share_ar_n -> unit -> notify_when_uploaded_input

val make_refresh_cache_output :
  ?file_share_ar_n:file_share_ar_n ->
  ?notification_id:notification_id ->
  unit ->
  refresh_cache_output

val make_refresh_cache_input :
  ?folder_list:folder_list ->
  ?recursive:boolean_ ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  refresh_cache_input

val make_remove_tags_from_resource_output :
  ?resource_ar_n:resource_ar_n -> unit -> remove_tags_from_resource_output

val make_remove_tags_from_resource_input :
  resource_ar_n:resource_ar_n -> tag_keys:tag_keys -> unit -> remove_tags_from_resource_input

val make_reset_cache_output : ?gateway_ar_n:gateway_ar_n -> unit -> reset_cache_output
val make_reset_cache_input : gateway_ar_n:gateway_ar_n -> unit -> reset_cache_input
val make_retrieve_tape_archive_output : ?tape_ar_n:tape_ar_n -> unit -> retrieve_tape_archive_output

val make_retrieve_tape_archive_input :
  tape_ar_n:tape_ar_n -> gateway_ar_n:gateway_ar_n -> unit -> retrieve_tape_archive_input

val make_retrieve_tape_recovery_point_output :
  ?tape_ar_n:tape_ar_n -> unit -> retrieve_tape_recovery_point_output

val make_retrieve_tape_recovery_point_input :
  tape_ar_n:tape_ar_n -> gateway_ar_n:gateway_ar_n -> unit -> retrieve_tape_recovery_point_input

val make_set_local_console_password_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> set_local_console_password_output

val make_set_local_console_password_input :
  gateway_ar_n:gateway_ar_n ->
  local_console_password:local_console_password ->
  unit ->
  set_local_console_password_input

val make_set_smb_guest_password_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> set_smb_guest_password_output

val make_set_smb_guest_password_input :
  gateway_ar_n:gateway_ar_n -> password:smb_guest_password -> unit -> set_smb_guest_password_input

val make_shutdown_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> shutdown_gateway_output
val make_shutdown_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> shutdown_gateway_input

val make_start_availability_monitor_test_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> start_availability_monitor_test_output

val make_start_availability_monitor_test_input :
  gateway_ar_n:gateway_ar_n -> unit -> start_availability_monitor_test_input

val make_start_cache_report_output :
  ?cache_report_ar_n:cache_report_ar_n -> unit -> start_cache_report_output

val make_start_cache_report_input :
  ?vpc_endpoint_dns_name:dns_host_name ->
  ?inclusion_filters:cache_report_filter_list ->
  ?exclusion_filters:cache_report_filter_list ->
  ?tags:tags ->
  file_share_ar_n:file_share_ar_n ->
  role:role ->
  location_ar_n:location_ar_n ->
  bucket_region:region_id ->
  client_token:client_token ->
  unit ->
  start_cache_report_input

val make_start_gateway_output : ?gateway_ar_n:gateway_ar_n -> unit -> start_gateway_output
val make_start_gateway_input : gateway_ar_n:gateway_ar_n -> unit -> start_gateway_input

val make_update_vtl_device_type_output :
  ?vtl_device_ar_n:vtl_device_ar_n -> unit -> update_vtl_device_type_output

val make_update_vtl_device_type_input :
  vtl_device_ar_n:vtl_device_ar_n -> device_type:device_type -> unit -> update_vtl_device_type_input

val make_update_snapshot_schedule_output :
  ?volume_ar_n:volume_ar_n -> unit -> update_snapshot_schedule_output

val make_update_snapshot_schedule_input :
  ?description:description ->
  ?tags:tags ->
  volume_ar_n:volume_ar_n ->
  start_at:hour_of_day ->
  recurrence_in_hours:recurrence_in_hours ->
  unit ->
  update_snapshot_schedule_input

val make_update_smb_security_strategy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_security_strategy_output

val make_update_smb_security_strategy_input :
  gateway_ar_n:gateway_ar_n ->
  smb_security_strategy:smb_security_strategy ->
  unit ->
  update_smb_security_strategy_input

val make_update_smb_local_groups_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_local_groups_output

val make_update_smb_local_groups_input :
  gateway_ar_n:gateway_ar_n ->
  smb_local_groups:smb_local_groups ->
  unit ->
  update_smb_local_groups_input

val make_update_smb_file_share_visibility_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_smb_file_share_visibility_output

val make_update_smb_file_share_visibility_input :
  gateway_ar_n:gateway_ar_n ->
  file_shares_visible:boolean_ ->
  unit ->
  update_smb_file_share_visibility_input

val make_update_smb_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> update_smb_file_share_output

val make_update_smb_file_share_input :
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?smbacl_enabled:boolean_ ->
  ?access_based_enumeration:boolean_ ->
  ?admin_user_list:user_list ->
  ?valid_user_list:user_list ->
  ?invalid_user_list:user_list ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?case_sensitivity:case_sensitivity ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?oplocks_enabled:boolean_ ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  update_smb_file_share_input

val make_update_nfs_file_share_output :
  ?file_share_ar_n:file_share_ar_n -> unit -> update_nfs_file_share_output

val make_update_nfs_file_share_input :
  ?encryption_type:encryption_type ->
  ?kms_encrypted:boolean_ ->
  ?kms_key:kms_key ->
  ?nfs_file_share_defaults:nfs_file_share_defaults ->
  ?default_storage_class:storage_class ->
  ?object_ac_l:object_ac_l ->
  ?client_list:file_share_client_list ->
  ?squash:squash ->
  ?read_only:boolean_ ->
  ?guess_mime_type_enabled:boolean_ ->
  ?requester_pays:boolean_ ->
  ?file_share_name:file_share_name ->
  ?cache_attributes:cache_attributes ->
  ?notification_policy:notification_policy ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  file_share_ar_n:file_share_ar_n ->
  unit ->
  update_nfs_file_share_input

val make_update_maintenance_start_time_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_maintenance_start_time_output

val make_update_maintenance_start_time_input :
  ?hour_of_day:hour_of_day ->
  ?minute_of_hour:minute_of_hour ->
  ?day_of_week:day_of_week ->
  ?day_of_month:day_of_month ->
  ?software_update_preferences:software_update_preferences ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_maintenance_start_time_input

val make_update_gateway_software_now_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_gateway_software_now_output

val make_update_gateway_software_now_input :
  gateway_ar_n:gateway_ar_n -> unit -> update_gateway_software_now_input

val make_update_gateway_information_output :
  ?gateway_ar_n:gateway_ar_n -> ?gateway_name:string_ -> unit -> update_gateway_information_output

val make_update_gateway_information_input :
  ?gateway_name:gateway_name ->
  ?gateway_timezone:gateway_timezone ->
  ?cloud_watch_log_group_ar_n:cloud_watch_log_group_ar_n ->
  ?gateway_capacity:gateway_capacity ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_gateway_information_input

val make_update_file_system_association_output :
  ?file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  update_file_system_association_output

val make_update_file_system_association_input :
  ?user_name:domain_user_name ->
  ?password:domain_user_password ->
  ?audit_destination_ar_n:audit_destination_ar_n ->
  ?cache_attributes:cache_attributes ->
  file_system_association_ar_n:file_system_association_ar_n ->
  unit ->
  update_file_system_association_input

val make_update_chap_credentials_output :
  ?target_ar_n:target_ar_n -> ?initiator_name:iqn_name -> unit -> update_chap_credentials_output

val make_update_chap_credentials_input :
  ?secret_to_authenticate_target:chap_secret ->
  target_ar_n:target_ar_n ->
  secret_to_authenticate_initiator:chap_secret ->
  initiator_name:iqn_name ->
  unit ->
  update_chap_credentials_input

val make_update_bandwidth_rate_limit_schedule_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_bandwidth_rate_limit_schedule_output

val make_update_bandwidth_rate_limit_schedule_input :
  gateway_ar_n:gateway_ar_n ->
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
  unit ->
  update_bandwidth_rate_limit_schedule_input

val make_update_bandwidth_rate_limit_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_bandwidth_rate_limit_output

val make_update_bandwidth_rate_limit_input :
  ?average_upload_rate_limit_in_bits_per_sec:bandwidth_upload_rate_limit ->
  ?average_download_rate_limit_in_bits_per_sec:bandwidth_download_rate_limit ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_bandwidth_rate_limit_input

val make_update_automatic_tape_creation_policy_output :
  ?gateway_ar_n:gateway_ar_n -> unit -> update_automatic_tape_creation_policy_output

val make_update_automatic_tape_creation_policy_input :
  automatic_tape_creation_rules:automatic_tape_creation_rules ->
  gateway_ar_n:gateway_ar_n ->
  unit ->
  update_automatic_tape_creation_policy_input
