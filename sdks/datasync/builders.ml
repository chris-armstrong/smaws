open Types

let make_update_task_response () = (() : unit)

let make_options ?object_tags:(object_tags_ : object_tags option)
    ?security_descriptor_copy_flags:
      (security_descriptor_copy_flags_ : smb_security_descriptor_copy_flags option)
    ?transfer_mode:(transfer_mode_ : transfer_mode option)
    ?log_level:(log_level_ : log_level option)
    ?task_queueing:(task_queueing_ : task_queueing option)
    ?bytes_per_second:(bytes_per_second_ : bytes_per_second option)
    ?posix_permissions:(posix_permissions_ : posix_permissions option)
    ?preserve_devices:(preserve_devices_ : preserve_devices option)
    ?preserve_deleted_files:(preserve_deleted_files_ : preserve_deleted_files option)
    ?gid:(gid_ : gid option) ?uid:(uid_ : uid option) ?mtime:(mtime_ : mtime option)
    ?atime:(atime_ : atime option) ?overwrite_mode:(overwrite_mode_ : overwrite_mode option)
    ?verify_mode:(verify_mode_ : verify_mode option) () =
  ({
     object_tags = object_tags_;
     security_descriptor_copy_flags = security_descriptor_copy_flags_;
     transfer_mode = transfer_mode_;
     log_level = log_level_;
     task_queueing = task_queueing_;
     bytes_per_second = bytes_per_second_;
     posix_permissions = posix_permissions_;
     preserve_devices = preserve_devices_;
     preserve_deleted_files = preserve_deleted_files_;
     gid = gid_;
     uid = uid_;
     mtime = mtime_;
     atime = atime_;
     overwrite_mode = overwrite_mode_;
     verify_mode = verify_mode_;
   }
    : options)

let make_filter_rule ?value:(value_ : filter_value option)
    ?filter_type:(filter_type_ : filter_type option) () =
  ({ value = value_; filter_type = filter_type_ } : filter_rule)

let make_task_schedule ?status:(status_ : schedule_status option)
    ~schedule_expression:(schedule_expression_ : schedule_expression_cron) () =
  ({ status = status_; schedule_expression = schedule_expression_ } : task_schedule)

let make_s3_manifest_config
    ?manifest_object_version_id:(manifest_object_version_id_ : s3_object_version_id option)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn)
    ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn)
    ~manifest_object_path:(manifest_object_path_ : s3_subdirectory) () =
  ({
     manifest_object_version_id = manifest_object_version_id_;
     s3_bucket_arn = s3_bucket_arn_;
     bucket_access_role_arn = bucket_access_role_arn_;
     manifest_object_path = manifest_object_path_;
   }
    : s3_manifest_config)

let make_source_manifest_config ~s3:(s3_ : s3_manifest_config) () =
  ({ s3 = s3_ } : source_manifest_config)

let make_manifest_config ?source:(source_ : source_manifest_config option)
    ?format:(format_ : manifest_format option) ?action:(action_ : manifest_action option) () =
  ({ source = source_; format = format_; action = action_ } : manifest_config)

let make_report_destination_s3 ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn) () =
  ({
     bucket_access_role_arn = bucket_access_role_arn_;
     s3_bucket_arn = s3_bucket_arn_;
     subdirectory = subdirectory_;
   }
    : report_destination_s3)

let make_report_destination ?s3:(s3_ : report_destination_s3 option) () =
  ({ s3 = s3_ } : report_destination)

let make_report_override ?report_level:(report_level_ : report_level option) () =
  ({ report_level = report_level_ } : report_override)

let make_report_overrides ?skipped:(skipped_ : report_override option)
    ?deleted:(deleted_ : report_override option) ?verified:(verified_ : report_override option)
    ?transferred:(transferred_ : report_override option) () =
  ({ skipped = skipped_; deleted = deleted_; verified = verified_; transferred = transferred_ }
    : report_overrides)

let make_task_report_config ?overrides:(overrides_ : report_overrides option)
    ?object_version_ids:(object_version_ids_ : object_version_ids option)
    ?report_level:(report_level_ : report_level option)
    ?output_type:(output_type_ : report_output_type option)
    ?destination:(destination_ : report_destination option) () =
  ({
     overrides = overrides_;
     object_version_ids = object_version_ids_;
     report_level = report_level_;
     output_type = output_type_;
     destination = destination_;
   }
    : task_report_config)

let make_update_task_request ?task_report_config:(task_report_config_ : task_report_config option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?includes:(includes_ : filter_list option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ?name:(name_ : tag_value option) ?schedule:(schedule_ : task_schedule option)
    ?excludes:(excludes_ : filter_list option) ?options:(options_ : options option)
    ~task_arn:(task_arn_ : task_arn) () =
  ({
     task_report_config = task_report_config_;
     manifest_config = manifest_config_;
     includes = includes_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     name = name_;
     schedule = schedule_;
     excludes = excludes_;
     options = options_;
     task_arn = task_arn_;
   }
    : update_task_request)

let make_update_task_execution_response () = (() : unit)

let make_update_task_execution_request ~options:(options_ : options)
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) () =
  ({ options = options_; task_execution_arn = task_execution_arn_ } : update_task_execution_request)

let make_update_location_smb_response () = (() : unit)

let make_cmk_secret_config ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ kms_key_arn = kms_key_arn_; secret_arn = secret_arn_ } : cmk_secret_config)

let make_custom_secret_config
    ?secret_access_role_arn:(secret_access_role_arn_ : iam_role_arn_or_empty_string option)
    ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ secret_access_role_arn = secret_access_role_arn_; secret_arn = secret_arn_ }
    : custom_secret_config)

let make_smb_mount_options ?version:(version_ : smb_version option) () =
  ({ version = version_ } : smb_mount_options)

let make_update_location_smb_request
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?mount_options:(mount_options_ : smb_mount_options option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?password:(password_ : smb_password option) ?domain:(domain_ : smb_domain option)
    ?user:(user_ : smb_user option) ?server_hostname:(server_hostname_ : server_hostname option)
    ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     kerberos_krb5_conf = kerberos_krb5_conf_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_principal = kerberos_principal_;
     dns_ip_addresses = dns_ip_addresses_;
     authentication_type = authentication_type_;
     mount_options = mount_options_;
     agent_arns = agent_arns_;
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     password = password_;
     domain = domain_;
     user = user_;
     server_hostname = server_hostname_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_smb_request)

let make_update_location_s3_response () = (() : unit)

let make_s3_config ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn) () =
  ({ bucket_access_role_arn = bucket_access_role_arn_ } : s3_config)

let make_update_location_s3_request ?s3_config:(s3_config_ : s3_config option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     s3_config = s3_config_;
     s3_storage_class = s3_storage_class_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_s3_request)

let make_update_location_object_storage_response () = (() : unit)

let make_update_location_object_storage_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?secret_key:(secret_key_ : object_storage_secret_key option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?server_hostname:(server_hostname_ : server_hostname option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?server_port:(server_port_ : object_storage_server_port option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     server_certificate = server_certificate_;
     agent_arns = agent_arns_;
     secret_key = secret_key_;
     access_key = access_key_;
     server_hostname = server_hostname_;
     subdirectory = subdirectory_;
     server_protocol = server_protocol_;
     server_port = server_port_;
     location_arn = location_arn_;
   }
    : update_location_object_storage_request)

let make_update_location_nfs_response () = (() : unit)

let make_on_prem_config ~agent_arns:(agent_arns_ : agent_arn_list) () =
  ({ agent_arns = agent_arns_ } : on_prem_config)

let make_nfs_mount_options ?version:(version_ : nfs_version option) () =
  ({ version = version_ } : nfs_mount_options)

let make_update_location_nfs_request ?mount_options:(mount_options_ : nfs_mount_options option)
    ?on_prem_config:(on_prem_config_ : on_prem_config option)
    ?server_hostname:(server_hostname_ : server_hostname option)
    ?subdirectory:(subdirectory_ : nfs_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     mount_options = mount_options_;
     on_prem_config = on_prem_config_;
     server_hostname = server_hostname_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_nfs_request)

let make_update_location_hdfs_response () = (() : unit)

let make_hdfs_name_node ~port:(port_ : hdfs_server_port)
    ~hostname:(hostname_ : hdfs_server_hostname) () =
  ({ port = port_; hostname = hostname_ } : hdfs_name_node)

let make_qop_configuration
    ?data_transfer_protection:(data_transfer_protection_ : hdfs_data_transfer_protection option)
    ?rpc_protection:(rpc_protection_ : hdfs_rpc_protection option) () =
  ({ data_transfer_protection = data_transfer_protection_; rpc_protection = rpc_protection_ }
    : qop_configuration)

let make_update_location_hdfs_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?authentication_type:(authentication_type_ : hdfs_authentication_type option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?name_nodes:(name_nodes_ : hdfs_name_node_list option)
    ?subdirectory:(subdirectory_ : hdfs_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     agent_arns = agent_arns_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_principal = kerberos_principal_;
     simple_user = simple_user_;
     authentication_type = authentication_type_;
     qop_configuration = qop_configuration_;
     kms_key_provider_uri = kms_key_provider_uri_;
     replication_factor = replication_factor_;
     block_size = block_size_;
     name_nodes = name_nodes_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_hdfs_request)

let make_update_location_fsx_windows_response () = (() : unit)

let make_update_location_fsx_windows_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?password:(password_ : smb_password option) ?user:(user_ : smb_user option)
    ?domain:(domain_ : update_smb_domain option)
    ?subdirectory:(subdirectory_ : fsx_windows_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     password = password_;
     user = user_;
     domain = domain_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_fsx_windows_request)

let make_update_location_fsx_open_zfs_response () = (() : unit)

let make_fsx_protocol_nfs ?mount_options:(mount_options_ : nfs_mount_options option) () =
  ({ mount_options = mount_options_ } : fsx_protocol_nfs)

let make_managed_secret_config ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ secret_arn = secret_arn_ } : managed_secret_config)

let make_fsx_protocol_smb
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?password:(password_ : smb_password option)
    ?mount_options:(mount_options_ : smb_mount_options option) ?domain:(domain_ : smb_domain option)
    ~user:(user_ : smb_user) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     user = user_;
     password = password_;
     mount_options = mount_options_;
     domain = domain_;
   }
    : fsx_protocol_smb)

let make_fsx_protocol ?sm_b:(sm_b_ : fsx_protocol_smb option)
    ?nf_s:(nf_s_ : fsx_protocol_nfs option) () =
  ({ sm_b = sm_b_; nf_s = nf_s_ } : fsx_protocol)

let make_update_location_fsx_open_zfs_request
    ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ?protocol:(protocol_ : fsx_protocol option) ~location_arn:(location_arn_ : location_arn) () =
  ({ subdirectory = subdirectory_; protocol = protocol_; location_arn = location_arn_ }
    : update_location_fsx_open_zfs_request)

let make_update_location_fsx_ontap_response () = (() : unit)

let make_fsx_update_protocol_smb
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?user:(user_ : smb_user option) ?password:(password_ : smb_password option)
    ?mount_options:(mount_options_ : smb_mount_options option)
    ?domain:(domain_ : update_smb_domain option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     user = user_;
     password = password_;
     mount_options = mount_options_;
     domain = domain_;
   }
    : fsx_update_protocol_smb)

let make_fsx_update_protocol ?sm_b:(sm_b_ : fsx_update_protocol_smb option)
    ?nf_s:(nf_s_ : fsx_protocol_nfs option) () =
  ({ sm_b = sm_b_; nf_s = nf_s_ } : fsx_update_protocol)

let make_update_location_fsx_ontap_request
    ?subdirectory:(subdirectory_ : fsx_ontap_subdirectory option)
    ?protocol:(protocol_ : fsx_update_protocol option) ~location_arn:(location_arn_ : location_arn)
    () =
  ({ subdirectory = subdirectory_; protocol = protocol_; location_arn = location_arn_ }
    : update_location_fsx_ontap_request)

let make_update_location_fsx_lustre_response () = (() : unit)

let make_update_location_fsx_lustre_request ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({ subdirectory = subdirectory_; location_arn = location_arn_ }
    : update_location_fsx_lustre_request)

let make_update_location_efs_response () = (() : unit)

let make_update_location_efs_request
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : updated_efs_iam_role_arn option)
    ?access_point_arn:(access_point_arn_ : updated_efs_access_point_arn option)
    ?subdirectory:(subdirectory_ : efs_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     in_transit_encryption = in_transit_encryption_;
     file_system_access_role_arn = file_system_access_role_arn_;
     access_point_arn = access_point_arn_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_efs_request)

let make_update_location_azure_blob_response () = (() : unit)

let make_azure_blob_sas_configuration ~token:(token_ : azure_blob_sas_token) () =
  ({ token = token_ } : azure_blob_sas_configuration)

let make_update_location_azure_blob_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?sas_configuration:(sas_configuration_ : azure_blob_sas_configuration option)
    ?authentication_type:(authentication_type_ : azure_blob_authentication_type option)
    ?subdirectory:(subdirectory_ : azure_blob_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     agent_arns = agent_arns_;
     access_tier = access_tier_;
     blob_type = blob_type_;
     sas_configuration = sas_configuration_;
     authentication_type = authentication_type_;
     subdirectory = subdirectory_;
     location_arn = location_arn_;
   }
    : update_location_azure_blob_request)

let make_update_agent_response () = (() : unit)

let make_update_agent_request ?name:(name_ : tag_value option) ~agent_arn:(agent_arn_ : agent_arn)
    () =
  ({ name = name_; agent_arn = agent_arn_ } : update_agent_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~keys:(keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ keys = keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_task_schedule_details ?disabled_by:(disabled_by_ : schedule_disabled_by option)
    ?disabled_reason:(disabled_reason_ : schedule_disabled_reason option)
    ?status_update_time:(status_update_time_ : time option) () =
  ({
     disabled_by = disabled_by_;
     disabled_reason = disabled_reason_;
     status_update_time = status_update_time_;
   }
    : task_schedule_details)

let make_task_list_entry ?task_mode:(task_mode_ : task_mode option) ?name:(name_ : tag_value option)
    ?status:(status_ : task_status option) ?task_arn:(task_arn_ : task_arn option) () =
  ({ task_mode = task_mode_; name = name_; status = status_; task_arn = task_arn_ }
    : task_list_entry)

let make_task_filter ~operator:(operator_ : operator) ~values:(values_ : filter_values)
    ~name:(name_ : task_filter_name) () =
  ({ operator = operator_; values = values_; name = name_ } : task_filter)

let make_task_execution_result_detail ?error_detail:(error_detail_ : string_ option)
    ?error_code:(error_code_ : string_ option) ?verify_status:(verify_status_ : phase_status option)
    ?verify_duration:(verify_duration_ : duration option)
    ?transfer_status:(transfer_status_ : phase_status option)
    ?transfer_duration:(transfer_duration_ : duration option)
    ?total_duration:(total_duration_ : duration option)
    ?prepare_status:(prepare_status_ : phase_status option)
    ?prepare_duration:(prepare_duration_ : duration option) () =
  ({
     error_detail = error_detail_;
     error_code = error_code_;
     verify_status = verify_status_;
     verify_duration = verify_duration_;
     transfer_status = transfer_status_;
     transfer_duration = transfer_duration_;
     total_duration = total_duration_;
     prepare_status = prepare_status_;
     prepare_duration = prepare_duration_;
   }
    : task_execution_result_detail)

let make_task_execution_list_entry ?task_mode:(task_mode_ : task_mode option)
    ?status:(status_ : task_execution_status option)
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option) () =
  ({ task_mode = task_mode_; status = status_; task_execution_arn = task_execution_arn_ }
    : task_execution_list_entry)

let make_task_execution_folders_listed_detail
    ?at_destination_for_delete:(at_destination_for_delete_ : long option)
    ?at_source:(at_source_ : long option) () =
  ({ at_destination_for_delete = at_destination_for_delete_; at_source = at_source_ }
    : task_execution_folders_listed_detail)

let make_task_execution_folders_failed_detail ?delete:(delete_ : long option)
    ?verify:(verify_ : long option) ?transfer:(transfer_ : long option)
    ?prepare:(prepare_ : long option) ?list_:(list__ : long option) () =
  ({ delete = delete_; verify = verify_; transfer = transfer_; prepare = prepare_; list_ = list__ }
    : task_execution_folders_failed_detail)

let make_task_execution_files_listed_detail
    ?at_destination_for_delete:(at_destination_for_delete_ : long option)
    ?at_source:(at_source_ : long option) () =
  ({ at_destination_for_delete = at_destination_for_delete_; at_source = at_source_ }
    : task_execution_files_listed_detail)

let make_task_execution_files_failed_detail ?delete:(delete_ : long option)
    ?verify:(verify_ : long option) ?transfer:(transfer_ : long option)
    ?prepare:(prepare_ : long option) () =
  ({ delete = delete_; verify = verify_; transfer = transfer_; prepare = prepare_ }
    : task_execution_files_failed_detail)

let make_tag_resource_response () = (() : unit)

let make_tag_list_entry ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag_list_entry)

let make_tag_resource_request ~tags:(tags_ : input_tag_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_start_task_execution_response
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option) () =
  ({ task_execution_arn = task_execution_arn_ } : start_task_execution_response)

let make_start_task_execution_request ?tags:(tags_ : input_tag_list option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?excludes:(excludes_ : filter_list option) ?includes:(includes_ : filter_list option)
    ?override_options:(override_options_ : options option) ~task_arn:(task_arn_ : task_arn) () =
  ({
     tags = tags_;
     task_report_config = task_report_config_;
     manifest_config = manifest_config_;
     excludes = excludes_;
     includes = includes_;
     override_options = override_options_;
     task_arn = task_arn_;
   }
    : start_task_execution_request)

let make_private_link_config
    ?security_group_arns:(security_group_arns_ : pl_security_group_arn_list option)
    ?subnet_arns:(subnet_arns_ : pl_subnet_arn_list option)
    ?private_link_endpoint:(private_link_endpoint_ : endpoint option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option) () =
  ({
     security_group_arns = security_group_arns_;
     subnet_arns = subnet_arns_;
     private_link_endpoint = private_link_endpoint_;
     vpc_endpoint_id = vpc_endpoint_id_;
   }
    : private_link_config)

let make_platform ?version:(version_ : agent_version option) () =
  ({ version = version_ } : platform)

let make_location_list_entry ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_uri = location_uri_; location_arn = location_arn_ } : location_list_entry)

let make_location_filter ~operator:(operator_ : operator) ~values:(values_ : filter_values)
    ~name:(name_ : location_filter_name) () =
  ({ operator = operator_; values = values_; name = name_ } : location_filter)

let make_list_tasks_response ?next_token:(next_token_ : next_token option)
    ?tasks:(tasks_ : task_list option) () =
  ({ next_token = next_token_; tasks = tasks_ } : list_tasks_response)

let make_list_tasks_request ?filters:(filters_ : task_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_tasks_request)

let make_list_task_executions_response ?next_token:(next_token_ : next_token option)
    ?task_executions:(task_executions_ : task_execution_list option) () =
  ({ next_token = next_token_; task_executions = task_executions_ } : list_task_executions_response)

let make_list_task_executions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?task_arn:(task_arn_ : task_arn option) () =
  ({ next_token = next_token_; max_results = max_results_; task_arn = task_arn_ }
    : list_task_executions_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : output_tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ next_token = next_token_; max_results = max_results_; resource_arn = resource_arn_ }
    : list_tags_for_resource_request)

let make_list_locations_response ?next_token:(next_token_ : next_token option)
    ?locations:(locations_ : location_list option) () =
  ({ next_token = next_token_; locations = locations_ } : list_locations_response)

let make_list_locations_request ?filters:(filters_ : location_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_locations_request)

let make_agent_list_entry ?platform:(platform_ : platform option)
    ?status:(status_ : agent_status option) ?name:(name_ : tag_value option)
    ?agent_arn:(agent_arn_ : agent_arn option) () =
  ({ platform = platform_; status = status_; name = name_; agent_arn = agent_arn_ }
    : agent_list_entry)

let make_list_agents_response ?next_token:(next_token_ : next_token option)
    ?agents:(agents_ : agent_list option) () =
  ({ next_token = next_token_; agents = agents_ } : list_agents_response)

let make_list_agents_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_agents_request)

let make_describe_task_execution_response ?end_time:(end_time_ : time option)
    ?launch_time:(launch_time_ : time option)
    ?folders_failed:(folders_failed_ : task_execution_folders_failed_detail option)
    ?folders_listed:(folders_listed_ : task_execution_folders_listed_detail option)
    ?folders_deleted:(folders_deleted_ : item_count option)
    ?folders_verified:(folders_verified_ : item_count option)
    ?folders_transferred:(folders_transferred_ : item_count option)
    ?folders_prepared:(folders_prepared_ : item_count option)
    ?folders_skipped:(folders_skipped_ : item_count option)
    ?estimated_folders_to_transfer:(estimated_folders_to_transfer_ : item_count option)
    ?estimated_folders_to_delete:(estimated_folders_to_delete_ : item_count option)
    ?files_failed:(files_failed_ : task_execution_files_failed_detail option)
    ?files_listed:(files_listed_ : task_execution_files_listed_detail option)
    ?files_prepared:(files_prepared_ : long option) ?task_mode:(task_mode_ : task_mode option)
    ?estimated_files_to_delete:(estimated_files_to_delete_ : long option)
    ?report_result:(report_result_ : report_result option)
    ?files_verified:(files_verified_ : long option) ?files_skipped:(files_skipped_ : long option)
    ?files_deleted:(files_deleted_ : long option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?result_:(result__ : task_execution_result_detail option)
    ?bytes_compressed:(bytes_compressed_ : long option)
    ?bytes_transferred:(bytes_transferred_ : long option)
    ?bytes_written:(bytes_written_ : long option)
    ?files_transferred:(files_transferred_ : long option)
    ?estimated_bytes_to_transfer:(estimated_bytes_to_transfer_ : long option)
    ?estimated_files_to_transfer:(estimated_files_to_transfer_ : long option)
    ?start_time:(start_time_ : time option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?includes:(includes_ : filter_list option) ?excludes:(excludes_ : filter_list option)
    ?options:(options_ : options option) ?status:(status_ : task_execution_status option)
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option) () =
  ({
     end_time = end_time_;
     launch_time = launch_time_;
     folders_failed = folders_failed_;
     folders_listed = folders_listed_;
     folders_deleted = folders_deleted_;
     folders_verified = folders_verified_;
     folders_transferred = folders_transferred_;
     folders_prepared = folders_prepared_;
     folders_skipped = folders_skipped_;
     estimated_folders_to_transfer = estimated_folders_to_transfer_;
     estimated_folders_to_delete = estimated_folders_to_delete_;
     files_failed = files_failed_;
     files_listed = files_listed_;
     files_prepared = files_prepared_;
     task_mode = task_mode_;
     estimated_files_to_delete = estimated_files_to_delete_;
     report_result = report_result_;
     files_verified = files_verified_;
     files_skipped = files_skipped_;
     files_deleted = files_deleted_;
     task_report_config = task_report_config_;
     result_ = result__;
     bytes_compressed = bytes_compressed_;
     bytes_transferred = bytes_transferred_;
     bytes_written = bytes_written_;
     files_transferred = files_transferred_;
     estimated_bytes_to_transfer = estimated_bytes_to_transfer_;
     estimated_files_to_transfer = estimated_files_to_transfer_;
     start_time = start_time_;
     manifest_config = manifest_config_;
     includes = includes_;
     excludes = excludes_;
     options = options_;
     status = status_;
     task_execution_arn = task_execution_arn_;
   }
    : describe_task_execution_response)

let make_describe_task_execution_request
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) () =
  ({ task_execution_arn = task_execution_arn_ } : describe_task_execution_request)

let make_describe_task_response ?task_mode:(task_mode_ : task_mode option)
    ?schedule_details:(schedule_details_ : task_schedule_details option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?includes:(includes_ : filter_list option) ?creation_time:(creation_time_ : time option)
    ?error_detail:(error_detail_ : string_ option) ?error_code:(error_code_ : string_ option)
    ?schedule:(schedule_ : task_schedule option) ?excludes:(excludes_ : filter_list option)
    ?options:(options_ : options option)
    ?destination_network_interface_arns:
      (destination_network_interface_arns_ : destination_network_interface_arns option)
    ?source_network_interface_arns:
      (source_network_interface_arns_ : source_network_interface_arns option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ?destination_location_arn:(destination_location_arn_ : location_arn option)
    ?source_location_arn:(source_location_arn_ : location_arn option)
    ?current_task_execution_arn:(current_task_execution_arn_ : task_execution_arn option)
    ?name:(name_ : tag_value option) ?status:(status_ : task_status option)
    ?task_arn:(task_arn_ : task_arn option) () =
  ({
     task_mode = task_mode_;
     schedule_details = schedule_details_;
     task_report_config = task_report_config_;
     manifest_config = manifest_config_;
     includes = includes_;
     creation_time = creation_time_;
     error_detail = error_detail_;
     error_code = error_code_;
     schedule = schedule_;
     excludes = excludes_;
     options = options_;
     destination_network_interface_arns = destination_network_interface_arns_;
     source_network_interface_arns = source_network_interface_arns_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     destination_location_arn = destination_location_arn_;
     source_location_arn = source_location_arn_;
     current_task_execution_arn = current_task_execution_arn_;
     name = name_;
     status = status_;
     task_arn = task_arn_;
   }
    : describe_task_response)

let make_describe_task_request ~task_arn:(task_arn_ : task_arn) () =
  ({ task_arn = task_arn_ } : describe_task_request)

let make_describe_location_smb_response
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?creation_time:(creation_time_ : time option)
    ?mount_options:(mount_options_ : smb_mount_options option) ?domain:(domain_ : smb_domain option)
    ?user:(user_ : smb_user option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     authentication_type = authentication_type_;
     kerberos_principal = kerberos_principal_;
     dns_ip_addresses = dns_ip_addresses_;
     creation_time = creation_time_;
     mount_options = mount_options_;
     domain = domain_;
     user = user_;
     agent_arns = agent_arns_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_smb_response)

let make_describe_location_smb_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_smb_request)

let make_describe_location_s3_response ?creation_time:(creation_time_ : time option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?s3_config:(s3_config_ : s3_config option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     creation_time = creation_time_;
     agent_arns = agent_arns_;
     s3_config = s3_config_;
     s3_storage_class = s3_storage_class_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_s3_response)

let make_describe_location_s3_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_s3_request)

let make_describe_location_object_storage_response
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?creation_time:(creation_time_ : time option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?server_port:(server_port_ : object_storage_server_port option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     server_certificate = server_certificate_;
     creation_time = creation_time_;
     agent_arns = agent_arns_;
     server_protocol = server_protocol_;
     server_port = server_port_;
     access_key = access_key_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_object_storage_response)

let make_describe_location_object_storage_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_object_storage_request)

let make_describe_location_nfs_response ?creation_time:(creation_time_ : time option)
    ?mount_options:(mount_options_ : nfs_mount_options option)
    ?on_prem_config:(on_prem_config_ : on_prem_config option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     creation_time = creation_time_;
     mount_options = mount_options_;
     on_prem_config = on_prem_config_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_nfs_response)

let make_describe_location_nfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_nfs_request)

let make_describe_location_hdfs_response
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?creation_time:(creation_time_ : time option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?authentication_type:(authentication_type_ : hdfs_authentication_type option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?name_nodes:(name_nodes_ : hdfs_name_node_list option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     creation_time = creation_time_;
     agent_arns = agent_arns_;
     kerberos_principal = kerberos_principal_;
     simple_user = simple_user_;
     authentication_type = authentication_type_;
     qop_configuration = qop_configuration_;
     kms_key_provider_uri = kms_key_provider_uri_;
     replication_factor = replication_factor_;
     block_size = block_size_;
     name_nodes = name_nodes_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_hdfs_response)

let make_describe_location_hdfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_hdfs_request)

let make_describe_location_fsx_windows_response
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?domain:(domain_ : smb_domain option) ?user:(user_ : smb_user option)
    ?creation_time:(creation_time_ : time option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     domain = domain_;
     user = user_;
     creation_time = creation_time_;
     security_group_arns = security_group_arns_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_fsx_windows_response)

let make_describe_location_fsx_windows_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_windows_request)

let make_describe_location_fsx_open_zfs_response ?creation_time:(creation_time_ : time option)
    ?protocol:(protocol_ : fsx_protocol option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     creation_time = creation_time_;
     protocol = protocol_;
     security_group_arns = security_group_arns_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_fsx_open_zfs_response)

let make_describe_location_fsx_open_zfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_open_zfs_request)

let make_describe_location_fsx_ontap_response
    ?fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn option)
    ?storage_virtual_machine_arn:(storage_virtual_machine_arn_ : storage_virtual_machine_arn option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?protocol:(protocol_ : fsx_protocol option) ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option)
    ?creation_time:(creation_time_ : time option) () =
  ({
     fsx_filesystem_arn = fsx_filesystem_arn_;
     storage_virtual_machine_arn = storage_virtual_machine_arn_;
     security_group_arns = security_group_arns_;
     protocol = protocol_;
     location_uri = location_uri_;
     location_arn = location_arn_;
     creation_time = creation_time_;
   }
    : describe_location_fsx_ontap_response)

let make_describe_location_fsx_ontap_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_ontap_request)

let make_describe_location_fsx_lustre_response ?creation_time:(creation_time_ : time option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     creation_time = creation_time_;
     security_group_arns = security_group_arns_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_fsx_lustre_response)

let make_describe_location_fsx_lustre_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_lustre_request)

let make_ec2_config ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~subnet_arn:(subnet_arn_ : ec2_subnet_arn) () =
  ({ security_group_arns = security_group_arns_; subnet_arn = subnet_arn_ } : ec2_config)

let make_describe_location_efs_response
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : iam_role_arn option)
    ?access_point_arn:(access_point_arn_ : efs_access_point_arn option)
    ?creation_time:(creation_time_ : time option) ?ec2_config:(ec2_config_ : ec2_config option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     in_transit_encryption = in_transit_encryption_;
     file_system_access_role_arn = file_system_access_role_arn_;
     access_point_arn = access_point_arn_;
     creation_time = creation_time_;
     ec2_config = ec2_config_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_efs_response)

let make_describe_location_efs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_efs_request)

let make_describe_location_azure_blob_response
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?creation_time:(creation_time_ : time option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?authentication_type:(authentication_type_ : azure_blob_authentication_type option)
    ?location_uri:(location_uri_ : location_uri option)
    ?location_arn:(location_arn_ : location_arn option) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     managed_secret_config = managed_secret_config_;
     creation_time = creation_time_;
     agent_arns = agent_arns_;
     access_tier = access_tier_;
     blob_type = blob_type_;
     authentication_type = authentication_type_;
     location_uri = location_uri_;
     location_arn = location_arn_;
   }
    : describe_location_azure_blob_response)

let make_describe_location_azure_blob_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_azure_blob_request)

let make_describe_agent_response ?platform:(platform_ : platform option)
    ?private_link_config:(private_link_config_ : private_link_config option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?creation_time:(creation_time_ : time option)
    ?last_connection_time:(last_connection_time_ : time option)
    ?status:(status_ : agent_status option) ?name:(name_ : tag_value option)
    ?agent_arn:(agent_arn_ : agent_arn option) () =
  ({
     platform = platform_;
     private_link_config = private_link_config_;
     endpoint_type = endpoint_type_;
     creation_time = creation_time_;
     last_connection_time = last_connection_time_;
     status = status_;
     name = name_;
     agent_arn = agent_arn_;
   }
    : describe_agent_response)

let make_describe_agent_request ~agent_arn:(agent_arn_ : agent_arn) () =
  ({ agent_arn = agent_arn_ } : describe_agent_request)

let make_delete_task_response () = (() : unit)

let make_delete_task_request ~task_arn:(task_arn_ : task_arn) () =
  ({ task_arn = task_arn_ } : delete_task_request)

let make_delete_location_response () = (() : unit)

let make_delete_location_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : delete_location_request)

let make_delete_agent_response () = (() : unit)

let make_delete_agent_request ~agent_arn:(agent_arn_ : agent_arn) () =
  ({ agent_arn = agent_arn_ } : delete_agent_request)

let make_create_task_response ?task_arn:(task_arn_ : task_arn option) () =
  ({ task_arn = task_arn_ } : create_task_response)

let make_create_task_request ?task_mode:(task_mode_ : task_mode option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?includes:(includes_ : filter_list option) ?tags:(tags_ : input_tag_list option)
    ?schedule:(schedule_ : task_schedule option) ?excludes:(excludes_ : filter_list option)
    ?options:(options_ : options option) ?name:(name_ : tag_value option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ~destination_location_arn:(destination_location_arn_ : location_arn)
    ~source_location_arn:(source_location_arn_ : location_arn) () =
  ({
     task_mode = task_mode_;
     task_report_config = task_report_config_;
     manifest_config = manifest_config_;
     includes = includes_;
     tags = tags_;
     schedule = schedule_;
     excludes = excludes_;
     options = options_;
     name = name_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     destination_location_arn = destination_location_arn_;
     source_location_arn = source_location_arn_;
   }
    : create_task_request)

let make_create_location_smb_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_smb_response)

let make_create_location_smb_request
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?tags:(tags_ : input_tag_list option) ?mount_options:(mount_options_ : smb_mount_options option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?password:(password_ : smb_password option) ?domain:(domain_ : smb_domain option)
    ?user:(user_ : smb_user option) ~agent_arns:(agent_arns_ : agent_arn_list)
    ~server_hostname:(server_hostname_ : server_hostname)
    ~subdirectory:(subdirectory_ : smb_subdirectory) () =
  ({
     kerberos_krb5_conf = kerberos_krb5_conf_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_principal = kerberos_principal_;
     dns_ip_addresses = dns_ip_addresses_;
     authentication_type = authentication_type_;
     tags = tags_;
     mount_options = mount_options_;
     agent_arns = agent_arns_;
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     password = password_;
     domain = domain_;
     user = user_;
     server_hostname = server_hostname_;
     subdirectory = subdirectory_;
   }
    : create_location_smb_request)

let make_create_location_s3_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_s3_response)

let make_create_location_s3_request ?tags:(tags_ : input_tag_list option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option) ~s3_config:(s3_config_ : s3_config)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn) () =
  ({
     tags = tags_;
     agent_arns = agent_arns_;
     s3_config = s3_config_;
     s3_storage_class = s3_storage_class_;
     s3_bucket_arn = s3_bucket_arn_;
     subdirectory = subdirectory_;
   }
    : create_location_s3_request)

let make_create_location_object_storage_response ?location_arn:(location_arn_ : location_arn option)
    () =
  ({ location_arn = location_arn_ } : create_location_object_storage_response)

let make_create_location_object_storage_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?tags:(tags_ : input_tag_list option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?secret_key:(secret_key_ : object_storage_secret_key option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?server_port:(server_port_ : object_storage_server_port option)
    ~bucket_name:(bucket_name_ : object_storage_bucket_name)
    ~server_hostname:(server_hostname_ : server_hostname) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     server_certificate = server_certificate_;
     tags = tags_;
     agent_arns = agent_arns_;
     secret_key = secret_key_;
     access_key = access_key_;
     bucket_name = bucket_name_;
     subdirectory = subdirectory_;
     server_protocol = server_protocol_;
     server_port = server_port_;
     server_hostname = server_hostname_;
   }
    : create_location_object_storage_request)

let make_create_location_nfs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_nfs_response)

let make_create_location_nfs_request ?tags:(tags_ : input_tag_list option)
    ?mount_options:(mount_options_ : nfs_mount_options option)
    ~on_prem_config:(on_prem_config_ : on_prem_config)
    ~server_hostname:(server_hostname_ : server_hostname)
    ~subdirectory:(subdirectory_ : nfs_subdirectory) () =
  ({
     tags = tags_;
     mount_options = mount_options_;
     on_prem_config = on_prem_config_;
     server_hostname = server_hostname_;
     subdirectory = subdirectory_;
   }
    : create_location_nfs_request)

let make_create_location_hdfs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_hdfs_response)

let make_create_location_hdfs_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?tags:(tags_ : input_tag_list option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?subdirectory:(subdirectory_ : hdfs_subdirectory option)
    ~agent_arns:(agent_arns_ : agent_arn_list)
    ~authentication_type:(authentication_type_ : hdfs_authentication_type)
    ~name_nodes:(name_nodes_ : hdfs_name_node_list) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     tags = tags_;
     agent_arns = agent_arns_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_principal = kerberos_principal_;
     simple_user = simple_user_;
     authentication_type = authentication_type_;
     qop_configuration = qop_configuration_;
     kms_key_provider_uri = kms_key_provider_uri_;
     replication_factor = replication_factor_;
     block_size = block_size_;
     name_nodes = name_nodes_;
     subdirectory = subdirectory_;
   }
    : create_location_hdfs_request)

let make_create_location_fsx_windows_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_fsx_windows_response)

let make_create_location_fsx_windows_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?password:(password_ : smb_password option) ?domain:(domain_ : smb_domain option)
    ?tags:(tags_ : input_tag_list option)
    ?subdirectory:(subdirectory_ : fsx_windows_subdirectory option) ~user:(user_ : smb_user)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     password = password_;
     domain = domain_;
     user = user_;
     tags = tags_;
     security_group_arns = security_group_arns_;
     fsx_filesystem_arn = fsx_filesystem_arn_;
     subdirectory = subdirectory_;
   }
    : create_location_fsx_windows_request)

let make_create_location_fsx_open_zfs_response ?location_arn:(location_arn_ : location_arn option)
    () =
  ({ location_arn = location_arn_ } : create_location_fsx_open_zfs_response)

let make_create_location_fsx_open_zfs_request ?tags:(tags_ : input_tag_list option)
    ?subdirectory:(subdirectory_ : fsx_open_zfs_subdirectory option)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~protocol:(protocol_ : fsx_protocol)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn) () =
  ({
     tags = tags_;
     subdirectory = subdirectory_;
     security_group_arns = security_group_arns_;
     protocol = protocol_;
     fsx_filesystem_arn = fsx_filesystem_arn_;
   }
    : create_location_fsx_open_zfs_request)

let make_create_location_fsx_ontap_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_fsx_ontap_response)

let make_create_location_fsx_ontap_request ?tags:(tags_ : input_tag_list option)
    ?subdirectory:(subdirectory_ : fsx_ontap_subdirectory option)
    ~storage_virtual_machine_arn:(storage_virtual_machine_arn_ : storage_virtual_machine_arn)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~protocol:(protocol_ : fsx_protocol) () =
  ({
     tags = tags_;
     subdirectory = subdirectory_;
     storage_virtual_machine_arn = storage_virtual_machine_arn_;
     security_group_arns = security_group_arns_;
     protocol = protocol_;
   }
    : create_location_fsx_ontap_request)

let make_create_location_fsx_lustre_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_fsx_lustre_response)

let make_create_location_fsx_lustre_request ?tags:(tags_ : input_tag_list option)
    ?subdirectory:(subdirectory_ : fsx_lustre_subdirectory option)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn) () =
  ({
     tags = tags_;
     subdirectory = subdirectory_;
     security_group_arns = security_group_arns_;
     fsx_filesystem_arn = fsx_filesystem_arn_;
   }
    : create_location_fsx_lustre_request)

let make_create_location_efs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_efs_response)

let make_create_location_efs_request
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : iam_role_arn option)
    ?access_point_arn:(access_point_arn_ : efs_access_point_arn option)
    ?tags:(tags_ : input_tag_list option) ?subdirectory:(subdirectory_ : efs_subdirectory option)
    ~ec2_config:(ec2_config_ : ec2_config)
    ~efs_filesystem_arn:(efs_filesystem_arn_ : efs_filesystem_arn) () =
  ({
     in_transit_encryption = in_transit_encryption_;
     file_system_access_role_arn = file_system_access_role_arn_;
     access_point_arn = access_point_arn_;
     tags = tags_;
     ec2_config = ec2_config_;
     efs_filesystem_arn = efs_filesystem_arn_;
     subdirectory = subdirectory_;
   }
    : create_location_efs_request)

let make_create_location_azure_blob_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_azure_blob_response)

let make_create_location_azure_blob_request
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?tags:(tags_ : input_tag_list option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?subdirectory:(subdirectory_ : azure_blob_subdirectory option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?sas_configuration:(sas_configuration_ : azure_blob_sas_configuration option)
    ~authentication_type:(authentication_type_ : azure_blob_authentication_type)
    ~container_url:(container_url_ : azure_blob_container_url) () =
  ({
     custom_secret_config = custom_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     tags = tags_;
     agent_arns = agent_arns_;
     subdirectory = subdirectory_;
     access_tier = access_tier_;
     blob_type = blob_type_;
     sas_configuration = sas_configuration_;
     authentication_type = authentication_type_;
     container_url = container_url_;
   }
    : create_location_azure_blob_request)

let make_create_agent_response ?agent_arn:(agent_arn_ : agent_arn option) () =
  ({ agent_arn = agent_arn_ } : create_agent_response)

let make_create_agent_request
    ?security_group_arns:(security_group_arns_ : pl_security_group_arn_list option)
    ?subnet_arns:(subnet_arns_ : pl_subnet_arn_list option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?tags:(tags_ : input_tag_list option) ?agent_name:(agent_name_ : tag_value option)
    ~activation_key:(activation_key_ : activation_key) () =
  ({
     security_group_arns = security_group_arns_;
     subnet_arns = subnet_arns_;
     vpc_endpoint_id = vpc_endpoint_id_;
     tags = tags_;
     agent_name = agent_name_;
     activation_key = activation_key_;
   }
    : create_agent_request)

let make_cancel_task_execution_response () = (() : unit)

let make_cancel_task_execution_request
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) () =
  ({ task_execution_arn = task_execution_arn_ } : cancel_task_execution_request)
