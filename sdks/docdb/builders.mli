open Types

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
  ?database_name:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?deletion_protection:boolean_optional ->
  ?global_cluster_members:global_cluster_member_list ->
  ?failover_state:failover_state ->
  ?tag_list:tag_list ->
  unit ->
  global_cluster

val make_switchover_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier ->
  target_db_cluster_identifier:db_cluster_identifier ->
  unit ->
  switchover_global_cluster_message

val make_cluster_master_user_secret :
  ?secret_arn:string_ ->
  ?secret_status:string_ ->
  ?kms_key_id:string_ ->
  unit ->
  cluster_master_user_secret

val make_serverless_v2_scaling_configuration_info :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration_info

val make_db_cluster_role : ?role_arn:string_ -> ?status:string_ -> unit -> db_cluster_role

val make_vpc_security_group_membership :
  ?vpc_security_group_id:string_ -> ?status:string_ -> unit -> vpc_security_group_membership

val make_db_cluster_member :
  ?db_instance_identifier:string_ ->
  ?is_cluster_writer:boolean_ ->
  ?db_cluster_parameter_group_status:string_ ->
  ?promotion_tier:integer_optional ->
  unit ->
  db_cluster_member

val make_db_cluster :
  ?availability_zones:availability_zones ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_identifier:string_ ->
  ?db_cluster_parameter_group:string_ ->
  ?db_subnet_group:string_ ->
  ?status:string_ ->
  ?percent_progress:string_ ->
  ?earliest_restorable_time:t_stamp ->
  ?endpoint:string_ ->
  ?reader_endpoint:string_ ->
  ?multi_a_z:boolean_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?latest_restorable_time:t_stamp ->
  ?port:integer_optional ->
  ?master_username:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?replication_source_identifier:string_ ->
  ?read_replica_identifiers:read_replica_identifier_list ->
  ?db_cluster_members:db_cluster_member_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?hosted_zone_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?kms_key_id:string_ ->
  ?db_cluster_resource_id:string_ ->
  ?db_cluster_arn:string_ ->
  ?associated_roles:db_cluster_roles ->
  ?clone_group_id:string_ ->
  ?cluster_create_time:t_stamp ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?deletion_protection:boolean_ ->
  ?io_optimized_next_allowed_modification_time:t_stamp ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration_info ->
  ?master_user_secret:cluster_master_user_secret ->
  ?network_type:string_ ->
  unit ->
  db_cluster

val make_stop_db_cluster_message : db_cluster_identifier:string_ -> unit -> stop_db_cluster_message

val make_start_db_cluster_message :
  db_cluster_identifier:string_ -> unit -> start_db_cluster_message

val make_serverless_v2_scaling_configuration :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration

val make_restore_db_cluster_to_point_in_time_message :
  ?restore_type:string_ ->
  ?restore_to_time:t_stamp ->
  ?use_latest_restorable_time:boolean_ ->
  ?port:integer_optional ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?deletion_protection:boolean_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?storage_type:string_ ->
  ?network_type:string_ ->
  db_cluster_identifier:string_ ->
  source_db_cluster_identifier:string_ ->
  unit ->
  restore_db_cluster_to_point_in_time_message

val make_restore_db_cluster_from_snapshot_message :
  ?availability_zones:availability_zones ->
  ?engine_version:string_ ->
  ?port:integer_optional ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?deletion_protection:boolean_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?storage_type:string_ ->
  ?network_type:string_ ->
  db_cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  engine:string_ ->
  unit ->
  restore_db_cluster_from_snapshot_message

val make_db_cluster_parameter_group_name_message :
  ?db_cluster_parameter_group_name:string_ -> unit -> db_cluster_parameter_group_name_message

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_value:string_ ->
  ?description:string_ ->
  ?source:string_ ->
  ?apply_type:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?minimum_engine_version:string_ ->
  ?apply_method:apply_method ->
  unit ->
  parameter

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

val make_remove_from_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier ->
  db_cluster_identifier:string_ ->
  unit ->
  remove_from_global_cluster_message

val make_certificate_details :
  ?ca_identifier:string_ -> ?valid_till:t_stamp -> unit -> certificate_details

val make_db_instance_status_info :
  ?status_type:string_ ->
  ?normal:boolean_ ->
  ?status:string_ ->
  ?message:string_ ->
  unit ->
  db_instance_status_info

val make_pending_cloudwatch_logs_exports :
  ?log_types_to_enable:log_type_list ->
  ?log_types_to_disable:log_type_list ->
  unit ->
  pending_cloudwatch_logs_exports

val make_pending_modified_values :
  ?db_instance_class:string_ ->
  ?allocated_storage:integer_optional ->
  ?master_user_password:string_ ->
  ?port:integer_optional ->
  ?backup_retention_period:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?license_model:string_ ->
  ?iops:integer_optional ->
  ?db_instance_identifier:string_ ->
  ?storage_type:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?db_subnet_group_name:string_ ->
  ?pending_cloudwatch_logs_exports:pending_cloudwatch_logs_exports ->
  unit ->
  pending_modified_values

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:availability_zone ->
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
  ?supported_network_types:network_type_list ->
  unit ->
  db_subnet_group

val make_endpoint : ?address:string_ -> ?port:integer -> ?hosted_zone_id:string_ -> unit -> endpoint

val make_db_instance :
  ?db_instance_identifier:string_ ->
  ?db_instance_class:string_ ->
  ?engine:string_ ->
  ?db_instance_status:string_ ->
  ?endpoint:endpoint ->
  ?instance_create_time:t_stamp ->
  ?preferred_backup_window:string_ ->
  ?backup_retention_period:integer ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?availability_zone:string_ ->
  ?db_subnet_group:db_subnet_group ->
  ?preferred_maintenance_window:string_ ->
  ?pending_modified_values:pending_modified_values ->
  ?latest_restorable_time:t_stamp ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?publicly_accessible:boolean_ ->
  ?status_infos:db_instance_status_info_list ->
  ?db_cluster_identifier:string_ ->
  ?storage_encrypted:boolean_ ->
  ?kms_key_id:string_ ->
  ?dbi_resource_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?db_instance_arn:string_ ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?certificate_details:certificate_details ->
  ?performance_insights_enabled:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  unit ->
  db_instance

val make_reboot_db_instance_message :
  ?force_failover:boolean_optional ->
  db_instance_identifier:string_ ->
  unit ->
  reboot_db_instance_message

val make_modify_global_cluster_message :
  ?new_global_cluster_identifier:global_cluster_identifier ->
  ?deletion_protection:boolean_optional ->
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

val make_modify_db_instance_message :
  ?db_instance_class:string_ ->
  ?apply_immediately:boolean_ ->
  ?preferred_maintenance_window:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?new_db_instance_identifier:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?certificate_rotation_restart:boolean_optional ->
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

val make_cloudwatch_logs_export_configuration :
  ?enable_log_types:log_type_list ->
  ?disable_log_types:log_type_list ->
  unit ->
  cloudwatch_logs_export_configuration

val make_modify_db_cluster_message :
  ?new_db_cluster_identifier:string_ ->
  ?apply_immediately:boolean_ ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?port:integer_optional ->
  ?master_user_password:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?engine_version:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?deletion_protection:boolean_optional ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?rotate_master_user_password:boolean_optional ->
  ?network_type:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  modify_db_cluster_message

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
  ?db_cluster_identifier:string_ ->
  ?target_db_instance_identifier:string_ ->
  unit ->
  failover_db_cluster_message

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

val make_orderable_db_instance_option :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?db_instance_class:string_ ->
  ?license_model:string_ ->
  ?availability_zones:availability_zone_list ->
  ?vpc:boolean_ ->
  ?storage_type:string_ ->
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
  ?vpc:boolean_optional ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  engine:string_ ->
  unit ->
  describe_orderable_db_instance_options_message

val make_global_clusters_message :
  ?marker:string_ -> ?global_clusters:global_cluster_list -> unit -> global_clusters_message

val make_describe_global_clusters_message :
  ?global_cluster_identifier:global_cluster_identifier ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_global_clusters_message

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

val make_db_instance_message :
  ?marker:string_ -> ?db_instances:db_instance_list -> unit -> db_instance_message

val make_describe_db_instances_message :
  ?db_instance_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_db_instances_message

val make_serverless_v2_features_support :
  ?min_capacity:double_optional ->
  ?max_capacity:double_optional ->
  unit ->
  serverless_v2_features_support

val make_upgrade_target :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?description:string_ ->
  ?auto_upgrade:boolean_ ->
  ?is_major_version_upgrade:boolean_ ->
  unit ->
  upgrade_target

val make_db_engine_version :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?db_parameter_group_family:string_ ->
  ?db_engine_description:string_ ->
  ?db_engine_version_description:string_ ->
  ?valid_upgrade_target:valid_upgrade_target_list ->
  ?exportable_log_types:log_type_list ->
  ?supports_log_exports_to_cloudwatch_logs:boolean_ ->
  ?supported_ca_certificate_identifiers:ca_certificate_identifiers_list ->
  ?supports_certificate_rotation_without_restart:boolean_optional ->
  ?serverless_v2_features_support:serverless_v2_features_support ->
  unit ->
  db_engine_version

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
  unit ->
  describe_db_engine_versions_message

val make_db_cluster_snapshot :
  ?availability_zones:availability_zones ->
  ?db_cluster_snapshot_identifier:string_ ->
  ?db_cluster_identifier:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?engine:string_ ->
  ?status:string_ ->
  ?port:integer ->
  ?vpc_id:string_ ->
  ?cluster_create_time:t_stamp ->
  ?master_username:string_ ->
  ?engine_version:string_ ->
  ?snapshot_type:string_ ->
  ?percent_progress:integer ->
  ?storage_encrypted:boolean_ ->
  ?kms_key_id:string_ ->
  ?db_cluster_snapshot_arn:string_ ->
  ?source_db_cluster_snapshot_arn:string_ ->
  ?storage_type:string_ ->
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

val make_certificate :
  ?certificate_identifier:string_ ->
  ?certificate_type:string_ ->
  ?thumbprint:string_ ->
  ?valid_from:t_stamp ->
  ?valid_till:t_stamp ->
  ?certificate_arn:string_ ->
  unit ->
  certificate

val make_certificate_message :
  ?certificates:certificate_list -> ?marker:string_ -> unit -> certificate_message

val make_describe_certificates_message :
  ?certificate_identifier:string_ ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_certificates_message

val make_delete_global_cluster_message :
  global_cluster_identifier:global_cluster_identifier -> unit -> delete_global_cluster_message

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_db_subnet_group_message :
  db_subnet_group_name:string_ -> unit -> delete_db_subnet_group_message

val make_delete_db_instance_message :
  db_instance_identifier:string_ -> unit -> delete_db_instance_message

val make_delete_db_cluster_snapshot_message :
  db_cluster_snapshot_identifier:string_ -> unit -> delete_db_cluster_snapshot_message

val make_delete_db_cluster_parameter_group_message :
  db_cluster_parameter_group_name:string_ -> unit -> delete_db_cluster_parameter_group_message

val make_delete_db_cluster_message :
  ?skip_final_snapshot:boolean_ ->
  ?final_db_snapshot_identifier:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  delete_db_cluster_message

val make_create_global_cluster_message :
  ?source_db_cluster_identifier:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?deletion_protection:boolean_optional ->
  ?database_name:string_ ->
  ?storage_encrypted:boolean_optional ->
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

val make_create_db_instance_message :
  ?availability_zone:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?tags:tag_list ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?enable_performance_insights:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  db_instance_identifier:string_ ->
  db_instance_class:string_ ->
  engine:string_ ->
  db_cluster_identifier:string_ ->
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

val make_create_db_cluster_message :
  ?availability_zones:availability_zones ->
  ?backup_retention_period:integer_optional ->
  ?db_cluster_parameter_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_subnet_group_name:string_ ->
  ?engine_version:string_ ->
  ?port:integer_optional ->
  ?master_username:string_ ->
  ?master_user_password:string_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?tags:tag_list ->
  ?storage_encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?pre_signed_url:string_ ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?deletion_protection:boolean_optional ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?manage_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?network_type:string_ ->
  db_cluster_identifier:string_ ->
  engine:string_ ->
  unit ->
  create_db_cluster_message

val make_copy_db_cluster_snapshot_message :
  ?kms_key_id:string_ ->
  ?pre_signed_url:string_ ->
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

val make_apply_pending_maintenance_action_message :
  resource_identifier:string_ ->
  apply_action:string_ ->
  opt_in_type:string_ ->
  unit ->
  apply_pending_maintenance_action_message
