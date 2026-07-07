open Types

val make_authentication :
  ?password_count:integer_optional -> ?type_:authentication_type -> unit -> authentication

val make_user :
  ?ar_n:string_ ->
  ?authentication:authentication ->
  ?user_group_ids:user_group_id_list ->
  ?access_string:string_ ->
  ?minimum_engine_version:string_ ->
  ?engine:engine_type ->
  ?status:string_ ->
  ?user_name:string_ ->
  ?user_id:string_ ->
  unit ->
  user

val make_user_groups_update_status :
  ?user_group_ids_to_remove:user_group_id_list ->
  ?user_group_ids_to_add:user_group_id_list ->
  unit ->
  user_groups_update_status

val make_user_group_pending_changes :
  ?user_ids_to_add:user_id_list ->
  ?user_ids_to_remove:user_id_list ->
  unit ->
  user_group_pending_changes

val make_user_group :
  ?ar_n:string_ ->
  ?serverless_caches:ug_serverless_cache_id_list ->
  ?replication_groups:ug_replication_group_id_list ->
  ?pending_changes:user_group_pending_changes ->
  ?minimum_engine_version:string_ ->
  ?user_ids:user_id_list ->
  ?engine:engine_type ->
  ?status:string_ ->
  ?user_group_id:string_ ->
  unit ->
  user_group

val make_node_group_member_update_status :
  ?node_update_status_modified_date:t_stamp ->
  ?node_update_initiated_date:t_stamp ->
  ?node_update_initiated_by:node_update_initiated_by ->
  ?node_update_end_date:t_stamp ->
  ?node_update_start_date:t_stamp ->
  ?node_deletion_date:t_stamp ->
  ?node_update_status:node_update_status ->
  ?cache_node_id:string_ ->
  ?cache_cluster_id:string_ ->
  unit ->
  node_group_member_update_status

val make_node_group_update_status :
  ?node_group_member_update_status:node_group_member_update_status_list ->
  ?node_group_id:string_ ->
  unit ->
  node_group_update_status

val make_cache_node_update_status :
  ?node_update_status_modified_date:t_stamp ->
  ?node_update_initiated_date:t_stamp ->
  ?node_update_initiated_by:node_update_initiated_by ->
  ?node_update_end_date:t_stamp ->
  ?node_update_start_date:t_stamp ->
  ?node_deletion_date:t_stamp ->
  ?node_update_status:node_update_status ->
  ?cache_node_id:string_ ->
  unit ->
  cache_node_update_status

val make_update_action :
  ?engine:string_ ->
  ?estimated_update_time:string_ ->
  ?cache_node_update_status:cache_node_update_status_list ->
  ?node_group_update_status:node_group_update_status_list ->
  ?sla_met:sla_met ->
  ?update_action_status_modified_date:t_stamp ->
  ?nodes_updated:string_ ->
  ?update_action_status:update_action_status ->
  ?update_action_available_date:t_stamp ->
  ?service_update_type:service_update_type ->
  ?service_update_recommended_apply_by_date:t_stamp ->
  ?service_update_status:service_update_status ->
  ?service_update_severity:service_update_severity ->
  ?service_update_release_date:t_stamp ->
  ?service_update_name:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  update_action

val make_update_actions_message :
  ?update_actions:update_action_list -> ?marker:string_ -> unit -> update_actions_message

val make_processed_update_action :
  ?update_action_status:update_action_status ->
  ?service_update_name:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  processed_update_action

val make_unprocessed_update_action :
  ?error_message:string_ ->
  ?error_type:string_ ->
  ?service_update_name:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  unprocessed_update_action

val make_update_action_results_message :
  ?unprocessed_update_actions:unprocessed_update_action_list ->
  ?processed_update_actions:processed_update_action_list ->
  unit ->
  update_action_results_message

val make_time_range_filter : ?end_time:t_stamp -> ?start_time:t_stamp -> unit -> time_range_filter

val make_global_replication_group_info :
  ?global_replication_group_member_role:string_ ->
  ?global_replication_group_id:string_ ->
  unit ->
  global_replication_group_info

val make_slot_migration : ?progress_percentage:double -> unit -> slot_migration
val make_resharding_status : ?slot_migration:slot_migration -> unit -> resharding_status

val make_cloud_watch_logs_destination_details :
  ?log_group:string_ -> unit -> cloud_watch_logs_destination_details

val make_kinesis_firehose_destination_details :
  ?delivery_stream:string_ -> unit -> kinesis_firehose_destination_details

val make_destination_details :
  ?kinesis_firehose_details:kinesis_firehose_destination_details ->
  ?cloud_watch_logs_details:cloud_watch_logs_destination_details ->
  unit ->
  destination_details

val make_pending_log_delivery_configuration :
  ?log_format:log_format ->
  ?destination_details:destination_details ->
  ?destination_type:destination_type ->
  ?log_type:log_type ->
  unit ->
  pending_log_delivery_configuration

val make_replication_group_pending_modified_values :
  ?cluster_mode:cluster_mode ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?transit_encryption_enabled:boolean_optional ->
  ?log_delivery_configurations:pending_log_delivery_configuration_list ->
  ?user_groups:user_groups_update_status ->
  ?auth_token_status:auth_token_update_status ->
  ?resharding:resharding_status ->
  ?automatic_failover_status:pending_automatic_failover_status ->
  ?primary_cluster_id:string_ ->
  unit ->
  replication_group_pending_modified_values

val make_endpoint : ?port:integer -> ?address:string_ -> unit -> endpoint

val make_node_group_member :
  ?current_role:string_ ->
  ?preferred_outpost_arn:string_ ->
  ?preferred_availability_zone:string_ ->
  ?read_endpoint:endpoint ->
  ?cache_node_id:string_ ->
  ?cache_cluster_id:string_ ->
  unit ->
  node_group_member

val make_node_group :
  ?node_group_members:node_group_member_list ->
  ?slots:string_ ->
  ?reader_endpoint:endpoint ->
  ?primary_endpoint:endpoint ->
  ?status:string_ ->
  ?node_group_id:string_ ->
  unit ->
  node_group

val make_log_delivery_configuration :
  ?message:string_ ->
  ?status:log_delivery_configuration_status ->
  ?log_format:log_format ->
  ?destination_details:destination_details ->
  ?destination_type:destination_type ->
  ?log_type:log_type ->
  unit ->
  log_delivery_configuration

val make_replication_group :
  ?effective_durability:effective_durability ->
  ?durability:durability ->
  ?engine:string_ ->
  ?cluster_mode:cluster_mode ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?data_tiering:data_tiering_status ->
  ?replication_group_create_time:t_stamp ->
  ?log_delivery_configurations:log_delivery_configuration_list ->
  ?user_group_ids:user_group_id_list ->
  ?ar_n:string_ ->
  ?storage_encryption_type:storage_encryption_type ->
  ?kms_key_id:string_ ->
  ?member_clusters_outpost_arns:replication_group_outpost_arn_list ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?transit_encryption_enabled:boolean_optional ->
  ?auth_token_last_modified_date:t_stamp ->
  ?auth_token_enabled:boolean_optional ->
  ?cache_node_type:string_ ->
  ?cluster_enabled:boolean_optional ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?configuration_endpoint:endpoint ->
  ?multi_a_z:multi_az_status ->
  ?automatic_failover:automatic_failover_status ->
  ?snapshotting_cluster_id:string_ ->
  ?node_groups:node_group_list ->
  ?member_clusters:cluster_id_list ->
  ?pending_modified_values:replication_group_pending_modified_values ->
  ?status:string_ ->
  ?global_replication_group_info:global_replication_group_info ->
  ?description:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  replication_group

val make_test_migration_response :
  ?replication_group:replication_group -> unit -> test_migration_response

val make_customer_node_endpoint :
  ?port:integer_optional -> ?address:string_ -> unit -> customer_node_endpoint

val make_test_migration_message :
  customer_node_endpoint_list:customer_node_endpoint_list ->
  replication_group_id:string_ ->
  unit ->
  test_migration_message

val make_test_failover_message :
  node_group_id:allowed_node_group_id ->
  replication_group_id:string_ ->
  unit ->
  test_failover_message

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag
val make_tag_list_message : ?tag_list:tag_list -> unit -> tag_list_message
val make_subnet_outpost : ?subnet_outpost_arn:string_ -> unit -> subnet_outpost
val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?supported_network_types:network_type_list ->
  ?subnet_outpost:subnet_outpost ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_start_migration_response :
  ?replication_group:replication_group -> unit -> start_migration_response

val make_start_migration_message :
  customer_node_endpoint_list:customer_node_endpoint_list ->
  replication_group_id:string_ ->
  unit ->
  start_migration_message

val make_node_group_configuration :
  ?replica_outpost_arns:outpost_arns_list ->
  ?primary_outpost_arn:string_ ->
  ?replica_availability_zones:availability_zones_list ->
  ?primary_availability_zone:string_ ->
  ?replica_count:integer_optional ->
  ?slots:string_ ->
  ?node_group_id:allowed_node_group_id ->
  unit ->
  node_group_configuration

val make_node_snapshot :
  ?snapshot_create_time:t_stamp ->
  ?cache_node_create_time:t_stamp ->
  ?cache_size:string_ ->
  ?node_group_configuration:node_group_configuration ->
  ?cache_node_id:string_ ->
  ?node_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  unit ->
  node_snapshot

val make_snapshot :
  ?durability:durability ->
  ?data_tiering:data_tiering_status ->
  ?ar_n:string_ ->
  ?kms_key_id:string_ ->
  ?node_snapshots:node_snapshot_list ->
  ?automatic_failover:automatic_failover_status ->
  ?num_node_groups:integer_optional ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?vpc_id:string_ ->
  ?cache_subnet_group_name:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?port:integer_optional ->
  ?topic_arn:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?cache_cluster_create_time:t_stamp ->
  ?preferred_outpost_arn:string_ ->
  ?preferred_availability_zone:string_ ->
  ?num_cache_nodes:integer_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  ?snapshot_source:string_ ->
  ?snapshot_status:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_description:string_ ->
  ?replication_group_id:string_ ->
  ?snapshot_name:string_ ->
  unit ->
  snapshot

val make_service_update :
  ?estimated_update_time:string_ ->
  ?auto_update_after_recommended_apply_by_date:boolean_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?service_update_type:service_update_type ->
  ?service_update_description:string_ ->
  ?service_update_status:service_update_status ->
  ?service_update_recommended_apply_by_date:t_stamp ->
  ?service_update_severity:service_update_severity ->
  ?service_update_end_date:t_stamp ->
  ?service_update_release_date:t_stamp ->
  ?service_update_name:string_ ->
  unit ->
  service_update

val make_service_updates_message :
  ?service_updates:service_update_list -> ?marker:string_ -> unit -> service_updates_message

val make_serverless_cache_configuration :
  ?major_engine_version:string_ ->
  ?engine:string_ ->
  ?serverless_cache_name:string_ ->
  unit ->
  serverless_cache_configuration

val make_serverless_cache_snapshot :
  ?serverless_cache_configuration:serverless_cache_configuration ->
  ?bytes_used_for_cache:string_ ->
  ?expiry_time:t_stamp ->
  ?create_time:t_stamp ->
  ?status:string_ ->
  ?snapshot_type:string_ ->
  ?kms_key_id:string_ ->
  ?ar_n:string_ ->
  ?serverless_cache_snapshot_name:string_ ->
  unit ->
  serverless_cache_snapshot

val make_data_storage :
  ?minimum:integer_optional ->
  ?maximum:integer_optional ->
  unit_:data_storage_unit ->
  unit ->
  data_storage

val make_ecpu_per_second :
  ?minimum:integer_optional -> ?maximum:integer_optional -> unit -> ecpu_per_second

val make_cache_usage_limits :
  ?ecpu_per_second:ecpu_per_second -> ?data_storage:data_storage -> unit -> cache_usage_limits

val make_serverless_cache :
  ?network_type:network_type ->
  ?daily_snapshot_time:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?subnet_ids:subnet_ids_list ->
  ?user_group_id:string_ ->
  ?ar_n:string_ ->
  ?reader_endpoint:endpoint ->
  ?endpoint:endpoint ->
  ?security_group_ids:security_group_ids_list ->
  ?storage_encryption_type:storage_encryption_type ->
  ?kms_key_id:string_ ->
  ?cache_usage_limits:cache_usage_limits ->
  ?full_engine_version:string_ ->
  ?major_engine_version:string_ ->
  ?engine:string_ ->
  ?status:string_ ->
  ?create_time:t_stamp ->
  ?description:string_ ->
  ?serverless_cache_name:string_ ->
  unit ->
  serverless_cache

val make_security_group_membership :
  ?status:string_ -> ?security_group_id:string_ -> unit -> security_group_membership

val make_scale_config :
  ?scale_interval_minutes:integer_optional ->
  ?scale_percentage:integer_optional ->
  unit ->
  scale_config

val make_ec2_security_group :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?status:string_ ->
  unit ->
  ec2_security_group

val make_cache_security_group :
  ?ar_n:string_ ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?description:string_ ->
  ?cache_security_group_name:string_ ->
  ?owner_id:string_ ->
  unit ->
  cache_security_group

val make_revoke_cache_security_group_ingress_message :
  ec2_security_group_owner_id:string_ ->
  ec2_security_group_name:string_ ->
  cache_security_group_name:string_ ->
  unit ->
  revoke_cache_security_group_ingress_message

val make_resharding_configuration :
  ?preferred_availability_zones:availability_zones_list ->
  ?node_group_id:allowed_node_group_id ->
  unit ->
  resharding_configuration

val make_parameter_name_value :
  ?parameter_value:string_ -> ?parameter_name:string_ -> unit -> parameter_name_value

val make_reset_cache_parameter_group_message :
  ?parameter_name_values:parameter_name_value_list ->
  ?reset_all_parameters:boolean_ ->
  cache_parameter_group_name:string_ ->
  unit ->
  reset_cache_parameter_group_message

val make_cache_parameter_group_name_message :
  ?cache_parameter_group_name:string_ -> unit -> cache_parameter_group_name_message

val make_recurring_charge :
  ?recurring_charge_frequency:string_ -> ?recurring_charge_amount:double -> unit -> recurring_charge

val make_reserved_cache_nodes_offering :
  ?recurring_charges:recurring_charge_list ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?cache_node_type:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  unit ->
  reserved_cache_nodes_offering

val make_reserved_cache_nodes_offering_message :
  ?reserved_cache_nodes_offerings:reserved_cache_nodes_offering_list ->
  ?marker:string_ ->
  unit ->
  reserved_cache_nodes_offering_message

val make_reserved_cache_node :
  ?reservation_ar_n:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?state:string_ ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?cache_node_count:integer ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?start_time:t_stamp ->
  ?cache_node_type:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  ?reserved_cache_node_id:string_ ->
  unit ->
  reserved_cache_node

val make_reserved_cache_node_message :
  ?reserved_cache_nodes:reserved_cache_node_list ->
  ?marker:string_ ->
  unit ->
  reserved_cache_node_message

val make_replication_group_message :
  ?replication_groups:replication_group_list -> ?marker:string_ -> unit -> replication_group_message

val make_configure_shard :
  ?preferred_outpost_arns:preferred_outpost_arn_list ->
  ?preferred_availability_zones:preferred_availability_zone_list ->
  new_replica_count:integer ->
  node_group_id:allowed_node_group_id ->
  unit ->
  configure_shard

val make_remove_tags_from_resource_message :
  tag_keys:key_list -> resource_name:string_ -> unit -> remove_tags_from_resource_message

val make_regional_configuration :
  resharding_configuration:resharding_configuration_list ->
  replication_group_region:string_ ->
  replication_group_id:string_ ->
  unit ->
  regional_configuration

val make_pending_modified_values :
  ?scale_config:scale_config ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?transit_encryption_enabled:boolean_optional ->
  ?log_delivery_configurations:pending_log_delivery_configuration_list ->
  ?auth_token_status:auth_token_update_status ->
  ?cache_node_type:string_ ->
  ?engine_version:string_ ->
  ?cache_node_ids_to_remove:cache_node_ids_list ->
  ?num_cache_nodes:integer_optional ->
  unit ->
  pending_modified_values

val make_notification_configuration :
  ?topic_status:string_ -> ?topic_arn:string_ -> unit -> notification_configuration

val make_cache_security_group_membership :
  ?status:string_ -> ?cache_security_group_name:string_ -> unit -> cache_security_group_membership

val make_cache_parameter_group_status :
  ?cache_node_ids_to_reboot:cache_node_ids_list ->
  ?parameter_apply_status:string_ ->
  ?cache_parameter_group_name:string_ ->
  unit ->
  cache_parameter_group_status

val make_cache_node :
  ?customer_outpost_arn:string_ ->
  ?customer_availability_zone:string_ ->
  ?source_cache_node_id:string_ ->
  ?parameter_group_status:string_ ->
  ?endpoint:endpoint ->
  ?cache_node_create_time:t_stamp ->
  ?cache_node_status:string_ ->
  ?cache_node_id:string_ ->
  unit ->
  cache_node

val make_cache_cluster :
  ?transit_encryption_mode:transit_encryption_mode ->
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?log_delivery_configurations:log_delivery_configuration_list ->
  ?replication_group_log_delivery_enabled:boolean_ ->
  ?ar_n:string_ ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?transit_encryption_enabled:boolean_optional ->
  ?auth_token_last_modified_date:t_stamp ->
  ?auth_token_enabled:boolean_optional ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?replication_group_id:string_ ->
  ?security_groups:security_group_membership_list ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?cache_nodes:cache_node_list ->
  ?cache_subnet_group_name:string_ ->
  ?cache_parameter_group:cache_parameter_group_status ->
  ?cache_security_groups:cache_security_group_membership_list ->
  ?notification_configuration:notification_configuration ->
  ?pending_modified_values:pending_modified_values ->
  ?preferred_maintenance_window:string_ ->
  ?cache_cluster_create_time:t_stamp ->
  ?preferred_outpost_arn:string_ ->
  ?preferred_availability_zone:string_ ->
  ?num_cache_nodes:integer_optional ->
  ?cache_cluster_status:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  ?client_download_landing_page:string_ ->
  ?configuration_endpoint:endpoint ->
  ?cache_cluster_id:string_ ->
  unit ->
  cache_cluster

val make_reboot_cache_cluster_message :
  cache_node_ids_to_reboot:cache_node_ids_list ->
  cache_cluster_id:string_ ->
  unit ->
  reboot_cache_cluster_message

val make_global_replication_group_member :
  ?status:string_ ->
  ?automatic_failover:automatic_failover_status ->
  ?role:string_ ->
  ?replication_group_region:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  global_replication_group_member

val make_global_node_group :
  ?slots:string_ -> ?global_node_group_id:string_ -> unit -> global_node_group

val make_global_replication_group :
  ?ar_n:string_ ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?transit_encryption_enabled:boolean_optional ->
  ?auth_token_enabled:boolean_optional ->
  ?global_node_groups:global_node_group_list ->
  ?cluster_enabled:boolean_optional ->
  ?members:global_replication_group_member_list ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  ?status:string_ ->
  ?global_replication_group_description:string_ ->
  ?global_replication_group_id:string_ ->
  unit ->
  global_replication_group

val make_rebalance_slots_in_global_replication_group_message :
  apply_immediately:boolean_ ->
  global_replication_group_id:string_ ->
  unit ->
  rebalance_slots_in_global_replication_group_message

val make_purchase_reserved_cache_nodes_offering_message :
  ?tags:tag_list ->
  ?cache_node_count:integer_optional ->
  ?reserved_cache_node_id:string_ ->
  reserved_cache_nodes_offering_id:string_ ->
  unit ->
  purchase_reserved_cache_nodes_offering_message

val make_parameter :
  ?change_type:change_type ->
  ?minimum_engine_version:string_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?parameter_value:string_ ->
  ?parameter_name:string_ ->
  unit ->
  parameter

val make_authentication_mode :
  ?passwords:password_list_input -> ?type_:input_authentication_type -> unit -> authentication_mode

val make_modify_user_message :
  ?engine:engine_type ->
  ?authentication_mode:authentication_mode ->
  ?no_password_required:boolean_optional ->
  ?passwords:password_list_input ->
  ?append_access_string:access_string ->
  ?access_string:access_string ->
  user_id:user_id ->
  unit ->
  modify_user_message

val make_modify_user_group_message :
  ?engine:engine_type ->
  ?user_ids_to_remove:user_id_list_input ->
  ?user_ids_to_add:user_id_list_input ->
  user_group_id:string_ ->
  unit ->
  modify_user_group_message

val make_modify_serverless_cache_response :
  ?serverless_cache:serverless_cache -> unit -> modify_serverless_cache_response

val make_modify_serverless_cache_request :
  ?major_engine_version:string_ ->
  ?engine:string_ ->
  ?daily_snapshot_time:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?security_group_ids:security_group_ids_list ->
  ?user_group_id:string_ ->
  ?remove_user_group:boolean_optional ->
  ?cache_usage_limits:cache_usage_limits ->
  ?description:string_ ->
  serverless_cache_name:string_ ->
  unit ->
  modify_serverless_cache_request

val make_modify_replication_group_shard_configuration_message :
  ?node_groups_to_retain:node_groups_to_retain_list ->
  ?node_groups_to_remove:node_groups_to_remove_list ->
  ?resharding_configuration:resharding_configuration_list ->
  apply_immediately:boolean_ ->
  node_group_count:integer ->
  replication_group_id:string_ ->
  unit ->
  modify_replication_group_shard_configuration_message

val make_log_delivery_configuration_request :
  ?enabled:boolean_optional ->
  ?log_format:log_format ->
  ?destination_details:destination_details ->
  ?destination_type:destination_type ->
  ?log_type:log_type ->
  unit ->
  log_delivery_configuration_request

val make_modify_replication_group_message :
  ?durability:durability ->
  ?cluster_mode:cluster_mode ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?transit_encryption_enabled:boolean_optional ->
  ?ip_discovery:ip_discovery ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?remove_user_groups:boolean_optional ->
  ?user_group_ids_to_remove:user_group_id_list ->
  ?user_group_ids_to_add:user_group_id_list ->
  ?auth_token_update_strategy:auth_token_update_strategy_type ->
  ?auth_token:string_ ->
  ?cache_node_type:string_ ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?apply_immediately:boolean_ ->
  ?notification_topic_status:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?notification_topic_arn:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?node_group_id:string_ ->
  ?multi_az_enabled:boolean_optional ->
  ?automatic_failover_enabled:boolean_optional ->
  ?snapshotting_cluster_id:string_ ->
  ?primary_cluster_id:string_ ->
  ?replication_group_description:string_ ->
  replication_group_id:string_ ->
  unit ->
  modify_replication_group_message

val make_modify_global_replication_group_message :
  ?automatic_failover_enabled:boolean_optional ->
  ?global_replication_group_description:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  apply_immediately:boolean_ ->
  global_replication_group_id:string_ ->
  unit ->
  modify_global_replication_group_message

val make_cache_subnet_group :
  ?supported_network_types:network_type_list ->
  ?ar_n:string_ ->
  ?subnets:subnet_list ->
  ?vpc_id:string_ ->
  ?cache_subnet_group_description:string_ ->
  ?cache_subnet_group_name:string_ ->
  unit ->
  cache_subnet_group

val make_modify_cache_subnet_group_message :
  ?subnet_ids:subnet_identifier_list ->
  ?cache_subnet_group_description:string_ ->
  cache_subnet_group_name:string_ ->
  unit ->
  modify_cache_subnet_group_message

val make_modify_cache_parameter_group_message :
  parameter_name_values:parameter_name_value_list ->
  cache_parameter_group_name:string_ ->
  unit ->
  modify_cache_parameter_group_message

val make_modify_cache_cluster_message :
  ?scale_config:scale_config ->
  ?ip_discovery:ip_discovery ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?auth_token_update_strategy:auth_token_update_strategy_type ->
  ?auth_token:string_ ->
  ?cache_node_type:string_ ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?apply_immediately:boolean_ ->
  ?notification_topic_status:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?notification_topic_arn:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?security_group_ids:security_group_ids_list ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?new_availability_zones:preferred_availability_zone_list ->
  ?az_mode:az_mode ->
  ?cache_node_ids_to_remove:cache_node_ids_list ->
  ?num_cache_nodes:integer_optional ->
  cache_cluster_id:string_ ->
  unit ->
  modify_cache_cluster_message

val make_list_tags_for_resource_message :
  resource_name:string_ -> unit -> list_tags_for_resource_message

val make_list_allowed_node_type_modifications_message :
  ?replication_group_id:string_ ->
  ?cache_cluster_id:string_ ->
  unit ->
  list_allowed_node_type_modifications_message

val make_allowed_node_type_modifications_message :
  ?scale_down_modifications:node_type_list ->
  ?scale_up_modifications:node_type_list ->
  unit ->
  allowed_node_type_modifications_message

val make_increase_replica_count_message :
  ?replica_configuration:replica_configuration_list ->
  ?new_replica_count:integer_optional ->
  apply_immediately:boolean_ ->
  replication_group_id:string_ ->
  unit ->
  increase_replica_count_message

val make_increase_node_groups_in_global_replication_group_message :
  ?regional_configurations:regional_configuration_list ->
  apply_immediately:boolean_ ->
  node_group_count:integer ->
  global_replication_group_id:string_ ->
  unit ->
  increase_node_groups_in_global_replication_group_message

val make_filter : values:filter_value_list -> name:filter_name -> unit -> filter

val make_failover_global_replication_group_message :
  primary_replication_group_id:string_ ->
  primary_region:string_ ->
  global_replication_group_id:string_ ->
  unit ->
  failover_global_replication_group_message

val make_export_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  export_serverless_cache_snapshot_response

val make_export_serverless_cache_snapshot_request :
  s3_bucket_name:string_ ->
  serverless_cache_snapshot_name:string_ ->
  unit ->
  export_serverless_cache_snapshot_request

val make_event :
  ?date:t_stamp ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  event

val make_events_message : ?events:event_list -> ?marker:string_ -> unit -> events_message

val make_cache_node_type_specific_value :
  ?value:string_ -> ?cache_node_type:string_ -> unit -> cache_node_type_specific_value

val make_cache_node_type_specific_parameter :
  ?change_type:change_type ->
  ?cache_node_type_specific_values:cache_node_type_specific_value_list ->
  ?minimum_engine_version:string_ ->
  ?is_modifiable:boolean_ ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?parameter_name:string_ ->
  unit ->
  cache_node_type_specific_parameter

val make_engine_defaults :
  ?cache_node_type_specific_parameters:cache_node_type_specific_parameters_list ->
  ?parameters:parameters_list ->
  ?marker:string_ ->
  ?cache_parameter_group_family:string_ ->
  unit ->
  engine_defaults

val make_disassociate_global_replication_group_message :
  replication_group_region:string_ ->
  replication_group_id:string_ ->
  global_replication_group_id:string_ ->
  unit ->
  disassociate_global_replication_group_message

val make_describe_users_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?user_id:user_id ->
  ?engine:engine_type ->
  unit ->
  describe_users_message

val make_describe_user_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?user_group_id:string_ ->
  unit ->
  describe_user_groups_message

val make_describe_update_actions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?show_node_level_update_status:boolean_optional ->
  ?update_action_status:update_action_status_list ->
  ?service_update_time_range:time_range_filter ->
  ?service_update_status:service_update_status_list ->
  ?engine:string_ ->
  ?cache_cluster_ids:cache_cluster_id_list ->
  ?replication_group_ids:replication_group_id_list ->
  ?service_update_name:string_ ->
  unit ->
  describe_update_actions_message

val make_describe_snapshots_message :
  ?show_node_group_config:boolean_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?snapshot_source:string_ ->
  ?snapshot_name:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  unit ->
  describe_snapshots_message

val make_describe_snapshots_list_message :
  ?snapshots:snapshot_list -> ?marker:string_ -> unit -> describe_snapshots_list_message

val make_describe_service_updates_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?service_update_status:service_update_status_list ->
  ?service_update_name:string_ ->
  unit ->
  describe_service_updates_message

val make_describe_serverless_caches_response :
  ?serverless_caches:serverless_cache_list ->
  ?next_token:string_ ->
  unit ->
  describe_serverless_caches_response

val make_describe_serverless_caches_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?serverless_cache_name:string_ ->
  unit ->
  describe_serverless_caches_request

val make_describe_serverless_cache_snapshots_response :
  ?serverless_cache_snapshots:serverless_cache_snapshot_list ->
  ?next_token:string_ ->
  unit ->
  describe_serverless_cache_snapshots_response

val make_describe_serverless_cache_snapshots_request :
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  ?snapshot_type:string_ ->
  ?serverless_cache_snapshot_name:string_ ->
  ?serverless_cache_name:string_ ->
  unit ->
  describe_serverless_cache_snapshots_request

val make_describe_reserved_cache_nodes_offerings_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?duration:string_ ->
  ?cache_node_type:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  unit ->
  describe_reserved_cache_nodes_offerings_message

val make_describe_reserved_cache_nodes_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?offering_type:string_ ->
  ?product_description:string_ ->
  ?duration:string_ ->
  ?cache_node_type:string_ ->
  ?reserved_cache_nodes_offering_id:string_ ->
  ?reserved_cache_node_id:string_ ->
  unit ->
  describe_reserved_cache_nodes_message

val make_describe_replication_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?replication_group_id:string_ ->
  unit ->
  describe_replication_groups_message

val make_describe_global_replication_groups_message :
  ?show_member_info:boolean_optional ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?global_replication_group_id:string_ ->
  unit ->
  describe_global_replication_groups_message

val make_describe_events_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?duration:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  describe_events_message

val make_describe_engine_default_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  cache_parameter_group_family:string_ ->
  unit ->
  describe_engine_default_parameters_message

val make_describe_cache_subnet_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cache_subnet_group_name:string_ ->
  unit ->
  describe_cache_subnet_groups_message

val make_cache_subnet_group_message :
  ?cache_subnet_groups:cache_subnet_groups -> ?marker:string_ -> unit -> cache_subnet_group_message

val make_describe_cache_security_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cache_security_group_name:string_ ->
  unit ->
  describe_cache_security_groups_message

val make_cache_security_group_message :
  ?cache_security_groups:cache_security_groups ->
  ?marker:string_ ->
  unit ->
  cache_security_group_message

val make_describe_cache_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?source:string_ ->
  cache_parameter_group_name:string_ ->
  unit ->
  describe_cache_parameters_message

val make_cache_parameter_group_details :
  ?cache_node_type_specific_parameters:cache_node_type_specific_parameters_list ->
  ?parameters:parameters_list ->
  ?marker:string_ ->
  unit ->
  cache_parameter_group_details

val make_describe_cache_parameter_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cache_parameter_group_name:string_ ->
  unit ->
  describe_cache_parameter_groups_message

val make_cache_parameter_group :
  ?ar_n:string_ ->
  ?is_global:boolean_ ->
  ?description:string_ ->
  ?cache_parameter_group_family:string_ ->
  ?cache_parameter_group_name:string_ ->
  unit ->
  cache_parameter_group

val make_cache_parameter_groups_message :
  ?cache_parameter_groups:cache_parameter_group_list ->
  ?marker:string_ ->
  unit ->
  cache_parameter_groups_message

val make_describe_cache_engine_versions_message :
  ?default_only:boolean_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cache_parameter_group_family:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  describe_cache_engine_versions_message

val make_cache_engine_version :
  ?cache_engine_version_description:string_ ->
  ?cache_engine_description:string_ ->
  ?cache_parameter_group_family:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  cache_engine_version

val make_cache_engine_version_message :
  ?cache_engine_versions:cache_engine_version_list ->
  ?marker:string_ ->
  unit ->
  cache_engine_version_message

val make_describe_cache_clusters_message :
  ?show_cache_clusters_not_in_replication_groups:boolean_optional ->
  ?show_cache_node_info:boolean_optional ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cache_cluster_id:string_ ->
  unit ->
  describe_cache_clusters_message

val make_cache_cluster_message :
  ?cache_clusters:cache_cluster_list -> ?marker:string_ -> unit -> cache_cluster_message

val make_delete_user_message : user_id:user_id -> unit -> delete_user_message
val make_delete_user_group_message : user_group_id:string_ -> unit -> delete_user_group_message
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
  ?final_snapshot_identifier:string_ ->
  ?retain_primary_cluster:boolean_optional ->
  replication_group_id:string_ ->
  unit ->
  delete_replication_group_message

val make_delete_global_replication_group_message :
  retain_primary_replication_group:boolean_ ->
  global_replication_group_id:string_ ->
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
  ?replicas_to_remove:remove_replicas_list ->
  ?replica_configuration:replica_configuration_list ->
  ?new_replica_count:integer_optional ->
  apply_immediately:boolean_ ->
  replication_group_id:string_ ->
  unit ->
  decrease_replica_count_message

val make_decrease_node_groups_in_global_replication_group_message :
  ?global_node_groups_to_retain:global_node_group_id_list ->
  ?global_node_groups_to_remove:global_node_group_id_list ->
  apply_immediately:boolean_ ->
  node_group_count:integer ->
  global_replication_group_id:string_ ->
  unit ->
  decrease_node_groups_in_global_replication_group_message

val make_create_user_message :
  ?authentication_mode:authentication_mode ->
  ?tags:tag_list ->
  ?no_password_required:boolean_optional ->
  ?passwords:password_list_input ->
  access_string:access_string ->
  engine:engine_type ->
  user_name:user_name ->
  user_id:user_id ->
  unit ->
  create_user_message

val make_create_user_group_message :
  ?tags:tag_list ->
  ?user_ids:user_id_list_input ->
  engine:engine_type ->
  user_group_id:string_ ->
  unit ->
  create_user_group_message

val make_create_snapshot_message :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?cache_cluster_id:string_ ->
  ?replication_group_id:string_ ->
  snapshot_name:string_ ->
  unit ->
  create_snapshot_message

val make_create_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  create_serverless_cache_snapshot_response

val make_create_serverless_cache_snapshot_request :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  serverless_cache_name:string_ ->
  serverless_cache_snapshot_name:string_ ->
  unit ->
  create_serverless_cache_snapshot_request

val make_create_serverless_cache_response :
  ?serverless_cache:serverless_cache -> unit -> create_serverless_cache_response

val make_create_serverless_cache_request :
  ?network_type:network_type ->
  ?daily_snapshot_time:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?subnet_ids:subnet_ids_list ->
  ?user_group_id:string_ ->
  ?tags:tag_list ->
  ?snapshot_arns_to_restore:snapshot_arns_list ->
  ?security_group_ids:security_group_ids_list ->
  ?kms_key_id:string_ ->
  ?cache_usage_limits:cache_usage_limits ->
  ?major_engine_version:string_ ->
  ?description:string_ ->
  engine:string_ ->
  serverless_cache_name:string_ ->
  unit ->
  create_serverless_cache_request

val make_create_replication_group_message :
  ?durability:durability ->
  ?serverless_cache_snapshot_name:string_ ->
  ?cluster_mode:cluster_mode ->
  ?transit_encryption_mode:transit_encryption_mode ->
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?data_tiering_enabled:boolean_optional ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?user_group_ids:user_group_id_list_input ->
  ?kms_key_id:string_ ->
  ?at_rest_encryption_enabled:boolean_optional ->
  ?transit_encryption_enabled:boolean_optional ->
  ?auth_token:string_ ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?notification_topic_arn:string_ ->
  ?port:integer_optional ->
  ?preferred_maintenance_window:string_ ->
  ?snapshot_name:string_ ->
  ?snapshot_arns:snapshot_arns_list ->
  ?tags:tag_list ->
  ?security_group_ids:security_group_ids_list ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?cache_subnet_group_name:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  ?node_group_configuration:node_group_configuration_list ->
  ?replicas_per_node_group:integer_optional ->
  ?num_node_groups:integer_optional ->
  ?preferred_cache_cluster_a_zs:availability_zones_list ->
  ?num_cache_clusters:integer_optional ->
  ?multi_az_enabled:boolean_optional ->
  ?automatic_failover_enabled:boolean_optional ->
  ?primary_cluster_id:string_ ->
  ?global_replication_group_id:string_ ->
  replication_group_description:string_ ->
  replication_group_id:string_ ->
  unit ->
  create_replication_group_message

val make_create_global_replication_group_message :
  ?global_replication_group_description:string_ ->
  primary_replication_group_id:string_ ->
  global_replication_group_id_suffix:string_ ->
  unit ->
  create_global_replication_group_message

val make_create_cache_subnet_group_message :
  ?tags:tag_list ->
  subnet_ids:subnet_identifier_list ->
  cache_subnet_group_description:string_ ->
  cache_subnet_group_name:string_ ->
  unit ->
  create_cache_subnet_group_message

val make_create_cache_security_group_message :
  ?tags:tag_list ->
  description:string_ ->
  cache_security_group_name:string_ ->
  unit ->
  create_cache_security_group_message

val make_create_cache_parameter_group_message :
  ?tags:tag_list ->
  description:string_ ->
  cache_parameter_group_family:string_ ->
  cache_parameter_group_name:string_ ->
  unit ->
  create_cache_parameter_group_message

val make_create_cache_cluster_message :
  ?ip_discovery:ip_discovery ->
  ?network_type:network_type ->
  ?transit_encryption_enabled:boolean_optional ->
  ?log_delivery_configurations:log_delivery_configuration_request_list ->
  ?preferred_outpost_arns:preferred_outpost_arn_list ->
  ?preferred_outpost_arn:string_ ->
  ?outpost_mode:outpost_mode ->
  ?auth_token:string_ ->
  ?snapshot_window:string_ ->
  ?snapshot_retention_limit:integer_optional ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?notification_topic_arn:string_ ->
  ?port:integer_optional ->
  ?preferred_maintenance_window:string_ ->
  ?snapshot_name:string_ ->
  ?snapshot_arns:snapshot_arns_list ->
  ?tags:tag_list ->
  ?security_group_ids:security_group_ids_list ->
  ?cache_security_group_names:cache_security_group_name_list ->
  ?cache_subnet_group_name:string_ ->
  ?cache_parameter_group_name:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  ?cache_node_type:string_ ->
  ?num_cache_nodes:integer_optional ->
  ?preferred_availability_zones:preferred_availability_zone_list ->
  ?preferred_availability_zone:string_ ->
  ?az_mode:az_mode ->
  ?replication_group_id:string_ ->
  cache_cluster_id:string_ ->
  unit ->
  create_cache_cluster_message

val make_copy_snapshot_message :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?target_bucket:string_ ->
  target_snapshot_name:string_ ->
  source_snapshot_name:string_ ->
  unit ->
  copy_snapshot_message

val make_copy_serverless_cache_snapshot_response :
  ?serverless_cache_snapshot:serverless_cache_snapshot ->
  unit ->
  copy_serverless_cache_snapshot_response

val make_copy_serverless_cache_snapshot_request :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  target_serverless_cache_snapshot_name:string_ ->
  source_serverless_cache_snapshot_name:string_ ->
  unit ->
  copy_serverless_cache_snapshot_request

val make_complete_migration_response :
  ?replication_group:replication_group -> unit -> complete_migration_response

val make_complete_migration_message :
  ?force:boolean_ -> replication_group_id:string_ -> unit -> complete_migration_message

val make_batch_stop_update_action_message :
  ?cache_cluster_ids:cache_cluster_id_list ->
  ?replication_group_ids:replication_group_id_list ->
  service_update_name:string_ ->
  unit ->
  batch_stop_update_action_message

val make_batch_apply_update_action_message :
  ?cache_cluster_ids:cache_cluster_id_list ->
  ?replication_group_ids:replication_group_id_list ->
  service_update_name:string_ ->
  unit ->
  batch_apply_update_action_message

val make_authorize_cache_security_group_ingress_message :
  ec2_security_group_owner_id:string_ ->
  ec2_security_group_name:string_ ->
  cache_security_group_name:string_ ->
  unit ->
  authorize_cache_security_group_ingress_message

val make_add_tags_to_resource_message :
  tags:tag_list -> resource_name:string_ -> unit -> add_tags_to_resource_message
