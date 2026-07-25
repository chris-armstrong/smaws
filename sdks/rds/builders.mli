open Types

val make_account_quota :
  ?account_quota_name:string_ -> ?used:long -> ?max:long -> unit -> account_quota

val make_account_attributes_message :
  ?account_quotas:account_quota_list -> unit -> account_attributes_message

val make_add_role_to_db_cluster_message :
  ?feature_name:string_ ->
  db_cluster_identifier:string_ ->
  role_arn:string_ ->
  unit ->
  add_role_to_db_cluster_message

val make_add_role_to_db_instance_message :
  db_instance_identifier:string_ ->
  role_arn:string_ ->
  feature_name:string_ ->
  unit ->
  add_role_to_db_instance_message

val make_event_subscription :
  ?customer_aws_id:string_ ->
  ?cust_subscription_id:string_ ->
  ?sns_topic_arn:string_ ->
  ?status:string_ ->
  ?subscription_creation_time:string_ ->
  ?source_type:string_ ->
  ?source_ids_list:source_ids_list ->
  ?event_categories_list:event_categories_list ->
  ?enabled:boolean_ ->
  ?event_subscription_arn:string_ ->
  unit ->
  event_subscription

val make_add_source_identifier_to_subscription_message :
  subscription_name:string_ ->
  source_identifier:string_ ->
  unit ->
  add_source_identifier_to_subscription_message

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag

val make_add_tags_to_resource_message :
  resource_name:string_ -> tags:tag_list -> unit -> add_tags_to_resource_message

val make_additional_storage_volume :
  ?allocated_storage:integer_optional ->
  ?iop_s:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?storage_type:string_ ->
  volume_name:string_ ->
  unit ->
  additional_storage_volume

val make_additional_storage_volume_output :
  ?volume_name:string_ ->
  ?storage_volume_status:string_ ->
  ?allocated_storage:integer ->
  ?iop_s:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?storage_type:string_ ->
  unit ->
  additional_storage_volume_output

val make_master_user_secret :
  ?secret_arn:string_ -> ?secret_status:string_ -> ?kms_key_id:string_ -> unit -> master_user_secret

val make_certificate_details :
  ?ca_identifier:string_ -> ?valid_till:t_stamp -> unit -> certificate_details

val make_db_instance_automated_backups_replication :
  ?db_instance_automated_backups_arn:string_ -> unit -> db_instance_automated_backups_replication

val make_endpoint : ?address:string_ -> ?port:integer -> ?hosted_zone_id:string_ -> unit -> endpoint

val make_db_instance_role :
  ?role_arn:string_ -> ?feature_name:string_ -> ?status:string_ -> unit -> db_instance_role

val make_processor_feature : ?name:string_ -> ?value:string_ -> unit -> processor_feature

val make_domain_membership :
  ?domain:string_ ->
  ?status:string_ ->
  ?fqd_n:string_ ->
  ?iam_role_name:string_ ->
  ?o_u:string_ ->
  ?auth_secret_arn:string_ ->
  ?dns_ips:string_list ->
  unit ->
  domain_membership

val make_db_instance_status_info :
  ?status_type:string_ ->
  ?normal:boolean_ ->
  ?status:string_ ->
  ?message:string_ ->
  unit ->
  db_instance_status_info

val make_option_group_membership :
  ?option_group_name:string_ -> ?status:string_ -> unit -> option_group_membership

val make_pending_cloudwatch_logs_exports :
  ?log_types_to_enable:log_type_list ->
  ?log_types_to_disable:log_type_list ->
  unit ->
  pending_cloudwatch_logs_exports

val make_pending_modified_values :
  ?db_instance_class:string_ ->
  ?allocated_storage:integer_optional ->
  ?master_user_password:sensitive_string ->
  ?port:integer_optional ->
  ?backup_retention_period:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?db_instance_identifier:string_ ->
  ?storage_type:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?db_subnet_group_name:string_ ->
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  ?processor_features:processor_feature_list ->
  ?automation_mode:automation_mode ->
  ?resume_full_automation_mode_time:t_stamp ->
  ?multi_tenant:boolean_optional ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?dedicated_log_volume:boolean_optional ->
  ?engine:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  unit ->
  pending_modified_values

val make_outpost : ?arn:string_ -> unit -> outpost
val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_outpost:outpost ->
  ?subnet_status:string_ ->
  unit ->
  subnet

val make_db_subnet_group :
  ?db_subnet_group_name:string_ ->
  ?db_subnet_group_description:string_ ->
  ?vpc_id:string_ ->
  ?subnet_group_status:string_ ->
  ?subnets:subnet_list ->
  ?db_subnet_group_arn:string_ ->
  ?supported_network_types:string_list ->
  unit ->
  db_subnet_group

val make_db_parameter_group_status :
  ?db_parameter_group_name:string_ ->
  ?parameter_apply_status:string_ ->
  unit ->
  db_parameter_group_status

val make_vpc_security_group_membership :
  ?vpc_security_group_id:string_ -> ?status:string_ -> unit -> vpc_security_group_membership

val make_db_security_group_membership :
  ?db_security_group_name:string_ -> ?status:string_ -> unit -> db_security_group_membership

val make_db_instance :
  ?db_instance_identifier:string_ ->
  ?db_instance_class:string_ ->
  ?engine:string_ ->
  ?db_instance_status:string_ ->
  ?master_username:string_ ->
  ?db_name:string_ ->
  ?endpoint:endpoint ->
  ?allocated_storage:integer ->
  ?instance_create_time:t_stamp ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer ->
  ?db_security_groups:db_security_group_membership_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?db_parameter_groups:db_parameter_group_status_list ->
  ?availability_zone:string_ ->
  ?db_subnet_group:db_subnet_group ->
  ?preferred_maintenance_window:string_ ->
  ?upgrade_rollout_order:upgrade_rollout_order ->
  ?pending_modified_values:pending_modified_values ->
  ?latest_restorable_time:t_stamp ->
  ?multi_a_z:boolean_ ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?read_replica_source_db_instance_identifier:string_ ->
  ?read_replica_db_instance_identifiers:read_replica_db_instance_identifier_list ->
  ?read_replica_db_cluster_identifiers:read_replica_db_cluster_identifier_list ->
  ?replica_mode:replica_mode ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_memberships:option_group_membership_list ->
  ?character_set_name:string_ ->
  ?nchar_character_set_name:string_ ->
  ?secondary_availability_zone:string_ ->
  ?publicly_accessible:boolean_ ->
  ?status_infos:db_instance_status_info_list ->
  ?storage_type:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?tde_credential_arn:string_ ->
  ?db_instance_port:integer ->
  ?db_cluster_identifier:string_ ->
  ?storage_encrypted:boolean_ ->
  ?kms_key_id:string_ ->
  ?dbi_resource_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?domain_memberships:domain_membership_list ->
  ?copy_tags_to_snapshot:boolean_ ->
  ?monitoring_interval:integer_optional ->
  ?enhanced_monitoring_resource_arn:string_ ->
  ?monitoring_role_arn:string_ ->
  ?promotion_tier:integer_optional ->
  ?db_instance_arn:string_ ->
  ?timezone:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?database_insights_mode:database_insights_mode ->
  ?performance_insights_enabled:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?deletion_protection:boolean_ ->
  ?associated_roles:db_instance_roles ->
  ?listener_endpoint:endpoint ->
  ?max_allocated_storage:integer_optional ->
  ?tag_list:tag_list ->
  ?automation_mode:automation_mode ->
  ?resume_full_automation_mode_time:t_stamp ->
  ?customer_owned_ip_enabled:boolean_optional ->
  ?network_type:string_ ->
  ?activity_stream_status:activity_stream_status ->
  ?activity_stream_kms_key_id:string_ ->
  ?activity_stream_kinesis_stream_name:string_ ->
  ?activity_stream_mode:activity_stream_mode ->
  ?activity_stream_engine_native_audit_fields_included:boolean_optional ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?db_instance_automated_backups_replications:db_instance_automated_backups_replication_list ->
  ?backup_target:string_ ->
  ?automatic_restart_time:t_stamp ->
  ?custom_iam_instance_profile:string_ ->
  ?activity_stream_policy_status:activity_stream_policy_status ->
  ?certificate_details:certificate_details ->
  ?db_system_id:string_ ->
  ?master_user_secret:master_user_secret ->
  ?read_replica_source_db_cluster_identifier:string_ ->
  ?percent_progress:string_ ->
  ?multi_tenant:boolean_optional ->
  ?dedicated_log_volume:boolean_ ->
  ?is_storage_config_upgrade_available:boolean_optional ->
  ?engine_lifecycle_support:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_output_list ->
  ?storage_volume_status:string_ ->
  unit ->
  db_instance

val make_switchover_read_replica_message :
  db_instance_identifier:string_ -> unit -> switchover_read_replica_message

val make_failover_state :
  ?status:failover_status ->
  ?from_db_cluster_arn:string_ ->
  ?to_db_cluster_arn:string_ ->
  ?is_data_loss_allowed:boolean_ ->
  unit ->
  failover_state

val make_global_cluster_member :
  ?db_cluster_arn:string_ ->
  ?readers:readers_arn_list ->
  ?is_writer:boolean_ ->
  ?global_write_forwarding_status:write_forwarding_status ->
  ?synchronization_status:global_cluster_member_synchronization_status ->
  unit ->
  global_cluster_member

val make_global_cluster :
  ?global_cluster_identifier:global_cluster_identifier ->
  ?global_cluster_resource_id:string_ ->
  ?global_cluster_arn:string_ ->
  ?status:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?database_name:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?storage_encryption_type:storage_encryption_type ->
  ?deletion_protection:boolean_optional ->
  ?global_cluster_members:global_cluster_member_list ->
  ?endpoint:string_ ->
  ?failover_state:failover_state ->
  ?tag_list:tag_list ->
  unit ->
  global_cluster

val make_switchover_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier ->
  target_db_cluster_identifier:db_cluster_identifier ->
  unit ->
  switchover_global_cluster_message

val make_blue_green_deployment_task :
  ?name:blue_green_deployment_task_name ->
  ?status:blue_green_deployment_task_status ->
  unit ->
  blue_green_deployment_task

val make_switchover_detail :
  ?source_member:database_arn ->
  ?target_member:database_arn ->
  ?status:switchover_detail_status ->
  unit ->
  switchover_detail

val make_blue_green_deployment :
  ?blue_green_deployment_identifier:blue_green_deployment_identifier ->
  ?blue_green_deployment_name:blue_green_deployment_name ->
  ?source:database_arn ->
  ?target:database_arn ->
  ?switchover_details:switchover_detail_list ->
  ?tasks:blue_green_deployment_task_list ->
  ?status:blue_green_deployment_status ->
  ?status_details:blue_green_deployment_status_details ->
  ?create_time:t_stamp ->
  ?delete_time:t_stamp ->
  ?tag_list:tag_list ->
  unit ->
  blue_green_deployment

val make_switchover_blue_green_deployment_response :
  ?blue_green_deployment:blue_green_deployment -> unit -> switchover_blue_green_deployment_response

val make_switchover_blue_green_deployment_request :
  ?switchover_timeout:switchover_timeout ->
  blue_green_deployment_identifier:blue_green_deployment_identifier ->
  unit ->
  switchover_blue_green_deployment_request

val make_restore_window : ?earliest_time:t_stamp -> ?latest_time:t_stamp -> unit -> restore_window

val make_db_instance_automated_backup :
  ?db_instance_arn:string_ ->
  ?dbi_resource_id:string_ ->
  ?region:string_ ->
  ?db_instance_identifier:string_ ->
  ?restore_window:restore_window ->
  ?allocated_storage:integer ->
  ?status:string_ ->
  ?port:integer ->
  ?availability_zone:string_ ->
  ?vpc_id:string_ ->
  ?instance_create_time:t_stamp ->
  ?master_username:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?tde_credential_arn:string_ ->
  ?encrypted:boolean_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_type:string_ ->
  ?kms_key_id:string_ ->
  ?timezone:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?db_instance_automated_backups_arn:string_ ->
  ?db_instance_automated_backups_replications:db_instance_automated_backups_replication_list ->
  ?backup_target:string_ ->
  ?multi_tenant:boolean_optional ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?tag_list:tag_list ->
  ?dedicated_log_volume:boolean_optional ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  unit ->
  db_instance_automated_backup

val make_stop_db_instance_automated_backups_replication_message :
  source_db_instance_arn:string_ -> unit -> stop_db_instance_automated_backups_replication_message

val make_stop_db_instance_message :
  ?db_snapshot_identifier:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  stop_db_instance_message

val make_limitless_database :
  ?status:limitless_database_status ->
  ?min_required_ac_u:double_optional ->
  unit ->
  limitless_database

val make_serverless_v2_scaling_configuration_info :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  ?seconds_until_auto_pause:integer_optional ->
  unit ->
  serverless_v2_scaling_configuration_info

val make_rds_custom_cluster_configuration :
  ?interconnect_subnet_id:string_ ->
  ?transit_gateway_multicast_domain_id:string_ ->
  ?replica_mode:replica_mode ->
  unit ->
  rds_custom_cluster_configuration

val make_scaling_configuration_info :
  ?min_capacity:integer_optional ->
  ?max_capacity:integer_optional ->
  ?auto_pause:boolean_optional ->
  ?seconds_until_auto_pause:integer_optional ->
  ?timeout_action:string_ ->
  ?seconds_before_timeout:integer_optional ->
  unit ->
  scaling_configuration_info

val make_cluster_pending_modified_values :
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  ?db_cluster_identifier:string_ ->
  ?master_user_password:sensitive_string ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?engine_version:string_ ->
  ?backup_retention_period:integer_optional ->
  ?storage_type:string_ ->
  ?allocated_storage:integer_optional ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?iops:integer_optional ->
  ?certificate_details:certificate_details ->
  unit ->
  cluster_pending_modified_values

val make_db_cluster_role :
  ?role_arn:string_ -> ?status:string_ -> ?feature_name:string_ -> unit -> db_cluster_role

val make_db_cluster_member :
  ?db_instance_identifier:string_ ->
  ?is_cluster_writer:boolean_ ->
  ?db_cluster_parameter_group_status:string_ ->
  ?promotion_tier:integer_optional ->
  unit ->
  db_cluster_member

val make_db_cluster_status_info :
  ?status_type:string_ ->
  ?normal:boolean_ ->
  ?status:string_ ->
  ?message:string_ ->
  unit ->
  db_cluster_status_info

val make_db_cluster_option_group_status :
  ?db_cluster_option_group_name:string_ -> ?status:string_ -> unit -> db_cluster_option_group_status

val make_db_cluster :
  ?allocated_storage:integer_optional ->
  ?availability_zones:availability_zones ->
  ?backup_retention_period:integer_optional ->
  ?character_set_name:string_ ->
  ?database_name:string_ ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_parameter_group:string_ ->
  ?db_subnet_group:string_ ->
  ?status:string_ ->
  ?percent_progress:string_ ->
  ?earliest_restorable_time:t_stamp ->
  ?endpoint:string_ ->
  ?reader_endpoint:string_ ->
  ?custom_endpoints:string_list ->
  ?multi_a_z:boolean_optional ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?latest_restorable_time:t_stamp ->
  ?port:integer_optional ->
  ?master_username:string_ ->
  ?db_cluster_option_group_memberships:db_cluster_option_group_memberships ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?upgrade_rollout_order:upgrade_rollout_order ->
  ?replication_source_identifier:string_ ->
  ?read_replica_identifiers:read_replica_identifier_list ->
  ?status_infos:db_cluster_status_info_list ->
  ?db_cluster_members:db_cluster_member_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?hosted_zone_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?kms_key_id:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?db_cluster_arn:string_ ->
  ?associated_roles:db_cluster_roles ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?clone_group_id:string_ ->
  ?cluster_create_time:t_stamp ->
  ?earliest_backtrack_time:t_stamp ->
  ?backtrack_window:long_optional ->
  ?backtrack_consumed_change_records:long_optional ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?capacity:integer_optional ->
  ?pending_modified_values:cluster_pending_modified_values ->
  ?engine_mode:string_ ->
  ?scaling_configuration_info:scaling_configuration_info ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?db_cluster_instance_class:string_ ->
  ?storage_type:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?io_optimized_next_allowed_modification_time:t_stamp ->
  ?publicly_accessible:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?deletion_protection:boolean_optional ->
  ?http_endpoint_enabled:boolean_optional ->
  ?activity_stream_mode:activity_stream_mode ->
  ?activity_stream_status:activity_stream_status ->
  ?activity_stream_kms_key_id:string_ ->
  ?activity_stream_kinesis_stream_name:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?cross_account_clone:boolean_optional ->
  ?domain_memberships:domain_membership_list ->
  ?tag_list:tag_list ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?global_write_forwarding_status:write_forwarding_status ->
  ?global_write_forwarding_requested:boolean_optional ->
  ?network_type:string_ ->
  ?automatic_restart_time:t_stamp ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration_info ->
  ?serverless_v2_platform_version:string_ ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?database_insights_mode:database_insights_mode ->
  ?performance_insights_enabled:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?db_system_id:string_ ->
  ?master_user_secret:master_user_secret ->
  ?local_write_forwarding_status:local_write_forwarding_status ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?limitless_database:limitless_database ->
  ?cluster_scalability_type:cluster_scalability_type ->
  ?certificate_details:certificate_details ->
  ?engine_lifecycle_support:string_ ->
  ?vpc_networking_enabled:boolean_optional ->
  ?internet_access_gateway_enabled:boolean_optional ->
  unit ->
  db_cluster

val make_stop_db_cluster_message : db_cluster_identifier:string_ -> unit -> stop_db_cluster_message

val make_stop_activity_stream_response :
  ?kms_key_id:string_ ->
  ?kinesis_stream_name:string_ ->
  ?status:activity_stream_status ->
  unit ->
  stop_activity_stream_response

val make_stop_activity_stream_request :
  ?apply_immediately:boolean_optional ->
  resource_arn:string_ ->
  unit ->
  stop_activity_stream_request

val make_export_task :
  ?export_task_identifier:string_ ->
  ?source_arn:string_ ->
  ?export_only:string_list ->
  ?snapshot_time:t_stamp ->
  ?task_start_time:t_stamp ->
  ?task_end_time:t_stamp ->
  ?s3_bucket:string_ ->
  ?s3_prefix:string_ ->
  ?iam_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?status:string_ ->
  ?percent_progress:integer ->
  ?total_extracted_data_in_g_b:integer ->
  ?failure_cause:string_ ->
  ?warning_message:string_ ->
  ?source_type:export_source_type ->
  unit ->
  export_task

val make_start_export_task_message :
  ?s3_prefix:string_ ->
  ?export_only:string_list ->
  export_task_identifier:string_ ->
  source_arn:string_ ->
  s3_bucket_name:string_ ->
  iam_role_arn:string_ ->
  kms_key_id:string_ ->
  unit ->
  start_export_task_message

val make_start_db_instance_automated_backups_replication_message :
  ?backup_retention_period:integer_optional ->
  ?kms_key_id:string_ ->
  ?pre_signed_url:sensitive_string ->
  ?tags:tag_list ->
  source_db_instance_arn:string_ ->
  unit ->
  start_db_instance_automated_backups_replication_message

val make_start_db_instance_message :
  db_instance_identifier:string_ -> unit -> start_db_instance_message

val make_start_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> start_db_cluster_message

val make_start_activity_stream_response :
  ?kms_key_id:string_ ->
  ?kinesis_stream_name:string_ ->
  ?status:activity_stream_status ->
  ?mode:activity_stream_mode ->
  ?engine_native_audit_fields_included:boolean_optional ->
  ?apply_immediately:boolean_ ->
  unit ->
  start_activity_stream_response

val make_start_activity_stream_request :
  ?apply_immediately:boolean_optional ->
  ?engine_native_audit_fields_included:boolean_optional ->
  resource_arn:string_ ->
  mode:activity_stream_mode ->
  kms_key_id:string_ ->
  unit ->
  start_activity_stream_request

val make_ip_range : ?status:string_ -> ?cidri_p:string_ -> unit -> ip_range

val make_ec2_security_group :
  ?status:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  unit ->
  ec2_security_group

val make_db_security_group :
  ?owner_id:string_ ->
  ?db_security_group_name:string_ ->
  ?db_security_group_description:string_ ->
  ?vpc_id:string_ ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?ip_ranges:ip_range_list ->
  ?db_security_group_arn:string_ ->
  unit ->
  db_security_group

val make_revoke_db_security_group_ingress_message :
  ?cidri_p:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  db_security_group_name:string_ ->
  unit ->
  revoke_db_security_group_ingress_message

val make_tag_specification : ?resource_type:string_ -> ?tags:tag_list -> unit -> tag_specification

val make_restore_db_instance_to_point_in_time_message :
  ?source_db_instance_identifier:string_ ->
  ?restore_time:t_stamp ->
  ?use_latest_restorable_time:boolean_ ->
  ?db_instance_class:string_ ->
  ?port:integer_optional ->
  ?availability_zone:string_ ->
  ?db_subnet_group_name:string_ ->
  ?multi_a_z:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?license_model:string_ ->
  ?db_name:string_ ->
  ?engine:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?tags:tag_list ->
  ?storage_type:string_ ->
  ?tde_credential_arn:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_ou:string_ ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_dns_ips:string_list ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?use_default_processor_features:boolean_optional ->
  ?db_parameter_group_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?source_dbi_resource_id:string_ ->
  ?max_allocated_storage:integer_optional ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?network_type:string_ ->
  ?source_db_instance_automated_backups_arn:string_ ->
  ?backup_target:string_ ->
  ?custom_iam_instance_profile:string_ ->
  ?allocated_storage:integer_optional ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  target_db_instance_identifier:string_ ->
  unit ->
  restore_db_instance_to_point_in_time_message

val make_restore_db_instance_from_s3_message :
  ?db_name:string_ ->
  ?allocated_storage:integer_optional ->
  ?master_username:string_ ->
  ?master_user_password:sensitive_string ->
  ?db_security_groups:db_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?availability_zone:string_ ->
  ?db_subnet_group_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?db_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?port:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?tags:tag_list ->
  ?storage_type:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?s3_prefix:string_ ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?use_default_processor_features:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?network_type:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  db_instance_identifier:string_ ->
  db_instance_class:string_ ->
  engine:string_ ->
  source_engine:string_ ->
  source_engine_version:string_ ->
  s3_bucket_name:string_ ->
  s3_ingestion_role_arn:string_ ->
  unit ->
  restore_db_instance_from_s3_message

val make_restore_db_instance_from_db_snapshot_message :
  ?db_snapshot_identifier:string_ ->
  ?db_instance_class:string_ ->
  ?port:integer_optional ->
  ?availability_zone:string_ ->
  ?db_subnet_group_name:string_ ->
  ?multi_a_z:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?license_model:string_ ->
  ?db_name:string_ ->
  ?engine:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?tags:tag_list ->
  ?storage_type:string_ ->
  ?tde_credential_arn:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?domain:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_ou:string_ ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_dns_ips:string_list ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain_iam_role_name:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?use_default_processor_features:boolean_optional ->
  ?db_parameter_group_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?network_type:string_ ->
  ?backup_target:string_ ->
  ?custom_iam_instance_profile:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  restore_db_instance_from_db_snapshot_message

val make_scaling_configuration :
  ?min_capacity:integer_optional ->
  ?max_capacity:integer_optional ->
  ?auto_pause:boolean_optional ->
  ?seconds_until_auto_pause:integer_optional ->
  ?timeout_action:string_ ->
  ?seconds_before_timeout:integer_optional ->
  unit ->
  scaling_configuration

val make_serverless_v2_scaling_configuration :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  ?seconds_until_auto_pause:integer_optional ->
  unit ->
  serverless_v2_scaling_configuration

val make_restore_db_cluster_to_point_in_time_message :
  ?restore_type:string_ ->
  ?source_db_cluster_identifier:string_ ->
  ?restore_to_time:t_stamp ->
  ?use_latest_restorable_time:boolean_ ->
  ?port:integer_optional ->
  ?db_subnet_group_name:string_ ->
  ?option_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?backtrack_window:long_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?db_cluster_instance_class:string_ ->
  ?storage_type:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?iops:integer_optional ->
  ?network_type:string_ ->
  ?source_db_cluster_resource_id:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?scaling_configuration:scaling_configuration ->
  ?engine_mode:string_ ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?tag_specifications:tag_specification_list ->
  ?enable_vpc_networking:boolean_optional ->
  ?enable_internet_access_gateway:boolean_optional ->
  db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_to_point_in_time_message

val make_restore_db_cluster_from_snapshot_message :
  ?availability_zones:availability_zones ->
  ?engine_version:string_ ->
  ?port:integer_optional ->
  ?db_subnet_group_name:string_ ->
  ?database_name:string_ ->
  ?option_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?backtrack_window:long_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?engine_mode:string_ ->
  ?scaling_configuration:scaling_configuration ->
  ?db_cluster_parameter_group_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?db_cluster_instance_class:string_ ->
  ?storage_type:string_ ->
  ?iops:integer_optional ->
  ?publicly_accessible:boolean_optional ->
  ?network_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?tag_specifications:tag_specification_list ->
  ?enable_vpc_networking:boolean_optional ->
  ?enable_internet_access_gateway:boolean_optional ->
  db_cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  engine:string_ ->
  unit ->
  restore_db_cluster_from_snapshot_message

val make_restore_db_cluster_from_s3_message :
  ?availability_zones:availability_zones ->
  ?backup_retention_period:integer_optional ->
  ?character_set_name:string_ ->
  ?database_name:string_ ->
  ?db_cluster_parameter_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_subnet_group_name:string_ ->
  ?engine_version:string_ ->
  ?port:integer_optional ->
  ?master_user_password:sensitive_string ->
  ?option_group_name:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?tags:tag_list ->
  ?storage_encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?s3_prefix:string_ ->
  ?backtrack_window:long_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?deletion_protection:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?storage_type:string_ ->
  ?network_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?tag_specifications:tag_specification_list ->
  db_cluster_identifier:string_ ->
  engine:string_ ->
  master_username:string_ ->
  source_engine:string_ ->
  source_engine_version:string_ ->
  s3_bucket_name:string_ ->
  s3_ingestion_role_arn:string_ ->
  unit ->
  restore_db_cluster_from_s3_message

val make_db_parameter_group_name_message :
  ?db_parameter_group_name:string_ -> unit -> db_parameter_group_name_message

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_value:potentially_sensitive_parameter_value ->
  ?description:string_ ->
  ?source:string_ ->
  ?apply_type:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?minimum_engine_version:string_ ->
  ?apply_method:apply_method ->
  ?supported_engine_modes:engine_mode_list ->
  unit ->
  parameter

val make_reset_db_parameter_group_message :
  ?reset_all_parameters:boolean_ ->
  ?parameters:parameters_list ->
  db_parameter_group_name:string_ ->
  unit ->
  reset_db_parameter_group_message

val make_db_cluster_parameter_group_name_message :
  ?db_cluster_parameter_group_name:string_ -> unit -> db_cluster_parameter_group_name_message

val make_reset_db_cluster_parameter_group_message :
  ?reset_all_parameters:boolean_ ->
  ?parameters:parameters_list ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  reset_db_cluster_parameter_group_message

val make_remove_tags_from_resource_message :
  resource_name:string_ -> tag_keys:key_list -> unit -> remove_tags_from_resource_message

val make_remove_source_identifier_from_subscription_message :
  subscription_name:string_ ->
  source_identifier:string_ ->
  unit ->
  remove_source_identifier_from_subscription_message

val make_remove_role_from_db_instance_message :
  db_instance_identifier:string_ ->
  role_arn:string_ ->
  feature_name:string_ ->
  unit ->
  remove_role_from_db_instance_message

val make_remove_role_from_db_cluster_message :
  ?feature_name:string_ ->
  db_cluster_identifier:string_ ->
  role_arn:string_ ->
  unit ->
  remove_role_from_db_cluster_message

val make_remove_from_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier ->
  db_cluster_identifier:string_ ->
  unit ->
  remove_from_global_cluster_message

val make_target_health :
  ?state:target_state ->
  ?reason:target_health_reason ->
  ?description:string_ ->
  unit ->
  target_health

val make_db_proxy_target :
  ?target_arn:string_ ->
  ?endpoint:string_ ->
  ?tracked_cluster_id:string_ ->
  ?rds_resource_id:string_ ->
  ?port:integer ->
  ?type_:target_type ->
  ?role:target_role ->
  ?target_health:target_health ->
  unit ->
  db_proxy_target

val make_register_db_proxy_targets_response :
  ?db_proxy_targets:target_list -> unit -> register_db_proxy_targets_response

val make_register_db_proxy_targets_request :
  ?target_group_name:db_proxy_target_group_name ->
  ?db_instance_identifiers:string_list ->
  ?db_cluster_identifiers:string_list ->
  db_proxy_name:db_proxy_name ->
  unit ->
  register_db_proxy_targets_request

val make_db_shard_group :
  ?db_shard_group_resource_id:string_ ->
  ?db_shard_group_identifier:db_shard_group_identifier ->
  ?db_cluster_identifier:string_ ->
  ?max_ac_u:double_optional ->
  ?min_ac_u:double_optional ->
  ?compute_redundancy:integer_optional ->
  ?status:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?endpoint:string_ ->
  ?db_shard_group_arn:string_ ->
  ?tag_list:tag_list ->
  unit ->
  db_shard_group

val make_reboot_db_shard_group_message :
  db_shard_group_identifier:db_shard_group_identifier -> unit -> reboot_db_shard_group_message

val make_reboot_db_instance_message :
  ?force_failover:boolean_optional ->
  db_instance_identifier:string_ ->
  unit ->
  reboot_db_instance_message

val make_reboot_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> reboot_db_cluster_message

val make_recurring_charge :
  ?recurring_charge_amount:double -> ?recurring_charge_frequency:string_ -> unit -> recurring_charge

val make_reserved_db_instance :
  ?reserved_db_instance_id:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  ?db_instance_class:string_ ->
  ?start_time:t_stamp ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?currency_code:string_ ->
  ?db_instance_count:integer ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?multi_a_z:boolean_ ->
  ?state:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?reserved_db_instance_arn:string_ ->
  ?lease_id:string_ ->
  unit ->
  reserved_db_instance

val make_purchase_reserved_db_instances_offering_message :
  ?reserved_db_instance_id:string_ ->
  ?db_instance_count:integer_optional ->
  ?tags:tag_list ->
  reserved_db_instances_offering_id:string_ ->
  unit ->
  purchase_reserved_db_instances_offering_message

val make_promote_read_replica_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> promote_read_replica_db_cluster_message

val make_promote_read_replica_message :
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?tag_specifications:tag_specification_list ->
  db_instance_identifier:string_ ->
  unit ->
  promote_read_replica_message

val make_tenant_database_pending_modified_values :
  ?master_user_password:sensitive_string ->
  ?tenant_db_name:string_ ->
  unit ->
  tenant_database_pending_modified_values

val make_tenant_database :
  ?tenant_database_create_time:t_stamp ->
  ?db_instance_identifier:string_ ->
  ?tenant_db_name:string_ ->
  ?status:string_ ->
  ?master_username:string_ ->
  ?dbi_resource_id:string_ ->
  ?tenant_database_resource_id:string_ ->
  ?tenant_database_ar_n:string_ ->
  ?character_set_name:string_ ->
  ?nchar_character_set_name:string_ ->
  ?deletion_protection:boolean_ ->
  ?pending_modified_values:tenant_database_pending_modified_values ->
  ?master_user_secret:master_user_secret ->
  ?tag_list:tag_list ->
  unit ->
  tenant_database

val make_modify_tenant_database_message :
  ?master_user_password:sensitive_string ->
  ?new_tenant_db_name:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?rotate_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  db_instance_identifier:string_ ->
  tenant_db_name:string_ ->
  unit ->
  modify_tenant_database_message

val make_option_setting :
  ?name:string_ ->
  ?value:potentially_sensitive_option_setting_value ->
  ?default_value:string_ ->
  ?description:string_ ->
  ?apply_type:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?is_collection:boolean_ ->
  unit ->
  option_setting

val make_option_ :
  ?option_name:string_ ->
  ?option_description:string_ ->
  ?persistent:boolean_ ->
  ?permanent:boolean_ ->
  ?port:integer_optional ->
  ?option_version:string_ ->
  ?option_settings:option_setting_configuration_list ->
  ?db_security_group_memberships:db_security_group_membership_list ->
  ?vpc_security_group_memberships:vpc_security_group_membership_list ->
  unit ->
  option_

val make_option_group :
  ?option_group_name:string_ ->
  ?option_group_description:string_ ->
  ?engine_name:string_ ->
  ?major_engine_version:string_ ->
  ?options:options_list ->
  ?allows_vpc_and_non_vpc_instance_memberships:boolean_ ->
  ?vpc_id:string_ ->
  ?option_group_arn:string_ ->
  ?source_option_group:string_ ->
  ?source_account_id:string_ ->
  ?copy_timestamp:t_stamp ->
  unit ->
  option_group

val make_option_configuration :
  ?port:integer_optional ->
  ?option_version:string_ ->
  ?db_security_group_memberships:db_security_group_name_list ->
  ?vpc_security_group_memberships:vpc_security_group_id_list ->
  ?option_settings:option_settings_list ->
  option_name:string_ ->
  unit ->
  option_configuration

val make_modify_option_group_message :
  ?options_to_include:option_configuration_list ->
  ?options_to_remove:option_names_list ->
  ?apply_immediately:boolean_ ->
  option_group_name:string_ ->
  unit ->
  modify_option_group_message

val make_integration_error :
  ?error_message:string_ -> error_code:string_ -> unit -> integration_error

val make_integration :
  ?source_arn:source_arn ->
  ?target_arn:arn ->
  ?integration_name:integration_name ->
  ?integration_arn:integration_arn ->
  ?kms_key_id:string_ ->
  ?additional_encryption_context:encryption_context_map ->
  ?status:integration_status ->
  ?tags:tag_list ->
  ?data_filter:data_filter ->
  ?description:integration_description ->
  ?create_time:t_stamp ->
  ?errors:integration_error_list ->
  unit ->
  integration

val make_modify_integration_message :
  ?integration_name:integration_name ->
  ?data_filter:data_filter ->
  ?description:integration_description ->
  integration_identifier:integration_identifier ->
  unit ->
  modify_integration_message

val make_modify_global_cluster_message :
  ?new_global_cluster_identifier:global_cluster_identifier ->
  ?deletion_protection:boolean_optional ->
  ?engine_version:string_ ->
  ?allow_major_version_upgrade:boolean_optional ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  modify_global_cluster_message

val make_modify_event_subscription_message :
  ?sns_topic_arn:string_ ->
  ?source_type:string_ ->
  ?event_categories:event_categories_list ->
  ?enabled:boolean_optional ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_modify_db_subnet_group_message :
  ?db_subnet_group_description:string_ ->
  db_subnet_group_name:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  modify_db_subnet_group_message

val make_db_snapshot_attribute :
  ?attribute_name:string_ -> ?attribute_values:attribute_value_list -> unit -> db_snapshot_attribute

val make_modify_db_snapshot_attribute_message :
  ?values_to_add:attribute_value_list ->
  ?values_to_remove:attribute_value_list ->
  db_snapshot_identifier:string_ ->
  attribute_name:string_ ->
  unit ->
  modify_db_snapshot_attribute_message

val make_db_snapshot :
  ?db_snapshot_identifier:string_ ->
  ?db_instance_identifier:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?engine:string_ ->
  ?allocated_storage:integer ->
  ?status:string_ ->
  ?port:integer ->
  ?availability_zone:string_ ->
  ?vpc_id:string_ ->
  ?instance_create_time:t_stamp ->
  ?master_username:string_ ->
  ?engine_version:string_ ->
  ?license_model:string_ ->
  ?snapshot_type:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?percent_progress:integer ->
  ?source_region:string_ ->
  ?source_db_snapshot_identifier:string_ ->
  ?storage_type:string_ ->
  ?tde_credential_arn:string_ ->
  ?encrypted:boolean_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?kms_key_id:string_ ->
  ?db_snapshot_arn:string_ ->
  ?timezone:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?processor_features:processor_feature_list ->
  ?dbi_resource_id:string_ ->
  ?tag_list:tag_list ->
  ?snapshot_target:string_ ->
  ?original_snapshot_create_time:t_stamp ->
  ?snapshot_database_time:t_stamp ->
  ?db_system_id:string_ ->
  ?multi_tenant:boolean_optional ->
  ?dedicated_log_volume:boolean_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?snapshot_availability_zone:string_ ->
  unit ->
  db_snapshot

val make_modify_db_snapshot_message :
  ?engine_version:string_ ->
  ?option_group_name:string_ ->
  db_snapshot_identifier:string_ ->
  unit ->
  modify_db_snapshot_message

val make_modify_db_shard_group_message :
  ?max_ac_u:double_optional ->
  ?min_ac_u:double_optional ->
  ?compute_redundancy:integer_optional ->
  db_shard_group_identifier:db_shard_group_identifier ->
  unit ->
  modify_db_shard_group_message

val make_performance_insights_metric_dimension_group :
  ?dimensions:string_list ->
  ?group:string_ ->
  ?limit:integer ->
  unit ->
  performance_insights_metric_dimension_group

val make_performance_insights_metric_query :
  ?group_by:performance_insights_metric_dimension_group ->
  ?metric:string_ ->
  unit ->
  performance_insights_metric_query

val make_metric_query :
  ?performance_insights_metric_query:performance_insights_metric_query -> unit -> metric_query

val make_scalar_reference_details : ?value:double -> unit -> scalar_reference_details

val make_reference_details :
  ?scalar_reference_details:scalar_reference_details -> unit -> reference_details

val make_metric_reference :
  ?name:string_ -> ?reference_details:reference_details -> unit -> metric_reference

val make_metric :
  ?name:string_ ->
  ?references:metric_reference_list ->
  ?statistics_details:string_ ->
  ?metric_query:metric_query ->
  unit ->
  metric

val make_performance_issue_details :
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?metrics:metric_list ->
  ?analysis:string_ ->
  unit ->
  performance_issue_details

val make_issue_details :
  ?performance_issue_details:performance_issue_details -> unit -> issue_details

val make_doc_link : ?text:string_ -> ?url:string_ -> unit -> doc_link
val make_context_attribute : ?key:string_ -> ?value:string_ -> unit -> context_attribute

val make_recommended_action_parameter :
  ?key:string_ -> ?value:string_ -> unit -> recommended_action_parameter

val make_recommended_action :
  ?action_id:string_ ->
  ?title:string_ ->
  ?description:string_ ->
  ?operation:string_ ->
  ?parameters:recommended_action_parameter_list ->
  ?apply_modes:string_list ->
  ?status:string_ ->
  ?issue_details:issue_details ->
  ?context_attributes:context_attribute_list ->
  unit ->
  recommended_action

val make_db_recommendation :
  ?recommendation_id:string_ ->
  ?type_id:string_ ->
  ?severity:string_ ->
  ?resource_arn:string_ ->
  ?status:string_ ->
  ?created_time:t_stamp ->
  ?updated_time:t_stamp ->
  ?detection:string_ ->
  ?recommendation:string_ ->
  ?description:string_ ->
  ?reason:string_ ->
  ?recommended_actions:recommended_action_list ->
  ?category:string_ ->
  ?source:string_ ->
  ?type_detection:string_ ->
  ?type_recommendation:string_ ->
  ?impact:string_ ->
  ?additional_info:string_ ->
  ?links:doc_link_list ->
  ?issue_details:issue_details ->
  unit ->
  db_recommendation

val make_db_recommendation_message :
  ?db_recommendation:db_recommendation -> unit -> db_recommendation_message

val make_recommended_action_update :
  action_id:string_ -> status:string_ -> unit -> recommended_action_update

val make_modify_db_recommendation_message :
  ?locale:string_ ->
  ?status:string_ ->
  ?recommended_action_updates:recommended_action_update_list ->
  recommendation_id:string_ ->
  unit ->
  modify_db_recommendation_message

val make_connection_pool_configuration_info :
  ?max_connections_percent:integer ->
  ?max_idle_connections_percent:integer ->
  ?connection_borrow_timeout:integer ->
  ?session_pinning_filters:string_list ->
  ?init_query:operator_sensitive_string ->
  unit ->
  connection_pool_configuration_info

val make_db_proxy_target_group :
  ?db_proxy_name:string_ ->
  ?target_group_name:string_ ->
  ?target_group_arn:string_ ->
  ?is_default:boolean_ ->
  ?status:string_ ->
  ?connection_pool_config:connection_pool_configuration_info ->
  ?created_date:t_stamp ->
  ?updated_date:t_stamp ->
  unit ->
  db_proxy_target_group

val make_modify_db_proxy_target_group_response :
  ?db_proxy_target_group:db_proxy_target_group -> unit -> modify_db_proxy_target_group_response

val make_connection_pool_configuration :
  ?max_connections_percent:integer_optional ->
  ?max_idle_connections_percent:integer_optional ->
  ?connection_borrow_timeout:integer_optional ->
  ?session_pinning_filters:string_list ->
  ?init_query:operator_sensitive_string ->
  unit ->
  connection_pool_configuration

val make_modify_db_proxy_target_group_request :
  ?connection_pool_config:connection_pool_configuration ->
  ?new_name:string_ ->
  target_group_name:db_proxy_target_group_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  modify_db_proxy_target_group_request

val make_db_proxy_endpoint :
  ?db_proxy_endpoint_name:string_ ->
  ?db_proxy_endpoint_arn:string_ ->
  ?db_proxy_name:string_ ->
  ?status:db_proxy_endpoint_status ->
  ?vpc_id:string_ ->
  ?vpc_security_group_ids:string_list ->
  ?vpc_subnet_ids:string_list ->
  ?endpoint:string_ ->
  ?created_date:t_stamp ->
  ?target_role:db_proxy_endpoint_target_role ->
  ?is_default:boolean_ ->
  ?endpoint_network_type:endpoint_network_type ->
  unit ->
  db_proxy_endpoint

val make_modify_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> modify_db_proxy_endpoint_response

val make_modify_db_proxy_endpoint_request :
  ?new_db_proxy_endpoint_name:db_proxy_endpoint_name ->
  ?vpc_security_group_ids:string_list ->
  db_proxy_endpoint_name:db_proxy_endpoint_name ->
  unit ->
  modify_db_proxy_endpoint_request

val make_user_auth_config_info :
  ?description:string_ ->
  ?user_name:string_ ->
  ?auth_scheme:auth_scheme ->
  ?secret_arn:string_ ->
  ?iam_auth:iam_auth_mode ->
  ?client_password_auth_type:client_password_auth_type ->
  unit ->
  user_auth_config_info

val make_db_proxy :
  ?db_proxy_name:string_ ->
  ?db_proxy_arn:string_ ->
  ?status:db_proxy_status ->
  ?engine_family:string_ ->
  ?vpc_id:string_ ->
  ?vpc_security_group_ids:string_list ->
  ?vpc_subnet_ids:string_list ->
  ?default_auth_scheme:string_ ->
  ?auth:user_auth_config_info_list ->
  ?role_arn:string_ ->
  ?endpoint:string_ ->
  ?require_tl_s:boolean_ ->
  ?idle_client_timeout:integer ->
  ?debug_logging:boolean_ ->
  ?created_date:t_stamp ->
  ?updated_date:t_stamp ->
  ?endpoint_network_type:endpoint_network_type ->
  ?target_connection_network_type:target_connection_network_type ->
  unit ->
  db_proxy

val make_modify_db_proxy_response : ?db_proxy:db_proxy -> unit -> modify_db_proxy_response

val make_user_auth_config :
  ?description:description ->
  ?user_name:auth_user_name ->
  ?auth_scheme:auth_scheme ->
  ?secret_arn:arn ->
  ?iam_auth:iam_auth_mode ->
  ?client_password_auth_type:client_password_auth_type ->
  unit ->
  user_auth_config

val make_modify_db_proxy_request :
  ?new_db_proxy_name:db_proxy_name ->
  ?default_auth_scheme:default_auth_scheme ->
  ?auth:user_auth_config_list ->
  ?require_tl_s:boolean_optional ->
  ?idle_client_timeout:integer_optional ->
  ?debug_logging:boolean_optional ->
  ?role_arn:arn ->
  ?security_groups:string_list ->
  db_proxy_name:db_proxy_name ->
  unit ->
  modify_db_proxy_request

val make_modify_db_parameter_group_message :
  db_parameter_group_name:string_ ->
  parameters:parameters_list ->
  unit ->
  modify_db_parameter_group_message

val make_modify_additional_storage_volume :
  ?allocated_storage:integer_optional ->
  ?iop_s:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?storage_type:string_ ->
  ?set_for_delete:boolean_optional ->
  volume_name:string_ ->
  unit ->
  modify_additional_storage_volume

val make_cloudwatch_logs_export_configuration :
  ?enable_log_types:log_type_list ->
  ?disable_log_types:log_type_list ->
  unit ->
  cloudwatch_logs_export_configuration

val make_modify_db_instance_message :
  ?allocated_storage:integer_optional ->
  ?db_instance_class:string_ ->
  ?db_subnet_group_name:string_ ->
  ?db_security_groups:db_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?apply_immediately:boolean_ ->
  ?master_user_password:sensitive_string ->
  ?db_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?new_db_instance_identifier:string_ ->
  ?storage_type:string_ ->
  ?tde_credential_arn:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?ca_certificate_identifier:string_ ->
  ?domain:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_ou:string_ ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_dns_ips:string_list ->
  ?disable_domain:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?monitoring_interval:integer_optional ->
  ?db_port_number:integer_optional ->
  ?publicly_accessible:boolean_optional ->
  ?monitoring_role_arn:string_ ->
  ?domain_iam_role_name:string_ ->
  ?promotion_tier:integer_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?processor_features:processor_feature_list ->
  ?use_default_processor_features:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?certificate_rotation_restart:boolean_optional ->
  ?replica_mode:replica_mode ->
  ?automation_mode:automation_mode ->
  ?resume_full_automation_mode_minutes:integer_optional ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?network_type:string_ ->
  ?aws_backup_recovery_point_arn:aws_backup_recovery_point_arn ->
  ?manage_master_user_password:boolean_optional ->
  ?rotate_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?multi_tenant:boolean_optional ->
  ?dedicated_log_volume:boolean_optional ->
  ?engine:string_ ->
  ?additional_storage_volumes:modify_additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  ?master_user_authentication_type:master_user_authentication_type ->
  db_instance_identifier:string_ ->
  unit ->
  modify_db_instance_message

val make_db_cluster_snapshot_attribute :
  ?attribute_name:string_ ->
  ?attribute_values:attribute_value_list ->
  unit ->
  db_cluster_snapshot_attribute

val make_modify_db_cluster_snapshot_attribute_message :
  ?values_to_add:attribute_value_list ->
  ?values_to_remove:attribute_value_list ->
  db_cluster_snapshot_identifier:string_ ->
  attribute_name:string_ ->
  unit ->
  modify_db_cluster_snapshot_attribute_message

val make_modify_db_cluster_parameter_group_message :
  db_cluster_parameter_group_name:string_ ->
  parameters:parameters_list ->
  unit ->
  modify_db_cluster_parameter_group_message

val make_db_cluster_endpoint :
  ?db_cluster_endpoint_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_endpoint_resource_identifier:string_ ->
  ?endpoint:string_ ->
  ?status:string_ ->
  ?endpoint_type:string_ ->
  ?custom_endpoint_type:string_ ->
  ?static_members:string_list ->
  ?excluded_members:string_list ->
  ?db_cluster_endpoint_arn:string_ ->
  unit ->
  db_cluster_endpoint

val make_modify_db_cluster_endpoint_message :
  ?endpoint_type:string_ ->
  ?static_members:string_list ->
  ?excluded_members:string_list ->
  db_cluster_endpoint_identifier:string_ ->
  unit ->
  modify_db_cluster_endpoint_message

val make_modify_db_cluster_message :
  ?new_db_cluster_identifier:string_ ->
  ?apply_immediately:boolean_ ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?port:integer_optional ->
  ?master_user_password:sensitive_string ->
  ?option_group_name:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?backtrack_window:long_optional ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?engine_version:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?db_instance_parameter_group_name:string_ ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?scaling_configuration:scaling_configuration ->
  ?deletion_protection:boolean_optional ->
  ?enable_http_endpoint:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?enable_global_write_forwarding:boolean_optional ->
  ?db_cluster_instance_class:string_ ->
  ?allocated_storage:integer_optional ->
  ?storage_type:string_ ->
  ?iops:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?network_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?manage_master_user_password:boolean_optional ->
  ?rotate_master_user_password:boolean_optional ->
  ?enable_local_write_forwarding:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?engine_mode:string_ ->
  ?allow_engine_mode_change:boolean_ ->
  ?aws_backup_recovery_point_arn:aws_backup_recovery_point_arn ->
  ?enable_limitless_database:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?master_user_authentication_type:master_user_authentication_type ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_db_cluster_message

val make_serverless_v2_features_support :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  unit ->
  serverless_v2_features_support

val make_timezone : ?timezone_name:string_ -> unit -> timezone

val make_upgrade_target :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?description:string_ ->
  ?auto_upgrade:boolean_ ->
  ?is_major_version_upgrade:boolean_ ->
  ?supported_engine_modes:engine_mode_list ->
  ?supports_parallel_query:boolean_optional ->
  ?supports_global_databases:boolean_optional ->
  ?supports_babelfish:boolean_optional ->
  ?supports_limitless_database:boolean_optional ->
  ?supports_local_write_forwarding:boolean_optional ->
  ?supports_integrations:boolean_optional ->
  unit ->
  upgrade_target

val make_character_set :
  ?character_set_name:string_ -> ?character_set_description:string_ -> unit -> character_set

val make_custom_db_engine_version_am_i :
  ?image_id:string_ -> ?status:string_ -> unit -> custom_db_engine_version_am_i

val make_db_engine_version :
  ?engine:string_ ->
  ?major_engine_version:string_ ->
  ?engine_version:string_ ->
  ?database_installation_files_s3_bucket_name:string_ ->
  ?database_installation_files_s3_prefix:string_ ->
  ?database_installation_files:string_list ->
  ?custom_db_engine_version_manifest:custom_db_engine_version_manifest ->
  ?db_parameter_group_family:string_ ->
  ?db_engine_description:string_ ->
  ?db_engine_version_arn:string_ ->
  ?db_engine_version_description:string_ ->
  ?default_character_set:character_set ->
  ?failure_reason:string_ ->
  ?image:custom_db_engine_version_am_i ->
  ?db_engine_media_type:string_ ->
  ?kms_key_id:string_ ->
  ?create_time:t_stamp ->
  ?supported_character_sets:supported_character_sets_list ->
  ?supported_nchar_character_sets:supported_character_sets_list ->
  ?valid_upgrade_target:valid_upgrade_target_list ->
  ?supported_timezones:supported_timezones_list ->
  ?exportable_log_types:log_type_list ->
  ?supports_log_exports_to_cloudwatch_logs:boolean_ ->
  ?supports_read_replica:boolean_ ->
  ?supported_engine_modes:engine_mode_list ->
  ?supported_feature_names:feature_name_list ->
  ?status:string_ ->
  ?supports_parallel_query:boolean_ ->
  ?supports_global_databases:boolean_ ->
  ?tag_list:tag_list ->
  ?supports_babelfish:boolean_ ->
  ?supports_limitless_database:boolean_ ->
  ?supports_certificate_rotation_without_restart:boolean_optional ->
  ?supported_ca_certificate_identifiers:ca_certificate_identifiers_list ->
  ?supports_local_write_forwarding:boolean_optional ->
  ?supports_integrations:boolean_ ->
  ?serverless_v2_features_support:serverless_v2_features_support ->
  unit ->
  db_engine_version

val make_modify_custom_db_engine_version_message :
  ?description:description ->
  ?status:custom_engine_version_status ->
  engine:custom_engine_name ->
  engine_version:custom_engine_version ->
  unit ->
  modify_custom_db_engine_version_message

val make_db_cluster_capacity_info :
  ?db_cluster_identifier:string_ ->
  ?pending_capacity:integer_optional ->
  ?current_capacity:integer_optional ->
  ?seconds_before_timeout:integer_optional ->
  ?timeout_action:string_ ->
  unit ->
  db_cluster_capacity_info

val make_modify_current_db_cluster_capacity_message :
  ?capacity:integer_optional ->
  ?seconds_before_timeout:integer_optional ->
  ?timeout_action:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_current_db_cluster_capacity_message

val make_certificate :
  ?certificate_identifier:string_ ->
  ?certificate_type:string_ ->
  ?thumbprint:string_ ->
  ?valid_from:t_stamp ->
  ?valid_till:t_stamp ->
  ?certificate_arn:string_ ->
  ?customer_override:boolean_optional ->
  ?customer_override_valid_till:t_stamp ->
  unit ->
  certificate

val make_modify_certificates_message :
  ?certificate_identifier:string_ ->
  ?remove_customer_override:boolean_optional ->
  unit ->
  modify_certificates_message

val make_modify_activity_stream_response :
  ?kms_key_id:string_ ->
  ?kinesis_stream_name:string_ ->
  ?status:activity_stream_status ->
  ?mode:activity_stream_mode ->
  ?engine_native_audit_fields_included:boolean_optional ->
  ?policy_status:activity_stream_policy_status ->
  unit ->
  modify_activity_stream_response

val make_modify_activity_stream_request :
  ?resource_arn:string_ ->
  ?audit_policy_state:audit_policy_state ->
  unit ->
  modify_activity_stream_request

val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message
val make_filter : name:string_ -> values:filter_value_list -> unit -> filter

val make_list_tags_for_resource_message :
  ?filters:filter_list -> resource_name:string_ -> unit -> list_tags_for_resource_message

val make_failover_global_cluster_message :
  ?allow_data_loss:boolean_optional ->
  ?switchover:boolean_optional ->
  global_cluster_identifier:global_cluster_identifier ->
  target_db_cluster_identifier:db_cluster_identifier ->
  unit ->
  failover_global_cluster_message

val make_failover_db_cluster_message :
  ?target_db_instance_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  failover_db_cluster_message

val make_enable_http_endpoint_response :
  ?resource_arn:string_ -> ?http_endpoint_enabled:boolean_ -> unit -> enable_http_endpoint_response

val make_enable_http_endpoint_request : resource_arn:string_ -> unit -> enable_http_endpoint_request

val make_download_db_log_file_portion_details :
  ?log_file_data:sensitive_string ->
  ?marker:string_ ->
  ?additional_data_pending:boolean_ ->
  unit ->
  download_db_log_file_portion_details

val make_download_db_log_file_portion_message :
  ?marker:string_ ->
  ?number_of_lines:integer ->
  db_instance_identifier:string_ ->
  log_file_name:string_ ->
  unit ->
  download_db_log_file_portion_message

val make_disable_http_endpoint_response :
  ?resource_arn:string_ -> ?http_endpoint_enabled:boolean_ -> unit -> disable_http_endpoint_response

val make_disable_http_endpoint_request :
  resource_arn:string_ -> unit -> disable_http_endpoint_request

val make_double_range : ?from_:double -> ?to_:double -> unit -> double_range
val make_range : ?from_:integer -> ?to_:integer -> ?step:integer_optional -> unit -> range

val make_valid_storage_options :
  ?storage_type:string_ ->
  ?storage_size:range_list ->
  ?provisioned_iops:range_list ->
  ?iops_to_storage_ratio:double_range_list ->
  ?provisioned_storage_throughput:range_list ->
  ?storage_throughput_to_iops_ratio:double_range_list ->
  ?supports_storage_autoscaling:boolean_ ->
  unit ->
  valid_storage_options

val make_valid_volume_options :
  ?volume_name:string_ -> ?storage:valid_storage_options_list -> unit -> valid_volume_options

val make_valid_additional_storage_options :
  ?supports_additional_storage_volumes:boolean_ ->
  ?volumes:valid_volume_options_list ->
  unit ->
  valid_additional_storage_options

val make_available_processor_feature :
  ?name:string_ ->
  ?default_value:string_ ->
  ?allowed_values:string_ ->
  unit ->
  available_processor_feature

val make_valid_db_instance_modifications_message :
  ?storage:valid_storage_options_list ->
  ?valid_processor_features:available_processor_feature_list ->
  ?supports_dedicated_log_volume:boolean_ ->
  ?additional_storage:valid_additional_storage_options ->
  unit ->
  valid_db_instance_modifications_message

val make_describe_valid_db_instance_modifications_message :
  db_instance_identifier:string_ -> unit -> describe_valid_db_instance_modifications_message

val make_tenant_databases_message :
  ?marker:string_ -> ?tenant_databases:tenant_databases_list -> unit -> tenant_databases_message

val make_describe_tenant_databases_message :
  ?db_instance_identifier:string_ ->
  ?tenant_db_name:string_ ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_tenant_databases_message

val make_source_region :
  ?region_name:string_ ->
  ?endpoint:string_ ->
  ?status:string_ ->
  ?supports_db_instance_automated_backups_replication:boolean_ ->
  unit ->
  source_region

val make_source_region_message :
  ?marker:string_ -> ?source_regions:source_region_list -> unit -> source_region_message

val make_describe_source_regions_message :
  ?region_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  unit ->
  describe_source_regions_message

val make_serverless_v2_platform_version_info :
  ?serverless_v2_platform_version:string_ ->
  ?serverless_v2_platform_version_description:string_ ->
  ?engine:string_ ->
  ?serverless_v2_features_support:serverless_v2_features_support ->
  ?status:string_ ->
  ?is_default:boolean_ ->
  unit ->
  serverless_v2_platform_version_info

val make_serverless_v2_platform_versions_message :
  ?marker:string_ ->
  ?serverless_v2_platform_versions:serverless_v2_platform_version_list ->
  unit ->
  serverless_v2_platform_versions_message

val make_describe_serverless_v2_platform_versions_message :
  ?serverless_v2_platform_version:string_ ->
  ?engine:string_ ->
  ?filters:filter_list ->
  ?default_only:boolean_optional ->
  ?include_all:boolean_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_serverless_v2_platform_versions_message

val make_reserved_db_instances_offering :
  ?reserved_db_instances_offering_id:string_ ->
  ?db_instance_class:string_ ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?currency_code:string_ ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?multi_a_z:boolean_ ->
  ?recurring_charges:recurring_charge_list ->
  unit ->
  reserved_db_instances_offering

val make_reserved_db_instances_offering_message :
  ?marker:string_ ->
  ?reserved_db_instances_offerings:reserved_db_instances_offering_list ->
  unit ->
  reserved_db_instances_offering_message

val make_describe_reserved_db_instances_offerings_message :
  ?reserved_db_instances_offering_id:string_ ->
  ?db_instance_class:string_ ->
  ?duration:string_ ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?multi_a_z:boolean_optional ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_db_instances_offerings_message

val make_reserved_db_instance_message :
  ?marker:string_ ->
  ?reserved_db_instances:reserved_db_instance_list ->
  unit ->
  reserved_db_instance_message

val make_describe_reserved_db_instances_message :
  ?reserved_db_instance_id:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  ?db_instance_class:string_ ->
  ?duration:string_ ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?multi_a_z:boolean_optional ->
  ?lease_id:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_db_instances_message

val make_pending_maintenance_action :
  ?action:string_ ->
  ?auto_applied_after_date:t_stamp ->
  ?forced_apply_date:t_stamp ->
  ?opt_in_status:string_ ->
  ?current_apply_date:t_stamp ->
  ?description:string_ ->
  unit ->
  pending_maintenance_action

val make_resource_pending_maintenance_actions :
  ?resource_identifier:string_ ->
  ?pending_maintenance_action_details:pending_maintenance_action_details ->
  unit ->
  resource_pending_maintenance_actions

val make_pending_maintenance_actions_message :
  ?pending_maintenance_actions:pending_maintenance_actions ->
  ?marker:string_ ->
  unit ->
  pending_maintenance_actions_message

val make_describe_pending_maintenance_actions_message :
  ?resource_identifier:string_ ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_pending_maintenance_actions_message

val make_available_additional_storage_volumes_option :
  ?supports_storage_autoscaling:boolean_ ->
  ?supports_storage_throughput:boolean_ ->
  ?supports_iops:boolean_ ->
  ?storage_type:string_ ->
  ?min_storage_size:integer_optional ->
  ?max_storage_size:integer_optional ->
  ?min_iops:integer_optional ->
  ?max_iops:integer_optional ->
  ?min_iops_per_gib:double_optional ->
  ?max_iops_per_gib:double_optional ->
  ?min_storage_throughput:integer_optional ->
  ?max_storage_throughput:integer_optional ->
  unit ->
  available_additional_storage_volumes_option

val make_orderable_db_instance_option :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?db_instance_class:string_ ->
  ?license_model:string_ ->
  ?availability_zone_group:string_ ->
  ?availability_zones:availability_zone_list ->
  ?multi_az_capable:boolean_ ->
  ?read_replica_capable:boolean_ ->
  ?vpc:boolean_ ->
  ?supports_storage_encryption:boolean_ ->
  ?storage_type:string_ ->
  ?supports_iops:boolean_ ->
  ?supports_storage_throughput:boolean_ ->
  ?supports_enhanced_monitoring:boolean_ ->
  ?supports_iam_database_authentication:boolean_ ->
  ?supports_performance_insights:boolean_ ->
  ?min_storage_size:integer_optional ->
  ?max_storage_size:integer_optional ->
  ?min_iops_per_db_instance:integer_optional ->
  ?max_iops_per_db_instance:integer_optional ->
  ?min_iops_per_gib:double_optional ->
  ?max_iops_per_gib:double_optional ->
  ?min_storage_throughput_per_db_instance:integer_optional ->
  ?max_storage_throughput_per_db_instance:integer_optional ->
  ?min_storage_throughput_per_iops:double_optional ->
  ?max_storage_throughput_per_iops:double_optional ->
  ?available_processor_features:available_processor_feature_list ->
  ?supported_engine_modes:engine_mode_list ->
  ?supports_storage_autoscaling:boolean_optional ->
  ?supports_kerberos_authentication:boolean_optional ->
  ?outpost_capable:boolean_ ->
  ?supported_activity_stream_modes:activity_stream_mode_list ->
  ?supports_global_databases:boolean_ ->
  ?supported_network_types:string_list ->
  ?supports_clusters:boolean_ ->
  ?supports_dedicated_log_volume:boolean_ ->
  ?supports_additional_storage_volumes:boolean_optional ->
  ?supports_http_endpoint:boolean_ ->
  ?available_additional_storage_volumes_options:available_additional_storage_volumes_option_list ->
  unit ->
  orderable_db_instance_option

val make_orderable_db_instance_options_message :
  ?orderable_db_instance_options:orderable_db_instance_options_list ->
  ?marker:string_ ->
  unit ->
  orderable_db_instance_options_message

val make_describe_orderable_db_instance_options_message :
  ?engine_version:string_ ->
  ?db_instance_class:string_ ->
  ?license_model:string_ ->
  ?availability_zone_group:string_ ->
  ?vpc:boolean_optional ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  engine:string_ ->
  unit ->
  describe_orderable_db_instance_options_message

val make_option_groups :
  ?option_groups_list:option_groups_list -> ?marker:string_ -> unit -> option_groups

val make_describe_option_groups_message :
  ?option_group_name:string_ ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?engine_name:string_ ->
  ?major_engine_version:string_ ->
  unit ->
  describe_option_groups_message

val make_option_version : ?version:string_ -> ?is_default:boolean_ -> unit -> option_version

val make_minimum_engine_version_per_allowed_value :
  ?allowed_value:string_ ->
  ?minimum_engine_version:string_ ->
  unit ->
  minimum_engine_version_per_allowed_value

val make_option_group_option_setting :
  ?setting_name:string_ ->
  ?setting_description:string_ ->
  ?default_value:string_ ->
  ?apply_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?is_required:boolean_ ->
  ?minimum_engine_version_per_allowed_value:minimum_engine_version_per_allowed_value_list ->
  unit ->
  option_group_option_setting

val make_option_group_option :
  ?name:string_ ->
  ?description:string_ ->
  ?engine_name:string_ ->
  ?major_engine_version:string_ ->
  ?minimum_required_minor_engine_version:string_ ->
  ?port_required:boolean_ ->
  ?default_port:integer_optional ->
  ?options_depended_on:options_depended_on ->
  ?options_conflicts_with:options_conflicts_with ->
  ?persistent:boolean_ ->
  ?permanent:boolean_ ->
  ?requires_auto_minor_engine_version_upgrade:boolean_ ->
  ?vpc_only:boolean_ ->
  ?supports_option_version_downgrade:boolean_optional ->
  ?option_group_option_settings:option_group_option_settings_list ->
  ?option_group_option_versions:option_group_option_versions_list ->
  ?copyable_cross_account:boolean_optional ->
  unit ->
  option_group_option

val make_option_group_options_message :
  ?option_group_options:option_group_options_list ->
  ?marker:string_ ->
  unit ->
  option_group_options_message

val make_describe_option_group_options_message :
  ?major_engine_version:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  engine_name:string_ ->
  unit ->
  describe_option_group_options_message

val make_describe_integrations_response :
  ?marker:marker -> ?integrations:integration_list -> unit -> describe_integrations_response

val make_describe_integrations_message :
  ?integration_identifier:integration_identifier ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:marker ->
  unit ->
  describe_integrations_message

val make_global_clusters_message :
  ?marker:string_ -> ?global_clusters:global_cluster_list -> unit -> global_clusters_message

val make_describe_global_clusters_message :
  ?global_cluster_identifier:global_cluster_identifier ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_global_clusters_message

val make_export_tasks_message :
  ?marker:string_ -> ?export_tasks:export_tasks_list -> unit -> export_tasks_message

val make_describe_export_tasks_message :
  ?export_task_identifier:string_ ->
  ?source_arn:string_ ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  ?source_type:export_source_type ->
  unit ->
  describe_export_tasks_message

val make_event_subscriptions_message :
  ?marker:string_ ->
  ?event_subscriptions_list:event_subscriptions_list ->
  unit ->
  event_subscriptions_message

val make_describe_event_subscriptions_message :
  ?subscription_name:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_event_subscriptions_message

val make_event :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?message:string_ ->
  ?event_categories:event_categories_list ->
  ?date:t_stamp ->
  ?source_arn:string_ ->
  unit ->
  event

val make_events_message : ?marker:string_ -> ?events:event_list -> unit -> events_message

val make_describe_events_message :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?duration:integer_optional ->
  ?event_categories:event_categories_list ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_events_message

val make_event_categories_map :
  ?source_type:string_ -> ?event_categories:event_categories_list -> unit -> event_categories_map

val make_event_categories_message :
  ?event_categories_map_list:event_categories_map_list -> unit -> event_categories_message

val make_describe_event_categories_message :
  ?source_type:string_ -> ?filters:filter_list -> unit -> describe_event_categories_message

val make_engine_defaults :
  ?db_parameter_group_family:string_ ->
  ?marker:string_ ->
  ?parameters:parameters_list ->
  unit ->
  engine_defaults

val make_describe_engine_default_parameters_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_parameters_message

val make_describe_engine_default_cluster_parameters_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_cluster_parameters_message

val make_db_subnet_group_message :
  ?marker:string_ -> ?db_subnet_groups:db_subnet_groups -> unit -> db_subnet_group_message

val make_describe_db_subnet_groups_message :
  ?db_subnet_group_name:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_subnet_groups_message

val make_db_snapshot_tenant_database :
  ?db_snapshot_identifier:string_ ->
  ?db_instance_identifier:string_ ->
  ?dbi_resource_id:string_ ->
  ?engine_name:string_ ->
  ?snapshot_type:string_ ->
  ?tenant_database_create_time:t_stamp ->
  ?tenant_db_name:string_ ->
  ?master_username:string_ ->
  ?tenant_database_resource_id:string_ ->
  ?character_set_name:string_ ->
  ?db_snapshot_tenant_database_ar_n:string_ ->
  ?nchar_character_set_name:string_ ->
  ?tag_list:tag_list ->
  unit ->
  db_snapshot_tenant_database

val make_db_snapshot_tenant_databases_message :
  ?marker:string_ ->
  ?db_snapshot_tenant_databases:db_snapshot_tenant_databases_list ->
  unit ->
  db_snapshot_tenant_databases_message

val make_describe_db_snapshot_tenant_databases_message :
  ?db_instance_identifier:string_ ->
  ?db_snapshot_identifier:string_ ->
  ?snapshot_type:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?dbi_resource_id:string_ ->
  unit ->
  describe_db_snapshot_tenant_databases_message

val make_db_snapshot_message :
  ?marker:string_ -> ?db_snapshots:db_snapshot_list -> unit -> db_snapshot_message

val make_describe_db_snapshots_message :
  ?db_instance_identifier:string_ ->
  ?db_snapshot_identifier:string_ ->
  ?snapshot_type:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?include_shared:boolean_ ->
  ?include_public:boolean_ ->
  ?dbi_resource_id:string_ ->
  unit ->
  describe_db_snapshots_message

val make_describe_db_snapshot_attributes_message :
  db_snapshot_identifier:string_ -> unit -> describe_db_snapshot_attributes_message

val make_describe_db_shard_groups_response :
  ?db_shard_groups:db_shard_groups_list ->
  ?marker:string_ ->
  unit ->
  describe_db_shard_groups_response

val make_describe_db_shard_groups_message :
  ?db_shard_group_identifier:db_shard_group_identifier ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  unit ->
  describe_db_shard_groups_message

val make_db_security_group_message :
  ?marker:string_ -> ?db_security_groups:db_security_groups -> unit -> db_security_group_message

val make_describe_db_security_groups_message :
  ?db_security_group_name:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_security_groups_message

val make_db_recommendations_message :
  ?db_recommendations:db_recommendation_list ->
  ?marker:string_ ->
  unit ->
  db_recommendations_message

val make_describe_db_recommendations_message :
  ?last_updated_after:t_stamp ->
  ?last_updated_before:t_stamp ->
  ?locale:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_recommendations_message

val make_describe_db_proxy_targets_response :
  ?targets:target_list -> ?marker:string_ -> unit -> describe_db_proxy_targets_response

val make_describe_db_proxy_targets_request :
  ?target_group_name:db_proxy_target_group_name ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxy_targets_request

val make_describe_db_proxy_target_groups_response :
  ?target_groups:target_group_list ->
  ?marker:string_ ->
  unit ->
  describe_db_proxy_target_groups_response

val make_describe_db_proxy_target_groups_request :
  ?target_group_name:db_proxy_target_group_name ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxy_target_groups_request

val make_describe_db_proxy_endpoints_response :
  ?db_proxy_endpoints:db_proxy_endpoint_list ->
  ?marker:string_ ->
  unit ->
  describe_db_proxy_endpoints_response

val make_describe_db_proxy_endpoints_request :
  ?db_proxy_name:db_proxy_name ->
  ?db_proxy_endpoint_name:db_proxy_endpoint_name ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  unit ->
  describe_db_proxy_endpoints_request

val make_describe_db_proxies_response :
  ?db_proxies:db_proxy_list -> ?marker:string_ -> unit -> describe_db_proxies_response

val make_describe_db_proxies_request :
  ?db_proxy_name:db_proxy_name ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  unit ->
  describe_db_proxies_request

val make_db_parameter_group_details :
  ?parameters:parameters_list -> ?marker:string_ -> unit -> db_parameter_group_details

val make_describe_db_parameters_message :
  ?source:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_parameter_group_name:string_ ->
  unit ->
  describe_db_parameters_message

val make_db_parameter_group :
  ?db_parameter_group_name:string_ ->
  ?db_parameter_group_family:string_ ->
  ?description:string_ ->
  ?db_parameter_group_arn:string_ ->
  unit ->
  db_parameter_group

val make_db_parameter_groups_message :
  ?marker:string_ ->
  ?db_parameter_groups:db_parameter_group_list ->
  unit ->
  db_parameter_groups_message

val make_describe_db_parameter_groups_message :
  ?db_parameter_group_name:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_parameter_groups_message

val make_supported_engine_lifecycle :
  lifecycle_support_name:lifecycle_support_name ->
  lifecycle_support_start_date:t_stamp ->
  lifecycle_support_end_date:t_stamp ->
  unit ->
  supported_engine_lifecycle

val make_db_major_engine_version :
  ?engine:string_ ->
  ?major_engine_version:string_ ->
  ?supported_engine_lifecycles:supported_engine_lifecycle_list ->
  unit ->
  db_major_engine_version

val make_describe_db_major_engine_versions_response :
  ?db_major_engine_versions:db_major_engine_versions_list ->
  ?marker:string_ ->
  unit ->
  describe_db_major_engine_versions_response

val make_describe_db_major_engine_versions_request :
  ?engine:engine ->
  ?major_engine_version:major_engine_version ->
  ?marker:marker ->
  ?max_records:max_records ->
  unit ->
  describe_db_major_engine_versions_request

val make_describe_db_log_files_details :
  ?log_file_name:string_ ->
  ?last_written:long ->
  ?size:long ->
  unit ->
  describe_db_log_files_details

val make_describe_db_log_files_response :
  ?describe_db_log_files:describe_db_log_files_list ->
  ?marker:string_ ->
  unit ->
  describe_db_log_files_response

val make_describe_db_log_files_message :
  ?filename_contains:string_ ->
  ?file_last_written:long ->
  ?file_size:long ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  describe_db_log_files_message

val make_db_instance_message :
  ?marker:string_ -> ?db_instances:db_instance_list -> unit -> db_instance_message

val make_describe_db_instances_message :
  ?db_instance_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_instances_message

val make_db_instance_automated_backup_message :
  ?marker:string_ ->
  ?db_instance_automated_backups:db_instance_automated_backup_list ->
  unit ->
  db_instance_automated_backup_message

val make_describe_db_instance_automated_backups_message :
  ?dbi_resource_id:string_ ->
  ?db_instance_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?db_instance_automated_backups_arn:string_ ->
  unit ->
  describe_db_instance_automated_backups_message

val make_db_engine_version_message :
  ?marker:string_ -> ?db_engine_versions:db_engine_version_list -> unit -> db_engine_version_message

val make_describe_db_engine_versions_message :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?db_parameter_group_family:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?default_only:boolean_ ->
  ?list_supported_character_sets:boolean_optional ->
  ?list_supported_timezones:boolean_optional ->
  ?include_all:boolean_optional ->
  unit ->
  describe_db_engine_versions_message

val make_db_cluster_snapshot :
  ?availability_zones:availability_zones ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?engine:string_ ->
  ?engine_mode:string_ ->
  ?allocated_storage:integer ->
  ?status:string_ ->
  ?port:integer ->
  ?vpc_id:string_ ->
  ?cluster_create_time:t_stamp ->
  ?master_username:string_ ->
  ?engine_version:string_ ->
  ?license_model:string_ ->
  ?snapshot_type:string_ ->
  ?percent_progress:integer ->
  ?storage_encrypted:boolean_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?kms_key_id:string_ ->
  ?db_cluster_snapshot_arn:string_ ->
  ?source_db_cluster_snapshot_arn:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?tag_list:tag_list ->
  ?storage_type:string_ ->
  ?storage_throughput:integer_optional ->
  ?db_cluster_resource_id:string_ ->
  ?db_system_id:string_ ->
  unit ->
  db_cluster_snapshot

val make_db_cluster_snapshot_message :
  ?marker:string_ ->
  ?db_cluster_snapshots:db_cluster_snapshot_list ->
  unit ->
  db_cluster_snapshot_message

val make_describe_db_cluster_snapshots_message :
  ?db_cluster_identifier:string_ ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?snapshot_type:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?include_shared:boolean_ ->
  ?include_public:boolean_ ->
  ?db_cluster_resource_id:string_ ->
  unit ->
  describe_db_cluster_snapshots_message

val make_describe_db_cluster_snapshot_attributes_message :
  db_cluster_snapshot_identifier:string_ -> unit -> describe_db_cluster_snapshot_attributes_message

val make_db_cluster_message :
  ?marker:string_ -> ?db_clusters:db_cluster_list -> unit -> db_cluster_message

val make_describe_db_clusters_message :
  ?db_cluster_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?include_shared:boolean_ ->
  unit ->
  describe_db_clusters_message

val make_db_cluster_parameter_group_details :
  ?parameters:parameters_list -> ?marker:string_ -> unit -> db_cluster_parameter_group_details

val make_describe_db_cluster_parameters_message :
  ?source:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  describe_db_cluster_parameters_message

val make_db_cluster_parameter_group :
  ?db_cluster_parameter_group_name:string_ ->
  ?db_parameter_group_family:string_ ->
  ?description:string_ ->
  ?db_cluster_parameter_group_arn:string_ ->
  unit ->
  db_cluster_parameter_group

val make_db_cluster_parameter_groups_message :
  ?marker:string_ ->
  ?db_cluster_parameter_groups:db_cluster_parameter_group_list ->
  unit ->
  db_cluster_parameter_groups_message

val make_describe_db_cluster_parameter_groups_message :
  ?db_cluster_parameter_group_name:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_cluster_parameter_groups_message

val make_db_cluster_endpoint_message :
  ?marker:string_ ->
  ?db_cluster_endpoints:db_cluster_endpoint_list ->
  unit ->
  db_cluster_endpoint_message

val make_describe_db_cluster_endpoints_message :
  ?db_cluster_identifier:string_ ->
  ?db_cluster_endpoint_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_cluster_endpoints_message

val make_db_cluster_backtrack :
  ?db_cluster_identifier:string_ ->
  ?backtrack_identifier:string_ ->
  ?backtrack_to:t_stamp ->
  ?backtracked_from:t_stamp ->
  ?backtrack_request_creation_time:t_stamp ->
  ?status:string_ ->
  unit ->
  db_cluster_backtrack

val make_db_cluster_backtrack_message :
  ?marker:string_ ->
  ?db_cluster_backtracks:db_cluster_backtrack_list ->
  unit ->
  db_cluster_backtrack_message

val make_describe_db_cluster_backtracks_message :
  ?backtrack_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  describe_db_cluster_backtracks_message

val make_db_cluster_automated_backup :
  ?engine:string_ ->
  ?vpc_id:string_ ->
  ?db_cluster_automated_backups_arn:string_ ->
  ?db_cluster_identifier:string_ ->
  ?restore_window:restore_window ->
  ?master_username:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?region:string_ ->
  ?license_model:string_ ->
  ?status:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?cluster_create_time:t_stamp ->
  ?storage_encrypted:boolean_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?allocated_storage:integer ->
  ?engine_version:string_ ->
  ?db_cluster_arn:string_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?engine_mode:string_ ->
  ?availability_zones:availability_zones ->
  ?port:integer ->
  ?kms_key_id:string_ ->
  ?storage_type:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?tag_list:tag_list ->
  unit ->
  db_cluster_automated_backup

val make_db_cluster_automated_backup_message :
  ?marker:string_ ->
  ?db_cluster_automated_backups:db_cluster_automated_backup_list ->
  unit ->
  db_cluster_automated_backup_message

val make_describe_db_cluster_automated_backups_message :
  ?db_cluster_resource_id:string_ ->
  ?db_cluster_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_cluster_automated_backups_message

val make_certificate_message :
  ?default_certificate_for_new_launches:string_ ->
  ?certificates:certificate_list ->
  ?marker:string_ ->
  unit ->
  certificate_message

val make_describe_certificates_message :
  ?certificate_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_certificates_message

val make_describe_blue_green_deployments_response :
  ?blue_green_deployments:blue_green_deployment_list ->
  ?marker:string_ ->
  unit ->
  describe_blue_green_deployments_response

val make_describe_blue_green_deployments_request :
  ?blue_green_deployment_identifier:blue_green_deployment_identifier ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:max_records ->
  unit ->
  describe_blue_green_deployments_request

val make_describe_account_attributes_message : unit -> unit
val make_deregister_db_proxy_targets_response : unit -> unit

val make_deregister_db_proxy_targets_request :
  ?target_group_name:db_proxy_target_group_name ->
  ?db_instance_identifiers:string_list ->
  ?db_cluster_identifiers:string_list ->
  db_proxy_name:db_proxy_name ->
  unit ->
  deregister_db_proxy_targets_request

val make_delete_tenant_database_message :
  ?skip_final_snapshot:boolean_ ->
  ?final_db_snapshot_identifier:string_ ->
  db_instance_identifier:string_ ->
  tenant_db_name:string_ ->
  unit ->
  delete_tenant_database_message

val make_delete_option_group_message :
  option_group_name:string_ -> unit -> delete_option_group_message

val make_delete_integration_message :
  integration_identifier:integration_identifier -> unit -> delete_integration_message

val make_delete_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier -> unit -> delete_global_cluster_message

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_db_subnet_group_message :
  db_subnet_group_name:string_ -> unit -> delete_db_subnet_group_message

val make_delete_db_snapshot_message :
  db_snapshot_identifier:string_ -> unit -> delete_db_snapshot_message

val make_delete_db_shard_group_message :
  db_shard_group_identifier:db_shard_group_identifier -> unit -> delete_db_shard_group_message

val make_delete_db_security_group_message :
  db_security_group_name:string_ -> unit -> delete_db_security_group_message

val make_delete_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> delete_db_proxy_endpoint_response

val make_delete_db_proxy_endpoint_request :
  db_proxy_endpoint_name:db_proxy_endpoint_name -> unit -> delete_db_proxy_endpoint_request

val make_delete_db_proxy_response : ?db_proxy:db_proxy -> unit -> delete_db_proxy_response
val make_delete_db_proxy_request : db_proxy_name:db_proxy_name -> unit -> delete_db_proxy_request

val make_delete_db_parameter_group_message :
  db_parameter_group_name:string_ -> unit -> delete_db_parameter_group_message

val make_delete_db_instance_automated_backup_message :
  ?dbi_resource_id:string_ ->
  ?db_instance_automated_backups_arn:string_ ->
  unit ->
  delete_db_instance_automated_backup_message

val make_delete_db_instance_message :
  ?skip_final_snapshot:boolean_ ->
  ?final_db_snapshot_identifier:string_ ->
  ?delete_automated_backups:boolean_optional ->
  db_instance_identifier:string_ ->
  unit ->
  delete_db_instance_message

val make_delete_db_cluster_snapshot_message :
  db_cluster_snapshot_identifier:string_ -> unit -> delete_db_cluster_snapshot_message

val make_delete_db_cluster_parameter_group_message :
  db_cluster_parameter_group_name:string_ -> unit -> delete_db_cluster_parameter_group_message

val make_delete_db_cluster_endpoint_message :
  db_cluster_endpoint_identifier:string_ -> unit -> delete_db_cluster_endpoint_message

val make_delete_db_cluster_automated_backup_message :
  db_cluster_resource_id:string_ -> unit -> delete_db_cluster_automated_backup_message

val make_delete_db_cluster_message :
  ?skip_final_snapshot:boolean_ ->
  ?final_db_snapshot_identifier:string_ ->
  ?delete_automated_backups:boolean_optional ->
  db_cluster_identifier:string_ ->
  unit ->
  delete_db_cluster_message

val make_delete_custom_db_engine_version_message :
  engine:custom_engine_name ->
  engine_version:custom_engine_version ->
  unit ->
  delete_custom_db_engine_version_message

val make_delete_blue_green_deployment_response :
  ?blue_green_deployment:blue_green_deployment -> unit -> delete_blue_green_deployment_response

val make_delete_blue_green_deployment_request :
  ?delete_target:boolean_optional ->
  blue_green_deployment_identifier:blue_green_deployment_identifier ->
  unit ->
  delete_blue_green_deployment_request

val make_create_tenant_database_message :
  ?master_user_password:sensitive_string ->
  ?character_set_name:string_ ->
  ?nchar_character_set_name:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?tags:tag_list ->
  db_instance_identifier:string_ ->
  tenant_db_name:string_ ->
  master_username:string_ ->
  unit ->
  create_tenant_database_message

val make_create_option_group_message :
  ?tags:tag_list ->
  option_group_name:string_ ->
  engine_name:string_ ->
  major_engine_version:string_ ->
  option_group_description:string_ ->
  unit ->
  create_option_group_message

val make_create_integration_message :
  ?kms_key_id:string_ ->
  ?additional_encryption_context:encryption_context_map ->
  ?tags:tag_list ->
  ?data_filter:data_filter ->
  ?description:integration_description ->
  source_arn:source_arn ->
  target_arn:arn ->
  integration_name:integration_name ->
  unit ->
  create_integration_message

val make_create_global_cluster_message :
  ?source_db_cluster_identifier:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?deletion_protection:boolean_optional ->
  ?database_name:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  create_global_cluster_message

val make_create_event_subscription_message :
  ?source_type:string_ ->
  ?event_categories:event_categories_list ->
  ?source_ids:source_ids_list ->
  ?enabled:boolean_optional ->
  ?tags:tag_list ->
  subscription_name:string_ ->
  sns_topic_arn:string_ ->
  unit ->
  create_event_subscription_message

val make_create_db_subnet_group_message :
  ?tags:tag_list ->
  db_subnet_group_name:string_ ->
  db_subnet_group_description:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_db_subnet_group_message

val make_create_db_snapshot_message :
  ?tags:tag_list ->
  db_snapshot_identifier:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  create_db_snapshot_message

val make_create_db_shard_group_message :
  ?compute_redundancy:integer_optional ->
  ?min_ac_u:double_optional ->
  ?publicly_accessible:boolean_optional ->
  ?tags:tag_list ->
  db_shard_group_identifier:string_ ->
  db_cluster_identifier:string_ ->
  max_ac_u:double_optional ->
  unit ->
  create_db_shard_group_message

val make_create_db_security_group_message :
  ?tags:tag_list ->
  db_security_group_name:string_ ->
  db_security_group_description:string_ ->
  unit ->
  create_db_security_group_message

val make_create_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> create_db_proxy_endpoint_response

val make_create_db_proxy_endpoint_request :
  ?vpc_security_group_ids:string_list ->
  ?target_role:db_proxy_endpoint_target_role ->
  ?tags:tag_list ->
  ?endpoint_network_type:endpoint_network_type ->
  db_proxy_name:db_proxy_name ->
  db_proxy_endpoint_name:db_proxy_endpoint_name ->
  vpc_subnet_ids:string_list ->
  unit ->
  create_db_proxy_endpoint_request

val make_create_db_proxy_response : ?db_proxy:db_proxy -> unit -> create_db_proxy_response

val make_create_db_proxy_request :
  ?default_auth_scheme:default_auth_scheme ->
  ?auth:user_auth_config_list ->
  ?vpc_security_group_ids:string_list ->
  ?require_tl_s:boolean_ ->
  ?idle_client_timeout:integer_optional ->
  ?debug_logging:boolean_ ->
  ?tags:tag_list ->
  ?endpoint_network_type:endpoint_network_type ->
  ?target_connection_network_type:target_connection_network_type ->
  db_proxy_name:db_proxy_name ->
  engine_family:engine_family ->
  role_arn:arn ->
  vpc_subnet_ids:string_list ->
  unit ->
  create_db_proxy_request

val make_create_db_parameter_group_message :
  ?tags:tag_list ->
  db_parameter_group_name:string_ ->
  db_parameter_group_family:string_ ->
  description:string_ ->
  unit ->
  create_db_parameter_group_message

val make_create_db_instance_read_replica_message :
  ?source_db_instance_identifier:string_ ->
  ?db_instance_class:string_ ->
  ?availability_zone:string_ ->
  ?port:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?db_parameter_group_name:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?tags:tag_list ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?storage_type:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?pre_signed_url:sensitive_string ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?use_default_processor_features:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_ou:string_ ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_dns_ips:string_list ->
  ?replica_mode:replica_mode ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?network_type:string_ ->
  ?max_allocated_storage:integer_optional ->
  ?backup_target:string_ ->
  ?custom_iam_instance_profile:string_ ->
  ?allocated_storage:integer_optional ->
  ?source_db_cluster_identifier:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?upgrade_storage_config:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  db_instance_identifier:string_ ->
  unit ->
  create_db_instance_read_replica_message

val make_create_db_instance_message :
  ?db_name:string_ ->
  ?allocated_storage:integer_optional ->
  ?master_username:string_ ->
  ?master_user_password:sensitive_string ->
  ?db_security_groups:db_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?availability_zone:string_ ->
  ?db_subnet_group_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?db_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?port:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?storage_throughput:integer_optional ->
  ?option_group_name:string_ ->
  ?character_set_name:string_ ->
  ?nchar_character_set_name:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?tags:tag_list ->
  ?db_cluster_identifier:string_ ->
  ?storage_type:string_ ->
  ?tde_credential_arn:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?storage_encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?domain:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_ou:string_ ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_dns_ips:string_list ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?domain_iam_role_name:string_ ->
  ?promotion_tier:integer_optional ->
  ?timezone:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?processor_features:processor_feature_list ->
  ?deletion_protection:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?network_type:string_ ->
  ?backup_target:string_ ->
  ?custom_iam_instance_profile:string_ ->
  ?db_system_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?multi_tenant:boolean_optional ->
  ?dedicated_log_volume:boolean_optional ->
  ?engine_lifecycle_support:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?tag_specifications:tag_specification_list ->
  ?master_user_authentication_type:master_user_authentication_type ->
  db_instance_identifier:string_ ->
  db_instance_class:string_ ->
  engine:string_ ->
  unit ->
  create_db_instance_message

val make_create_db_cluster_snapshot_message :
  ?tags:tag_list ->
  db_cluster_snapshot_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_snapshot_message

val make_create_db_cluster_parameter_group_message :
  ?tags:tag_list ->
  db_cluster_parameter_group_name:string_ ->
  db_parameter_group_family:string_ ->
  description:string_ ->
  unit ->
  create_db_cluster_parameter_group_message

val make_create_db_cluster_endpoint_message :
  ?static_members:string_list ->
  ?excluded_members:string_list ->
  ?tags:tag_list ->
  db_cluster_identifier:string_ ->
  db_cluster_endpoint_identifier:string_ ->
  endpoint_type:string_ ->
  unit ->
  create_db_cluster_endpoint_message

val make_create_db_cluster_message :
  ?availability_zones:availability_zones ->
  ?backup_retention_period:integer_optional ->
  ?character_set_name:string_ ->
  ?database_name:string_ ->
  ?db_cluster_parameter_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_subnet_group_name:string_ ->
  ?engine_version:string_ ->
  ?port:integer_optional ->
  ?master_username:string_ ->
  ?master_user_password:sensitive_string ->
  ?option_group_name:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?replication_source_identifier:string_ ->
  ?tags:tag_list ->
  ?storage_encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?pre_signed_url:sensitive_string ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?backtrack_window:long_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?engine_mode:string_ ->
  ?scaling_configuration:scaling_configuration ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?db_cluster_instance_class:string_ ->
  ?allocated_storage:integer_optional ->
  ?storage_type:string_ ->
  ?iops:integer_optional ->
  ?publicly_accessible:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?enable_http_endpoint:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?domain_iam_role_name:string_ ->
  ?enable_global_write_forwarding:boolean_optional ->
  ?network_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?monitoring_interval:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?enable_limitless_database:boolean_optional ->
  ?cluster_scalability_type:cluster_scalability_type ->
  ?db_system_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?enable_local_write_forwarding:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?tag_specifications:tag_specification_list ->
  ?master_user_authentication_type:master_user_authentication_type ->
  ?with_express_configuration:boolean_optional ->
  db_cluster_identifier:string_ ->
  engine:string_ ->
  unit ->
  create_db_cluster_message

val make_create_custom_db_engine_version_message :
  ?database_installation_files_s3_bucket_name:bucket_name ->
  ?database_installation_files_s3_prefix:string255 ->
  ?database_installation_files:string_list ->
  ?image_id:string255 ->
  ?kms_key_id:kms_key_id_or_arn ->
  ?source_custom_db_engine_version_identifier:string255 ->
  ?use_aws_provided_latest_image:boolean_optional ->
  ?description:description ->
  ?manifest:custom_db_engine_version_manifest ->
  ?tags:tag_list ->
  engine:custom_engine_name ->
  engine_version:custom_engine_version ->
  unit ->
  create_custom_db_engine_version_message

val make_create_blue_green_deployment_response :
  ?blue_green_deployment:blue_green_deployment -> unit -> create_blue_green_deployment_response

val make_create_blue_green_deployment_request :
  ?target_engine_version:target_engine_version ->
  ?target_db_parameter_group_name:target_db_parameter_group_name ->
  ?target_db_cluster_parameter_group_name:target_db_cluster_parameter_group_name ->
  ?tags:tag_list ->
  ?target_db_instance_class:target_db_instance_class ->
  ?upgrade_target_storage_config:boolean_optional ->
  ?target_iops:integer_optional ->
  ?target_storage_type:target_storage_type ->
  ?target_allocated_storage:integer_optional ->
  ?target_storage_throughput:integer_optional ->
  blue_green_deployment_name:blue_green_deployment_name ->
  source:database_arn ->
  unit ->
  create_blue_green_deployment_request

val make_copy_option_group_message :
  ?tags:tag_list ->
  source_option_group_identifier:string_ ->
  target_option_group_identifier:string_ ->
  target_option_group_description:string_ ->
  unit ->
  copy_option_group_message

val make_copy_db_snapshot_message :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?copy_tags:boolean_optional ->
  ?pre_signed_url:sensitive_string ->
  ?option_group_name:string_ ->
  ?target_custom_availability_zone:string_ ->
  ?snapshot_target:string_ ->
  ?copy_option_group:boolean_optional ->
  ?snapshot_availability_zone:string_ ->
  source_db_snapshot_identifier:string_ ->
  target_db_snapshot_identifier:string_ ->
  unit ->
  copy_db_snapshot_message

val make_copy_db_parameter_group_message :
  ?tags:tag_list ->
  source_db_parameter_group_identifier:string_ ->
  target_db_parameter_group_identifier:string_ ->
  target_db_parameter_group_description:string_ ->
  unit ->
  copy_db_parameter_group_message

val make_copy_db_cluster_snapshot_message :
  ?kms_key_id:string_ ->
  ?pre_signed_url:sensitive_string ->
  ?copy_tags:boolean_optional ->
  ?tags:tag_list ->
  source_db_cluster_snapshot_identifier:string_ ->
  target_db_cluster_snapshot_identifier:string_ ->
  unit ->
  copy_db_cluster_snapshot_message

val make_copy_db_cluster_parameter_group_message :
  ?tags:tag_list ->
  source_db_cluster_parameter_group_identifier:string_ ->
  target_db_cluster_parameter_group_identifier:string_ ->
  target_db_cluster_parameter_group_description:string_ ->
  unit ->
  copy_db_cluster_parameter_group_message

val make_cancel_export_task_message :
  export_task_identifier:string_ -> unit -> cancel_export_task_message

val make_backtrack_db_cluster_message :
  ?force:boolean_optional ->
  ?use_earliest_time_on_point_in_time_unavailable:boolean_optional ->
  db_cluster_identifier:string_ ->
  backtrack_to:t_stamp ->
  unit ->
  backtrack_db_cluster_message

val make_authorize_db_security_group_ingress_message :
  ?cidri_p:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  db_security_group_name:string_ ->
  unit ->
  authorize_db_security_group_ingress_message

val make_apply_pending_maintenance_action_message :
  resource_identifier:string_ ->
  apply_action:string_ ->
  opt_in_type:string_ ->
  unit ->
  apply_pending_maintenance_action_message
