(** DataSync client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_task_response : unit -> unit

val make_options :
  ?object_tags:object_tags ->
  ?security_descriptor_copy_flags:smb_security_descriptor_copy_flags ->
  ?transfer_mode:transfer_mode ->
  ?log_level:log_level ->
  ?task_queueing:task_queueing ->
  ?bytes_per_second:bytes_per_second ->
  ?posix_permissions:posix_permissions ->
  ?preserve_devices:preserve_devices ->
  ?preserve_deleted_files:preserve_deleted_files ->
  ?gid:gid ->
  ?uid:uid ->
  ?mtime:mtime ->
  ?atime:atime ->
  ?overwrite_mode:overwrite_mode ->
  ?verify_mode:verify_mode ->
  unit ->
  options

val make_filter_rule : ?value:filter_value -> ?filter_type:filter_type -> unit -> filter_rule

val make_task_schedule :
  ?status:schedule_status -> schedule_expression:schedule_expression_cron -> unit -> task_schedule

val make_s3_manifest_config :
  ?manifest_object_version_id:s3_object_version_id ->
  s3_bucket_arn:s3_bucket_arn ->
  bucket_access_role_arn:iam_role_arn ->
  manifest_object_path:s3_subdirectory ->
  unit ->
  s3_manifest_config

val make_source_manifest_config : s3:s3_manifest_config -> unit -> source_manifest_config

val make_manifest_config :
  ?source:source_manifest_config ->
  ?format:manifest_format ->
  ?action:manifest_action ->
  unit ->
  manifest_config

val make_report_destination_s3 :
  ?subdirectory:s3_subdirectory ->
  bucket_access_role_arn:iam_role_arn ->
  s3_bucket_arn:s3_bucket_arn ->
  unit ->
  report_destination_s3

val make_report_destination : ?s3:report_destination_s3 -> unit -> report_destination
val make_report_override : ?report_level:report_level -> unit -> report_override

val make_report_overrides :
  ?skipped:report_override ->
  ?deleted:report_override ->
  ?verified:report_override ->
  ?transferred:report_override ->
  unit ->
  report_overrides

val make_task_report_config :
  ?overrides:report_overrides ->
  ?object_version_ids:object_version_ids ->
  ?report_level:report_level ->
  ?output_type:report_output_type ->
  ?destination:report_destination ->
  unit ->
  task_report_config

val make_update_task_request :
  ?task_report_config:task_report_config ->
  ?manifest_config:manifest_config ->
  ?includes:filter_list ->
  ?cloud_watch_log_group_arn:log_group_arn ->
  ?name:tag_value ->
  ?schedule:task_schedule ->
  ?excludes:filter_list ->
  ?options:options ->
  task_arn:task_arn ->
  unit ->
  update_task_request

val make_update_task_execution_response : unit -> unit

val make_update_task_execution_request :
  options:options -> task_execution_arn:task_execution_arn -> unit -> update_task_execution_request

val make_update_location_smb_response : unit -> unit

val make_cmk_secret_config :
  ?kms_key_arn:kms_key_arn -> ?secret_arn:secret_arn -> unit -> cmk_secret_config

val make_custom_secret_config :
  ?secret_access_role_arn:iam_role_arn_or_empty_string ->
  ?secret_arn:secret_arn ->
  unit ->
  custom_secret_config

val make_smb_mount_options : ?version:smb_version -> unit -> smb_mount_options

val make_update_location_smb_request :
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_principal:kerberos_principal ->
  ?dns_ip_addresses:dns_ip_list ->
  ?authentication_type:smb_authentication_type ->
  ?mount_options:smb_mount_options ->
  ?agent_arns:agent_arn_list ->
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?password:smb_password ->
  ?domain:smb_domain ->
  ?user:smb_user ->
  ?server_hostname:server_hostname ->
  ?subdirectory:smb_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_smb_request

val make_update_location_s3_response : unit -> unit
val make_s3_config : bucket_access_role_arn:iam_role_arn -> unit -> s3_config

val make_update_location_s3_request :
  ?s3_config:s3_config ->
  ?s3_storage_class:s3_storage_class ->
  ?subdirectory:s3_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_s3_request

val make_update_location_object_storage_response : unit -> unit

val make_update_location_object_storage_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?server_certificate:object_storage_certificate ->
  ?agent_arns:agent_arn_list ->
  ?secret_key:object_storage_secret_key ->
  ?access_key:object_storage_access_key ->
  ?server_hostname:server_hostname ->
  ?subdirectory:s3_subdirectory ->
  ?server_protocol:object_storage_server_protocol ->
  ?server_port:object_storage_server_port ->
  location_arn:location_arn ->
  unit ->
  update_location_object_storage_request

val make_update_location_nfs_response : unit -> unit
val make_on_prem_config : agent_arns:agent_arn_list -> unit -> on_prem_config
val make_nfs_mount_options : ?version:nfs_version -> unit -> nfs_mount_options

val make_update_location_nfs_request :
  ?mount_options:nfs_mount_options ->
  ?on_prem_config:on_prem_config ->
  ?server_hostname:server_hostname ->
  ?subdirectory:nfs_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_nfs_request

val make_update_location_hdfs_response : unit -> unit

val make_hdfs_name_node :
  port:hdfs_server_port -> hostname:hdfs_server_hostname -> unit -> hdfs_name_node

val make_qop_configuration :
  ?data_transfer_protection:hdfs_data_transfer_protection ->
  ?rpc_protection:hdfs_rpc_protection ->
  unit ->
  qop_configuration

val make_update_location_hdfs_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?agent_arns:agent_arn_list ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_principal:kerberos_principal ->
  ?simple_user:hdfs_user ->
  ?authentication_type:hdfs_authentication_type ->
  ?qop_configuration:qop_configuration ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?replication_factor:hdfs_replication_factor ->
  ?block_size:hdfs_block_size ->
  ?name_nodes:hdfs_name_node_list ->
  ?subdirectory:hdfs_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_hdfs_request

val make_update_location_fsx_windows_response : unit -> unit

val make_update_location_fsx_windows_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?password:smb_password ->
  ?user:smb_user ->
  ?domain:update_smb_domain ->
  ?subdirectory:fsx_windows_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_windows_request

val make_update_location_fsx_open_zfs_response : unit -> unit
val make_fsx_protocol_nfs : ?mount_options:nfs_mount_options -> unit -> fsx_protocol_nfs
val make_managed_secret_config : ?secret_arn:secret_arn -> unit -> managed_secret_config

val make_fsx_protocol_smb :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?password:smb_password ->
  ?mount_options:smb_mount_options ->
  ?domain:smb_domain ->
  user:smb_user ->
  unit ->
  fsx_protocol_smb

val make_fsx_protocol : ?sm_b:fsx_protocol_smb -> ?nf_s:fsx_protocol_nfs -> unit -> fsx_protocol

val make_update_location_fsx_open_zfs_request :
  ?subdirectory:smb_subdirectory ->
  ?protocol:fsx_protocol ->
  location_arn:location_arn ->
  unit ->
  update_location_fsx_open_zfs_request

val make_update_location_fsx_ontap_response : unit -> unit

val make_fsx_update_protocol_smb :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?user:smb_user ->
  ?password:smb_password ->
  ?mount_options:smb_mount_options ->
  ?domain:update_smb_domain ->
  unit ->
  fsx_update_protocol_smb

val make_fsx_update_protocol :
  ?sm_b:fsx_update_protocol_smb -> ?nf_s:fsx_protocol_nfs -> unit -> fsx_update_protocol

val make_update_location_fsx_ontap_request :
  ?subdirectory:fsx_ontap_subdirectory ->
  ?protocol:fsx_update_protocol ->
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
  ?in_transit_encryption:efs_in_transit_encryption ->
  ?file_system_access_role_arn:updated_efs_iam_role_arn ->
  ?access_point_arn:updated_efs_access_point_arn ->
  ?subdirectory:efs_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_efs_request

val make_update_location_azure_blob_response : unit -> unit

val make_azure_blob_sas_configuration :
  token:azure_blob_sas_token -> unit -> azure_blob_sas_configuration

val make_update_location_azure_blob_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?agent_arns:agent_arn_list ->
  ?access_tier:azure_access_tier ->
  ?blob_type:azure_blob_type ->
  ?sas_configuration:azure_blob_sas_configuration ->
  ?authentication_type:azure_blob_authentication_type ->
  ?subdirectory:azure_blob_subdirectory ->
  location_arn:location_arn ->
  unit ->
  update_location_azure_blob_request

val make_update_agent_response : unit -> unit

val make_update_agent_request :
  ?name:tag_value -> agent_arn:agent_arn -> unit -> update_agent_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  keys:tag_key_list -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_task_schedule_details :
  ?disabled_by:schedule_disabled_by ->
  ?disabled_reason:schedule_disabled_reason ->
  ?status_update_time:time ->
  unit ->
  task_schedule_details

val make_task_list_entry :
  ?task_mode:task_mode ->
  ?name:tag_value ->
  ?status:task_status ->
  ?task_arn:task_arn ->
  unit ->
  task_list_entry

val make_task_filter :
  operator:operator -> values:filter_values -> name:task_filter_name -> unit -> task_filter

val make_task_execution_result_detail :
  ?error_detail:string_ ->
  ?error_code:string_ ->
  ?verify_status:phase_status ->
  ?verify_duration:duration ->
  ?transfer_status:phase_status ->
  ?transfer_duration:duration ->
  ?total_duration:duration ->
  ?prepare_status:phase_status ->
  ?prepare_duration:duration ->
  unit ->
  task_execution_result_detail

val make_task_execution_list_entry :
  ?task_mode:task_mode ->
  ?status:task_execution_status ->
  ?task_execution_arn:task_execution_arn ->
  unit ->
  task_execution_list_entry

val make_task_execution_folders_listed_detail :
  ?at_destination_for_delete:long -> ?at_source:long -> unit -> task_execution_folders_listed_detail

val make_task_execution_folders_failed_detail :
  ?delete:long ->
  ?verify:long ->
  ?transfer:long ->
  ?prepare:long ->
  ?list_:long ->
  unit ->
  task_execution_folders_failed_detail

val make_task_execution_files_listed_detail :
  ?at_destination_for_delete:long -> ?at_source:long -> unit -> task_execution_files_listed_detail

val make_task_execution_files_failed_detail :
  ?delete:long ->
  ?verify:long ->
  ?transfer:long ->
  ?prepare:long ->
  unit ->
  task_execution_files_failed_detail

val make_tag_resource_response : unit -> unit
val make_tag_list_entry : ?value:tag_value -> key:tag_key -> unit -> tag_list_entry

val make_tag_resource_request :
  tags:input_tag_list -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_start_task_execution_response :
  ?task_execution_arn:task_execution_arn -> unit -> start_task_execution_response

val make_start_task_execution_request :
  ?tags:input_tag_list ->
  ?task_report_config:task_report_config ->
  ?manifest_config:manifest_config ->
  ?excludes:filter_list ->
  ?includes:filter_list ->
  ?override_options:options ->
  task_arn:task_arn ->
  unit ->
  start_task_execution_request

val make_private_link_config :
  ?security_group_arns:pl_security_group_arn_list ->
  ?subnet_arns:pl_subnet_arn_list ->
  ?private_link_endpoint:endpoint ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  unit ->
  private_link_config

val make_platform : ?version:agent_version -> unit -> platform

val make_location_list_entry :
  ?location_uri:location_uri -> ?location_arn:location_arn -> unit -> location_list_entry

val make_location_filter :
  operator:operator -> values:filter_values -> name:location_filter_name -> unit -> location_filter

val make_list_tasks_response :
  ?next_token:next_token -> ?tasks:task_list -> unit -> list_tasks_response

val make_list_tasks_request :
  ?filters:task_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_tasks_request

val make_list_task_executions_response :
  ?next_token:next_token ->
  ?task_executions:task_execution_list ->
  unit ->
  list_task_executions_response

val make_list_task_executions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?task_arn:task_arn ->
  unit ->
  list_task_executions_request

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:output_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:taggable_resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_list_locations_response :
  ?next_token:next_token -> ?locations:location_list -> unit -> list_locations_response

val make_list_locations_request :
  ?filters:location_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_locations_request

val make_agent_list_entry :
  ?platform:platform ->
  ?status:agent_status ->
  ?name:tag_value ->
  ?agent_arn:agent_arn ->
  unit ->
  agent_list_entry

val make_list_agents_response :
  ?next_token:next_token -> ?agents:agent_list -> unit -> list_agents_response

val make_list_agents_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_agents_request

val make_describe_task_execution_response :
  ?end_time:time ->
  ?launch_time:time ->
  ?folders_failed:task_execution_folders_failed_detail ->
  ?folders_listed:task_execution_folders_listed_detail ->
  ?folders_deleted:item_count ->
  ?folders_verified:item_count ->
  ?folders_transferred:item_count ->
  ?folders_prepared:item_count ->
  ?folders_skipped:item_count ->
  ?estimated_folders_to_transfer:item_count ->
  ?estimated_folders_to_delete:item_count ->
  ?files_failed:task_execution_files_failed_detail ->
  ?files_listed:task_execution_files_listed_detail ->
  ?files_prepared:long ->
  ?task_mode:task_mode ->
  ?estimated_files_to_delete:long ->
  ?report_result:report_result ->
  ?files_verified:long ->
  ?files_skipped:long ->
  ?files_deleted:long ->
  ?task_report_config:task_report_config ->
  ?result_:task_execution_result_detail ->
  ?bytes_compressed:long ->
  ?bytes_transferred:long ->
  ?bytes_written:long ->
  ?files_transferred:long ->
  ?estimated_bytes_to_transfer:long ->
  ?estimated_files_to_transfer:long ->
  ?start_time:time ->
  ?manifest_config:manifest_config ->
  ?includes:filter_list ->
  ?excludes:filter_list ->
  ?options:options ->
  ?status:task_execution_status ->
  ?task_execution_arn:task_execution_arn ->
  unit ->
  describe_task_execution_response

val make_describe_task_execution_request :
  task_execution_arn:task_execution_arn -> unit -> describe_task_execution_request

val make_describe_task_response :
  ?task_mode:task_mode ->
  ?schedule_details:task_schedule_details ->
  ?task_report_config:task_report_config ->
  ?manifest_config:manifest_config ->
  ?includes:filter_list ->
  ?creation_time:time ->
  ?error_detail:string_ ->
  ?error_code:string_ ->
  ?schedule:task_schedule ->
  ?excludes:filter_list ->
  ?options:options ->
  ?destination_network_interface_arns:destination_network_interface_arns ->
  ?source_network_interface_arns:source_network_interface_arns ->
  ?cloud_watch_log_group_arn:log_group_arn ->
  ?destination_location_arn:location_arn ->
  ?source_location_arn:location_arn ->
  ?current_task_execution_arn:task_execution_arn ->
  ?name:tag_value ->
  ?status:task_status ->
  ?task_arn:task_arn ->
  unit ->
  describe_task_response

val make_describe_task_request : task_arn:task_arn -> unit -> describe_task_request

val make_describe_location_smb_response :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?authentication_type:smb_authentication_type ->
  ?kerberos_principal:kerberos_principal ->
  ?dns_ip_addresses:dns_ip_list ->
  ?creation_time:time ->
  ?mount_options:smb_mount_options ->
  ?domain:smb_domain ->
  ?user:smb_user ->
  ?agent_arns:agent_arn_list ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_smb_response

val make_describe_location_smb_request :
  location_arn:location_arn -> unit -> describe_location_smb_request

val make_describe_location_s3_response :
  ?creation_time:time ->
  ?agent_arns:agent_arn_list ->
  ?s3_config:s3_config ->
  ?s3_storage_class:s3_storage_class ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_s3_response

val make_describe_location_s3_request :
  location_arn:location_arn -> unit -> describe_location_s3_request

val make_describe_location_object_storage_response :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?server_certificate:object_storage_certificate ->
  ?creation_time:time ->
  ?agent_arns:agent_arn_list ->
  ?server_protocol:object_storage_server_protocol ->
  ?server_port:object_storage_server_port ->
  ?access_key:object_storage_access_key ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_object_storage_response

val make_describe_location_object_storage_request :
  location_arn:location_arn -> unit -> describe_location_object_storage_request

val make_describe_location_nfs_response :
  ?creation_time:time ->
  ?mount_options:nfs_mount_options ->
  ?on_prem_config:on_prem_config ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_nfs_response

val make_describe_location_nfs_request :
  location_arn:location_arn -> unit -> describe_location_nfs_request

val make_describe_location_hdfs_response :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?creation_time:time ->
  ?agent_arns:agent_arn_list ->
  ?kerberos_principal:kerberos_principal ->
  ?simple_user:hdfs_user ->
  ?authentication_type:hdfs_authentication_type ->
  ?qop_configuration:qop_configuration ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?replication_factor:hdfs_replication_factor ->
  ?block_size:hdfs_block_size ->
  ?name_nodes:hdfs_name_node_list ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_hdfs_response

val make_describe_location_hdfs_request :
  location_arn:location_arn -> unit -> describe_location_hdfs_request

val make_describe_location_fsx_windows_response :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?domain:smb_domain ->
  ?user:smb_user ->
  ?creation_time:time ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_fsx_windows_response

val make_describe_location_fsx_windows_request :
  location_arn:location_arn -> unit -> describe_location_fsx_windows_request

val make_describe_location_fsx_open_zfs_response :
  ?creation_time:time ->
  ?protocol:fsx_protocol ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_fsx_open_zfs_response

val make_describe_location_fsx_open_zfs_request :
  location_arn:location_arn -> unit -> describe_location_fsx_open_zfs_request

val make_describe_location_fsx_ontap_response :
  ?fsx_filesystem_arn:fsx_filesystem_arn ->
  ?storage_virtual_machine_arn:storage_virtual_machine_arn ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?protocol:fsx_protocol ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  ?creation_time:time ->
  unit ->
  describe_location_fsx_ontap_response

val make_describe_location_fsx_ontap_request :
  location_arn:location_arn -> unit -> describe_location_fsx_ontap_request

val make_describe_location_fsx_lustre_response :
  ?creation_time:time ->
  ?security_group_arns:ec2_security_group_arn_list ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_fsx_lustre_response

val make_describe_location_fsx_lustre_request :
  location_arn:location_arn -> unit -> describe_location_fsx_lustre_request

val make_ec2_config :
  security_group_arns:ec2_security_group_arn_list -> subnet_arn:ec2_subnet_arn -> unit -> ec2_config

val make_describe_location_efs_response :
  ?in_transit_encryption:efs_in_transit_encryption ->
  ?file_system_access_role_arn:iam_role_arn ->
  ?access_point_arn:efs_access_point_arn ->
  ?creation_time:time ->
  ?ec2_config:ec2_config ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_efs_response

val make_describe_location_efs_request :
  location_arn:location_arn -> unit -> describe_location_efs_request

val make_describe_location_azure_blob_response :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?managed_secret_config:managed_secret_config ->
  ?creation_time:time ->
  ?agent_arns:agent_arn_list ->
  ?access_tier:azure_access_tier ->
  ?blob_type:azure_blob_type ->
  ?authentication_type:azure_blob_authentication_type ->
  ?location_uri:location_uri ->
  ?location_arn:location_arn ->
  unit ->
  describe_location_azure_blob_response

val make_describe_location_azure_blob_request :
  location_arn:location_arn -> unit -> describe_location_azure_blob_request

val make_describe_agent_response :
  ?platform:platform ->
  ?private_link_config:private_link_config ->
  ?endpoint_type:endpoint_type ->
  ?creation_time:time ->
  ?last_connection_time:time ->
  ?status:agent_status ->
  ?name:tag_value ->
  ?agent_arn:agent_arn ->
  unit ->
  describe_agent_response

val make_describe_agent_request : agent_arn:agent_arn -> unit -> describe_agent_request
val make_delete_task_response : unit -> unit
val make_delete_task_request : task_arn:task_arn -> unit -> delete_task_request
val make_delete_location_response : unit -> unit
val make_delete_location_request : location_arn:location_arn -> unit -> delete_location_request
val make_delete_agent_response : unit -> unit
val make_delete_agent_request : agent_arn:agent_arn -> unit -> delete_agent_request
val make_create_task_response : ?task_arn:task_arn -> unit -> create_task_response

val make_create_task_request :
  ?task_mode:task_mode ->
  ?task_report_config:task_report_config ->
  ?manifest_config:manifest_config ->
  ?includes:filter_list ->
  ?tags:input_tag_list ->
  ?schedule:task_schedule ->
  ?excludes:filter_list ->
  ?options:options ->
  ?name:tag_value ->
  ?cloud_watch_log_group_arn:log_group_arn ->
  destination_location_arn:location_arn ->
  source_location_arn:location_arn ->
  unit ->
  create_task_request

val make_create_location_smb_response :
  ?location_arn:location_arn -> unit -> create_location_smb_response

val make_create_location_smb_request :
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_principal:kerberos_principal ->
  ?dns_ip_addresses:dns_ip_list ->
  ?authentication_type:smb_authentication_type ->
  ?tags:input_tag_list ->
  ?mount_options:smb_mount_options ->
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?password:smb_password ->
  ?domain:smb_domain ->
  ?user:smb_user ->
  agent_arns:agent_arn_list ->
  server_hostname:server_hostname ->
  subdirectory:smb_subdirectory ->
  unit ->
  create_location_smb_request

val make_create_location_s3_response :
  ?location_arn:location_arn -> unit -> create_location_s3_response

val make_create_location_s3_request :
  ?tags:input_tag_list ->
  ?agent_arns:agent_arn_list ->
  ?s3_storage_class:s3_storage_class ->
  ?subdirectory:s3_subdirectory ->
  s3_config:s3_config ->
  s3_bucket_arn:s3_bucket_arn ->
  unit ->
  create_location_s3_request

val make_create_location_object_storage_response :
  ?location_arn:location_arn -> unit -> create_location_object_storage_response

val make_create_location_object_storage_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?server_certificate:object_storage_certificate ->
  ?tags:input_tag_list ->
  ?agent_arns:agent_arn_list ->
  ?secret_key:object_storage_secret_key ->
  ?access_key:object_storage_access_key ->
  ?subdirectory:s3_subdirectory ->
  ?server_protocol:object_storage_server_protocol ->
  ?server_port:object_storage_server_port ->
  bucket_name:object_storage_bucket_name ->
  server_hostname:server_hostname ->
  unit ->
  create_location_object_storage_request

val make_create_location_nfs_response :
  ?location_arn:location_arn -> unit -> create_location_nfs_response

val make_create_location_nfs_request :
  ?tags:input_tag_list ->
  ?mount_options:nfs_mount_options ->
  on_prem_config:on_prem_config ->
  server_hostname:server_hostname ->
  subdirectory:nfs_subdirectory ->
  unit ->
  create_location_nfs_request

val make_create_location_hdfs_response :
  ?location_arn:location_arn -> unit -> create_location_hdfs_response

val make_create_location_hdfs_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?tags:input_tag_list ->
  ?kerberos_krb5_conf:kerberos_krb5_conf_file ->
  ?kerberos_keytab:kerberos_keytab_file ->
  ?kerberos_principal:kerberos_principal ->
  ?simple_user:hdfs_user ->
  ?qop_configuration:qop_configuration ->
  ?kms_key_provider_uri:kms_key_provider_uri ->
  ?replication_factor:hdfs_replication_factor ->
  ?block_size:hdfs_block_size ->
  ?subdirectory:hdfs_subdirectory ->
  agent_arns:agent_arn_list ->
  authentication_type:hdfs_authentication_type ->
  name_nodes:hdfs_name_node_list ->
  unit ->
  create_location_hdfs_request

val make_create_location_fsx_windows_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_windows_response

val make_create_location_fsx_windows_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?password:smb_password ->
  ?domain:smb_domain ->
  ?tags:input_tag_list ->
  ?subdirectory:fsx_windows_subdirectory ->
  user:smb_user ->
  security_group_arns:ec2_security_group_arn_list ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  unit ->
  create_location_fsx_windows_request

val make_create_location_fsx_open_zfs_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_open_zfs_response

val make_create_location_fsx_open_zfs_request :
  ?tags:input_tag_list ->
  ?subdirectory:fsx_open_zfs_subdirectory ->
  security_group_arns:ec2_security_group_arn_list ->
  protocol:fsx_protocol ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  unit ->
  create_location_fsx_open_zfs_request

val make_create_location_fsx_ontap_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_ontap_response

val make_create_location_fsx_ontap_request :
  ?tags:input_tag_list ->
  ?subdirectory:fsx_ontap_subdirectory ->
  storage_virtual_machine_arn:storage_virtual_machine_arn ->
  security_group_arns:ec2_security_group_arn_list ->
  protocol:fsx_protocol ->
  unit ->
  create_location_fsx_ontap_request

val make_create_location_fsx_lustre_response :
  ?location_arn:location_arn -> unit -> create_location_fsx_lustre_response

val make_create_location_fsx_lustre_request :
  ?tags:input_tag_list ->
  ?subdirectory:fsx_lustre_subdirectory ->
  security_group_arns:ec2_security_group_arn_list ->
  fsx_filesystem_arn:fsx_filesystem_arn ->
  unit ->
  create_location_fsx_lustre_request

val make_create_location_efs_response :
  ?location_arn:location_arn -> unit -> create_location_efs_response

val make_create_location_efs_request :
  ?in_transit_encryption:efs_in_transit_encryption ->
  ?file_system_access_role_arn:iam_role_arn ->
  ?access_point_arn:efs_access_point_arn ->
  ?tags:input_tag_list ->
  ?subdirectory:efs_subdirectory ->
  ec2_config:ec2_config ->
  efs_filesystem_arn:efs_filesystem_arn ->
  unit ->
  create_location_efs_request

val make_create_location_azure_blob_response :
  ?location_arn:location_arn -> unit -> create_location_azure_blob_response

val make_create_location_azure_blob_request :
  ?custom_secret_config:custom_secret_config ->
  ?cmk_secret_config:cmk_secret_config ->
  ?tags:input_tag_list ->
  ?agent_arns:agent_arn_list ->
  ?subdirectory:azure_blob_subdirectory ->
  ?access_tier:azure_access_tier ->
  ?blob_type:azure_blob_type ->
  ?sas_configuration:azure_blob_sas_configuration ->
  authentication_type:azure_blob_authentication_type ->
  container_url:azure_blob_container_url ->
  unit ->
  create_location_azure_blob_request

val make_create_agent_response : ?agent_arn:agent_arn -> unit -> create_agent_response

val make_create_agent_request :
  ?security_group_arns:pl_security_group_arn_list ->
  ?subnet_arns:pl_subnet_arn_list ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?tags:input_tag_list ->
  ?agent_name:tag_value ->
  activation_key:activation_key ->
  unit ->
  create_agent_request

val make_cancel_task_execution_response : unit -> unit

val make_cancel_task_execution_request :
  task_execution_arn:task_execution_arn -> unit -> cancel_task_execution_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
