open Types

val make_vpc_security_group_membership :
  ?status:string_ -> ?vpc_security_group_id:string_ -> unit -> vpc_security_group_membership

val make_range : ?step:integer_optional -> ?to_:integer -> ?from_:integer -> unit -> range
val make_double_range : ?to_:double -> ?from_:double -> unit -> double_range

val make_valid_storage_options :
  ?supports_storage_autoscaling:boolean_ ->
  ?storage_throughput_to_iops_ratio:double_range_list ->
  ?provisioned_storage_throughput:range_list ->
  ?iops_to_storage_ratio:double_range_list ->
  ?provisioned_iops:range_list ->
  ?storage_size:range_list ->
  ?storage_type:string_ ->
  unit ->
  valid_storage_options

val make_valid_volume_options :
  ?storage:valid_storage_options_list -> ?volume_name:string_ -> unit -> valid_volume_options

val make_upgrade_target :
  ?supports_integrations:boolean_optional ->
  ?supports_local_write_forwarding:boolean_optional ->
  ?supports_limitless_database:boolean_optional ->
  ?supports_babelfish:boolean_optional ->
  ?supports_global_databases:boolean_optional ->
  ?supports_parallel_query:boolean_optional ->
  ?supported_engine_modes:engine_mode_list ->
  ?is_major_version_upgrade:boolean_ ->
  ?auto_upgrade:boolean_ ->
  ?description:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  upgrade_target

val make_available_processor_feature :
  ?allowed_values:string_ ->
  ?default_value:string_ ->
  ?name:string_ ->
  unit ->
  available_processor_feature

val make_valid_additional_storage_options :
  ?volumes:valid_volume_options_list ->
  ?supports_additional_storage_volumes:boolean_ ->
  unit ->
  valid_additional_storage_options

val make_valid_db_instance_modifications_message :
  ?additional_storage:valid_additional_storage_options ->
  ?supports_dedicated_log_volume:boolean_ ->
  ?valid_processor_features:available_processor_feature_list ->
  ?storage:valid_storage_options_list ->
  unit ->
  valid_db_instance_modifications_message

val make_user_auth_config :
  ?client_password_auth_type:client_password_auth_type ->
  ?iam_auth:iam_auth_mode ->
  ?secret_arn:arn ->
  ?auth_scheme:auth_scheme ->
  ?user_name:auth_user_name ->
  ?description:description ->
  unit ->
  user_auth_config

val make_user_auth_config_info :
  ?client_password_auth_type:client_password_auth_type ->
  ?iam_auth:iam_auth_mode ->
  ?secret_arn:string_ ->
  ?auth_scheme:auth_scheme ->
  ?user_name:string_ ->
  ?description:string_ ->
  unit ->
  user_auth_config_info

val make_timezone : ?timezone_name:string_ -> unit -> timezone

val make_tenant_database_pending_modified_values :
  ?tenant_db_name:string_ ->
  ?master_user_password:sensitive_string ->
  unit ->
  tenant_database_pending_modified_values

val make_master_user_secret :
  ?kms_key_id:string_ -> ?secret_status:string_ -> ?secret_arn:string_ -> unit -> master_user_secret

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag

val make_tenant_database :
  ?tag_list:tag_list ->
  ?master_user_secret:master_user_secret ->
  ?pending_modified_values:tenant_database_pending_modified_values ->
  ?deletion_protection:boolean_ ->
  ?nchar_character_set_name:string_ ->
  ?character_set_name:string_ ->
  ?tenant_database_ar_n:string_ ->
  ?tenant_database_resource_id:string_ ->
  ?dbi_resource_id:string_ ->
  ?master_username:string_ ->
  ?status:string_ ->
  ?tenant_db_name:string_ ->
  ?db_instance_identifier:string_ ->
  ?tenant_database_create_time:t_stamp ->
  unit ->
  tenant_database

val make_tenant_databases_message :
  ?tenant_databases:tenant_databases_list -> ?marker:string_ -> unit -> tenant_databases_message

val make_target_health :
  ?description:string_ ->
  ?reason:target_health_reason ->
  ?state:target_state ->
  unit ->
  target_health

val make_db_proxy_target :
  ?target_health:target_health ->
  ?role:target_role ->
  ?type_:target_type ->
  ?port:integer ->
  ?rds_resource_id:string_ ->
  ?tracked_cluster_id:string_ ->
  ?endpoint:string_ ->
  ?target_arn:string_ ->
  unit ->
  db_proxy_target

val make_connection_pool_configuration_info :
  ?init_query:operator_sensitive_string ->
  ?session_pinning_filters:string_list ->
  ?connection_borrow_timeout:integer ->
  ?max_idle_connections_percent:integer ->
  ?max_connections_percent:integer ->
  unit ->
  connection_pool_configuration_info

val make_db_proxy_target_group :
  ?updated_date:t_stamp ->
  ?created_date:t_stamp ->
  ?connection_pool_config:connection_pool_configuration_info ->
  ?status:string_ ->
  ?is_default:boolean_ ->
  ?target_group_arn:string_ ->
  ?target_group_name:string_ ->
  ?db_proxy_name:string_ ->
  unit ->
  db_proxy_target_group

val make_tag_specification : ?tags:tag_list -> ?resource_type:string_ -> unit -> tag_specification
val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message
val make_endpoint : ?hosted_zone_id:string_ -> ?port:integer -> ?address:string_ -> unit -> endpoint

val make_db_security_group_membership :
  ?status:string_ -> ?db_security_group_name:string_ -> unit -> db_security_group_membership

val make_db_parameter_group_status :
  ?parameter_apply_status:string_ ->
  ?db_parameter_group_name:string_ ->
  unit ->
  db_parameter_group_status

val make_availability_zone : ?name:string_ -> unit -> availability_zone
val make_outpost : ?arn:string_ -> unit -> outpost

val make_subnet :
  ?subnet_status:string_ ->
  ?subnet_outpost:outpost ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_db_subnet_group :
  ?supported_network_types:string_list ->
  ?db_subnet_group_arn:string_ ->
  ?subnets:subnet_list ->
  ?subnet_group_status:string_ ->
  ?vpc_id:string_ ->
  ?db_subnet_group_description:string_ ->
  ?db_subnet_group_name:string_ ->
  unit ->
  db_subnet_group

val make_pending_cloudwatch_logs_exports :
  ?log_types_to_disable:log_type_list ->
  ?log_types_to_enable:log_type_list ->
  unit ->
  pending_cloudwatch_logs_exports

val make_processor_feature : ?value:string_ -> ?name:string_ -> unit -> processor_feature

val make_additional_storage_volume :
  ?storage_type:string_ ->
  ?storage_throughput:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?iop_s:integer_optional ->
  ?allocated_storage:integer_optional ->
  volume_name:string_ ->
  unit ->
  additional_storage_volume

val make_pending_modified_values :
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?engine:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?multi_tenant:boolean_optional ->
  ?resume_full_automation_mode_time:t_stamp ->
  ?automation_mode:automation_mode ->
  ?processor_features:processor_feature_list ->
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  ?db_subnet_group_name:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?storage_type:string_ ->
  ?db_instance_identifier:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?backup_retention_period:integer_optional ->
  ?port:integer_optional ->
  ?master_user_password:sensitive_string ->
  ?allocated_storage:integer_optional ->
  ?db_instance_class:string_ ->
  unit ->
  pending_modified_values

val make_option_group_membership :
  ?status:string_ -> ?option_group_name:string_ -> unit -> option_group_membership

val make_db_instance_status_info :
  ?message:string_ ->
  ?status:string_ ->
  ?normal:boolean_ ->
  ?status_type:string_ ->
  unit ->
  db_instance_status_info

val make_domain_membership :
  ?dns_ips:string_list ->
  ?auth_secret_arn:string_ ->
  ?o_u:string_ ->
  ?iam_role_name:string_ ->
  ?fqd_n:string_ ->
  ?status:string_ ->
  ?domain:string_ ->
  unit ->
  domain_membership

val make_db_instance_role :
  ?status:string_ -> ?feature_name:string_ -> ?role_arn:string_ -> unit -> db_instance_role

val make_db_instance_automated_backups_replication :
  ?db_instance_automated_backups_arn:string_ -> unit -> db_instance_automated_backups_replication

val make_certificate_details :
  ?valid_till:t_stamp -> ?ca_identifier:string_ -> unit -> certificate_details

val make_additional_storage_volume_output :
  ?storage_type:string_ ->
  ?storage_throughput:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?iop_s:integer_optional ->
  ?allocated_storage:integer ->
  ?storage_volume_status:string_ ->
  ?volume_name:string_ ->
  unit ->
  additional_storage_volume_output

val make_db_instance :
  ?storage_volume_status:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_output_list ->
  ?engine_lifecycle_support:string_ ->
  ?is_storage_config_upgrade_available:boolean_optional ->
  ?dedicated_log_volume:boolean_ ->
  ?multi_tenant:boolean_optional ->
  ?percent_progress:string_ ->
  ?read_replica_source_db_cluster_identifier:string_ ->
  ?master_user_secret:master_user_secret ->
  ?db_system_id:string_ ->
  ?certificate_details:certificate_details ->
  ?activity_stream_policy_status:activity_stream_policy_status ->
  ?custom_iam_instance_profile:string_ ->
  ?automatic_restart_time:t_stamp ->
  ?backup_target:string_ ->
  ?db_instance_automated_backups_replications:db_instance_automated_backups_replication_list ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?activity_stream_engine_native_audit_fields_included:boolean_optional ->
  ?activity_stream_mode:activity_stream_mode ->
  ?activity_stream_kinesis_stream_name:string_ ->
  ?activity_stream_kms_key_id:string_ ->
  ?activity_stream_status:activity_stream_status ->
  ?network_type:string_ ->
  ?customer_owned_ip_enabled:boolean_optional ->
  ?resume_full_automation_mode_time:t_stamp ->
  ?automation_mode:automation_mode ->
  ?tag_list:tag_list ->
  ?max_allocated_storage:integer_optional ->
  ?listener_endpoint:endpoint ->
  ?associated_roles:db_instance_roles ->
  ?deletion_protection:boolean_ ->
  ?processor_features:processor_feature_list ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_enabled:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?timezone:string_ ->
  ?db_instance_arn:string_ ->
  ?promotion_tier:integer_optional ->
  ?monitoring_role_arn:string_ ->
  ?enhanced_monitoring_resource_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_ ->
  ?domain_memberships:domain_membership_list ->
  ?ca_certificate_identifier:string_ ->
  ?dbi_resource_id:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?db_cluster_identifier:string_ ->
  ?db_instance_port:integer ->
  ?tde_credential_arn:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_type:string_ ->
  ?status_infos:db_instance_status_info_list ->
  ?publicly_accessible:boolean_ ->
  ?secondary_availability_zone:string_ ->
  ?nchar_character_set_name:string_ ->
  ?character_set_name:string_ ->
  ?option_group_memberships:option_group_membership_list ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?replica_mode:replica_mode ->
  ?read_replica_db_cluster_identifiers:read_replica_db_cluster_identifier_list ->
  ?read_replica_db_instance_identifiers:read_replica_db_instance_identifier_list ->
  ?read_replica_source_db_instance_identifier:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_ ->
  ?latest_restorable_time:t_stamp ->
  ?pending_modified_values:pending_modified_values ->
  ?upgrade_rollout_order:upgrade_rollout_order ->
  ?preferred_maintenance_window:string_ ->
  ?db_subnet_group:db_subnet_group ->
  ?availability_zone:string_ ->
  ?db_parameter_groups:db_parameter_group_status_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?db_security_groups:db_security_group_membership_list ->
  ?backup_retention_period:integer ->
  ?preferred_backup_window:string_ ->
  ?instance_create_time:t_stamp ->
  ?allocated_storage:integer ->
  ?endpoint:endpoint ->
  ?db_name:string_ ->
  ?master_username:string_ ->
  ?db_instance_status:string_ ->
  ?engine:string_ ->
  ?db_instance_class:string_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  db_instance

val make_switchover_read_replica_message :
  db_instance_identifier:string_ -> unit -> switchover_read_replica_message

val make_global_cluster_member :
  ?synchronization_status:global_cluster_member_synchronization_status ->
  ?global_write_forwarding_status:write_forwarding_status ->
  ?is_writer:boolean_ ->
  ?readers:readers_arn_list ->
  ?db_cluster_arn:string_ ->
  unit ->
  global_cluster_member

val make_failover_state :
  ?is_data_loss_allowed:boolean_ ->
  ?to_db_cluster_arn:string_ ->
  ?from_db_cluster_arn:string_ ->
  ?status:failover_status ->
  unit ->
  failover_state

val make_global_cluster :
  ?tag_list:tag_list ->
  ?failover_state:failover_state ->
  ?endpoint:string_ ->
  ?global_cluster_members:global_cluster_member_list ->
  ?deletion_protection:boolean_optional ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_encrypted:boolean_optional ->
  ?database_name:string_ ->
  ?engine_lifecycle_support:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?status:string_ ->
  ?global_cluster_arn:string_ ->
  ?global_cluster_resource_id:string_ ->
  ?global_cluster_identifier:global_cluster_identifier ->
  unit ->
  global_cluster

val make_switchover_global_cluster_message :
  target_db_cluster_identifier:db_cluster_identifier ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  switchover_global_cluster_message

val make_switchover_detail :
  ?status:switchover_detail_status ->
  ?target_member:database_arn ->
  ?source_member:database_arn ->
  unit ->
  switchover_detail

val make_blue_green_deployment_task :
  ?status:blue_green_deployment_task_status ->
  ?name:blue_green_deployment_task_name ->
  unit ->
  blue_green_deployment_task

val make_blue_green_deployment :
  ?tag_list:tag_list ->
  ?delete_time:t_stamp ->
  ?create_time:t_stamp ->
  ?status_details:blue_green_deployment_status_details ->
  ?status:blue_green_deployment_status ->
  ?tasks:blue_green_deployment_task_list ->
  ?switchover_details:switchover_detail_list ->
  ?target:database_arn ->
  ?source:database_arn ->
  ?blue_green_deployment_name:blue_green_deployment_name ->
  ?blue_green_deployment_identifier:blue_green_deployment_identifier ->
  unit ->
  blue_green_deployment

val make_switchover_blue_green_deployment_response :
  ?blue_green_deployment:blue_green_deployment -> unit -> switchover_blue_green_deployment_response

val make_switchover_blue_green_deployment_request :
  ?switchover_timeout:switchover_timeout ->
  blue_green_deployment_identifier:blue_green_deployment_identifier ->
  unit ->
  switchover_blue_green_deployment_request

val make_supported_engine_lifecycle :
  lifecycle_support_end_date:t_stamp ->
  lifecycle_support_start_date:t_stamp ->
  lifecycle_support_name:lifecycle_support_name ->
  unit ->
  supported_engine_lifecycle

val make_character_set :
  ?character_set_description:string_ -> ?character_set_name:string_ -> unit -> character_set

val make_stop_db_instance_message :
  ?db_snapshot_identifier:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  stop_db_instance_message

val make_restore_window : ?latest_time:t_stamp -> ?earliest_time:t_stamp -> unit -> restore_window

val make_db_instance_automated_backup :
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?dedicated_log_volume:boolean_optional ->
  ?tag_list:tag_list ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?multi_tenant:boolean_optional ->
  ?backup_target:string_ ->
  ?db_instance_automated_backups_replications:db_instance_automated_backups_replication_list ->
  ?db_instance_automated_backups_arn:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?timezone:string_ ->
  ?kms_key_id:string_ ->
  ?storage_type:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?encrypted:boolean_ ->
  ?tde_credential_arn:string_ ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?master_username:string_ ->
  ?instance_create_time:t_stamp ->
  ?vpc_id:string_ ->
  ?availability_zone:string_ ->
  ?port:integer ->
  ?status:string_ ->
  ?allocated_storage:integer ->
  ?restore_window:restore_window ->
  ?db_instance_identifier:string_ ->
  ?region:string_ ->
  ?dbi_resource_id:string_ ->
  ?db_instance_arn:string_ ->
  unit ->
  db_instance_automated_backup

val make_stop_db_instance_automated_backups_replication_message :
  source_db_instance_arn:string_ -> unit -> stop_db_instance_automated_backups_replication_message

val make_db_cluster_option_group_status :
  ?status:string_ -> ?db_cluster_option_group_name:string_ -> unit -> db_cluster_option_group_status

val make_db_cluster_status_info :
  ?message:string_ ->
  ?status:string_ ->
  ?normal:boolean_ ->
  ?status_type:string_ ->
  unit ->
  db_cluster_status_info

val make_db_cluster_member :
  ?promotion_tier:integer_optional ->
  ?db_cluster_parameter_group_status:string_ ->
  ?is_cluster_writer:boolean_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  db_cluster_member

val make_db_cluster_role :
  ?feature_name:string_ -> ?status:string_ -> ?role_arn:string_ -> unit -> db_cluster_role

val make_rds_custom_cluster_configuration :
  ?replica_mode:replica_mode ->
  ?transit_gateway_multicast_domain_id:string_ ->
  ?interconnect_subnet_id:string_ ->
  unit ->
  rds_custom_cluster_configuration

val make_cluster_pending_modified_values :
  ?certificate_details:certificate_details ->
  ?iops:integer_optional ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?allocated_storage:integer_optional ->
  ?storage_type:string_ ->
  ?backup_retention_period:integer_optional ->
  ?engine_version:string_ ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?master_user_password:sensitive_string ->
  ?db_cluster_identifier:string_ ->
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  unit ->
  cluster_pending_modified_values

val make_scaling_configuration_info :
  ?seconds_before_timeout:integer_optional ->
  ?timeout_action:string_ ->
  ?seconds_until_auto_pause:integer_optional ->
  ?auto_pause:boolean_optional ->
  ?max_capacity:integer_optional ->
  ?min_capacity:integer_optional ->
  unit ->
  scaling_configuration_info

val make_serverless_v2_scaling_configuration_info :
  ?seconds_until_auto_pause:integer_optional ->
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration_info

val make_limitless_database :
  ?min_required_ac_u:double_optional ->
  ?status:limitless_database_status ->
  unit ->
  limitless_database

val make_db_cluster :
  ?internet_access_gateway_enabled:boolean_optional ->
  ?vpc_networking_enabled:boolean_optional ->
  ?engine_lifecycle_support:string_ ->
  ?certificate_details:certificate_details ->
  ?cluster_scalability_type:cluster_scalability_type ->
  ?limitless_database:limitless_database ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?local_write_forwarding_status:local_write_forwarding_status ->
  ?master_user_secret:master_user_secret ->
  ?db_system_id:string_ ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_enabled:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?serverless_v2_platform_version:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration_info ->
  ?automatic_restart_time:t_stamp ->
  ?network_type:string_ ->
  ?global_write_forwarding_requested:boolean_optional ->
  ?global_write_forwarding_status:write_forwarding_status ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?tag_list:tag_list ->
  ?domain_memberships:domain_membership_list ->
  ?cross_account_clone:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?activity_stream_kinesis_stream_name:string_ ->
  ?activity_stream_kms_key_id:string_ ->
  ?activity_stream_status:activity_stream_status ->
  ?activity_stream_mode:activity_stream_mode ->
  ?http_endpoint_enabled:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?publicly_accessible:boolean_optional ->
  ?io_optimized_next_allowed_modification_time:t_stamp ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?storage_type:string_ ->
  ?db_cluster_instance_class:string_ ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?scaling_configuration_info:scaling_configuration_info ->
  ?engine_mode:string_ ->
  ?pending_modified_values:cluster_pending_modified_values ->
  ?capacity:integer_optional ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?backtrack_consumed_change_records:long_optional ->
  ?backtrack_window:long_optional ->
  ?earliest_backtrack_time:t_stamp ->
  ?cluster_create_time:t_stamp ->
  ?clone_group_id:string_ ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?associated_roles:db_cluster_roles ->
  ?db_cluster_arn:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_encrypted:boolean_ ->
  ?hosted_zone_id:string_ ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?db_cluster_members:db_cluster_member_list ->
  ?status_infos:db_cluster_status_info_list ->
  ?read_replica_identifiers:read_replica_identifier_list ->
  ?replication_source_identifier:string_ ->
  ?upgrade_rollout_order:upgrade_rollout_order ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?db_cluster_option_group_memberships:db_cluster_option_group_memberships ->
  ?master_username:string_ ->
  ?port:integer_optional ->
  ?latest_restorable_time:t_stamp ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?multi_a_z:boolean_optional ->
  ?custom_endpoints:string_list ->
  ?reader_endpoint:string_ ->
  ?endpoint:string_ ->
  ?earliest_restorable_time:t_stamp ->
  ?percent_progress:string_ ->
  ?status:string_ ->
  ?db_subnet_group:string_ ->
  ?db_cluster_parameter_group:string_ ->
  ?db_cluster_identifier:string_ ->
  ?database_name:string_ ->
  ?character_set_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
  ?allocated_storage:integer_optional ->
  unit ->
  db_cluster

val make_stop_db_cluster_message : db_cluster_identifier:string_ -> unit -> stop_db_cluster_message

val make_stop_activity_stream_response :
  ?status:activity_stream_status ->
  ?kinesis_stream_name:string_ ->
  ?kms_key_id:string_ ->
  unit ->
  stop_activity_stream_response

val make_stop_activity_stream_request :
  ?apply_immediately:boolean_optional ->
  resource_arn:string_ ->
  unit ->
  stop_activity_stream_request

val make_start_export_task_message :
  ?export_only:string_list ->
  ?s3_prefix:string_ ->
  kms_key_id:string_ ->
  iam_role_arn:string_ ->
  s3_bucket_name:string_ ->
  source_arn:string_ ->
  export_task_identifier:string_ ->
  unit ->
  start_export_task_message

val make_export_task :
  ?source_type:export_source_type ->
  ?warning_message:string_ ->
  ?failure_cause:string_ ->
  ?total_extracted_data_in_g_b:integer ->
  ?percent_progress:integer ->
  ?status:string_ ->
  ?kms_key_id:string_ ->
  ?iam_role_arn:string_ ->
  ?s3_prefix:string_ ->
  ?s3_bucket:string_ ->
  ?task_end_time:t_stamp ->
  ?task_start_time:t_stamp ->
  ?snapshot_time:t_stamp ->
  ?export_only:string_list ->
  ?source_arn:string_ ->
  ?export_task_identifier:string_ ->
  unit ->
  export_task

val make_start_db_instance_message :
  db_instance_identifier:string_ -> unit -> start_db_instance_message

val make_start_db_instance_automated_backups_replication_message :
  ?tags:tag_list ->
  ?pre_signed_url:sensitive_string ->
  ?kms_key_id:string_ ->
  ?backup_retention_period:integer_optional ->
  source_db_instance_arn:string_ ->
  unit ->
  start_db_instance_automated_backups_replication_message

val make_start_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> start_db_cluster_message

val make_start_activity_stream_response :
  ?apply_immediately:boolean_ ->
  ?engine_native_audit_fields_included:boolean_optional ->
  ?mode:activity_stream_mode ->
  ?status:activity_stream_status ->
  ?kinesis_stream_name:string_ ->
  ?kms_key_id:string_ ->
  unit ->
  start_activity_stream_response

val make_start_activity_stream_request :
  ?engine_native_audit_fields_included:boolean_optional ->
  ?apply_immediately:boolean_optional ->
  kms_key_id:string_ ->
  mode:activity_stream_mode ->
  resource_arn:string_ ->
  unit ->
  start_activity_stream_request

val make_source_region :
  ?supports_db_instance_automated_backups_replication:boolean_ ->
  ?status:string_ ->
  ?endpoint:string_ ->
  ?region_name:string_ ->
  unit ->
  source_region

val make_source_region_message :
  ?source_regions:source_region_list -> ?marker:string_ -> unit -> source_region_message

val make_serverless_v2_scaling_configuration :
  ?seconds_until_auto_pause:integer_optional ->
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration

val make_serverless_v2_features_support :
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_features_support

val make_serverless_v2_platform_version_info :
  ?is_default:boolean_ ->
  ?status:string_ ->
  ?serverless_v2_features_support:serverless_v2_features_support ->
  ?engine:string_ ->
  ?serverless_v2_platform_version_description:string_ ->
  ?serverless_v2_platform_version:string_ ->
  unit ->
  serverless_v2_platform_version_info

val make_serverless_v2_platform_versions_message :
  ?serverless_v2_platform_versions:serverless_v2_platform_version_list ->
  ?marker:string_ ->
  unit ->
  serverless_v2_platform_versions_message

val make_scaling_configuration :
  ?seconds_before_timeout:integer_optional ->
  ?timeout_action:string_ ->
  ?seconds_until_auto_pause:integer_optional ->
  ?auto_pause:boolean_optional ->
  ?max_capacity:integer_optional ->
  ?min_capacity:integer_optional ->
  unit ->
  scaling_configuration

val make_scalar_reference_details : ?value:double -> unit -> scalar_reference_details

val make_ec2_security_group :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?status:string_ ->
  unit ->
  ec2_security_group

val make_ip_range : ?cidri_p:string_ -> ?status:string_ -> unit -> ip_range

val make_db_security_group :
  ?db_security_group_arn:string_ ->
  ?ip_ranges:ip_range_list ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?vpc_id:string_ ->
  ?db_security_group_description:string_ ->
  ?db_security_group_name:string_ ->
  ?owner_id:string_ ->
  unit ->
  db_security_group

val make_revoke_db_security_group_ingress_message :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?cidri_p:string_ ->
  db_security_group_name:string_ ->
  unit ->
  revoke_db_security_group_ingress_message

val make_restore_db_instance_to_point_in_time_message :
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?engine_lifecycle_support:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?allocated_storage:integer_optional ->
  ?custom_iam_instance_profile:string_ ->
  ?backup_target:string_ ->
  ?source_db_instance_automated_backups_arn:string_ ->
  ?network_type:string_ ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?source_dbi_resource_id:string_ ->
  ?deletion_protection:boolean_optional ->
  ?db_parameter_group_name:string_ ->
  ?use_default_processor_features:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?domain_dns_ips:string_list ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_ou:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?tags:tag_list ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?engine:string_ ->
  ?db_name:string_ ->
  ?license_model:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?multi_a_z:boolean_optional ->
  ?db_subnet_group_name:string_ ->
  ?availability_zone:string_ ->
  ?port:integer_optional ->
  ?db_instance_class:string_ ->
  ?use_latest_restorable_time:boolean_ ->
  ?restore_time:t_stamp ->
  ?source_db_instance_identifier:string_ ->
  target_db_instance_identifier:string_ ->
  unit ->
  restore_db_instance_to_point_in_time_message

val make_restore_db_instance_from_s3_message :
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?engine_lifecycle_support:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?network_type:string_ ->
  ?max_allocated_storage:integer_optional ->
  ?deletion_protection:boolean_optional ->
  ?use_default_processor_features:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?s3_prefix:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?storage_type:string_ ->
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?port:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?db_parameter_group_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?db_subnet_group_name:string_ ->
  ?availability_zone:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_security_groups:db_security_group_name_list ->
  ?master_user_password:sensitive_string ->
  ?master_username:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_name:string_ ->
  s3_ingestion_role_arn:string_ ->
  s3_bucket_name:string_ ->
  source_engine_version:string_ ->
  source_engine:string_ ->
  engine:string_ ->
  db_instance_class:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  restore_db_instance_from_s3_message

val make_restore_db_instance_from_db_snapshot_message :
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?engine_lifecycle_support:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?allocated_storage:integer_optional ->
  ?custom_iam_instance_profile:string_ ->
  ?backup_target:string_ ->
  ?network_type:string_ ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?db_parameter_group_name:string_ ->
  ?use_default_processor_features:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?domain_iam_role_name:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain_dns_ips:string_list ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_ou:string_ ->
  ?domain_fqdn:string_ ->
  ?domain:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?tags:tag_list ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?engine:string_ ->
  ?db_name:string_ ->
  ?license_model:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?multi_a_z:boolean_optional ->
  ?db_subnet_group_name:string_ ->
  ?availability_zone:string_ ->
  ?port:integer_optional ->
  ?db_instance_class:string_ ->
  ?db_snapshot_identifier:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  restore_db_instance_from_db_snapshot_message

val make_restore_db_cluster_to_point_in_time_message :
  ?enable_internet_access_gateway:boolean_optional ->
  ?enable_vpc_networking:boolean_optional ->
  ?tag_specifications:tag_specification_list ->
  ?engine_lifecycle_support:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?engine_mode:string_ ->
  ?scaling_configuration:scaling_configuration ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?source_db_cluster_resource_id:string_ ->
  ?network_type:string_ ->
  ?iops:integer_optional ->
  ?publicly_accessible:boolean_optional ->
  ?storage_type:string_ ->
  ?db_cluster_instance_class:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?backtrack_window:long_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?option_group_name:string_ ->
  ?db_subnet_group_name:string_ ->
  ?port:integer_optional ->
  ?use_latest_restorable_time:boolean_ ->
  ?restore_to_time:t_stamp ->
  ?source_db_cluster_identifier:string_ ->
  ?restore_type:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_to_point_in_time_message

val make_restore_db_cluster_from_snapshot_message :
  ?enable_internet_access_gateway:boolean_optional ->
  ?enable_vpc_networking:boolean_optional ->
  ?tag_specifications:tag_specification_list ->
  ?engine_lifecycle_support:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?network_type:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?iops:integer_optional ->
  ?storage_type:string_ ->
  ?db_cluster_instance_class:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?scaling_configuration:scaling_configuration ->
  ?engine_mode:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?backtrack_window:long_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?option_group_name:string_ ->
  ?database_name:string_ ->
  ?db_subnet_group_name:string_ ->
  ?port:integer_optional ->
  ?engine_version:string_ ->
  ?availability_zones:availability_zones ->
  engine:string_ ->
  snapshot_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_from_snapshot_message

val make_restore_db_cluster_from_s3_message :
  ?tag_specifications:tag_specification_list ->
  ?engine_lifecycle_support:string_ ->
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?backtrack_window:long_optional ->
  ?s3_prefix:string_ ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?option_group_name:string_ ->
  ?master_user_password:sensitive_string ->
  ?port:integer_optional ->
  ?engine_version:string_ ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?database_name:string_ ->
  ?character_set_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
  s3_ingestion_role_arn:string_ ->
  s3_bucket_name:string_ ->
  source_engine_version:string_ ->
  source_engine:string_ ->
  master_username:string_ ->
  engine:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_from_s3_message

val make_pending_maintenance_action :
  ?description:string_ ->
  ?current_apply_date:t_stamp ->
  ?opt_in_status:string_ ->
  ?forced_apply_date:t_stamp ->
  ?auto_applied_after_date:t_stamp ->
  ?action:string_ ->
  unit ->
  pending_maintenance_action

val make_resource_pending_maintenance_actions :
  ?pending_maintenance_action_details:pending_maintenance_action_details ->
  ?resource_identifier:string_ ->
  unit ->
  resource_pending_maintenance_actions

val make_parameter :
  ?supported_engine_modes:engine_mode_list ->
  ?apply_method:apply_method ->
  ?minimum_engine_version:string_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?apply_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?parameter_value:potentially_sensitive_parameter_value ->
  ?parameter_name:string_ ->
  unit ->
  parameter

val make_reset_db_parameter_group_message :
  ?parameters:parameters_list ->
  ?reset_all_parameters:boolean_ ->
  db_parameter_group_name:string_ ->
  unit ->
  reset_db_parameter_group_message

val make_db_parameter_group_name_message :
  ?db_parameter_group_name:string_ -> unit -> db_parameter_group_name_message

val make_reset_db_cluster_parameter_group_message :
  ?parameters:parameters_list ->
  ?reset_all_parameters:boolean_ ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  reset_db_cluster_parameter_group_message

val make_db_cluster_parameter_group_name_message :
  ?db_cluster_parameter_group_name:string_ -> unit -> db_cluster_parameter_group_name_message

val make_recurring_charge :
  ?recurring_charge_frequency:string_ -> ?recurring_charge_amount:double -> unit -> recurring_charge

val make_reserved_db_instances_offering :
  ?recurring_charges:recurring_charge_list ->
  ?multi_a_z:boolean_ ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?currency_code:string_ ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?db_instance_class:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  unit ->
  reserved_db_instances_offering

val make_reserved_db_instances_offering_message :
  ?reserved_db_instances_offerings:reserved_db_instances_offering_list ->
  ?marker:string_ ->
  unit ->
  reserved_db_instances_offering_message

val make_reserved_db_instance :
  ?lease_id:string_ ->
  ?reserved_db_instance_arn:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?state:string_ ->
  ?multi_a_z:boolean_ ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?db_instance_count:integer ->
  ?currency_code:string_ ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?start_time:t_stamp ->
  ?db_instance_class:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  ?reserved_db_instance_id:string_ ->
  unit ->
  reserved_db_instance

val make_reserved_db_instance_message :
  ?reserved_db_instances:reserved_db_instance_list ->
  ?marker:string_ ->
  unit ->
  reserved_db_instance_message

val make_remove_tags_from_resource_message :
  tag_keys:key_list -> resource_name:string_ -> unit -> remove_tags_from_resource_message

val make_event_subscription :
  ?event_subscription_arn:string_ ->
  ?enabled:boolean_ ->
  ?event_categories_list:event_categories_list ->
  ?source_ids_list:source_ids_list ->
  ?source_type:string_ ->
  ?subscription_creation_time:string_ ->
  ?status:string_ ->
  ?sns_topic_arn:string_ ->
  ?cust_subscription_id:string_ ->
  ?customer_aws_id:string_ ->
  unit ->
  event_subscription

val make_remove_source_identifier_from_subscription_message :
  source_identifier:string_ ->
  subscription_name:string_ ->
  unit ->
  remove_source_identifier_from_subscription_message

val make_remove_role_from_db_instance_message :
  feature_name:string_ ->
  role_arn:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  remove_role_from_db_instance_message

val make_remove_role_from_db_cluster_message :
  ?feature_name:string_ ->
  role_arn:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  remove_role_from_db_cluster_message

val make_remove_from_global_cluster_message :
  db_cluster_identifier:string_ ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  remove_from_global_cluster_message

val make_register_db_proxy_targets_response :
  ?db_proxy_targets:target_list -> unit -> register_db_proxy_targets_response

val make_register_db_proxy_targets_request :
  ?db_cluster_identifiers:string_list ->
  ?db_instance_identifiers:string_list ->
  ?target_group_name:db_proxy_target_group_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  register_db_proxy_targets_request

val make_reference_details :
  ?scalar_reference_details:scalar_reference_details -> unit -> reference_details

val make_recommended_action_update :
  status:string_ -> action_id:string_ -> unit -> recommended_action_update

val make_recommended_action_parameter :
  ?value:string_ -> ?key:string_ -> unit -> recommended_action_parameter

val make_metric_reference :
  ?reference_details:reference_details -> ?name:string_ -> unit -> metric_reference

val make_performance_insights_metric_dimension_group :
  ?limit:integer ->
  ?group:string_ ->
  ?dimensions:string_list ->
  unit ->
  performance_insights_metric_dimension_group

val make_performance_insights_metric_query :
  ?metric:string_ ->
  ?group_by:performance_insights_metric_dimension_group ->
  unit ->
  performance_insights_metric_query

val make_metric_query :
  ?performance_insights_metric_query:performance_insights_metric_query -> unit -> metric_query

val make_metric :
  ?metric_query:metric_query ->
  ?statistics_details:string_ ->
  ?references:metric_reference_list ->
  ?name:string_ ->
  unit ->
  metric

val make_performance_issue_details :
  ?analysis:string_ ->
  ?metrics:metric_list ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  unit ->
  performance_issue_details

val make_issue_details :
  ?performance_issue_details:performance_issue_details -> unit -> issue_details

val make_context_attribute : ?value:string_ -> ?key:string_ -> unit -> context_attribute

val make_recommended_action :
  ?context_attributes:context_attribute_list ->
  ?issue_details:issue_details ->
  ?status:string_ ->
  ?apply_modes:string_list ->
  ?parameters:recommended_action_parameter_list ->
  ?operation:string_ ->
  ?description:string_ ->
  ?title:string_ ->
  ?action_id:string_ ->
  unit ->
  recommended_action

val make_reboot_db_shard_group_message :
  db_shard_group_identifier:db_shard_group_identifier -> unit -> reboot_db_shard_group_message

val make_db_shard_group :
  ?tag_list:tag_list ->
  ?db_shard_group_arn:string_ ->
  ?endpoint:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?status:string_ ->
  ?compute_redundancy:integer_optional ->
  ?min_ac_u:double_optional ->
  ?max_ac_u:double_optional ->
  ?db_cluster_identifier:string_ ->
  ?db_shard_group_identifier:db_shard_group_identifier ->
  ?db_shard_group_resource_id:string_ ->
  unit ->
  db_shard_group

val make_reboot_db_instance_message :
  ?force_failover:boolean_optional ->
  db_instance_identifier:string_ ->
  unit ->
  reboot_db_instance_message

val make_reboot_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> reboot_db_cluster_message

val make_purchase_reserved_db_instances_offering_message :
  ?tags:tag_list ->
  ?db_instance_count:integer_optional ->
  ?reserved_db_instance_id:string_ ->
  reserved_db_instances_offering_id:string_ ->
  unit ->
  purchase_reserved_db_instances_offering_message

val make_promote_read_replica_message :
  ?tag_specifications:tag_specification_list ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  db_instance_identifier:string_ ->
  unit ->
  promote_read_replica_message

val make_promote_read_replica_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> promote_read_replica_db_cluster_message

val make_pending_maintenance_actions_message :
  ?marker:string_ ->
  ?pending_maintenance_actions:pending_maintenance_actions ->
  unit ->
  pending_maintenance_actions_message

val make_available_additional_storage_volumes_option :
  ?max_storage_throughput:integer_optional ->
  ?min_storage_throughput:integer_optional ->
  ?max_iops_per_gib:double_optional ->
  ?min_iops_per_gib:double_optional ->
  ?max_iops:integer_optional ->
  ?min_iops:integer_optional ->
  ?max_storage_size:integer_optional ->
  ?min_storage_size:integer_optional ->
  ?storage_type:string_ ->
  ?supports_iops:boolean_ ->
  ?supports_storage_throughput:boolean_ ->
  ?supports_storage_autoscaling:boolean_ ->
  unit ->
  available_additional_storage_volumes_option

val make_orderable_db_instance_option :
  ?available_additional_storage_volumes_options:available_additional_storage_volumes_option_list ->
  ?supports_http_endpoint:boolean_ ->
  ?supports_additional_storage_volumes:boolean_optional ->
  ?supports_dedicated_log_volume:boolean_ ->
  ?supports_clusters:boolean_ ->
  ?supported_network_types:string_list ->
  ?supports_global_databases:boolean_ ->
  ?supported_activity_stream_modes:activity_stream_mode_list ->
  ?outpost_capable:boolean_ ->
  ?supports_kerberos_authentication:boolean_optional ->
  ?supports_storage_autoscaling:boolean_optional ->
  ?supported_engine_modes:engine_mode_list ->
  ?available_processor_features:available_processor_feature_list ->
  ?max_storage_throughput_per_iops:double_optional ->
  ?min_storage_throughput_per_iops:double_optional ->
  ?max_storage_throughput_per_db_instance:integer_optional ->
  ?min_storage_throughput_per_db_instance:integer_optional ->
  ?max_iops_per_gib:double_optional ->
  ?min_iops_per_gib:double_optional ->
  ?max_iops_per_db_instance:integer_optional ->
  ?min_iops_per_db_instance:integer_optional ->
  ?max_storage_size:integer_optional ->
  ?min_storage_size:integer_optional ->
  ?supports_performance_insights:boolean_ ->
  ?supports_iam_database_authentication:boolean_ ->
  ?supports_enhanced_monitoring:boolean_ ->
  ?supports_storage_throughput:boolean_ ->
  ?supports_iops:boolean_ ->
  ?storage_type:string_ ->
  ?supports_storage_encryption:boolean_ ->
  ?vpc:boolean_ ->
  ?read_replica_capable:boolean_ ->
  ?multi_az_capable:boolean_ ->
  ?availability_zones:availability_zone_list ->
  ?availability_zone_group:string_ ->
  ?license_model:string_ ->
  ?db_instance_class:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  orderable_db_instance_option

val make_orderable_db_instance_options_message :
  ?marker:string_ ->
  ?orderable_db_instance_options:orderable_db_instance_options_list ->
  unit ->
  orderable_db_instance_options_message

val make_option_setting :
  ?is_collection:boolean_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?apply_type:string_ ->
  ?description:string_ ->
  ?default_value:string_ ->
  ?value:potentially_sensitive_option_setting_value ->
  ?name:string_ ->
  unit ->
  option_setting

val make_option_ :
  ?vpc_security_group_memberships:vpc_security_group_membership_list ->
  ?db_security_group_memberships:db_security_group_membership_list ->
  ?option_settings:option_setting_configuration_list ->
  ?option_version:string_ ->
  ?port:integer_optional ->
  ?permanent:boolean_ ->
  ?persistent:boolean_ ->
  ?option_description:string_ ->
  ?option_name:string_ ->
  unit ->
  option_

val make_option_version : ?is_default:boolean_ -> ?version:string_ -> unit -> option_version

val make_option_group :
  ?copy_timestamp:t_stamp ->
  ?source_account_id:string_ ->
  ?source_option_group:string_ ->
  ?option_group_arn:string_ ->
  ?vpc_id:string_ ->
  ?allows_vpc_and_non_vpc_instance_memberships:boolean_ ->
  ?options:options_list ->
  ?major_engine_version:string_ ->
  ?engine_name:string_ ->
  ?option_group_description:string_ ->
  ?option_group_name:string_ ->
  unit ->
  option_group

val make_option_groups :
  ?marker:string_ -> ?option_groups_list:option_groups_list -> unit -> option_groups

val make_minimum_engine_version_per_allowed_value :
  ?minimum_engine_version:string_ ->
  ?allowed_value:string_ ->
  unit ->
  minimum_engine_version_per_allowed_value

val make_option_group_option_setting :
  ?minimum_engine_version_per_allowed_value:minimum_engine_version_per_allowed_value_list ->
  ?is_required:boolean_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?apply_type:string_ ->
  ?default_value:string_ ->
  ?setting_description:string_ ->
  ?setting_name:string_ ->
  unit ->
  option_group_option_setting

val make_option_group_option :
  ?copyable_cross_account:boolean_optional ->
  ?option_group_option_versions:option_group_option_versions_list ->
  ?option_group_option_settings:option_group_option_settings_list ->
  ?supports_option_version_downgrade:boolean_optional ->
  ?vpc_only:boolean_ ->
  ?requires_auto_minor_engine_version_upgrade:boolean_ ->
  ?permanent:boolean_ ->
  ?persistent:boolean_ ->
  ?options_conflicts_with:options_conflicts_with ->
  ?options_depended_on:options_depended_on ->
  ?default_port:integer_optional ->
  ?port_required:boolean_ ->
  ?minimum_required_minor_engine_version:string_ ->
  ?major_engine_version:string_ ->
  ?engine_name:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  unit ->
  option_group_option

val make_option_group_options_message :
  ?marker:string_ ->
  ?option_group_options:option_group_options_list ->
  unit ->
  option_group_options_message

val make_option_configuration :
  ?option_settings:option_settings_list ->
  ?vpc_security_group_memberships:vpc_security_group_id_list ->
  ?db_security_group_memberships:db_security_group_name_list ->
  ?option_version:string_ ->
  ?port:integer_optional ->
  option_name:string_ ->
  unit ->
  option_configuration

val make_modify_tenant_database_message :
  ?master_user_secret_kms_key_id:string_ ->
  ?rotate_master_user_password:boolean_optional ->
  ?manage_master_user_password:boolean_optional ->
  ?new_tenant_db_name:string_ ->
  ?master_user_password:sensitive_string ->
  tenant_db_name:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  modify_tenant_database_message

val make_modify_option_group_message :
  ?apply_immediately:boolean_ ->
  ?options_to_remove:option_names_list ->
  ?options_to_include:option_configuration_list ->
  option_group_name:string_ ->
  unit ->
  modify_option_group_message

val make_modify_integration_message :
  ?description:integration_description ->
  ?data_filter:data_filter ->
  ?integration_name:integration_name ->
  integration_identifier:integration_identifier ->
  unit ->
  modify_integration_message

val make_integration_error :
  ?error_message:string_ -> error_code:string_ -> unit -> integration_error

val make_integration :
  ?errors:integration_error_list ->
  ?create_time:t_stamp ->
  ?description:integration_description ->
  ?data_filter:data_filter ->
  ?tags:tag_list ->
  ?status:integration_status ->
  ?additional_encryption_context:encryption_context_map ->
  ?kms_key_id:string_ ->
  ?integration_arn:integration_arn ->
  ?integration_name:integration_name ->
  ?target_arn:arn ->
  ?source_arn:source_arn ->
  unit ->
  integration

val make_modify_global_cluster_message :
  ?allow_major_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?deletion_protection:boolean_optional ->
  ?new_global_cluster_identifier:global_cluster_identifier ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  modify_global_cluster_message

val make_modify_event_subscription_message :
  ?enabled:boolean_optional ->
  ?event_categories:event_categories_list ->
  ?source_type:string_ ->
  ?sns_topic_arn:string_ ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_modify_db_subnet_group_message :
  ?db_subnet_group_description:string_ ->
  subnet_ids:subnet_identifier_list ->
  db_subnet_group_name:string_ ->
  unit ->
  modify_db_subnet_group_message

val make_db_snapshot :
  ?snapshot_availability_zone:string_ ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?dedicated_log_volume:boolean_ ->
  ?multi_tenant:boolean_optional ->
  ?db_system_id:string_ ->
  ?snapshot_database_time:t_stamp ->
  ?original_snapshot_create_time:t_stamp ->
  ?snapshot_target:string_ ->
  ?tag_list:tag_list ->
  ?dbi_resource_id:string_ ->
  ?processor_features:processor_feature_list ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?timezone:string_ ->
  ?db_snapshot_arn:string_ ->
  ?kms_key_id:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?storage_encryption_type:storage_encryption_type ->
  ?encrypted:boolean_ ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?source_db_snapshot_identifier:string_ ->
  ?source_region:string_ ->
  ?percent_progress:integer ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?snapshot_type:string_ ->
  ?license_model:string_ ->
  ?engine_version:string_ ->
  ?master_username:string_ ->
  ?instance_create_time:t_stamp ->
  ?vpc_id:string_ ->
  ?availability_zone:string_ ->
  ?port:integer ->
  ?status:string_ ->
  ?allocated_storage:integer ->
  ?engine:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?db_instance_identifier:string_ ->
  ?db_snapshot_identifier:string_ ->
  unit ->
  db_snapshot

val make_modify_db_snapshot_message :
  ?option_group_name:string_ ->
  ?engine_version:string_ ->
  db_snapshot_identifier:string_ ->
  unit ->
  modify_db_snapshot_message

val make_db_snapshot_attribute :
  ?attribute_values:attribute_value_list -> ?attribute_name:string_ -> unit -> db_snapshot_attribute

val make_modify_db_snapshot_attribute_message :
  ?values_to_remove:attribute_value_list ->
  ?values_to_add:attribute_value_list ->
  attribute_name:string_ ->
  db_snapshot_identifier:string_ ->
  unit ->
  modify_db_snapshot_attribute_message

val make_modify_db_shard_group_message :
  ?compute_redundancy:integer_optional ->
  ?min_ac_u:double_optional ->
  ?max_ac_u:double_optional ->
  db_shard_group_identifier:db_shard_group_identifier ->
  unit ->
  modify_db_shard_group_message

val make_modify_db_recommendation_message :
  ?recommended_action_updates:recommended_action_update_list ->
  ?status:string_ ->
  ?locale:string_ ->
  recommendation_id:string_ ->
  unit ->
  modify_db_recommendation_message

val make_doc_link : ?url:string_ -> ?text:string_ -> unit -> doc_link

val make_db_recommendation :
  ?issue_details:issue_details ->
  ?links:doc_link_list ->
  ?additional_info:string_ ->
  ?impact:string_ ->
  ?type_recommendation:string_ ->
  ?type_detection:string_ ->
  ?source:string_ ->
  ?category:string_ ->
  ?recommended_actions:recommended_action_list ->
  ?reason:string_ ->
  ?description:string_ ->
  ?recommendation:string_ ->
  ?detection:string_ ->
  ?updated_time:t_stamp ->
  ?created_time:t_stamp ->
  ?status:string_ ->
  ?resource_arn:string_ ->
  ?severity:string_ ->
  ?type_id:string_ ->
  ?recommendation_id:string_ ->
  unit ->
  db_recommendation

val make_db_recommendation_message :
  ?db_recommendation:db_recommendation -> unit -> db_recommendation_message

val make_modify_db_proxy_target_group_response :
  ?db_proxy_target_group:db_proxy_target_group -> unit -> modify_db_proxy_target_group_response

val make_connection_pool_configuration :
  ?init_query:operator_sensitive_string ->
  ?session_pinning_filters:string_list ->
  ?connection_borrow_timeout:integer_optional ->
  ?max_idle_connections_percent:integer_optional ->
  ?max_connections_percent:integer_optional ->
  unit ->
  connection_pool_configuration

val make_modify_db_proxy_target_group_request :
  ?new_name:string_ ->
  ?connection_pool_config:connection_pool_configuration ->
  db_proxy_name:db_proxy_name ->
  target_group_name:db_proxy_target_group_name ->
  unit ->
  modify_db_proxy_target_group_request

val make_db_proxy :
  ?target_connection_network_type:target_connection_network_type ->
  ?endpoint_network_type:endpoint_network_type ->
  ?updated_date:t_stamp ->
  ?created_date:t_stamp ->
  ?debug_logging:boolean_ ->
  ?idle_client_timeout:integer ->
  ?require_tl_s:boolean_ ->
  ?endpoint:string_ ->
  ?role_arn:string_ ->
  ?auth:user_auth_config_info_list ->
  ?default_auth_scheme:string_ ->
  ?vpc_subnet_ids:string_list ->
  ?vpc_security_group_ids:string_list ->
  ?vpc_id:string_ ->
  ?engine_family:string_ ->
  ?status:db_proxy_status ->
  ?db_proxy_arn:string_ ->
  ?db_proxy_name:string_ ->
  unit ->
  db_proxy

val make_modify_db_proxy_response : ?db_proxy:db_proxy -> unit -> modify_db_proxy_response

val make_modify_db_proxy_request :
  ?security_groups:string_list ->
  ?role_arn:arn ->
  ?debug_logging:boolean_optional ->
  ?idle_client_timeout:integer_optional ->
  ?require_tl_s:boolean_optional ->
  ?auth:user_auth_config_list ->
  ?default_auth_scheme:default_auth_scheme ->
  ?new_db_proxy_name:db_proxy_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  modify_db_proxy_request

val make_db_proxy_endpoint :
  ?endpoint_network_type:endpoint_network_type ->
  ?is_default:boolean_ ->
  ?target_role:db_proxy_endpoint_target_role ->
  ?created_date:t_stamp ->
  ?endpoint:string_ ->
  ?vpc_subnet_ids:string_list ->
  ?vpc_security_group_ids:string_list ->
  ?vpc_id:string_ ->
  ?status:db_proxy_endpoint_status ->
  ?db_proxy_name:string_ ->
  ?db_proxy_endpoint_arn:string_ ->
  ?db_proxy_endpoint_name:string_ ->
  unit ->
  db_proxy_endpoint

val make_modify_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> modify_db_proxy_endpoint_response

val make_modify_db_proxy_endpoint_request :
  ?vpc_security_group_ids:string_list ->
  ?new_db_proxy_endpoint_name:db_proxy_endpoint_name ->
  db_proxy_endpoint_name:db_proxy_endpoint_name ->
  unit ->
  modify_db_proxy_endpoint_request

val make_modify_db_parameter_group_message :
  parameters:parameters_list ->
  db_parameter_group_name:string_ ->
  unit ->
  modify_db_parameter_group_message

val make_cloudwatch_logs_export_configuration :
  ?disable_log_types:log_type_list ->
  ?enable_log_types:log_type_list ->
  unit ->
  cloudwatch_logs_export_configuration

val make_modify_additional_storage_volume :
  ?set_for_delete:boolean_optional ->
  ?storage_type:string_ ->
  ?storage_throughput:integer_optional ->
  ?max_allocated_storage:integer_optional ->
  ?iop_s:integer_optional ->
  ?allocated_storage:integer_optional ->
  volume_name:string_ ->
  unit ->
  modify_additional_storage_volume

val make_modify_db_instance_message :
  ?master_user_authentication_type:master_user_authentication_type ->
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:modify_additional_storage_volumes_list ->
  ?engine:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?multi_tenant:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?rotate_master_user_password:boolean_optional ->
  ?manage_master_user_password:boolean_optional ->
  ?aws_backup_recovery_point_arn:aws_backup_recovery_point_arn ->
  ?network_type:string_ ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?resume_full_automation_mode_minutes:integer_optional ->
  ?automation_mode:automation_mode ->
  ?replica_mode:replica_mode ->
  ?certificate_rotation_restart:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?deletion_protection:boolean_optional ->
  ?use_default_processor_features:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?domain_iam_role_name:string_ ->
  ?monitoring_role_arn:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?db_port_number:integer_optional ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?disable_domain:boolean_optional ->
  ?domain_dns_ips:string_list ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_ou:string_ ->
  ?domain_fqdn:string_ ->
  ?domain:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?new_db_instance_identifier:string_ ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?allow_major_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?db_parameter_group_name:string_ ->
  ?master_user_password:sensitive_string ->
  ?apply_immediately:boolean_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_security_groups:db_security_group_name_list ->
  ?db_subnet_group_name:string_ ->
  ?db_instance_class:string_ ->
  ?allocated_storage:integer_optional ->
  db_instance_identifier:string_ ->
  unit ->
  modify_db_instance_message

val make_db_cluster_snapshot_attribute :
  ?attribute_values:attribute_value_list ->
  ?attribute_name:string_ ->
  unit ->
  db_cluster_snapshot_attribute

val make_modify_db_cluster_snapshot_attribute_message :
  ?values_to_remove:attribute_value_list ->
  ?values_to_add:attribute_value_list ->
  attribute_name:string_ ->
  db_cluster_snapshot_identifier:string_ ->
  unit ->
  modify_db_cluster_snapshot_attribute_message

val make_modify_db_cluster_parameter_group_message :
  parameters:parameters_list ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  modify_db_cluster_parameter_group_message

val make_modify_db_cluster_message :
  ?master_user_authentication_type:master_user_authentication_type ->
  ?ca_certificate_identifier:string_ ->
  ?enable_limitless_database:boolean_optional ->
  ?aws_backup_recovery_point_arn:aws_backup_recovery_point_arn ->
  ?allow_engine_mode_change:boolean_ ->
  ?engine_mode:string_ ->
  ?master_user_secret_kms_key_id:string_ ->
  ?enable_local_write_forwarding:boolean_optional ->
  ?rotate_master_user_password:boolean_optional ->
  ?manage_master_user_password:boolean_optional ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?network_type:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?iops:integer_optional ->
  ?storage_type:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_cluster_instance_class:string_ ->
  ?enable_global_write_forwarding:boolean_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?enable_http_endpoint:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?scaling_configuration:scaling_configuration ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?db_instance_parameter_group_name:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?backtrack_window:long_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?option_group_name:string_ ->
  ?master_user_password:sensitive_string ->
  ?port:integer_optional ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?apply_immediately:boolean_ ->
  ?new_db_cluster_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_db_cluster_message

val make_modify_db_cluster_endpoint_message :
  ?excluded_members:string_list ->
  ?static_members:string_list ->
  ?endpoint_type:string_ ->
  db_cluster_endpoint_identifier:string_ ->
  unit ->
  modify_db_cluster_endpoint_message

val make_db_cluster_endpoint :
  ?db_cluster_endpoint_arn:string_ ->
  ?excluded_members:string_list ->
  ?static_members:string_list ->
  ?custom_endpoint_type:string_ ->
  ?endpoint_type:string_ ->
  ?status:string_ ->
  ?endpoint:string_ ->
  ?db_cluster_endpoint_resource_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_endpoint_identifier:string_ ->
  unit ->
  db_cluster_endpoint

val make_modify_custom_db_engine_version_message :
  ?status:custom_engine_version_status ->
  ?description:description ->
  engine_version:custom_engine_version ->
  engine:custom_engine_name ->
  unit ->
  modify_custom_db_engine_version_message

val make_custom_db_engine_version_am_i :
  ?status:string_ -> ?image_id:string_ -> unit -> custom_db_engine_version_am_i

val make_db_engine_version :
  ?serverless_v2_features_support:serverless_v2_features_support ->
  ?supports_integrations:boolean_ ->
  ?supports_local_write_forwarding:boolean_optional ->
  ?supported_ca_certificate_identifiers:ca_certificate_identifiers_list ->
  ?supports_certificate_rotation_without_restart:boolean_optional ->
  ?supports_limitless_database:boolean_ ->
  ?supports_babelfish:boolean_ ->
  ?tag_list:tag_list ->
  ?supports_global_databases:boolean_ ->
  ?supports_parallel_query:boolean_ ->
  ?status:string_ ->
  ?supported_feature_names:feature_name_list ->
  ?supported_engine_modes:engine_mode_list ->
  ?supports_read_replica:boolean_ ->
  ?supports_log_exports_to_cloudwatch_logs:boolean_ ->
  ?exportable_log_types:log_type_list ->
  ?supported_timezones:supported_timezones_list ->
  ?valid_upgrade_target:valid_upgrade_target_list ->
  ?supported_nchar_character_sets:supported_character_sets_list ->
  ?supported_character_sets:supported_character_sets_list ->
  ?create_time:t_stamp ->
  ?kms_key_id:string_ ->
  ?db_engine_media_type:string_ ->
  ?image:custom_db_engine_version_am_i ->
  ?failure_reason:string_ ->
  ?default_character_set:character_set ->
  ?db_engine_version_description:string_ ->
  ?db_engine_version_arn:string_ ->
  ?db_engine_description:string_ ->
  ?db_parameter_group_family:string_ ->
  ?custom_db_engine_version_manifest:custom_db_engine_version_manifest ->
  ?database_installation_files:string_list ->
  ?database_installation_files_s3_prefix:string_ ->
  ?database_installation_files_s3_bucket_name:string_ ->
  ?engine_version:string_ ->
  ?major_engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  db_engine_version

val make_modify_current_db_cluster_capacity_message :
  ?timeout_action:string_ ->
  ?seconds_before_timeout:integer_optional ->
  ?capacity:integer_optional ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_current_db_cluster_capacity_message

val make_db_cluster_capacity_info :
  ?timeout_action:string_ ->
  ?seconds_before_timeout:integer_optional ->
  ?current_capacity:integer_optional ->
  ?pending_capacity:integer_optional ->
  ?db_cluster_identifier:string_ ->
  unit ->
  db_cluster_capacity_info

val make_certificate :
  ?customer_override_valid_till:t_stamp ->
  ?customer_override:boolean_optional ->
  ?certificate_arn:string_ ->
  ?valid_till:t_stamp ->
  ?valid_from:t_stamp ->
  ?thumbprint:string_ ->
  ?certificate_type:string_ ->
  ?certificate_identifier:string_ ->
  unit ->
  certificate

val make_modify_certificates_message :
  ?remove_customer_override:boolean_optional ->
  ?certificate_identifier:string_ ->
  unit ->
  modify_certificates_message

val make_modify_activity_stream_response :
  ?policy_status:activity_stream_policy_status ->
  ?engine_native_audit_fields_included:boolean_optional ->
  ?mode:activity_stream_mode ->
  ?status:activity_stream_status ->
  ?kinesis_stream_name:string_ ->
  ?kms_key_id:string_ ->
  unit ->
  modify_activity_stream_response

val make_modify_activity_stream_request :
  ?audit_policy_state:audit_policy_state ->
  ?resource_arn:string_ ->
  unit ->
  modify_activity_stream_request

val make_filter : values:filter_value_list -> name:string_ -> unit -> filter

val make_list_tags_for_resource_message :
  ?filters:filter_list -> resource_name:string_ -> unit -> list_tags_for_resource_message

val make_global_clusters_message :
  ?global_clusters:global_cluster_list -> ?marker:string_ -> unit -> global_clusters_message

val make_failover_global_cluster_message :
  ?switchover:boolean_optional ->
  ?allow_data_loss:boolean_optional ->
  target_db_cluster_identifier:db_cluster_identifier ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  failover_global_cluster_message

val make_failover_db_cluster_message :
  ?target_db_instance_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  failover_db_cluster_message

val make_export_tasks_message :
  ?export_tasks:export_tasks_list -> ?marker:string_ -> unit -> export_tasks_message

val make_event :
  ?source_arn:string_ ->
  ?date:t_stamp ->
  ?event_categories:event_categories_list ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  event

val make_events_message : ?events:event_list -> ?marker:string_ -> unit -> events_message

val make_event_subscriptions_message :
  ?event_subscriptions_list:event_subscriptions_list ->
  ?marker:string_ ->
  unit ->
  event_subscriptions_message

val make_event_categories_map :
  ?event_categories:event_categories_list -> ?source_type:string_ -> unit -> event_categories_map

val make_event_categories_message :
  ?event_categories_map_list:event_categories_map_list -> unit -> event_categories_message

val make_engine_defaults :
  ?parameters:parameters_list ->
  ?marker:string_ ->
  ?db_parameter_group_family:string_ ->
  unit ->
  engine_defaults

val make_enable_http_endpoint_response :
  ?http_endpoint_enabled:boolean_ -> ?resource_arn:string_ -> unit -> enable_http_endpoint_response

val make_enable_http_endpoint_request : resource_arn:string_ -> unit -> enable_http_endpoint_request

val make_download_db_log_file_portion_message :
  ?number_of_lines:integer ->
  ?marker:string_ ->
  log_file_name:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  download_db_log_file_portion_message

val make_download_db_log_file_portion_details :
  ?additional_data_pending:boolean_ ->
  ?marker:string_ ->
  ?log_file_data:sensitive_string ->
  unit ->
  download_db_log_file_portion_details

val make_disable_http_endpoint_response :
  ?http_endpoint_enabled:boolean_ -> ?resource_arn:string_ -> unit -> disable_http_endpoint_response

val make_disable_http_endpoint_request :
  resource_arn:string_ -> unit -> disable_http_endpoint_request

val make_describe_valid_db_instance_modifications_message :
  db_instance_identifier:string_ -> unit -> describe_valid_db_instance_modifications_message

val make_describe_tenant_databases_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?tenant_db_name:string_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  describe_tenant_databases_message

val make_describe_source_regions_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?region_name:string_ ->
  unit ->
  describe_source_regions_message

val make_describe_serverless_v2_platform_versions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?include_all:boolean_optional ->
  ?default_only:boolean_optional ->
  ?filters:filter_list ->
  ?engine:string_ ->
  ?serverless_v2_platform_version:string_ ->
  unit ->
  describe_serverless_v2_platform_versions_message

val make_describe_reserved_db_instances_offerings_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?multi_a_z:boolean_optional ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?duration:string_ ->
  ?db_instance_class:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  unit ->
  describe_reserved_db_instances_offerings_message

val make_describe_reserved_db_instances_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?lease_id:string_ ->
  ?multi_a_z:boolean_optional ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?duration:string_ ->
  ?db_instance_class:string_ ->
  ?reserved_db_instances_offering_id:string_ ->
  ?reserved_db_instance_id:string_ ->
  unit ->
  describe_reserved_db_instances_message

val make_describe_pending_maintenance_actions_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?resource_identifier:string_ ->
  unit ->
  describe_pending_maintenance_actions_message

val make_describe_orderable_db_instance_options_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?vpc:boolean_optional ->
  ?availability_zone_group:string_ ->
  ?license_model:string_ ->
  ?db_instance_class:string_ ->
  ?engine_version:string_ ->
  engine:string_ ->
  unit ->
  describe_orderable_db_instance_options_message

val make_describe_option_groups_message :
  ?major_engine_version:string_ ->
  ?engine_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?option_group_name:string_ ->
  unit ->
  describe_option_groups_message

val make_describe_option_group_options_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?major_engine_version:string_ ->
  engine_name:string_ ->
  unit ->
  describe_option_group_options_message

val make_describe_integrations_response :
  ?integrations:integration_list -> ?marker:marker -> unit -> describe_integrations_response

val make_describe_integrations_message :
  ?marker:marker ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?integration_identifier:integration_identifier ->
  unit ->
  describe_integrations_message

val make_describe_global_clusters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?global_cluster_identifier:global_cluster_identifier ->
  unit ->
  describe_global_clusters_message

val make_describe_export_tasks_message :
  ?source_type:export_source_type ->
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?source_arn:string_ ->
  ?export_task_identifier:string_ ->
  unit ->
  describe_export_tasks_message

val make_describe_events_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?event_categories:event_categories_list ->
  ?duration:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  describe_events_message

val make_describe_event_subscriptions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?subscription_name:string_ ->
  unit ->
  describe_event_subscriptions_message

val make_describe_event_categories_message :
  ?filters:filter_list -> ?source_type:string_ -> unit -> describe_event_categories_message

val make_describe_engine_default_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  db_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_parameters_message

val make_describe_engine_default_cluster_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  db_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_cluster_parameters_message

val make_describe_db_subnet_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_subnet_group_name:string_ ->
  unit ->
  describe_db_subnet_groups_message

val make_db_subnet_group_message :
  ?db_subnet_groups:db_subnet_groups -> ?marker:string_ -> unit -> db_subnet_group_message

val make_describe_db_snapshots_message :
  ?dbi_resource_id:string_ ->
  ?include_public:boolean_ ->
  ?include_shared:boolean_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?snapshot_type:string_ ->
  ?db_snapshot_identifier:string_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  describe_db_snapshots_message

val make_db_snapshot_message :
  ?db_snapshots:db_snapshot_list -> ?marker:string_ -> unit -> db_snapshot_message

val make_describe_db_snapshot_tenant_databases_message :
  ?dbi_resource_id:string_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?snapshot_type:string_ ->
  ?db_snapshot_identifier:string_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  describe_db_snapshot_tenant_databases_message

val make_db_snapshot_tenant_database :
  ?tag_list:tag_list ->
  ?nchar_character_set_name:string_ ->
  ?db_snapshot_tenant_database_ar_n:string_ ->
  ?character_set_name:string_ ->
  ?tenant_database_resource_id:string_ ->
  ?master_username:string_ ->
  ?tenant_db_name:string_ ->
  ?tenant_database_create_time:t_stamp ->
  ?snapshot_type:string_ ->
  ?engine_name:string_ ->
  ?dbi_resource_id:string_ ->
  ?db_instance_identifier:string_ ->
  ?db_snapshot_identifier:string_ ->
  unit ->
  db_snapshot_tenant_database

val make_db_snapshot_tenant_databases_message :
  ?db_snapshot_tenant_databases:db_snapshot_tenant_databases_list ->
  ?marker:string_ ->
  unit ->
  db_snapshot_tenant_databases_message

val make_describe_db_snapshot_attributes_message :
  db_snapshot_identifier:string_ -> unit -> describe_db_snapshot_attributes_message

val make_describe_db_shard_groups_response :
  ?marker:string_ ->
  ?db_shard_groups:db_shard_groups_list ->
  unit ->
  describe_db_shard_groups_response

val make_describe_db_shard_groups_message :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?db_shard_group_identifier:db_shard_group_identifier ->
  unit ->
  describe_db_shard_groups_message

val make_describe_db_security_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_security_group_name:string_ ->
  unit ->
  describe_db_security_groups_message

val make_db_security_group_message :
  ?db_security_groups:db_security_groups -> ?marker:string_ -> unit -> db_security_group_message

val make_describe_db_recommendations_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?locale:string_ ->
  ?last_updated_before:t_stamp ->
  ?last_updated_after:t_stamp ->
  unit ->
  describe_db_recommendations_message

val make_db_recommendations_message :
  ?marker:string_ ->
  ?db_recommendations:db_recommendation_list ->
  unit ->
  db_recommendations_message

val make_describe_db_proxy_targets_response :
  ?marker:string_ -> ?targets:target_list -> unit -> describe_db_proxy_targets_response

val make_describe_db_proxy_targets_request :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?target_group_name:db_proxy_target_group_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxy_targets_request

val make_describe_db_proxy_target_groups_response :
  ?marker:string_ ->
  ?target_groups:target_group_list ->
  unit ->
  describe_db_proxy_target_groups_response

val make_describe_db_proxy_target_groups_request :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?target_group_name:db_proxy_target_group_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxy_target_groups_request

val make_describe_db_proxy_endpoints_response :
  ?marker:string_ ->
  ?db_proxy_endpoints:db_proxy_endpoint_list ->
  unit ->
  describe_db_proxy_endpoints_response

val make_describe_db_proxy_endpoints_request :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?db_proxy_endpoint_name:db_proxy_endpoint_name ->
  ?db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxy_endpoints_request

val make_describe_db_proxies_response :
  ?marker:string_ -> ?db_proxies:db_proxy_list -> unit -> describe_db_proxies_response

val make_describe_db_proxies_request :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?db_proxy_name:db_proxy_name ->
  unit ->
  describe_db_proxies_request

val make_describe_db_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?source:string_ ->
  db_parameter_group_name:string_ ->
  unit ->
  describe_db_parameters_message

val make_db_parameter_group_details :
  ?marker:string_ -> ?parameters:parameters_list -> unit -> db_parameter_group_details

val make_describe_db_parameter_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_parameter_group_name:string_ ->
  unit ->
  describe_db_parameter_groups_message

val make_db_parameter_group :
  ?db_parameter_group_arn:string_ ->
  ?description:string_ ->
  ?db_parameter_group_family:string_ ->
  ?db_parameter_group_name:string_ ->
  unit ->
  db_parameter_group

val make_db_parameter_groups_message :
  ?db_parameter_groups:db_parameter_group_list ->
  ?marker:string_ ->
  unit ->
  db_parameter_groups_message

val make_db_major_engine_version :
  ?supported_engine_lifecycles:supported_engine_lifecycle_list ->
  ?major_engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  db_major_engine_version

val make_describe_db_major_engine_versions_response :
  ?marker:string_ ->
  ?db_major_engine_versions:db_major_engine_versions_list ->
  unit ->
  describe_db_major_engine_versions_response

val make_describe_db_major_engine_versions_request :
  ?max_records:max_records ->
  ?marker:marker ->
  ?major_engine_version:major_engine_version ->
  ?engine:engine ->
  unit ->
  describe_db_major_engine_versions_request

val make_describe_db_log_files_details :
  ?size:long ->
  ?last_written:long ->
  ?log_file_name:string_ ->
  unit ->
  describe_db_log_files_details

val make_describe_db_log_files_response :
  ?marker:string_ ->
  ?describe_db_log_files:describe_db_log_files_list ->
  unit ->
  describe_db_log_files_response

val make_describe_db_log_files_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?file_size:long ->
  ?file_last_written:long ->
  ?filename_contains:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  describe_db_log_files_message

val make_describe_db_instances_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_instance_identifier:string_ ->
  unit ->
  describe_db_instances_message

val make_db_instance_message :
  ?db_instances:db_instance_list -> ?marker:string_ -> unit -> db_instance_message

val make_describe_db_instance_automated_backups_message :
  ?db_instance_automated_backups_arn:string_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_instance_identifier:string_ ->
  ?dbi_resource_id:string_ ->
  unit ->
  describe_db_instance_automated_backups_message

val make_db_instance_automated_backup_message :
  ?db_instance_automated_backups:db_instance_automated_backup_list ->
  ?marker:string_ ->
  unit ->
  db_instance_automated_backup_message

val make_describe_db_engine_versions_message :
  ?include_all:boolean_optional ->
  ?list_supported_timezones:boolean_optional ->
  ?list_supported_character_sets:boolean_optional ->
  ?default_only:boolean_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_parameter_group_family:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  describe_db_engine_versions_message

val make_db_engine_version_message :
  ?db_engine_versions:db_engine_version_list -> ?marker:string_ -> unit -> db_engine_version_message

val make_describe_db_clusters_message :
  ?include_shared:boolean_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_cluster_identifier:string_ ->
  unit ->
  describe_db_clusters_message

val make_db_cluster_message :
  ?db_clusters:db_cluster_list -> ?marker:string_ -> unit -> db_cluster_message

val make_describe_db_cluster_snapshots_message :
  ?db_cluster_resource_id:string_ ->
  ?include_public:boolean_ ->
  ?include_shared:boolean_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?snapshot_type:string_ ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  unit ->
  describe_db_cluster_snapshots_message

val make_db_cluster_snapshot :
  ?db_system_id:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?storage_throughput:integer_optional ->
  ?storage_type:string_ ->
  ?tag_list:tag_list ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?source_db_cluster_snapshot_arn:string_ ->
  ?db_cluster_snapshot_arn:string_ ->
  ?kms_key_id:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_encrypted:boolean_ ->
  ?percent_progress:integer ->
  ?snapshot_type:string_ ->
  ?license_model:string_ ->
  ?engine_version:string_ ->
  ?master_username:string_ ->
  ?cluster_create_time:t_stamp ->
  ?vpc_id:string_ ->
  ?port:integer ->
  ?status:string_ ->
  ?allocated_storage:integer ->
  ?engine_mode:string_ ->
  ?engine:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?availability_zones:availability_zones ->
  unit ->
  db_cluster_snapshot

val make_db_cluster_snapshot_message :
  ?db_cluster_snapshots:db_cluster_snapshot_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_snapshot_message

val make_describe_db_cluster_snapshot_attributes_message :
  db_cluster_snapshot_identifier:string_ -> unit -> describe_db_cluster_snapshot_attributes_message

val make_describe_db_cluster_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?source:string_ ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  describe_db_cluster_parameters_message

val make_db_cluster_parameter_group_details :
  ?marker:string_ -> ?parameters:parameters_list -> unit -> db_cluster_parameter_group_details

val make_describe_db_cluster_parameter_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_cluster_parameter_group_name:string_ ->
  unit ->
  describe_db_cluster_parameter_groups_message

val make_db_cluster_parameter_group :
  ?db_cluster_parameter_group_arn:string_ ->
  ?description:string_ ->
  ?db_parameter_group_family:string_ ->
  ?db_cluster_parameter_group_name:string_ ->
  unit ->
  db_cluster_parameter_group

val make_db_cluster_parameter_groups_message :
  ?db_cluster_parameter_groups:db_cluster_parameter_group_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_parameter_groups_message

val make_describe_db_cluster_endpoints_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_cluster_endpoint_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  unit ->
  describe_db_cluster_endpoints_message

val make_db_cluster_endpoint_message :
  ?db_cluster_endpoints:db_cluster_endpoint_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_endpoint_message

val make_describe_db_cluster_backtracks_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?backtrack_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  describe_db_cluster_backtracks_message

val make_db_cluster_backtrack :
  ?status:string_ ->
  ?backtrack_request_creation_time:t_stamp ->
  ?backtracked_from:t_stamp ->
  ?backtrack_to:t_stamp ->
  ?backtrack_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  unit ->
  db_cluster_backtrack

val make_db_cluster_backtrack_message :
  ?db_cluster_backtracks:db_cluster_backtrack_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_backtrack_message

val make_describe_db_cluster_automated_backups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_resource_id:string_ ->
  unit ->
  describe_db_cluster_automated_backups_message

val make_db_cluster_automated_backup :
  ?tag_list:tag_list ->
  ?aws_backup_recovery_point_arn:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?storage_type:string_ ->
  ?kms_key_id:string_ ->
  ?port:integer ->
  ?availability_zones:availability_zones ->
  ?engine_mode:string_ ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_arn:string_ ->
  ?engine_version:string_ ->
  ?allocated_storage:integer ->
  ?storage_encryption_type:storage_encryption_type ->
  ?storage_encrypted:boolean_ ->
  ?cluster_create_time:t_stamp ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?status:string_ ->
  ?license_model:string_ ->
  ?region:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?master_username:string_ ->
  ?restore_window:restore_window ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_automated_backups_arn:string_ ->
  ?vpc_id:string_ ->
  ?engine:string_ ->
  unit ->
  db_cluster_automated_backup

val make_db_cluster_automated_backup_message :
  ?db_cluster_automated_backups:db_cluster_automated_backup_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_automated_backup_message

val make_describe_certificates_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?certificate_identifier:string_ ->
  unit ->
  describe_certificates_message

val make_certificate_message :
  ?marker:string_ ->
  ?certificates:certificate_list ->
  ?default_certificate_for_new_launches:string_ ->
  unit ->
  certificate_message

val make_describe_blue_green_deployments_response :
  ?marker:string_ ->
  ?blue_green_deployments:blue_green_deployment_list ->
  unit ->
  describe_blue_green_deployments_response

val make_describe_blue_green_deployments_request :
  ?max_records:max_records ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?blue_green_deployment_identifier:blue_green_deployment_identifier ->
  unit ->
  describe_blue_green_deployments_request

val make_describe_account_attributes_message : unit -> unit

val make_account_quota :
  ?max:long -> ?used:long -> ?account_quota_name:string_ -> unit -> account_quota

val make_account_attributes_message :
  ?account_quotas:account_quota_list -> unit -> account_attributes_message

val make_deregister_db_proxy_targets_response : unit -> unit

val make_deregister_db_proxy_targets_request :
  ?db_cluster_identifiers:string_list ->
  ?db_instance_identifiers:string_list ->
  ?target_group_name:db_proxy_target_group_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  deregister_db_proxy_targets_request

val make_delete_tenant_database_message :
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  tenant_db_name:string_ ->
  db_instance_identifier:string_ ->
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

val make_delete_db_proxy_response : ?db_proxy:db_proxy -> unit -> delete_db_proxy_response
val make_delete_db_proxy_request : db_proxy_name:db_proxy_name -> unit -> delete_db_proxy_request

val make_delete_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> delete_db_proxy_endpoint_response

val make_delete_db_proxy_endpoint_request :
  db_proxy_endpoint_name:db_proxy_endpoint_name -> unit -> delete_db_proxy_endpoint_request

val make_delete_db_parameter_group_message :
  db_parameter_group_name:string_ -> unit -> delete_db_parameter_group_message

val make_delete_db_instance_message :
  ?delete_automated_backups:boolean_optional ->
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  db_instance_identifier:string_ ->
  unit ->
  delete_db_instance_message

val make_delete_db_instance_automated_backup_message :
  ?db_instance_automated_backups_arn:string_ ->
  ?dbi_resource_id:string_ ->
  unit ->
  delete_db_instance_automated_backup_message

val make_delete_db_cluster_snapshot_message :
  db_cluster_snapshot_identifier:string_ -> unit -> delete_db_cluster_snapshot_message

val make_delete_db_cluster_parameter_group_message :
  db_cluster_parameter_group_name:string_ -> unit -> delete_db_cluster_parameter_group_message

val make_delete_db_cluster_message :
  ?delete_automated_backups:boolean_optional ->
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  db_cluster_identifier:string_ ->
  unit ->
  delete_db_cluster_message

val make_delete_db_cluster_endpoint_message :
  db_cluster_endpoint_identifier:string_ -> unit -> delete_db_cluster_endpoint_message

val make_delete_db_cluster_automated_backup_message :
  db_cluster_resource_id:string_ -> unit -> delete_db_cluster_automated_backup_message

val make_delete_custom_db_engine_version_message :
  engine_version:custom_engine_version ->
  engine:custom_engine_name ->
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
  ?tags:tag_list ->
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?nchar_character_set_name:string_ ->
  ?character_set_name:string_ ->
  ?master_user_password:sensitive_string ->
  master_username:string_ ->
  tenant_db_name:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  create_tenant_database_message

val make_create_option_group_message :
  ?tags:tag_list ->
  option_group_description:string_ ->
  major_engine_version:string_ ->
  engine_name:string_ ->
  option_group_name:string_ ->
  unit ->
  create_option_group_message

val make_create_integration_message :
  ?description:integration_description ->
  ?data_filter:data_filter ->
  ?tags:tag_list ->
  ?additional_encryption_context:encryption_context_map ->
  ?kms_key_id:string_ ->
  integration_name:integration_name ->
  target_arn:arn ->
  source_arn:source_arn ->
  unit ->
  create_integration_message

val make_create_global_cluster_message :
  ?tags:tag_list ->
  ?storage_encrypted:boolean_optional ->
  ?database_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?engine_lifecycle_support:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?source_db_cluster_identifier:string_ ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  create_global_cluster_message

val make_create_event_subscription_message :
  ?tags:tag_list ->
  ?enabled:boolean_optional ->
  ?source_ids:source_ids_list ->
  ?event_categories:event_categories_list ->
  ?source_type:string_ ->
  sns_topic_arn:string_ ->
  subscription_name:string_ ->
  unit ->
  create_event_subscription_message

val make_create_db_subnet_group_message :
  ?tags:tag_list ->
  subnet_ids:subnet_identifier_list ->
  db_subnet_group_description:string_ ->
  db_subnet_group_name:string_ ->
  unit ->
  create_db_subnet_group_message

val make_create_db_snapshot_message :
  ?tags:tag_list ->
  db_instance_identifier:string_ ->
  db_snapshot_identifier:string_ ->
  unit ->
  create_db_snapshot_message

val make_create_db_shard_group_message :
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?min_ac_u:double_optional ->
  ?compute_redundancy:integer_optional ->
  max_ac_u:double_optional ->
  db_cluster_identifier:string_ ->
  db_shard_group_identifier:string_ ->
  unit ->
  create_db_shard_group_message

val make_create_db_security_group_message :
  ?tags:tag_list ->
  db_security_group_description:string_ ->
  db_security_group_name:string_ ->
  unit ->
  create_db_security_group_message

val make_create_db_proxy_response : ?db_proxy:db_proxy -> unit -> create_db_proxy_response

val make_create_db_proxy_request :
  ?target_connection_network_type:target_connection_network_type ->
  ?endpoint_network_type:endpoint_network_type ->
  ?tags:tag_list ->
  ?debug_logging:boolean_ ->
  ?idle_client_timeout:integer_optional ->
  ?require_tl_s:boolean_ ->
  ?vpc_security_group_ids:string_list ->
  ?auth:user_auth_config_list ->
  ?default_auth_scheme:default_auth_scheme ->
  vpc_subnet_ids:string_list ->
  role_arn:arn ->
  engine_family:engine_family ->
  db_proxy_name:db_proxy_name ->
  unit ->
  create_db_proxy_request

val make_create_db_proxy_endpoint_response :
  ?db_proxy_endpoint:db_proxy_endpoint -> unit -> create_db_proxy_endpoint_response

val make_create_db_proxy_endpoint_request :
  ?endpoint_network_type:endpoint_network_type ->
  ?tags:tag_list ->
  ?target_role:db_proxy_endpoint_target_role ->
  ?vpc_security_group_ids:string_list ->
  vpc_subnet_ids:string_list ->
  db_proxy_endpoint_name:db_proxy_endpoint_name ->
  db_proxy_name:db_proxy_name ->
  unit ->
  create_db_proxy_endpoint_request

val make_create_db_parameter_group_message :
  ?tags:tag_list ->
  description:string_ ->
  db_parameter_group_family:string_ ->
  db_parameter_group_name:string_ ->
  unit ->
  create_db_parameter_group_message

val make_create_db_instance_read_replica_message :
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?ca_certificate_identifier:string_ ->
  ?upgrade_storage_config:boolean_optional ->
  ?dedicated_log_volume:boolean_optional ->
  ?source_db_cluster_identifier:string_ ->
  ?allocated_storage:integer_optional ->
  ?custom_iam_instance_profile:string_ ->
  ?backup_target:string_ ->
  ?max_allocated_storage:integer_optional ->
  ?network_type:string_ ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?replica_mode:replica_mode ->
  ?domain_dns_ips:string_list ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_ou:string_ ->
  ?domain_fqdn:string_ ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?deletion_protection:boolean_optional ->
  ?use_default_processor_features:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?pre_signed_url:sensitive_string ->
  ?kms_key_id:string_ ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?storage_type:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_subnet_group_name:string_ ->
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?db_parameter_group_name:string_ ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?multi_a_z:boolean_optional ->
  ?port:integer_optional ->
  ?availability_zone:string_ ->
  ?db_instance_class:string_ ->
  ?source_db_instance_identifier:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  create_db_instance_read_replica_message

val make_create_db_instance_message :
  ?master_user_authentication_type:master_user_authentication_type ->
  ?tag_specifications:tag_specification_list ->
  ?additional_storage_volumes:additional_storage_volumes_list ->
  ?engine_lifecycle_support:string_ ->
  ?dedicated_log_volume:boolean_optional ->
  ?multi_tenant:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?db_system_id:string_ ->
  ?custom_iam_instance_profile:string_ ->
  ?backup_target:string_ ->
  ?network_type:string_ ->
  ?enable_customer_owned_ip:boolean_optional ->
  ?max_allocated_storage:integer_optional ->
  ?deletion_protection:boolean_optional ->
  ?processor_features:processor_feature_list ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?timezone:string_ ->
  ?promotion_tier:integer_optional ->
  ?domain_iam_role_name:string_ ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain_dns_ips:string_list ->
  ?domain_auth_secret_arn:string_ ->
  ?domain_ou:string_ ->
  ?domain_fqdn:string_ ->
  ?domain:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?db_cluster_identifier:string_ ->
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?nchar_character_set_name:string_ ->
  ?character_set_name:string_ ->
  ?option_group_name:string_ ->
  ?storage_throughput:integer_optional ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?port:integer_optional ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer_optional ->
  ?db_parameter_group_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?db_subnet_group_name:string_ ->
  ?availability_zone:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_security_groups:db_security_group_name_list ->
  ?master_user_password:sensitive_string ->
  ?master_username:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_name:string_ ->
  engine:string_ ->
  db_instance_class:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  create_db_instance_message

val make_create_db_cluster_snapshot_message :
  ?tags:tag_list ->
  db_cluster_identifier:string_ ->
  db_cluster_snapshot_identifier:string_ ->
  unit ->
  create_db_cluster_snapshot_message

val make_create_db_cluster_parameter_group_message :
  ?tags:tag_list ->
  description:string_ ->
  db_parameter_group_family:string_ ->
  db_cluster_parameter_group_name:string_ ->
  unit ->
  create_db_cluster_parameter_group_message

val make_create_db_cluster_message :
  ?with_express_configuration:boolean_optional ->
  ?master_user_authentication_type:master_user_authentication_type ->
  ?tag_specifications:tag_specification_list ->
  ?engine_lifecycle_support:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?master_user_secret_kms_key_id:string_ ->
  ?enable_local_write_forwarding:boolean_optional ->
  ?manage_master_user_password:boolean_optional ->
  ?db_system_id:string_ ->
  ?cluster_scalability_type:cluster_scalability_type ->
  ?enable_limitless_database:boolean_optional ->
  ?performance_insights_retention_period:integer_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?database_insights_mode:database_insights_mode ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?network_type:string_ ->
  ?enable_global_write_forwarding:boolean_optional ->
  ?domain_iam_role_name:string_ ->
  ?domain:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?enable_http_endpoint:boolean_optional ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?deletion_protection:boolean_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?iops:integer_optional ->
  ?storage_type:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_cluster_instance_class:string_ ->
  ?rds_custom_cluster_configuration:rds_custom_cluster_configuration ->
  ?scaling_configuration:scaling_configuration ->
  ?engine_mode:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?backtrack_window:long_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?pre_signed_url:sensitive_string ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  ?replication_source_identifier:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?option_group_name:string_ ->
  ?master_user_password:sensitive_string ->
  ?master_username:string_ ->
  ?port:integer_optional ->
  ?engine_version:string_ ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?database_name:string_ ->
  ?character_set_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
  engine:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_message

val make_create_db_cluster_endpoint_message :
  ?tags:tag_list ->
  ?excluded_members:string_list ->
  ?static_members:string_list ->
  endpoint_type:string_ ->
  db_cluster_endpoint_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_endpoint_message

val make_create_custom_db_engine_version_message :
  ?tags:tag_list ->
  ?manifest:custom_db_engine_version_manifest ->
  ?description:description ->
  ?use_aws_provided_latest_image:boolean_optional ->
  ?source_custom_db_engine_version_identifier:string255 ->
  ?kms_key_id:kms_key_id_or_arn ->
  ?image_id:string255 ->
  ?database_installation_files:string_list ->
  ?database_installation_files_s3_prefix:string255 ->
  ?database_installation_files_s3_bucket_name:bucket_name ->
  engine_version:custom_engine_version ->
  engine:custom_engine_name ->
  unit ->
  create_custom_db_engine_version_message

val make_create_blue_green_deployment_response :
  ?blue_green_deployment:blue_green_deployment -> unit -> create_blue_green_deployment_response

val make_create_blue_green_deployment_request :
  ?target_storage_throughput:integer_optional ->
  ?target_allocated_storage:integer_optional ->
  ?target_storage_type:target_storage_type ->
  ?target_iops:integer_optional ->
  ?upgrade_target_storage_config:boolean_optional ->
  ?target_db_instance_class:target_db_instance_class ->
  ?tags:tag_list ->
  ?target_db_cluster_parameter_group_name:target_db_cluster_parameter_group_name ->
  ?target_db_parameter_group_name:target_db_parameter_group_name ->
  ?target_engine_version:target_engine_version ->
  source:database_arn ->
  blue_green_deployment_name:blue_green_deployment_name ->
  unit ->
  create_blue_green_deployment_request

val make_copy_option_group_message :
  ?tags:tag_list ->
  target_option_group_description:string_ ->
  target_option_group_identifier:string_ ->
  source_option_group_identifier:string_ ->
  unit ->
  copy_option_group_message

val make_copy_db_snapshot_message :
  ?snapshot_availability_zone:string_ ->
  ?copy_option_group:boolean_optional ->
  ?snapshot_target:string_ ->
  ?target_custom_availability_zone:string_ ->
  ?option_group_name:string_ ->
  ?pre_signed_url:sensitive_string ->
  ?copy_tags:boolean_optional ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  target_db_snapshot_identifier:string_ ->
  source_db_snapshot_identifier:string_ ->
  unit ->
  copy_db_snapshot_message

val make_copy_db_parameter_group_message :
  ?tags:tag_list ->
  target_db_parameter_group_description:string_ ->
  target_db_parameter_group_identifier:string_ ->
  source_db_parameter_group_identifier:string_ ->
  unit ->
  copy_db_parameter_group_message

val make_copy_db_cluster_snapshot_message :
  ?tags:tag_list ->
  ?copy_tags:boolean_optional ->
  ?pre_signed_url:sensitive_string ->
  ?kms_key_id:string_ ->
  target_db_cluster_snapshot_identifier:string_ ->
  source_db_cluster_snapshot_identifier:string_ ->
  unit ->
  copy_db_cluster_snapshot_message

val make_copy_db_cluster_parameter_group_message :
  ?tags:tag_list ->
  target_db_cluster_parameter_group_description:string_ ->
  target_db_cluster_parameter_group_identifier:string_ ->
  source_db_cluster_parameter_group_identifier:string_ ->
  unit ->
  copy_db_cluster_parameter_group_message

val make_cancel_export_task_message :
  export_task_identifier:string_ -> unit -> cancel_export_task_message

val make_backtrack_db_cluster_message :
  ?use_earliest_time_on_point_in_time_unavailable:boolean_optional ->
  ?force:boolean_optional ->
  backtrack_to:t_stamp ->
  db_cluster_identifier:string_ ->
  unit ->
  backtrack_db_cluster_message

val make_authorize_db_security_group_ingress_message :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?cidri_p:string_ ->
  db_security_group_name:string_ ->
  unit ->
  authorize_db_security_group_ingress_message

val make_apply_pending_maintenance_action_message :
  opt_in_type:string_ ->
  apply_action:string_ ->
  resource_identifier:string_ ->
  unit ->
  apply_pending_maintenance_action_message

val make_add_tags_to_resource_message :
  tags:tag_list -> resource_name:string_ -> unit -> add_tags_to_resource_message

val make_add_source_identifier_to_subscription_message :
  source_identifier:string_ ->
  subscription_name:string_ ->
  unit ->
  add_source_identifier_to_subscription_message

val make_add_role_to_db_instance_message :
  feature_name:string_ ->
  role_arn:string_ ->
  db_instance_identifier:string_ ->
  unit ->
  add_role_to_db_instance_message

val make_add_role_to_db_cluster_message :
  ?feature_name:string_ ->
  role_arn:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  add_role_to_db_cluster_message
