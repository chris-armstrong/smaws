(** RDS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AddRoleToDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
    | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
      | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleAlreadyExistsFault of db_cluster_role_already_exists_fault
      | `DBClusterRoleQuotaExceededFault of db_cluster_role_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates an Identity and Access Management (IAM) role with a DB cluster.\n"]

module AddRoleToDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBInstanceRoleAlreadyExistsFault of db_instance_role_already_exists_fault
    | `DBInstanceRoleQuotaExceededFault of db_instance_role_quota_exceeded_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_instance_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceRoleAlreadyExistsFault of db_instance_role_already_exists_fault
      | `DBInstanceRoleQuotaExceededFault of db_instance_role_quota_exceeded_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_role_to_db_instance_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceRoleAlreadyExistsFault of db_instance_role_already_exists_fault
      | `DBInstanceRoleQuotaExceededFault of db_instance_role_quota_exceeded_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an Amazon Web Services Identity and Access Management (IAM) role with a DB instance.\n\n\
  \  To add a role to a DB instance, the status of the DB instance must be [available].\n\
  \  \n\
  \    This command doesn't apply to RDS Custom.\n\
  \    "]

module AddSourceIdentifierToSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_source_identifier_to_subscription_message ->
    ( add_source_identifier_to_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_source_identifier_to_subscription_message ->
    ( add_source_identifier_to_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a source identifier to an existing RDS event notification subscription.\n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds metadata tags to an Amazon RDS resource. These tags can also be used with cost allocation \
   reporting to track cost associated with Amazon RDS resources, or used in a Condition statement \
   in an IAM policy for Amazon RDS.\n\n\
  \ For an overview on tagging your relational database resources, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html}Tagging Amazon RDS \
   Resources} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.html}Tagging \
   Amazon Aurora and Amazon RDS Resources}. \n\
  \ "]

module ApplyPendingMaintenanceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a pending maintenance action to a resource (for example, to a DB instance).\n"]

module AuthorizeDBSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
    | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_db_security_group_ingress_message ->
    ( authorize_db_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_db_security_group_ingress_message ->
    ( authorize_db_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationAlreadyExistsFault of authorization_already_exists_fault
      | `AuthorizationQuotaExceededFault of authorization_quota_exceeded_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables ingress to a DBSecurityGroup using one of two forms of authorization. First, EC2 or VPC \
   security groups can be added to the DBSecurityGroup if the application using the database is \
   running on EC2 or VPC instances. Second, IP ranges are available if the application accessing \
   your database is running on the internet. Required parameters for this API are one of CIDR \
   range, EC2SecurityGroupId for VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName \
   or EC2SecurityGroupId for non-VPC).\n\n\
  \ You can't authorize ingress from an EC2 security group in one Amazon Web Services Region to an \
   Amazon RDS DB instance in another. You can't authorize ingress from a VPC security group in one \
   VPC to an Amazon RDS DB instance in another.\n\
  \ \n\
  \  For an overview of CIDR ranges, go to the \
   {{:http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Wikipedia Tutorial}.\n\
  \  \n\
  \    EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a \
   VPC, we recommend that you migrate as soon as possible. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
   EC2-Classic to a VPC} in the {i Amazon EC2 User Guide}, the blog \
   {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
   Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}, and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.Non-VPC2VPC.html}Moving a DB \
   instance not in a VPC into a VPC} in the {i Amazon RDS User Guide}.\n\
  \    \n\
  \     "]

module BacktrackDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    backtrack_db_cluster_message ->
    ( db_cluster_backtrack,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    backtrack_db_cluster_message ->
    ( db_cluster_backtrack Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Backtracks a DB cluster to a specific time, without creating a new DB cluster.\n\n\
  \ For more information on backtracking, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.Backtrack.html} \
   Backtracking an Aurora DB Cluster} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This action applies only to Aurora MySQL DB clusters.\n\
  \   \n\
  \    "]

module CancelExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ExportTaskNotFoundFault of export_task_not_found_fault
    | `InvalidExportTaskStateFault of invalid_export_task_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_export_task_message ->
    ( export_task,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExportTaskNotFoundFault of export_task_not_found_fault
      | `InvalidExportTaskStateFault of invalid_export_task_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_export_task_message ->
    ( export_task Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExportTaskNotFoundFault of export_task_not_found_fault
      | `InvalidExportTaskStateFault of invalid_export_task_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an export task in progress that is exporting a snapshot or cluster to Amazon S3. Any \
   data that has already been written to the S3 bucket isn't removed.\n"]

module CopyDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_parameter_group_message ->
    ( copy_db_cluster_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_parameter_group_message ->
    ( copy_db_cluster_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified DB cluster parameter group.\n\n\
  \  You can't copy a default DB cluster parameter group. Instead, create a new custom DB cluster \
   parameter group, which copies the default parameters and values for the specified DB cluster \
   parameter group family.\n\
  \  \n\
  \   "]

module CopyDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_snapshot_message ->
    ( copy_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_cluster_snapshot_message ->
    ( copy_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies a snapshot of a DB cluster.\n\n\
  \ To copy a DB cluster snapshot from a shared manual DB cluster snapshot, \
   [SourceDBClusterSnapshotIdentifier] must be the Amazon Resource Name (ARN) of the shared DB \
   cluster snapshot.\n\
  \ \n\
  \  You can copy an encrypted DB cluster snapshot from another Amazon Web Services Region. In \
   that case, the Amazon Web Services Region where you call the [CopyDBClusterSnapshot] operation \
   is the destination Amazon Web Services Region for the encrypted DB cluster snapshot to be \
   copied to. To copy an encrypted DB cluster snapshot from another Amazon Web Services Region, \
   you must provide the following values:\n\
  \  \n\
  \   {ul\n\
  \         {-   [KmsKeyId] - The Amazon Web Services Key Management System (Amazon Web Services \
   KMS) key identifier for the key to use to encrypt the copy of the DB cluster snapshot in the \
   destination Amazon Web Services Region.\n\
  \             \n\
  \              }\n\
  \         {-   [TargetDBClusterSnapshotIdentifier] - The identifier for the new copy of the DB \
   cluster snapshot in the destination Amazon Web Services Region.\n\
  \             \n\
  \              }\n\
  \         {-   [SourceDBClusterSnapshotIdentifier] - The DB cluster snapshot identifier for the \
   encrypted DB cluster snapshot to be copied. This identifier must be in the ARN format for the \
   source Amazon Web Services Region and is the same value as the \
   [SourceDBClusterSnapshotIdentifier] in the presigned URL.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To cancel the copy operation once it is in progress, delete the target DB cluster snapshot \
   identified by [TargetDBClusterSnapshotIdentifier] while that DB cluster snapshot is in \
   \"copying\" status.\n\
  \   \n\
  \    For more information on copying encrypted Amazon Aurora DB cluster snapshots from one \
   Amazon Web Services Region to another, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_CopySnapshot.html} Copying \
   a Snapshot} in the {i Amazon Aurora User Guide}.\n\
  \    \n\
  \     For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \     \n\
  \      For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \      "]

module CopyDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_parameter_group_message ->
    ( copy_db_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_parameter_group_message ->
    ( copy_db_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified DB parameter group.\n\n\
  \  You can't copy a default DB parameter group. Instead, create a new custom DB parameter group, \
   which copies the default parameters and values for the specified DB parameter group family.\n\
  \  \n\
  \   "]

module CopyDBSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomAvailabilityZoneNotFoundFault of custom_availability_zone_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_db_snapshot_message ->
    ( copy_db_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomAvailabilityZoneNotFoundFault of custom_availability_zone_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_db_snapshot_message ->
    ( copy_db_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomAvailabilityZoneNotFoundFault of custom_availability_zone_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified DB snapshot. The source DB snapshot must be in the [available] state.\n\n\
  \ You can copy a snapshot from one Amazon Web Services Region to another. In that case, the \
   Amazon Web Services Region where you call the [CopyDBSnapshot] operation is the destination \
   Amazon Web Services Region for the DB snapshot copy.\n\
  \ \n\
  \  This command doesn't apply to RDS Custom.\n\
  \  \n\
  \   For more information about copying snapshots, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html#USER_CopyDBSnapshot}Copying \
   a DB Snapshot} in the {i Amazon RDS User Guide}.\n\
  \   "]

module CopyOptionGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_option_group_message ->
    ( copy_option_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_option_group_message ->
    ( copy_option_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Copies the specified option group.\n"]

module CreateBlueGreenDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentAlreadyExistsFault of blue_green_deployment_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `SourceClusterNotSupportedFault of source_cluster_not_supported_fault
    | `SourceDatabaseNotSupportedFault of source_database_not_supported_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_blue_green_deployment_request ->
    ( create_blue_green_deployment_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentAlreadyExistsFault of blue_green_deployment_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SourceClusterNotSupportedFault of source_cluster_not_supported_fault
      | `SourceDatabaseNotSupportedFault of source_database_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_blue_green_deployment_request ->
    ( create_blue_green_deployment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentAlreadyExistsFault of blue_green_deployment_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SourceClusterNotSupportedFault of source_cluster_not_supported_fault
      | `SourceDatabaseNotSupportedFault of source_database_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a blue/green deployment.\n\n\
  \ A blue/green deployment creates a staging environment that copies the production environment. \
   In a blue/green deployment, the blue environment is the current production environment. The \
   green environment is the staging environment, and it stays in sync with the current production \
   environment.\n\
  \ \n\
  \  You can make changes to the databases in the green environment without affecting production \
   workloads. For example, you can upgrade the major or minor DB engine version, change database \
   parameters, or make schema changes in the staging environment. You can thoroughly test changes \
   in the green environment. When ready, you can switch over the environments to promote the green \
   environment to be the new production environment. The switchover typically takes under a minute.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/blue-green-deployments.html} \
   Using Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon Aurora User \
   Guide}.\n\
  \   "]

module CreateCustomDBEngineVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CreateCustomDBEngineVersionFault of create_custom_db_engine_version_fault
    | `CustomDBEngineVersionAlreadyExistsFault of custom_db_engine_version_already_exists_fault
    | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
    | `CustomDBEngineVersionQuotaExceededFault of custom_db_engine_version_quota_exceeded_fault
    | `Ec2ImagePropertiesNotSupportedFault of ec2_image_properties_not_supported_fault
    | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_db_engine_version_message ->
    ( db_engine_version,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CreateCustomDBEngineVersionFault of create_custom_db_engine_version_fault
      | `CustomDBEngineVersionAlreadyExistsFault of custom_db_engine_version_already_exists_fault
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `CustomDBEngineVersionQuotaExceededFault of custom_db_engine_version_quota_exceeded_fault
      | `Ec2ImagePropertiesNotSupportedFault of ec2_image_properties_not_supported_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_db_engine_version_message ->
    ( db_engine_version Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CreateCustomDBEngineVersionFault of create_custom_db_engine_version_fault
      | `CustomDBEngineVersionAlreadyExistsFault of custom_db_engine_version_already_exists_fault
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `CustomDBEngineVersionQuotaExceededFault of custom_db_engine_version_quota_exceeded_fault
      | `Ec2ImagePropertiesNotSupportedFault of ec2_image_properties_not_supported_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a custom DB engine version (CEV).\n"]

module CreateDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_message ->
    ( create_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_message ->
    ( create_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Aurora DB cluster or Multi-AZ DB cluster.\n\n\
  \ If you create an Aurora DB cluster, the request creates an empty cluster. You must explicitly \
   create the writer instance for your DB cluster using the \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html}CreateDBInstance} \
   operation. If you create a Multi-AZ DB cluster, the request creates a writer and two reader DB \
   instances for you, each in a different Availability Zone.\n\
  \ \n\
  \  You can use the [ReplicationSourceIdentifier] parameter to create an Amazon Aurora DB cluster \
   as a read replica of another DB cluster or Amazon RDS for MySQL or PostgreSQL DB instance. For \
   more information about Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html}What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \  \n\
  \   You can also use the [ReplicationSourceIdentifier] parameter to create a Multi-AZ DB cluster \
   read replica with an RDS for MySQL or PostgreSQL DB instance as the source. For more \
   information about Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html}Multi-AZ \
   DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \   \n\
  \    You can use the [WithExpressConfiguration] parameter to create an Aurora DB Cluster with \
   express configuration and create cluster in seconds. Express configuration provides a cluster \
   with a writer instance and feature specific values set to all other input parameters of this \
   API. \n\
  \    "]

module CreateDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
    | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_endpoint_message ->
    ( db_cluster_endpoint,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
      | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_endpoint_message ->
    ( db_cluster_endpoint Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointAlreadyExistsFault of db_cluster_endpoint_already_exists_fault
      | `DBClusterEndpointQuotaExceededFault of db_cluster_endpoint_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom endpoint and associates it with an Amazon Aurora DB cluster.\n\n\
  \  This action applies only to Aurora DB clusters.\n\
  \  \n\
  \   "]

module CreateDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_parameter_group_message ->
    ( create_db_cluster_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_parameter_group_message ->
    ( create_db_cluster_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB cluster parameter group.\n\n\
  \ Parameters in a DB cluster parameter group apply to all of the instances in a DB cluster.\n\
  \ \n\
  \  A DB cluster parameter group is initially created with the default parameters for the \
   database engine used by instances in the DB cluster. To provide custom values for any of the \
   parameters, you must modify the group after creating it using [ModifyDBClusterParameterGroup]. \
   Once you've created a DB cluster parameter group, you need to associate it with your DB cluster \
   using [ModifyDBCluster].\n\
  \  \n\
  \   When you associate a new DB cluster parameter group with a running Aurora DB cluster, reboot \
   the DB instances in the DB cluster without failover for the new DB cluster parameter group and \
   associated settings to take effect.\n\
  \   \n\
  \    When you associate a new DB cluster parameter group with a running Multi-AZ DB cluster, \
   reboot the DB cluster without failover for the new DB cluster parameter group and associated \
   settings to take effect.\n\
  \    \n\
  \      After you create a DB cluster parameter group, you should wait at least 5 minutes before \
   creating your first DB cluster that uses that DB cluster parameter group as the default \
   parameter group. This allows Amazon RDS to fully complete the create action before the DB \
   cluster parameter group is used as the default for a new DB cluster. This is especially \
   important for parameters that are critical when creating the default database for a DB cluster, \
   such as the character set for the default database defined by the [character_set_database] \
   parameter. You can use the {i Parameter Groups} option of the \
   {{:https://console.aws.amazon.com/rds/}Amazon RDS console} or the [DescribeDBClusterParameters] \
   operation to verify that your DB cluster parameter group has been created or modified.\n\
  \      \n\
  \        For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \        \n\
  \         For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \         "]

module CreateDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_snapshot_message ->
    ( create_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_cluster_snapshot_message ->
    ( create_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of a DB cluster.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module CreateDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB instance.\n\n\
  \ The new DB instance can be an RDS DB instance, or it can be a DB instance in an Aurora DB \
   cluster. For an Aurora DB cluster, you can call this operation multiple times to add more than \
   one DB instance to the cluster.\n\
  \ \n\
  \  For more information about creating an RDS DB instance, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateDBInstance.html} Creating \
   an Amazon RDS DB instance} in the {i Amazon RDS User Guide}.\n\
  \  \n\
  \   For more information about creating a DB instance in an Aurora DB cluster, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.CreateInstance.html} \
   Creating an Amazon Aurora DB cluster} in the {i Amazon Aurora User Guide}.\n\
  \   "]

module CreateDBInstanceReadReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotAllowedFault of db_subnet_group_not_allowed_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_read_replica_message ->
    ( create_db_instance_read_replica_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotAllowedFault of db_subnet_group_not_allowed_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_read_replica_message ->
    ( create_db_instance_read_replica_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotAllowedFault of db_subnet_group_not_allowed_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupFault of invalid_db_subnet_group_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB instance that acts as a read replica for an existing source DB instance or \
   Multi-AZ DB cluster. You can create a read replica for a DB instance running Db2, MariaDB, \
   MySQL, Oracle, PostgreSQL, or SQL Server. You can create a read replica for a Multi-AZ DB \
   cluster running MySQL or PostgreSQL. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html}Working with read \
   replicas} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html#multi-az-db-clusters-migrating-to-instance-with-read-replica}Migrating \
   from a Multi-AZ DB cluster to a DB instance using a read replica} in the {i Amazon RDS User \
   Guide}.\n\n\
  \ Amazon Aurora doesn't support this operation. To create a DB instance for an Aurora DB \
   cluster, use the [CreateDBInstance] operation.\n\
  \ \n\
  \  RDS creates read replicas with backups disabled. All other attributes (including DB security \
   groups and DB parameter groups) are inherited from the source DB instance or cluster, except as \
   specified.\n\
  \  \n\
  \    Your source DB instance or cluster must have backup retention enabled.\n\
  \    \n\
  \     "]

module CreateDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
    | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_parameter_group_message ->
    ( create_db_parameter_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_parameter_group_message ->
    ( create_db_parameter_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupAlreadyExistsFault of db_parameter_group_already_exists_fault
      | `DBParameterGroupQuotaExceededFault of db_parameter_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB parameter group.\n\n\
  \ A DB parameter group is initially created with the default parameters for the database engine \
   used by the DB instance. To provide custom values for any of the parameters, you must modify \
   the group after creating it using [ModifyDBParameterGroup]. Once you've created a DB parameter \
   group, you need to associate it with your DB instance using [ModifyDBInstance]. When you \
   associate a new DB parameter group with a running DB instance, you need to reboot the DB \
   instance without failover for the new DB parameter group and associated settings to take effect.\n\
  \ \n\
  \  This command doesn't apply to RDS Custom.\n\
  \  "]

module CreateDBProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
    | `DBProxyQuotaExceededFault of db_proxy_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_proxy_request ->
    ( create_db_proxy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
      | `DBProxyQuotaExceededFault of db_proxy_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_proxy_request ->
    ( create_db_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
      | `DBProxyQuotaExceededFault of db_proxy_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new DB proxy.\n"]

module CreateDBProxyEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
    | `DBProxyEndpointQuotaExceededFault of db_proxy_endpoint_quota_exceeded_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault
    | `InvalidSubnet of invalid_subnet ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_proxy_endpoint_request ->
    ( create_db_proxy_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
      | `DBProxyEndpointQuotaExceededFault of db_proxy_endpoint_quota_exceeded_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault
      | `InvalidSubnet of invalid_subnet ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_proxy_endpoint_request ->
    ( create_db_proxy_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
      | `DBProxyEndpointQuotaExceededFault of db_proxy_endpoint_quota_exceeded_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault
      | `InvalidSubnet of invalid_subnet ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [DBProxyEndpoint]. Only applies to proxies that are associated with Aurora DB \
   clusters. You can use DB proxy endpoints to specify read/write or read-only access to the DB \
   cluster. You can also use DB proxy endpoints to access a DB proxy through a different VPC than \
   the proxy's default VPC.\n"]

module CreateDBSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSecurityGroupAlreadyExistsFault of db_security_group_already_exists_fault
    | `DBSecurityGroupNotSupportedFault of db_security_group_not_supported_fault
    | `DBSecurityGroupQuotaExceededFault of db_security_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_security_group_message ->
    ( create_db_security_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupAlreadyExistsFault of db_security_group_already_exists_fault
      | `DBSecurityGroupNotSupportedFault of db_security_group_not_supported_fault
      | `DBSecurityGroupQuotaExceededFault of db_security_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_security_group_message ->
    ( create_db_security_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupAlreadyExistsFault of db_security_group_already_exists_fault
      | `DBSecurityGroupNotSupportedFault of db_security_group_not_supported_fault
      | `DBSecurityGroupQuotaExceededFault of db_security_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB security group. DB security groups control access to a DB instance.\n\n\
  \ A DB security group controls access to EC2-Classic DB instances that are not in a VPC.\n\
  \ \n\
  \   EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a \
   VPC, we recommend that you migrate as soon as possible. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
   EC2-Classic to a VPC} in the {i Amazon EC2 User Guide}, the blog \
   {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
   Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}, and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.Non-VPC2VPC.html}Moving a DB \
   instance not in a VPC into a VPC} in the {i Amazon RDS User Guide}.\n\
  \   \n\
  \    "]

module CreateDBShardGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `MaxDBShardGroupLimitReached of max_db_shard_group_limit_reached
    | `NetworkTypeNotSupported of network_type_not_supported
    | `UnsupportedDBEngineVersionFault of unsupported_db_engine_version_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_shard_group_message ->
    ( db_shard_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `MaxDBShardGroupLimitReached of max_db_shard_group_limit_reached
      | `NetworkTypeNotSupported of network_type_not_supported
      | `UnsupportedDBEngineVersionFault of unsupported_db_engine_version_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_shard_group_message ->
    ( db_shard_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `MaxDBShardGroupLimitReached of max_db_shard_group_limit_reached
      | `NetworkTypeNotSupported of network_type_not_supported
      | `UnsupportedDBEngineVersionFault of unsupported_db_engine_version_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB shard group for Aurora Limitless Database. You must enable Aurora Limitless \
   Database to create a DB shard group.\n\n\
  \ Valid for: Aurora DB clusters only\n\
  \ "]

module CreateDBSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_snapshot_message ->
    ( create_db_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_snapshot_message ->
    ( create_db_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of a DB instance. The source DB instance must be in the [available] or \
   [storage-optimization] state.\n"]

module CreateDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
    | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
    | `InvalidSubnet of invalid_subnet ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_subnet_group_message ->
    ( create_db_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_subnet_group_message ->
    ( create_db_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupAlreadyExistsFault of db_subnet_group_already_exists_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupQuotaExceededFault of db_subnet_group_quota_exceeded_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidSubnet of invalid_subnet ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB subnet group. DB subnet groups must contain at least one subnet in at least \
   two AZs in the Amazon Web Services Region.\n"]

module CreateEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_subscription_message ->
    ( create_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionAlreadyExistFault of subscription_already_exist_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an RDS event notification subscription. This operation requires a topic Amazon Resource \
   Name (ARN) created by either the RDS console, the SNS console, or the SNS API. To obtain an ARN \
   with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is \
   displayed in the SNS console.\n\n\
  \ You can specify the type of source ([SourceType]) that you want to be notified of and provide \
   a list of RDS sources ([SourceIds]) that triggers the events. You can also provide a list of \
   event categories ([EventCategories]) for events that you want to be notified of. For example, \
   you can specify [SourceType] = [db-instance], [SourceIds] = [mydbinstance1], [mydbinstance2] \
   and [EventCategories] = [Availability], [Backup].\n\
  \ \n\
  \  If you specify both the [SourceType] and [SourceIds], such as [SourceType] = [db-instance] \
   and [SourceIds] = [myDBInstance1], you are notified of all the [db-instance] events for the \
   specified source. If you specify a [SourceType] but do not specify [SourceIds], you receive \
   notice of the events for that source type for all your RDS sources. If you don't specify either \
   the SourceType or the [SourceIds], you are notified of events generated from all RDS sources \
   belonging to your customer account.\n\
  \  \n\
  \   For more information about subscribing to an event for RDS DB engines, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.Subscribing.html} \
   Subscribing to Amazon RDS event notification} in the {i Amazon RDS User Guide}.\n\
  \   \n\
  \    For more information about subscribing to an event for Aurora DB engines, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Events.Subscribing.html} \
   Subscribing to Amazon RDS event notification} in the {i Amazon Aurora User Guide}.\n\
  \    "]

module CreateGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
    | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Aurora global database spread across multiple Amazon Web Services Regions. The \
   global database contains a single primary cluster with read-write capability, and a read-only \
   secondary cluster that receives data from the primary cluster through high-speed replication \
   performed by the Aurora storage subsystem.\n\n\
  \ You can create a global database that is initially empty, and then create the primary and \
   secondary DB clusters in the global database. Or you can specify an existing Aurora cluster \
   during the create operation, and this cluster becomes the primary cluster of the global \
   database.\n\
  \ \n\
  \   This operation applies only to Aurora DB clusters.\n\
  \   \n\
  \    "]

module CreateIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `IntegrationAlreadyExistsFault of integration_already_exists_fault
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `IntegrationAlreadyExistsFault of integration_already_exists_fault
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a zero-ETL integration with Amazon Redshift.\n"]

module CreateOptionGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
    | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_option_group_message ->
    ( create_option_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
      | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_option_group_message ->
    ( create_option_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupAlreadyExistsFault of option_group_already_exists_fault
      | `OptionGroupQuotaExceededFault of option_group_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new option group. You can create up to 20 option groups.\n\n\
  \ This command doesn't apply to RDS Custom.\n\
  \ "]

module CreateTenantDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tenant_database_message ->
    ( create_tenant_database_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tenant_database_message ->
    ( create_tenant_database_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a tenant database in a DB instance that uses the multi-tenant configuration. Only RDS \
   for Oracle container database (CDB) instances are supported.\n"]

module DeleteBlueGreenDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
    | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_blue_green_deployment_request ->
    ( delete_blue_green_deployment_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_blue_green_deployment_request ->
    ( delete_blue_green_deployment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a blue/green deployment.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon Aurora User Guide}.\n\
  \ "]

module DeleteCustomDBEngineVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
    | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_db_engine_version_message ->
    ( db_engine_version,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_db_engine_version_message ->
    ( db_engine_version Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a custom engine version. To run this command, make sure you meet the following \
   prerequisites:\n\n\
  \ {ul\n\
  \       {-  The CEV must not be the default for RDS Custom. If it is, change the default before \
   running this command.\n\
  \           \n\
  \            }\n\
  \       {-  The CEV must not be associated with an RDS Custom DB instance, RDS Custom instance \
   snapshot, or automated backup of your RDS Custom instance.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Typically, deletion takes a few minutes.\n\
  \   \n\
  \     The MediaImport service that imports files from Amazon S3 to create CEVs isn't integrated \
   with Amazon Web Services CloudTrail. If you turn on data logging for Amazon RDS in CloudTrail, \
   calls to the [DeleteCustomDbEngineVersion] event aren't logged. However, you might see calls \
   from the API gateway that accesses your Amazon S3 bucket. These calls originate from the \
   MediaImport service for the [DeleteCustomDbEngineVersion] event.\n\
  \     \n\
  \       For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-cev.html#custom-cev.delete}Deleting \
   a CEV} in the {i Amazon RDS User Guide}.\n\
  \       "]

module DeleteDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAutomatedBackupQuotaExceededFault of
      db_cluster_automated_backup_quota_exceeded_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_message ->
    ( delete_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupQuotaExceededFault of
        db_cluster_automated_backup_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_message ->
    ( delete_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupQuotaExceededFault of
        db_cluster_automated_backup_quota_exceeded_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB \
   cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual \
   DB cluster snapshots of the specified DB cluster are not deleted.\n\n\
  \ If you're deleting a Multi-AZ DB cluster with read replicas, all cluster members are \
   terminated and read replicas are promoted to standalone instances.\n\
  \ \n\
  \  For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \  \n\
  \   For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \   "]

module DeleteDBClusterAutomatedBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
    | `InvalidDBClusterAutomatedBackupStateFault of invalid_db_cluster_automated_backup_state_fault
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_automated_backup_message ->
    ( delete_db_cluster_automated_backup_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
      | `InvalidDBClusterAutomatedBackupStateFault of
        invalid_db_cluster_automated_backup_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_automated_backup_message ->
    ( delete_db_cluster_automated_backup_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
      | `InvalidDBClusterAutomatedBackupStateFault of
        invalid_db_cluster_automated_backup_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes automated backups using the [DbClusterResourceId] value of the source DB cluster or the \
   Amazon Resource Name (ARN) of the automated backups.\n"]

module DeleteDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_endpoint_message ->
    ( db_cluster_endpoint,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_endpoint_message ->
    ( db_cluster_endpoint Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a custom endpoint and removes it from an Amazon Aurora DB cluster.\n\n\
  \  This action only applies to Aurora DB clusters.\n\
  \  \n\
  \   "]

module DeleteDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified DB cluster parameter group. The DB cluster parameter group to be deleted \
   can't be associated with any DB clusters.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module DeleteDBClusterSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_snapshot_message ->
    ( delete_db_cluster_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_snapshot_message ->
    ( delete_db_cluster_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB cluster snapshot. If the snapshot is being copied, the copy operation is \
   terminated.\n\n\
  \  The DB cluster snapshot must be in the [available] state to be deleted.\n\
  \  \n\
  \    For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \    \n\
  \     For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \     "]

module DeleteDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceAutomatedBackupQuotaExceededFault of
      db_instance_automated_backup_quota_exceeded_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_message ->
    ( delete_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupQuotaExceededFault of
        db_instance_automated_backup_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_message ->
    ( delete_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupQuotaExceededFault of
        db_instance_automated_backup_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously provisioned DB instance. When you delete a DB instance, all automated \
   backups for that instance are deleted and can't be recovered. However, manual DB snapshots of \
   the DB instance aren't deleted.\n\n\
  \ If you request a final DB snapshot, the status of the Amazon RDS DB instance is [deleting] \
   until the DB snapshot is created. This operation can't be canceled or reverted after it begins. \
   To monitor the status of this operation, use [DescribeDBInstance].\n\
  \ \n\
  \  When a DB instance is in a failure state and has a status of [failed], \
   [incompatible-restore], or [incompatible-network], you can only delete it when you skip \
   creation of the final snapshot with the [SkipFinalSnapshot] parameter.\n\
  \  \n\
  \   If the specified DB instance is part of an Amazon Aurora DB cluster, you can't delete the DB \
   instance if both of the following conditions are true:\n\
  \   \n\
  \    {ul\n\
  \          {-  The DB cluster is a read replica of another Amazon Aurora DB cluster.\n\
  \              \n\
  \               }\n\
  \          {-  The DB instance is the only instance in the DB cluster.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   To delete a DB instance in this case, first use the [PromoteReadReplicaDBCluster] operation \
   to promote the DB cluster so that it's no longer a read replica. After the promotion completes, \
   use the [DeleteDBInstance] operation to delete the final instance in the DB cluster.\n\
  \   \n\
  \     For RDS Custom DB instances, deleting the DB instance permanently deletes the EC2 instance \
   and the associated EBS volumes. Make sure that you don't terminate or delete these resources \
   before you delete the DB instance. Otherwise, deleting the DB instance and creation of the \
   final snapshot might fail.\n\
  \     \n\
  \      "]

module DeleteDBInstanceAutomatedBackup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
    | `InvalidDBInstanceAutomatedBackupStateFault of
      invalid_db_instance_automated_backup_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_automated_backup_message ->
    ( delete_db_instance_automated_backup_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
      | `InvalidDBInstanceAutomatedBackupStateFault of
        invalid_db_instance_automated_backup_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_automated_backup_message ->
    ( delete_db_instance_automated_backup_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
      | `InvalidDBInstanceAutomatedBackupStateFault of
        invalid_db_instance_automated_backup_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes automated backups using the [DbiResourceId] value of the source DB instance or the \
   Amazon Resource Name (ARN) of the automated backups.\n"]

module DeleteDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_parameter_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified DB parameter group. The DB parameter group to be deleted can't be \
   associated with any DB instances.\n"]

module DeleteDBProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_proxy_request ->
    ( delete_db_proxy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_proxy_request ->
    ( delete_db_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing DB proxy.\n"]

module DeleteDBProxyEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_proxy_endpoint_request ->
    ( delete_db_proxy_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_proxy_endpoint_request ->
    ( delete_db_proxy_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a [DBProxyEndpoint]. Doing so removes the ability to access the DB proxy using the \
   endpoint that you defined. The endpoint that you delete might have provided capabilities such \
   as read/write or read-only operations, or using a different VPC than the DB proxy's default VPC.\n"]

module DeleteDBSecurityGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_security_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB security group.\n\n\
  \ The specified DB security group must not be associated with any DB instances.\n\
  \ \n\
  \   EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a \
   VPC, we recommend that you migrate as soon as possible. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
   EC2-Classic to a VPC} in the {i Amazon EC2 User Guide}, the blog \
   {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
   Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}, and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.Non-VPC2VPC.html}Moving a DB \
   instance not in a VPC into a VPC} in the {i Amazon RDS User Guide}.\n\
  \   \n\
  \    "]

module DeleteDBShardGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_shard_group_message ->
    ( db_shard_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_shard_group_message ->
    ( db_shard_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Aurora Limitless Database DB shard group.\n"]

module DeleteDBSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_snapshot_message ->
    ( delete_db_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_snapshot_message ->
    ( delete_db_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB snapshot. If the snapshot is being copied, the copy operation is terminated.\n\n\
  \  The DB snapshot must be in the [available] state to be deleted.\n\
  \  \n\
  \   "]

module DeleteDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_db_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_subnet_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidDBSubnetStateFault of invalid_db_subnet_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a DB subnet group.\n\n\
  \  The specified database subnet group must not be associated with any DB instances.\n\
  \  \n\
  \   "]

module DeleteEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_subscription_message ->
    ( delete_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidEventSubscriptionStateFault of invalid_event_subscription_state_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an RDS event notification subscription.\n"]

module DeleteGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_global_cluster_message ->
    ( delete_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_global_cluster_message ->
    ( delete_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a global database cluster. The primary and secondary clusters must already be detached \
   or destroyed first.\n\n\
  \  This action only applies to Aurora DB clusters.\n\
  \  \n\
  \   "]

module DeleteIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InvalidIntegrationStateFault of invalid_integration_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidIntegrationStateFault of invalid_integration_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidIntegrationStateFault of invalid_integration_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a zero-ETL integration with Amazon Redshift.\n"]

module DeleteOptionGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_option_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_option_group_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing option group.\n"]

module DeleteTenantDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tenant_database_message ->
    ( delete_tenant_database_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tenant_database_message ->
    ( delete_tenant_database_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a tenant database from your DB instance. This command only applies to RDS for Oracle \
   container database (CDB) instances.\n\n\
  \ You can't delete a tenant database when it is the only tenant in the DB instance.\n\
  \ "]

module DeregisterDBProxyTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_db_proxy_targets_request ->
    ( deregister_db_proxy_targets_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_db_proxy_targets_request ->
    ( deregister_db_proxy_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove the association between one or more [DBProxyTarget] data structures and a \
   [DBProxyTargetGroup].\n"]

module DescribeAccountAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    (account_attributes_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_message ->
    ( account_attributes_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the attributes for a customer account. The attributes include Amazon RDS quotas \
   for the account, such as the number of DB instances allowed. The description for a quota \
   includes the quota name, current usage toward that quota, and the quota's maximum value.\n\n\
  \ This command doesn't take any parameters.\n\
  \ "]

module DescribeBlueGreenDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_blue_green_deployments_request ->
    ( describe_blue_green_deployments_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_blue_green_deployments_request ->
    ( describe_blue_green_deployments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more blue/green deployments.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/blue-green-deployments.html} \
   Using Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon Aurora User \
   Guide}.\n\
  \ "]

module DescribeCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CertificateNotFoundFault of certificate_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificates_message ->
    ( certificate_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificates_message ->
    ( certificate_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the set of certificate authority (CA) certificates provided by Amazon RDS for this Amazon \
   Web Services account.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html}Using SSL/TLS \
   to encrypt a connection to a DB instance} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL.html} Using \
   SSL/TLS to encrypt a connection to a DB cluster} in the {i Amazon Aurora User Guide}.\n\
  \ "]

module DescribeDBClusterAutomatedBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_automated_backups_message ->
    ( db_cluster_automated_backup_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_automated_backups_message ->
    ( db_cluster_automated_backup_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays backups for both current and deleted DB clusters. For example, use this operation to \
   find details about automated backups for previously deleted clusters. Current clusters are \
   returned for both the [DescribeDBClusterAutomatedBackups] and [DescribeDBClusters] operations.\n\n\
  \ All parameters are optional.\n\
  \ "]

module DescribeDBClusterBacktracks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterBacktrackNotFoundFault of db_cluster_backtrack_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_backtracks_message ->
    ( db_cluster_backtrack_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterBacktrackNotFoundFault of db_cluster_backtrack_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_backtracks_message ->
    ( db_cluster_backtrack_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterBacktrackNotFoundFault of db_cluster_backtrack_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about backtracks for a DB cluster.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This action only applies to Aurora MySQL DB clusters.\n\
  \   \n\
  \    "]

module DescribeDBClusterEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_endpoints_message ->
    ( db_cluster_endpoint_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_endpoints_message ->
    ( db_cluster_endpoint_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about endpoints for an Amazon Aurora DB cluster.\n\n\
  \  This action only applies to Aurora DB clusters.\n\
  \  \n\
  \   "]

module DescribeDBClusterParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameter_groups_message ->
    ( db_cluster_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameter_groups_message ->
    ( db_cluster_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [DBClusterParameterGroup] descriptions. If a [DBClusterParameterGroupName] \
   parameter is specified, the list will contain only the description of the specified DB cluster \
   parameter group.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module DescribeDBClusterParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameters_message ->
    ( db_cluster_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_parameters_message ->
    ( db_cluster_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the detailed parameter list for a particular DB cluster parameter group.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module DescribeDBClusterSnapshotAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshot_attributes_message ->
    ( describe_db_cluster_snapshot_attributes_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshot_attributes_message ->
    ( describe_db_cluster_snapshot_attributes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DB cluster snapshot attribute names and values for a manual DB cluster \
   snapshot.\n\n\
  \ When sharing snapshots with other Amazon Web Services accounts, \
   [DescribeDBClusterSnapshotAttributes] returns the [restore] attribute and a list of IDs for the \
   Amazon Web Services accounts that are authorized to copy or restore the manual DB cluster \
   snapshot. If [all] is included in the list of values for the [restore] attribute, then the \
   manual DB cluster snapshot is public and can be copied or restored by all Amazon Web Services \
   accounts.\n\
  \ \n\
  \  To add or remove access for an Amazon Web Services account to copy or restore a manual DB \
   cluster snapshot, or to make the manual DB cluster snapshot public or private, use the \
   [ModifyDBClusterSnapshotAttribute] API action.\n\
  \  "]

module DescribeDBClusterSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshots_message ->
    ( db_cluster_snapshot_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_cluster_snapshots_message ->
    ( db_cluster_snapshot_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about DB cluster snapshots. This API action supports pagination.\n\n\
  \ For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module DescribeDBClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_clusters_message ->
    ( db_cluster_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_clusters_message ->
    ( db_cluster_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBClusterNotFoundFault of db_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes existing Amazon Aurora DB clusters and Multi-AZ DB clusters. This API supports \
   pagination.\n\n\
  \ For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  \n\
  \   This operation can also return information for Amazon Neptune DB instances and Amazon \
   DocumentDB instances.\n\
  \   "]

module DescribeDBEngineVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_engine_versions_message ->
    (db_engine_version_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_engine_versions_message ->
    ( db_engine_version_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the properties of specific versions of DB engines.\n"]

module DescribeDBInstanceAutomatedBackups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instance_automated_backups_message ->
    ( db_instance_automated_backup_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instance_automated_backups_message ->
    ( db_instance_automated_backup_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays backups for both current and deleted instances. For example, use this operation to \
   find details about automated backups for previously deleted instances. Current instances with \
   retention periods greater than zero (0) are returned for both the \
   [DescribeDBInstanceAutomatedBackups] and [DescribeDBInstances] operations.\n\n\
  \ All parameters are optional.\n\
  \ "]

module DescribeDBInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBInstanceNotFoundFault of db_instance_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instances_message ->
    ( db_instance_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_instances_message ->
    ( db_instance_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes provisioned RDS instances. This API supports pagination.\n\n\
  \  This operation can also return information for Amazon Neptune DB instances and Amazon \
   DocumentDB instances.\n\
  \  \n\
  \   "]

module DescribeDBLogFiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBInstanceNotReadyFault of db_instance_not_ready_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_log_files_message ->
    ( describe_db_log_files_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceNotReadyFault of db_instance_not_ready_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_log_files_message ->
    ( describe_db_log_files_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceNotReadyFault of db_instance_not_ready_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DB log files for the DB instance.\n\n\
  \ This command doesn't apply to RDS Custom.\n\
  \ "]

module DescribeDBMajorEngineVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_major_engine_versions_request ->
    (describe_db_major_engine_versions_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_major_engine_versions_request ->
    ( describe_db_major_engine_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the properties of specific major versions of DB engines.\n"]

module DescribeDBParameterGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameter_groups_message ->
    ( db_parameter_groups_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameter_groups_message ->
    ( db_parameter_groups_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [DBParameterGroup] descriptions. If a [DBParameterGroupName] is specified, \
   the list will contain only the description of the specified DB parameter group.\n"]

module DescribeDBParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameters_message ->
    ( db_parameter_group_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_parameters_message ->
    ( db_parameter_group_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the detailed parameter list for a particular DB parameter group.\n"]

module DescribeDBProxies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBProxyNotFoundFault of db_proxy_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxies_request ->
    ( describe_db_proxies_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBProxyNotFoundFault of db_proxy_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxies_request ->
    ( describe_db_proxies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `DBProxyNotFoundFault of db_proxy_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about DB proxies.\n"]

module DescribeDBProxyEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_endpoints_request ->
    ( describe_db_proxy_endpoints_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_endpoints_request ->
    ( describe_db_proxy_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about DB proxy endpoints.\n"]

module DescribeDBProxyTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_target_groups_request ->
    ( describe_db_proxy_target_groups_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_target_groups_request ->
    ( describe_db_proxy_target_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about DB proxy target groups, represented by [DBProxyTargetGroup] data \
   structures.\n"]

module DescribeDBProxyTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_targets_request ->
    ( describe_db_proxy_targets_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_proxy_targets_request ->
    ( describe_db_proxy_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBProxyTargetNotFoundFault of db_proxy_target_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about [DBProxyTarget] objects. This API supports pagination.\n"]

module DescribeDBRecommendations : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_recommendations_message ->
    (db_recommendations_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_recommendations_message ->
    ( db_recommendations_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the recommendations to resolve the issues for your DB instances, DB clusters, and DB \
   parameter groups.\n"]

module DescribeDBSecurityGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_security_groups_message ->
    ( db_security_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_security_groups_message ->
    ( db_security_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [DBSecurityGroup] descriptions. If a [DBSecurityGroupName] is specified, the \
   list will contain only the descriptions of the specified DB security group.\n\n\
  \  EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a \
   VPC, we recommend that you migrate as soon as possible. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
   EC2-Classic to a VPC} in the {i Amazon EC2 User Guide}, the blog \
   {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
   Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}, and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.Non-VPC2VPC.html}Moving a DB \
   instance not in a VPC into a VPC} in the {i Amazon RDS User Guide}.\n\
  \  \n\
  \   "]

module DescribeDBShardGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_shard_groups_message ->
    ( describe_db_shard_groups_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_shard_groups_message ->
    ( describe_db_shard_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes existing Aurora Limitless Database DB shard groups.\n"]

module DescribeDBSnapshotAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshot_attributes_message ->
    ( describe_db_snapshot_attributes_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshot_attributes_message ->
    ( describe_db_snapshot_attributes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DB snapshot attribute names and values for a manual DB snapshot.\n\n\
  \ When sharing snapshots with other Amazon Web Services accounts, [DescribeDBSnapshotAttributes] \
   returns the [restore] attribute and a list of IDs for the Amazon Web Services accounts that are \
   authorized to copy or restore the manual DB snapshot. If [all] is included in the list of \
   values for the [restore] attribute, then the manual DB snapshot is public and can be copied or \
   restored by all Amazon Web Services accounts.\n\
  \ \n\
  \  To add or remove access for an Amazon Web Services account to copy or restore a manual DB \
   snapshot, or to make the manual DB snapshot public or private, use the \
   [ModifyDBSnapshotAttribute] API action.\n\
  \  "]

module DescribeDBSnapshotTenantDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshot_tenant_databases_message ->
    ( db_snapshot_tenant_databases_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshot_tenant_databases_message ->
    ( db_snapshot_tenant_databases_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the tenant databases that exist in a DB snapshot. This command only applies to RDS \
   for Oracle DB instances in the multi-tenant configuration.\n\n\
  \ You can use this command to inspect the tenant databases within a snapshot before restoring \
   it. You can't directly interact with the tenant databases in a DB snapshot. If you restore a \
   snapshot that was taken from DB instance using the multi-tenant configuration, you restore all \
   its tenant databases.\n\
  \ "]

module DescribeDBSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshots_message ->
    ( db_snapshot_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_snapshots_message ->
    ( db_snapshot_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about DB snapshots. This API action supports pagination.\n"]

module DescribeDBSubnetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_db_subnet_groups_message ->
    ( db_subnet_group_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_db_subnet_groups_message ->
    ( db_subnet_group_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of DBSubnetGroup descriptions. If a DBSubnetGroupName is specified, the list \
   will contain only the descriptions of the specified DBSubnetGroup.\n\n\
  \ For an overview of CIDR ranges, go to the \
   {{:http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Wikipedia Tutorial}.\n\
  \ "]

module DescribeEngineDefaultClusterParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_cluster_parameters_message ->
    ( describe_engine_default_cluster_parameters_result,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_cluster_parameters_message ->
    ( describe_engine_default_cluster_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the default engine and system parameter information for the cluster database engine.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ "]

module DescribeEngineDefaultParameters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    (describe_engine_default_parameters_result, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_engine_default_parameters_message ->
    ( describe_engine_default_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the default engine and system parameter information for the specified database engine.\n"]

module DescribeEventCategories : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    (event_categories_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_categories_message ->
    ( event_categories_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays a list of categories for all event source types, or, if specified, for a specified \
   source type. You can also see this list in the \"Amazon RDS event categories and event \
   messages\" section of the \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.Messages.html} {i Amazon \
   RDS User Guide} } or the \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Events.Messages.html} {i \
   Amazon Aurora User Guide} }.\n"]

module DescribeEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_subscriptions_message ->
    ( event_subscriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the subscription descriptions for a customer account. The description for a \
   subscription includes [SubscriptionName], [SNSTopicARN], [CustomerID], [SourceType], \
   [SourceID], [CreationTime], and [Status].\n\n\
  \ If you specify a [SubscriptionName], lists the description for that subscription.\n\
  \ "]

module DescribeEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    (events_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( events_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns events related to DB instances, DB clusters, DB parameter groups, DB security groups, \
   DB snapshots, DB cluster snapshots, and RDS Proxies for the past 14 days. Events specific to a \
   particular DB instance, DB cluster, DB parameter group, DB security group, DB snapshot, DB \
   cluster snapshot group, or RDS Proxy can be obtained by providing the name as a parameter.\n\n\
  \ For more information on working with events, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/working-with-events.html}Monitoring \
   Amazon RDS events} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/working-with-events.html}Monitoring \
   Amazon Aurora events} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   By default, RDS returns events that were generated in the past hour.\n\
  \   \n\
  \    "]

module DescribeExportTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ExportTaskNotFoundFault of export_task_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_message ->
    ( export_tasks_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExportTaskNotFoundFault of export_task_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_export_tasks_message ->
    ( export_tasks_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExportTaskNotFoundFault of export_task_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a snapshot or cluster export to Amazon S3. This API operation \
   supports pagination.\n"]

module DescribeGlobalClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_global_clusters_message ->
    ( global_clusters_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_global_clusters_message ->
    ( global_clusters_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about Aurora global database clusters. This API supports pagination.\n\n\
  \ For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This action only applies to Aurora DB clusters.\n\
  \   \n\
  \    "]

module DescribeIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `IntegrationNotFoundFault of integration_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_message ->
    ( describe_integrations_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_message ->
    ( describe_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationNotFoundFault of integration_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe one or more zero-ETL integrations with Amazon Redshift.\n"]

module DescribeOptionGroupOptions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_option_group_options_message ->
    (option_group_options_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_option_group_options_message ->
    ( option_group_options_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all available options for the specified engine.\n"]

module DescribeOptionGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OptionGroupNotFoundFault of option_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_option_groups_message ->
    ( option_groups,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupNotFoundFault of option_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_option_groups_message ->
    ( option_groups Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OptionGroupNotFoundFault of option_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the available option groups.\n"]

module DescribeOrderableDBInstanceOptions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_db_instance_options_message ->
    (orderable_db_instance_options_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_orderable_db_instance_options_message ->
    ( orderable_db_instance_options_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the orderable DB instance options for a specified DB engine.\n"]

module DescribePendingMaintenanceActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( pending_maintenance_actions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pending_maintenance_actions_message ->
    ( pending_maintenance_actions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resources (for example, DB instances) that have at least one pending \
   maintenance action.\n\n\
  \ This API follows an eventual consistency model. This means that the result of the \
   [DescribePendingMaintenanceActions] command might not be immediately visible to all subsequent \
   RDS commands. Keep this in mind when you use [DescribePendingMaintenanceActions] immediately \
   after using a previous API command such as [ApplyPendingMaintenanceActions].\n\
  \ "]

module DescribeReservedDBInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReservedDBInstanceNotFoundFault of reserved_db_instance_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_db_instances_message ->
    ( reserved_db_instance_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstanceNotFoundFault of reserved_db_instance_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_db_instances_message ->
    ( reserved_db_instance_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstanceNotFoundFault of reserved_db_instance_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about reserved DB instances for this account, or about a specified reserved \
   DB instance.\n"]

module DescribeReservedDBInstancesOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_db_instances_offerings_message ->
    ( reserved_db_instances_offering_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_reserved_db_instances_offerings_message ->
    ( reserved_db_instances_offering_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists available reserved DB instance offerings.\n"]

module DescribeServerlessV2PlatformVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_v2_platform_versions_message ->
    (serverless_v2_platform_versions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_serverless_v2_platform_versions_message ->
    ( serverless_v2_platform_versions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the properties of specific platform versions for Aurora Serverless v2.\n"]

module DescribeSourceRegions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_source_regions_message ->
    (source_region_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_source_regions_message ->
    ( source_region_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the source Amazon Web Services Regions where the current Amazon Web Services \
   Region can create a read replica, copy a DB snapshot from, or replicate automated backups \
   from.\n\n\
  \ Use this operation to determine whether cross-Region features are supported between other \
   Regions and your current Region. This operation supports pagination.\n\
  \ \n\
  \  To return information about the Regions that are enabled for your account, or all Regions, \
   use the EC2 operation [DescribeRegions]. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeRegions.html} \
   DescribeRegions} in the {i Amazon EC2 API Reference}.\n\
  \  "]

module DescribeTenantDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `DBInstanceNotFoundFault of db_instance_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tenant_databases_message ->
    ( tenant_databases_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tenant_databases_message ->
    ( tenant_databases_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the tenant databases in a DB instance that uses the multi-tenant configuration. Only \
   RDS for Oracle CDB instances are supported.\n"]

module DescribeValidDBInstanceModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_valid_db_instance_modifications_message ->
    ( describe_valid_db_instance_modifications_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_valid_db_instance_modifications_message ->
    ( describe_valid_db_instance_modifications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can call [DescribeValidDBInstanceModifications] to learn what modifications you can make to \
   your DB instance. You can use this information when you call [ModifyDBInstance].\n\n\
  \ This command doesn't apply to RDS Custom.\n\
  \ "]

module DisableHttpEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_http_endpoint_request ->
    ( disable_http_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_http_endpoint_request ->
    ( disable_http_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the HTTP endpoint for the specified DB cluster. Disabling this endpoint disables RDS \
   Data API.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html}Using RDS Data \
   API} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This operation applies only to Aurora Serverless v2 and provisioned DB clusters. To disable \
   the HTTP endpoint for Aurora Serverless v1 DB clusters, use the [EnableHttpEndpoint] parameter \
   of the [ModifyDBCluster] operation.\n\
  \   \n\
  \    "]

module DownloadDBLogFilePortion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBInstanceNotReadyFault of db_instance_not_ready_fault
    | `DBLogFileNotFoundFault of db_log_file_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    download_db_log_file_portion_message ->
    ( download_db_log_file_portion_details,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceNotReadyFault of db_instance_not_ready_fault
      | `DBLogFileNotFoundFault of db_log_file_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    download_db_log_file_portion_message ->
    ( download_db_log_file_portion_details Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceNotReadyFault of db_instance_not_ready_fault
      | `DBLogFileNotFoundFault of db_log_file_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Downloads all or a portion of the specified log file, up to 1 MB in size.\n\n\
  \ This command doesn't apply to RDS Custom.\n\
  \ \n\
  \   This operation uses resources on database instances. Because of this, we recommend \
   publishing database logs to CloudWatch and then using the GetLogEvents operation. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html}GetLogEvents} \
   in the {i Amazon CloudWatch Logs API Reference}.\n\
  \   \n\
  \    "]

module EnableHttpEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidResourceStateFault of invalid_resource_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_http_endpoint_request ->
    ( enable_http_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_http_endpoint_request ->
    ( enable_http_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidResourceStateFault of invalid_resource_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the HTTP endpoint for the DB cluster. By default, the HTTP endpoint isn't enabled.\n\n\
  \ When enabled, this endpoint provides a connectionless web service API (RDS Data API) for \
   running SQL queries on the Aurora DB cluster. You can also query your database from inside the \
   RDS console with the RDS query editor.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/data-api.html}Using RDS Data \
   API} in the {i Amazon Aurora User Guide}.\n\
  \  \n\
  \    This operation applies only to Aurora Serverless v2 and provisioned DB clusters. To enable \
   the HTTP endpoint for Aurora Serverless v1 DB clusters, use the [EnableHttpEndpoint] parameter \
   of the [ModifyDBCluster] operation.\n\
  \    \n\
  \     "]

module FailoverDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_db_cluster_message ->
    ( failover_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_db_cluster_message ->
    ( failover_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Forces a failover for a DB cluster.\n\n\
  \ For an Aurora DB cluster, failover for a DB cluster promotes one of the Aurora Replicas \
   (read-only instances) in the DB cluster to be the primary DB instance (the cluster writer).\n\
  \ \n\
  \  For a Multi-AZ DB cluster, after RDS terminates the primary DB instance, the internal \
   monitoring system detects that the primary DB instance is unhealthy and promotes a readable \
   standby (read-only instances) in the DB cluster to be the primary DB instance (the cluster \
   writer). Failover times are typically less than 35 seconds.\n\
  \  \n\
  \   An Amazon Aurora DB cluster automatically fails over to an Aurora Replica, if one exists, \
   when the primary DB instance fails. A Multi-AZ DB cluster automatically fails over to a \
   readable standby DB instance when the primary DB instance fails.\n\
  \   \n\
  \    To simulate a failure of a primary instance for testing, you can force a failover. Because \
   each instance in a DB cluster has its own endpoint address, make sure to clean up and \
   re-establish any existing connections that use those endpoint addresses when the failover is \
   complete.\n\
  \    \n\
  \     For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \     \n\
  \      For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \      "]

module FailoverGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    failover_global_cluster_message ->
    ( failover_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    failover_global_cluster_message ->
    ( failover_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Promotes the specified secondary DB cluster to be the primary DB cluster in the global database \
   cluster to fail over or switch over a global database. Switchover operations were previously \
   called \"managed planned failovers.\"\n\n\
  \  Although this operation can be used either to fail over or to switch over a global database \
   cluster, its intended use is for global database failover. To switch over a global database \
   cluster, we recommend that you use the [SwitchoverGlobalCluster] operation instead.\n\
  \  \n\
  \    How you use this operation depends on whether you are failing over or switching over your \
   global database cluster:\n\
  \    \n\
  \     {ul\n\
  \           {-  Failing over - Specify the [AllowDataLoss] parameter and don't specify the \
   [Switchover] parameter.\n\
  \               \n\
  \                }\n\
  \           {-  Switching over - Specify the [Switchover] parameter or omit it, but don't \
   specify the [AllowDataLoss] parameter.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b About failing over and switching over} \n\
  \   \n\
  \    While failing over and switching over a global database cluster both change the primary DB \
   cluster, you use these operations for different reasons:\n\
  \    \n\
  \     {ul\n\
  \           {-   {i Failing over} - Use this operation to respond to an unplanned event, such as \
   a Regional disaster in the primary Region. Failing over can result in a loss of write \
   transaction data that wasn't replicated to the chosen secondary before the failover event \
   occurred. However, the recovery process that promotes a DB instance on the chosen seconday DB \
   cluster to be the primary writer DB instance guarantees that the data is in a transactionally \
   consistent state.\n\
  \               \n\
  \                For more information about failing over an Amazon Aurora global database, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html#aurora-global-database-failover.managed-unplanned}Performing \
   managed failovers for Aurora global databases} in the {i Amazon Aurora User Guide}.\n\
  \                \n\
  \                 }\n\
  \           {-   {i Switching over} - Use this operation on a healthy global database cluster \
   for planned events, such as Regional rotation or to fail back to the original primary DB \
   cluster after a failover operation. With this operation, there is no data loss.\n\
  \               \n\
  \                For more information about switching over an Amazon Aurora global database, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html#aurora-global-database-disaster-recovery.managed-failover}Performing \
   switchovers for Aurora global databases} in the {i Amazon Aurora User Guide}.\n\
  \                \n\
  \                 }\n\
  \           }\n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags on an Amazon RDS resource.\n\n\
  \ For an overview on tagging an Amazon RDS resource, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html}Tagging Amazon RDS \
   Resources} in the {i Amazon RDS User Guide} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.html}Tagging \
   Amazon Aurora and Amazon RDS Resources} in the {i Amazon Aurora User Guide}.\n\
  \ "]

module ModifyActivityStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_activity_stream_request ->
    ( modify_activity_stream_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_activity_stream_request ->
    ( modify_activity_stream_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the audit policy state of a database activity stream to either locked (default) or \
   unlocked. A locked policy is read-only, whereas an unlocked policy is read/write. If your \
   activity stream is started and locked, you can unlock it, customize your audit policy, and then \
   lock your activity stream. Restarting the activity stream isn't required. For more information, \
   see {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/DBActivityStreams.Modifying.html} \
   Modifying a database activity stream} in the {i Amazon RDS User Guide}. \n\n\
  \ This operation is supported for RDS for Oracle and Microsoft SQL Server.\n\
  \ "]

module ModifyCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CertificateNotFoundFault of certificate_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_certificates_message ->
    ( modify_certificates_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_certificates_message ->
    ( modify_certificates_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundFault of certificate_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Override the system-default Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificate \
   for Amazon RDS for new DB instances, or remove the override.\n\n\
  \ By using this operation, you can specify an RDS-approved SSL/TLS certificate for new DB \
   instances that is different from the default certificate provided by RDS. You can also use this \
   operation to remove the override, so that new DB instances use the default certificate provided \
   by RDS.\n\
  \ \n\
  \  You might need to override the default certificate in the following situations:\n\
  \  \n\
  \   {ul\n\
  \         {-  You already migrated your applications to support the latest certificate authority \
   (CA) certificate, but the new CA certificate is not yet the RDS default CA certificate for the \
   specified Amazon Web Services Region.\n\
  \             \n\
  \              }\n\
  \         {-  RDS has already moved to a new default CA certificate for the specified Amazon Web \
   Services Region, but you are still in the process of supporting the new CA certificate. In this \
   case, you temporarily need additional time to finish your application changes.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information about rotating your SSL/TLS certificate for RDS DB engines, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL-certificate-rotation.html} \
   Rotating Your SSL/TLS Certificate} in the {i Amazon RDS User Guide}.\n\
  \   \n\
  \    For more information about rotating your SSL/TLS certificate for Aurora DB engines, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/UsingWithRDS.SSL-certificate-rotation.html} \
   Rotating Your SSL/TLS Certificate} in the {i Amazon Aurora User Guide}.\n\
  \    "]

module ModifyCurrentDBClusterCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterCapacityFault of invalid_db_cluster_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_current_db_cluster_capacity_message ->
    ( db_cluster_capacity_info,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterCapacityFault of invalid_db_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_current_db_cluster_capacity_message ->
    ( db_cluster_capacity_info Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterCapacityFault of invalid_db_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Set the capacity of an Aurora Serverless v1 DB cluster to a specific value.\n\n\
  \ Aurora Serverless v1 scales seamlessly based on the workload on the DB cluster. In some cases, \
   the capacity might not scale fast enough to meet a sudden change in workload, such as a large \
   number of new transactions. Call [ModifyCurrentDBClusterCapacity] to set the capacity \
   explicitly.\n\
  \ \n\
  \  After this call sets the DB cluster capacity, Aurora Serverless v1 can automatically scale \
   the DB cluster based on the cooldown period for scaling up and the cooldown period for scaling \
   down.\n\
  \  \n\
  \   For more information about Aurora Serverless v1, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.html}Using \
   Amazon Aurora Serverless v1} in the {i Amazon Aurora User Guide}.\n\
  \   \n\
  \     If you call [ModifyCurrentDBClusterCapacity] with the default [TimeoutAction], connections \
   that prevent Aurora Serverless v1 from finding a scaling point might be dropped. For more \
   information about scaling points, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.auto-scaling} \
   Autoscaling for Aurora Serverless v1} in the {i Amazon Aurora User Guide}.\n\
  \     \n\
  \        This operation only applies to Aurora Serverless v1 DB clusters.\n\
  \        \n\
  \         "]

module ModifyCustomDBEngineVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
    | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_custom_db_engine_version_message ->
    ( db_engine_version,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_custom_db_engine_version_message ->
    ( db_engine_version Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomDBEngineVersionNotFoundFault of custom_db_engine_version_not_found_fault
      | `InvalidCustomDBEngineVersionStateFault of invalid_custom_db_engine_version_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the status of a custom engine version (CEV). You can find CEVs to modify by calling \
   [DescribeDBEngineVersions].\n\n\
  \  The MediaImport service that imports files from Amazon S3 to create CEVs isn't integrated \
   with Amazon Web Services CloudTrail. If you turn on data logging for Amazon RDS in CloudTrail, \
   calls to the [ModifyCustomDbEngineVersion] event aren't logged. However, you might see calls \
   from the API gateway that accesses your Amazon S3 bucket. These calls originate from the \
   MediaImport service for the [ModifyCustomDbEngineVersion] event.\n\
  \  \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-cev.html#custom-cev.modify}Modifying \
   CEV status} in the {i Amazon RDS User Guide}.\n\
  \    "]

module ModifyDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotAvailableFault of storage_type_not_available_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotAvailableFault of storage_type_not_available_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotAvailableFault of storage_type_not_available_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings of an Amazon Aurora DB cluster or a Multi-AZ DB cluster. You can change \
   one or more settings by specifying these parameters and the new values in the request.\n\n\
  \ For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide}.\n\
  \  "]

module ModifyDBClusterEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_endpoint_message ->
    ( db_cluster_endpoint,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_endpoint_message ->
    ( db_cluster_endpoint Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the properties of an endpoint in an Amazon Aurora DB cluster.\n\n\
  \  This operation only applies to Aurora DB clusters.\n\
  \  \n\
  \   "]

module ModifyDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, \
   submit a list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum \
   of 20 parameters can be modified in a single request.\n\n\
  \  There are two types of parameters - dynamic parameters and static parameters. Changes to \
   dynamic parameters are applied to the DB cluster immediately without a reboot. Changes to \
   static parameters are applied only after the DB cluster is rebooted, which can be done using \
   [RebootDBCluster] operation. You can use the {i Parameter Groups} option of the \
   {{:https://console.aws.amazon.com/rds/}Amazon RDS console} or the [DescribeDBClusterParameters] \
   operation to verify that your DB cluster parameter group has been created or modified.\n\
  \  \n\
  \    For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \    \n\
  \     For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \     "]

module ModifyDBClusterSnapshotAttribute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_snapshot_attribute_message ->
    ( modify_db_cluster_snapshot_attribute_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_snapshot_attribute_message ->
    ( modify_db_cluster_snapshot_attribute_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an attribute and values to, or removes an attribute and values from, a manual DB cluster \
   snapshot.\n\n\
  \ To share a manual DB cluster snapshot with other Amazon Web Services accounts, specify \
   [restore] as the [AttributeName] and use the [ValuesToAdd] parameter to add a list of IDs of \
   the Amazon Web Services accounts that are authorized to restore the manual DB cluster snapshot. \
   Use the value [all] to make the manual DB cluster snapshot public, which means that it can be \
   copied or restored by all Amazon Web Services accounts.\n\
  \ \n\
  \   Don't add the [all] value for any manual DB cluster snapshots that contain private \
   information that you don't want available to all Amazon Web Services accounts.\n\
  \   \n\
  \     If a manual DB cluster snapshot is encrypted, it can be shared, but only by specifying a \
   list of authorized Amazon Web Services account IDs for the [ValuesToAdd] parameter. You can't \
   use [all] as a value for that parameter in this case.\n\
  \     \n\
  \      To view which Amazon Web Services accounts have access to copy or restore a manual DB \
   cluster snapshot, or whether a manual DB cluster snapshot is public or private, use the \
   [DescribeDBClusterSnapshotAttributes] API operation. The accounts are returned as values for \
   the [restore] attribute.\n\
  \      "]

module ModifyDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies settings for a DB instance. You can change one or more database configuration \
   parameters by specifying these parameters and the new values in the request. To learn what \
   modifications you can make to your DB instance, call [DescribeValidDBInstanceModifications] \
   before you call [ModifyDBInstance].\n"]

module ModifyDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_parameter_group_message ->
    ( db_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_parameter_group_message ->
    ( db_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB parameter group. To modify more than one parameter, submit a \
   list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum of 20 \
   parameters can be modified in a single request.\n\n\
  \  After you modify a DB parameter group, you should wait at least 5 minutes before creating \
   your first DB instance that uses that DB parameter group as the default parameter group. This \
   allows Amazon RDS to fully complete the modify operation before the parameter group is used as \
   the default for a new DB instance. This is especially important for parameters that are \
   critical when creating the default database for a DB instance, such as the character set for \
   the default database defined by the [character_set_database] parameter. You can use the {i \
   Parameter Groups} option of the {{:https://console.aws.amazon.com/rds/}Amazon RDS console} or \
   the {i DescribeDBParameters} command to verify that your DB parameter group has been created or \
   modified.\n\
  \  \n\
  \   "]

module ModifyDBProxy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_request ->
    ( modify_db_proxy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_request ->
    ( modify_db_proxy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyAlreadyExistsFault of db_proxy_already_exists_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the settings for an existing DB proxy.\n"]

module ModifyDBProxyEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_endpoint_request ->
    ( modify_db_proxy_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_endpoint_request ->
    ( modify_db_proxy_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyEndpointAlreadyExistsFault of db_proxy_endpoint_already_exists_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `InvalidDBProxyEndpointStateFault of invalid_db_proxy_endpoint_state_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the settings for an existing DB proxy endpoint.\n"]

module ModifyDBProxyTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_target_group_request ->
    ( modify_db_proxy_target_group_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_proxy_target_group_request ->
    ( modify_db_proxy_target_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the properties of a [DBProxyTargetGroup].\n"]

module ModifyDBRecommendation : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_recommendation_message ->
    (db_recommendation_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_recommendation_message ->
    ( db_recommendation_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the recommendation status and recommended action status for the specified recommendation.\n"]

module ModifyDBShardGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_shard_group_message ->
    ( db_shard_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_shard_group_message ->
    ( db_shard_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupAlreadyExistsFault of db_shard_group_already_exists_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the settings of an Aurora Limitless Database DB shard group. You can change one or \
   more settings by specifying these parameters and the new values in the request.\n"]

module ModifyDBSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_snapshot_message ->
    ( modify_db_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_snapshot_message ->
    ( modify_db_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a manual DB snapshot with a new engine version. The snapshot can be encrypted or \
   unencrypted, but not shared or public. \n\n\
  \ Amazon RDS supports upgrading DB snapshots for MariaDB, MySQL, PostgreSQL, and Oracle. This \
   operation doesn't apply to RDS Custom or RDS for Db2.\n\
  \ "]

module ModifyDBSnapshotAttribute : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_snapshot_attribute_message ->
    ( modify_db_snapshot_attribute_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_snapshot_attribute_message ->
    ( modify_db_snapshot_attribute_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `SharedSnapshotQuotaExceededFault of shared_snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an attribute and values to, or removes an attribute and values from, a manual DB snapshot.\n\n\
  \ To share a manual DB snapshot with other Amazon Web Services accounts, specify [restore] as \
   the [AttributeName] and use the [ValuesToAdd] parameter to add a list of IDs of the Amazon Web \
   Services accounts that are authorized to restore the manual DB snapshot. Uses the value [all] \
   to make the manual DB snapshot public, which means it can be copied or restored by all Amazon \
   Web Services accounts.\n\
  \ \n\
  \   Don't add the [all] value for any manual DB snapshots that contain private information that \
   you don't want available to all Amazon Web Services accounts.\n\
  \   \n\
  \     If the manual DB snapshot is encrypted, it can be shared, but only by specifying a list of \
   authorized Amazon Web Services account IDs for the [ValuesToAdd] parameter. You can't use [all] \
   as a value for that parameter in this case.\n\
  \     \n\
  \      To view which Amazon Web Services accounts have access to copy or restore a manual DB \
   snapshot, or whether a manual DB snapshot public or private, use the \
   [DescribeDBSnapshotAttributes] API operation. The accounts are returned as values for the \
   [restore] attribute.\n\
  \      "]

module ModifyDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidSubnet of invalid_subnet
    | `SubnetAlreadyInUse of subnet_already_in_use ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_subnet_group_message ->
    ( modify_db_subnet_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_subnet_group_message ->
    ( modify_db_subnet_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at \
   least two AZs in the Amazon Web Services Region.\n"]

module ModifyEventSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
    | `SNSInvalidTopicFault of sns_invalid_topic_fault
    | `SNSNoAuthorizationFault of sns_no_authorization_fault
    | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
    | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_event_subscription_message ->
    ( modify_event_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `EventSubscriptionQuotaExceededFault of event_subscription_quota_exceeded_fault
      | `SNSInvalidTopicFault of sns_invalid_topic_fault
      | `SNSNoAuthorizationFault of sns_no_authorization_fault
      | `SNSTopicArnNotFoundFault of sns_topic_arn_not_found_fault
      | `SubscriptionCategoryNotFoundFault of subscription_category_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing RDS event notification subscription. You can't modify the source \
   identifiers using this call. To change source identifiers for a subscription, use the \
   [AddSourceIdentifierToSubscription] and [RemoveSourceIdentifierFromSubscription] calls.\n\n\
  \ You can see a list of the event categories for a given source type ([SourceType]) in \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html}Events} in the {i \
   Amazon RDS User Guide} or by using the [DescribeEventCategories] operation.\n\
  \ "]

module ModifyGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a setting for an Amazon Aurora global database cluster. You can change one or more \
   database configuration parameters by specifying these parameters and the new values in the \
   request. For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\n\
  \  This operation only applies to Aurora global database clusters.\n\
  \  \n\
  \   "]

module ModifyIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InvalidIntegrationStateFault of invalid_integration_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_message ->
    ( integration,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidIntegrationStateFault of invalid_integration_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_message ->
    ( integration Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidIntegrationStateFault of invalid_integration_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a zero-ETL integration with Amazon Redshift.\n"]

module ModifyOptionGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_option_group_message ->
    ( modify_option_group_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_option_group_message ->
    ( modify_option_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOptionGroupStateFault of invalid_option_group_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies an existing option group.\n"]

module ModifyTenantDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
    | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_tenant_database_message ->
    ( modify_tenant_database_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_tenant_database_message ->
    ( modify_tenant_database_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `TenantDatabaseAlreadyExistsFault of tenant_database_already_exists_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing tenant database in a DB instance. You can change the tenant database name \
   or the master user password. This operation is supported only for RDS for Oracle CDB instances \
   using the multi-tenant configuration.\n"]

module PromoteReadReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_message ->
    ( promote_read_replica_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_message ->
    ( promote_read_replica_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Promotes a read replica DB instance to a standalone DB instance.\n\n\
  \  {ul\n\
  \        {-  Backup duration is a function of the amount of changes to the database since the \
   previous backup. If you plan to promote a read replica to a standalone instance, we recommend \
   that you enable backups and complete at least one backup prior to promotion. In addition, a \
   read replica cannot be promoted to a standalone instance when it is in the [backing-up] status. \
   If you have enabled backups on your read replica, configure the automated backup window so that \
   daily backups do not interfere with read replica promotion.\n\
  \            \n\
  \             }\n\
  \        {-  This command doesn't apply to Aurora MySQL, Aurora PostgreSQL, or RDS Custom.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module PromoteReadReplicaDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_db_cluster_message ->
    ( promote_read_replica_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    promote_read_replica_db_cluster_message ->
    ( promote_read_replica_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Promotes a read replica DB cluster to a standalone DB cluster.\n"]

module PurchaseReservedDBInstancesOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ReservedDBInstanceAlreadyExistsFault of reserved_db_instance_already_exists_fault
    | `ReservedDBInstanceQuotaExceededFault of reserved_db_instance_quota_exceeded_fault
    | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_db_instances_offering_message ->
    ( purchase_reserved_db_instances_offering_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstanceAlreadyExistsFault of reserved_db_instance_already_exists_fault
      | `ReservedDBInstanceQuotaExceededFault of reserved_db_instance_quota_exceeded_fault
      | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_reserved_db_instances_offering_message ->
    ( purchase_reserved_db_instances_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ReservedDBInstanceAlreadyExistsFault of reserved_db_instance_already_exists_fault
      | `ReservedDBInstanceQuotaExceededFault of reserved_db_instance_quota_exceeded_fault
      | `ReservedDBInstancesOfferingNotFoundFault of reserved_db_instances_offering_not_found_fault
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Purchases a reserved DB instance offering.\n"]

module RebootDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_cluster_message ->
    ( reboot_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_cluster_message ->
    ( reboot_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You might need to reboot your DB cluster, usually for maintenance reasons. For example, if you \
   make certain modifications, or if you change the DB cluster parameter group associated with the \
   DB cluster, reboot the DB cluster for the changes to take effect.\n\n\
  \ Rebooting a DB cluster restarts the database engine service. Rebooting a DB cluster results in \
   a momentary outage, during which the DB cluster status is set to rebooting.\n\
  \ \n\
  \  Use this operation only for a non-Aurora Multi-AZ DB cluster.\n\
  \  \n\
  \   For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \   "]

module RebootDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You might need to reboot your DB instance, usually for maintenance reasons. For example, if you \
   make certain modifications, or if you change the DB parameter group associated with the DB \
   instance, you must reboot the instance for the changes to take effect.\n\n\
  \ Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results \
   in a momentary outage, during which the DB instance status is set to rebooting.\n\
  \ \n\
  \  For more information about rebooting, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html}Rebooting a \
   DB Instance} in the {i Amazon RDS User Guide.} \n\
  \  \n\
  \   This command doesn't apply to RDS Custom.\n\
  \   \n\
  \    If your DB instance is part of a Multi-AZ DB cluster, you can reboot the DB cluster with \
   the [RebootDBCluster] operation.\n\
  \    "]

module RebootDBShardGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_shard_group_message ->
    ( db_shard_group,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_shard_group_message ->
    ( db_shard_group Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You might need to reboot your DB shard group, usually for maintenance reasons. For example, if \
   you make certain modifications, reboot the DB shard group for the changes to take effect.\n\n\
  \ This operation applies only to Aurora Limitless Database DBb shard groups.\n\
  \ "]

module RegisterDBProxyTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetAlreadyRegisteredFault of db_proxy_target_already_registered_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `InsufficientAvailableIPsInSubnetFault of insufficient_available_i_ps_in_subnet_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_db_proxy_targets_request ->
    ( register_db_proxy_targets_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetAlreadyRegisteredFault of db_proxy_target_already_registered_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InsufficientAvailableIPsInSubnetFault of insufficient_available_i_ps_in_subnet_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_db_proxy_targets_request ->
    ( register_db_proxy_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetAlreadyRegisteredFault of db_proxy_target_already_registered_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `InsufficientAvailableIPsInSubnetFault of insufficient_available_i_ps_in_subnet_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBProxyStateFault of invalid_db_proxy_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associate one or more [DBProxyTarget] data structures with a [DBProxyTargetGroup].\n"]

module RemoveFromGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches an Aurora secondary cluster from an Aurora global database cluster. The cluster \
   becomes a standalone cluster with read-write capability instead of being read-only and \
   receiving data from a primary cluster in a different Region.\n\n\
  \  This operation only applies to Aurora DB clusters.\n\
  \  \n\
  \   "]

module RemoveRoleFromDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_cluster_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterRoleNotFoundFault of db_cluster_role_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the asssociation of an Amazon Web Services Identity and Access Management (IAM) role \
   from a DB cluster.\n\n\
  \ For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \  For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \  "]

module RemoveRoleFromDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBInstanceRoleNotFoundFault of db_instance_role_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_instance_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceRoleNotFoundFault of db_instance_role_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_role_from_db_instance_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBInstanceRoleNotFoundFault of db_instance_role_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates an Amazon Web Services Identity and Access Management (IAM) role from a DB \
   instance.\n"]

module RemoveSourceIdentifierFromSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SourceNotFoundFault of source_not_found_fault
    | `SubscriptionNotFoundFault of subscription_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_source_identifier_from_subscription_message ->
    ( remove_source_identifier_from_subscription_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_source_identifier_from_subscription_message ->
    ( remove_source_identifier_from_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SourceNotFoundFault of source_not_found_fault
      | `SubscriptionNotFoundFault of subscription_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a source identifier from an existing RDS event notification subscription.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
    | `DBProxyNotFoundFault of db_proxy_not_found_fault
    | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
    | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBProxyEndpointNotFoundFault of db_proxy_endpoint_not_found_fault
      | `DBProxyNotFoundFault of db_proxy_not_found_fault
      | `DBProxyTargetGroupNotFoundFault of db_proxy_target_group_not_found_fault
      | `DBShardGroupNotFoundFault of db_shard_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSnapshotTenantDatabaseNotFoundFault of db_snapshot_tenant_database_not_found_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `TenantDatabaseNotFoundFault of tenant_database_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes metadata tags from an Amazon RDS resource.\n\n\
  \ For an overview on tagging an Amazon RDS resource, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html}Tagging Amazon RDS \
   Resources} in the {i Amazon RDS User Guide} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_Tagging.html}Tagging \
   Amazon Aurora and Amazon RDS Resources} in the {i Amazon Aurora User Guide}.\n\
  \ "]

module ResetDBClusterParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_db_cluster_parameter_group_message ->
    ( db_cluster_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB cluster parameter group to the default value. To reset specific \
   parameters submit a list of the following: [ParameterName] and [ApplyMethod]. To reset the \
   entire DB cluster parameter group, specify the [DBClusterParameterGroupName] and \
   [ResetAllParameters] parameters.\n\n\
  \ When resetting the entire group, dynamic parameters are updated immediately and static \
   parameters are set to [pending-reboot] to take effect on the next DB instance restart or \
   [RebootDBInstance] request. You must call [RebootDBInstance] for every DB instance in your DB \
   cluster that you want the updated static parameter to apply to.\n\
  \ \n\
  \  For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \  \n\
  \   For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \   "]

module ResetDBParameterGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_db_parameter_group_message ->
    ( db_parameter_group_name_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_db_parameter_group_message ->
    ( db_parameter_group_name_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `InvalidDBParameterGroupStateFault of invalid_db_parameter_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a DB parameter group to the engine/system default value. To reset \
   specific parameters, provide a list of the following: [ParameterName] and [ApplyMethod]. To \
   reset the entire DB parameter group, specify the [DBParameterGroup] name and \
   [ResetAllParameters] parameters. When resetting the entire group, dynamic parameters are \
   updated immediately and static parameters are set to [pending-reboot] to take effect on the \
   next DB instance restart or [RebootDBInstance] request.\n"]

module RestoreDBClusterFromS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidS3BucketFault of invalid_s3_bucket_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_s3_message ->
    ( restore_db_cluster_from_s3_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_s3_message ->
    ( restore_db_cluster_from_s3_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Aurora DB cluster from MySQL data stored in an Amazon S3 bucket. Amazon RDS \
   must be authorized to access the Amazon S3 bucket and the data must be created using the \
   Percona XtraBackup utility as described in \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Migrating.ExtMySQL.html#AuroraMySQL.Migrating.ExtMySQL.S3} \
   Migrating Data from MySQL by Using an Amazon S3 Bucket} in the {i Amazon Aurora User Guide}.\n\n\
  \  This operation only restores the DB cluster, not the DB instances for that DB cluster. You \
   must invoke the [CreateDBInstance] operation to create DB instances for the restored DB \
   cluster, specifying the identifier of the restored DB cluster in [DBClusterIdentifier]. You can \
   create DB instances only after the [RestoreDBClusterFromS3] operation has completed and the DB \
   cluster is available.\n\
  \  \n\
  \    For more information on Amazon Aurora, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \    \n\
  \      This operation only applies to Aurora DB clusters. The source DB engine must be MySQL.\n\
  \      \n\
  \       "]

module RestoreDBClusterFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB cluster from a DB snapshot or DB cluster snapshot.\n\n\
  \ The target DB cluster is created from the source snapshot with a default configuration. If you \
   don't specify a security group, the new DB cluster is associated with the default security \
   group.\n\
  \ \n\
  \  You can use the [EnableVPCNetworking] and [EnableInternetAccessGateway] parameters together \
   to restore an Aurora PostgreSQL cluster without VPC networking and with internet-based \
   connectivity. These two parameters must always be specified together. Set [EnableVPCNetworking] \
   to [false] to disable the VPC network interface (ENI) for the cluster. \
   [EnableInternetAccessGateway] enables internet-based connectivity through an internet access \
   gateway. IAM database authentication is required and must be enabled using \
   [EnableIAMDatabaseAuthentication]. Once the cluster is restored, you need to modify the DB \
   cluster to update [MasterUserAuthenticationType] to [iam-db-auth]. \n\
  \  \n\
  \    This operation only restores the DB cluster, not the DB instances for that DB cluster. You \
   must invoke the [CreateDBInstance] operation to create DB instances for the restored DB \
   cluster, specifying the identifier of the restored DB cluster in [DBClusterIdentifier]. You can \
   create DB instances only after the [RestoreDBClusterFromSnapshot] operation has completed and \
   the DB cluster is available.\n\
  \    \n\
  \      For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \      \n\
  \       For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \       "]

module RestoreDBClusterToPointInTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterAutomatedBackupNotFoundFault of db_cluster_automated_backup_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time \
   before [LatestRestorableTime] for up to [BackupRetentionPeriod] days. The target DB cluster is \
   created from the source DB cluster with the same configuration as the original DB cluster, \
   except that the new DB cluster is created with the default DB security group. Unless the \
   [RestoreType] is set to [copy-on-write], the restore may occur in a different Availability Zone \
   (AZ) from the original DB cluster. The AZ where RDS restores the DB cluster depends on the AZs \
   in the specified subnet group.\n\n\
  \ You can use the [EnableVPCNetworking] and [EnableInternetAccessGateway] parameters together to \
   restore an Aurora PostgreSQL cluster without VPC networking and with internet-based \
   connectivity. These two parameters must always be specified together. Set [EnableVPCNetworking] \
   to [false] to disable the VPC network interface (ENI) for the cluster. \
   [EnableInternetAccessGateway] enables internet-based connectivity through an internet access \
   gateway. IAM database authentication is required and must be enabled using \
   [EnableIAMDatabaseAuthentication]. Once the cluster is restored, you need to modify the DB \
   cluster to update [MasterUserAuthenticationType] to [iam-db-auth]. \n\
  \ \n\
  \   For Aurora, this operation only restores the DB cluster, not the DB instances for that DB \
   cluster. You must invoke the [CreateDBInstance] operation to create DB instances for the \
   restored DB cluster, specifying the identifier of the restored DB cluster in \
   [DBClusterIdentifier]. You can create DB instances only after the \
   [RestoreDBClusterToPointInTime] operation has completed and the DB cluster is available.\n\
  \   \n\
  \     For more information on Amazon Aurora DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html} What \
   is Amazon Aurora?} in the {i Amazon Aurora User Guide}.\n\
  \     \n\
  \      For more information on Multi-AZ DB clusters, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/multi-az-db-clusters-concepts.html} \
   Multi-AZ DB cluster deployments} in the {i Amazon RDS User Guide.} \n\
  \      "]

module RestoreDBInstanceFromDBSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_from_db_snapshot_message ->
    ( restore_db_instance_from_db_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_from_db_snapshot_message ->
    ( restore_db_instance_from_db_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB instance from a DB snapshot. The target database is created from the source \
   database restore point with most of the source's original configuration, including the default \
   security group and DB parameter group. By default, the new DB instance is created as a \
   Single-AZ deployment, except when the instance is a SQL Server instance that has an option \
   group associated with mirroring. In this case, the instance becomes a Multi-AZ deployment, not \
   a Single-AZ deployment.\n\n\
  \ If you want to replace your original DB instance with the new, restored DB instance, then \
   rename your original DB instance before you call the [RestoreDBInstanceFromDBSnapshot] \
   operation. RDS doesn't allow two DB instances with the same name. After you have renamed your \
   original DB instance with a different identifier, then you can pass the original name of the DB \
   instance as the [DBInstanceIdentifier] in the call to the [RestoreDBInstanceFromDBSnapshot] \
   operation. The result is that you replace the original DB instance with the DB instance created \
   from the snapshot.\n\
  \ \n\
  \  If you are restoring from a shared manual DB snapshot, the [DBSnapshotIdentifier] must be the \
   ARN of the shared DB snapshot.\n\
  \  \n\
  \   To restore from a DB snapshot with an unsupported engine version, you must first upgrade the \
   engine version of the snapshot. For more information about upgrading a RDS for MySQL DB \
   snapshot engine version, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/mysql-upgrade-snapshot.html}Upgrading \
   a MySQL DB snapshot engine version}. For more information about upgrading a RDS for PostgreSQL \
   DB snapshot engine version, \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBSnapshot.PostgreSQL.html}Upgrading \
   a PostgreSQL DB snapshot engine version}.\n\
  \   \n\
  \     This command doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use \
   [RestoreDBClusterFromSnapshot].\n\
  \     \n\
  \      "]

module RestoreDBInstanceFromS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidS3BucketFault of invalid_s3_bucket_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_from_s3_message ->
    ( restore_db_instance_from_s3_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_from_s3_message ->
    ( restore_db_instance_from_s3_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Amazon Relational Database Service (Amazon RDS) supports importing MySQL databases by using \
   backup files. You can create a backup of your on-premises database, store it on Amazon Simple \
   Storage Service (Amazon S3), and then restore the backup file onto a new Amazon RDS DB instance \
   running MySQL. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.html}Restoring \
   a backup into an Amazon RDS for MySQL DB instance} in the {i Amazon RDS User Guide.} \n\n\
  \ This operation doesn't apply to RDS Custom.\n\
  \ "]

module RestoreDBInstanceToPointInTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupported of network_type_not_supported
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `PointInTimeRestoreNotEnabledFault of point_in_time_restore_not_enabled_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
    | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_to_point_in_time_message ->
    ( restore_db_instance_to_point_in_time_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `PointInTimeRestoreNotEnabledFault of point_in_time_restore_not_enabled_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_instance_to_point_in_time_message ->
    ( restore_db_instance_to_point_in_time_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `BackupPolicyNotFoundFault of backup_policy_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceAutomatedBackupNotFoundFault of db_instance_automated_backup_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupported of network_type_not_supported
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `PointInTimeRestoreNotEnabledFault of point_in_time_restore_not_enabled_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault
      | `TenantDatabaseQuotaExceededFault of tenant_database_quota_exceeded_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a DB instance to an arbitrary point in time. You can restore to any point in time \
   before the time identified by the [LatestRestorableTime] property. You can restore to a point \
   up to the number of days specified by the [BackupRetentionPeriod] property.\n\n\
  \ The target database is created with most of the original configuration, but in a \
   system-selected Availability Zone, with the default security group, the default subnet group, \
   and the default DB parameter group. By default, the new DB instance is created as a single-AZ \
   deployment except when the instance is a SQL Server instance that has an option group that is \
   associated with mirroring; in this case, the instance becomes a mirrored deployment and not a \
   single-AZ deployment.\n\
  \ \n\
  \   This operation doesn't apply to Aurora MySQL and Aurora PostgreSQL. For Aurora, use \
   [RestoreDBClusterToPointInTime].\n\
  \   \n\
  \    "]

module RevokeDBSecurityGroupIngress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_db_security_group_ingress_message ->
    ( revoke_db_security_group_ingress_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_db_security_group_ingress_message ->
    ( revoke_db_security_group_ingress_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes ingress from a DBSecurityGroup for previously authorized IP ranges or EC2 or VPC \
   security groups. Required parameters for this API are one of CIDRIP, EC2SecurityGroupId for \
   VPC, or (EC2SecurityGroupOwnerId and either EC2SecurityGroupName or EC2SecurityGroupId).\n\n\
  \  EC2-Classic was retired on August 15, 2022. If you haven't migrated from EC2-Classic to a \
   VPC, we recommend that you migrate as soon as possible. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
   EC2-Classic to a VPC} in the {i Amazon EC2 User Guide}, the blog \
   {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
   Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}, and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_VPC.Non-VPC2VPC.html}Moving a DB \
   instance not in a VPC into a VPC} in the {i Amazon RDS User Guide}.\n\
  \  \n\
  \   "]

module StartActivityStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_activity_stream_request ->
    ( start_activity_stream_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_activity_stream_request ->
    ( start_activity_stream_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a database activity stream to monitor activity on the database. For more information, \
   see {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html} \
   Monitoring Amazon Aurora with Database Activity Streams} in the {i Amazon Aurora User Guide} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/DBActivityStreams.html} Monitoring \
   Amazon RDS with Database Activity Streams} in the {i Amazon RDS User Guide}.\n"]

module StartDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an Amazon Aurora DB cluster that was stopped using the Amazon Web Services console, the \
   stop-db-cluster CLI command, or the [StopDBCluster] operation.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html} \
   Stopping and Starting an Aurora Cluster} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This operation only applies to Aurora DB clusters.\n\
  \   \n\
  \    "]

module StartDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_instance_message ->
    ( start_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_instance_message ->
    ( start_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `VpcEncryptionControlViolationException of vpc_encryption_control_violation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an Amazon RDS DB instance that was stopped using the Amazon Web Services console, the \
   stop-db-instance CLI command, or the [StopDBInstance] operation.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html} Starting an \
   Amazon RDS DB instance That Was Previously Stopped} in the {i Amazon RDS User Guide.} \n\
  \ \n\
  \   This command doesn't apply to RDS Custom, Aurora MySQL, and Aurora PostgreSQL. For Aurora DB \
   clusters, use [StartDBCluster] instead.\n\
  \   \n\
  \    "]

module StartDBInstanceAutomatedBackupsReplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceAutomatedBackupQuotaExceededFault of
      db_instance_automated_backup_quota_exceeded_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceAutomatedBackupStateFault of
      invalid_db_instance_automated_backup_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_instance_automated_backups_replication_message ->
    ( start_db_instance_automated_backups_replication_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupQuotaExceededFault of
        db_instance_automated_backup_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceAutomatedBackupStateFault of
        invalid_db_instance_automated_backup_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_instance_automated_backups_replication_message ->
    ( start_db_instance_automated_backups_replication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceAutomatedBackupQuotaExceededFault of
        db_instance_automated_backup_quota_exceeded_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceAutomatedBackupStateFault of
        invalid_db_instance_automated_backup_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables replication of automated backups to a different Amazon Web Services Region.\n\n\
  \ This command doesn't apply to RDS Custom.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html} \
   Replicating Automated Backups to Another Amazon Web Services Region} in the {i Amazon RDS User \
   Guide.} \n\
  \  "]

module StartExportTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `ExportTaskAlreadyExistsFault of export_task_already_exists_fault
    | `IamRoleMissingPermissionsFault of iam_role_missing_permissions_fault
    | `IamRoleNotFoundFault of iam_role_not_found_fault
    | `InvalidExportOnlyFault of invalid_export_only_fault
    | `InvalidExportSourceStateFault of invalid_export_source_state_fault
    | `InvalidS3BucketFault of invalid_s3_bucket_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_message ->
    ( export_task,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `ExportTaskAlreadyExistsFault of export_task_already_exists_fault
      | `IamRoleMissingPermissionsFault of iam_role_missing_permissions_fault
      | `IamRoleNotFoundFault of iam_role_not_found_fault
      | `InvalidExportOnlyFault of invalid_export_only_fault
      | `InvalidExportSourceStateFault of invalid_export_source_state_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_export_task_message ->
    ( export_task Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
      | `ExportTaskAlreadyExistsFault of export_task_already_exists_fault
      | `IamRoleMissingPermissionsFault of iam_role_missing_permissions_fault
      | `IamRoleNotFoundFault of iam_role_not_found_fault
      | `InvalidExportOnlyFault of invalid_export_only_fault
      | `InvalidExportSourceStateFault of invalid_export_source_state_fault
      | `InvalidS3BucketFault of invalid_s3_bucket_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an export of DB snapshot or DB cluster data to Amazon S3. The provided IAM role must \
   have access to the S3 bucket.\n\n\
  \ You can't export snapshot data from RDS Custom DB instances. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RDS_Fea_Regions_DB-eng.Feature.ExportSnapshotToS3.html} \
   Supported Regions and DB engines for exporting snapshots to S3 in Amazon RDS}.\n\
  \ \n\
  \  For more information on exporting DB snapshot data, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ExportSnapshot.html}Exporting DB \
   snapshot data to Amazon S3} in the {i Amazon RDS User Guide} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-export-snapshot.html}Exporting \
   DB cluster snapshot data to Amazon S3} in the {i Amazon Aurora User Guide}.\n\
  \  \n\
  \   For more information on exporting DB cluster data, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/export-cluster-data.html}Exporting \
   DB cluster data to Amazon S3} in the {i Amazon Aurora User Guide}.\n\
  \   "]

module StopActivityStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_activity_stream_request ->
    ( stop_activity_stream_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_activity_stream_request ->
    ( stop_activity_stream_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a database activity stream that was started using the Amazon Web Services console, the \
   [start-activity-stream] CLI command, or the [StartActivityStream] operation.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/DBActivityStreams.html} \
   Monitoring Amazon Aurora with Database Activity Streams} in the {i Amazon Aurora User Guide} or \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/DBActivityStreams.html} Monitoring \
   Amazon RDS with Database Activity Streams} in the {i Amazon RDS User Guide}.\n\
  \ "]

module StopDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBShardGroupStateFault of invalid_db_shard_group_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an Amazon Aurora DB cluster. When you stop a DB cluster, Aurora retains the DB cluster's \
   metadata, including its endpoints and DB parameter groups. Aurora also retains the transaction \
   logs so you can do a point-in-time restore if necessary.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-cluster-stop-start.html} \
   Stopping and Starting an Aurora Cluster} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This operation only applies to Aurora DB clusters.\n\
  \   \n\
  \    "]

module StopDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_instance_message ->
    ( stop_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_instance_message ->
    ( stop_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an Amazon RDS DB instance temporarily. When you stop a DB instance, Amazon RDS retains \
   the DB instance's metadata, including its endpoint, DB parameter group, and option group \
   membership. Amazon RDS also retains the transaction logs so you can do a point-in-time restore \
   if necessary. The instance restarts automatically after 7 days.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html} Stopping an \
   Amazon RDS DB Instance Temporarily} in the {i Amazon RDS User Guide.} \n\
  \ \n\
  \   This command doesn't apply to RDS Custom, Aurora MySQL, and Aurora PostgreSQL. For Aurora \
   clusters, use [StopDBCluster] instead.\n\
  \   \n\
  \    "]

module StopDBInstanceAutomatedBackupsReplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_instance_automated_backups_replication_message ->
    ( stop_db_instance_automated_backups_replication_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_instance_automated_backups_replication_message ->
    ( stop_db_instance_automated_backups_replication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops automated backup replication for a DB instance.\n\n\
  \ This command doesn't apply to RDS Custom, Aurora MySQL, and Aurora PostgreSQL.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReplicateBackups.html} \
   Replicating Automated Backups to Another Amazon Web Services Region} in the {i Amazon RDS User \
   Guide.} \n\
  \  "]

module SwitchoverBlueGreenDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
    | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    switchover_blue_green_deployment_request ->
    ( switchover_blue_green_deployment_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    switchover_blue_green_deployment_request ->
    ( switchover_blue_green_deployment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `BlueGreenDeploymentNotFoundFault of blue_green_deployment_not_found_fault
      | `InvalidBlueGreenDeploymentStateFault of invalid_blue_green_deployment_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Switches over a blue/green deployment.\n\n\
  \ Before you switch over, production traffic is routed to the databases in the blue environment. \
   After you switch over, production traffic is routed to the databases in the green environment.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon RDS User Guide} and \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/blue-green-deployments.html}Using \
   Amazon RDS Blue/Green Deployments for database updates} in the {i Amazon Aurora User Guide}.\n\
  \  "]

module SwitchoverGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    switchover_global_cluster_message ->
    ( switchover_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    switchover_global_cluster_message ->
    ( switchover_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Switches over the specified secondary DB cluster to be the new primary DB cluster in the global \
   database cluster. Switchover operations were previously called \"managed planned failovers.\"\n\n\
  \ Aurora promotes the specified secondary cluster to assume full read/write capabilities and \
   demotes the current primary cluster to a secondary (read-only) cluster, maintaining the orginal \
   replication topology. All secondary clusters are synchronized with the primary at the beginning \
   of the process so the new primary continues operations for the Aurora global database without \
   losing any data. Your database is unavailable for a short time while the primary and selected \
   secondary clusters are assuming their new roles. For more information about switching over an \
   Aurora global database, see \
   {{:https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-global-database-disaster-recovery.html#aurora-global-database-disaster-recovery.managed-failover}Performing \
   switchovers for Amazon Aurora global databases} in the {i Amazon Aurora User Guide}.\n\
  \ \n\
  \   This operation is intended for controlled environments, for operations such as \"regional \
   rotation\" or to fall back to the original primary after a global database failover.\n\
  \   \n\
  \    "]

(** {1:Serialization and Deserialization} *)
module SwitchoverReadReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    switchover_read_replica_message ->
    ( switchover_read_replica_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    switchover_read_replica_message ->
    ( switchover_read_replica_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Switches over an Oracle standby database in an Oracle Data Guard environment, making it the new \
   primary database. Issue this command in the Region that hosts the current standby database.\n"]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
