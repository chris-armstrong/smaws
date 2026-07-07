(** DocDB client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_vpc_security_group_membership :
  ?status:string_ -> ?vpc_security_group_id:string_ -> unit -> vpc_security_group_membership

val make_upgrade_target :
  ?is_major_version_upgrade:boolean_ ->
  ?auto_upgrade:boolean_ ->
  ?description:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  upgrade_target

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag
val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message

val make_global_cluster_member :
  ?synchronization_status:global_cluster_member_synchronization_status ->
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
  target_db_cluster_identifier:db_cluster_identifier ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  switchover_global_cluster_message

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_status:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_db_cluster_member :
  ?promotion_tier:integer_optional ->
  ?db_cluster_parameter_group_status:string_ ->
  ?is_cluster_writer:boolean_ ->
  ?db_instance_identifier:string_ ->
  unit ->
  db_cluster_member

val make_db_cluster_role : ?status:string_ -> ?role_arn:string_ -> unit -> db_cluster_role

val make_serverless_v2_scaling_configuration_info :
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_scaling_configuration_info

val make_cluster_master_user_secret :
  ?kms_key_id:string_ ->
  ?secret_status:string_ ->
  ?secret_arn:string_ ->
  unit ->
  cluster_master_user_secret

val make_db_cluster :
  ?network_type:string_ ->
  ?master_user_secret:cluster_master_user_secret ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration_info ->
  ?storage_type:string_ ->
  ?io_optimized_next_allowed_modification_time:t_stamp ->
  ?deletion_protection:boolean_ ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?cluster_create_time:t_stamp ->
  ?clone_group_id:string_ ->
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
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
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

val make_serverless_v2_features_support :
  ?max_capacity:double_optional ->
  ?min_capacity:double_optional ->
  unit ->
  serverless_v2_features_support

val make_restore_db_cluster_to_point_in_time_message :
  ?network_type:string_ ->
  ?storage_type:string_ ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
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
  ?db_cluster_parameter_group_name:string_ ->
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
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

val make_remove_from_global_cluster_message :
  db_cluster_identifier:string_ ->
  global_cluster_identifier:global_cluster_identifier ->
  unit ->
  remove_from_global_cluster_message

val make_endpoint : ?hosted_zone_id:string_ -> ?port:integer -> ?address:string_ -> unit -> endpoint

val make_db_subnet_group :
  ?supported_network_types:network_type_list ->
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

val make_db_instance_status_info :
  ?message:string_ ->
  ?status:string_ ->
  ?normal:boolean_ ->
  ?status_type:string_ ->
  unit ->
  db_instance_status_info

val make_certificate_details :
  ?valid_till:t_stamp -> ?ca_identifier:string_ -> unit -> certificate_details

val make_db_instance :
  ?performance_insights_kms_key_id:string_ ->
  ?performance_insights_enabled:boolean_optional ->
  ?certificate_details:certificate_details ->
  ?enabled_cloudwatch_logs_exports:log_type_list ->
  ?db_instance_arn:string_ ->
  ?promotion_tier:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?dbi_resource_id:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?db_cluster_identifier:string_ ->
  ?status_infos:db_instance_status_info_list ->
  ?publicly_accessible:boolean_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?latest_restorable_time:t_stamp ->
  ?pending_modified_values:pending_modified_values ->
  ?preferred_maintenance_window:string_ ->
  ?db_subnet_group:db_subnet_group ->
  ?availability_zone:string_ ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?backup_retention_period:integer ->
  ?preferred_backup_window:string_ ->
  ?instance_create_time:t_stamp ->
  ?endpoint:endpoint ->
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

val make_pending_maintenance_actions_message :
  ?marker:string_ ->
  ?pending_maintenance_actions:pending_maintenance_actions ->
  unit ->
  pending_maintenance_actions_message

val make_orderable_db_instance_option :
  ?storage_type:string_ ->
  ?vpc:boolean_ ->
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

val make_modify_db_instance_message :
  ?certificate_rotation_restart:boolean_optional ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?ca_certificate_identifier:string_ ->
  ?new_db_instance_identifier:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?apply_immediately:boolean_ ->
  ?db_instance_class:string_ ->
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

val make_cloudwatch_logs_export_configuration :
  ?disable_log_types:log_type_list ->
  ?enable_log_types:log_type_list ->
  unit ->
  cloudwatch_logs_export_configuration

val make_modify_db_cluster_message :
  ?network_type:string_ ->
  ?rotate_master_user_password:boolean_optional ->
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?storage_type:string_ ->
  ?deletion_protection:boolean_optional ->
  ?allow_major_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?cloudwatch_logs_export_configuration:cloudwatch_logs_export_configuration ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
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
  ?filters:filter_list ->
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
  ?serverless_v2_features_support:serverless_v2_features_support ->
  ?supports_certificate_rotation_without_restart:boolean_optional ->
  ?supported_ca_certificate_identifiers:ca_certificate_identifiers_list ->
  ?supports_log_exports_to_cloudwatch_logs:boolean_ ->
  ?exportable_log_types:log_type_list ->
  ?valid_upgrade_target:valid_upgrade_target_list ->
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
  ?source_db_cluster_snapshot_arn:string_ ->
  ?db_cluster_snapshot_arn:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_ ->
  ?percent_progress:integer ->
  ?snapshot_type:string_ ->
  ?engine_version:string_ ->
  ?master_username:string_ ->
  ?cluster_create_time:t_stamp ->
  ?vpc_id:string_ ->
  ?port:integer ->
  ?status:string_ ->
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

val make_describe_certificates_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?certificate_identifier:string_ ->
  unit ->
  describe_certificates_message

val make_certificate :
  ?certificate_arn:string_ ->
  ?valid_till:t_stamp ->
  ?valid_from:t_stamp ->
  ?thumbprint:string_ ->
  ?certificate_type:string_ ->
  ?certificate_identifier:string_ ->
  unit ->
  certificate

val make_certificate_message :
  ?marker:string_ -> ?certificates:certificate_list -> unit -> certificate_message

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
  ?final_db_snapshot_identifier:string_ ->
  ?skip_final_snapshot:boolean_ ->
  db_cluster_identifier:string_ ->
  unit ->
  delete_db_cluster_message

val make_create_global_cluster_message :
  ?storage_encrypted:boolean_optional ->
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

val make_create_db_instance_message :
  ?ca_certificate_identifier:string_ ->
  ?performance_insights_kms_key_id:string_ ->
  ?enable_performance_insights:boolean_optional ->
  ?promotion_tier:integer_optional ->
  ?copy_tags_to_snapshot:boolean_optional ->
  ?tags:tag_list ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?availability_zone:string_ ->
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
  ?master_user_secret_kms_key_id:string_ ->
  ?manage_master_user_password:boolean_optional ->
  ?serverless_v2_scaling_configuration:serverless_v2_scaling_configuration ->
  ?storage_type:string_ ->
  ?global_cluster_identifier:global_cluster_identifier ->
  ?deletion_protection:boolean_optional ->
  ?enable_cloudwatch_logs_exports:log_type_list ->
  ?pre_signed_url:string_ ->
  ?kms_key_id:string_ ->
  ?storage_encrypted:boolean_optional ->
  ?tags:tag_list ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?master_user_password:string_ ->
  ?master_username:string_ ->
  ?port:integer_optional ->
  ?engine_version:string_ ->
  ?db_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?db_cluster_parameter_group_name:string_ ->
  ?backup_retention_period:integer_optional ->
  ?availability_zones:availability_zones ->
  engine:string_ ->
  db_cluster_identifier:string_ ->
  unit ->
  create_db_cluster_message

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
(** {1:operations Operations} *)

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
  "Adds metadata tags to an Amazon DocumentDB resource. You can use these tags with cost \
   allocation reporting to track costs that are associated with Amazon DocumentDB resources or in \
   a [Condition] statement in an Identity and Access Management (IAM) policy for Amazon DocumentDB.\n"]

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
  "Applies a pending maintenance action to a resource (for example, to an Amazon DocumentDB \
   instance).\n"]

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
[@@ocaml.doc "Copies the specified cluster parameter group.\n"]

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
  "Copies a snapshot of a cluster.\n\n\
  \ To copy a cluster snapshot from a shared manual cluster snapshot, \
   [SourceDBClusterSnapshotIdentifier] must be the Amazon Resource Name (ARN) of the shared \
   cluster snapshot. You can only copy a shared DB cluster snapshot, whether encrypted or not, in \
   the same Amazon Web Services Region.\n\
  \ \n\
  \  To cancel the copy operation after it is in progress, delete the target cluster snapshot \
   identified by [TargetDBClusterSnapshotIdentifier] while that cluster snapshot is in the {i \
   copying} status.\n\
  \  "]

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
    | `NetworkTypeNotSupported of network_type_not_supported
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
      | `NetworkTypeNotSupported of network_type_not_supported
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Amazon DocumentDB cluster.\n"]

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
  "Creates a new cluster parameter group.\n\n\
  \ Parameters in a cluster parameter group apply to all of the instances in a cluster.\n\
  \ \n\
  \  A cluster parameter group is initially created with the default parameters for the database \
   engine used by instances in the cluster. In Amazon DocumentDB, you cannot make modifications \
   directly to the [default.docdb3.6] cluster parameter group. If your Amazon DocumentDB cluster \
   is using the default cluster parameter group and you want to modify a value in it, you must \
   first \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-create.html} \
   create a new parameter group} or \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-copy.html} \
   copy an existing parameter group}, modify it, and then apply the modified parameter group to \
   your cluster. For the new cluster parameter group and associated settings to take effect, you \
   must then reboot the instances in the cluster without failover. For more information, see \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/cluster_parameter_group-modify.html} \
   Modifying Amazon DocumentDB Cluster Parameter Groups}. \n\
  \  "]

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
[@@ocaml.doc "Creates a snapshot of a cluster. \n"]

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
    | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
    | `InvalidSubnet of invalid_subnet
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
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
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
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
      | `InstanceQuotaExceededFault of instance_quota_exceeded_fault
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBClusterStateFault of invalid_db_cluster_state_fault
      | `InvalidSubnet of invalid_subnet
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new instance.\n"]

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
  "Creates a new subnet group. subnet groups must contain at least one subnet in at least two \
   Availability Zones in the Amazon Web Services Region.\n"]

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
  "Creates an Amazon DocumentDB event notification subscription. This action requires a topic \
   Amazon Resource Name (ARN) created by using the Amazon DocumentDB console, the Amazon SNS \
   console, or the Amazon SNS API. To obtain an ARN with Amazon SNS, you must create a topic in \
   Amazon SNS and subscribe to the topic. The ARN is displayed in the Amazon SNS console.\n\n\
  \ You can specify the type of source ([SourceType]) that you want to be notified of. You can \
   also provide a list of Amazon DocumentDB sources ([SourceIds]) that trigger the events, and you \
   can provide a list of event categories ([EventCategories]) for events that you want to be \
   notified of. For example, you can specify [SourceType = db-instance], [SourceIds = \
   mydbinstance1, mydbinstance2] and [EventCategories = Availability, Backup].\n\
  \ \n\
  \  If you specify both the [SourceType] and [SourceIds] (such as [SourceType = db-instance] and \
   [SourceIdentifier = myDBInstance1]), you are notified of all the [db-instance] events for the \
   specified source. If you specify a [SourceType] but do not specify a [SourceIdentifier], you \
   receive notice of the events for that source type for all your Amazon DocumentDB sources. If \
   you do not specify either the [SourceType] or the [SourceIdentifier], you are notified of \
   events generated from all Amazon DocumentDB sources belonging to your customer account.\n\
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
  "Creates an Amazon DocumentDB global cluster that can span multiple multiple Amazon Web Services \
   Regions. The global cluster contains one primary cluster with read-write capability, and up-to \
   10 read-only secondary clusters. Global clusters uses storage-based fast replication across \
   regions with latencies less than one second, using dedicated infrastructure with no impact to \
   your workload\226\128\153s performance.\n\n\
  \ \n\
  \ \n\
  \  You can create a global cluster that is initially empty, and then add a primary and a \
   secondary to it. Or you can specify an existing cluster during the create operation, and this \
   cluster becomes the primary of the global cluster. \n\
  \  \n\
  \    This action only applies to Amazon DocumentDB clusters.\n\
  \    \n\
  \     "]

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
  "Deletes a previously provisioned cluster. When you delete a cluster, all automated backups for \
   that cluster are deleted and can't be recovered. Manual DB cluster snapshots of the specified \
   cluster are not deleted.\n\n\
  \ \n\
  \ "]

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
  "Deletes a specified cluster parameter group. The cluster parameter group to be deleted can't be \
   associated with any clusters.\n"]

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
  "Deletes a cluster snapshot. If the snapshot is being copied, the copy operation is terminated.\n\n\
  \  The cluster snapshot must be in the [available] state to be deleted.\n\
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
[@@ocaml.doc "Deletes a previously provisioned instance.\n"]

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
  "Deletes a subnet group.\n\n\
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
[@@ocaml.doc "Deletes an Amazon DocumentDB event notification subscription.\n"]

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
  "Deletes a global cluster. The primary and secondary clusters must already be detached or \
   deleted before attempting to delete a global cluster.\n\n\
  \  This action only applies to Amazon DocumentDB clusters.\n\
  \  \n\
  \   "]

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
  "Returns a list of certificate authority (CA) certificates provided by Amazon DocumentDB for \
   this Amazon Web Services account.\n"]

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
   parameter is specified, the list contains only the description of the specified cluster \
   parameter group. \n"]

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
[@@ocaml.doc "Returns the detailed parameter list for a particular cluster parameter group.\n"]

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
  "Returns a list of cluster snapshot attribute names and values for a manual DB cluster snapshot.\n\n\
  \ When you share snapshots with other Amazon Web Services accounts, \
   [DescribeDBClusterSnapshotAttributes] returns the [restore] attribute and a list of IDs for the \
   Amazon Web Services accounts that are authorized to copy or restore the manual cluster \
   snapshot. If [all] is included in the list of values for the [restore] attribute, then the \
   manual cluster snapshot is public and can be copied or restored by all Amazon Web Services \
   accounts.\n\
  \ "]

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
  "Returns information about cluster snapshots. This API operation supports pagination.\n"]

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
  "Returns information about provisioned Amazon DocumentDB clusters. This API operation supports \
   pagination. For certain management features such as cluster and instance lifecycle management, \
   Amazon DocumentDB leverages operational technology that is shared with Amazon RDS and Amazon \
   Neptune. Use the [filterName=engine,Values=docdb] filter parameter to return only Amazon \
   DocumentDB clusters.\n"]

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
[@@ocaml.doc "Returns a list of the available engines.\n"]

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
  "Returns information about provisioned Amazon DocumentDB instances. This API supports pagination.\n"]

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
  "Returns a list of [DBSubnetGroup] descriptions. If a [DBSubnetGroupName] is specified, the list \
   will contain only the descriptions of the specified [DBSubnetGroup].\n"]

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
   source type. \n"]

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
  "Returns events related to instances, security groups, snapshots, and DB parameter groups for \
   the past 14 days. You can obtain events specific to a particular DB instance, security group, \
   snapshot, or parameter group by providing the name as a parameter. By default, the events of \
   the past hour are returned.\n"]

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
  "Returns information about Amazon DocumentDB global clusters. This API supports pagination.\n\n\
  \  This action only applies to Amazon DocumentDB clusters.\n\
  \  \n\
  \   "]

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
[@@ocaml.doc "Returns a list of orderable instance options for the specified engine.\n"]

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
  "Returns a list of resources (for example, instances) that have at least one pending maintenance \
   action.\n"]

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
  "Forces a failover for a cluster.\n\n\
  \ A failover for a cluster promotes one of the Amazon DocumentDB replicas (read-only instances) \
   in the cluster to be the primary instance (the cluster writer).\n\
  \ \n\
  \  If the primary instance fails, Amazon DocumentDB automatically fails over to an Amazon \
   DocumentDB replica, if one exists. You can force a failover when you want to simulate a failure \
   of a primary instance for testing.\n\
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
  "Promotes the specified secondary DB cluster to be the primary DB cluster in the global cluster \
   when failing over a global cluster occurs.\n\n\
  \ Use this operation to respond to an unplanned event, such as a regional disaster in the \
   primary region. Failing over can result in a loss of write transaction data that wasn't \
   replicated to the chosen secondary before the failover event occurred. However, the recovery \
   process that promotes a DB instance on the chosen seconday DB cluster to be the primary writer \
   DB instance guarantees that the data is in a transactionally consistent state.\n\
  \ "]

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
[@@ocaml.doc "Lists all tags on an Amazon DocumentDB resource.\n"]

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
    | `NetworkTypeNotSupported of network_type_not_supported
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a setting for an Amazon DocumentDB cluster. You can change one or more database \
   configuration parameters by specifying these parameters and the new values in the request. \n"]

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
  " Modifies the parameters of a cluster parameter group. To modify more than one parameter, \
   submit a list of the following: [ParameterName], [ParameterValue], and [ApplyMethod]. A maximum \
   of 20 parameters can be modified in a single request. \n\n\
  \  Changes to dynamic parameters are applied immediately. Changes to static parameters require a \
   reboot or maintenance window before the change can take effect.\n\
  \  \n\
  \     After you create a cluster parameter group, you should wait at least 5 minutes before \
   creating your first cluster that uses that cluster parameter group as the default parameter \
   group. This allows Amazon DocumentDB to fully complete the create action before the parameter \
   group is used as the default for a new cluster. This step is especially important for \
   parameters that are critical when creating the default database for a cluster, such as the \
   character set for the default database defined by the [character_set_database] parameter.\n\
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
  "Adds an attribute and values to, or removes an attribute and values from, a manual cluster \
   snapshot.\n\n\
  \ To share a manual cluster snapshot with other Amazon Web Services accounts, specify [restore] \
   as the [AttributeName], and use the [ValuesToAdd] parameter to add a list of IDs of the Amazon \
   Web Services accounts that are authorized to restore the manual cluster snapshot. Use the value \
   [all] to make the manual cluster snapshot public, which means that it can be copied or restored \
   by all Amazon Web Services accounts. Do not add the [all] value for any manual cluster \
   snapshots that contain private information that you don't want available to all Amazon Web \
   Services accounts. If a manual cluster snapshot is encrypted, it can be shared, but only by \
   specifying a list of authorized Amazon Web Services account IDs for the [ValuesToAdd] \
   parameter. You can't use [all] as a value for that parameter in this case.\n\
  \ "]

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
    | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
    | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
    | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
    | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
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
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
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
      | `InsufficientDBInstanceCapacityFault of insufficient_db_instance_capacity_fault
      | `InvalidDBInstanceStateFault of invalid_db_instance_state_fault
      | `InvalidDBSecurityGroupStateFault of invalid_db_security_group_state_fault
      | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault
      | `StorageTypeNotSupportedFault of storage_type_not_supported_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies settings for an instance. You can change one or more database configuration parameters \
   by specifying these parameters and the new values in the request.\n"]

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
  "Modifies an existing subnet group. subnet groups must contain at least one subnet in at least \
   two Availability Zones in the Amazon Web Services Region.\n"]

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
[@@ocaml.doc "Modifies an existing Amazon DocumentDB event notification subscription.\n"]

module ModifyGlobalCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
    | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_global_cluster_message ->
    ( modify_global_cluster_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GlobalClusterNotFoundFault of global_cluster_not_found_fault
      | `InvalidGlobalClusterStateFault of invalid_global_cluster_state_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modify a setting for an Amazon DocumentDB global cluster. You can change one or more \
   configuration parameters (for example: deletion protection), or the global cluster identifier \
   by specifying these parameters and the new values in the request.\n\n\
  \  This action only applies to Amazon DocumentDB clusters.\n\
  \  \n\
  \   "]

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
  "You might need to reboot your instance, usually for maintenance reasons. For example, if you \
   make certain changes, or if you change the cluster parameter group that is associated with the \
   instance, you must reboot the instance for the changes to take effect. \n\n\
  \ Rebooting an instance restarts the database engine service. Rebooting an instance results in a \
   momentary outage, during which the instance status is set to {i rebooting}. \n\
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
  "Detaches an Amazon DocumentDB secondary cluster from a global cluster. The cluster becomes a \
   standalone cluster with read-write capability instead of being read-only and receiving data \
   from a primary in a different region. \n\n\
  \  This action only applies to Amazon DocumentDB clusters.\n\
  \  \n\
  \   "]

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
[@@ocaml.doc
  "Removes a source identifier from an existing Amazon DocumentDB event notification subscription.\n"]

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
[@@ocaml.doc "Removes metadata tags from an Amazon DocumentDB resource.\n"]

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
  " Modifies the parameters of a cluster parameter group to the default value. To reset specific \
   parameters, submit a list of the following: [ParameterName] and [ApplyMethod]. To reset the \
   entire cluster parameter group, specify the [DBClusterParameterGroupName] and \
   [ResetAllParameters] parameters. \n\n\
  \  When you reset the entire group, dynamic parameters are updated immediately and static \
   parameters are set to [pending-reboot] to take effect on the next DB instance reboot.\n\
  \ "]

module RestoreDBClusterFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
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
    | `NetworkTypeNotSupported of network_type_not_supported
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_from_snapshot_message ->
    ( restore_db_cluster_from_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cluster from a snapshot or cluster snapshot.\n\n\
  \ If a snapshot is specified, the target cluster is created from the source DB snapshot with a \
   default configuration and default security group.\n\
  \ \n\
  \  If a cluster snapshot is specified, the target cluster is created from the source cluster \
   restore point with the same configuration as the original source DB cluster, except that the \
   new cluster is created with the default security group.\n\
  \  "]

module RestoreDBClusterToPointInTime : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
    | `DBClusterNotFoundFault of db_cluster_not_found_fault
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
    | `NetworkTypeNotSupported of network_type_not_supported
    | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_db_cluster_to_point_in_time_message ->
    ( restore_db_cluster_to_point_in_time_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DBClusterAlreadyExistsFault of db_cluster_already_exists_fault
      | `DBClusterNotFoundFault of db_cluster_not_found_fault
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
      | `NetworkTypeNotSupported of network_type_not_supported
      | `StorageQuotaExceededFault of storage_quota_exceeded_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a cluster to an arbitrary point in time. Users can restore to any point in time before \
   [LatestRestorableTime] for up to [BackupRetentionPeriod] days. The target cluster is created \
   from the source cluster with the same configuration as the original cluster, except that the \
   new cluster is created with the default security group. \n"]

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
  "Restarts the stopped cluster that is specified by [DBClusterIdentifier]. For more information, \
   see \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html}Stopping \
   and Starting an Amazon DocumentDB Cluster}.\n"]

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
  "Stops the running cluster that is specified by [DBClusterIdentifier]. The cluster must be in \
   the {i available} state. For more information, see \
   {{:https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-stop-start.html}Stopping \
   and Starting an Amazon DocumentDB Cluster}.\n"]

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
  "Switches over the specified secondary Amazon DocumentDB cluster to be the new primary Amazon \
   DocumentDB cluster in the global database cluster.\n"]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
