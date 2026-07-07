open Types

val make_vpc_security_group_membership :
  ?status:string_ -> ?vpc_security_group_id:string_ -> unit -> vpc_security_group_membership

val make_upgrade_target :
  ?supports_global_databases:boolean_optional ->
  ?is_major_version_upgrade:boolean_ ->
  ?auto_upgrade:boolean_ ->
  ?description:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  upgrade_target

val make_range : ?step:integer_optional -> ?to_:integer -> ?from_:integer -> unit -> range
val make_double_range : ?to_:double -> ?from_:double -> unit -> double_range

val make_valid_storage_options :
  ?iops_to_storage_ratio:double_range_list ->
  ?provisioned_iops:range_list ->
  ?storage_size:range_list ->
  ?storage_type:string_ ->
  unit ->
  valid_storage_options

val make_valid_db_instance_modifications_message :
  ?storage:valid_storage_options_list -> unit -> valid_db_instance_modifications_message

val make_timezone : ?timezone_name:string_ -> unit -> timezone
val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag
val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message

val make_global_cluster_member :
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
  ?global_cluster_members:global_cluster_member_list ->
  ?deletion_protection:boolean_optional ->
  ?storage_encrypted:boolean_optional ->
  ?database_name:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?status:string_ ->
  ?global_cluster_arn:string_ ->
  ?global_cluster_resource_id:string_ ->
  ?global_cluster_identifier:global_cluster_identifier ->
  unit ->
  global_cluster

val make_switchover_global_cluster_message :
  target_db_cluster_identifier:string_ ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  switchover_global_cluster_message

val make_character_set :
  ?character_set_description:string_ -> ?character_set_name:string_ -> unit -> character_set

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_status:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_db_cluster_option_group_status :
  ?status:string_ -> ?db_cluster_option_group_name:string_ -> unit -> db_cluster_option_group_status

val make_db_cluster_member :
  ?promotion_tier:integer_optional ->
  ?db_cluster_parameter_group_status:string_ ->
  ?is_cluster_writer:boolean_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  db_cluster_member

val make_db_cluster_role :
  ?feature_name:string_ -> ?status:string_ -> ?role_arn:string_ -> unit -> db_cluster_role

val make_pending_cloudwatch_logs_exports :
  ?log_types_to_disable:log_type_list ->
  ?log_types_to_enable:log_type_list ->
  unit ->
  pending_cloudwatch_logs_exports

val make_cluster_pending_modified_values :
  ?network_type:string_ ->
  ?iops:integer_optional ->
  ?allocated_storage:integer_optional ->
  ?storage_type:string_ ->
  ?backup_retention_period:integer_optional ->
  ?engine_version:string_ ->
  ?iam_database_authentication_enabled:boolean_optional ->
  ?db_cluster_identifier:string_ ->
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  unit ->
  cluster_pending_modified_values

val make_serverless_v2_scaling_configuration_info :
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration_info

val make_db_cluster :
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?io_optimized_next_allowed_modification_time:t_stamp ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration_info ->
  ?automatic_restart_time:t_stamp ->
  ?cross_account_clone:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?pending_modified_values:cluster_pending_modified_values ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?cluster_create_time:t_stamp ->
  ?clone_group_id:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?associated_roles:db_cluster_roles ->
  ?db_cluster_arn:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?hosted_zone_id:string_ ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?db_cluster_members:db_cluster_member_list ->
  ?read_replica_identifiers:read_replica_identifier_list ->
  ?replication_source_identifier:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?db_cluster_option_group_memberships:db_cluster_option_group_memberships ->
  ?master_username:string_ ->
  ?port:integer_optional ->
  ?latest_restorable_time:t_stamp ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?multi_a_z:boolean_ ->
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

val make_start_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> start_db_cluster_message

val make_serverless_v2_scaling_configuration :
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration

val make_restore_db_cluster_to_point_in_time_message :
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?deletion_protection:boolean_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?option_group_name:string_ ->
  ?db_subnet_group_name:string_ ->
  ?port:integer_optional ->
  ?use_latest_restorable_time:boolean_ ->
  ?restore_to_time:t_stamp ->
  ?restore_type:string_ ->
  source_db_cluster_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_to_point_in_time_message

val make_restore_db_cluster_from_snapshot_message :
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
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
  ?apply_method:apply_method ->
  ?minimum_engine_version:string_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?apply_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?parameter_value:string_ ->
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

val make_endpoint : ?hosted_zone_id:string_ -> ?port:integer -> ?address:string_ -> unit -> endpoint

val make_db_security_group_membership :
  ?status:string_ -> ?db_security_group_name:string_ -> unit -> db_security_group_membership

val make_db_parameter_group_status :
  ?parameter_apply_status:string_ ->
  ?db_parameter_group_name:string_ ->
  unit ->
  db_parameter_group_status

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

val make_pending_modified_values :
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  ?db_subnet_group_name:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?storage_type:string_ ->
  ?db_instance_identifier:string_ ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?backup_retention_period:integer_optional ->
  ?port:integer_optional ->
  ?master_user_password:string_ ->
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
  ?iam_role_name:string_ ->
  ?fqd_n:string_ ->
  ?status:string_ ->
  ?domain:string_ ->
  unit ->
  domain_membership

val make_db_instance :
  ?network_type:string_ ->
  ?deletion_protection:boolean_optional ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_enabled:boolean_optional ->
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
  ?storage_type:string_ ->
  ?status_infos:db_instance_status_info_list ->
  ?publicly_accessible:boolean_ ->
  ?secondary_availability_zone:string_ ->
  ?character_set_name:string_ ->
  ?option_group_memberships:option_group_membership_list ->
  ?iops:integer_optional ->
  ?license_model:string_ ->
  ?read_replica_db_cluster_identifiers:read_replica_db_cluster_identifier_list ->
  ?read_replica_db_instance_identifiers:read_replica_db_instance_identifier_list ->
  ?read_replica_source_db_instance_identifier:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_ ->
  ?latest_restorable_time:t_stamp ->
  ?pending_modified_values:pending_modified_values ->
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

val make_reboot_db_instance_message :
  ?force_failover:boolean_optional ->
  db_instance_identifier:string_ ->
  unit ->
  reboot_db_instance_message

val make_promote_read_replica_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> promote_read_replica_db_cluster_message

val make_pending_maintenance_actions_message :
  ?marker:string_ ->
  ?pending_maintenance_actions:pending_maintenance_actions ->
  unit ->
  pending_maintenance_actions_message

val make_orderable_db_instance_option :
  ?supported_network_types:string_list ->
  ?supports_global_databases:boolean_ ->
  ?max_iops_per_gib:double_optional ->
  ?min_iops_per_gib:double_optional ->
  ?max_iops_per_db_instance:integer_optional ->
  ?min_iops_per_db_instance:integer_optional ->
  ?max_storage_size:integer_optional ->
  ?min_storage_size:integer_optional ->
  ?supports_performance_insights:boolean_ ->
  ?supports_iam_database_authentication:boolean_ ->
  ?supports_enhanced_monitoring:boolean_ ->
  ?supports_iops:boolean_ ->
  ?storage_type:string_ ->
  ?supports_storage_encryption:boolean_ ->
  ?vpc:boolean_ ->
  ?read_replica_capable:boolean_ ->
  ?multi_az_capable:boolean_ ->
  ?availability_zones:availability_zone_list ->
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

val make_modify_db_instance_message :
  ?deletion_protection:boolean_optional ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?domain_iam_role_name:string_ ->
  ?monitoring_role_arn:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?db_port_number:integer_optional ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?new_db_instance_identifier:string_ ->
  ?option_group_name:string_ ->
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
  ?master_user_password:string_ ->
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
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?db_instance_parameter_group_name:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?option_group_name:string_ ->
  ?master_user_password:string_ ->
  ?port:integer_optional ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?apply_immediately:boolean_ ->
  ?new_db_cluster_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_db_cluster_message

val make_modify_db_cluster_endpoint_output :
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
  modify_db_cluster_endpoint_output

val make_modify_db_cluster_endpoint_message :
  ?excluded_members:string_list ->
  ?static_members:string_list ->
  ?endpoint_type:string_ ->
  db_cluster_endpoint_identifier:string_ ->
  unit ->
  modify_db_cluster_endpoint_message

val make_filter : values:filter_value_list -> name:string_ -> unit -> filter

val make_list_tags_for_resource_message :
  ?filters:filter_list -> resource_name:string_ -> unit -> list_tags_for_resource_message

val make_global_clusters_message :
  ?global_clusters:global_cluster_list -> ?marker:string_ -> unit -> global_clusters_message

val make_failover_global_cluster_message :
  ?switchover:boolean_optional ->
  ?allow_data_loss:boolean_optional ->
  target_db_cluster_identifier:string_ ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  failover_global_cluster_message

val make_failover_db_cluster_message :
  ?target_db_instance_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  unit ->
  failover_db_cluster_message

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

val make_describe_valid_db_instance_modifications_message :
  db_instance_identifier:string_ -> unit -> describe_valid_db_instance_modifications_message

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
  ?license_model:string_ ->
  ?db_instance_class:string_ ->
  ?engine_version:string_ ->
  engine:string_ ->
  unit ->
  describe_orderable_db_instance_options_message

val make_describe_global_clusters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?global_cluster_identifier:global_cluster_identifier ->
  unit ->
  describe_global_clusters_message

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

val make_describe_db_instances_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_instance_identifier:string_ ->
  unit ->
  describe_db_instances_message

val make_db_instance_message :
  ?db_instances:db_instance_list -> ?marker:string_ -> unit -> db_instance_message

val make_describe_db_engine_versions_message :
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

val make_db_engine_version :
  ?supports_global_databases:boolean_ ->
  ?supports_read_replica:boolean_ ->
  ?supports_log_exports_to_cloudwatch_logs:boolean_ ->
  ?exportable_log_types:log_type_list ->
  ?supported_timezones:supported_timezones_list ->
  ?valid_upgrade_target:valid_upgrade_target_list ->
  ?supported_character_sets:supported_character_sets_list ->
  ?default_character_set:character_set ->
  ?db_engine_version_description:string_ ->
  ?db_engine_description:string_ ->
  ?db_parameter_group_family:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  db_engine_version

val make_db_engine_version_message :
  ?db_engine_versions:db_engine_version_list -> ?marker:string_ -> unit -> db_engine_version_message

val make_describe_db_clusters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?db_cluster_identifier:string_ ->
  unit ->
  describe_db_clusters_message

val make_db_cluster_message :
  ?db_clusters:db_cluster_list -> ?marker:string_ -> unit -> db_cluster_message

val make_describe_db_cluster_snapshots_message :
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
  ?storage_type:string_ ->
  ?iam_database_authentication_enabled:boolean_ ->
  ?source_db_cluster_snapshot_arn:string_ ->
  ?db_cluster_snapshot_arn:string_ ->
  ?kms_key_id:string_ ->
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

val make_db_cluster_endpoint_message :
  ?db_cluster_endpoints:db_cluster_endpoint_list ->
  ?marker:string_ ->
  unit ->
  db_cluster_endpoint_message

val make_delete_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier -> unit -> delete_global_cluster_message

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_db_subnet_group_message :
  db_subnet_group_name:string_ -> unit -> delete_db_subnet_group_message

val make_delete_db_parameter_group_message :
  db_parameter_group_name:string_ -> unit -> delete_db_parameter_group_message

val make_delete_db_instance_message :
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  db_instance_identifier:string_ ->
  unit ->
  delete_db_instance_message

val make_delete_db_cluster_snapshot_message :
  db_cluster_snapshot_identifier:string_ -> unit -> delete_db_cluster_snapshot_message

val make_delete_db_cluster_parameter_group_message :
  db_cluster_parameter_group_name:string_ -> unit -> delete_db_cluster_parameter_group_message

val make_delete_db_cluster_message :
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  db_cluster_identifier:string_ ->
  unit ->
  delete_db_cluster_message

val make_delete_db_cluster_endpoint_output :
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
  delete_db_cluster_endpoint_output

val make_delete_db_cluster_endpoint_message :
  db_cluster_endpoint_identifier:string_ -> unit -> delete_db_cluster_endpoint_message

val make_create_global_cluster_message :
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  ?database_name:string_ ->
  ?deletion_protection:boolean_optional ->
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

val make_create_db_parameter_group_message :
  ?tags:tag_list ->
  description:string_ ->
  db_parameter_group_family:string_ ->
  db_parameter_group_name:string_ ->
  unit ->
  create_db_parameter_group_message

val make_create_db_instance_message :
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?timezone:string_ ->
  ?promotion_tier:integer_optional ->
  ?domain_iam_role_name:string_ ->
  ?monitoring_role_arn:string_ ->
  ?monitoring_interval:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?domain:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tde_credential_password:sensitive_string ->
  ?tde_credential_arn:string_ ->
  ?storage_type:string_ ->
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?character_set_name:string_ ->
  ?option_group_name:string_ ->
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
  ?master_user_password:string_ ->
  ?master_username:string_ ->
  ?allocated_storage:integer_optional ->
  ?db_name:string_ ->
  db_cluster_identifier:string_ ->
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
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?enable_iam_database_authentication:boolean_optional ->
  ?pre_signed_url:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  ?replication_source_identifier:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?option_group_name:string_ ->
  ?master_user_password:string_ ->
  ?master_username:string_ ->
  ?port:integer_optional ->
  ?engine_version:string_ ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?database_name:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?character_set_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
  engine:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_message

val make_create_db_cluster_endpoint_output :
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
  create_db_cluster_endpoint_output

val make_create_db_cluster_endpoint_message :
  ?tags:tag_list ->
  ?excluded_members:string_list ->
  ?static_members:string_list ->
  endpoint_type:string_ ->
  db_cluster_endpoint_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_endpoint_message

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
  ?pre_signed_url:string_ ->
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

val make_add_role_to_db_cluster_message :
  ?feature_name:string_ ->
  role_arn:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  add_role_to_db_cluster_message
