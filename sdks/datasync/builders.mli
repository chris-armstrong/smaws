open Types

val make_platform : ?version:agent_version -> unit -> platform

val make_agent_list_entry :
  ?agent_arn:agent_arn ->
  ?name:tag_value ->
  ?status:agent_status ->
  ?platform:platform ->
  unit ->
  agent_list_entry

val make_azure_blob_sas_configuration :
  token:azure_blob_sas_token -> unit -> azure_blob_sas_configuration

val make_cancel_task_execution_response : unit -> unit

val make_cancel_task_execution_request :
  task_execution_arn:task_execution_arn -> unit -> cancel_task_execution_request

val make_cmk_secret_config :
  ?secret_arn:secret_arn -> ?kms_key_arn:kms_key_arn -> unit -> cmk_secret_config

val make_create_agent_response : ?agent_arn:agent_arn -> unit -> create_agent_response
val make_tag_list_entry : ?value:tag_value -> key:tag_key -> unit -> tag_list_entry

val make_create_agent_request :
  ?agent_name:tag_value ->
  ?tags:input_tag_list ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?subnet_arns:pl_subnet_arn_list ->
  ?security_group_arns:pl_security_group_arn_list ->
  activation_key:activation_key ->
  unit ->
  create_agent_request

val make_create_location_azure_blob_response :
  ?location_arn:location_arn -> unit -> create_location_azure_blob_response

val make_custom_secret_config :
  ?secret_arn:secret_arn ->
  ?secret_access_role_arn:iam_role_arn_or_empty_string ->
  unit ->
  custom_secret_config

val make_create_location_azure_blob_request :
  ?sas_configuration:azure_blob_sas_configuration ->
  ?blob_type:azure_blob_type ->
  ?access_tier:azure_access_tier ->
  ?subdirectory:azure_blob_subdirectory ->
  ?agent_arns:agent_arn_list ->
  ?tags:input_tag_list ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  container_url:azure_blob_container_url ->
  authentication_type:azure_blob_authentication_type ->
  unit ->
  create_location_azure_blob_request

val make_create_location_efs_response :
  ?location_arn:location_arn -> unit -> create_location_efs_response

val make_ec2_config :
  subnet_arn:ec2_subnet_arn -> security_group_arns:ec2_security_group_arn_list -> unit -> ec2_config

val make_create_location_efs_request :
  ?subdirectory:efs_subdirectory ->
  ?tags:input_tag_list ->
  ?access_point_arn:efs_access_point_arn ->
  ?file_system_access_role_arn:iam_role_arn ->
  ?in_transit_encryption:efs_in_transit_encryption ->
  efs_filesystem_arn:efs_filesystem_arn ->
  ec2_config:ec2_config ->
  unit ->
  create_location_efs_request

val make_create_location_fsx_lustre_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_lustre_response

val make_create_location_fsx_lustre_request :
  ?subdirectory:fsx_lustre_subdirectory ->
  ?tags:input_tag_list ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  security_group_arns:ec2_security_group_arn_list ->
  unit ->
  create_location_fsx_lustre_request

val make_create_location_fsx_ontap_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_ontap_response

val make_managed_secret_config : ?secret_arn:secret_arn -> unit -> managed_secret_config
val make_smb_mount_options : ?version:smb_version -> unit -> smb_mount_options

val make_fsx_protocol_smb :
  ?domain:smb_domain ->
  ?mount_options:smb_mount_options ->
  ?password:smb_password ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  user:smb_user ->
  unit ->
  fsx_protocol_smb

val make_nfs_mount_options : ?version:nfs_version -> unit -> nfs_mount_options
val make_fsx_protocol_nfs : ?mount_options:nfs_mount_options -> unit -> fsx_protocol_nfs
val make_fsx_protocol : ?nf_s:fsx_protocol_nfs -> ?sm_b:fsx_protocol_smb -> unit -> fsx_protocol

val make_create_location_fsx_ontap_request :
  ?subdirectory:fsx_ontap_subdirectory ->
  ?tags:input_tag_list ->
  protocol:fsx_protocol ->
  security_group_arns:ec2_security_group_arn_list ->
  storage_virtual_machine_arn:storage_virtual_machine_arn ->
  unit ->
  create_location_fsx_ontap_request

val make_create_location_fsx_open_zfs_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_open_zfs_response

val make_create_location_fsx_open_zfs_request :
  ?subdirectory:fsx_open_zfs_subdirectory ->
  ?tags:input_tag_list ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  protocol:fsx_protocol ->
  security_group_arns:ec2_security_group_arn_list ->
  unit ->
  create_location_fsx_open_zfs_request

val make_create_location_fsx_windows_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_windows_response

val make_create_location_fsx_windows_request :
  ?subdirectory:fsx_windows_subdirectory ->
  ?tags:input_tag_list ->
  ?domain:smb_domain ->
  ?password:smb_password ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  security_group_arns:ec2_security_group_arn_list ->
  user:smb_user ->
  unit ->
  create_location_fsx_windows_request

val make_create_location_hdfs_response :
  ?location_arn:location_arn -> unit -> create_location_hdfs_response

val make_qop_configuration :
  ?rpc_protection:hdfs_rpc_protection ->
  ?data_transfer_protection:hdfs_data_transfer_protection ->
  unit ->
  qop_configuration

val make_hdfs_name_node :
  hostname:hdfs_server_hostname -> port:hdfs_server_port -> unit -> hdfs_name_node

val make_create_location_hdfs_request :
  ?subdirectory:hdfs_subdirectory ->
  ?block_size:hdfs_block_size ->
  ?replication_factor:hdfs_replication_factor ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?qop_configuration:qop_configuration ->
  ?simple_user:hdfs_user ->
  ?kerberos_principal:kerberos_principal ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?tags:input_tag_list ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  name_nodes:hdfs_name_node_list ->
  authentication_type:hdfs_authentication_type ->
  agent_arns:agent_arn_list ->
  unit ->
  create_location_hdfs_request

val make_create_location_nfs_response :
  ?location_arn:location_arn -> unit -> create_location_nfs_response

val make_on_prem_config : agent_arns:agent_arn_list -> unit -> on_prem_config

val make_create_location_nfs_request :
  ?mount_options:nfs_mount_options ->
  ?tags:input_tag_list ->
  subdirectory:nfs_subdirectory ->
  server_hostname:server_hostname ->
  on_prem_config:on_prem_config ->
  unit ->
  create_location_nfs_request

val make_create_location_object_storage_response :
  ?location_arn:location_arn -> unit -> create_location_object_storage_response

val make_create_location_object_storage_request :
  ?server_port:object_storage_server_port ->
  ?server_protocol:object_storage_server_protocol ->
  ?subdirectory:s3_subdirectory ->
  ?access_key:object_storage_access_key ->
  ?secret_key:object_storage_secret_key ->
  ?agent_arns:agent_arn_list ->
  ?tags:input_tag_list ->
  ?server_certificate:object_storage_certificate ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  server_hostname:server_hostname ->
  bucket_name:object_storage_bucket_name ->
  unit ->
  create_location_object_storage_request

val make_create_location_s3_response :
  ?location_arn:location_arn -> unit -> create_location_s3_response

val make_s3_config : bucket_access_role_arn:iam_role_arn -> unit -> s3_config

val make_create_location_s3_request :
  ?subdirectory:s3_subdirectory ->
  ?s3_storage_class:s3_storage_class ->
  ?agent_arns:agent_arn_list ->
  ?tags:input_tag_list ->
  s3_bucket_arn:s3_bucket_arn ->
  s3_config:s3_config ->
  unit ->
  create_location_s3_request

val make_create_location_smb_response :
  ?location_arn:location_arn -> unit -> create_location_smb_response

val make_create_location_smb_request :
  ?user:smb_user ->
  ?domain:smb_domain ->
  ?password:smb_password ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  ?mount_options:smb_mount_options ->
  ?tags:input_tag_list ->
  ?authentication_type:smb_authentication_type ->
  ?dns_ip_addresses:dns_ip_list ->
  ?kerberos_principal:kerberos_principal ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  subdirectory:smb_subdirectory ->
  server_hostname:server_hostname ->
  agent_arns:agent_arn_list ->
  unit ->
  create_location_smb_request

val make_create_task_response : ?task_arn:task_arn -> unit -> create_task_response
val make_report_override : ?report_level:report_level -> unit -> report_override

val make_report_overrides :
  ?transferred:report_override ->
  ?verified:report_override ->
  ?deleted:report_override ->
  ?skipped:report_override ->
  unit ->
  report_overrides

val make_report_destination_s3 :
  ?subdirectory:s3_subdirectory ->
  s3_bucket_arn:s3_bucket_arn ->
  bucket_access_role_arn:iam_role_arn ->
  unit ->
  report_destination_s3

val make_report_destination : ?s3:report_destination_s3 -> unit -> report_destination

val make_task_report_config :
  ?destination:report_destination ->
  ?output_type:report_output_type ->
  ?report_level:report_level ->
  ?object_version_ids:object_version_ids ->
  ?overrides:report_overrides ->
  unit ->
  task_report_config

val make_s3_manifest_config :
  ?manifest_object_version_id:s3_object_version_id ->
  manifest_object_path:s3_subdirectory ->
  bucket_access_role_arn:iam_role_arn ->
  s3_bucket_arn:s3_bucket_arn ->
  unit ->
  s3_manifest_config

val make_source_manifest_config : s3:s3_manifest_config -> unit -> source_manifest_config

val make_manifest_config :
  ?action:manifest_action ->
  ?format:manifest_format ->
  ?source:source_manifest_config ->
  unit ->
  manifest_config

val make_filter_rule : ?filter_type:filter_type -> ?value:filter_value -> unit -> filter_rule

val make_task_schedule :
  ?status:schedule_status -> schedule_expression:schedule_expression_cron -> unit -> task_schedule

val make_options :
  ?verify_mode:verify_mode ->
  ?overwrite_mode:overwrite_mode ->
  ?atime:atime ->
  ?mtime:mtime ->
  ?uid:uid ->
  ?gid:gid ->
  ?preserve_deleted_files:preserve_deleted_files ->
  ?preserve_devices:preserve_devices ->
  ?posix_permissions:posix_permissions ->
  ?bytes_per_second:bytes_per_second ->
  ?task_queueing:task_queueing ->
  ?log_level:log_level ->
  ?transfer_mode:transfer_mode ->
  ?security_descriptor_copy_flags:smb_security_descriptor_copy_flags ->
  ?object_tags:object_tags ->
  unit ->
  options

val make_create_task_request :
  ?cloud_watch_log_group_arn:log_group_arn ->
  ?name:tag_value ->
  ?options:options ->
  ?excludes:filter_list ->
  ?schedule:task_schedule ->
  ?tags:input_tag_list ->
  ?includes:filter_list ->
  ?manifest_config:manifest_config ->
  ?task_report_config:task_report_config ->
  ?task_mode:task_mode ->
  source_location_arn:location_arn ->
  destination_location_arn:location_arn ->
  unit ->
  create_task_request

val make_delete_agent_response : unit -> unit
val make_delete_agent_request : agent_arn:agent_arn -> unit -> delete_agent_request
val make_delete_location_response : unit -> unit
val make_delete_location_request : location_arn:location_arn -> unit -> delete_location_request
val make_delete_task_response : unit -> unit
val make_delete_task_request : task_arn:task_arn -> unit -> delete_task_request

val make_private_link_config :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?private_link_endpoint:endpoint ->
  ?subnet_arns:pl_subnet_arn_list ->
  ?security_group_arns:pl_security_group_arn_list ->
  unit ->
  private_link_config

val make_describe_agent_response :
  ?agent_arn:agent_arn ->
  ?name:tag_value ->
  ?status:agent_status ->
  ?last_connection_time:time ->
  ?creation_time:time ->
  ?endpoint_type:endpoint_type ->
  ?private_link_config:private_link_config ->
  ?platform:platform ->
  unit ->
  describe_agent_response

val make_describe_agent_request : agent_arn:agent_arn -> unit -> describe_agent_request

val make_describe_location_azure_blob_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?authentication_type:azure_blob_authentication_type ->
  ?blob_type:azure_blob_type ->
  ?access_tier:azure_access_tier ->
  ?agent_arns:agent_arn_list ->
  ?creation_time:time ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  describe_location_azure_blob_response

val make_describe_location_azure_blob_request :
  location_arn:location_arn -> unit -> describe_location_azure_blob_request

val make_describe_location_efs_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?ec2_config:ec2_config ->
  ?creation_time:time ->
  ?access_point_arn:efs_access_point_arn ->
  ?file_system_access_role_arn:iam_role_arn ->
  ?in_transit_encryption:efs_in_transit_encryption ->
  unit ->
  describe_location_efs_response

val make_describe_location_efs_request :
  location_arn:location_arn -> unit -> describe_location_efs_request

val make_describe_location_fsx_lustre_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?creation_time:time ->
  unit ->
  describe_location_fsx_lustre_response

val make_describe_location_fsx_lustre_request :
  location_arn:location_arn -> unit -> describe_location_fsx_lustre_request

val make_describe_location_fsx_ontap_response :
  ?creation_time:time ->
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?protocol:fsx_protocol ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?storage_virtual_machine_arn:storage_virtual_machine_arn ->
  ?fsx_filesystem_arn:fsx_filesystem_arn ->
  unit ->
  describe_location_fsx_ontap_response

val make_describe_location_fsx_ontap_request :
  location_arn:location_arn -> unit -> describe_location_fsx_ontap_request

val make_describe_location_fsx_open_zfs_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?protocol:fsx_protocol ->
  ?creation_time:time ->
  unit ->
  describe_location_fsx_open_zfs_response

val make_describe_location_fsx_open_zfs_request :
  location_arn:location_arn -> unit -> describe_location_fsx_open_zfs_request

val make_describe_location_fsx_windows_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?creation_time:time ->
  ?user:smb_user ->
  ?domain:smb_domain ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  describe_location_fsx_windows_response

val make_describe_location_fsx_windows_request :
  location_arn:location_arn -> unit -> describe_location_fsx_windows_request

val make_describe_location_hdfs_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?name_nodes:hdfs_name_node_list ->
  ?block_size:hdfs_block_size ->
  ?replication_factor:hdfs_replication_factor ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?qop_configuration:qop_configuration ->
  ?authentication_type:hdfs_authentication_type ->
  ?simple_user:hdfs_user ->
  ?kerberos_principal:kerberos_principal ->
  ?agent_arns:agent_arn_list ->
  ?creation_time:time ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  describe_location_hdfs_response

val make_describe_location_hdfs_request :
  location_arn:location_arn -> unit -> describe_location_hdfs_request

val make_describe_location_nfs_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?on_prem_config:on_prem_config ->
  ?mount_options:nfs_mount_options ->
  ?creation_time:time ->
  unit ->
  describe_location_nfs_response

val make_describe_location_nfs_request :
  location_arn:location_arn -> unit -> describe_location_nfs_request

val make_describe_location_object_storage_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?access_key:object_storage_access_key ->
  ?server_port:object_storage_server_port ->
  ?server_protocol:object_storage_server_protocol ->
  ?agent_arns:agent_arn_list ->
  ?creation_time:time ->
  ?server_certificate:object_storage_certificate ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  describe_location_object_storage_response

val make_describe_location_object_storage_request :
  location_arn:location_arn -> unit -> describe_location_object_storage_request

val make_describe_location_s3_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?s3_storage_class:s3_storage_class ->
  ?s3_config:s3_config ->
  ?agent_arns:agent_arn_list ->
  ?creation_time:time ->
  unit ->
  describe_location_s3_response

val make_describe_location_s3_request :
  location_arn:location_arn -> unit -> describe_location_s3_request

val make_describe_location_smb_response :
  ?location_arn:location_arn ->
  ?location_uri:location_uri ->
  ?agent_arns:agent_arn_list ->
  ?user:smb_user ->
  ?domain:smb_domain ->
  ?mount_options:smb_mount_options ->
  ?creation_time:time ->
  ?dns_ip_addresses:dns_ip_list ->
  ?kerberos_principal:kerberos_principal ->
  ?authentication_type:smb_authentication_type ->
  ?managed_secret_config:managed_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  describe_location_smb_response

val make_describe_location_smb_request :
  location_arn:location_arn -> unit -> describe_location_smb_request

val make_task_schedule_details :
  ?status_update_time:time ->
  ?disabled_reason:schedule_disabled_reason ->
  ?disabled_by:schedule_disabled_by ->
  unit ->
  task_schedule_details

val make_describe_task_response :
  ?task_arn:task_arn ->
  ?status:task_status ->
  ?name:tag_value ->
  ?current_task_execution_arn:task_execution_arn ->
  ?source_location_arn:location_arn ->
  ?destination_location_arn:location_arn ->
  ?cloud_watch_log_group_arn:log_group_arn ->
  ?source_network_interface_arns:source_network_interface_arns ->
  ?destination_network_interface_arns:destination_network_interface_arns ->
  ?options:options ->
  ?excludes:filter_list ->
  ?schedule:task_schedule ->
  ?error_code:string_ ->
  ?error_detail:string_ ->
  ?creation_time:time ->
  ?includes:filter_list ->
  ?manifest_config:manifest_config ->
  ?task_report_config:task_report_config ->
  ?schedule_details:task_schedule_details ->
  ?task_mode:task_mode ->
  unit ->
  describe_task_response

val make_describe_task_request : task_arn:task_arn -> unit -> describe_task_request

val make_task_execution_folders_failed_detail :
  ?list_:long ->
  ?prepare:long ->
  ?transfer:long ->
  ?verify:long ->
  ?delete:long ->
  unit ->
  task_execution_folders_failed_detail

val make_task_execution_folders_listed_detail :
  ?at_source:long -> ?at_destination_for_delete:long -> unit -> task_execution_folders_listed_detail

val make_task_execution_files_failed_detail :
  ?prepare:long ->
  ?transfer:long ->
  ?verify:long ->
  ?delete:long ->
  unit ->
  task_execution_files_failed_detail

val make_task_execution_files_listed_detail :
  ?at_source:long -> ?at_destination_for_delete:long -> unit -> task_execution_files_listed_detail

val make_task_execution_result_detail :
  ?prepare_duration:duration ->
  ?prepare_status:phase_status ->
  ?total_duration:duration ->
  ?transfer_duration:duration ->
  ?transfer_status:phase_status ->
  ?verify_duration:duration ->
  ?verify_status:phase_status ->
  ?error_code:string_ ->
  ?error_detail:string_ ->
  unit ->
  task_execution_result_detail

val make_describe_task_execution_response :
  ?task_execution_arn:task_execution_arn ->
  ?status:task_execution_status ->
  ?options:options ->
  ?excludes:filter_list ->
  ?includes:filter_list ->
  ?manifest_config:manifest_config ->
  ?start_time:time ->
  ?estimated_files_to_transfer:long ->
  ?estimated_bytes_to_transfer:long ->
  ?files_transferred:long ->
  ?bytes_written:long ->
  ?bytes_transferred:long ->
  ?bytes_compressed:long ->
  ?result_:task_execution_result_detail ->
  ?task_report_config:task_report_config ->
  ?files_deleted:long ->
  ?files_skipped:long ->
  ?files_verified:long ->
  ?report_result:report_result ->
  ?estimated_files_to_delete:long ->
  ?task_mode:task_mode ->
  ?files_prepared:long ->
  ?files_listed:task_execution_files_listed_detail ->
  ?files_failed:task_execution_files_failed_detail ->
  ?estimated_folders_to_delete:item_count ->
  ?estimated_folders_to_transfer:item_count ->
  ?folders_skipped:item_count ->
  ?folders_prepared:item_count ->
  ?folders_transferred:item_count ->
  ?folders_verified:item_count ->
  ?folders_deleted:item_count ->
  ?folders_listed:task_execution_folders_listed_detail ->
  ?folders_failed:task_execution_folders_failed_detail ->
  ?launch_time:time ->
  ?end_time:time ->
  unit ->
  describe_task_execution_response

val make_describe_task_execution_request :
  task_execution_arn:task_execution_arn -> unit -> describe_task_execution_request

val make_update_task_execution_response : unit -> unit

val make_update_task_execution_request :
  task_execution_arn:task_execution_arn -> options:options -> unit -> update_task_execution_request

val make_update_task_response : unit -> unit

val make_update_task_request :
  ?options:options ->
  ?excludes:filter_list ->
  ?schedule:task_schedule ->
  ?name:tag_value ->
  ?cloud_watch_log_group_arn:log_group_arn ->
  ?includes:filter_list ->
  ?manifest_config:manifest_config ->
  ?task_report_config:task_report_config ->
  task_arn:task_arn ->
  unit ->
  update_task_request

val make_update_location_smb_response : unit -> unit

val make_update_location_smb_request :
  ?subdirectory:smb_subdirectory ->
  ?server_hostname:server_hostname ->
  ?user:smb_user ->
  ?domain:smb_domain ->
  ?password:smb_password ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  ?agent_arns:agent_arn_list ->
  ?mount_options:smb_mount_options ->
  ?authentication_type:smb_authentication_type ->
  ?dns_ip_addresses:dns_ip_list ->
  ?kerberos_principal:kerberos_principal ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  location_arn:location_arn ->
  unit ->
  update_location_smb_request

val make_update_location_s3_response : unit -> unit

val make_update_location_s3_request :
  ?subdirectory:s3_subdirectory ->
  ?s3_storage_class:s3_storage_class ->
  ?s3_config:s3_config ->
  location_arn:location_arn ->
  unit ->
  update_location_s3_request

val make_update_location_object_storage_response : unit -> unit

val make_update_location_object_storage_request :
  ?server_port:object_storage_server_port ->
  ?server_protocol:object_storage_server_protocol ->
  ?subdirectory:s3_subdirectory ->
  ?server_hostname:server_hostname ->
  ?access_key:object_storage_access_key ->
  ?secret_key:object_storage_secret_key ->
  ?agent_arns:agent_arn_list ->
  ?server_certificate:object_storage_certificate ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  location_arn:location_arn ->
  unit ->
  update_location_object_storage_request

val make_update_location_nfs_response : unit -> unit

val make_update_location_nfs_request :
  ?subdirectory:nfs_subdirectory ->
  ?server_hostname:server_hostname ->
  ?on_prem_config:on_prem_config ->
  ?mount_options:nfs_mount_options ->
  location_arn:location_arn ->
  unit ->
  update_location_nfs_request

val make_update_location_hdfs_response : unit -> unit

val make_update_location_hdfs_request :
  ?subdirectory:hdfs_subdirectory ->
  ?name_nodes:hdfs_name_node_list ->
  ?block_size:hdfs_block_size ->
  ?replication_factor:hdfs_replication_factor ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?qop_configuration:qop_configuration ->
  ?authentication_type:hdfs_authentication_type ->
  ?simple_user:hdfs_user ->
  ?kerberos_principal:kerberos_principal ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?agent_arns:agent_arn_list ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  location_arn:location_arn ->
  unit ->
  update_location_hdfs_request

val make_update_location_fsx_windows_response : unit -> unit

val make_update_location_fsx_windows_request :
  ?subdirectory:fsx_windows_subdirectory ->
  ?domain:update_smb_domain ->
  ?user:smb_user ->
  ?password:smb_password ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_windows_request

val make_update_location_fsx_open_zfs_response : unit -> unit

val make_update_location_fsx_open_zfs_request :
  ?protocol:fsx_protocol ->
  ?subdirectory:smb_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_open_zfs_request

val make_update_location_fsx_ontap_response : unit -> unit

val make_fsx_update_protocol_smb :
  ?domain:update_smb_domain ->
  ?mount_options:smb_mount_options ->
  ?password:smb_password ->
  ?user:smb_user ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  unit ->
  fsx_update_protocol_smb

val make_fsx_update_protocol :
  ?nf_s:fsx_protocol_nfs -> ?sm_b:fsx_update_protocol_smb -> unit -> fsx_update_protocol

val make_update_location_fsx_ontap_request :
  ?protocol:fsx_update_protocol ->
  ?subdirectory:fsx_ontap_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_ontap_request

val make_update_location_fsx_lustre_response : unit -> unit

val make_update_location_fsx_lustre_request :
  ?subdirectory:smb_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_lustre_request

val make_update_location_efs_response : unit -> unit

val make_update_location_efs_request :
  ?subdirectory:efs_subdirectory ->
  ?access_point_arn:updated_efs_access_point_arn ->
  ?file_system_access_role_arn:updated_efs_iam_role_arn ->
  ?in_transit_encryption:efs_in_transit_encryption ->
  location_arn:location_arn ->
  unit ->
  update_location_efs_request

val make_update_location_azure_blob_response : unit -> unit

val make_update_location_azure_blob_request :
  ?subdirectory:azure_blob_subdirectory ->
  ?authentication_type:azure_blob_authentication_type ->
  ?sas_configuration:azure_blob_sas_configuration ->
  ?blob_type:azure_blob_type ->
  ?access_tier:azure_access_tier ->
  ?agent_arns:agent_arn_list ->
  ?cmk_secret_config:cmk_secret_config ->
  ?custom_secret_config:custom_secret_config ->
  location_arn:location_arn ->
  unit ->
  update_location_azure_blob_request

val make_update_agent_response : unit -> unit

val make_update_agent_request :
  ?name:tag_value -> agent_arn:agent_arn -> unit -> update_agent_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:input_tag_list -> unit -> tag_resource_request

val make_start_task_execution_response :
  ?task_execution_arn:task_execution_arn -> unit -> start_task_execution_response

val make_start_task_execution_request :
  ?override_options:options ->
  ?includes:filter_list ->
  ?excludes:filter_list ->
  ?manifest_config:manifest_config ->
  ?task_report_config:task_report_config ->
  ?tags:input_tag_list ->
  task_arn:task_arn ->
  unit ->
  start_task_execution_request

val make_task_list_entry :
  ?task_arn:task_arn ->
  ?status:task_status ->
  ?name:tag_value ->
  ?task_mode:task_mode ->
  unit ->
  task_list_entry

val make_list_tasks_response :
  ?tasks:task_list -> ?next_token:next_token -> unit -> list_tasks_response

val make_task_filter :
  name:task_filter_name -> values:filter_values -> operator:operator -> unit -> task_filter

val make_list_tasks_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:task_filters ->
  unit ->
  list_tasks_request

val make_task_execution_list_entry :
  ?task_execution_arn:task_execution_arn ->
  ?status:task_execution_status ->
  ?task_mode:task_mode ->
  unit ->
  task_execution_list_entry

val make_list_task_executions_response :
  ?task_executions:task_execution_list ->
  ?next_token:next_token ->
  unit ->
  list_task_executions_response

val make_list_task_executions_request :
  ?task_arn:task_arn ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_task_executions_request

val make_list_tags_for_resource_response :
  ?tags:output_tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:taggable_resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_location_list_entry :
  ?location_arn:location_arn -> ?location_uri:location_uri -> unit -> location_list_entry

val make_list_locations_response :
  ?locations:location_list -> ?next_token:next_token -> unit -> list_locations_response

val make_location_filter :
  name:location_filter_name -> values:filter_values -> operator:operator -> unit -> location_filter

val make_list_locations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:location_filters ->
  unit ->
  list_locations_request

val make_list_agents_response :
  ?agents:agent_list -> ?next_token:next_token -> unit -> list_agents_response

val make_list_agents_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_agents_request
