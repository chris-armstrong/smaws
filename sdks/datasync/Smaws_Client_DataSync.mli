(** DataSync client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ListAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agents_request ->
    ( list_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agents_request ->
    ( list_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DataSync agents that belong to an Amazon Web Services account in the Amazon \
   Web Services Region specified in the request.\n\n\
  \ With pagination, you can reduce the number of agents returned in a response. If you get a \
   truncated list of agents in a response, the response contains a marker that you can specify in \
   your next request to fetch the next page of agents.\n\
  \ \n\
  \   [ListAgents] is eventually consistent. This means the result of running the operation might \
   not reflect that you just created or deleted an agent. For example, if you create an agent with \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_CreateAgent.html}CreateAgent} and \
   then immediately run [ListAgents], that agent might not show up in the list right away. In \
   situations like this, you can always confirm whether an agent has been created (or deleted) by \
   using \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_DescribeAgent.html}DescribeAgent}.\n\
  \  "]

module ListLocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_locations_request ->
    ( list_locations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_locations_request ->
    ( list_locations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of source and destination locations.\n\n\
  \ If you have more locations than are returned in a response (that is, the response returns only \
   a truncated list of your agents), the response contains a token that you can specify in your \
   next request to fetch the next page of locations.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns all the tags associated with an Amazon Web Services resource.\n"]

module ListTaskExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_task_executions_request ->
    ( list_task_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_task_executions_request ->
    ( list_task_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of executions for an DataSync transfer task.\n"]

module ListTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the DataSync tasks you created.\n"]

module StartTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_task_execution_request ->
    ( start_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_task_execution_request ->
    ( start_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an DataSync transfer task. For each task, you can only run one task execution at a time.\n\n\
  \ There are several steps to a task execution. For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/working-with-task-executions.html#understand-task-execution-statuses}Task \
   execution statuses}.\n\
  \ \n\
  \   If you're planning to transfer data to or from an Amazon S3 location, review \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}how \
   DataSync can affect your S3 request charges} and the \
   {{:http://aws.amazon.com/datasync/pricing/}DataSync pricing page} before you begin.\n\
  \   \n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a {i tag} to an Amazon Web Services resource. Tags are key-value pairs that can help \
   you manage, filter, and search for your resources.\n\n\
  \ These include DataSync resources, such as locations, tasks, and task executions.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_agent_request ->
    ( update_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_agent_request ->
    ( update_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the name of an DataSync agent.\n"]

module UpdateLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_azure_blob_request ->
    ( update_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_azure_blob_request ->
    ( update_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configurations of the Microsoft Azure Blob Storage transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html}Configuring \
   DataSync transfers with Azure Blob Storage}.\n\
  \ "]

module UpdateLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_efs_request ->
    ( update_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_efs_request ->
    ( update_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon EFS transfer location that you're \
   using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html}Configuring \
   DataSync transfers with Amazon EFS}.\n\
  \ "]

module UpdateLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_lustre_request ->
    ( update_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_lustre_request ->
    ( update_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for Lustre transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html}Configuring \
   DataSync transfers with FSx for Lustre}.\n\
  \ "]

module UpdateLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_ontap_request ->
    ( update_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_ontap_request ->
    ( update_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for NetApp ONTAP transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html}Configuring \
   DataSync transfers with FSx for ONTAP}.\n\
  \ "]

module UpdateLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_open_zfs_request ->
    ( update_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_open_zfs_request ->
    ( update_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for OpenZFS transfer location \
   that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html}Configuring \
   DataSync transfers with FSx for OpenZFS}.\n\
  \ \n\
  \   Request parameters related to [SMB] aren't supported with the [UpdateLocationFsxOpenZfs] \
   operation.\n\
  \   \n\
  \    "]

module UpdateLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_windows_request ->
    ( update_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_fsx_windows_request ->
    ( update_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon FSx for Windows File Server \
   transfer location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html}Configuring \
   DataSync transfers with FSx for Windows File Server}.\n\
  \ "]

module UpdateLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_hdfs_request ->
    ( update_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_hdfs_request ->
    ( update_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Hadoop Distributed File System (HDFS) \
   transfer location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html}Configuring \
   DataSync transfers with an HDFS cluster}.\n\
  \ "]

module UpdateLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_nfs_request ->
    ( update_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_nfs_request ->
    ( update_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Network File System (NFS) transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html}Configuring \
   transfers with an NFS file server}.\n\
  \ "]

module UpdateLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_object_storage_request ->
    ( update_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_object_storage_request ->
    ( update_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the object storage transfer location that \
   you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html}Configuring \
   DataSync transfers with an object storage system}.\n\
  \ "]

module UpdateLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_s3_request ->
    ( update_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_s3_request ->
    ( update_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Amazon S3 transfer location that you're \
   using with DataSync.\n\n\
  \  Before you begin, make sure that you read the following topics:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
   class considerations with Amazon S3 locations} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}Evaluating \
   S3 request costs when using DataSync} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module UpdateLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_location_smb_request ->
    ( update_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_location_smb_request ->
    ( update_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the following configuration parameters of the Server Message Block (SMB) transfer \
   location that you're using with DataSync.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html}Configuring \
   DataSync transfers with an SMB file server}.\n\
  \ "]

module UpdateTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_request ->
    ( update_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_request ->
    ( update_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of a {i task}, which defines where and how DataSync transfers your \
   data.\n"]

module UpdateTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_execution_request ->
    ( update_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_execution_request ->
    ( update_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of a running DataSync task execution.\n\n\
  \  Currently, the only [Option] that you can modify with [UpdateTaskExecution] is \n\
  \  {[\n\
  \   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/API_Options.html#DataSync-Type-Options-BytesPerSecond}BytesPerSecond} \n\
  \  ]}\n\
  \  , which throttles bandwidth for a running or queued task execution.\n\
  \  \n\
  \   "]

module DescribeTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_execution_request ->
    ( describe_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_execution_request ->
    ( describe_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about an execution of your DataSync task. You can use this operation to \
   help monitor the progress of an ongoing data transfer or check the results of the transfer.\n\n\
  \  Some [DescribeTaskExecution] response elements are only relevant to a specific task mode. For \
   information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/choosing-task-mode.html#task-mode-differences}Understanding \
   task mode differences} and \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/transfer-performance-counters.html}Understanding \
   data transfer performance counters}.\n\
  \  \n\
  \   "]

module DescribeTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_request ->
    ( describe_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_request ->
    ( describe_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about a {i task}, which defines where and how DataSync transfers your data.\n"]

module DescribeLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_smb_request ->
    ( describe_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_smb_request ->
    ( describe_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Server Message Block (SMB) file \
   server is configured.\n"]

module DescribeLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_s3_request ->
    ( describe_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_s3_request ->
    ( describe_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an S3 bucket is configured.\n"]

module DescribeLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_object_storage_request ->
    ( describe_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_object_storage_request ->
    ( describe_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an object storage system is \
   configured.\n"]

module DescribeLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_nfs_request ->
    ( describe_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_nfs_request ->
    ( describe_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Network File System (NFS) file \
   server is configured.\n"]

module DescribeLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_hdfs_request ->
    ( describe_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_hdfs_request ->
    ( describe_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for a Hadoop Distributed File System \
   (HDFS) is configured.\n"]

module DescribeLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_windows_request ->
    ( describe_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_windows_request ->
    ( describe_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for Windows File \
   Server file system is configured.\n"]

module DescribeLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_open_zfs_request ->
    ( describe_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_open_zfs_request ->
    ( describe_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for OpenZFS file \
   system is configured.\n\n\
  \  Response elements related to [SMB] aren't supported with the [DescribeLocationFsxOpenZfs] \
   operation.\n\
  \  \n\
  \   "]

module DescribeLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_ontap_request ->
    ( describe_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_ontap_request ->
    ( describe_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for NetApp ONTAP \
   file system is configured.\n\n\
  \  If your location uses SMB, the [DescribeLocationFsxOntap] operation doesn't actually return a \
   [Password].\n\
  \  \n\
  \   "]

module DescribeLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_lustre_request ->
    ( describe_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_fsx_lustre_request ->
    ( describe_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon FSx for Lustre file \
   system is configured.\n"]

module DescribeLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_efs_request ->
    ( describe_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_efs_request ->
    ( describe_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for an Amazon EFS file system is \
   configured.\n"]

module DescribeLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_location_azure_blob_request ->
    ( describe_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_location_azure_blob_request ->
    ( describe_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about how an DataSync transfer location for Microsoft Azure Blob Storage is \
   configured.\n"]

module DescribeAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agent_request ->
    ( describe_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agent_request ->
    ( describe_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an DataSync agent, such as its name, service endpoint type, and status.\n"]

module DeleteTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_task_request ->
    ( delete_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_task_request ->
    ( delete_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a transfer task resource from DataSync.\n"]

module DeleteLocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_location_request ->
    ( delete_location_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_location_request ->
    ( delete_location_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a transfer location resource from DataSync. \n"]

module DeleteAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_agent_request ->
    ( delete_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_agent_request ->
    ( delete_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an DataSync agent resource from your Amazon Web Services account.\n\n\
  \ Keep in mind that this operation (which can't be undone) doesn't remove the agent's virtual \
   machine (VM) or Amazon EC2 instance from your storage environment. For next steps, you can \
   delete the VM or instance from your storage environment or reuse it to \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/activate-agent.html}activate a new \
   agent}.\n\
  \ "]

module CreateTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_task_request ->
    ( create_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_task_request ->
    ( create_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures a {i task}, which defines where and how DataSync transfers your data.\n\n\
  \ A task includes a source location, destination location, and transfer options (such as \
   bandwidth limits, scheduling, and more).\n\
  \ \n\
  \   If you're planning to transfer data to or from an Amazon S3 location, review \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}how \
   DataSync can affect your S3 request charges} and the \
   {{:http://aws.amazon.com/datasync/pricing/}DataSync pricing page} before you begin.\n\
  \   \n\
  \    "]

module CreateLocationSmb : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_smb_request ->
    ( create_location_smb_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_smb_request ->
    ( create_location_smb_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Server Message Block (SMB) file server. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync accesses SMB file servers. For \
   more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-smb-location.html#configuring-smb-permissions}Providing \
   DataSync access to SMB file servers}.\n\
  \ "]

module CreateLocationS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_s3_request ->
    ( create_location_s3_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_s3_request ->
    ( create_location_s3_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon S3 bucket. DataSync can use this location as a \
   source or destination for transferring data.\n\n\
  \  Before you begin, make sure that you read the following topics:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#using-storage-classes}Storage \
   class considerations with Amazon S3 locations} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html#create-s3-location-s3-requests}Evaluating \
   S3 request costs when using DataSync} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-s3-location.html}Configuring \
   transfers with Amazon S3}.\n\
  \    "]

module CreateLocationObjectStorage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_object_storage_request ->
    ( create_location_object_storage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_object_storage_request ->
    ( create_location_object_storage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an object storage system. DataSync can use this location as \
   a source or destination for transferring data. You can make transfers with or without a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html#when-agent-required}DataSync \
   agent}.\n\n\
  \ Before you begin, make sure that you understand the \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-object-location.html#create-object-location-prerequisites}prerequisites} \
   for DataSync to work with object storage systems.\n\
  \ "]

module CreateLocationNfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_nfs_request ->
    ( create_location_nfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_nfs_request ->
    ( create_location_nfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Network File System (NFS) file server. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-nfs-location.html#accessing-nfs}accesses \
   NFS file servers}.\n\
  \ "]

module CreateLocationHdfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_hdfs_request ->
    ( create_location_hdfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_hdfs_request ->
    ( create_location_hdfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Hadoop Distributed File System (HDFS). DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-hdfs-location.html#accessing-hdfs}accesses \
   HDFS clusters}.\n\
  \ "]

module CreateLocationFsxWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_windows_request ->
    ( create_location_fsx_windows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_windows_request ->
    ( create_location_fsx_windows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for Windows File Server file system. DataSync \
   can use this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-fsx-location.html#create-fsx-location-access}accesses \
   FSx for Windows File Server file systems}.\n\
  \ "]

module CreateLocationFsxOpenZfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_open_zfs_request ->
    ( create_location_fsx_open_zfs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_open_zfs_request ->
    ( create_location_fsx_open_zfs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for OpenZFS file system. DataSync can use \
   this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-openzfs-location.html#create-openzfs-access}accesses \
   FSx for OpenZFS file systems}.\n\
  \ \n\
  \   Request parameters related to [SMB] aren't supported with the [CreateLocationFsxOpenZfs] \
   operation.\n\
  \   \n\
  \    "]

module CreateLocationFsxOntap : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_ontap_request ->
    ( create_location_fsx_ontap_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_ontap_request ->
    ( create_location_fsx_ontap_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for NetApp ONTAP file system. DataSync can \
   use this location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-ontap-location.html#create-ontap-location-access}accesses \
   FSx for ONTAP file systems}.\n\
  \ "]

module CreateLocationFsxLustre : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_lustre_request ->
    ( create_location_fsx_lustre_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_fsx_lustre_request ->
    ( create_location_fsx_lustre_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon FSx for Lustre file system. DataSync can use this \
   location as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-lustre-location.html#create-lustre-location-access}accesses \
   FSx for Lustre file systems}.\n\
  \ "]

module CreateLocationEfs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_efs_request ->
    ( create_location_efs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_efs_request ->
    ( create_location_efs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for an Amazon EFS file system. DataSync can use this location \
   as a source or destination for transferring data.\n\n\
  \ Before you begin, make sure that you understand how DataSync \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/create-efs-location.html#create-efs-location-access}accesses \
   Amazon EFS file systems}.\n\
  \ "]

module CreateLocationAzureBlob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_location_azure_blob_request ->
    ( create_location_azure_blob_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_location_azure_blob_request ->
    ( create_location_azure_blob_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transfer {i location} for a Microsoft Azure Blob Storage container. DataSync can use \
   this location as a transfer source or destination. You can make transfers with or without a \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-creating-agent}DataSync \
   agent} that connects to your container.\n\n\
  \ Before you begin, make sure you know \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access}how \
   DataSync accesses Azure Blob Storage} and works with \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#azure-blob-access-tiers}access \
   tiers} and \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/creating-azure-blob-location.html#blob-types}blob \
   types}.\n\
  \ "]

module CreateAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_agent_request ->
    ( create_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_agent_request ->
    ( create_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates an DataSync agent that you deploy in your storage environment. The activation process \
   associates the agent with your Amazon Web Services account.\n\n\
  \ If you haven't deployed an agent yet, see \
   {{:https://docs.aws.amazon.com/datasync/latest/userguide/do-i-need-datasync-agent.html}Do I \
   need a DataSync agent?} \n\
  \ "]

(** {1:Serialization and Deserialization} *)
module CancelTaskExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_task_execution_request ->
    ( cancel_task_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_task_execution_request ->
    ( cancel_task_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an DataSync task execution that's in progress. The transfer of some files are abruptly \
   interrupted. File contents that're transferred to the destination might be incomplete or \
   inconsistent with the source files.\n\n\
  \ However, if you start a new task execution using the same task and allow it to finish, file \
   content on the destination will be complete and consistent. This applies to other unexpected \
   failures that interrupt a task execution. In all of these cases, DataSync successfully \
   completes the transfer when you start the next task execution.\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
