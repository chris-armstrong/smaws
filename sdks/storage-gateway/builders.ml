open Types

let make_storage_gateway_error ?error_code:(error_code_ : error_code option)
    ?error_details:(error_details_ : error_details option) () =
  ({ error_code = error_code_; error_details = error_details_ } : storage_gateway_error)

let make_activate_gateway_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : activate_gateway_output)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_activate_gateway_input ?gateway_type:(gateway_type_ : gateway_type option)
    ?tape_drive_type:(tape_drive_type_ : tape_drive_type option)
    ?medium_changer_type:(medium_changer_type_ : medium_changer_type option)
    ?tags:(tags_ : tags option) ~activation_key:(activation_key_ : activation_key)
    ~gateway_name:(gateway_name_ : gateway_name)
    ~gateway_timezone:(gateway_timezone_ : gateway_timezone)
    ~gateway_region:(gateway_region_ : region_id) () =
  ({
     activation_key = activation_key_;
     gateway_name = gateway_name_;
     gateway_timezone = gateway_timezone_;
     gateway_region = gateway_region_;
     gateway_type = gateway_type_;
     tape_drive_type = tape_drive_type_;
     medium_changer_type = medium_changer_type_;
     tags = tags_;
   }
    : activate_gateway_input)

let make_add_cache_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : add_cache_output)

let make_add_cache_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~disk_ids:(disk_ids_ : disk_ids) () =
  ({ gateway_ar_n = gateway_ar_n_; disk_ids = disk_ids_ } : add_cache_input)

let make_add_tags_to_resource_output ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) () =
  ({ resource_ar_n = resource_ar_n_ } : add_tags_to_resource_output)

let make_add_tags_to_resource_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    ~tags:(tags_ : tags) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : add_tags_to_resource_input)

let make_add_upload_buffer_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : add_upload_buffer_output)

let make_add_upload_buffer_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~disk_ids:(disk_ids_ : disk_ids) () =
  ({ gateway_ar_n = gateway_ar_n_; disk_ids = disk_ids_ } : add_upload_buffer_input)

let make_add_working_storage_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : add_working_storage_output)

let make_add_working_storage_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~disk_ids:(disk_ids_ : disk_ids) () =
  ({ gateway_ar_n = gateway_ar_n_; disk_ids = disk_ids_ } : add_working_storage_input)

let make_assign_tape_pool_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : assign_tape_pool_output)

let make_assign_tape_pool_input
    ?bypass_governance_retention:(bypass_governance_retention_ : boolean2 option)
    ~tape_ar_n:(tape_ar_n_ : tape_ar_n) ~pool_id:(pool_id_ : pool_id) () =
  ({
     tape_ar_n = tape_ar_n_;
     pool_id = pool_id_;
     bypass_governance_retention = bypass_governance_retention_;
   }
    : assign_tape_pool_input)

let make_associate_file_system_output
    ?file_system_association_ar_n:
      (file_system_association_ar_n_ : file_system_association_ar_n option) () =
  ({ file_system_association_ar_n = file_system_association_ar_n_ } : associate_file_system_output)

let make_endpoint_network_configuration ?ip_addresses:(ip_addresses_ : ip_address_list option) () =
  ({ ip_addresses = ip_addresses_ } : endpoint_network_configuration)

let make_cache_attributes
    ?cache_stale_timeout_in_seconds:
      (cache_stale_timeout_in_seconds_ : cache_stale_timeout_in_seconds option) () =
  ({ cache_stale_timeout_in_seconds = cache_stale_timeout_in_seconds_ } : cache_attributes)

let make_associate_file_system_input ?tags:(tags_ : tags option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?endpoint_network_configuration:
      (endpoint_network_configuration_ : endpoint_network_configuration option)
    ~user_name:(user_name_ : domain_user_name) ~password:(password_ : domain_user_password)
    ~client_token:(client_token_ : client_token) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~location_ar_n:(location_ar_n_ : file_system_location_ar_n) () =
  ({
     user_name = user_name_;
     password = password_;
     client_token = client_token_;
     gateway_ar_n = gateway_ar_n_;
     location_ar_n = location_ar_n_;
     tags = tags_;
     audit_destination_ar_n = audit_destination_ar_n_;
     cache_attributes = cache_attributes_;
     endpoint_network_configuration = endpoint_network_configuration_;
   }
    : associate_file_system_input)

let make_attach_volume_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?target_ar_n:(target_ar_n_ : target_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_; target_ar_n = target_ar_n_ } : attach_volume_output)

let make_attach_volume_input ?target_name:(target_name_ : target_name option)
    ?disk_id:(disk_id_ : disk_id option) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~volume_ar_n:(volume_ar_n_ : volume_ar_n)
    ~network_interface_id:(network_interface_id_ : network_interface_id) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     target_name = target_name_;
     volume_ar_n = volume_ar_n_;
     network_interface_id = network_interface_id_;
     disk_id = disk_id_;
   }
    : attach_volume_input)

let make_automatic_tape_creation_rule ?worm:(worm_ : boolean2 option)
    ~tape_barcode_prefix:(tape_barcode_prefix_ : tape_barcode_prefix) ~pool_id:(pool_id_ : pool_id)
    ~tape_size_in_bytes:(tape_size_in_bytes_ : tape_size)
    ~minimum_num_tapes:(minimum_num_tapes_ : minimum_num_tapes) () =
  ({
     tape_barcode_prefix = tape_barcode_prefix_;
     pool_id = pool_id_;
     tape_size_in_bytes = tape_size_in_bytes_;
     minimum_num_tapes = minimum_num_tapes_;
     worm = worm_;
   }
    : automatic_tape_creation_rule)

let make_automatic_tape_creation_policy_info
    ?automatic_tape_creation_rules:
      (automatic_tape_creation_rules_ : automatic_tape_creation_rules option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ automatic_tape_creation_rules = automatic_tape_creation_rules_; gateway_ar_n = gateway_ar_n_ }
    : automatic_tape_creation_policy_info)

let make_bandwidth_rate_limit_interval
    ?average_upload_rate_limit_in_bits_per_sec:
      (average_upload_rate_limit_in_bits_per_sec_ : bandwidth_upload_rate_limit option)
    ?average_download_rate_limit_in_bits_per_sec:
      (average_download_rate_limit_in_bits_per_sec_ : bandwidth_download_rate_limit option)
    ~start_hour_of_day:(start_hour_of_day_ : hour_of_day)
    ~start_minute_of_hour:(start_minute_of_hour_ : minute_of_hour)
    ~end_hour_of_day:(end_hour_of_day_ : hour_of_day)
    ~end_minute_of_hour:(end_minute_of_hour_ : minute_of_hour)
    ~days_of_week:(days_of_week_ : days_of_week) () =
  ({
     start_hour_of_day = start_hour_of_day_;
     start_minute_of_hour = start_minute_of_hour_;
     end_hour_of_day = end_hour_of_day_;
     end_minute_of_hour = end_minute_of_hour_;
     days_of_week = days_of_week_;
     average_upload_rate_limit_in_bits_per_sec = average_upload_rate_limit_in_bits_per_sec_;
     average_download_rate_limit_in_bits_per_sec = average_download_rate_limit_in_bits_per_sec_;
   }
    : bandwidth_rate_limit_interval)

let make_cache_report_filter ~name:(name_ : cache_report_filter_name)
    ~values:(values_ : cache_report_filter_values) () =
  ({ name = name_; values = values_ } : cache_report_filter)

let make_cache_report_info ?cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n option)
    ?cache_report_status:(cache_report_status_ : cache_report_status option)
    ?report_completion_percent:(report_completion_percent_ : report_completion_percent option)
    ?end_time:(end_time_ : time option) ?role:(role_ : role option)
    ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?location_ar_n:(location_ar_n_ : location_ar_n option) ?start_time:(start_time_ : time option)
    ?inclusion_filters:(inclusion_filters_ : cache_report_filter_list option)
    ?exclusion_filters:(exclusion_filters_ : cache_report_filter_list option)
    ?report_name:(report_name_ : cache_report_name option) ?tags:(tags_ : tags option) () =
  ({
     cache_report_ar_n = cache_report_ar_n_;
     cache_report_status = cache_report_status_;
     report_completion_percent = report_completion_percent_;
     end_time = end_time_;
     role = role_;
     file_share_ar_n = file_share_ar_n_;
     location_ar_n = location_ar_n_;
     start_time = start_time_;
     inclusion_filters = inclusion_filters_;
     exclusion_filters = exclusion_filters_;
     report_name = report_name_;
     tags = tags_;
   }
    : cache_report_info)

let make_volumei_scsi_attributes ?target_ar_n:(target_ar_n_ : target_ar_n option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?network_interface_port:(network_interface_port_ : integer option)
    ?lun_number:(lun_number_ : positive_int_object option)
    ?chap_enabled:(chap_enabled_ : boolean2 option) () =
  ({
     target_ar_n = target_ar_n_;
     network_interface_id = network_interface_id_;
     network_interface_port = network_interface_port_;
     lun_number = lun_number_;
     chap_enabled = chap_enabled_;
   }
    : volumei_scsi_attributes)

let make_cachedi_scsi_volume ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_id:(volume_id_ : volume_id option) ?volume_type:(volume_type_ : volume_type option)
    ?volume_status:(volume_status_ : volume_status option)
    ?volume_attachment_status:(volume_attachment_status_ : volume_attachment_status option)
    ?volume_size_in_bytes:(volume_size_in_bytes_ : long option)
    ?volume_progress:(volume_progress_ : double_object option)
    ?source_snapshot_id:(source_snapshot_id_ : snapshot_id option)
    ?volumei_scsi_attributes:(volumei_scsi_attributes_ : volumei_scsi_attributes option)
    ?created_date:(created_date_ : created_date option)
    ?volume_used_in_bytes:(volume_used_in_bytes_ : volume_used_in_bytes option)
    ?kms_key:(kms_key_ : kms_key option) ?target_name:(target_name_ : target_name option) () =
  ({
     volume_ar_n = volume_ar_n_;
     volume_id = volume_id_;
     volume_type = volume_type_;
     volume_status = volume_status_;
     volume_attachment_status = volume_attachment_status_;
     volume_size_in_bytes = volume_size_in_bytes_;
     volume_progress = volume_progress_;
     source_snapshot_id = source_snapshot_id_;
     volumei_scsi_attributes = volumei_scsi_attributes_;
     created_date = created_date_;
     volume_used_in_bytes = volume_used_in_bytes_;
     kms_key = kms_key_;
     target_name = target_name_;
   }
    : cachedi_scsi_volume)

let make_cancel_archival_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : cancel_archival_output)

let make_cancel_archival_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~tape_ar_n:(tape_ar_n_ : tape_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_; tape_ar_n = tape_ar_n_ } : cancel_archival_input)

let make_cancel_cache_report_output
    ?cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n option) () =
  ({ cache_report_ar_n = cache_report_ar_n_ } : cancel_cache_report_output)

let make_cancel_cache_report_input ~cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n) () =
  ({ cache_report_ar_n = cache_report_ar_n_ } : cancel_cache_report_input)

let make_cancel_retrieval_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : cancel_retrieval_output)

let make_cancel_retrieval_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~tape_ar_n:(tape_ar_n_ : tape_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_; tape_ar_n = tape_ar_n_ } : cancel_retrieval_input)

let make_chap_info ?target_ar_n:(target_ar_n_ : target_ar_n option)
    ?secret_to_authenticate_initiator:(secret_to_authenticate_initiator_ : chap_secret option)
    ?initiator_name:(initiator_name_ : iqn_name option)
    ?secret_to_authenticate_target:(secret_to_authenticate_target_ : chap_secret option) () =
  ({
     target_ar_n = target_ar_n_;
     secret_to_authenticate_initiator = secret_to_authenticate_initiator_;
     initiator_name = initiator_name_;
     secret_to_authenticate_target = secret_to_authenticate_target_;
   }
    : chap_info)

let make_create_cachedi_scsi_volume_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?target_ar_n:(target_ar_n_ : target_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_; target_ar_n = target_ar_n_ } : create_cachedi_scsi_volume_output)

let make_create_cachedi_scsi_volume_input ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?source_volume_ar_n:(source_volume_ar_n_ : volume_ar_n option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?tags:(tags_ : tags option) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~volume_size_in_bytes:(volume_size_in_bytes_ : long) ~target_name:(target_name_ : target_name)
    ~network_interface_id:(network_interface_id_ : network_interface_id)
    ~client_token:(client_token_ : client_token) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     volume_size_in_bytes = volume_size_in_bytes_;
     snapshot_id = snapshot_id_;
     target_name = target_name_;
     source_volume_ar_n = source_volume_ar_n_;
     network_interface_id = network_interface_id_;
     client_token = client_token_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     tags = tags_;
   }
    : create_cachedi_scsi_volume_input)

let make_create_nfs_file_share_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    () =
  ({ file_share_ar_n = file_share_ar_n_ } : create_nfs_file_share_output)

let make_nfs_file_share_defaults ?file_mode:(file_mode_ : permission_mode option)
    ?directory_mode:(directory_mode_ : permission_mode option)
    ?group_id:(group_id_ : permission_id option) ?owner_id:(owner_id_ : permission_id option) () =
  ({
     file_mode = file_mode_;
     directory_mode = directory_mode_;
     group_id = group_id_;
     owner_id = owner_id_;
   }
    : nfs_file_share_defaults)

let make_create_nfs_file_share_input
    ?nfs_file_share_defaults:(nfs_file_share_defaults_ : nfs_file_share_defaults option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option)
    ?client_list:(client_list_ : file_share_client_list option) ?squash:(squash_ : squash option)
    ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option) ?tags:(tags_ : tags option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?vpc_endpoint_dns_name:(vpc_endpoint_dns_name_ : dns_host_name option)
    ?bucket_region:(bucket_region_ : region_id option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ~client_token:(client_token_ : client_token) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~role:(role_ : role) ~location_ar_n:(location_ar_n_ : location_ar_n) () =
  ({
     client_token = client_token_;
     nfs_file_share_defaults = nfs_file_share_defaults_;
     gateway_ar_n = gateway_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     role = role_;
     location_ar_n = location_ar_n_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     client_list = client_list_;
     squash = squash_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     tags = tags_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     vpc_endpoint_dns_name = vpc_endpoint_dns_name_;
     bucket_region = bucket_region_;
     audit_destination_ar_n = audit_destination_ar_n_;
   }
    : create_nfs_file_share_input)

let make_create_smb_file_share_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    () =
  ({ file_share_ar_n = file_share_ar_n_ } : create_smb_file_share_output)

let make_create_smb_file_share_input ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option) ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option)
    ?smbacl_enabled:(smbacl_enabled_ : boolean_ option)
    ?access_based_enumeration:(access_based_enumeration_ : boolean_ option)
    ?admin_user_list:(admin_user_list_ : user_list option)
    ?valid_user_list:(valid_user_list_ : user_list option)
    ?invalid_user_list:(invalid_user_list_ : user_list option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?authentication:(authentication_ : authentication option)
    ?case_sensitivity:(case_sensitivity_ : case_sensitivity option) ?tags:(tags_ : tags option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?vpc_endpoint_dns_name:(vpc_endpoint_dns_name_ : dns_host_name option)
    ?bucket_region:(bucket_region_ : region_id option)
    ?oplocks_enabled:(oplocks_enabled_ : boolean_ option)
    ~client_token:(client_token_ : client_token) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~role:(role_ : role) ~location_ar_n:(location_ar_n_ : location_ar_n) () =
  ({
     client_token = client_token_;
     gateway_ar_n = gateway_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     role = role_;
     location_ar_n = location_ar_n_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     smbacl_enabled = smbacl_enabled_;
     access_based_enumeration = access_based_enumeration_;
     admin_user_list = admin_user_list_;
     valid_user_list = valid_user_list_;
     invalid_user_list = invalid_user_list_;
     audit_destination_ar_n = audit_destination_ar_n_;
     authentication = authentication_;
     case_sensitivity = case_sensitivity_;
     tags = tags_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     vpc_endpoint_dns_name = vpc_endpoint_dns_name_;
     bucket_region = bucket_region_;
     oplocks_enabled = oplocks_enabled_;
   }
    : create_smb_file_share_input)

let make_create_snapshot_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option) () =
  ({ volume_ar_n = volume_ar_n_; snapshot_id = snapshot_id_ } : create_snapshot_output)

let make_create_snapshot_input ?tags:(tags_ : tags option) ~volume_ar_n:(volume_ar_n_ : volume_ar_n)
    ~snapshot_description:(snapshot_description_ : snapshot_description) () =
  ({ volume_ar_n = volume_ar_n_; snapshot_description = snapshot_description_; tags = tags_ }
    : create_snapshot_input)

let make_create_snapshot_from_volume_recovery_point_output
    ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_recovery_point_time:(volume_recovery_point_time_ : string_ option) () =
  ({
     snapshot_id = snapshot_id_;
     volume_ar_n = volume_ar_n_;
     volume_recovery_point_time = volume_recovery_point_time_;
   }
    : create_snapshot_from_volume_recovery_point_output)

let make_create_snapshot_from_volume_recovery_point_input ?tags:(tags_ : tags option)
    ~volume_ar_n:(volume_ar_n_ : volume_ar_n)
    ~snapshot_description:(snapshot_description_ : snapshot_description) () =
  ({ volume_ar_n = volume_ar_n_; snapshot_description = snapshot_description_; tags = tags_ }
    : create_snapshot_from_volume_recovery_point_input)

let make_create_storedi_scsi_volume_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_size_in_bytes:(volume_size_in_bytes_ : long option)
    ?target_ar_n:(target_ar_n_ : target_ar_n option) () =
  ({
     volume_ar_n = volume_ar_n_;
     volume_size_in_bytes = volume_size_in_bytes_;
     target_ar_n = target_ar_n_;
   }
    : create_storedi_scsi_volume_output)

let make_create_storedi_scsi_volume_input ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?tags:(tags_ : tags option) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~disk_id:(disk_id_ : disk_id) ~preserve_existing_data:(preserve_existing_data_ : boolean2)
    ~target_name:(target_name_ : target_name)
    ~network_interface_id:(network_interface_id_ : network_interface_id) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     disk_id = disk_id_;
     snapshot_id = snapshot_id_;
     preserve_existing_data = preserve_existing_data_;
     target_name = target_name_;
     network_interface_id = network_interface_id_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     tags = tags_;
   }
    : create_storedi_scsi_volume_input)

let make_create_tape_pool_output ?pool_ar_n:(pool_ar_n_ : pool_ar_n option) () =
  ({ pool_ar_n = pool_ar_n_ } : create_tape_pool_output)

let make_create_tape_pool_input
    ?retention_lock_type:(retention_lock_type_ : retention_lock_type option)
    ?retention_lock_time_in_days:(retention_lock_time_in_days_ : retention_lock_time_in_days option)
    ?tags:(tags_ : tags option) ~pool_name:(pool_name_ : pool_name)
    ~storage_class:(storage_class_ : tape_storage_class) () =
  ({
     pool_name = pool_name_;
     storage_class = storage_class_;
     retention_lock_type = retention_lock_type_;
     retention_lock_time_in_days = retention_lock_time_in_days_;
     tags = tags_;
   }
    : create_tape_pool_input)

let make_create_tape_with_barcode_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : create_tape_with_barcode_output)

let make_create_tape_with_barcode_input ?kms_encrypted:(kms_encrypted_ : boolean_ option)
    ?kms_key:(kms_key_ : kms_key option) ?pool_id:(pool_id_ : pool_id option)
    ?worm:(worm_ : boolean2 option) ?tags:(tags_ : tags option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~tape_size_in_bytes:(tape_size_in_bytes_ : tape_size)
    ~tape_barcode:(tape_barcode_ : tape_barcode) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     tape_size_in_bytes = tape_size_in_bytes_;
     tape_barcode = tape_barcode_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     pool_id = pool_id_;
     worm = worm_;
     tags = tags_;
   }
    : create_tape_with_barcode_input)

let make_create_tapes_output ?tape_ar_ns:(tape_ar_ns_ : tape_ar_ns option) () =
  ({ tape_ar_ns = tape_ar_ns_ } : create_tapes_output)

let make_create_tapes_input ?kms_encrypted:(kms_encrypted_ : boolean_ option)
    ?kms_key:(kms_key_ : kms_key option) ?pool_id:(pool_id_ : pool_id option)
    ?worm:(worm_ : boolean2 option) ?tags:(tags_ : tags option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~tape_size_in_bytes:(tape_size_in_bytes_ : tape_size)
    ~client_token:(client_token_ : client_token)
    ~num_tapes_to_create:(num_tapes_to_create_ : num_tapes_to_create)
    ~tape_barcode_prefix:(tape_barcode_prefix_ : tape_barcode_prefix) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     tape_size_in_bytes = tape_size_in_bytes_;
     client_token = client_token_;
     num_tapes_to_create = num_tapes_to_create_;
     tape_barcode_prefix = tape_barcode_prefix_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     pool_id = pool_id_;
     worm = worm_;
     tags = tags_;
   }
    : create_tapes_input)

let make_delete_automatic_tape_creation_policy_output
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : delete_automatic_tape_creation_policy_output)

let make_delete_automatic_tape_creation_policy_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) ()
    =
  ({ gateway_ar_n = gateway_ar_n_ } : delete_automatic_tape_creation_policy_input)

let make_delete_bandwidth_rate_limit_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : delete_bandwidth_rate_limit_output)

let make_delete_bandwidth_rate_limit_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~bandwidth_type:(bandwidth_type_ : bandwidth_type) () =
  ({ gateway_ar_n = gateway_ar_n_; bandwidth_type = bandwidth_type_ }
    : delete_bandwidth_rate_limit_input)

let make_delete_cache_report_output
    ?cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n option) () =
  ({ cache_report_ar_n = cache_report_ar_n_ } : delete_cache_report_output)

let make_delete_cache_report_input ~cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n) () =
  ({ cache_report_ar_n = cache_report_ar_n_ } : delete_cache_report_input)

let make_delete_chap_credentials_output ?target_ar_n:(target_ar_n_ : target_ar_n option)
    ?initiator_name:(initiator_name_ : iqn_name option) () =
  ({ target_ar_n = target_ar_n_; initiator_name = initiator_name_ }
    : delete_chap_credentials_output)

let make_delete_chap_credentials_input ~target_ar_n:(target_ar_n_ : target_ar_n)
    ~initiator_name:(initiator_name_ : iqn_name) () =
  ({ target_ar_n = target_ar_n_; initiator_name = initiator_name_ } : delete_chap_credentials_input)

let make_delete_file_share_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option) () =
  ({ file_share_ar_n = file_share_ar_n_ } : delete_file_share_output)

let make_delete_file_share_input ?force_delete:(force_delete_ : boolean2 option)
    ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n) () =
  ({ file_share_ar_n = file_share_ar_n_; force_delete = force_delete_ } : delete_file_share_input)

let make_delete_gateway_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : delete_gateway_output)

let make_delete_gateway_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : delete_gateway_input)

let make_delete_snapshot_schedule_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_ } : delete_snapshot_schedule_output)

let make_delete_snapshot_schedule_input ~volume_ar_n:(volume_ar_n_ : volume_ar_n) () =
  ({ volume_ar_n = volume_ar_n_ } : delete_snapshot_schedule_input)

let make_delete_tape_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : delete_tape_output)

let make_delete_tape_input
    ?bypass_governance_retention:(bypass_governance_retention_ : boolean2 option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) ~tape_ar_n:(tape_ar_n_ : tape_ar_n) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     tape_ar_n = tape_ar_n_;
     bypass_governance_retention = bypass_governance_retention_;
   }
    : delete_tape_input)

let make_delete_tape_archive_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : delete_tape_archive_output)

let make_delete_tape_archive_input
    ?bypass_governance_retention:(bypass_governance_retention_ : boolean2 option)
    ~tape_ar_n:(tape_ar_n_ : tape_ar_n) () =
  ({ tape_ar_n = tape_ar_n_; bypass_governance_retention = bypass_governance_retention_ }
    : delete_tape_archive_input)

let make_delete_tape_pool_output ?pool_ar_n:(pool_ar_n_ : pool_ar_n option) () =
  ({ pool_ar_n = pool_ar_n_ } : delete_tape_pool_output)

let make_delete_tape_pool_input ~pool_ar_n:(pool_ar_n_ : pool_ar_n) () =
  ({ pool_ar_n = pool_ar_n_ } : delete_tape_pool_input)

let make_delete_volume_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_ } : delete_volume_output)

let make_delete_volume_input ~volume_ar_n:(volume_ar_n_ : volume_ar_n) () =
  ({ volume_ar_n = volume_ar_n_ } : delete_volume_input)

let make_describe_availability_monitor_test_output
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?status:(status_ : availability_monitor_test_status option)
    ?start_time:(start_time_ : time option) () =
  ({ gateway_ar_n = gateway_ar_n_; status = status_; start_time = start_time_ }
    : describe_availability_monitor_test_output)

let make_describe_availability_monitor_test_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_availability_monitor_test_input)

let make_describe_bandwidth_rate_limit_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?average_upload_rate_limit_in_bits_per_sec:
      (average_upload_rate_limit_in_bits_per_sec_ : bandwidth_upload_rate_limit option)
    ?average_download_rate_limit_in_bits_per_sec:
      (average_download_rate_limit_in_bits_per_sec_ : bandwidth_download_rate_limit option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     average_upload_rate_limit_in_bits_per_sec = average_upload_rate_limit_in_bits_per_sec_;
     average_download_rate_limit_in_bits_per_sec = average_download_rate_limit_in_bits_per_sec_;
   }
    : describe_bandwidth_rate_limit_output)

let make_describe_bandwidth_rate_limit_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_bandwidth_rate_limit_input)

let make_describe_bandwidth_rate_limit_schedule_output
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_;
   }
    : describe_bandwidth_rate_limit_schedule_output)

let make_describe_bandwidth_rate_limit_schedule_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_bandwidth_rate_limit_schedule_input)

let make_describe_cache_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?disk_ids:(disk_ids_ : disk_ids option)
    ?cache_allocated_in_bytes:(cache_allocated_in_bytes_ : long option)
    ?cache_used_percentage:(cache_used_percentage_ : double option)
    ?cache_dirty_percentage:(cache_dirty_percentage_ : double option)
    ?cache_hit_percentage:(cache_hit_percentage_ : double option)
    ?cache_miss_percentage:(cache_miss_percentage_ : double option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     disk_ids = disk_ids_;
     cache_allocated_in_bytes = cache_allocated_in_bytes_;
     cache_used_percentage = cache_used_percentage_;
     cache_dirty_percentage = cache_dirty_percentage_;
     cache_hit_percentage = cache_hit_percentage_;
     cache_miss_percentage = cache_miss_percentage_;
   }
    : describe_cache_output)

let make_describe_cache_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_cache_input)

let make_describe_cache_report_output
    ?cache_report_info:(cache_report_info_ : cache_report_info option) () =
  ({ cache_report_info = cache_report_info_ } : describe_cache_report_output)

let make_describe_cache_report_input ~cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n) ()
    =
  ({ cache_report_ar_n = cache_report_ar_n_ } : describe_cache_report_input)

let make_describe_cachedi_scsi_volumes_output
    ?cachedi_scsi_volumes:(cachedi_scsi_volumes_ : cachedi_scsi_volumes option) () =
  ({ cachedi_scsi_volumes = cachedi_scsi_volumes_ } : describe_cachedi_scsi_volumes_output)

let make_describe_cachedi_scsi_volumes_input ~volume_ar_ns:(volume_ar_ns_ : volume_ar_ns) () =
  ({ volume_ar_ns = volume_ar_ns_ } : describe_cachedi_scsi_volumes_input)

let make_describe_chap_credentials_output
    ?chap_credentials:(chap_credentials_ : chap_credentials option) () =
  ({ chap_credentials = chap_credentials_ } : describe_chap_credentials_output)

let make_describe_chap_credentials_input ~target_ar_n:(target_ar_n_ : target_ar_n) () =
  ({ target_ar_n = target_ar_n_ } : describe_chap_credentials_input)

let make_file_system_association_status_detail
    ?error_code:(error_code_ : file_system_association_sync_error_code option) () =
  ({ error_code = error_code_ } : file_system_association_status_detail)

let make_file_system_association_info
    ?file_system_association_ar_n:
      (file_system_association_ar_n_ : file_system_association_ar_n option)
    ?location_ar_n:(location_ar_n_ : file_system_location_ar_n option)
    ?file_system_association_status:
      (file_system_association_status_ : file_system_association_status option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) ?tags:(tags_ : tags option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?endpoint_network_configuration:
      (endpoint_network_configuration_ : endpoint_network_configuration option)
    ?file_system_association_status_details:
      (file_system_association_status_details_ : file_system_association_status_details option) () =
  ({
     file_system_association_ar_n = file_system_association_ar_n_;
     location_ar_n = location_ar_n_;
     file_system_association_status = file_system_association_status_;
     audit_destination_ar_n = audit_destination_ar_n_;
     gateway_ar_n = gateway_ar_n_;
     tags = tags_;
     cache_attributes = cache_attributes_;
     endpoint_network_configuration = endpoint_network_configuration_;
     file_system_association_status_details = file_system_association_status_details_;
   }
    : file_system_association_info)

let make_describe_file_system_associations_output
    ?file_system_association_info_list:
      (file_system_association_info_list_ : file_system_association_info_list option) () =
  ({ file_system_association_info_list = file_system_association_info_list_ }
    : describe_file_system_associations_output)

let make_describe_file_system_associations_input
    ~file_system_association_arn_list:
      (file_system_association_arn_list_ : file_system_association_arn_list) () =
  ({ file_system_association_arn_list = file_system_association_arn_list_ }
    : describe_file_system_associations_input)

let make_network_interface ?ipv4_address:(ipv4_address_ : string_ option)
    ?mac_address:(mac_address_ : string_ option) ?ipv6_address:(ipv6_address_ : string_ option) () =
  ({ ipv4_address = ipv4_address_; mac_address = mac_address_; ipv6_address = ipv6_address_ }
    : network_interface)

let make_describe_gateway_information_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?gateway_id:(gateway_id_ : gateway_id option) ?gateway_name:(gateway_name_ : string_ option)
    ?gateway_timezone:(gateway_timezone_ : gateway_timezone option)
    ?gateway_state:(gateway_state_ : gateway_state option)
    ?gateway_network_interfaces:(gateway_network_interfaces_ : gateway_network_interfaces option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?next_update_availability_date:
      (next_update_availability_date_ : next_update_availability_date option)
    ?last_software_update:(last_software_update_ : last_software_update option)
    ?ec2_instance_id:(ec2_instance_id_ : ec2_instance_id option)
    ?ec2_instance_region:(ec2_instance_region_ : ec2_instance_region option)
    ?tags:(tags_ : tags option) ?vpc_endpoint:(vpc_endpoint_ : string_ option)
    ?cloud_watch_log_group_ar_n:(cloud_watch_log_group_ar_n_ : cloud_watch_log_group_ar_n option)
    ?host_environment:(host_environment_ : host_environment option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?software_updates_end_date:(software_updates_end_date_ : software_updates_end_date option)
    ?deprecation_date:(deprecation_date_ : deprecation_date option)
    ?gateway_capacity:(gateway_capacity_ : gateway_capacity option)
    ?supported_gateway_capacities:
      (supported_gateway_capacities_ : supported_gateway_capacities option)
    ?host_environment_id:(host_environment_id_ : host_environment_id option)
    ?software_version:(software_version_ : software_version option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     gateway_id = gateway_id_;
     gateway_name = gateway_name_;
     gateway_timezone = gateway_timezone_;
     gateway_state = gateway_state_;
     gateway_network_interfaces = gateway_network_interfaces_;
     gateway_type = gateway_type_;
     next_update_availability_date = next_update_availability_date_;
     last_software_update = last_software_update_;
     ec2_instance_id = ec2_instance_id_;
     ec2_instance_region = ec2_instance_region_;
     tags = tags_;
     vpc_endpoint = vpc_endpoint_;
     cloud_watch_log_group_ar_n = cloud_watch_log_group_ar_n_;
     host_environment = host_environment_;
     endpoint_type = endpoint_type_;
     software_updates_end_date = software_updates_end_date_;
     deprecation_date = deprecation_date_;
     gateway_capacity = gateway_capacity_;
     supported_gateway_capacities = supported_gateway_capacities_;
     host_environment_id = host_environment_id_;
     software_version = software_version_;
   }
    : describe_gateway_information_output)

let make_describe_gateway_information_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_gateway_information_input)

let make_software_update_preferences
    ?automatic_update_policy:(automatic_update_policy_ : automatic_update_policy option) () =
  ({ automatic_update_policy = automatic_update_policy_ } : software_update_preferences)

let make_describe_maintenance_start_time_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?hour_of_day:(hour_of_day_ : hour_of_day option)
    ?minute_of_hour:(minute_of_hour_ : minute_of_hour option)
    ?day_of_week:(day_of_week_ : day_of_week option)
    ?day_of_month:(day_of_month_ : day_of_month option)
    ?timezone:(timezone_ : gateway_timezone option)
    ?software_update_preferences:(software_update_preferences_ : software_update_preferences option)
    () =
  ({
     gateway_ar_n = gateway_ar_n_;
     hour_of_day = hour_of_day_;
     minute_of_hour = minute_of_hour_;
     day_of_week = day_of_week_;
     day_of_month = day_of_month_;
     timezone = timezone_;
     software_update_preferences = software_update_preferences_;
   }
    : describe_maintenance_start_time_output)

let make_describe_maintenance_start_time_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_maintenance_start_time_input)

let make_nfs_file_share_info
    ?nfs_file_share_defaults:(nfs_file_share_defaults_ : nfs_file_share_defaults option)
    ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?file_share_id:(file_share_id_ : file_share_id option)
    ?file_share_status:(file_share_status_ : file_share_status option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean2 option) ?kms_key:(kms_key_ : kms_key option)
    ?path:(path_ : path option) ?role:(role_ : role option)
    ?location_ar_n:(location_ar_n_ : location_ar_n option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option)
    ?client_list:(client_list_ : file_share_client_list option) ?squash:(squash_ : squash option)
    ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option) ?tags:(tags_ : tags option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?vpc_endpoint_dns_name:(vpc_endpoint_dns_name_ : dns_host_name option)
    ?bucket_region:(bucket_region_ : region_id option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option) () =
  ({
     nfs_file_share_defaults = nfs_file_share_defaults_;
     file_share_ar_n = file_share_ar_n_;
     file_share_id = file_share_id_;
     file_share_status = file_share_status_;
     gateway_ar_n = gateway_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     path = path_;
     role = role_;
     location_ar_n = location_ar_n_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     client_list = client_list_;
     squash = squash_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     tags = tags_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     vpc_endpoint_dns_name = vpc_endpoint_dns_name_;
     bucket_region = bucket_region_;
     audit_destination_ar_n = audit_destination_ar_n_;
   }
    : nfs_file_share_info)

let make_describe_nfs_file_shares_output
    ?nfs_file_share_info_list:(nfs_file_share_info_list_ : nfs_file_share_info_list option) () =
  ({ nfs_file_share_info_list = nfs_file_share_info_list_ } : describe_nfs_file_shares_output)

let make_describe_nfs_file_shares_input
    ~file_share_arn_list:(file_share_arn_list_ : file_share_arn_list) () =
  ({ file_share_arn_list = file_share_arn_list_ } : describe_nfs_file_shares_input)

let make_smb_file_share_info ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?file_share_id:(file_share_id_ : file_share_id option)
    ?file_share_status:(file_share_status_ : file_share_status option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean2 option) ?kms_key:(kms_key_ : kms_key option)
    ?path:(path_ : path option) ?role:(role_ : role option)
    ?location_ar_n:(location_ar_n_ : location_ar_n option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option) ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option)
    ?smbacl_enabled:(smbacl_enabled_ : boolean_ option)
    ?access_based_enumeration:(access_based_enumeration_ : boolean_ option)
    ?admin_user_list:(admin_user_list_ : user_list option)
    ?valid_user_list:(valid_user_list_ : user_list option)
    ?invalid_user_list:(invalid_user_list_ : user_list option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?authentication:(authentication_ : authentication option)
    ?case_sensitivity:(case_sensitivity_ : case_sensitivity option) ?tags:(tags_ : tags option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?vpc_endpoint_dns_name:(vpc_endpoint_dns_name_ : dns_host_name option)
    ?bucket_region:(bucket_region_ : region_id option)
    ?oplocks_enabled:(oplocks_enabled_ : boolean_ option) () =
  ({
     file_share_ar_n = file_share_ar_n_;
     file_share_id = file_share_id_;
     file_share_status = file_share_status_;
     gateway_ar_n = gateway_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     path = path_;
     role = role_;
     location_ar_n = location_ar_n_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     smbacl_enabled = smbacl_enabled_;
     access_based_enumeration = access_based_enumeration_;
     admin_user_list = admin_user_list_;
     valid_user_list = valid_user_list_;
     invalid_user_list = invalid_user_list_;
     audit_destination_ar_n = audit_destination_ar_n_;
     authentication = authentication_;
     case_sensitivity = case_sensitivity_;
     tags = tags_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     vpc_endpoint_dns_name = vpc_endpoint_dns_name_;
     bucket_region = bucket_region_;
     oplocks_enabled = oplocks_enabled_;
   }
    : smb_file_share_info)

let make_describe_smb_file_shares_output
    ?smb_file_share_info_list:(smb_file_share_info_list_ : smb_file_share_info_list option) () =
  ({ smb_file_share_info_list = smb_file_share_info_list_ } : describe_smb_file_shares_output)

let make_describe_smb_file_shares_input
    ~file_share_arn_list:(file_share_arn_list_ : file_share_arn_list) () =
  ({ file_share_arn_list = file_share_arn_list_ } : describe_smb_file_shares_input)

let make_smb_local_groups ?gateway_admins:(gateway_admins_ : user_list option) () =
  ({ gateway_admins = gateway_admins_ } : smb_local_groups)

let make_describe_smb_settings_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?domain_name:(domain_name_ : domain_name option)
    ?active_directory_status:(active_directory_status_ : active_directory_status option)
    ?smb_guest_password_set:(smb_guest_password_set_ : boolean_ option)
    ?smb_security_strategy:(smb_security_strategy_ : smb_security_strategy option)
    ?file_shares_visible:(file_shares_visible_ : boolean_ option)
    ?smb_local_groups:(smb_local_groups_ : smb_local_groups option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     domain_name = domain_name_;
     active_directory_status = active_directory_status_;
     smb_guest_password_set = smb_guest_password_set_;
     smb_security_strategy = smb_security_strategy_;
     file_shares_visible = file_shares_visible_;
     smb_local_groups = smb_local_groups_;
   }
    : describe_smb_settings_output)

let make_describe_smb_settings_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_smb_settings_input)

let make_describe_snapshot_schedule_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?start_at:(start_at_ : hour_of_day option)
    ?recurrence_in_hours:(recurrence_in_hours_ : recurrence_in_hours option)
    ?description:(description_ : description option) ?timezone:(timezone_ : gateway_timezone option)
    ?tags:(tags_ : tags option) () =
  ({
     volume_ar_n = volume_ar_n_;
     start_at = start_at_;
     recurrence_in_hours = recurrence_in_hours_;
     description = description_;
     timezone = timezone_;
     tags = tags_;
   }
    : describe_snapshot_schedule_output)

let make_describe_snapshot_schedule_input ~volume_ar_n:(volume_ar_n_ : volume_ar_n) () =
  ({ volume_ar_n = volume_ar_n_ } : describe_snapshot_schedule_input)

let make_storedi_scsi_volume ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_id:(volume_id_ : volume_id option) ?volume_type:(volume_type_ : volume_type option)
    ?volume_status:(volume_status_ : volume_status option)
    ?volume_attachment_status:(volume_attachment_status_ : volume_attachment_status option)
    ?volume_size_in_bytes:(volume_size_in_bytes_ : long option)
    ?volume_progress:(volume_progress_ : double_object option)
    ?volume_disk_id:(volume_disk_id_ : disk_id option)
    ?source_snapshot_id:(source_snapshot_id_ : snapshot_id option)
    ?preserved_existing_data:(preserved_existing_data_ : boolean2 option)
    ?volumei_scsi_attributes:(volumei_scsi_attributes_ : volumei_scsi_attributes option)
    ?created_date:(created_date_ : created_date option)
    ?volume_used_in_bytes:(volume_used_in_bytes_ : volume_used_in_bytes option)
    ?kms_key:(kms_key_ : kms_key option) ?target_name:(target_name_ : target_name option) () =
  ({
     volume_ar_n = volume_ar_n_;
     volume_id = volume_id_;
     volume_type = volume_type_;
     volume_status = volume_status_;
     volume_attachment_status = volume_attachment_status_;
     volume_size_in_bytes = volume_size_in_bytes_;
     volume_progress = volume_progress_;
     volume_disk_id = volume_disk_id_;
     source_snapshot_id = source_snapshot_id_;
     preserved_existing_data = preserved_existing_data_;
     volumei_scsi_attributes = volumei_scsi_attributes_;
     created_date = created_date_;
     volume_used_in_bytes = volume_used_in_bytes_;
     kms_key = kms_key_;
     target_name = target_name_;
   }
    : storedi_scsi_volume)

let make_describe_storedi_scsi_volumes_output
    ?storedi_scsi_volumes:(storedi_scsi_volumes_ : storedi_scsi_volumes option) () =
  ({ storedi_scsi_volumes = storedi_scsi_volumes_ } : describe_storedi_scsi_volumes_output)

let make_describe_storedi_scsi_volumes_input ~volume_ar_ns:(volume_ar_ns_ : volume_ar_ns) () =
  ({ volume_ar_ns = volume_ar_ns_ } : describe_storedi_scsi_volumes_input)

let make_tape_archive ?tape_ar_n:(tape_ar_n_ : tape_ar_n option)
    ?tape_barcode:(tape_barcode_ : tape_barcode option)
    ?tape_created_date:(tape_created_date_ : time option)
    ?tape_size_in_bytes:(tape_size_in_bytes_ : tape_size option)
    ?completion_time:(completion_time_ : time option)
    ?retrieved_to:(retrieved_to_ : gateway_ar_n option)
    ?tape_status:(tape_status_ : tape_archive_status option)
    ?tape_used_in_bytes:(tape_used_in_bytes_ : tape_usage option)
    ?kms_key:(kms_key_ : kms_key option) ?pool_id:(pool_id_ : pool_id option)
    ?worm:(worm_ : boolean2 option) ?retention_start_date:(retention_start_date_ : time option)
    ?pool_entry_date:(pool_entry_date_ : time option) () =
  ({
     tape_ar_n = tape_ar_n_;
     tape_barcode = tape_barcode_;
     tape_created_date = tape_created_date_;
     tape_size_in_bytes = tape_size_in_bytes_;
     completion_time = completion_time_;
     retrieved_to = retrieved_to_;
     tape_status = tape_status_;
     tape_used_in_bytes = tape_used_in_bytes_;
     kms_key = kms_key_;
     pool_id = pool_id_;
     worm = worm_;
     retention_start_date = retention_start_date_;
     pool_entry_date = pool_entry_date_;
   }
    : tape_archive)

let make_describe_tape_archives_output ?tape_archives:(tape_archives_ : tape_archives option)
    ?marker:(marker_ : marker option) () =
  ({ tape_archives = tape_archives_; marker = marker_ } : describe_tape_archives_output)

let make_describe_tape_archives_input ?tape_ar_ns:(tape_ar_ns_ : tape_ar_ns option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option) () =
  ({ tape_ar_ns = tape_ar_ns_; marker = marker_; limit = limit_ } : describe_tape_archives_input)

let make_tape_recovery_point_info ?tape_ar_n:(tape_ar_n_ : tape_ar_n option)
    ?tape_recovery_point_time:(tape_recovery_point_time_ : time option)
    ?tape_size_in_bytes:(tape_size_in_bytes_ : tape_size option)
    ?tape_status:(tape_status_ : tape_recovery_point_status option) () =
  ({
     tape_ar_n = tape_ar_n_;
     tape_recovery_point_time = tape_recovery_point_time_;
     tape_size_in_bytes = tape_size_in_bytes_;
     tape_status = tape_status_;
   }
    : tape_recovery_point_info)

let make_describe_tape_recovery_points_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?tape_recovery_point_infos:(tape_recovery_point_infos_ : tape_recovery_point_infos option)
    ?marker:(marker_ : marker option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     tape_recovery_point_infos = tape_recovery_point_infos_;
     marker = marker_;
   }
    : describe_tape_recovery_points_output)

let make_describe_tape_recovery_points_input ?marker:(marker_ : marker option)
    ?limit:(limit_ : positive_int_object option) ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_; marker = marker_; limit = limit_ }
    : describe_tape_recovery_points_input)

let make_tape ?tape_ar_n:(tape_ar_n_ : tape_ar_n option)
    ?tape_barcode:(tape_barcode_ : tape_barcode option)
    ?tape_created_date:(tape_created_date_ : time option)
    ?tape_size_in_bytes:(tape_size_in_bytes_ : tape_size option)
    ?tape_status:(tape_status_ : tape_status option)
    ?vtl_device:(vtl_device_ : vtl_device_ar_n option) ?progress:(progress_ : double_object option)
    ?tape_used_in_bytes:(tape_used_in_bytes_ : tape_usage option)
    ?kms_key:(kms_key_ : kms_key option) ?pool_id:(pool_id_ : pool_id option)
    ?worm:(worm_ : boolean2 option) ?retention_start_date:(retention_start_date_ : time option)
    ?pool_entry_date:(pool_entry_date_ : time option) () =
  ({
     tape_ar_n = tape_ar_n_;
     tape_barcode = tape_barcode_;
     tape_created_date = tape_created_date_;
     tape_size_in_bytes = tape_size_in_bytes_;
     tape_status = tape_status_;
     vtl_device = vtl_device_;
     progress = progress_;
     tape_used_in_bytes = tape_used_in_bytes_;
     kms_key = kms_key_;
     pool_id = pool_id_;
     worm = worm_;
     retention_start_date = retention_start_date_;
     pool_entry_date = pool_entry_date_;
   }
    : tape)

let make_describe_tapes_output ?tapes:(tapes_ : tapes option) ?marker:(marker_ : marker option) () =
  ({ tapes = tapes_; marker = marker_ } : describe_tapes_output)

let make_describe_tapes_input ?tape_ar_ns:(tape_ar_ns_ : tape_ar_ns option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_; tape_ar_ns = tape_ar_ns_; marker = marker_; limit = limit_ }
    : describe_tapes_input)

let make_describe_upload_buffer_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?disk_ids:(disk_ids_ : disk_ids option)
    ?upload_buffer_used_in_bytes:(upload_buffer_used_in_bytes_ : long option)
    ?upload_buffer_allocated_in_bytes:(upload_buffer_allocated_in_bytes_ : long option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     disk_ids = disk_ids_;
     upload_buffer_used_in_bytes = upload_buffer_used_in_bytes_;
     upload_buffer_allocated_in_bytes = upload_buffer_allocated_in_bytes_;
   }
    : describe_upload_buffer_output)

let make_describe_upload_buffer_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_upload_buffer_input)

let make_devicei_scsi_attributes ?target_ar_n:(target_ar_n_ : target_ar_n option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?network_interface_port:(network_interface_port_ : integer option)
    ?chap_enabled:(chap_enabled_ : boolean2 option) () =
  ({
     target_ar_n = target_ar_n_;
     network_interface_id = network_interface_id_;
     network_interface_port = network_interface_port_;
     chap_enabled = chap_enabled_;
   }
    : devicei_scsi_attributes)

let make_vtl_device ?vtl_device_ar_n:(vtl_device_ar_n_ : vtl_device_ar_n option)
    ?vtl_device_type:(vtl_device_type_ : vtl_device_type option)
    ?vtl_device_vendor:(vtl_device_vendor_ : vtl_device_vendor option)
    ?vtl_device_product_identifier:
      (vtl_device_product_identifier_ : vtl_device_product_identifier option)
    ?devicei_scsi_attributes:(devicei_scsi_attributes_ : devicei_scsi_attributes option) () =
  ({
     vtl_device_ar_n = vtl_device_ar_n_;
     vtl_device_type = vtl_device_type_;
     vtl_device_vendor = vtl_device_vendor_;
     vtl_device_product_identifier = vtl_device_product_identifier_;
     devicei_scsi_attributes = devicei_scsi_attributes_;
   }
    : vtl_device)

let make_describe_vtl_devices_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?vtl_devices:(vtl_devices_ : vtl_devices option) ?marker:(marker_ : marker option) () =
  ({ gateway_ar_n = gateway_ar_n_; vtl_devices = vtl_devices_; marker = marker_ }
    : describe_vtl_devices_output)

let make_describe_vtl_devices_input ?vtl_device_ar_ns:(vtl_device_ar_ns_ : vtl_device_ar_ns option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     vtl_device_ar_ns = vtl_device_ar_ns_;
     marker = marker_;
     limit = limit_;
   }
    : describe_vtl_devices_input)

let make_describe_working_storage_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?disk_ids:(disk_ids_ : disk_ids option)
    ?working_storage_used_in_bytes:(working_storage_used_in_bytes_ : long option)
    ?working_storage_allocated_in_bytes:(working_storage_allocated_in_bytes_ : long option) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     disk_ids = disk_ids_;
     working_storage_used_in_bytes = working_storage_used_in_bytes_;
     working_storage_allocated_in_bytes = working_storage_allocated_in_bytes_;
   }
    : describe_working_storage_output)

let make_describe_working_storage_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : describe_working_storage_input)

let make_detach_volume_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_ } : detach_volume_output)

let make_detach_volume_input ?force_detach:(force_detach_ : boolean_ option)
    ~volume_ar_n:(volume_ar_n_ : volume_ar_n) () =
  ({ volume_ar_n = volume_ar_n_; force_detach = force_detach_ } : detach_volume_input)

let make_disable_gateway_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : disable_gateway_output)

let make_disable_gateway_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : disable_gateway_input)

let make_disassociate_file_system_output
    ?file_system_association_ar_n:
      (file_system_association_ar_n_ : file_system_association_ar_n option) () =
  ({ file_system_association_ar_n = file_system_association_ar_n_ }
    : disassociate_file_system_output)

let make_disassociate_file_system_input ?force_delete:(force_delete_ : boolean2 option)
    ~file_system_association_ar_n:(file_system_association_ar_n_ : file_system_association_ar_n) ()
    =
  ({ file_system_association_ar_n = file_system_association_ar_n_; force_delete = force_delete_ }
    : disassociate_file_system_input)

let make_disk ?disk_id:(disk_id_ : disk_id option) ?disk_path:(disk_path_ : string_ option)
    ?disk_node:(disk_node_ : string_ option) ?disk_status:(disk_status_ : string_ option)
    ?disk_size_in_bytes:(disk_size_in_bytes_ : long option)
    ?disk_allocation_type:(disk_allocation_type_ : disk_allocation_type option)
    ?disk_allocation_resource:(disk_allocation_resource_ : string_ option)
    ?disk_attribute_list:(disk_attribute_list_ : disk_attribute_list option) () =
  ({
     disk_id = disk_id_;
     disk_path = disk_path_;
     disk_node = disk_node_;
     disk_status = disk_status_;
     disk_size_in_bytes = disk_size_in_bytes_;
     disk_allocation_type = disk_allocation_type_;
     disk_allocation_resource = disk_allocation_resource_;
     disk_attribute_list = disk_attribute_list_;
   }
    : disk)

let make_evict_files_failing_upload_output ?notification_id:(notification_id_ : string_ option) () =
  ({ notification_id = notification_id_ } : evict_files_failing_upload_output)

let make_evict_files_failing_upload_input ?force_remove:(force_remove_ : boolean2 option)
    ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n) () =
  ({ file_share_ar_n = file_share_ar_n_; force_remove = force_remove_ }
    : evict_files_failing_upload_input)

let make_file_share_info ?file_share_type:(file_share_type_ : file_share_type option)
    ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?file_share_id:(file_share_id_ : file_share_id option)
    ?file_share_status:(file_share_status_ : file_share_status option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({
     file_share_type = file_share_type_;
     file_share_ar_n = file_share_ar_n_;
     file_share_id = file_share_id_;
     file_share_status = file_share_status_;
     gateway_ar_n = gateway_ar_n_;
   }
    : file_share_info)

let make_file_system_association_summary
    ?file_system_association_id:(file_system_association_id_ : file_system_association_id option)
    ?file_system_association_ar_n:
      (file_system_association_ar_n_ : file_system_association_ar_n option)
    ?file_system_association_status:
      (file_system_association_status_ : file_system_association_status option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({
     file_system_association_id = file_system_association_id_;
     file_system_association_ar_n = file_system_association_ar_n_;
     file_system_association_status = file_system_association_status_;
     gateway_ar_n = gateway_ar_n_;
   }
    : file_system_association_summary)

let make_gateway_info ?gateway_id:(gateway_id_ : gateway_id option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?gateway_operational_state:(gateway_operational_state_ : gateway_operational_state option)
    ?gateway_name:(gateway_name_ : string_ option)
    ?ec2_instance_id:(ec2_instance_id_ : ec2_instance_id option)
    ?ec2_instance_region:(ec2_instance_region_ : ec2_instance_region option)
    ?host_environment:(host_environment_ : host_environment option)
    ?host_environment_id:(host_environment_id_ : host_environment_id option)
    ?deprecation_date:(deprecation_date_ : deprecation_date option)
    ?software_version:(software_version_ : software_version option) () =
  ({
     gateway_id = gateway_id_;
     gateway_ar_n = gateway_ar_n_;
     gateway_type = gateway_type_;
     gateway_operational_state = gateway_operational_state_;
     gateway_name = gateway_name_;
     ec2_instance_id = ec2_instance_id_;
     ec2_instance_region = ec2_instance_region_;
     host_environment = host_environment_;
     host_environment_id = host_environment_id_;
     deprecation_date = deprecation_date_;
     software_version = software_version_;
   }
    : gateway_info)

let make_join_domain_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?active_directory_status:(active_directory_status_ : active_directory_status option) () =
  ({ gateway_ar_n = gateway_ar_n_; active_directory_status = active_directory_status_ }
    : join_domain_output)

let make_join_domain_input ?organizational_unit:(organizational_unit_ : organizational_unit option)
    ?domain_controllers:(domain_controllers_ : hosts option)
    ?timeout_in_seconds:(timeout_in_seconds_ : timeout_in_seconds option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) ~domain_name:(domain_name_ : domain_name)
    ~user_name:(user_name_ : domain_user_name) ~password:(password_ : domain_user_password) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     domain_name = domain_name_;
     organizational_unit = organizational_unit_;
     domain_controllers = domain_controllers_;
     timeout_in_seconds = timeout_in_seconds_;
     user_name = user_name_;
     password = password_;
   }
    : join_domain_input)

let make_list_automatic_tape_creation_policies_output
    ?automatic_tape_creation_policy_infos:
      (automatic_tape_creation_policy_infos_ : automatic_tape_creation_policy_infos option) () =
  ({ automatic_tape_creation_policy_infos = automatic_tape_creation_policy_infos_ }
    : list_automatic_tape_creation_policies_output)

let make_list_automatic_tape_creation_policies_input
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : list_automatic_tape_creation_policies_input)

let make_list_cache_reports_output
    ?cache_report_list:(cache_report_list_ : cache_report_list option)
    ?marker:(marker_ : marker option) () =
  ({ cache_report_list = cache_report_list_; marker = marker_ } : list_cache_reports_output)

let make_list_cache_reports_input ?marker:(marker_ : marker option) () =
  ({ marker = marker_ } : list_cache_reports_input)

let make_list_file_shares_output ?marker:(marker_ : marker option)
    ?next_marker:(next_marker_ : marker option)
    ?file_share_info_list:(file_share_info_list_ : file_share_info_list option) () =
  ({ marker = marker_; next_marker = next_marker_; file_share_info_list = file_share_info_list_ }
    : list_file_shares_output)

let make_list_file_shares_input ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?limit:(limit_ : positive_int_object option) ?marker:(marker_ : marker option) () =
  ({ gateway_ar_n = gateway_ar_n_; limit = limit_; marker = marker_ } : list_file_shares_input)

let make_list_file_system_associations_output ?marker:(marker_ : marker option)
    ?next_marker:(next_marker_ : marker option)
    ?file_system_association_summary_list:
      (file_system_association_summary_list_ : file_system_association_summary_list option) () =
  ({
     marker = marker_;
     next_marker = next_marker_;
     file_system_association_summary_list = file_system_association_summary_list_;
   }
    : list_file_system_associations_output)

let make_list_file_system_associations_input ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?limit:(limit_ : positive_int_object option) ?marker:(marker_ : marker option) () =
  ({ gateway_ar_n = gateway_ar_n_; limit = limit_; marker = marker_ }
    : list_file_system_associations_input)

let make_list_gateways_output ?gateways:(gateways_ : gateways option)
    ?marker:(marker_ : marker option) () =
  ({ gateways = gateways_; marker = marker_ } : list_gateways_output)

let make_list_gateways_input ?marker:(marker_ : marker option)
    ?limit:(limit_ : positive_int_object option) () =
  ({ marker = marker_; limit = limit_ } : list_gateways_input)

let make_list_local_disks_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?disks:(disks_ : disks option) () =
  ({ gateway_ar_n = gateway_ar_n_; disks = disks_ } : list_local_disks_output)

let make_list_local_disks_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : list_local_disks_input)

let make_list_tags_for_resource_output ?resource_ar_n:(resource_ar_n_ : resource_ar_n option)
    ?marker:(marker_ : marker option) ?tags:(tags_ : tags option) () =
  ({ resource_ar_n = resource_ar_n_; marker = marker_; tags = tags_ }
    : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?marker:(marker_ : marker option)
    ?limit:(limit_ : positive_int_object option) ~resource_ar_n:(resource_ar_n_ : resource_ar_n) ()
    =
  ({ resource_ar_n = resource_ar_n_; marker = marker_; limit = limit_ }
    : list_tags_for_resource_input)

let make_pool_info ?pool_ar_n:(pool_ar_n_ : pool_ar_n option)
    ?pool_name:(pool_name_ : pool_name option)
    ?storage_class:(storage_class_ : tape_storage_class option)
    ?retention_lock_type:(retention_lock_type_ : retention_lock_type option)
    ?retention_lock_time_in_days:(retention_lock_time_in_days_ : retention_lock_time_in_days option)
    ?pool_status:(pool_status_ : pool_status option) () =
  ({
     pool_ar_n = pool_ar_n_;
     pool_name = pool_name_;
     storage_class = storage_class_;
     retention_lock_type = retention_lock_type_;
     retention_lock_time_in_days = retention_lock_time_in_days_;
     pool_status = pool_status_;
   }
    : pool_info)

let make_list_tape_pools_output ?pool_infos:(pool_infos_ : pool_infos option)
    ?marker:(marker_ : marker option) () =
  ({ pool_infos = pool_infos_; marker = marker_ } : list_tape_pools_output)

let make_list_tape_pools_input ?pool_ar_ns:(pool_ar_ns_ : pool_ar_ns option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option) () =
  ({ pool_ar_ns = pool_ar_ns_; marker = marker_; limit = limit_ } : list_tape_pools_input)

let make_tape_info ?tape_ar_n:(tape_ar_n_ : tape_ar_n option)
    ?tape_barcode:(tape_barcode_ : tape_barcode option)
    ?tape_size_in_bytes:(tape_size_in_bytes_ : tape_size option)
    ?tape_status:(tape_status_ : tape_status option)
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) ?pool_id:(pool_id_ : pool_id option)
    ?retention_start_date:(retention_start_date_ : time option)
    ?pool_entry_date:(pool_entry_date_ : time option) () =
  ({
     tape_ar_n = tape_ar_n_;
     tape_barcode = tape_barcode_;
     tape_size_in_bytes = tape_size_in_bytes_;
     tape_status = tape_status_;
     gateway_ar_n = gateway_ar_n_;
     pool_id = pool_id_;
     retention_start_date = retention_start_date_;
     pool_entry_date = pool_entry_date_;
   }
    : tape_info)

let make_list_tapes_output ?tape_infos:(tape_infos_ : tape_infos option)
    ?marker:(marker_ : marker option) () =
  ({ tape_infos = tape_infos_; marker = marker_ } : list_tapes_output)

let make_list_tapes_input ?tape_ar_ns:(tape_ar_ns_ : tape_ar_ns option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option) () =
  ({ tape_ar_ns = tape_ar_ns_; marker = marker_; limit = limit_ } : list_tapes_input)

let make_list_volume_initiators_output ?initiators:(initiators_ : initiators option) () =
  ({ initiators = initiators_ } : list_volume_initiators_output)

let make_list_volume_initiators_input ~volume_ar_n:(volume_ar_n_ : volume_ar_n) () =
  ({ volume_ar_n = volume_ar_n_ } : list_volume_initiators_input)

let make_volume_recovery_point_info ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_size_in_bytes:(volume_size_in_bytes_ : long option)
    ?volume_usage_in_bytes:(volume_usage_in_bytes_ : long option)
    ?volume_recovery_point_time:(volume_recovery_point_time_ : string_ option) () =
  ({
     volume_ar_n = volume_ar_n_;
     volume_size_in_bytes = volume_size_in_bytes_;
     volume_usage_in_bytes = volume_usage_in_bytes_;
     volume_recovery_point_time = volume_recovery_point_time_;
   }
    : volume_recovery_point_info)

let make_list_volume_recovery_points_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?volume_recovery_point_infos:(volume_recovery_point_infos_ : volume_recovery_point_infos option)
    () =
  ({ gateway_ar_n = gateway_ar_n_; volume_recovery_point_infos = volume_recovery_point_infos_ }
    : list_volume_recovery_points_output)

let make_list_volume_recovery_points_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : list_volume_recovery_points_input)

let make_volume_info ?volume_ar_n:(volume_ar_n_ : volume_ar_n option)
    ?volume_id:(volume_id_ : volume_id option) ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?gateway_id:(gateway_id_ : gateway_id option) ?volume_type:(volume_type_ : volume_type option)
    ?volume_size_in_bytes:(volume_size_in_bytes_ : long option)
    ?volume_attachment_status:(volume_attachment_status_ : volume_attachment_status option) () =
  ({
     volume_ar_n = volume_ar_n_;
     volume_id = volume_id_;
     gateway_ar_n = gateway_ar_n_;
     gateway_id = gateway_id_;
     volume_type = volume_type_;
     volume_size_in_bytes = volume_size_in_bytes_;
     volume_attachment_status = volume_attachment_status_;
   }
    : volume_info)

let make_list_volumes_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?marker:(marker_ : marker option) ?volume_infos:(volume_infos_ : volume_infos option) () =
  ({ gateway_ar_n = gateway_ar_n_; marker = marker_; volume_infos = volume_infos_ }
    : list_volumes_output)

let make_list_volumes_input ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?marker:(marker_ : marker option) ?limit:(limit_ : positive_int_object option) () =
  ({ gateway_ar_n = gateway_ar_n_; marker = marker_; limit = limit_ } : list_volumes_input)

let make_notify_when_uploaded_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?notification_id:(notification_id_ : notification_id option) () =
  ({ file_share_ar_n = file_share_ar_n_; notification_id = notification_id_ }
    : notify_when_uploaded_output)

let make_notify_when_uploaded_input ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n) () =
  ({ file_share_ar_n = file_share_ar_n_ } : notify_when_uploaded_input)

let make_refresh_cache_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    ?notification_id:(notification_id_ : notification_id option) () =
  ({ file_share_ar_n = file_share_ar_n_; notification_id = notification_id_ }
    : refresh_cache_output)

let make_refresh_cache_input ?folder_list:(folder_list_ : folder_list option)
    ?recursive:(recursive_ : boolean_ option) ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n)
    () =
  ({ file_share_ar_n = file_share_ar_n_; folder_list = folder_list_; recursive = recursive_ }
    : refresh_cache_input)

let make_remove_tags_from_resource_output ?resource_ar_n:(resource_ar_n_ : resource_ar_n option) ()
    =
  ({ resource_ar_n = resource_ar_n_ } : remove_tags_from_resource_output)

let make_remove_tags_from_resource_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : remove_tags_from_resource_input)

let make_reset_cache_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : reset_cache_output)

let make_reset_cache_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : reset_cache_input)

let make_retrieve_tape_archive_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : retrieve_tape_archive_output)

let make_retrieve_tape_archive_input ~tape_ar_n:(tape_ar_n_ : tape_ar_n)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ tape_ar_n = tape_ar_n_; gateway_ar_n = gateway_ar_n_ } : retrieve_tape_archive_input)

let make_retrieve_tape_recovery_point_output ?tape_ar_n:(tape_ar_n_ : tape_ar_n option) () =
  ({ tape_ar_n = tape_ar_n_ } : retrieve_tape_recovery_point_output)

let make_retrieve_tape_recovery_point_input ~tape_ar_n:(tape_ar_n_ : tape_ar_n)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ tape_ar_n = tape_ar_n_; gateway_ar_n = gateway_ar_n_ } : retrieve_tape_recovery_point_input)

let make_set_local_console_password_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : set_local_console_password_output)

let make_set_local_console_password_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~local_console_password:(local_console_password_ : local_console_password) () =
  ({ gateway_ar_n = gateway_ar_n_; local_console_password = local_console_password_ }
    : set_local_console_password_input)

let make_set_smb_guest_password_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : set_smb_guest_password_output)

let make_set_smb_guest_password_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~password:(password_ : smb_guest_password) () =
  ({ gateway_ar_n = gateway_ar_n_; password = password_ } : set_smb_guest_password_input)

let make_shutdown_gateway_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : shutdown_gateway_output)

let make_shutdown_gateway_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : shutdown_gateway_input)

let make_start_availability_monitor_test_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    () =
  ({ gateway_ar_n = gateway_ar_n_ } : start_availability_monitor_test_output)

let make_start_availability_monitor_test_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : start_availability_monitor_test_input)

let make_start_cache_report_output
    ?cache_report_ar_n:(cache_report_ar_n_ : cache_report_ar_n option) () =
  ({ cache_report_ar_n = cache_report_ar_n_ } : start_cache_report_output)

let make_start_cache_report_input
    ?vpc_endpoint_dns_name:(vpc_endpoint_dns_name_ : dns_host_name option)
    ?inclusion_filters:(inclusion_filters_ : cache_report_filter_list option)
    ?exclusion_filters:(exclusion_filters_ : cache_report_filter_list option)
    ?tags:(tags_ : tags option) ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n)
    ~role:(role_ : role) ~location_ar_n:(location_ar_n_ : location_ar_n)
    ~bucket_region:(bucket_region_ : region_id) ~client_token:(client_token_ : client_token) () =
  ({
     file_share_ar_n = file_share_ar_n_;
     role = role_;
     location_ar_n = location_ar_n_;
     bucket_region = bucket_region_;
     vpc_endpoint_dns_name = vpc_endpoint_dns_name_;
     inclusion_filters = inclusion_filters_;
     exclusion_filters = exclusion_filters_;
     client_token = client_token_;
     tags = tags_;
   }
    : start_cache_report_input)

let make_start_gateway_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : start_gateway_output)

let make_start_gateway_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : start_gateway_input)

let make_update_vtl_device_type_output ?vtl_device_ar_n:(vtl_device_ar_n_ : vtl_device_ar_n option)
    () =
  ({ vtl_device_ar_n = vtl_device_ar_n_ } : update_vtl_device_type_output)

let make_update_vtl_device_type_input ~vtl_device_ar_n:(vtl_device_ar_n_ : vtl_device_ar_n)
    ~device_type:(device_type_ : device_type) () =
  ({ vtl_device_ar_n = vtl_device_ar_n_; device_type = device_type_ }
    : update_vtl_device_type_input)

let make_update_snapshot_schedule_output ?volume_ar_n:(volume_ar_n_ : volume_ar_n option) () =
  ({ volume_ar_n = volume_ar_n_ } : update_snapshot_schedule_output)

let make_update_snapshot_schedule_input ?description:(description_ : description option)
    ?tags:(tags_ : tags option) ~volume_ar_n:(volume_ar_n_ : volume_ar_n)
    ~start_at:(start_at_ : hour_of_day)
    ~recurrence_in_hours:(recurrence_in_hours_ : recurrence_in_hours) () =
  ({
     volume_ar_n = volume_ar_n_;
     start_at = start_at_;
     recurrence_in_hours = recurrence_in_hours_;
     description = description_;
     tags = tags_;
   }
    : update_snapshot_schedule_input)

let make_update_smb_security_strategy_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) ()
    =
  ({ gateway_ar_n = gateway_ar_n_ } : update_smb_security_strategy_output)

let make_update_smb_security_strategy_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~smb_security_strategy:(smb_security_strategy_ : smb_security_strategy) () =
  ({ gateway_ar_n = gateway_ar_n_; smb_security_strategy = smb_security_strategy_ }
    : update_smb_security_strategy_input)

let make_update_smb_local_groups_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_smb_local_groups_output)

let make_update_smb_local_groups_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~smb_local_groups:(smb_local_groups_ : smb_local_groups) () =
  ({ gateway_ar_n = gateway_ar_n_; smb_local_groups = smb_local_groups_ }
    : update_smb_local_groups_input)

let make_update_smb_file_share_visibility_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_smb_file_share_visibility_output)

let make_update_smb_file_share_visibility_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~file_shares_visible:(file_shares_visible_ : boolean_) () =
  ({ gateway_ar_n = gateway_ar_n_; file_shares_visible = file_shares_visible_ }
    : update_smb_file_share_visibility_input)

let make_update_smb_file_share_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    () =
  ({ file_share_ar_n = file_share_ar_n_ } : update_smb_file_share_output)

let make_update_smb_file_share_input ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option) ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option)
    ?smbacl_enabled:(smbacl_enabled_ : boolean_ option)
    ?access_based_enumeration:(access_based_enumeration_ : boolean_ option)
    ?admin_user_list:(admin_user_list_ : user_list option)
    ?valid_user_list:(valid_user_list_ : user_list option)
    ?invalid_user_list:(invalid_user_list_ : user_list option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?case_sensitivity:(case_sensitivity_ : case_sensitivity option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?oplocks_enabled:(oplocks_enabled_ : boolean_ option)
    ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n) () =
  ({
     file_share_ar_n = file_share_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     smbacl_enabled = smbacl_enabled_;
     access_based_enumeration = access_based_enumeration_;
     admin_user_list = admin_user_list_;
     valid_user_list = valid_user_list_;
     invalid_user_list = invalid_user_list_;
     audit_destination_ar_n = audit_destination_ar_n_;
     case_sensitivity = case_sensitivity_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     oplocks_enabled = oplocks_enabled_;
   }
    : update_smb_file_share_input)

let make_update_nfs_file_share_output ?file_share_ar_n:(file_share_ar_n_ : file_share_ar_n option)
    () =
  ({ file_share_ar_n = file_share_ar_n_ } : update_nfs_file_share_output)

let make_update_nfs_file_share_input ?encryption_type:(encryption_type_ : encryption_type option)
    ?kms_encrypted:(kms_encrypted_ : boolean_ option) ?kms_key:(kms_key_ : kms_key option)
    ?nfs_file_share_defaults:(nfs_file_share_defaults_ : nfs_file_share_defaults option)
    ?default_storage_class:(default_storage_class_ : storage_class option)
    ?object_ac_l:(object_ac_l_ : object_ac_l option)
    ?client_list:(client_list_ : file_share_client_list option) ?squash:(squash_ : squash option)
    ?read_only:(read_only_ : boolean_ option)
    ?guess_mime_type_enabled:(guess_mime_type_enabled_ : boolean_ option)
    ?requester_pays:(requester_pays_ : boolean_ option)
    ?file_share_name:(file_share_name_ : file_share_name option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ?notification_policy:(notification_policy_ : notification_policy option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ~file_share_ar_n:(file_share_ar_n_ : file_share_ar_n) () =
  ({
     file_share_ar_n = file_share_ar_n_;
     encryption_type = encryption_type_;
     kms_encrypted = kms_encrypted_;
     kms_key = kms_key_;
     nfs_file_share_defaults = nfs_file_share_defaults_;
     default_storage_class = default_storage_class_;
     object_ac_l = object_ac_l_;
     client_list = client_list_;
     squash = squash_;
     read_only = read_only_;
     guess_mime_type_enabled = guess_mime_type_enabled_;
     requester_pays = requester_pays_;
     file_share_name = file_share_name_;
     cache_attributes = cache_attributes_;
     notification_policy = notification_policy_;
     audit_destination_ar_n = audit_destination_ar_n_;
   }
    : update_nfs_file_share_input)

let make_update_maintenance_start_time_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) ()
    =
  ({ gateway_ar_n = gateway_ar_n_ } : update_maintenance_start_time_output)

let make_update_maintenance_start_time_input ?hour_of_day:(hour_of_day_ : hour_of_day option)
    ?minute_of_hour:(minute_of_hour_ : minute_of_hour option)
    ?day_of_week:(day_of_week_ : day_of_week option)
    ?day_of_month:(day_of_month_ : day_of_month option)
    ?software_update_preferences:(software_update_preferences_ : software_update_preferences option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     hour_of_day = hour_of_day_;
     minute_of_hour = minute_of_hour_;
     day_of_week = day_of_week_;
     day_of_month = day_of_month_;
     software_update_preferences = software_update_preferences_;
   }
    : update_maintenance_start_time_input)

let make_update_gateway_software_now_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_gateway_software_now_output)

let make_update_gateway_software_now_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_gateway_software_now_input)

let make_update_gateway_information_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option)
    ?gateway_name:(gateway_name_ : string_ option) () =
  ({ gateway_ar_n = gateway_ar_n_; gateway_name = gateway_name_ }
    : update_gateway_information_output)

let make_update_gateway_information_input ?gateway_name:(gateway_name_ : gateway_name option)
    ?gateway_timezone:(gateway_timezone_ : gateway_timezone option)
    ?cloud_watch_log_group_ar_n:(cloud_watch_log_group_ar_n_ : cloud_watch_log_group_ar_n option)
    ?gateway_capacity:(gateway_capacity_ : gateway_capacity option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     gateway_name = gateway_name_;
     gateway_timezone = gateway_timezone_;
     cloud_watch_log_group_ar_n = cloud_watch_log_group_ar_n_;
     gateway_capacity = gateway_capacity_;
   }
    : update_gateway_information_input)

let make_update_file_system_association_output
    ?file_system_association_ar_n:
      (file_system_association_ar_n_ : file_system_association_ar_n option) () =
  ({ file_system_association_ar_n = file_system_association_ar_n_ }
    : update_file_system_association_output)

let make_update_file_system_association_input ?user_name:(user_name_ : domain_user_name option)
    ?password:(password_ : domain_user_password option)
    ?audit_destination_ar_n:(audit_destination_ar_n_ : audit_destination_ar_n option)
    ?cache_attributes:(cache_attributes_ : cache_attributes option)
    ~file_system_association_ar_n:(file_system_association_ar_n_ : file_system_association_ar_n) ()
    =
  ({
     file_system_association_ar_n = file_system_association_ar_n_;
     user_name = user_name_;
     password = password_;
     audit_destination_ar_n = audit_destination_ar_n_;
     cache_attributes = cache_attributes_;
   }
    : update_file_system_association_input)

let make_update_chap_credentials_output ?target_ar_n:(target_ar_n_ : target_ar_n option)
    ?initiator_name:(initiator_name_ : iqn_name option) () =
  ({ target_ar_n = target_ar_n_; initiator_name = initiator_name_ }
    : update_chap_credentials_output)

let make_update_chap_credentials_input
    ?secret_to_authenticate_target:(secret_to_authenticate_target_ : chap_secret option)
    ~target_ar_n:(target_ar_n_ : target_ar_n)
    ~secret_to_authenticate_initiator:(secret_to_authenticate_initiator_ : chap_secret)
    ~initiator_name:(initiator_name_ : iqn_name) () =
  ({
     target_ar_n = target_ar_n_;
     secret_to_authenticate_initiator = secret_to_authenticate_initiator_;
     initiator_name = initiator_name_;
     secret_to_authenticate_target = secret_to_authenticate_target_;
   }
    : update_chap_credentials_input)

let make_update_bandwidth_rate_limit_schedule_output
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_bandwidth_rate_limit_schedule_output)

let make_update_bandwidth_rate_limit_schedule_input ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n)
    ~bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_;
   }
    : update_bandwidth_rate_limit_schedule_input)

let make_update_bandwidth_rate_limit_output ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_bandwidth_rate_limit_output)

let make_update_bandwidth_rate_limit_input
    ?average_upload_rate_limit_in_bits_per_sec:
      (average_upload_rate_limit_in_bits_per_sec_ : bandwidth_upload_rate_limit option)
    ?average_download_rate_limit_in_bits_per_sec:
      (average_download_rate_limit_in_bits_per_sec_ : bandwidth_download_rate_limit option)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({
     gateway_ar_n = gateway_ar_n_;
     average_upload_rate_limit_in_bits_per_sec = average_upload_rate_limit_in_bits_per_sec_;
     average_download_rate_limit_in_bits_per_sec = average_download_rate_limit_in_bits_per_sec_;
   }
    : update_bandwidth_rate_limit_input)

let make_update_automatic_tape_creation_policy_output
    ?gateway_ar_n:(gateway_ar_n_ : gateway_ar_n option) () =
  ({ gateway_ar_n = gateway_ar_n_ } : update_automatic_tape_creation_policy_output)

let make_update_automatic_tape_creation_policy_input
    ~automatic_tape_creation_rules:(automatic_tape_creation_rules_ : automatic_tape_creation_rules)
    ~gateway_ar_n:(gateway_ar_n_ : gateway_ar_n) () =
  ({ automatic_tape_creation_rules = automatic_tape_creation_rules_; gateway_ar_n = gateway_ar_n_ }
    : update_automatic_tape_creation_policy_input)
