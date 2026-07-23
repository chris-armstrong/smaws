open Types

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag
val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message

val make_add_tags_to_resource_message :
  resource_name:string_ -> tags:tag_list -> unit -> add_tags_to_resource_message

val make_allowed_node_type_modifications_message :
  ?scale_up_modifications:node_type_list ->
  ?scale_down_modifications:node_type_list ->
  unit ->
  allowed_node_type_modifications_message

val make_kinesis_firehose_destination_details :
  ?delivery_stream:string_ -> unit -> kinesis_firehose_destination_details

val make_cloud_watch_logs_destination_details :
  ?log_group:string_ -> unit -> cloud_watch_logs_destination_details

val make_destination_details :
  ?cloud_watch_logs_details:cloud_watch_logs_destination_details ->
  ?kinesis_firehose_details:kinesis_firehose_destination_details ->
  unit ->
  destination_details

val make_log_delivery_configuration :
  ?log_type:log_type ->
  ?destination_type:destination_type ->
  ?destination_details:destination_details ->
  ?log_format:log_format ->
  ?status:log_delivery_configuration_status ->
  ?message:string_ ->
  unit ->
  log_delivery_configuration

val make_endpoint : ?address:string_ -> ?port:integer -> unit -> endpoint

val make_node_group_member :
  ?cache_cluster_id:string_ ->
  ?cache_node_id:string_ ->
  ?read_endpoint:endpoint ->
  ?preferred_availability_zone:string_ ->
  ?preferred_outpost_arn:string_ ->
  ?current_role:string_ ->
  unit ->
  node_group_member

val make_node_group :
  ?node_group_id:string_ ->
  ?status:string_ ->
  ?primary_endpoint:endpoint ->
  ?reader_endpoint:endpoint ->
  ?slots:string_ ->
  ?node_group_members:node_group_member_list ->
  unit ->
  node_group

val make_pending_log_delivery_configuration :
  ?log_type:log_type ->
  ?destination_type:destination_type ->
  ?destination_details:destination_details ->
  ?log_format:log_format ->
  unit ->
  pending_log_delivery_configuration

val make_user_groups_update_status :
  ?user_group_ids_to_add:user_group_id_list ->
  ?user_group_ids_to_remove:user_group_id_list ->
  unit ->
  user_groups_update_status

val make_slot_migration : ?progress_percentage:double -> unit -> slot_migration
val make_resharding_status : ?slot_migration:slot_migration -> unit -> resharding_status

val make_replication_group_pending_modified_values :
  ?primary_cluster_id:string_ ->
  ?automatic_failover_status:pending_automatic_failover_status ->
  ?resharding:resharding_status ->
  ?auth_token_status:auth_token_update_status ->
  ?user_groups:user_groups_update_status ->
  ?log_delivery_configurations:pending_log_delivery_configuration_list ->
  ?transit_encryption_enabled:boolean_optional ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?cluster_mode:cluster_mode ->
  unit ->
  replication_group_pending_modified_values

val make_global_replication_group_info :
  ?global_replication_group_id:string_ ->
  ?global_replication_group_member_role:string_ ->
  unit ->
  global_replication_group_info

val make_replication_group :
  ?replication_group_id:string_ ->
  ?description:string_ ->
  ?global_replication_group_info:global_replication_group_info ->
  ?status:string_ ->
  ?pending_modified_values:replication_group_pending_modified_values ->
  ?member_clusters:cluster_id_list ->
  ?node_groups:node_group_list ->
  ?snapshotting_cluster_id:string_ ->
  ?automatic_failover:automatic_failover_status ->
  ?multi_a_z:multi_az_status ->
  ?configuration_endpoint:endpoint ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?cluster_enabled:boolean_optional ->
  ?cache_node_type:string_ ->
  ?auth_token_enabled:boolean_optional ->
  ?auth_token_last_modified_date:t_stamp ->
  ?transit_encryption_enabled:boolean_optional ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?member_clusters_outpost_arns:replication_group_outpost_arn_list ->
  ?kms_key_id:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?ar_n:string_ ->
  ?user_group_ids:user_group_id_list ->
  ?log_delivery_configurations:log_delivery_configuration_list ->
  ?replication_group_create_time:t_stamp ->
  ?data_tiering:data_tiering_status ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?cluster_mode:cluster_mode ->
  ?engine:string_ ->
  ?durability:durability ->
  ?effective_durability:effective_durability ->
  unit ->
  replication_group

val make_test_migration_response :
  ?replication_group:replication_group -> unit -> test_migration_response

val make_customer_node_endpoint :
  ?address:string_ -> ?port:integer_optional -> unit -> customer_node_endpoint

val make_test_migration_message :
  replication_group_id:string_ ->
  customer_node_endpoint_list:customer_node_endpoint_list ->
  unit ->
  test_migration_message

val make_test_failover_message :
  replication_group_id:string_ ->
  node_group_id:allowed_node_group_id ->
  unit ->
  test_failover_message

val make_start_migration_response :
  ?replication_group:replication_group -> unit -> start_migration_response

val make_start_migration_message :
  replication_group_id:string_ ->
  customer_node_endpoint_list:customer_node_endpoint_list ->
  unit ->
  start_migration_message

val make_ec2_security_group :
  ?status:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  unit ->
  ec2_security_group

val make_cache_security_group :
  ?owner_id:string_ ->
  ?cache_security_group_name:string_ ->
  ?description:string_ ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?ar_n:string_ ->
  unit ->
  cache_security_group

val make_revoke_cache_security_group_ingress_message :
  cache_security_group_name:string_ ->
  ec2_security_group_name:string_ ->
  ec2_security_group_owner_id:string_ ->
  unit ->
  revoke_cache_security_group_ingress_message

val make_cache_parameter_group_name_message :
  ?cache_parameter_group_name:string_ -> unit -> cache_parameter_group_name_message

val make_parameter_name_value :
  ?parameter_name:string_ -> ?parameter_value:string_ -> unit -> parameter_name_value

val make_reset_cache_parameter_group_message :
  ?reset_all_parameters:boolean_ ->
  ?parameter_name_values:parameter_name_value_list ->
  cache_parameter_group_name:string_ ->
  unit ->
  reset_cache_parameter_group_message

val make_remove_tags_from_resource_message :
  resource_name:string_ -> tag_keys:key_list -> unit -> remove_tags_from_resource_message

val make_security_group_membership :
  ?security_group_id:string_ -> ?status:string_ -> unit -> security_group_membership

val make_cache_node :
  ?cache_node_id:string_ ->
  ?cache_node_status:string_ ->
  ?cache_node_create_time:t_stamp ->
  ?endpoint:endpoint ->
  ?parameter_group_status:string_ ->
  ?source_cache_node_id:string_ ->
  ?customer_availability_zone:string_ ->
  ?customer_outpost_arn:string_ ->
  unit ->
  cache_node

val make_cache_parameter_group_status :
  ?cache_parameter_group_name:string_ ->
  ?parameter_apply_status:string_ ->
  ?cache_node_ids_to_reboot:cache_node_ids_list ->
  unit ->
  cache_parameter_group_status

val make_cache_security_group_membership :
  ?cache_security_group_name:string_ -> ?status:string_ -> unit -> cache_security_group_membership

val make_notification_configuration :
  ?topic_arn:string_ -> ?topic_status:string_ -> unit -> notification_configuration

val make_scale_config :
  ?scale_percentage:integer_optional ->
  ?scale_interval_minutes:integer_optional ->
  unit ->
  scale_config

val make_pending_modified_values :
  ?num_cache_nodes:integer_optional ->
  ?cache_node_ids_to_remove:cache_node_ids_list ->
  ?engine_version:string_ ->
  ?cache_node_type:string_ ->
  ?auth_token_status:auth_token_update_status ->
  ?log_delivery_configurations:pending_log_delivery_configuration_list ->
  ?transit_encryption_enabled:boolean_optional ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?scale_config:scale_config ->
  unit ->
  pending_modified_values

val make_cache_cluster :
  ?cache_cluster_id:string_ ->
  ?configuration_endpoint:endpoint ->
  ?client_download_landing_page:string_ ->
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_cluster_status:string_ ->
  ?num_cache_nodes:integer_optional ->
  ?preferred_availability_zone:string_ ->
  ?preferred_outpost_arn:string_ ->
  ?cache_cluster_create_time:t_stamp ->
  ?preferred_maintenance_window:string_ ->
  ?pending_modified_values:pending_modified_values ->
  ?notification_configuration:notification_configuration ->
  ?cache_security_groups:cache_security_group_membership_list ->
  ?cache_parameter_group:cache_parameter_group_status ->
  ?cache_subnet_group_name:string_ ->
  ?cache_nodes:cache_node_list ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?security_groups:security_group_membership_list ->
  ?replication_group_id:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?auth_token_enabled:boolean_optional ->
  ?auth_token_last_modified_date:t_stamp ->
  ?transit_encryption_enabled:boolean_optional ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?ar_n:string_ ->
  ?replication_group_log_delivery_enabled:boolean_ ->
  ?log_delivery_configurations:log_delivery_configuration_list ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  ?transit_encryption_mode:transit_encryption_mode ->
  unit ->
  cache_cluster

val make_reboot_cache_cluster_message :
  cache_cluster_id:string_ ->
  cache_node_ids_to_reboot:cache_node_ids_list ->
  unit ->
  reboot_cache_cluster_message

val make_global_node_group :
  ?global_node_group_id:string_ -> ?slots:string_ -> unit -> global_node_group

val make_global_replication_group_member :
  ?replication_group_id:string_ ->
  ?replication_group_region:string_ ->
  ?role:string_ ->
  ?automatic_failover:automatic_failover_status ->
  ?status:string_ ->
  unit ->
  global_replication_group_member

val make_global_replication_group :
  ?global_replication_group_id:string_ ->
  ?global_replication_group_description:string_ ->
  ?status:string_ ->
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?members:global_replication_group_member_list ->
  ?cluster_enabled:boolean_optional ->
  ?global_node_groups:global_node_group_list ->
  ?auth_token_enabled:boolean_optional ->
  ?transit_encryption_enabled:boolean_optional ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?ar_n:string_ ->
  unit ->
  global_replication_group

val make_rebalance_slots_in_global_replication_group_message :
  global_replication_group_id:string_ ->
  apply_immediately:boolean_ ->
  unit ->
  rebalance_slots_in_global_replication_group_message

val make_recurring_charge :
  ?recurring_charge_amount:double -> ?recurring_charge_frequency:string_ -> unit -> recurring_charge

val make_reserved_cache_node :
  ?reserved_cache_node_id:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  ?cache_node_type:string_ ->
  ?start_time:t_stamp ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?cache_node_count:integer ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?state:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?reservation_ar_n:string_ ->
  unit ->
  reserved_cache_node

val make_purchase_reserved_cache_nodes_offering_message :
  ?reserved_cache_node_id:string_ ->
  ?cache_node_count:integer_optional ->
  ?tags:tag_list ->
  reserved_cache_nodes_offering_id:string_ ->
  unit ->
  purchase_reserved_cache_nodes_offering_message

val make_user_group_pending_changes :
  ?user_ids_to_remove:user_id_list ->
  ?user_ids_to_add:user_id_list ->
  unit ->
  user_group_pending_changes

val make_user_group :
  ?user_group_id:string_ ->
  ?status:string_ ->
  ?engine:engine_type ->
  ?user_ids:user_id_list ->
  ?minimum_engine_version:string_ ->
  ?pending_changes:user_group_pending_changes ->
  ?replication_groups:ug_replication_group_id_list ->
  ?serverless_caches:ug_serverless_cache_id_list ->
  ?ar_n:string_ ->
  unit ->
  user_group

val make_modify_user_group_message :
  ?user_ids_to_add:user_id_list_input ->
  ?user_ids_to_remove:user_id_list_input ->
  ?engine:engine_type ->
  user_group_id:string_ ->
  unit ->
  modify_user_group_message

val make_authentication :
  ?type_:authentication_type -> ?password_count:integer_optional -> unit -> authentication

val make_user :
  ?user_id:string_ ->
  ?user_name:string_ ->
  ?status:string_ ->
  ?engine:engine_type ->
  ?minimum_engine_version:string_ ->
  ?access_string:string_ ->
  ?user_group_ids:user_group_id_list ->
  ?authentication:authentication ->
  ?ar_n:string_ ->
  unit ->
  user

val make_authentication_mode :
  ?type_:input_authentication_type -> ?passwords:password_list_input -> unit -> authentication_mode

val make_modify_user_message :
  ?access_string:access_string ->
  ?append_access_string:access_string ->
  ?passwords:password_list_input ->
  ?no_password_required:boolean_optional ->
  ?authentication_mode:authentication_mode ->
  ?engine:engine_type ->
  user_id:user_id ->
  unit ->
  modify_user_message

val make_ecpu_per_second :
  ?maximum:integer_optional -> ?minimum:integer_optional -> unit -> ecpu_per_second

val make_data_storage :
  ?maximum:integer_optional ->
  ?minimum:integer_optional ->
  unit_:data_storage_unit ->
  unit ->
  data_storage

val make_cache_usage_limits :
  ?data_storage:data_storage -> ?ecpu_per_second:ecpu_per_second -> unit -> cache_usage_limits

val make_serverless_cache :
  ?serverless_cache_name:string_ ->
  ?description:string_ ->
  ?create_time:t_stamp ->
  ?status:string_ ->
  ?engine:string_ ->
  ?major_engine_version:string_ ->
  ?full_engine_version:string_ ->
  ?cache_usage_limits:cache_usage_limits ->
  ?kms_key_id:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?security_group_ids:security_group_ids_list ->
  ?endpoint:endpoint ->
  ?reader_endpoint:endpoint ->
  ?ar_n:string_ ->
  ?user_group_id:string_ ->
  ?subnet_ids:subnet_ids_list ->
  ?snapshot_retention_limit:integer_optional ->
  ?daily_snapshot_time:string_ ->
  ?network_type:network_type ->
  unit ->
  serverless_cache

val make_modify_serverless_cache_response :
  ?serverless_cache:serverless_cache -> unit -> modify_serverless_cache_response

val make_modify_serverless_cache_request :
  ?description:string_ ->
  ?cache_usage_limits:cache_usage_limits ->
  ?remove_user_group:boolean_optional ->
  ?user_group_id:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?snapshot_retention_limit:integer_optional ->
  ?daily_snapshot_time:string_ ->
  ?engine:string_ ->
  ?major_engine_version:string_ ->
  serverless_cache_name:string_ ->
  unit ->
  modify_serverless_cache_request

val make_resharding_configuration :
  ?node_group_id:allowed_node_group_id ->
  ?preferred_availability_zones:availability_zones_list ->
  unit ->
  resharding_configuration

val make_modify_replication_group_shard_configuration_message :
  ?resharding_configuration:resharding_configuration_list ->
  ?node_groups_to_remove:node_groups_to_remove_list ->
  ?node_groups_to_retain:node_groups_to_retain_list ->
  replication_group_id:string_ ->
  node_group_count:integer ->
  apply_immediately:boolean_ ->
  unit ->
  modify_replication_group_shard_configuration_message

val make_log_delivery_configuration_request :
  ?log_type:log_type ->
  ?destination_type:destination_type ->
  ?destination_details:destination_details ->
  ?log_format:log_format ->
  ?enabled:boolean_optional ->
  unit ->
  log_delivery_configuration_request

val make_modify_replication_group_message :
  ?replication_group_description:string_ ->
  ?primary_cluster_id:string_ ->
  ?snapshotting_cluster_id:string_ ->
  ?automatic_failover_enabled:boolean_optional ->
  ?multi_az_enabled:boolean_optional ->
  ?node_group_id:string_ ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?security_group_ids:security_group_ids_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?notification_topic_status:string_ ->
  ?apply_immediately:boolean_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?cache_node_type:string_ ->
  ?auth_token:string_ ->
  ?auth_token_update_strategy:auth_token_update_strategy_type ->
  ?user_group_ids_to_add:user_group_id_list ->
  ?user_group_ids_to_remove:user_group_id_list ->
  ?remove_user_groups:boolean_optional ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?ip_discovery:ip_discovery ->
  ?transit_encryption_enabled:boolean_optional ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?cluster_mode:cluster_mode ->
  ?durability:durability ->
  replication_group_id:string_ ->
  unit ->
  modify_replication_group_message

val make_modify_global_replication_group_message :
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?global_replication_group_description:string_ ->
  ?automatic_failover_enabled:boolean_optional ->
  global_replication_group_id:string_ ->
  apply_immediately:boolean_ ->
  unit ->
  modify_global_replication_group_message

val make_subnet_outpost : ?subnet_outpost_arn:string_ -> unit -> subnet_outpost
val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_outpost:subnet_outpost ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet

val make_cache_subnet_group :
  ?cache_subnet_group_name:string_ ->
  ?cache_subnet_group_description:string_ ->
  ?vpc_id:string_ ->
  ?subnets:subnet_list ->
  ?ar_n:string_ ->
  ?supported_network_types:network_type_list ->
  unit ->
  cache_subnet_group

val make_modify_cache_subnet_group_message :
  ?cache_subnet_group_description:string_ ->
  ?subnet_ids:subnet_identifier_list ->
  cache_subnet_group_name:string_ ->
  unit ->
  modify_cache_subnet_group_message

val make_modify_cache_parameter_group_message :
  cache_parameter_group_name:string_ ->
  parameter_name_values:parameter_name_value_list ->
  unit ->
  modify_cache_parameter_group_message

val make_modify_cache_cluster_message :
  ?num_cache_nodes:integer_optional ->
  ?cache_node_ids_to_remove:cache_node_ids_list ->
  ?az_mode:az_mode ->
  ?new_availability_zones:preferred_availability_zone_list ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?security_group_ids:security_group_ids_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?notification_topic_status:string_ ->
  ?apply_immediately:boolean_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?cache_node_type:string_ ->
  ?auth_token:string_ ->
  ?auth_token_update_strategy:auth_token_update_strategy_type ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?ip_discovery:ip_discovery ->
  ?scale_config:scale_config ->
  cache_cluster_id:string_ ->
  unit ->
  modify_cache_cluster_message

val make_list_tags_for_resource_message :
  resource_name:string_ -> unit -> list_tags_for_resource_message

val make_list_allowed_node_type_modifications_message :
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  list_allowed_node_type_modifications_message

val make_configure_shard :
  ?preferred_availability_zones:preferred_availability_zone_list ->
  ?preferred_outpost_arns:preferred_outpost_arn_list ->
  node_group_id:allowed_node_group_id ->
  new_replica_count:integer ->
  unit ->
  configure_shard

val make_increase_replica_count_message :
  ?new_replica_count:integer_optional ->
  ?replica_configuration:replica_configuration_list ->
  replication_group_id:string_ ->
  apply_immediately:boolean_ ->
  unit ->
  increase_replica_count_message

val make_regional_configuration :
  replication_group_id:string_ ->
  replication_group_region:string_ ->
  resharding_configuration:resharding_configuration_list ->
  unit ->
  regional_configuration

val make_increase_node_groups_in_global_replication_group_message :
  ?regional_configurations:regional_configuration_list ->
  global_replication_group_id:string_ ->
  node_group_count:integer ->
  apply_immediately:boolean_ ->
  unit ->
  increase_node_groups_in_global_replication_group_message

val make_failover_global_replication_group_message :
  global_replication_group_id:string_ ->
  primary_region:string_ ->
  primary_replication_group_id:string_ ->
  unit ->
  failover_global_replication_group_message

val make_serverless_cache_configuration :
  ?serverless_cache_name:string_ ->
  ?engine:string_ ->
  ?major_engine_version:string_ ->
  unit ->
  serverless_cache_configuration

val make_serverless_cache_snapshot :
  ?serverless_cache_snapshot_name:string_ ->
  ?ar_n:string_ ->
  ?kms_key_id:string_ ->
  ?snapshot_type:string_ ->
  ?status:string_ ->
  ?create_time:t_stamp ->
  ?expiry_time:t_stamp ->
  ?bytes_used_for_cache:string_ ->
  ?serverless_cache_configuration:serverless_cache_configuration ->
  unit ->
  serverless_cache_snapshot

val make_export_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  export_serverless_cache_snapshot_response

val make_export_serverless_cache_snapshot_request :
  serverless_cache_snapshot_name:string_ ->
  s3_bucket_name:string_ ->
  unit ->
  export_serverless_cache_snapshot_request

val make_disassociate_global_replication_group_message :
  global_replication_group_id:string_ ->
  replication_group_id:string_ ->
  replication_group_region:string_ ->
  unit ->
  disassociate_global_replication_group_message

val make_filter : name:filter_name -> values:filter_value_list -> unit -> filter

val make_describe_users_message :
  ?engine:engine_type ->
  ?user_id:user_id ->
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_users_message

val make_describe_user_groups_message :
  ?user_group_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_user_groups_message

val make_cache_node_update_status :
  ?cache_node_id:string_ ->
  ?node_update_status:node_update_status ->
  ?node_deletion_date:t_stamp ->
  ?node_update_start_date:t_stamp ->
  ?node_update_end_date:t_stamp ->
  ?node_update_initiated_by:node_update_initiated_by ->
  ?node_update_initiated_date:t_stamp ->
  ?node_update_status_modified_date:t_stamp ->
  unit ->
  cache_node_update_status

val make_node_group_member_update_status :
  ?cache_cluster_id:string_ ->
  ?cache_node_id:string_ ->
  ?node_update_status:node_update_status ->
  ?node_deletion_date:t_stamp ->
  ?node_update_start_date:t_stamp ->
  ?node_update_end_date:t_stamp ->
  ?node_update_initiated_by:node_update_initiated_by ->
  ?node_update_initiated_date:t_stamp ->
  ?node_update_status_modified_date:t_stamp ->
  unit ->
  node_group_member_update_status

val make_node_group_update_status :
  ?node_group_id:string_ ->
  ?node_group_member_update_status:node_group_member_update_status_list ->
  unit ->
  node_group_update_status

val make_update_action :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?service_update_name:string_ ->
  ?service_update_release_date:t_stamp ->
  ?service_update_severity:service_update_severity ->
  ?service_update_status:service_update_status ->
  ?service_update_recommended_apply_by_date:t_stamp ->
  ?service_update_type:service_update_type ->
  ?update_action_available_date:t_stamp ->
  ?update_action_status:update_action_status ->
  ?nodes_updated:string_ ->
  ?update_action_status_modified_date:t_stamp ->
  ?sla_met:sla_met ->
  ?node_group_update_status:node_group_update_status_list ->
  ?cache_node_update_status:cache_node_update_status_list ->
  ?estimated_update_time:string_ ->
  ?engine:string_ ->
  unit ->
  update_action

val make_update_actions_message :
  ?marker:string_ -> ?update_actions:update_action_list -> unit -> update_actions_message

val make_time_range_filter : ?start_time:t_stamp -> ?end_time:t_stamp -> unit -> time_range_filter

val make_describe_update_actions_message :
  ?service_update_name:string_ ->
  ?replication_group_ids:replication_group_id_list ->
  ?cache_cluster_ids:cache_cluster_id_list ->
  ?engine:string_ ->
  ?service_update_status:service_update_status_list ->
  ?service_update_time_range:time_range_filter ->
  ?update_action_status:update_action_status_list ->
  ?show_node_level_update_status:boolean_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_update_actions_message

val make_node_group_configuration :
  ?node_group_id:allowed_node_group_id ->
  ?slots:string_ ->
  ?replica_count:integer_optional ->
  ?primary_availability_zone:string_ ->
  ?replica_availability_zones:availability_zones_list ->
  ?primary_outpost_arn:string_ ->
  ?replica_outpost_arns:outpost_arns_list ->
  unit ->
  node_group_configuration

val make_node_snapshot :
  ?cache_cluster_id:string_ ->
  ?node_group_id:string_ ->
  ?cache_node_id:string_ ->
  ?node_group_configuration:node_group_configuration ->
  ?cache_size:string_ ->
  ?cache_node_create_time:t_stamp ->
  ?snapshot_create_time:t_stamp ->
  unit ->
  node_snapshot

val make_snapshot :
  ?snapshot_name:string_ ->
  ?replication_group_id:string_ ->
  ?replication_group_description:string_ ->
  ?cache_cluster_id:string_ ->
  ?snapshot_status:string_ ->
  ?snapshot_source:string_ ->
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?num_cache_nodes:integer_optional ->
  ?preferred_availability_zone:string_ ->
  ?preferred_outpost_arn:string_ ->
  ?cache_cluster_create_time:t_stamp ->
  ?preferred_maintenance_window:string_ ->
  ?topic_arn:string_ ->
  ?port:integer_optional ->
  ?cache_parameter_group_name:string_ ->
  ?cache_subnet_group_name:string_ ->
  ?vpc_id:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?num_node_groups:integer_optional ->
  ?automatic_failover:automatic_failover_status ->
  ?node_snapshots:node_snapshot_list ->
  ?kms_key_id:string_ ->
  ?ar_n:string_ ->
  ?data_tiering:data_tiering_status ->
  ?durability:durability ->
  unit ->
  snapshot

val make_describe_snapshots_list_message :
  ?marker:string_ -> ?snapshots:snapshot_list -> unit -> describe_snapshots_list_message

val make_describe_snapshots_message :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?snapshot_name:string_ ->
  ?snapshot_source:string_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?show_node_group_config:boolean_optional ->
  unit ->
  describe_snapshots_message

val make_service_update :
  ?service_update_name:string_ ->
  ?service_update_release_date:t_stamp ->
  ?service_update_end_date:t_stamp ->
  ?service_update_severity:service_update_severity ->
  ?service_update_recommended_apply_by_date:t_stamp ->
  ?service_update_status:service_update_status ->
  ?service_update_description:string_ ->
  ?service_update_type:service_update_type ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?auto_update_after_recommended_apply_by_date:boolean_optional ->
  ?estimated_update_time:string_ ->
  unit ->
  service_update

val make_service_updates_message :
  ?marker:string_ -> ?service_updates:service_update_list -> unit -> service_updates_message

val make_describe_service_updates_message :
  ?service_update_name:string_ ->
  ?service_update_status:service_update_status_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_service_updates_message

val make_describe_serverless_cache_snapshots_response :
  ?next_token:string_ ->
  ?serverless_cache_snapshots:serverless_cache_snapshot_list ->
  unit ->
  describe_serverless_cache_snapshots_response

val make_describe_serverless_cache_snapshots_request :
  ?serverless_cache_name:string_ ->
  ?serverless_cache_snapshot_name:string_ ->
  ?snapshot_type:string_ ->
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  unit ->
  describe_serverless_cache_snapshots_request

val make_describe_serverless_caches_response :
  ?next_token:string_ ->
  ?serverless_caches:serverless_cache_list ->
  unit ->
  describe_serverless_caches_response

val make_describe_serverless_caches_request :
  ?serverless_cache_name:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_serverless_caches_request

val make_reserved_cache_nodes_offering :
  ?reserved_cache_nodes_offering_id:string_ ->
  ?cache_node_type:string_ ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?recurring_charges:recurring_charge_list ->
  unit ->
  reserved_cache_nodes_offering

val make_reserved_cache_nodes_offering_message :
  ?marker:string_ ->
  ?reserved_cache_nodes_offerings:reserved_cache_nodes_offering_list ->
  unit ->
  reserved_cache_nodes_offering_message

val make_describe_reserved_cache_nodes_offerings_message :
  ?reserved_cache_nodes_offering_id:string_ ->
  ?cache_node_type:string_ ->
  ?duration:string_ ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_cache_nodes_offerings_message

val make_reserved_cache_node_message :
  ?marker:string_ ->
  ?reserved_cache_nodes:reserved_cache_node_list ->
  unit ->
  reserved_cache_node_message

val make_describe_reserved_cache_nodes_message :
  ?reserved_cache_node_id:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  ?cache_node_type:string_ ->
  ?duration:string_ ->
  ?product_description:string_ ->
  ?offering_type:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_cache_nodes_message

val make_replication_group_message :
  ?marker:string_ -> ?replication_groups:replication_group_list -> unit -> replication_group_message

val make_describe_replication_groups_message :
  ?replication_group_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_groups_message

val make_describe_global_replication_groups_message :
  ?global_replication_group_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?show_member_info:boolean_optional ->
  unit ->
  describe_global_replication_groups_message

val make_event :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?message:string_ ->
  ?date:t_stamp ->
  unit ->
  event

val make_events_message : ?marker:string_ -> ?events:event_list -> unit -> events_message

val make_describe_events_message :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?duration:integer_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_events_message

val make_cache_node_type_specific_value :
  ?cache_node_type:string_ -> ?value:string_ -> unit -> cache_node_type_specific_value

val make_cache_node_type_specific_parameter :
  ?parameter_name:string_ ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?minimum_engine_version:string_ ->
  ?cache_node_type_specific_values:cache_node_type_specific_value_list ->
  ?change_type:change_type ->
  unit ->
  cache_node_type_specific_parameter

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_value:string_ ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:boolean_ ->
  ?minimum_engine_version:string_ ->
  ?change_type:change_type ->
  unit ->
  parameter

val make_engine_defaults :
  ?cache_parameter_group_family:string_ ->
  ?marker:string_ ->
  ?parameters:parameters_list ->
  ?cache_node_type_specific_parameters:cache_node_type_specific_parameters_list ->
  unit ->
  engine_defaults

val make_describe_engine_default_parameters_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  cache_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_parameters_message

val make_cache_subnet_group_message :
  ?marker:string_ -> ?cache_subnet_groups:cache_subnet_groups -> unit -> cache_subnet_group_message

val make_describe_cache_subnet_groups_message :
  ?cache_subnet_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cache_subnet_groups_message

val make_cache_security_group_message :
  ?marker:string_ ->
  ?cache_security_groups:cache_security_groups ->
  unit ->
  cache_security_group_message

val make_describe_cache_security_groups_message :
  ?cache_security_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cache_security_groups_message

val make_cache_parameter_group_details :
  ?marker:string_ ->
  ?parameters:parameters_list ->
  ?cache_node_type_specific_parameters:cache_node_type_specific_parameters_list ->
  unit ->
  cache_parameter_group_details

val make_describe_cache_parameters_message :
  ?source:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  cache_parameter_group_name:string_ ->
  unit ->
  describe_cache_parameters_message

val make_cache_parameter_group :
  ?cache_parameter_group_name:string_ ->
  ?cache_parameter_group_family:string_ ->
  ?description:string_ ->
  ?is_global:boolean_ ->
  ?ar_n:string_ ->
  unit ->
  cache_parameter_group

val make_cache_parameter_groups_message :
  ?marker:string_ ->
  ?cache_parameter_groups:cache_parameter_group_list ->
  unit ->
  cache_parameter_groups_message

val make_describe_cache_parameter_groups_message :
  ?cache_parameter_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cache_parameter_groups_message

val make_cache_engine_version :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_parameter_group_family:string_ ->
  ?cache_engine_description:string_ ->
  ?cache_engine_version_description:string_ ->
  unit ->
  cache_engine_version

val make_cache_engine_version_message :
  ?marker:string_ ->
  ?cache_engine_versions:cache_engine_version_list ->
  unit ->
  cache_engine_version_message

val make_describe_cache_engine_versions_message :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_parameter_group_family:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?default_only:boolean_ ->
  unit ->
  describe_cache_engine_versions_message

val make_cache_cluster_message :
  ?marker:string_ -> ?cache_clusters:cache_cluster_list -> unit -> cache_cluster_message

val make_describe_cache_clusters_message :
  ?cache_cluster_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?show_cache_node_info:boolean_optional ->
  ?show_cache_clusters_not_in_replication_groups:boolean_optional ->
  unit ->
  describe_cache_clusters_message

val make_delete_user_group_message : user_group_id:string_ -> unit -> delete_user_group_message
val make_delete_user_message : user_id:user_id -> unit -> delete_user_message
val make_delete_snapshot_message : snapshot_name:string_ -> unit -> delete_snapshot_message

val make_delete_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  delete_serverless_cache_snapshot_response

val make_delete_serverless_cache_snapshot_request :
  serverless_cache_snapshot_name:string_ -> unit -> delete_serverless_cache_snapshot_request

val make_delete_serverless_cache_response :
  ?serverless_cache:serverless_cache -> unit -> delete_serverless_cache_response

val make_delete_serverless_cache_request :
  ?final_snapshot_name:string_ ->
  serverless_cache_name:string_ ->
  unit ->
  delete_serverless_cache_request

val make_delete_replication_group_message :
  ?retain_primary_cluster:boolean_optional ->
  ?final_snapshot_identifier:string_ ->
  replication_group_id:string_ ->
  unit ->
  delete_replication_group_message

val make_delete_global_replication_group_message :
  global_replication_group_id:string_ ->
  retain_primary_replication_group:boolean_ ->
  unit ->
  delete_global_replication_group_message

val make_delete_cache_subnet_group_message :
  cache_subnet_group_name:string_ -> unit -> delete_cache_subnet_group_message

val make_delete_cache_security_group_message :
  cache_security_group_name:string_ -> unit -> delete_cache_security_group_message

val make_delete_cache_parameter_group_message :
  cache_parameter_group_name:string_ -> unit -> delete_cache_parameter_group_message

val make_delete_cache_cluster_message :
  ?final_snapshot_identifier:string_ ->
  cache_cluster_id:string_ ->
  unit ->
  delete_cache_cluster_message

val make_decrease_replica_count_message :
  ?new_replica_count:integer_optional ->
  ?replica_configuration:replica_configuration_list ->
  ?replicas_to_remove:remove_replicas_list ->
  replication_group_id:string_ ->
  apply_immediately:boolean_ ->
  unit ->
  decrease_replica_count_message

val make_decrease_node_groups_in_global_replication_group_message :
  ?global_node_groups_to_remove:global_node_group_id_list ->
  ?global_node_groups_to_retain:global_node_group_id_list ->
  global_replication_group_id:string_ ->
  node_group_count:integer ->
  apply_immediately:boolean_ ->
  unit ->
  decrease_node_groups_in_global_replication_group_message

val make_create_user_group_message :
  ?user_ids:user_id_list_input ->
  ?tags:tag_list ->
  user_group_id:string_ ->
  engine:engine_type ->
  unit ->
  create_user_group_message

val make_create_user_message :
  ?passwords:password_list_input ->
  ?no_password_required:boolean_optional ->
  ?tags:tag_list ->
  ?authentication_mode:authentication_mode ->
  user_id:user_id ->
  user_name:user_name ->
  engine:engine_type ->
  access_string:access_string ->
  unit ->
  create_user_message

val make_create_snapshot_message :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  snapshot_name:string_ ->
  unit ->
  create_snapshot_message

val make_create_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  create_serverless_cache_snapshot_response

val make_create_serverless_cache_snapshot_request :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  serverless_cache_snapshot_name:string_ ->
  serverless_cache_name:string_ ->
  unit ->
  create_serverless_cache_snapshot_request

val make_create_serverless_cache_response :
  ?serverless_cache:serverless_cache -> unit -> create_serverless_cache_response

val make_create_serverless_cache_request :
  ?description:string_ ->
  ?major_engine_version:string_ ->
  ?cache_usage_limits:cache_usage_limits ->
  ?kms_key_id:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?snapshot_arns_to_restore:snapshot_arns_list ->
  ?tags:tag_list ->
  ?user_group_id:string_ ->
  ?subnet_ids:subnet_ids_list ->
  ?snapshot_retention_limit:integer_optional ->
  ?daily_snapshot_time:string_ ->
  ?network_type:network_type ->
  serverless_cache_name:string_ ->
  engine:string_ ->
  unit ->
  create_serverless_cache_request

val make_create_replication_group_message :
  ?global_replication_group_id:string_ ->
  ?primary_cluster_id:string_ ->
  ?automatic_failover_enabled:boolean_optional ->
  ?multi_az_enabled:boolean_optional ->
  ?num_cache_clusters:integer_optional ->
  ?preferred_cache_cluster_a_zs:availability_zones_list ->
  ?num_node_groups:integer_optional ->
  ?replicas_per_node_group:integer_optional ->
  ?node_group_configuration:node_group_configuration_list ->
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?cache_subnet_group_name:string_ ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?security_group_ids:security_group_ids_list ->
  ?tags:tag_list ->
  ?snapshot_arns:snapshot_arns_list ->
  ?snapshot_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?port:integer_optional ->
  ?notification_topic_arn:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?auth_token:string_ ->
  ?transit_encryption_enabled:boolean_optional ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?kms_key_id:string_ ->
  ?user_group_ids:user_group_id_list_input ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?data_tiering_enabled:boolean_optional ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?cluster_mode:cluster_mode ->
  ?serverless_cache_snapshot_name:string_ ->
  ?durability:durability ->
  replication_group_id:string_ ->
  replication_group_description:string_ ->
  unit ->
  create_replication_group_message

val make_create_global_replication_group_message :
  ?global_replication_group_description:string_ ->
  global_replication_group_id_suffix:string_ ->
  primary_replication_group_id:string_ ->
  unit ->
  create_global_replication_group_message

val make_create_cache_subnet_group_message :
  ?tags:tag_list ->
  cache_subnet_group_name:string_ ->
  cache_subnet_group_description:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_cache_subnet_group_message

val make_create_cache_security_group_message :
  ?tags:tag_list ->
  cache_security_group_name:string_ ->
  description:string_ ->
  unit ->
  create_cache_security_group_message

val make_create_cache_parameter_group_message :
  ?tags:tag_list ->
  cache_parameter_group_name:string_ ->
  cache_parameter_group_family:string_ ->
  description:string_ ->
  unit ->
  create_cache_parameter_group_message

val make_create_cache_cluster_message :
  ?replication_group_id:string_ ->
  ?az_mode:az_mode ->
  ?preferred_availability_zone:string_ ->
  ?preferred_availability_zones:preferred_availability_zone_list ->
  ?num_cache_nodes:integer_optional ->
  ?cache_node_type:string_ ->
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?cache_subnet_group_name:string_ ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?security_group_ids:security_group_ids_list ->
  ?tags:tag_list ->
  ?snapshot_arns:snapshot_arns_list ->
  ?snapshot_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?port:integer_optional ->
  ?notification_topic_arn:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?snapshot_retention_limit:integer_optional ->
  ?snapshot_window:string_ ->
  ?auth_token:string_ ->
  ?outpost_mode:outpost_mode ->
  ?preferred_outpost_arn:string_ ->
  ?preferred_outpost_arns:preferred_outpost_arn_list ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?transit_encryption_enabled:boolean_optional ->
  ?network_type:network_type ->
  ?ip_discovery:ip_discovery ->
  cache_cluster_id:string_ ->
  unit ->
  create_cache_cluster_message

val make_copy_snapshot_message :
  ?target_bucket:string_ ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  source_snapshot_name:string_ ->
  target_snapshot_name:string_ ->
  unit ->
  copy_snapshot_message

val make_copy_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  copy_serverless_cache_snapshot_response

val make_copy_serverless_cache_snapshot_request :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  source_serverless_cache_snapshot_name:string_ ->
  target_serverless_cache_snapshot_name:string_ ->
  unit ->
  copy_serverless_cache_snapshot_request

val make_complete_migration_response :
  ?replication_group:replication_group -> unit -> complete_migration_response

val make_complete_migration_message :
  ?force:boolean_ -> replication_group_id:string_ -> unit -> complete_migration_message

val make_unprocessed_update_action :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?service_update_name:string_ ->
  ?error_type:string_ ->
  ?error_message:string_ ->
  unit ->
  unprocessed_update_action

val make_processed_update_action :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?service_update_name:string_ ->
  ?update_action_status:update_action_status ->
  unit ->
  processed_update_action

val make_update_action_results_message :
  ?processed_update_actions:processed_update_action_list ->
  ?unprocessed_update_actions:unprocessed_update_action_list ->
  unit ->
  update_action_results_message

val make_batch_stop_update_action_message :
  ?replication_group_ids:replication_group_id_list ->
  ?cache_cluster_ids:cache_cluster_id_list ->
  service_update_name:string_ ->
  unit ->
  batch_stop_update_action_message

val make_batch_apply_update_action_message :
  ?replication_group_ids:replication_group_id_list ->
  ?cache_cluster_ids:cache_cluster_id_list ->
  service_update_name:string_ ->
  unit ->
  batch_apply_update_action_message

val make_authorize_cache_security_group_ingress_message :
  cache_security_group_name:string_ ->
  ec2_security_group_name:string_ ->
  ec2_security_group_owner_id:string_ ->
  unit ->
  authorize_cache_security_group_ingress_message
