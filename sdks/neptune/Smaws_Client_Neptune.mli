(** Neptune client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
[@@ocaml.doc
  "Associates an Identity and Access Management (IAM) role with an Neptune DB cluster.\n"]

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
[@@ocaml.doc "Adds a source identifier to an existing event notification subscription.\n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds metadata tags to an Amazon Neptune resource. These tags can also be used with cost \
   allocation reporting to track cost associated with Amazon Neptune resources, or used in a \
   Condition statement in an IAM policy for Amazon Neptune.\n"]

module ApplyPendingMaintenanceAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_pending_maintenance_action_message ->
    ( apply_pending_maintenance_action_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceNotFoundFault of resource_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a pending maintenance action to a resource (for example, to a DB instance).\n"]

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
[@@ocaml.doc "Copies the specified DB cluster parameter group.\n"]

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
  \ "]

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
[@@ocaml.doc "Copies the specified DB parameter group.\n"]

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
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
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
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
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
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon Neptune DB cluster.\n\n\
  \ You can use the [ReplicationSourceIdentifier] parameter to create the DB cluster as a Read \
   Replica of another DB cluster or Amazon Neptune DB instance.\n\
  \ \n\
  \  Note that when you create a new cluster using [CreateDBCluster] directly, deletion protection \
   is disabled by default (when you create a new production cluster in the console, deletion \
   protection is enabled by default). You can only delete a DB cluster if its [DeletionProtection] \
   field is set to [false].\n\
  \  "]

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
    ( create_db_cluster_endpoint_output,
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
    ( create_db_cluster_endpoint_output Smaws_Lib.Response.t,
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
[@@ocaml.doc "Creates a new custom endpoint and associates it with an Amazon Neptune DB cluster.\n"]

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
  \   A DB cluster parameter group is initially created with the default parameters for the \
   database engine used by instances in the DB cluster. To provide custom values for any of the \
   parameters, you must modify the group after creating it using [ModifyDBClusterParameterGroup]. \
   Once you've created a DB cluster parameter group, you need to associate it with your DB cluster \
   using [ModifyDBCluster]. When you associate a new DB cluster parameter group with a running DB \
   cluster, you need to reboot the DB instances in the DB cluster without failover for the new DB \
   cluster parameter group and associated settings to take effect.\n\
  \  \n\
  \    After you create a DB cluster parameter group, you should wait at least 5 minutes before \
   creating your first DB cluster that uses that DB cluster parameter group as the default \
   parameter group. This allows Amazon Neptune to fully complete the create action before the DB \
   cluster parameter group is used as the default for a new DB cluster. This is especially \
   important for parameters that are critical when creating the default database for a DB cluster, \
   such as the character set for the default database defined by the [character_set_database] \
   parameter. You can use the {i Parameter Groups} option of the \
   {{:https://console.aws.amazon.com/rds/}Amazon Neptune console} or the \
   [DescribeDBClusterParameters] command to verify that your DB cluster parameter group has been \
   created or modified.\n\
  \    \n\
  \     "]

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
[@@ocaml.doc "Creates a snapshot of a DB cluster.\n"]

module CreateDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
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
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
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
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_db_instance_message ->
    ( create_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
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
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new DB instance.\n"]

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
   the group after creating it using {i ModifyDBParameterGroup}. Once you've created a DB \
   parameter group, you need to associate it with your DB instance using {i ModifyDBInstance}. \
   When you associate a new DB parameter group with a running DB instance, you need to reboot the \
   DB instance without failover for the new DB parameter group and associated settings to take \
   effect.\n\
  \ \n\
  \   After you create a DB parameter group, you should wait at least 5 minutes before creating \
   your first DB instance that uses that DB parameter group as the default parameter group. This \
   allows Amazon Neptune to fully complete the create action before the parameter group is used as \
   the default for a new DB instance. This is especially important for parameters that are \
   critical when creating the default database for a DB instance, such as the character set for \
   the default database defined by the [character_set_database] parameter. You can use the {i \
   Parameter Groups} option of the Amazon Neptune console or the {i DescribeDBParameters} command \
   to verify that your DB parameter group has been created or modified.\n\
  \   \n\
  \    "]

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
   two AZs in the Amazon Region.\n"]

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
  "Creates an event notification subscription. This action requires a topic ARN (Amazon Resource \
   Name) created by either the Neptune console, the SNS console, or the SNS API. To obtain an ARN \
   with SNS, you must create a topic in Amazon SNS and subscribe to the topic. The ARN is \
   displayed in the SNS console.\n\n\
  \ You can specify the type of source (SourceType) you want to be notified of, provide a list of \
   Neptune sources (SourceIds) that triggers the events, and provide a list of event categories \
   (EventCategories) for events you want to be notified of. For example, you can specify \
   SourceType = db-instance, SourceIds = mydbinstance1, mydbinstance2 and EventCategories = \
   Availability, Backup.\n\
  \ \n\
  \  If you specify both the SourceType and SourceIds, such as SourceType = db-instance and \
   SourceIdentifier = myDBInstance1, you are notified of all the db-instance events for the \
   specified source. If you specify a SourceType but do not specify a SourceIdentifier, you \
   receive notice of the events for that source type for all your Neptune sources. If you do not \
   specify either the SourceType nor the SourceIdentifier, you are notified of events generated \
   from all Neptune sources belonging to your customer account.\n\
  \  "]

module CreateGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
    | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_global_cluster_message ->
    ( create_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterAlreadyExistsFault of global_cluster_already_exists_fault
      | `GlobalClusterQuotaExceededFault of global_cluster_quota_exceeded_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Neptune global database spread across multiple Amazon Regions. The global database \
   contains a single primary cluster with read-write capability, and read-only secondary clusters \
   that receive data from the primary cluster through high-speed replication performed by the \
   Neptune storage subsystem.\n\n\
  \ You can create a global database that is initially empty, and then add a primary cluster and \
   secondary clusters to it, or you can specify an existing Neptune cluster during the create \
   operation to become the primary cluster of the global database.\n\
  \ "]

module DeleteDBCluster : sig
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
    delete_db_cluster_message ->
    ( delete_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterSnapshotAlreadyExistsFault of db_cluster_snapshot_already_exists_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_message ->
    ( delete_db_cluster_result Smaws_Lib.Response.t,
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
  "The DeleteDBCluster action deletes a previously provisioned DB cluster. When you delete a DB \
   cluster, all automated backups for that DB cluster are deleted and can't be recovered. Manual \
   DB cluster snapshots of the specified DB cluster are not deleted.\n\n\
  \ Note that the DB Cluster cannot be deleted if deletion protection is enabled. To delete it, \
   you must first set its [DeletionProtection] field to [False].\n\
  \ "]

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
    ( delete_db_cluster_endpoint_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_cluster_endpoint_message ->
    ( delete_db_cluster_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom endpoint and removes it from an Amazon Neptune DB cluster.\n"]

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
   can't be associated with any DB clusters.\n"]

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
  \   "]

module DeleteDBInstance : sig
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
    delete_db_instance_message ->
    ( delete_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotAlreadyExistsFault of db_snapshot_already_exists_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `SnapshotQuotaExceededFault of snapshot_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_db_instance_message ->
    ( delete_db_instance_result Smaws_Lib.Response.t,
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
  "The DeleteDBInstance action deletes a previously provisioned DB instance. When you delete a DB \
   instance, all automated backups for that instance are deleted and can't be recovered. Manual DB \
   snapshots of the DB instance to be deleted by [DeleteDBInstance] are not deleted.\n\n\
  \  If you request a final DB snapshot the status of the Amazon Neptune DB instance is [deleting] \
   until the DB snapshot is created. The API action [DescribeDBInstance] is used to monitor the \
   status of this operation. The action can't be canceled or reverted once submitted.\n\
  \ \n\
  \  Note that when a DB instance is in a failure state and has a status of [failed], \
   [incompatible-restore], or [incompatible-network], you can only delete it when the \
   [SkipFinalSnapshot] parameter is set to [true].\n\
  \  \n\
  \   You can't delete a DB instance if it is the only instance in the DB cluster, or if it has \
   deletion protection enabled.\n\
  \   "]

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
  "Deletes a specified DBParameterGroup. The DBParameterGroup to be deleted can't be associated \
   with any DB instances.\n"]

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
[@@ocaml.doc "Deletes an event notification subscription.\n"]

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
  "Deletes a global database. The primary and all secondary clusters must already be detached or \
   deleted first.\n"]

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
  "Returns information about endpoints for an Amazon Neptune DB cluster.\n\n\
  \  This operation can also return information for Amazon RDS clusters and Amazon DocDB clusters.\n\
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
  " Returns a list of [DBClusterParameterGroup] descriptions. If a [DBClusterParameterGroupName] \
   parameter is specified, the list will contain only the description of the specified DB cluster \
   parameter group.\n"]

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
[@@ocaml.doc "Returns the detailed parameter list for a particular DB cluster parameter group.\n"]

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
  \ When sharing snapshots with other Amazon accounts, [DescribeDBClusterSnapshotAttributes] \
   returns the [restore] attribute and a list of IDs for the Amazon accounts that are authorized \
   to copy or restore the manual DB cluster snapshot. If [all] is included in the list of values \
   for the [restore] attribute, then the manual DB cluster snapshot is public and can be copied or \
   restored by all Amazon accounts.\n\
  \ \n\
  \  To add or remove access for an Amazon account to copy or restore a manual DB cluster \
   snapshot, or to make the manual DB cluster snapshot public or private, use the \
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
  "Returns information about DB cluster snapshots. This API action supports pagination.\n"]

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
  "Returns information about provisioned DB clusters, and supports pagination.\n\n\
  \  This operation can also return information for Amazon RDS clusters and Amazon DocDB clusters.\n\
  \  \n\
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
[@@ocaml.doc "Returns a list of the available DB engines.\n"]

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
  "Returns information about provisioned instances, and supports pagination.\n\n\
  \  This operation can also return information for Amazon RDS instances and Amazon DocDB instances.\n\
  \  \n\
  \   "]

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
  "Returns the default engine and system parameter information for the cluster database engine.\n"]

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
   source type.\n"]

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
   subscription includes SubscriptionName, SNSTopicARN, CustomerID, SourceType, SourceID, \
   CreationTime, and Status.\n\n\
  \ If you specify a SubscriptionName, lists the description for that subscription.\n\
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
  "Returns events related to DB instances, DB security groups, DB snapshots, and DB parameter \
   groups for the past 14 days. Events specific to a particular DB instance, DB security group, \
   database snapshot, or DB parameter group can be obtained by providing the name as a parameter. \
   By default, the past hour of events are returned.\n"]

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
  "Returns information about Neptune global database clusters. This API supports pagination.\n"]

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
[@@ocaml.doc "Returns a list of orderable DB instance options for the specified engine.\n"]

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
   maintenance action.\n"]

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
   your DB instance. You can use this information when you call [ModifyDBInstance].\n"]

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
  \ A failover for a DB cluster promotes one of the Read Replicas (read-only instances) in the DB \
   cluster to be the primary instance (the cluster writer).\n\
  \ \n\
  \  Amazon Neptune will automatically fail over to a Read Replica, if one exists, when the \
   primary instance fails. You can force a failover when you want to simulate a failure of a \
   primary instance for testing. Because each instance in a DB cluster has its own endpoint \
   address, you will need to clean up and re-establish any existing connections that use those \
   endpoint addresses when the failover is complete.\n\
  \  "]

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
  "Initiates the failover process for a Neptune global database.\n\n\
  \ A failover for a Neptune global database promotes one of secondary read-only DB clusters to be \
   the primary DB cluster and demotes the primary DB cluster to being a secondary (read-only) DB \
   cluster. In other words, the role of the current primary DB cluster and the selected target \
   secondary DB cluster are switched. The selected secondary DB cluster assumes full read/write \
   capabilities for the Neptune global database.\n\
  \ \n\
  \   This action applies {b only} to Neptune global databases. This action is only intended for \
   use on healthy Neptune global databases with healthy Neptune DB clusters and no region-wide \
   outages, to test disaster recovery scenarios or to reconfigure the global database topology.\n\
  \   \n\
  \    "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( tag_list_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags on an Amazon Neptune resource.\n"]

module ModifyDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_cluster_message ->
    ( modify_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidDBSubnetGroupStateFault of invalid_db_subnet_group_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modify a setting for a DB cluster. You can change one or more database configuration parameters \
   by specifying these parameters and the new values in the request.\n"]

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
    ( modify_db_cluster_endpoint_output,
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
    ( modify_db_cluster_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterEndpointNotFoundFault of db_cluster_endpoint_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBClusterEndpointStateFault of invalid_db_cluster_endpoint_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the properties of an endpoint in an Amazon Neptune DB cluster.\n"]

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
  " Modifies the parameters of a DB cluster parameter group. To modify more than one parameter, \
   submit a list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum \
   of 20 parameters can be modified in a single request.\n\n\
  \  Changes to dynamic parameters are applied immediately. Changes to static parameters require a \
   reboot without failover to the DB cluster associated with the parameter group before the change \
   can take effect.\n\
  \  \n\
  \     After you create a DB cluster parameter group, you should wait at least 5 minutes before \
   creating your first DB cluster that uses that DB cluster parameter group as the default \
   parameter group. This allows Amazon Neptune to fully complete the create action before the \
   parameter group is used as the default for a new DB cluster. This is especially important for \
   parameters that are critical when creating the default database for a DB cluster, such as the \
   character set for the default database defined by the [character_set_database] parameter. You \
   can use the {i Parameter Groups} option of the Amazon Neptune console or the \
   [DescribeDBClusterParameters] command to verify that your DB cluster parameter group has been \
   created or modified.\n\
  \     \n\
  \      "]

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
  \ To share a manual DB cluster snapshot with other Amazon accounts, specify [restore] as the \
   [AttributeName] and use the [ValuesToAdd] parameter to add a list of IDs of the Amazon accounts \
   that are authorized to restore the manual DB cluster snapshot. Use the value [all] to make the \
   manual DB cluster snapshot public, which means that it can be copied or restored by all Amazon \
   accounts. Do not add the [all] value for any manual DB cluster snapshots that contain private \
   information that you don't want available to all Amazon accounts. If a manual DB cluster \
   snapshot is encrypted, it can be shared, but only by specifying a list of authorized Amazon \
   account IDs for the [ValuesToAdd] parameter. You can't use [all] as a value for that parameter \
   in this case.\n\
  \ \n\
  \  To view which Amazon accounts have access to copy or restore a manual DB cluster snapshot, or \
   whether a manual DB cluster snapshot public or private, use the \
   [DescribeDBClusterSnapshotAttributes] API action.\n\
  \  "]

module ModifyDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationNotFoundFault of authorization_not_found_fault
    | `CertificateNotFoundFault of certificate_not_found_fault
    | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
    | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
    | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
    | `DomainNotFoundFault of domain_not_found_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault
    | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_db_instance_message ->
    ( modify_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationNotFoundFault of authorization_not_found_fault
      | `CertificateNotFoundFault of certificate_not_found_fault
      | `DBInstanceAlreadyExistsFault of db_instance_already_exists_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBParameterGroupNotFoundFault of db_parameter_group_not_found_fault
      | `DBSecurityGroupNotFoundFault of db_security_group_not_found_fault
      | `DBUpgradeDependencyFailureFault of db_upgrade_dependency_failure_fault
      | `DomainNotFoundFault of domain_not_found_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `ProvisionedIopsNotAvailableInAZFault of provisioned_iops_not_available_in_az_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
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
  \  Changes to dynamic parameters are applied immediately. Changes to static parameters require a \
   reboot without failover to the DB instance associated with the parameter group before the \
   change can take effect.\n\
  \  \n\
  \     After you modify a DB parameter group, you should wait at least 5 minutes before creating \
   your first DB instance that uses that DB parameter group as the default parameter group. This \
   allows Amazon Neptune to fully complete the modify action before the parameter group is used as \
   the default for a new DB instance. This is especially important for parameters that are \
   critical when creating the default database for a DB instance, such as the character set for \
   the default database defined by the [character_set_database] parameter. You can use the {i \
   Parameter Groups} option of the Amazon Neptune console or the {i DescribeDBParameters} command \
   to verify that your DB parameter group has been created or modified.\n\
  \     \n\
  \      "]

module ModifyDBSubnetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBSubnetGroupDoesNotCoverEnoughAZs of db_subnet_group_does_not_cover_enough_a_zs
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `DBSubnetQuotaExceededFault of db_subnet_quota_exceeded_fault
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
      | `InvalidSubnet of invalid_subnet
      | `SubnetAlreadyInUse of subnet_already_in_use ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing DB subnet group. DB subnet groups must contain at least one subnet in at \
   least two AZs in the Amazon Region.\n"]

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
  "Modifies an existing event notification subscription. Note that you can't modify the source \
   identifiers using this call; to change source identifiers for a subscription, use the \
   [AddSourceIdentifierToSubscription] and [RemoveSourceIdentifierFromSubscription] calls.\n\n\
  \ You can see a list of the event categories for a given SourceType by using the {b \
   DescribeEventCategories} action.\n\
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
  "Modify a setting for an Amazon Neptune global cluster. You can change one or more database \
   configuration parameters by specifying these parameters and their new values in the request.\n"]

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
[@@ocaml.doc "Not supported.\n"]

module RebootDBInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_db_instance_message ->
    ( reboot_db_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You might need to reboot your DB instance, usually for maintenance reasons. For example, if you \
   make certain modifications, or if you change the DB parameter group associated with the DB \
   instance, you must reboot the instance for the changes to take effect.\n\n\
  \ Rebooting a DB instance restarts the database engine service. Rebooting a DB instance results \
   in a momentary outage, during which the DB instance status is set to rebooting.\n\
  \ "]

module RemoveFromGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_from_global_cluster_message ->
    ( remove_from_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches a Neptune DB cluster from a Neptune global database. A secondary cluster becomes a \
   normal standalone cluster with read-write capability instead of being read-only, and no longer \
   receives data from the primary cluster.\n"]

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
[@@ocaml.doc "Disassociates an Identity and Access Management (IAM) role from a DB cluster.\n"]

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
[@@ocaml.doc "Removes a source identifier from an existing event notification subscription.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBInstanceNotFoundFault of db_instance_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBInstanceNotFoundFault of db_instance_not_found_fault
      | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes metadata tags from an Amazon Neptune resource.\n"]

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
  " Modifies the parameters of a DB cluster parameter group to the default value. To reset \
   specific parameters submit a list of the following: [ParameterName] and [ApplyMethod]. To reset \
   the entire DB cluster parameter group, specify the [DBClusterParameterGroupName] and \
   [ResetAllParameters] parameters.\n\n\
  \  When resetting the entire group, dynamic parameters are updated immediately and static \
   parameters are set to [pending-reboot] to take effect on the next DB instance restart or \
   [RebootDBInstance] request. You must call [RebootDBInstance] for every DB instance in your DB \
   cluster that you want the updated static parameter to apply to.\n\
  \ "]

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

module RestoreDBClusterFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSnapshotNotFoundFault of db_snapshot_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
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
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
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
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new DB cluster from a DB snapshot or DB cluster snapshot.\n\n\
  \ If a DB snapshot is specified, the target DB cluster is created from the source DB snapshot \
   with a default configuration and default security group.\n\
  \ \n\
  \  If a DB cluster snapshot is specified, the target DB cluster is created from the source DB \
   cluster restore point with the same configuration as the original source DB cluster, except \
   that the new DB cluster is created with the default security group.\n\
  \  "]

module RestoreDBClusterToPointInTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
    | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
    | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
    | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
    | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
    | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
    | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
    | `InvalidRestoreFault of invalid_restore_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
    | `OptionGroupNotFoundFault of option_group_not_found_fault
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `DBClusterParameterGroupNotFoundFault of db_cluster_parameter_group_not_found_fault
      | `DBClusterQuotaExceededFault of db_cluster_quota_exceeded_fault
      | `DBClusterSnapshotNotFoundFault of db_cluster_snapshot_not_found_fault
      | `DBSubnetGroupNotFoundFault of db_subnet_group_not_found_fault
      | `InsufficientDBClusterCapacityFault of insufficient_db_cluster_capacity_fault
      | `InsufficientStorageClusterCapacityFault of insufficient_storage_cluster_capacity_fault
      | `InvalidDBClusterSnapshotStateFault of invalid_db_cluster_snapshot_state_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBSnapshotStateFault of invalid_db_snapshot_state_fault
      | `InvalidRestoreFault of invalid_restore_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `NetworkTypeNotSupportedFault of network_type_not_supported_fault
      | `OptionGroupNotFoundFault of option_group_not_found_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a DB cluster to an arbitrary point in time. Users can restore to any point in time \
   before [LatestRestorableTime] for up to [BackupRetentionPeriod] days. The target DB cluster is \
   created from the source DB cluster with the same configuration as the original DB cluster, \
   except that the new DB cluster is created with the default DB security group.\n\n\
  \  This action only restores the DB cluster, not the DB instances for that DB cluster. You must \
   invoke the [CreateDBInstance] action to create DB instances for the restored DB cluster, \
   specifying the identifier of the restored DB cluster in [DBClusterIdentifier]. You can create \
   DB instances only after the [RestoreDBClusterToPointInTime] action has completed and the DB \
   cluster is available.\n\
  \  \n\
  \   "]

module StartDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_db_cluster_message ->
    ( start_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an Amazon Neptune DB cluster that was stopped using the Amazon console, the Amazon CLI \
   stop-db-cluster command, or the StopDBCluster API.\n"]

module StopDBCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_db_cluster_message ->
    ( stop_db_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an Amazon Neptune DB cluster. When you stop a DB cluster, Neptune retains the DB \
   cluster's metadata, including its endpoints and DB parameter groups.\n\n\
  \ Neptune also retains the transaction logs so you can do a point-in-time restore if necessary.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
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
  \ Promotes the specified secondary cluster to assume full read/write capabilities and demotes \
   the current primary cluster to a secondary (read-only) cluster, maintaining the original \
   replication topology. All secondary clusters are synchronized with the primary at the beginning \
   of the process so the new primary continues operations for the global database without losing \
   any data. Your database is unavailable for a short time while the primary and selected \
   secondary clusters are assuming their new roles.\n\
  \ \n\
  \   This operation is intended for controlled environments, for operations such as \"regional \
   rotation\" or to fall back to the original primary after a global database failover.\n\
  \   \n\
  \    "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
