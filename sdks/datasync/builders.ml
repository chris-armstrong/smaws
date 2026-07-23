open Types

let make_platform ?version:(version_ : agent_version option) () =
  ({ version = version_ } : platform)

let make_agent_list_entry ?agent_arn:(agent_arn_ : agent_arn option)
    ?name:(name_ : tag_value option) ?status:(status_ : agent_status option)
    ?platform:(platform_ : platform option) () =
  ({ agent_arn = agent_arn_; name = name_; status = status_; platform = platform_ }
    : agent_list_entry)

let make_azure_blob_sas_configuration ~token:(token_ : azure_blob_sas_token) () =
  ({ token = token_ } : azure_blob_sas_configuration)

let make_cancel_task_execution_response () = (() : unit)

let make_cancel_task_execution_request
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) () =
  ({ task_execution_arn = task_execution_arn_ } : cancel_task_execution_request)

let make_cmk_secret_config ?secret_arn:(secret_arn_ : secret_arn option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) () =
  ({ secret_arn = secret_arn_; kms_key_arn = kms_key_arn_ } : cmk_secret_config)

let make_create_agent_response ?agent_arn:(agent_arn_ : agent_arn option) () =
  ({ agent_arn = agent_arn_ } : create_agent_response)

let make_tag_list_entry ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag_list_entry)

let make_create_agent_request ?agent_name:(agent_name_ : tag_value option)
    ?tags:(tags_ : input_tag_list option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?subnet_arns:(subnet_arns_ : pl_subnet_arn_list option)
    ?security_group_arns:(security_group_arns_ : pl_security_group_arn_list option)
    ~activation_key:(activation_key_ : activation_key) () =
  ({
     activation_key = activation_key_;
     agent_name = agent_name_;
     tags = tags_;
     vpc_endpoint_id = vpc_endpoint_id_;
     subnet_arns = subnet_arns_;
     security_group_arns = security_group_arns_;
   }
    : create_agent_request)

let make_create_location_azure_blob_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_azure_blob_response)

let make_custom_secret_config ?secret_arn:(secret_arn_ : secret_arn option)
    ?secret_access_role_arn:(secret_access_role_arn_ : iam_role_arn_or_empty_string option) () =
  ({ secret_arn = secret_arn_; secret_access_role_arn = secret_access_role_arn_ }
    : custom_secret_config)

let make_create_location_azure_blob_request
    ?sas_configuration:(sas_configuration_ : azure_blob_sas_configuration option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?subdirectory:(subdirectory_ : azure_blob_subdirectory option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?tags:(tags_ : input_tag_list option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~container_url:(container_url_ : azure_blob_container_url)
    ~authentication_type:(authentication_type_ : azure_blob_authentication_type) () =
  ({
     container_url = container_url_;
     authentication_type = authentication_type_;
     sas_configuration = sas_configuration_;
     blob_type = blob_type_;
     access_tier = access_tier_;
     subdirectory = subdirectory_;
     agent_arns = agent_arns_;
     tags = tags_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : create_location_azure_blob_request)

let make_create_location_efs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_efs_response)

let make_ec2_config ~subnet_arn:(subnet_arn_ : ec2_subnet_arn)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list) () =
  ({ subnet_arn = subnet_arn_; security_group_arns = security_group_arns_ } : ec2_config)

let make_create_location_efs_request ?subdirectory:(subdirectory_ : efs_subdirectory option)
    ?tags:(tags_ : input_tag_list option)
    ?access_point_arn:(access_point_arn_ : efs_access_point_arn option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : iam_role_arn option)
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option)
    ~efs_filesystem_arn:(efs_filesystem_arn_ : efs_filesystem_arn)
    ~ec2_config:(ec2_config_ : ec2_config) () =
  ({
     subdirectory = subdirectory_;
     efs_filesystem_arn = efs_filesystem_arn_;
     ec2_config = ec2_config_;
     tags = tags_;
     access_point_arn = access_point_arn_;
     file_system_access_role_arn = file_system_access_role_arn_;
     in_transit_encryption = in_transit_encryption_;
   }
    : create_location_efs_request)

let make_create_location_fsx_lustre_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_fsx_lustre_response)

let make_create_location_fsx_lustre_request
    ?subdirectory:(subdirectory_ : fsx_lustre_subdirectory option)
    ?tags:(tags_ : input_tag_list option)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list) () =
  ({
     fsx_filesystem_arn = fsx_filesystem_arn_;
     security_group_arns = security_group_arns_;
     subdirectory = subdirectory_;
     tags = tags_;
   }
    : create_location_fsx_lustre_request)

let make_create_location_fsx_ontap_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_fsx_ontap_response)

let make_managed_secret_config ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ secret_arn = secret_arn_ } : managed_secret_config)

let make_smb_mount_options ?version:(version_ : smb_version option) () =
  ({ version = version_ } : smb_mount_options)

let make_fsx_protocol_smb ?domain:(domain_ : smb_domain option)
    ?mount_options:(mount_options_ : smb_mount_options option)
    ?password:(password_ : smb_password option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~user:(user_ : smb_user) () =
  ({
     domain = domain_;
     mount_options = mount_options_;
     password = password_;
     user = user_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : fsx_protocol_smb)

let make_nfs_mount_options ?version:(version_ : nfs_version option) () =
  ({ version = version_ } : nfs_mount_options)

let make_fsx_protocol_nfs ?mount_options:(mount_options_ : nfs_mount_options option) () =
  ({ mount_options = mount_options_ } : fsx_protocol_nfs)

let make_fsx_protocol ?nf_s:(nf_s_ : fsx_protocol_nfs option)
    ?sm_b:(sm_b_ : fsx_protocol_smb option) () =
  ({ nf_s = nf_s_; sm_b = sm_b_ } : fsx_protocol)

let make_create_location_fsx_ontap_request
    ?subdirectory:(subdirectory_ : fsx_ontap_subdirectory option)
    ?tags:(tags_ : input_tag_list option) ~protocol:(protocol_ : fsx_protocol)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~storage_virtual_machine_arn:(storage_virtual_machine_arn_ : storage_virtual_machine_arn) () =
  ({
     protocol = protocol_;
     security_group_arns = security_group_arns_;
     storage_virtual_machine_arn = storage_virtual_machine_arn_;
     subdirectory = subdirectory_;
     tags = tags_;
   }
    : create_location_fsx_ontap_request)

let make_create_location_fsx_open_zfs_response ?location_arn:(location_arn_ : location_arn option)
    () =
  ({ location_arn = location_arn_ } : create_location_fsx_open_zfs_response)

let make_create_location_fsx_open_zfs_request
    ?subdirectory:(subdirectory_ : fsx_open_zfs_subdirectory option)
    ?tags:(tags_ : input_tag_list option)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn)
    ~protocol:(protocol_ : fsx_protocol)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list) () =
  ({
     fsx_filesystem_arn = fsx_filesystem_arn_;
     protocol = protocol_;
     security_group_arns = security_group_arns_;
     subdirectory = subdirectory_;
     tags = tags_;
   }
    : create_location_fsx_open_zfs_request)

let make_create_location_fsx_windows_response ?location_arn:(location_arn_ : location_arn option) ()
    =
  ({ location_arn = location_arn_ } : create_location_fsx_windows_response)

let make_create_location_fsx_windows_request
    ?subdirectory:(subdirectory_ : fsx_windows_subdirectory option)
    ?tags:(tags_ : input_tag_list option) ?domain:(domain_ : smb_domain option)
    ?password:(password_ : smb_password option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn)
    ~security_group_arns:(security_group_arns_ : ec2_security_group_arn_list)
    ~user:(user_ : smb_user) () =
  ({
     subdirectory = subdirectory_;
     fsx_filesystem_arn = fsx_filesystem_arn_;
     security_group_arns = security_group_arns_;
     tags = tags_;
     user = user_;
     domain = domain_;
     password = password_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : create_location_fsx_windows_request)

let make_create_location_hdfs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_hdfs_response)

let make_qop_configuration ?rpc_protection:(rpc_protection_ : hdfs_rpc_protection option)
    ?data_transfer_protection:(data_transfer_protection_ : hdfs_data_transfer_protection option) ()
    =
  ({ rpc_protection = rpc_protection_; data_transfer_protection = data_transfer_protection_ }
    : qop_configuration)

let make_hdfs_name_node ~hostname:(hostname_ : hdfs_server_hostname)
    ~port:(port_ : hdfs_server_port) () =
  ({ hostname = hostname_; port = port_ } : hdfs_name_node)

let make_create_location_hdfs_request ?subdirectory:(subdirectory_ : hdfs_subdirectory option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?tags:(tags_ : input_tag_list option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~name_nodes:(name_nodes_ : hdfs_name_node_list)
    ~authentication_type:(authentication_type_ : hdfs_authentication_type)
    ~agent_arns:(agent_arns_ : agent_arn_list) () =
  ({
     subdirectory = subdirectory_;
     name_nodes = name_nodes_;
     block_size = block_size_;
     replication_factor = replication_factor_;
     kms_key_provider_uri = kms_key_provider_uri_;
     qop_configuration = qop_configuration_;
     authentication_type = authentication_type_;
     simple_user = simple_user_;
     kerberos_principal = kerberos_principal_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
     agent_arns = agent_arns_;
     tags = tags_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : create_location_hdfs_request)

let make_create_location_nfs_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_nfs_response)

let make_on_prem_config ~agent_arns:(agent_arns_ : agent_arn_list) () =
  ({ agent_arns = agent_arns_ } : on_prem_config)

let make_create_location_nfs_request ?mount_options:(mount_options_ : nfs_mount_options option)
    ?tags:(tags_ : input_tag_list option) ~subdirectory:(subdirectory_ : nfs_subdirectory)
    ~server_hostname:(server_hostname_ : server_hostname)
    ~on_prem_config:(on_prem_config_ : on_prem_config) () =
  ({
     subdirectory = subdirectory_;
     server_hostname = server_hostname_;
     on_prem_config = on_prem_config_;
     mount_options = mount_options_;
     tags = tags_;
   }
    : create_location_nfs_request)

let make_create_location_object_storage_response ?location_arn:(location_arn_ : location_arn option)
    () =
  ({ location_arn = location_arn_ } : create_location_object_storage_response)

let make_create_location_object_storage_request
    ?server_port:(server_port_ : object_storage_server_port option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?secret_key:(secret_key_ : object_storage_secret_key option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?tags:(tags_ : input_tag_list option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~server_hostname:(server_hostname_ : server_hostname)
    ~bucket_name:(bucket_name_ : object_storage_bucket_name) () =
  ({
     server_hostname = server_hostname_;
     server_port = server_port_;
     server_protocol = server_protocol_;
     subdirectory = subdirectory_;
     bucket_name = bucket_name_;
     access_key = access_key_;
     secret_key = secret_key_;
     agent_arns = agent_arns_;
     tags = tags_;
     server_certificate = server_certificate_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : create_location_object_storage_request)

let make_create_location_s3_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_s3_response)

let make_s3_config ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn) () =
  ({ bucket_access_role_arn = bucket_access_role_arn_ } : s3_config)

let make_create_location_s3_request ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?tags:(tags_ : input_tag_list option)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn) ~s3_config:(s3_config_ : s3_config) () =
  ({
     subdirectory = subdirectory_;
     s3_bucket_arn = s3_bucket_arn_;
     s3_storage_class = s3_storage_class_;
     s3_config = s3_config_;
     agent_arns = agent_arns_;
     tags = tags_;
   }
    : create_location_s3_request)

let make_create_location_smb_response ?location_arn:(location_arn_ : location_arn option) () =
  ({ location_arn = location_arn_ } : create_location_smb_response)

let make_create_location_smb_request ?user:(user_ : smb_user option)
    ?domain:(domain_ : smb_domain option) ?password:(password_ : smb_password option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?mount_options:(mount_options_ : smb_mount_options option) ?tags:(tags_ : input_tag_list option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ~subdirectory:(subdirectory_ : smb_subdirectory)
    ~server_hostname:(server_hostname_ : server_hostname) ~agent_arns:(agent_arns_ : agent_arn_list)
    () =
  ({
     subdirectory = subdirectory_;
     server_hostname = server_hostname_;
     user = user_;
     domain = domain_;
     password = password_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
     agent_arns = agent_arns_;
     mount_options = mount_options_;
     tags = tags_;
     authentication_type = authentication_type_;
     dns_ip_addresses = dns_ip_addresses_;
     kerberos_principal = kerberos_principal_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
   }
    : create_location_smb_request)

let make_create_task_response ?task_arn:(task_arn_ : task_arn option) () =
  ({ task_arn = task_arn_ } : create_task_response)

let make_report_override ?report_level:(report_level_ : report_level option) () =
  ({ report_level = report_level_ } : report_override)

let make_report_overrides ?transferred:(transferred_ : report_override option)
    ?verified:(verified_ : report_override option) ?deleted:(deleted_ : report_override option)
    ?skipped:(skipped_ : report_override option) () =
  ({ transferred = transferred_; verified = verified_; deleted = deleted_; skipped = skipped_ }
    : report_overrides)

let make_report_destination_s3 ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn)
    ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn) () =
  ({
     subdirectory = subdirectory_;
     s3_bucket_arn = s3_bucket_arn_;
     bucket_access_role_arn = bucket_access_role_arn_;
   }
    : report_destination_s3)

let make_report_destination ?s3:(s3_ : report_destination_s3 option) () =
  ({ s3 = s3_ } : report_destination)

let make_task_report_config ?destination:(destination_ : report_destination option)
    ?output_type:(output_type_ : report_output_type option)
    ?report_level:(report_level_ : report_level option)
    ?object_version_ids:(object_version_ids_ : object_version_ids option)
    ?overrides:(overrides_ : report_overrides option) () =
  ({
     destination = destination_;
     output_type = output_type_;
     report_level = report_level_;
     object_version_ids = object_version_ids_;
     overrides = overrides_;
   }
    : task_report_config)

let make_s3_manifest_config
    ?manifest_object_version_id:(manifest_object_version_id_ : s3_object_version_id option)
    ~manifest_object_path:(manifest_object_path_ : s3_subdirectory)
    ~bucket_access_role_arn:(bucket_access_role_arn_ : iam_role_arn)
    ~s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn) () =
  ({
     manifest_object_path = manifest_object_path_;
     bucket_access_role_arn = bucket_access_role_arn_;
     s3_bucket_arn = s3_bucket_arn_;
     manifest_object_version_id = manifest_object_version_id_;
   }
    : s3_manifest_config)

let make_source_manifest_config ~s3:(s3_ : s3_manifest_config) () =
  ({ s3 = s3_ } : source_manifest_config)

let make_manifest_config ?action:(action_ : manifest_action option)
    ?format:(format_ : manifest_format option) ?source:(source_ : source_manifest_config option) ()
    =
  ({ action = action_; format = format_; source = source_ } : manifest_config)

let make_filter_rule ?filter_type:(filter_type_ : filter_type option)
    ?value:(value_ : filter_value option) () =
  ({ filter_type = filter_type_; value = value_ } : filter_rule)

let make_task_schedule ?status:(status_ : schedule_status option)
    ~schedule_expression:(schedule_expression_ : schedule_expression_cron) () =
  ({ schedule_expression = schedule_expression_; status = status_ } : task_schedule)

let make_options ?verify_mode:(verify_mode_ : verify_mode option)
    ?overwrite_mode:(overwrite_mode_ : overwrite_mode option) ?atime:(atime_ : atime option)
    ?mtime:(mtime_ : mtime option) ?uid:(uid_ : uid option) ?gid:(gid_ : gid option)
    ?preserve_deleted_files:(preserve_deleted_files_ : preserve_deleted_files option)
    ?preserve_devices:(preserve_devices_ : preserve_devices option)
    ?posix_permissions:(posix_permissions_ : posix_permissions option)
    ?bytes_per_second:(bytes_per_second_ : bytes_per_second option)
    ?task_queueing:(task_queueing_ : task_queueing option)
    ?log_level:(log_level_ : log_level option)
    ?transfer_mode:(transfer_mode_ : transfer_mode option)
    ?security_descriptor_copy_flags:
      (security_descriptor_copy_flags_ : smb_security_descriptor_copy_flags option)
    ?object_tags:(object_tags_ : object_tags option) () =
  ({
     verify_mode = verify_mode_;
     overwrite_mode = overwrite_mode_;
     atime = atime_;
     mtime = mtime_;
     uid = uid_;
     gid = gid_;
     preserve_deleted_files = preserve_deleted_files_;
     preserve_devices = preserve_devices_;
     posix_permissions = posix_permissions_;
     bytes_per_second = bytes_per_second_;
     task_queueing = task_queueing_;
     log_level = log_level_;
     transfer_mode = transfer_mode_;
     security_descriptor_copy_flags = security_descriptor_copy_flags_;
     object_tags = object_tags_;
   }
    : options)

let make_create_task_request
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ?name:(name_ : tag_value option) ?options:(options_ : options option)
    ?excludes:(excludes_ : filter_list option) ?schedule:(schedule_ : task_schedule option)
    ?tags:(tags_ : input_tag_list option) ?includes:(includes_ : filter_list option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?task_mode:(task_mode_ : task_mode option)
    ~source_location_arn:(source_location_arn_ : location_arn)
    ~destination_location_arn:(destination_location_arn_ : location_arn) () =
  ({
     source_location_arn = source_location_arn_;
     destination_location_arn = destination_location_arn_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     name = name_;
     options = options_;
     excludes = excludes_;
     schedule = schedule_;
     tags = tags_;
     includes = includes_;
     manifest_config = manifest_config_;
     task_report_config = task_report_config_;
     task_mode = task_mode_;
   }
    : create_task_request)

let make_delete_agent_response () = (() : unit)

let make_delete_agent_request ~agent_arn:(agent_arn_ : agent_arn) () =
  ({ agent_arn = agent_arn_ } : delete_agent_request)

let make_delete_location_response () = (() : unit)

let make_delete_location_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : delete_location_request)

let make_delete_task_response () = (() : unit)

let make_delete_task_request ~task_arn:(task_arn_ : task_arn) () =
  ({ task_arn = task_arn_ } : delete_task_request)

let make_private_link_config ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?private_link_endpoint:(private_link_endpoint_ : endpoint option)
    ?subnet_arns:(subnet_arns_ : pl_subnet_arn_list option)
    ?security_group_arns:(security_group_arns_ : pl_security_group_arn_list option) () =
  ({
     vpc_endpoint_id = vpc_endpoint_id_;
     private_link_endpoint = private_link_endpoint_;
     subnet_arns = subnet_arns_;
     security_group_arns = security_group_arns_;
   }
    : private_link_config)

let make_describe_agent_response ?agent_arn:(agent_arn_ : agent_arn option)
    ?name:(name_ : tag_value option) ?status:(status_ : agent_status option)
    ?last_connection_time:(last_connection_time_ : time option)
    ?creation_time:(creation_time_ : time option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?private_link_config:(private_link_config_ : private_link_config option)
    ?platform:(platform_ : platform option) () =
  ({
     agent_arn = agent_arn_;
     name = name_;
     status = status_;
     last_connection_time = last_connection_time_;
     creation_time = creation_time_;
     endpoint_type = endpoint_type_;
     private_link_config = private_link_config_;
     platform = platform_;
   }
    : describe_agent_response)

let make_describe_agent_request ~agent_arn:(agent_arn_ : agent_arn) () =
  ({ agent_arn = agent_arn_ } : describe_agent_request)

let make_describe_location_azure_blob_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?authentication_type:(authentication_type_ : azure_blob_authentication_type option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?creation_time:(creation_time_ : time option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     authentication_type = authentication_type_;
     blob_type = blob_type_;
     access_tier = access_tier_;
     agent_arns = agent_arns_;
     creation_time = creation_time_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : describe_location_azure_blob_response)

let make_describe_location_azure_blob_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_azure_blob_request)

let make_describe_location_efs_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?ec2_config:(ec2_config_ : ec2_config option) ?creation_time:(creation_time_ : time option)
    ?access_point_arn:(access_point_arn_ : efs_access_point_arn option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : iam_role_arn option)
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     ec2_config = ec2_config_;
     creation_time = creation_time_;
     access_point_arn = access_point_arn_;
     file_system_access_role_arn = file_system_access_role_arn_;
     in_transit_encryption = in_transit_encryption_;
   }
    : describe_location_efs_response)

let make_describe_location_efs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_efs_request)

let make_describe_location_fsx_lustre_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?creation_time:(creation_time_ : time option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     security_group_arns = security_group_arns_;
     creation_time = creation_time_;
   }
    : describe_location_fsx_lustre_response)

let make_describe_location_fsx_lustre_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_lustre_request)

let make_describe_location_fsx_ontap_response ?creation_time:(creation_time_ : time option)
    ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option) ?protocol:(protocol_ : fsx_protocol option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?storage_virtual_machine_arn:(storage_virtual_machine_arn_ : storage_virtual_machine_arn option)
    ?fsx_filesystem_arn:(fsx_filesystem_arn_ : fsx_filesystem_arn option) () =
  ({
     creation_time = creation_time_;
     location_arn = location_arn_;
     location_uri = location_uri_;
     protocol = protocol_;
     security_group_arns = security_group_arns_;
     storage_virtual_machine_arn = storage_virtual_machine_arn_;
     fsx_filesystem_arn = fsx_filesystem_arn_;
   }
    : describe_location_fsx_ontap_response)

let make_describe_location_fsx_ontap_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_ontap_request)

let make_describe_location_fsx_open_zfs_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?protocol:(protocol_ : fsx_protocol option) ?creation_time:(creation_time_ : time option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     security_group_arns = security_group_arns_;
     protocol = protocol_;
     creation_time = creation_time_;
   }
    : describe_location_fsx_open_zfs_response)

let make_describe_location_fsx_open_zfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_open_zfs_request)

let make_describe_location_fsx_windows_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?security_group_arns:(security_group_arns_ : ec2_security_group_arn_list option)
    ?creation_time:(creation_time_ : time option) ?user:(user_ : smb_user option)
    ?domain:(domain_ : smb_domain option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     security_group_arns = security_group_arns_;
     creation_time = creation_time_;
     user = user_;
     domain = domain_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : describe_location_fsx_windows_response)

let make_describe_location_fsx_windows_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_fsx_windows_request)

let make_describe_location_hdfs_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?name_nodes:(name_nodes_ : hdfs_name_node_list option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?authentication_type:(authentication_type_ : hdfs_authentication_type option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?creation_time:(creation_time_ : time option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     name_nodes = name_nodes_;
     block_size = block_size_;
     replication_factor = replication_factor_;
     kms_key_provider_uri = kms_key_provider_uri_;
     qop_configuration = qop_configuration_;
     authentication_type = authentication_type_;
     simple_user = simple_user_;
     kerberos_principal = kerberos_principal_;
     agent_arns = agent_arns_;
     creation_time = creation_time_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : describe_location_hdfs_response)

let make_describe_location_hdfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_hdfs_request)

let make_describe_location_nfs_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?on_prem_config:(on_prem_config_ : on_prem_config option)
    ?mount_options:(mount_options_ : nfs_mount_options option)
    ?creation_time:(creation_time_ : time option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     on_prem_config = on_prem_config_;
     mount_options = mount_options_;
     creation_time = creation_time_;
   }
    : describe_location_nfs_response)

let make_describe_location_nfs_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_nfs_request)

let make_describe_location_object_storage_response
    ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?server_port:(server_port_ : object_storage_server_port option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?creation_time:(creation_time_ : time option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     access_key = access_key_;
     server_port = server_port_;
     server_protocol = server_protocol_;
     agent_arns = agent_arns_;
     creation_time = creation_time_;
     server_certificate = server_certificate_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : describe_location_object_storage_response)

let make_describe_location_object_storage_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_object_storage_request)

let make_describe_location_s3_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?s3_config:(s3_config_ : s3_config option) ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?creation_time:(creation_time_ : time option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     s3_storage_class = s3_storage_class_;
     s3_config = s3_config_;
     agent_arns = agent_arns_;
     creation_time = creation_time_;
   }
    : describe_location_s3_response)

let make_describe_location_s3_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_s3_request)

let make_describe_location_smb_response ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option)
    ?agent_arns:(agent_arns_ : agent_arn_list option) ?user:(user_ : smb_user option)
    ?domain:(domain_ : smb_domain option) ?mount_options:(mount_options_ : smb_mount_options option)
    ?creation_time:(creation_time_ : time option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?managed_secret_config:(managed_secret_config_ : managed_secret_config option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     location_arn = location_arn_;
     location_uri = location_uri_;
     agent_arns = agent_arns_;
     user = user_;
     domain = domain_;
     mount_options = mount_options_;
     creation_time = creation_time_;
     dns_ip_addresses = dns_ip_addresses_;
     kerberos_principal = kerberos_principal_;
     authentication_type = authentication_type_;
     managed_secret_config = managed_secret_config_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : describe_location_smb_response)

let make_describe_location_smb_request ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_ } : describe_location_smb_request)

let make_task_schedule_details ?status_update_time:(status_update_time_ : time option)
    ?disabled_reason:(disabled_reason_ : schedule_disabled_reason option)
    ?disabled_by:(disabled_by_ : schedule_disabled_by option) () =
  ({
     status_update_time = status_update_time_;
     disabled_reason = disabled_reason_;
     disabled_by = disabled_by_;
   }
    : task_schedule_details)

let make_describe_task_response ?task_arn:(task_arn_ : task_arn option)
    ?status:(status_ : task_status option) ?name:(name_ : tag_value option)
    ?current_task_execution_arn:(current_task_execution_arn_ : task_execution_arn option)
    ?source_location_arn:(source_location_arn_ : location_arn option)
    ?destination_location_arn:(destination_location_arn_ : location_arn option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ?source_network_interface_arns:
      (source_network_interface_arns_ : source_network_interface_arns option)
    ?destination_network_interface_arns:
      (destination_network_interface_arns_ : destination_network_interface_arns option)
    ?options:(options_ : options option) ?excludes:(excludes_ : filter_list option)
    ?schedule:(schedule_ : task_schedule option) ?error_code:(error_code_ : string_ option)
    ?error_detail:(error_detail_ : string_ option) ?creation_time:(creation_time_ : time option)
    ?includes:(includes_ : filter_list option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?schedule_details:(schedule_details_ : task_schedule_details option)
    ?task_mode:(task_mode_ : task_mode option) () =
  ({
     task_arn = task_arn_;
     status = status_;
     name = name_;
     current_task_execution_arn = current_task_execution_arn_;
     source_location_arn = source_location_arn_;
     destination_location_arn = destination_location_arn_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     source_network_interface_arns = source_network_interface_arns_;
     destination_network_interface_arns = destination_network_interface_arns_;
     options = options_;
     excludes = excludes_;
     schedule = schedule_;
     error_code = error_code_;
     error_detail = error_detail_;
     creation_time = creation_time_;
     includes = includes_;
     manifest_config = manifest_config_;
     task_report_config = task_report_config_;
     schedule_details = schedule_details_;
     task_mode = task_mode_;
   }
    : describe_task_response)

let make_describe_task_request ~task_arn:(task_arn_ : task_arn) () =
  ({ task_arn = task_arn_ } : describe_task_request)

let make_task_execution_folders_failed_detail ?list_:(list__ : long option)
    ?prepare:(prepare_ : long option) ?transfer:(transfer_ : long option)
    ?verify:(verify_ : long option) ?delete:(delete_ : long option) () =
  ({ list_ = list__; prepare = prepare_; transfer = transfer_; verify = verify_; delete = delete_ }
    : task_execution_folders_failed_detail)

let make_task_execution_folders_listed_detail ?at_source:(at_source_ : long option)
    ?at_destination_for_delete:(at_destination_for_delete_ : long option) () =
  ({ at_source = at_source_; at_destination_for_delete = at_destination_for_delete_ }
    : task_execution_folders_listed_detail)

let make_task_execution_files_failed_detail ?prepare:(prepare_ : long option)
    ?transfer:(transfer_ : long option) ?verify:(verify_ : long option)
    ?delete:(delete_ : long option) () =
  ({ prepare = prepare_; transfer = transfer_; verify = verify_; delete = delete_ }
    : task_execution_files_failed_detail)

let make_task_execution_files_listed_detail ?at_source:(at_source_ : long option)
    ?at_destination_for_delete:(at_destination_for_delete_ : long option) () =
  ({ at_source = at_source_; at_destination_for_delete = at_destination_for_delete_ }
    : task_execution_files_listed_detail)

let make_task_execution_result_detail ?prepare_duration:(prepare_duration_ : duration option)
    ?prepare_status:(prepare_status_ : phase_status option)
    ?total_duration:(total_duration_ : duration option)
    ?transfer_duration:(transfer_duration_ : duration option)
    ?transfer_status:(transfer_status_ : phase_status option)
    ?verify_duration:(verify_duration_ : duration option)
    ?verify_status:(verify_status_ : phase_status option) ?error_code:(error_code_ : string_ option)
    ?error_detail:(error_detail_ : string_ option) () =
  ({
     prepare_duration = prepare_duration_;
     prepare_status = prepare_status_;
     total_duration = total_duration_;
     transfer_duration = transfer_duration_;
     transfer_status = transfer_status_;
     verify_duration = verify_duration_;
     verify_status = verify_status_;
     error_code = error_code_;
     error_detail = error_detail_;
   }
    : task_execution_result_detail)

let make_describe_task_execution_response
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option)
    ?status:(status_ : task_execution_status option) ?options:(options_ : options option)
    ?excludes:(excludes_ : filter_list option) ?includes:(includes_ : filter_list option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?start_time:(start_time_ : time option)
    ?estimated_files_to_transfer:(estimated_files_to_transfer_ : long option)
    ?estimated_bytes_to_transfer:(estimated_bytes_to_transfer_ : long option)
    ?files_transferred:(files_transferred_ : long option)
    ?bytes_written:(bytes_written_ : long option)
    ?bytes_transferred:(bytes_transferred_ : long option)
    ?bytes_compressed:(bytes_compressed_ : long option)
    ?result_:(result__ : task_execution_result_detail option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?files_deleted:(files_deleted_ : long option) ?files_skipped:(files_skipped_ : long option)
    ?files_verified:(files_verified_ : long option)
    ?report_result:(report_result_ : report_result option)
    ?estimated_files_to_delete:(estimated_files_to_delete_ : long option)
    ?task_mode:(task_mode_ : task_mode option) ?files_prepared:(files_prepared_ : long option)
    ?files_listed:(files_listed_ : task_execution_files_listed_detail option)
    ?files_failed:(files_failed_ : task_execution_files_failed_detail option)
    ?estimated_folders_to_delete:(estimated_folders_to_delete_ : item_count option)
    ?estimated_folders_to_transfer:(estimated_folders_to_transfer_ : item_count option)
    ?folders_skipped:(folders_skipped_ : item_count option)
    ?folders_prepared:(folders_prepared_ : item_count option)
    ?folders_transferred:(folders_transferred_ : item_count option)
    ?folders_verified:(folders_verified_ : item_count option)
    ?folders_deleted:(folders_deleted_ : item_count option)
    ?folders_listed:(folders_listed_ : task_execution_folders_listed_detail option)
    ?folders_failed:(folders_failed_ : task_execution_folders_failed_detail option)
    ?launch_time:(launch_time_ : time option) ?end_time:(end_time_ : time option) () =
  ({
     task_execution_arn = task_execution_arn_;
     status = status_;
     options = options_;
     excludes = excludes_;
     includes = includes_;
     manifest_config = manifest_config_;
     start_time = start_time_;
     estimated_files_to_transfer = estimated_files_to_transfer_;
     estimated_bytes_to_transfer = estimated_bytes_to_transfer_;
     files_transferred = files_transferred_;
     bytes_written = bytes_written_;
     bytes_transferred = bytes_transferred_;
     bytes_compressed = bytes_compressed_;
     result_ = result__;
     task_report_config = task_report_config_;
     files_deleted = files_deleted_;
     files_skipped = files_skipped_;
     files_verified = files_verified_;
     report_result = report_result_;
     estimated_files_to_delete = estimated_files_to_delete_;
     task_mode = task_mode_;
     files_prepared = files_prepared_;
     files_listed = files_listed_;
     files_failed = files_failed_;
     estimated_folders_to_delete = estimated_folders_to_delete_;
     estimated_folders_to_transfer = estimated_folders_to_transfer_;
     folders_skipped = folders_skipped_;
     folders_prepared = folders_prepared_;
     folders_transferred = folders_transferred_;
     folders_verified = folders_verified_;
     folders_deleted = folders_deleted_;
     folders_listed = folders_listed_;
     folders_failed = folders_failed_;
     launch_time = launch_time_;
     end_time = end_time_;
   }
    : describe_task_execution_response)

let make_describe_task_execution_request
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) () =
  ({ task_execution_arn = task_execution_arn_ } : describe_task_execution_request)

let make_update_task_execution_response () = (() : unit)

let make_update_task_execution_request
    ~task_execution_arn:(task_execution_arn_ : task_execution_arn) ~options:(options_ : options) ()
    =
  ({ task_execution_arn = task_execution_arn_; options = options_ } : update_task_execution_request)

let make_update_task_response () = (() : unit)

let make_update_task_request ?options:(options_ : options option)
    ?excludes:(excludes_ : filter_list option) ?schedule:(schedule_ : task_schedule option)
    ?name:(name_ : tag_value option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : log_group_arn option)
    ?includes:(includes_ : filter_list option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ~task_arn:(task_arn_ : task_arn) () =
  ({
     task_arn = task_arn_;
     options = options_;
     excludes = excludes_;
     schedule = schedule_;
     name = name_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     includes = includes_;
     manifest_config = manifest_config_;
     task_report_config = task_report_config_;
   }
    : update_task_request)

let make_update_location_smb_response () = (() : unit)

let make_update_location_smb_request ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ?server_hostname:(server_hostname_ : server_hostname option) ?user:(user_ : smb_user option)
    ?domain:(domain_ : smb_domain option) ?password:(password_ : smb_password option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?mount_options:(mount_options_ : smb_mount_options option)
    ?authentication_type:(authentication_type_ : smb_authentication_type option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_list option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     server_hostname = server_hostname_;
     user = user_;
     domain = domain_;
     password = password_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
     agent_arns = agent_arns_;
     mount_options = mount_options_;
     authentication_type = authentication_type_;
     dns_ip_addresses = dns_ip_addresses_;
     kerberos_principal = kerberos_principal_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
   }
    : update_location_smb_request)

let make_update_location_s3_response () = (() : unit)

let make_update_location_s3_request ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?s3_storage_class:(s3_storage_class_ : s3_storage_class option)
    ?s3_config:(s3_config_ : s3_config option) ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     s3_storage_class = s3_storage_class_;
     s3_config = s3_config_;
   }
    : update_location_s3_request)

let make_update_location_object_storage_response () = (() : unit)

let make_update_location_object_storage_request
    ?server_port:(server_port_ : object_storage_server_port option)
    ?server_protocol:(server_protocol_ : object_storage_server_protocol option)
    ?subdirectory:(subdirectory_ : s3_subdirectory option)
    ?server_hostname:(server_hostname_ : server_hostname option)
    ?access_key:(access_key_ : object_storage_access_key option)
    ?secret_key:(secret_key_ : object_storage_secret_key option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?server_certificate:(server_certificate_ : object_storage_certificate option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     server_port = server_port_;
     server_protocol = server_protocol_;
     subdirectory = subdirectory_;
     server_hostname = server_hostname_;
     access_key = access_key_;
     secret_key = secret_key_;
     agent_arns = agent_arns_;
     server_certificate = server_certificate_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : update_location_object_storage_request)

let make_update_location_nfs_response () = (() : unit)

let make_update_location_nfs_request ?subdirectory:(subdirectory_ : nfs_subdirectory option)
    ?server_hostname:(server_hostname_ : server_hostname option)
    ?on_prem_config:(on_prem_config_ : on_prem_config option)
    ?mount_options:(mount_options_ : nfs_mount_options option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     server_hostname = server_hostname_;
     on_prem_config = on_prem_config_;
     mount_options = mount_options_;
   }
    : update_location_nfs_request)

let make_update_location_hdfs_response () = (() : unit)

let make_update_location_hdfs_request ?subdirectory:(subdirectory_ : hdfs_subdirectory option)
    ?name_nodes:(name_nodes_ : hdfs_name_node_list option)
    ?block_size:(block_size_ : hdfs_block_size option)
    ?replication_factor:(replication_factor_ : hdfs_replication_factor option)
    ?kms_key_provider_uri:(kms_key_provider_uri_ : kms_key_provider_uri option)
    ?qop_configuration:(qop_configuration_ : qop_configuration option)
    ?authentication_type:(authentication_type_ : hdfs_authentication_type option)
    ?simple_user:(simple_user_ : hdfs_user option)
    ?kerberos_principal:(kerberos_principal_ : kerberos_principal option)
    ?kerberos_keytab:(kerberos_keytab_ : kerberos_keytab_file option)
    ?kerberos_krb5_conf:(kerberos_krb5_conf_ : kerberos_krb5_conf_file option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     name_nodes = name_nodes_;
     block_size = block_size_;
     replication_factor = replication_factor_;
     kms_key_provider_uri = kms_key_provider_uri_;
     qop_configuration = qop_configuration_;
     authentication_type = authentication_type_;
     simple_user = simple_user_;
     kerberos_principal = kerberos_principal_;
     kerberos_keytab = kerberos_keytab_;
     kerberos_krb5_conf = kerberos_krb5_conf_;
     agent_arns = agent_arns_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : update_location_hdfs_request)

let make_update_location_fsx_windows_response () = (() : unit)

let make_update_location_fsx_windows_request
    ?subdirectory:(subdirectory_ : fsx_windows_subdirectory option)
    ?domain:(domain_ : update_smb_domain option) ?user:(user_ : smb_user option)
    ?password:(password_ : smb_password option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     domain = domain_;
     user = user_;
     password = password_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : update_location_fsx_windows_request)

let make_update_location_fsx_open_zfs_response () = (() : unit)

let make_update_location_fsx_open_zfs_request ?protocol:(protocol_ : fsx_protocol option)
    ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_; protocol = protocol_; subdirectory = subdirectory_ }
    : update_location_fsx_open_zfs_request)

let make_update_location_fsx_ontap_response () = (() : unit)

let make_fsx_update_protocol_smb ?domain:(domain_ : update_smb_domain option)
    ?mount_options:(mount_options_ : smb_mount_options option)
    ?password:(password_ : smb_password option) ?user:(user_ : smb_user option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option) () =
  ({
     domain = domain_;
     mount_options = mount_options_;
     password = password_;
     user = user_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : fsx_update_protocol_smb)

let make_fsx_update_protocol ?nf_s:(nf_s_ : fsx_protocol_nfs option)
    ?sm_b:(sm_b_ : fsx_update_protocol_smb option) () =
  ({ nf_s = nf_s_; sm_b = sm_b_ } : fsx_update_protocol)

let make_update_location_fsx_ontap_request ?protocol:(protocol_ : fsx_update_protocol option)
    ?subdirectory:(subdirectory_ : fsx_ontap_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_; protocol = protocol_; subdirectory = subdirectory_ }
    : update_location_fsx_ontap_request)

let make_update_location_fsx_lustre_response () = (() : unit)

let make_update_location_fsx_lustre_request ?subdirectory:(subdirectory_ : smb_subdirectory option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({ location_arn = location_arn_; subdirectory = subdirectory_ }
    : update_location_fsx_lustre_request)

let make_update_location_efs_response () = (() : unit)

let make_update_location_efs_request ?subdirectory:(subdirectory_ : efs_subdirectory option)
    ?access_point_arn:(access_point_arn_ : updated_efs_access_point_arn option)
    ?file_system_access_role_arn:(file_system_access_role_arn_ : updated_efs_iam_role_arn option)
    ?in_transit_encryption:(in_transit_encryption_ : efs_in_transit_encryption option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     access_point_arn = access_point_arn_;
     file_system_access_role_arn = file_system_access_role_arn_;
     in_transit_encryption = in_transit_encryption_;
   }
    : update_location_efs_request)

let make_update_location_azure_blob_response () = (() : unit)

let make_update_location_azure_blob_request
    ?subdirectory:(subdirectory_ : azure_blob_subdirectory option)
    ?authentication_type:(authentication_type_ : azure_blob_authentication_type option)
    ?sas_configuration:(sas_configuration_ : azure_blob_sas_configuration option)
    ?blob_type:(blob_type_ : azure_blob_type option)
    ?access_tier:(access_tier_ : azure_access_tier option)
    ?agent_arns:(agent_arns_ : agent_arn_list option)
    ?cmk_secret_config:(cmk_secret_config_ : cmk_secret_config option)
    ?custom_secret_config:(custom_secret_config_ : custom_secret_config option)
    ~location_arn:(location_arn_ : location_arn) () =
  ({
     location_arn = location_arn_;
     subdirectory = subdirectory_;
     authentication_type = authentication_type_;
     sas_configuration = sas_configuration_;
     blob_type = blob_type_;
     access_tier = access_tier_;
     agent_arns = agent_arns_;
     cmk_secret_config = cmk_secret_config_;
     custom_secret_config = custom_secret_config_;
   }
    : update_location_azure_blob_request)

let make_update_agent_response () = (() : unit)

let make_update_agent_request ?name:(name_ : tag_value option) ~agent_arn:(agent_arn_ : agent_arn)
    () =
  ({ agent_arn = agent_arn_; name = name_ } : update_agent_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~keys:(keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; keys = keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : input_tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_start_task_execution_response
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option) () =
  ({ task_execution_arn = task_execution_arn_ } : start_task_execution_response)

let make_start_task_execution_request ?override_options:(override_options_ : options option)
    ?includes:(includes_ : filter_list option) ?excludes:(excludes_ : filter_list option)
    ?manifest_config:(manifest_config_ : manifest_config option)
    ?task_report_config:(task_report_config_ : task_report_config option)
    ?tags:(tags_ : input_tag_list option) ~task_arn:(task_arn_ : task_arn) () =
  ({
     task_arn = task_arn_;
     override_options = override_options_;
     includes = includes_;
     excludes = excludes_;
     manifest_config = manifest_config_;
     task_report_config = task_report_config_;
     tags = tags_;
   }
    : start_task_execution_request)

let make_task_list_entry ?task_arn:(task_arn_ : task_arn option)
    ?status:(status_ : task_status option) ?name:(name_ : tag_value option)
    ?task_mode:(task_mode_ : task_mode option) () =
  ({ task_arn = task_arn_; status = status_; name = name_; task_mode = task_mode_ }
    : task_list_entry)

let make_list_tasks_response ?tasks:(tasks_ : task_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tasks = tasks_; next_token = next_token_ } : list_tasks_response)

let make_task_filter ~name:(name_ : task_filter_name) ~values:(values_ : filter_values)
    ~operator:(operator_ : operator) () =
  ({ name = name_; values = values_; operator = operator_ } : task_filter)

let make_list_tasks_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : task_filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_tasks_request)

let make_task_execution_list_entry
    ?task_execution_arn:(task_execution_arn_ : task_execution_arn option)
    ?status:(status_ : task_execution_status option) ?task_mode:(task_mode_ : task_mode option) () =
  ({ task_execution_arn = task_execution_arn_; status = status_; task_mode = task_mode_ }
    : task_execution_list_entry)

let make_list_task_executions_response
    ?task_executions:(task_executions_ : task_execution_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ task_executions = task_executions_; next_token = next_token_ } : list_task_executions_response)

let make_list_task_executions_request ?task_arn:(task_arn_ : task_arn option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ task_arn = task_arn_; max_results = max_results_; next_token = next_token_ }
    : list_task_executions_request)

let make_list_tags_for_resource_response ?tags:(tags_ : output_tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_location_list_entry ?location_arn:(location_arn_ : location_arn option)
    ?location_uri:(location_uri_ : location_uri option) () =
  ({ location_arn = location_arn_; location_uri = location_uri_ } : location_list_entry)

let make_list_locations_response ?locations:(locations_ : location_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ locations = locations_; next_token = next_token_ } : list_locations_response)

let make_location_filter ~name:(name_ : location_filter_name) ~values:(values_ : filter_values)
    ~operator:(operator_ : operator) () =
  ({ name = name_; values = values_; operator = operator_ } : location_filter)

let make_list_locations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : location_filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_locations_request)

let make_list_agents_response ?agents:(agents_ : agent_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ agents = agents_; next_token = next_token_ } : list_agents_response)

let make_list_agents_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_agents_request)
