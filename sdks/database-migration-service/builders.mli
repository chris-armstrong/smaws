open Types

val make_account_quota :
  ?account_quota_name:string_ -> ?used:long -> ?max:long -> unit -> account_quota

val make_add_tags_to_resource_response : unit -> unit
val make_tag : ?key:string_ -> ?value:string_ -> ?resource_arn:string_ -> unit -> tag

val make_add_tags_to_resource_message :
  resource_arn:string_ -> tags:tag_list -> unit -> add_tags_to_resource_message

val make_update_subscriptions_to_event_bridge_response :
  ?result_:string_ -> unit -> update_subscriptions_to_event_bridge_response

val make_update_subscriptions_to_event_bridge_message :
  ?force_move:boolean_optional -> unit -> update_subscriptions_to_event_bridge_message

val make_connection :
  ?replication_instance_arn:string_ ->
  ?endpoint_arn:string_ ->
  ?status:string_ ->
  ?last_failure_message:string_ ->
  ?endpoint_identifier:string_ ->
  ?replication_instance_identifier:string_ ->
  unit ->
  connection

val make_test_connection_response : ?connection:connection -> unit -> test_connection_response

val make_test_connection_message :
  replication_instance_arn:string_ -> endpoint_arn:string_ -> unit -> test_connection_message

val make_replication_task_stats :
  ?full_load_progress_percent:integer ->
  ?elapsed_time_millis:long ->
  ?tables_loaded:integer ->
  ?tables_loading:integer ->
  ?tables_queued:integer ->
  ?tables_errored:integer ->
  ?fresh_start_date:t_stamp ->
  ?start_date:t_stamp ->
  ?stop_date:t_stamp ->
  ?full_load_start_date:t_stamp ->
  ?full_load_finish_date:t_stamp ->
  unit ->
  replication_task_stats

val make_replication_task :
  ?replication_task_identifier:string_ ->
  ?source_endpoint_arn:string_ ->
  ?target_endpoint_arn:string_ ->
  ?replication_instance_arn:string_ ->
  ?migration_type:migration_type_value ->
  ?table_mappings:string_ ->
  ?replication_task_settings:string_ ->
  ?status:string_ ->
  ?last_failure_message:string_ ->
  ?stop_reason:string_ ->
  ?replication_task_creation_date:t_stamp ->
  ?replication_task_start_date:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  ?recovery_checkpoint:string_ ->
  ?replication_task_arn:string_ ->
  ?replication_task_stats:replication_task_stats ->
  ?task_data:string_ ->
  ?target_replication_instance_arn:string_ ->
  unit ->
  replication_task

val make_stop_replication_task_response :
  ?replication_task:replication_task -> unit -> stop_replication_task_response

val make_stop_replication_task_message :
  replication_task_arn:string_ -> unit -> stop_replication_task_message

val make_replication_stats :
  ?full_load_progress_percent:integer ->
  ?elapsed_time_millis:long ->
  ?tables_loaded:integer ->
  ?tables_loading:integer ->
  ?tables_queued:integer ->
  ?tables_errored:integer ->
  ?fresh_start_date:t_stamp ->
  ?start_date:t_stamp ->
  ?stop_date:t_stamp ->
  ?full_load_start_date:t_stamp ->
  ?full_load_finish_date:t_stamp ->
  unit ->
  replication_stats

val make_replication_task_assessment_run_result_statistic :
  ?passed:integer ->
  ?failed:integer ->
  ?error:integer ->
  ?warning:integer ->
  ?cancelled:integer ->
  ?skipped:integer ->
  unit ->
  replication_task_assessment_run_result_statistic

val make_replication_task_assessment_run_progress :
  ?individual_assessment_count:integer ->
  ?individual_assessment_completed_count:integer ->
  unit ->
  replication_task_assessment_run_progress

val make_premigration_assessment_status :
  ?premigration_assessment_run_arn:string_ ->
  ?fail_on_assessment_failure:boolean_ ->
  ?status:string_ ->
  ?premigration_assessment_run_creation_date:t_stamp ->
  ?assessment_progress:replication_task_assessment_run_progress ->
  ?last_failure_message:string_ ->
  ?result_location_bucket:string_ ->
  ?result_location_folder:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_kms_key_arn:string_ ->
  ?result_statistic:replication_task_assessment_run_result_statistic ->
  unit ->
  premigration_assessment_status

val make_provision_data :
  ?provision_state:string_ ->
  ?provisioned_capacity_units:integer ->
  ?date_provisioned:t_stamp ->
  ?is_new_provisioning_available:boolean_ ->
  ?date_new_provisioning_data_available:t_stamp ->
  ?reason_for_new_provisioning_data:string_ ->
  unit ->
  provision_data

val make_replication :
  ?replication_config_identifier:string_ ->
  ?replication_config_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?target_endpoint_arn:string_ ->
  ?replication_type:migration_type_value ->
  ?status:string_ ->
  ?provision_data:provision_data ->
  ?premigration_assessment_statuses:premigration_assessment_status_list ->
  ?stop_reason:string_ ->
  ?failure_messages:string_list ->
  ?replication_stats:replication_stats ->
  ?start_replication_type:string_ ->
  ?cdc_start_time:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  ?recovery_checkpoint:string_ ->
  ?replication_create_time:t_stamp ->
  ?replication_update_time:t_stamp ->
  ?replication_last_stop_time:t_stamp ->
  ?replication_deprovision_time:t_stamp ->
  ?is_read_only:boolean_optional ->
  unit ->
  replication

val make_stop_replication_response : ?replication:replication -> unit -> stop_replication_response

val make_stop_replication_message :
  replication_config_arn:string_ -> unit -> stop_replication_message

val make_data_migration_statistics :
  ?tables_loaded:integer ->
  ?elapsed_time_millis:long ->
  ?tables_loading:integer ->
  ?full_load_percentage:integer ->
  ?cdc_latency:integer ->
  ?tables_queued:integer ->
  ?tables_errored:integer ->
  ?start_time:iso8601_date_time ->
  ?stop_time:iso8601_date_time ->
  unit ->
  data_migration_statistics

val make_target_data_setting :
  ?table_preparation_mode:table_preparation_mode -> unit -> target_data_setting

val make_source_data_setting :
  ?cdc_start_position:string_ ->
  ?cdc_start_time:iso8601_date_time ->
  ?cdc_stop_time:iso8601_date_time ->
  ?slot_name:string_ ->
  unit ->
  source_data_setting

val make_data_migration_settings :
  ?number_of_jobs:integer_optional ->
  ?cloudwatch_logs_enabled:boolean_optional ->
  ?selection_rules:secret_string ->
  unit ->
  data_migration_settings

val make_data_migration :
  ?data_migration_name:string_ ->
  ?data_migration_arn:string_ ->
  ?data_migration_create_time:iso8601_date_time ->
  ?data_migration_start_time:iso8601_date_time ->
  ?data_migration_end_time:iso8601_date_time ->
  ?service_access_role_arn:string_ ->
  ?migration_project_arn:string_ ->
  ?data_migration_type:migration_type_value ->
  ?data_migration_settings:data_migration_settings ->
  ?source_data_settings:source_data_settings ->
  ?target_data_settings:target_data_settings ->
  ?data_migration_statistics:data_migration_statistics ->
  ?data_migration_status:string_ ->
  ?public_ip_addresses:public_ip_address_list ->
  ?data_migration_cidr_blocks:data_migration_cidr_block ->
  ?last_failure_message:string_ ->
  ?stop_reason:string_ ->
  unit ->
  data_migration

val make_stop_data_migration_response :
  ?data_migration:data_migration -> unit -> stop_data_migration_response

val make_stop_data_migration_message :
  data_migration_identifier:string_ -> unit -> stop_data_migration_message

val make_replication_task_assessment_run :
  ?replication_task_assessment_run_arn:string_ ->
  ?replication_task_arn:string_ ->
  ?status:string_ ->
  ?replication_task_assessment_run_creation_date:t_stamp ->
  ?assessment_progress:replication_task_assessment_run_progress ->
  ?last_failure_message:string_ ->
  ?service_access_role_arn:string_ ->
  ?result_location_bucket:string_ ->
  ?result_location_folder:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_kms_key_arn:string_ ->
  ?assessment_run_name:string_ ->
  ?is_latest_task_assessment_run:boolean_ ->
  ?result_statistic:replication_task_assessment_run_result_statistic ->
  unit ->
  replication_task_assessment_run

val make_start_replication_task_assessment_run_response :
  ?replication_task_assessment_run:replication_task_assessment_run ->
  unit ->
  start_replication_task_assessment_run_response

val make_start_replication_task_assessment_run_message :
  ?result_location_folder:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_kms_key_arn:string_ ->
  ?include_only:include_test_list ->
  ?exclude:exclude_test_list ->
  ?tags:tag_list ->
  replication_task_arn:string_ ->
  service_access_role_arn:string_ ->
  result_location_bucket:string_ ->
  assessment_run_name:string_ ->
  unit ->
  start_replication_task_assessment_run_message

val make_start_replication_task_assessment_response :
  ?replication_task:replication_task -> unit -> start_replication_task_assessment_response

val make_start_replication_task_assessment_message :
  replication_task_arn:string_ -> unit -> start_replication_task_assessment_message

val make_start_replication_task_response :
  ?replication_task:replication_task -> unit -> start_replication_task_response

val make_start_replication_task_message :
  ?cdc_start_time:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  replication_task_arn:string_ ->
  start_replication_task_type:start_replication_task_type_value ->
  unit ->
  start_replication_task_message

val make_start_replication_response : ?replication:replication -> unit -> start_replication_response

val make_start_replication_message :
  ?premigration_assessment_settings:string_ ->
  ?cdc_start_time:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  replication_config_arn:string_ ->
  start_replication_type:string_ ->
  unit ->
  start_replication_message

val make_recommendation_settings :
  instance_sizing_type:string_ -> workload_type:string_ -> unit -> recommendation_settings

val make_start_recommendations_request :
  database_id:string_ -> settings:recommendation_settings -> unit -> start_recommendations_request

val make_start_metadata_model_import_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_import_response

val make_start_metadata_model_import_message :
  ?refresh:boolean_ ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  origin:origin_type_value ->
  unit ->
  start_metadata_model_import_message

val make_start_metadata_model_export_to_target_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_export_to_target_response

val make_start_metadata_model_export_to_target_message :
  ?overwrite_extension_pack:boolean_optional ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  start_metadata_model_export_to_target_message

val make_start_metadata_model_export_as_script_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_export_as_script_response

val make_start_metadata_model_export_as_script_message :
  ?file_name:string_ ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  origin:origin_type_value ->
  unit ->
  start_metadata_model_export_as_script_message

val make_start_metadata_model_creation_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_creation_response

val make_statement_properties : definition:string_ -> unit -> statement_properties

val make_start_metadata_model_creation_message :
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  metadata_model_name:string_ ->
  properties:metadata_model_properties ->
  unit ->
  start_metadata_model_creation_message

val make_start_metadata_model_conversion_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_conversion_response

val make_start_metadata_model_conversion_message :
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  start_metadata_model_conversion_message

val make_start_metadata_model_assessment_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_assessment_response

val make_start_metadata_model_assessment_message :
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  start_metadata_model_assessment_message

val make_start_extension_pack_association_response :
  ?request_identifier:string_ -> unit -> start_extension_pack_association_response

val make_start_extension_pack_association_message :
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_extension_pack_association_message

val make_start_data_migration_response :
  ?data_migration:data_migration -> unit -> start_data_migration_response

val make_start_data_migration_message :
  data_migration_identifier:string_ ->
  start_type:start_replication_migration_type_value ->
  unit ->
  start_data_migration_message

val make_run_fleet_advisor_lsa_analysis_response :
  ?lsa_analysis_id:string_ -> ?status:string_ -> unit -> run_fleet_advisor_lsa_analysis_response

val make_remove_tags_from_resource_response : unit -> unit

val make_remove_tags_from_resource_message :
  resource_arn:string_ -> tag_keys:key_list -> unit -> remove_tags_from_resource_message

val make_reload_tables_response : ?replication_task_arn:string_ -> unit -> reload_tables_response
val make_table_to_reload : schema_name:string_ -> table_name:string_ -> unit -> table_to_reload

val make_reload_tables_message :
  ?reload_option:reload_option_value ->
  replication_task_arn:string_ ->
  tables_to_reload:table_list_to_reload ->
  unit ->
  reload_tables_message

val make_reload_replication_tables_response :
  ?replication_config_arn:string_ -> unit -> reload_replication_tables_response

val make_reload_replication_tables_message :
  ?reload_option:reload_option_value ->
  replication_config_arn:string_ ->
  tables_to_reload:table_list_to_reload ->
  unit ->
  reload_replication_tables_message

val make_refresh_schemas_status :
  ?endpoint_arn:string_ ->
  ?replication_instance_arn:string_ ->
  ?status:refresh_schemas_status_type_value ->
  ?last_refresh_date:t_stamp ->
  ?last_failure_message:string_ ->
  unit ->
  refresh_schemas_status

val make_refresh_schemas_response :
  ?refresh_schemas_status:refresh_schemas_status -> unit -> refresh_schemas_response

val make_refresh_schemas_message :
  endpoint_arn:string_ -> replication_instance_arn:string_ -> unit -> refresh_schemas_message

val make_kerberos_authentication_settings :
  ?key_cache_secret_id:string_ ->
  ?key_cache_secret_iam_arn:string_ ->
  ?krb5_file_contents:string_ ->
  unit ->
  kerberos_authentication_settings

val make_replication_pending_modified_values :
  ?replication_instance_class:replication_instance_class ->
  ?allocated_storage:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?network_type:string_ ->
  unit ->
  replication_pending_modified_values

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_status:string_ ->
  unit ->
  subnet

val make_replication_subnet_group :
  ?replication_subnet_group_identifier:string_ ->
  ?replication_subnet_group_description:string_ ->
  ?vpc_id:string_ ->
  ?subnet_group_status:string_ ->
  ?subnets:subnet_list ->
  ?supported_network_types:string_list ->
  ?is_read_only:boolean_optional ->
  unit ->
  replication_subnet_group

val make_vpc_security_group_membership :
  ?vpc_security_group_id:string_ -> ?status:string_ -> unit -> vpc_security_group_membership

val make_replication_instance :
  ?replication_instance_identifier:string_ ->
  ?replication_instance_class:replication_instance_class ->
  ?replication_instance_status:string_ ->
  ?allocated_storage:integer ->
  ?instance_create_time:t_stamp ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?availability_zone:string_ ->
  ?replication_subnet_group:replication_subnet_group ->
  ?preferred_maintenance_window:string_ ->
  ?pending_modified_values:replication_pending_modified_values ->
  ?multi_a_z:boolean_ ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?kms_key_id:string_ ->
  ?replication_instance_arn:string_ ->
  ?replication_instance_public_ip_address:string_ ->
  ?replication_instance_private_ip_address:string_ ->
  ?replication_instance_public_ip_addresses:replication_instance_public_ip_address_list ->
  ?replication_instance_private_ip_addresses:replication_instance_private_ip_address_list ->
  ?replication_instance_ipv6_addresses:replication_instance_ipv6_address_list ->
  ?publicly_accessible:boolean_ ->
  ?secondary_availability_zone:string_ ->
  ?free_until:t_stamp ->
  ?dns_name_servers:string_ ->
  ?network_type:string_ ->
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  unit ->
  replication_instance

val make_reboot_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> reboot_replication_instance_response

val make_reboot_replication_instance_message :
  ?force_failover:boolean_optional ->
  ?force_planned_failover:boolean_optional ->
  replication_instance_arn:string_ ->
  unit ->
  reboot_replication_instance_message

val make_move_replication_task_response :
  ?replication_task:replication_task -> unit -> move_replication_task_response

val make_move_replication_task_message :
  replication_task_arn:string_ ->
  target_replication_instance_arn:string_ ->
  unit ->
  move_replication_task_message

val make_modify_replication_task_response :
  ?replication_task:replication_task -> unit -> modify_replication_task_response

val make_modify_replication_task_message :
  ?replication_task_identifier:string_ ->
  ?migration_type:migration_type_value ->
  ?table_mappings:string_ ->
  ?replication_task_settings:string_ ->
  ?cdc_start_time:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  ?task_data:string_ ->
  replication_task_arn:string_ ->
  unit ->
  modify_replication_task_message

val make_modify_replication_subnet_group_response :
  ?replication_subnet_group:replication_subnet_group ->
  unit ->
  modify_replication_subnet_group_response

val make_modify_replication_subnet_group_message :
  ?replication_subnet_group_description:string_ ->
  replication_subnet_group_identifier:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  modify_replication_subnet_group_message

val make_modify_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> modify_replication_instance_response

val make_modify_replication_instance_message :
  ?allocated_storage:integer_optional ->
  ?apply_immediately:boolean_ ->
  ?replication_instance_class:replication_instance_class ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?preferred_maintenance_window:string_ ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?allow_major_version_upgrade:boolean_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?replication_instance_identifier:string_ ->
  ?network_type:string_ ->
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  replication_instance_arn:string_ ->
  unit ->
  modify_replication_instance_message

val make_compute_config :
  ?availability_zone:string_ ->
  ?dns_name_servers:string_ ->
  ?kms_key_id:string_ ->
  ?max_capacity_units:integer_optional ->
  ?min_capacity_units:integer_optional ->
  ?multi_a_z:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?replication_subnet_group_id:string_ ->
  ?vpc_security_group_ids:string_list ->
  unit ->
  compute_config

val make_replication_config :
  ?replication_config_identifier:string_ ->
  ?replication_config_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?target_endpoint_arn:string_ ->
  ?replication_type:migration_type_value ->
  ?compute_config:compute_config ->
  ?replication_settings:string_ ->
  ?supplemental_settings:string_ ->
  ?table_mappings:string_ ->
  ?replication_config_create_time:t_stamp ->
  ?replication_config_update_time:t_stamp ->
  ?is_read_only:boolean_optional ->
  unit ->
  replication_config

val make_modify_replication_config_response :
  ?replication_config:replication_config -> unit -> modify_replication_config_response

val make_modify_replication_config_message :
  ?replication_config_identifier:string_ ->
  ?replication_type:migration_type_value ->
  ?table_mappings:string_ ->
  ?replication_settings:string_ ->
  ?supplemental_settings:string_ ->
  ?compute_config:compute_config ->
  ?source_endpoint_arn:string_ ->
  ?target_endpoint_arn:string_ ->
  replication_config_arn:string_ ->
  unit ->
  modify_replication_config_message

val make_sc_application_attributes :
  ?s3_bucket_path:string_ -> ?s3_bucket_role_arn:string_ -> unit -> sc_application_attributes

val make_data_provider_descriptor :
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?data_provider_name:string_ ->
  ?data_provider_arn:string_ ->
  unit ->
  data_provider_descriptor

val make_migration_project :
  ?migration_project_name:string_ ->
  ?migration_project_arn:string_ ->
  ?migration_project_creation_time:iso8601_date_time ->
  ?source_data_provider_descriptors:data_provider_descriptor_list ->
  ?target_data_provider_descriptors:data_provider_descriptor_list ->
  ?instance_profile_arn:string_ ->
  ?instance_profile_name:string_ ->
  ?transformation_rules:string_ ->
  ?description:string_ ->
  ?schema_conversion_application_attributes:sc_application_attributes ->
  unit ->
  migration_project

val make_modify_migration_project_response :
  ?migration_project:migration_project -> unit -> modify_migration_project_response

val make_data_provider_descriptor_definition :
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  data_provider_identifier:string_ ->
  unit ->
  data_provider_descriptor_definition

val make_modify_migration_project_message :
  ?migration_project_name:string_ ->
  ?source_data_provider_descriptors:data_provider_descriptor_definition_list ->
  ?target_data_provider_descriptors:data_provider_descriptor_definition_list ->
  ?instance_profile_identifier:string_ ->
  ?transformation_rules:string_ ->
  ?description:string_ ->
  ?schema_conversion_application_attributes:sc_application_attributes ->
  migration_project_identifier:string_ ->
  unit ->
  modify_migration_project_message

val make_instance_profile :
  ?instance_profile_arn:string_ ->
  ?availability_zone:string_ ->
  ?kms_key_arn:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?network_type:string_ ->
  ?instance_profile_name:string_ ->
  ?description:string_ ->
  ?instance_profile_creation_time:iso8601_date_time ->
  ?subnet_group_identifier:string_ ->
  ?vpc_security_groups:string_list ->
  unit ->
  instance_profile

val make_modify_instance_profile_response :
  ?instance_profile:instance_profile -> unit -> modify_instance_profile_response

val make_modify_instance_profile_message :
  ?availability_zone:string_ ->
  ?kms_key_arn:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?network_type:string_ ->
  ?instance_profile_name:string_ ->
  ?description:string_ ->
  ?subnet_group_identifier:string_ ->
  ?vpc_security_groups:string_list ->
  instance_profile_identifier:string_ ->
  unit ->
  modify_instance_profile_message

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
  unit ->
  event_subscription

val make_modify_event_subscription_response :
  ?event_subscription:event_subscription -> unit -> modify_event_subscription_response

val make_modify_event_subscription_message :
  ?sns_topic_arn:string_ ->
  ?source_type:string_ ->
  ?event_categories:event_categories_list ->
  ?enabled:boolean_optional ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_lakehouse_settings : arn:string_ -> unit -> lakehouse_settings

val make_timestream_settings :
  ?cdc_inserts_and_updates:boolean_optional ->
  ?enable_magnetic_store_writes:boolean_optional ->
  database_name:string_ ->
  memory_duration:integer_optional ->
  magnetic_duration:integer_optional ->
  unit ->
  timestream_settings

val make_gcp_my_sql_settings :
  ?after_connect_script:string_ ->
  ?clean_source_metadata_on_mismatch:boolean_optional ->
  ?database_name:string_ ->
  ?events_poll_interval:integer_optional ->
  ?target_db_type:target_db_type ->
  ?max_file_size:integer_optional ->
  ?parallel_load_threads:integer_optional ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?server_timezone:string_ ->
  ?username:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  unit ->
  gcp_my_sql_settings

val make_redis_settings :
  ?ssl_security_protocol:ssl_security_protocol_value ->
  ?auth_type:redis_auth_type_value ->
  ?auth_user_name:string_ ->
  ?auth_password:secret_string ->
  ?ssl_ca_certificate_arn:string_ ->
  server_name:string_ ->
  port:integer ->
  unit ->
  redis_settings

val make_doc_db_settings :
  ?username:string_ ->
  ?password:secret_string ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?nesting_level:nesting_level_value ->
  ?extract_doc_id:boolean_optional ->
  ?docs_to_investigate:integer_optional ->
  ?kms_key_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?use_update_look_up:boolean_optional ->
  ?replicate_shard_collections:boolean_optional ->
  unit ->
  doc_db_settings

val make_ibm_db2_settings :
  ?database_name:string_ ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?set_data_capture_changes:boolean_optional ->
  ?current_lsn:string_ ->
  ?max_k_bytes_per_read:integer_optional ->
  ?username:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?load_timeout:integer_optional ->
  ?write_buffer_size:integer_optional ->
  ?max_file_size:integer_optional ->
  ?keep_csv_files:boolean_optional ->
  unit ->
  ibm_db2_settings

val make_microsoft_sql_server_settings :
  ?port:integer_optional ->
  ?bcp_packet_size:integer_optional ->
  ?database_name:string_ ->
  ?control_tables_file_group:string_ ->
  ?password:secret_string ->
  ?query_single_always_on_node:boolean_optional ->
  ?read_backup_only:boolean_optional ->
  ?safeguard_policy:safeguard_policy ->
  ?server_name:string_ ->
  ?username:string_ ->
  ?use_bcp_full_load:boolean_optional ->
  ?use_third_party_backup_device:boolean_optional ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?trim_space_in_char:boolean_optional ->
  ?tlog_access_mode:tlog_access_mode ->
  ?force_lob_lookup:boolean_optional ->
  ?authentication_method:sql_server_authentication_method ->
  unit ->
  microsoft_sql_server_settings

val make_sybase_settings :
  ?database_name:string_ ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?username:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  unit ->
  sybase_settings

val make_oracle_settings :
  ?add_supplemental_logging:boolean_optional ->
  ?archived_log_dest_id:integer_optional ->
  ?additional_archived_log_dest_id:integer_optional ->
  ?extra_archived_log_dest_ids:integer_list ->
  ?allow_select_nested_tables:boolean_optional ->
  ?parallel_asm_read_threads:integer_optional ->
  ?read_ahead_blocks:integer_optional ->
  ?access_alternate_directly:boolean_optional ->
  ?use_alternate_folder_for_online:boolean_optional ->
  ?oracle_path_prefix:string_ ->
  ?use_path_prefix:string_ ->
  ?replace_path_prefix:boolean_optional ->
  ?enable_homogenous_tablespace:boolean_optional ->
  ?direct_path_no_log:boolean_optional ->
  ?archived_logs_only:boolean_optional ->
  ?asm_password:secret_string ->
  ?asm_server:string_ ->
  ?asm_user:string_ ->
  ?char_length_semantics:char_length_semantics ->
  ?database_name:string_ ->
  ?direct_path_parallel_load:boolean_optional ->
  ?fail_tasks_on_lob_truncation:boolean_optional ->
  ?number_datatype_scale:integer_optional ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?read_table_space_name:boolean_optional ->
  ?retry_interval:integer_optional ->
  ?security_db_encryption:secret_string ->
  ?security_db_encryption_name:string_ ->
  ?server_name:string_ ->
  ?spatial_data_option_to_geo_json_function_name:string_ ->
  ?standby_delay_time:integer_optional ->
  ?username:string_ ->
  ?use_b_file:boolean_optional ->
  ?use_direct_path_full_load:boolean_optional ->
  ?use_logminer_reader:boolean_optional ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_oracle_asm_access_role_arn:string_ ->
  ?secrets_manager_oracle_asm_secret_id:string_ ->
  ?trim_space_in_char:boolean_optional ->
  ?convert_timestamp_with_zone_to_ut_c:boolean_optional ->
  ?open_transaction_window:integer_optional ->
  ?authentication_method:oracle_authentication_method ->
  unit ->
  oracle_settings

val make_my_sql_settings :
  ?after_connect_script:string_ ->
  ?clean_source_metadata_on_mismatch:boolean_optional ->
  ?database_name:string_ ->
  ?events_poll_interval:integer_optional ->
  ?target_db_type:target_db_type ->
  ?max_file_size:integer_optional ->
  ?parallel_load_threads:integer_optional ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?server_timezone:string_ ->
  ?username:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?execute_timeout:integer_optional ->
  ?service_access_role_arn:string_ ->
  ?authentication_method:my_sql_authentication_method ->
  unit ->
  my_sql_settings

val make_postgre_sql_settings :
  ?after_connect_script:string_ ->
  ?capture_ddls:boolean_optional ->
  ?max_file_size:integer_optional ->
  ?database_name:string_ ->
  ?ddl_artifacts_schema:string_ ->
  ?execute_timeout:integer_optional ->
  ?fail_tasks_on_lob_truncation:boolean_optional ->
  ?heartbeat_enable:boolean_optional ->
  ?heartbeat_schema:string_ ->
  ?heartbeat_frequency:integer_optional ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?username:string_ ->
  ?slot_name:string_ ->
  ?plugin_name:plugin_name_value ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?trim_space_in_char:boolean_optional ->
  ?map_boolean_as_boolean:boolean_optional ->
  ?map_jsonb_as_clob:boolean_optional ->
  ?map_long_varchar_as:long_varchar_mapping_type ->
  ?database_mode:database_mode ->
  ?babelfish_database_name:string_ ->
  ?disable_unicode_source_filter:boolean_optional ->
  ?service_access_role_arn:string_ ->
  ?authentication_method:postgre_sql_authentication_method ->
  unit ->
  postgre_sql_settings

val make_redshift_settings :
  ?accept_any_date:boolean_optional ->
  ?after_connect_script:string_ ->
  ?bucket_folder:string_ ->
  ?bucket_name:string_ ->
  ?case_sensitive_names:boolean_optional ->
  ?comp_update:boolean_optional ->
  ?connection_timeout:integer_optional ->
  ?database_name:string_ ->
  ?date_format:string_ ->
  ?empty_as_null:boolean_optional ->
  ?encryption_mode:encryption_mode_value ->
  ?explicit_ids:boolean_optional ->
  ?file_transfer_upload_streams:integer_optional ->
  ?load_timeout:integer_optional ->
  ?max_file_size:integer_optional ->
  ?password:secret_string ->
  ?port:integer_optional ->
  ?remove_quotes:boolean_optional ->
  ?replace_invalid_chars:string_ ->
  ?replace_chars:string_ ->
  ?server_name:string_ ->
  ?service_access_role_arn:string_ ->
  ?server_side_encryption_kms_key_id:string_ ->
  ?time_format:string_ ->
  ?trim_blanks:boolean_optional ->
  ?truncate_columns:boolean_optional ->
  ?username:string_ ->
  ?write_buffer_size:integer_optional ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?map_boolean_as_boolean:boolean_optional ->
  unit ->
  redshift_settings

val make_neptune_settings :
  ?service_access_role_arn:string_ ->
  ?error_retry_duration:integer_optional ->
  ?max_file_size:integer_optional ->
  ?max_retry_count:integer_optional ->
  ?iam_auth_enabled:boolean_optional ->
  s3_bucket_name:string_ ->
  s3_bucket_folder:string_ ->
  unit ->
  neptune_settings

val make_elasticsearch_settings :
  ?full_load_error_percentage:integer_optional ->
  ?error_retry_duration:integer_optional ->
  ?use_new_mapping_type:boolean_optional ->
  service_access_role_arn:string_ ->
  endpoint_uri:string_ ->
  unit ->
  elasticsearch_settings

val make_kafka_settings :
  ?broker:string_ ->
  ?topic:string_ ->
  ?message_format:message_format_value ->
  ?include_transaction_details:boolean_optional ->
  ?include_partition_value:boolean_optional ->
  ?partition_include_schema_table:boolean_optional ->
  ?include_table_alter_operations:boolean_optional ->
  ?include_control_details:boolean_optional ->
  ?message_max_bytes:integer_optional ->
  ?include_null_and_empty:boolean_optional ->
  ?security_protocol:kafka_security_protocol ->
  ?ssl_client_certificate_arn:string_ ->
  ?ssl_client_key_arn:string_ ->
  ?ssl_client_key_password:secret_string ->
  ?ssl_ca_certificate_arn:string_ ->
  ?sasl_username:string_ ->
  ?sasl_password:secret_string ->
  ?no_hex_prefix:boolean_optional ->
  ?sasl_mechanism:kafka_sasl_mechanism ->
  ?ssl_endpoint_identification_algorithm:kafka_ssl_endpoint_identification_algorithm ->
  ?use_large_integer_value:boolean_optional ->
  unit ->
  kafka_settings

val make_kinesis_settings :
  ?stream_arn:string_ ->
  ?message_format:message_format_value ->
  ?service_access_role_arn:string_ ->
  ?include_transaction_details:boolean_optional ->
  ?include_partition_value:boolean_optional ->
  ?partition_include_schema_table:boolean_optional ->
  ?include_table_alter_operations:boolean_optional ->
  ?include_control_details:boolean_optional ->
  ?include_null_and_empty:boolean_optional ->
  ?no_hex_prefix:boolean_optional ->
  ?use_large_integer_value:boolean_optional ->
  unit ->
  kinesis_settings

val make_mongo_db_settings :
  ?username:string_ ->
  ?password:secret_string ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?auth_type:auth_type_value ->
  ?auth_mechanism:auth_mechanism_value ->
  ?nesting_level:nesting_level_value ->
  ?extract_doc_id:string_ ->
  ?docs_to_investigate:string_ ->
  ?auth_source:string_ ->
  ?kms_key_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?use_update_look_up:boolean_optional ->
  ?replicate_shard_collections:boolean_optional ->
  unit ->
  mongo_db_settings

val make_dms_transfer_settings :
  ?service_access_role_arn:string_ -> ?bucket_name:string_ -> unit -> dms_transfer_settings

val make_s3_settings :
  ?service_access_role_arn:string_ ->
  ?external_table_definition:string_ ->
  ?csv_row_delimiter:string_ ->
  ?csv_delimiter:string_ ->
  ?bucket_folder:string_ ->
  ?bucket_name:string_ ->
  ?compression_type:compression_type_value ->
  ?encryption_mode:encryption_mode_value ->
  ?server_side_encryption_kms_key_id:string_ ->
  ?data_format:data_format_value ->
  ?encoding_type:encoding_type_value ->
  ?dict_page_size_limit:integer_optional ->
  ?row_group_length:integer_optional ->
  ?data_page_size:integer_optional ->
  ?parquet_version:parquet_version_value ->
  ?enable_statistics:boolean_optional ->
  ?include_op_for_full_load:boolean_optional ->
  ?cdc_inserts_only:boolean_optional ->
  ?timestamp_column_name:string_ ->
  ?parquet_timestamp_in_millisecond:boolean_optional ->
  ?cdc_inserts_and_updates:boolean_optional ->
  ?date_partition_enabled:boolean_optional ->
  ?date_partition_sequence:date_partition_sequence_value ->
  ?date_partition_delimiter:date_partition_delimiter_value ->
  ?use_csv_no_sup_value:boolean_optional ->
  ?csv_no_sup_value:string_ ->
  ?preserve_transactions:boolean_optional ->
  ?cdc_path:string_ ->
  ?use_task_start_time_for_full_load_timestamp:boolean_optional ->
  ?canned_acl_for_objects:canned_acl_for_objects_value ->
  ?add_column_name:boolean_optional ->
  ?cdc_max_batch_interval:integer_optional ->
  ?cdc_min_file_size:integer_optional ->
  ?csv_null_value:string_ ->
  ?ignore_header_rows:integer_optional ->
  ?max_file_size:integer_optional ->
  ?rfc4180:boolean_optional ->
  ?date_partition_timezone:string_ ->
  ?add_trailing_padding_character:boolean_optional ->
  ?expected_bucket_owner:string_ ->
  ?glue_catalog_generation:boolean_optional ->
  unit ->
  s3_settings

val make_dynamo_db_settings : service_access_role_arn:string_ -> unit -> dynamo_db_settings

val make_endpoint :
  ?endpoint_identifier:string_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?engine_name:string_ ->
  ?engine_display_name:string_ ->
  ?username:string_ ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?extra_connection_attributes:string_ ->
  ?status:string_ ->
  ?kms_key_id:string_ ->
  ?endpoint_arn:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?service_access_role_arn:string_ ->
  ?external_table_definition:string_ ->
  ?external_id:string_ ->
  ?is_read_only:boolean_optional ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?s3_settings:s3_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?kafka_settings:kafka_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?neptune_settings:neptune_settings ->
  ?redshift_settings:redshift_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?oracle_settings:oracle_settings ->
  ?sybase_settings:sybase_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?doc_db_settings:doc_db_settings ->
  ?redis_settings:redis_settings ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?timestream_settings:timestream_settings ->
  ?lakehouse_settings:lakehouse_settings ->
  unit ->
  endpoint

val make_modify_endpoint_response : ?endpoint:endpoint -> unit -> modify_endpoint_response

val make_modify_endpoint_message :
  ?endpoint_identifier:string_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?engine_name:string_ ->
  ?username:string_ ->
  ?password:secret_string ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?extra_connection_attributes:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?service_access_role_arn:string_ ->
  ?external_table_definition:string_ ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?s3_settings:s3_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?kafka_settings:kafka_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?neptune_settings:neptune_settings ->
  ?redshift_settings:redshift_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?oracle_settings:oracle_settings ->
  ?sybase_settings:sybase_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?doc_db_settings:doc_db_settings ->
  ?redis_settings:redis_settings ->
  ?exact_settings:boolean_optional ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?timestream_settings:timestream_settings ->
  endpoint_arn:string_ ->
  unit ->
  modify_endpoint_message

val make_mongo_db_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?auth_type:auth_type_value ->
  ?auth_source:string_ ->
  ?auth_mechanism:auth_mechanism_value ->
  unit ->
  mongo_db_data_provider_settings

val make_ibm_db2z_os_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  ibm_db2z_os_data_provider_settings

val make_ibm_db2_luw_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?encryption_algorithm:integer_optional ->
  ?security_mechanism:integer_optional ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  ibm_db2_luw_data_provider_settings

val make_maria_db_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  maria_db_data_provider_settings

val make_doc_db_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  unit ->
  doc_db_data_provider_settings

val make_microsoft_sql_server_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  microsoft_sql_server_data_provider_settings

val make_sybase_ase_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?encrypt_password:boolean_optional ->
  ?certificate_arn:string_ ->
  unit ->
  sybase_ase_data_provider_settings

val make_oracle_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?asm_server:string_ ->
  ?secrets_manager_oracle_asm_secret_id:string_ ->
  ?secrets_manager_oracle_asm_access_role_arn:string_ ->
  ?secrets_manager_security_db_encryption_secret_id:string_ ->
  ?secrets_manager_security_db_encryption_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  oracle_data_provider_settings

val make_my_sql_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  my_sql_data_provider_settings

val make_postgre_sql_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  postgre_sql_data_provider_settings

val make_redshift_data_provider_settings :
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?s3_path:string_ ->
  ?s3_access_role_arn:string_ ->
  unit ->
  redshift_data_provider_settings

val make_data_provider :
  ?data_provider_name:string_ ->
  ?data_provider_arn:string_ ->
  ?data_provider_creation_time:iso8601_date_time ->
  ?description:string_ ->
  ?engine:string_ ->
  ?\#virtual:boolean_optional ->
  ?settings:data_provider_settings ->
  unit ->
  data_provider

val make_modify_data_provider_response :
  ?data_provider:data_provider -> unit -> modify_data_provider_response

val make_modify_data_provider_message :
  ?data_provider_name:string_ ->
  ?description:string_ ->
  ?engine:string_ ->
  ?\#virtual:boolean_optional ->
  ?exact_settings:boolean_optional ->
  ?settings:data_provider_settings ->
  data_provider_identifier:string_ ->
  unit ->
  modify_data_provider_message

val make_modify_data_migration_response :
  ?data_migration:data_migration -> unit -> modify_data_migration_response

val make_modify_data_migration_message :
  ?data_migration_name:string_ ->
  ?enable_cloudwatch_logs:boolean_optional ->
  ?service_access_role_arn:string_ ->
  ?data_migration_type:migration_type_value ->
  ?source_data_settings:source_data_settings ->
  ?target_data_settings:target_data_settings ->
  ?number_of_jobs:integer_optional ->
  ?selection_rules:secret_string ->
  data_migration_identifier:string_ ->
  unit ->
  modify_data_migration_message

val make_modify_conversion_configuration_response :
  ?migration_project_identifier:string_ -> unit -> modify_conversion_configuration_response

val make_modify_conversion_configuration_message :
  migration_project_identifier:migration_project_identifier ->
  conversion_configuration:string_ ->
  unit ->
  modify_conversion_configuration_message

val make_list_tags_for_resource_response :
  ?tag_list:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_message :
  ?resource_arn:string_ -> ?resource_arn_list:arn_list -> unit -> list_tags_for_resource_message

val make_certificate :
  ?certificate_identifier:string_ ->
  ?certificate_creation_date:t_stamp ->
  ?certificate_pem:string_ ->
  ?certificate_wallet:certificate_wallet ->
  ?certificate_arn:string_ ->
  ?certificate_owner:string_ ->
  ?valid_from_date:t_stamp ->
  ?valid_to_date:t_stamp ->
  ?signing_algorithm:string_ ->
  ?key_length:integer_optional ->
  ?kms_key_id:string_ ->
  unit ->
  certificate

val make_import_certificate_response :
  ?certificate:certificate -> unit -> import_certificate_response

val make_import_certificate_message :
  ?certificate_pem:secret_string ->
  ?certificate_wallet:certificate_wallet ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  certificate_identifier:string_ ->
  unit ->
  import_certificate_message

val make_get_target_selection_rules_response :
  ?target_selection_rules:string_ -> unit -> get_target_selection_rules_response

val make_get_target_selection_rules_message :
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  get_target_selection_rules_message

val make_export_metadata_model_assessment_result_entry :
  ?s3_object_key:string_ ->
  ?object_ur_l:string_ ->
  unit ->
  export_metadata_model_assessment_result_entry

val make_export_metadata_model_assessment_response :
  ?pdf_report:export_metadata_model_assessment_result_entry ->
  ?csv_report:export_metadata_model_assessment_result_entry ->
  unit ->
  export_metadata_model_assessment_response

val make_export_metadata_model_assessment_message :
  ?file_name:string_ ->
  ?assessment_report_types:assessment_report_types_list ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  export_metadata_model_assessment_message

val make_table_statistics :
  ?schema_name:string_ ->
  ?table_name:string_ ->
  ?inserts:long ->
  ?deletes:long ->
  ?updates:long ->
  ?ddls:long ->
  ?applied_inserts:long_optional ->
  ?applied_deletes:long_optional ->
  ?applied_updates:long_optional ->
  ?applied_ddls:long_optional ->
  ?full_load_rows:long ->
  ?full_load_condtnl_chk_failed_rows:long ->
  ?full_load_error_rows:long ->
  ?full_load_start_time:t_stamp ->
  ?full_load_end_time:t_stamp ->
  ?full_load_reloaded:boolean_optional ->
  ?last_update_time:t_stamp ->
  ?table_state:string_ ->
  ?validation_pending_records:long ->
  ?validation_failed_records:long ->
  ?validation_suspended_records:long ->
  ?validation_state:string_ ->
  ?validation_state_details:string_ ->
  ?resync_state:string_ ->
  ?resync_rows_attempted:long_optional ->
  ?resync_rows_succeeded:long_optional ->
  ?resync_rows_failed:long_optional ->
  ?resync_progress:double_optional ->
  unit ->
  table_statistics

val make_describe_table_statistics_response :
  ?replication_task_arn:string_ ->
  ?table_statistics:table_statistics_list ->
  ?marker:string_ ->
  unit ->
  describe_table_statistics_response

val make_filter : name:string_ -> values:filter_value_list -> unit -> filter

val make_describe_table_statistics_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  replication_task_arn:string_ ->
  unit ->
  describe_table_statistics_message

val make_describe_schemas_response :
  ?marker:string_ -> ?schemas:schema_list -> unit -> describe_schemas_response

val make_describe_schemas_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  endpoint_arn:string_ ->
  unit ->
  describe_schemas_message

val make_describe_replication_tasks_response :
  ?marker:string_ ->
  ?replication_tasks:replication_task_list ->
  unit ->
  describe_replication_tasks_response

val make_describe_replication_tasks_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?without_settings:boolean_optional ->
  unit ->
  describe_replication_tasks_message

val make_replication_task_individual_assessment :
  ?replication_task_individual_assessment_arn:string_ ->
  ?replication_task_assessment_run_arn:string_ ->
  ?individual_assessment_name:string_ ->
  ?status:string_ ->
  ?replication_task_individual_assessment_start_date:t_stamp ->
  unit ->
  replication_task_individual_assessment

val make_describe_replication_task_individual_assessments_response :
  ?marker:string_ ->
  ?replication_task_individual_assessments:replication_task_individual_assessment_list ->
  unit ->
  describe_replication_task_individual_assessments_response

val make_describe_replication_task_individual_assessments_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_individual_assessments_message

val make_describe_replication_task_assessment_runs_response :
  ?marker:string_ ->
  ?replication_task_assessment_runs:replication_task_assessment_run_list ->
  unit ->
  describe_replication_task_assessment_runs_response

val make_describe_replication_task_assessment_runs_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_assessment_runs_message

val make_describe_replication_task_assessment_results_response :
  ?marker:string_ ->
  ?bucket_name:string_ ->
  ?replication_task_assessment_results:replication_task_assessment_result_list ->
  unit ->
  describe_replication_task_assessment_results_response

val make_describe_replication_task_assessment_results_message :
  ?replication_task_arn:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_assessment_results_message

val make_describe_replication_table_statistics_response :
  ?replication_config_arn:string_ ->
  ?marker:string_ ->
  ?replication_table_statistics:replication_table_statistics_list ->
  unit ->
  describe_replication_table_statistics_response

val make_describe_replication_table_statistics_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  replication_config_arn:string_ ->
  unit ->
  describe_replication_table_statistics_message

val make_describe_replication_subnet_groups_response :
  ?marker:string_ ->
  ?replication_subnet_groups:replication_subnet_groups ->
  unit ->
  describe_replication_subnet_groups_response

val make_describe_replication_subnet_groups_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_subnet_groups_message

val make_describe_replications_response :
  ?marker:string_ -> ?replications:replication_list -> unit -> describe_replications_response

val make_describe_replications_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replications_message

val make_replication_instance_task_log :
  ?replication_task_name:string_ ->
  ?replication_task_arn:string_ ->
  ?replication_instance_task_log_size:long ->
  unit ->
  replication_instance_task_log

val make_describe_replication_instance_task_logs_response :
  ?replication_instance_arn:string_ ->
  ?replication_instance_task_logs:replication_instance_task_logs_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_instance_task_logs_response

val make_describe_replication_instance_task_logs_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  replication_instance_arn:string_ ->
  unit ->
  describe_replication_instance_task_logs_message

val make_describe_replication_instances_response :
  ?marker:string_ ->
  ?replication_instances:replication_instance_list ->
  unit ->
  describe_replication_instances_response

val make_describe_replication_instances_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_instances_message

val make_describe_replication_configs_response :
  ?marker:string_ ->
  ?replication_configs:replication_config_list ->
  unit ->
  describe_replication_configs_response

val make_describe_replication_configs_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_replication_configs_message

val make_describe_refresh_schemas_status_response :
  ?refresh_schemas_status:refresh_schemas_status -> unit -> describe_refresh_schemas_status_response

val make_describe_refresh_schemas_status_message :
  endpoint_arn:string_ -> unit -> describe_refresh_schemas_status_message

val make_rds_configuration :
  ?engine_edition:string_ ->
  ?instance_type:string_ ->
  ?instance_vcpu:double_optional ->
  ?instance_memory:double_optional ->
  ?storage_type:string_ ->
  ?storage_size:integer_optional ->
  ?storage_iops:integer_optional ->
  ?deployment_option:string_ ->
  ?engine_version:string_ ->
  unit ->
  rds_configuration

val make_rds_requirements :
  ?engine_edition:string_ ->
  ?instance_vcpu:double_optional ->
  ?instance_memory:double_optional ->
  ?storage_size:integer_optional ->
  ?storage_iops:integer_optional ->
  ?deployment_option:string_ ->
  ?engine_version:string_ ->
  unit ->
  rds_requirements

val make_rds_recommendation :
  ?requirements_to_target:rds_requirements ->
  ?target_configuration:rds_configuration ->
  unit ->
  rds_recommendation

val make_recommendation_data : ?rds_engine:rds_recommendation -> unit -> recommendation_data

val make_recommendation :
  ?database_id:string_ ->
  ?engine_name:string_ ->
  ?created_date:string_ ->
  ?status:string_ ->
  ?preferred:boolean_optional ->
  ?settings:recommendation_settings ->
  ?data:recommendation_data ->
  unit ->
  recommendation

val make_describe_recommendations_response :
  ?next_token:string_ ->
  ?recommendations:recommendation_list ->
  unit ->
  describe_recommendations_response

val make_describe_recommendations_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_recommendations_request

val make_limitation :
  ?database_id:string_ ->
  ?engine_name:string_ ->
  ?name:string_ ->
  ?description:string_ ->
  ?impact:string_ ->
  ?type_:string_ ->
  unit ->
  limitation

val make_describe_recommendation_limitations_response :
  ?next_token:string_ ->
  ?limitations:limitation_list ->
  unit ->
  describe_recommendation_limitations_response

val make_describe_recommendation_limitations_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_recommendation_limitations_request

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

val make_describe_pending_maintenance_actions_response :
  ?pending_maintenance_actions:pending_maintenance_actions ->
  ?marker:string_ ->
  unit ->
  describe_pending_maintenance_actions_response

val make_describe_pending_maintenance_actions_message :
  ?replication_instance_arn:string_ ->
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_pending_maintenance_actions_message

val make_orderable_replication_instance :
  ?engine_version:string_ ->
  ?replication_instance_class:replication_instance_class ->
  ?storage_type:string_ ->
  ?min_allocated_storage:integer ->
  ?max_allocated_storage:integer ->
  ?default_allocated_storage:integer ->
  ?included_allocated_storage:integer ->
  ?availability_zones:availability_zones_list ->
  ?release_status:release_status_values ->
  unit ->
  orderable_replication_instance

val make_describe_orderable_replication_instances_response :
  ?orderable_replication_instances:orderable_replication_instance_list ->
  ?marker:string_ ->
  unit ->
  describe_orderable_replication_instances_response

val make_describe_orderable_replication_instances_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_orderable_replication_instances_message

val make_describe_migration_projects_response :
  ?marker:string_ ->
  ?migration_projects:migration_project_list ->
  unit ->
  describe_migration_projects_response

val make_describe_migration_projects_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_migration_projects_message

val make_processed_object :
  ?name:string_ -> ?type_:string_ -> ?endpoint_type:string_ -> unit -> processed_object

val make_progress :
  ?progress_percent:double_optional ->
  ?total_objects:long ->
  ?progress_step:string_ ->
  ?processed_object:processed_object ->
  unit ->
  progress

val make_export_sql_details :
  ?s3_object_key:string_ -> ?object_ur_l:string_ -> unit -> export_sql_details

val make_default_error_details : ?message:string_ -> unit -> default_error_details

val make_schema_conversion_request :
  ?status:string_ ->
  ?request_identifier:string_ ->
  ?migration_project_arn:string_ ->
  ?error:error_details ->
  ?export_sql_details:export_sql_details ->
  ?progress:progress ->
  unit ->
  schema_conversion_request

val make_describe_metadata_model_imports_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_imports_response

val make_describe_metadata_model_imports_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_imports_message

val make_describe_metadata_model_exports_to_target_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_exports_to_target_response

val make_describe_metadata_model_exports_to_target_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_exports_to_target_message

val make_describe_metadata_model_exports_as_script_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_exports_as_script_response

val make_describe_metadata_model_exports_as_script_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_exports_as_script_message

val make_describe_metadata_model_creations_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_creations_response

val make_describe_metadata_model_creations_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_creations_message

val make_describe_metadata_model_conversions_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_conversions_response

val make_describe_metadata_model_conversions_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_conversions_message

val make_metadata_model_reference :
  ?metadata_model_name:string_ -> ?selection_rules:string_ -> unit -> metadata_model_reference

val make_describe_metadata_model_children_response :
  ?marker:string_ ->
  ?metadata_model_children:metadata_model_reference_list ->
  unit ->
  describe_metadata_model_children_response

val make_describe_metadata_model_children_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  origin:origin_type_value ->
  unit ->
  describe_metadata_model_children_message

val make_describe_metadata_model_assessments_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_metadata_model_assessments_response

val make_describe_metadata_model_assessments_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_assessments_message

val make_describe_metadata_model_response :
  ?metadata_model_name:string_ ->
  ?metadata_model_type:string_ ->
  ?target_metadata_models:metadata_model_reference_list ->
  ?definition:string_ ->
  unit ->
  describe_metadata_model_response

val make_describe_metadata_model_message :
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  origin:origin_type_value ->
  unit ->
  describe_metadata_model_message

val make_describe_instance_profiles_response :
  ?marker:string_ ->
  ?instance_profiles:instance_profile_list ->
  unit ->
  describe_instance_profiles_response

val make_describe_instance_profiles_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_instance_profiles_message

val make_schema_short_info_response :
  ?schema_id:string_ ->
  ?schema_name:string_ ->
  ?database_id:string_ ->
  ?database_name:string_ ->
  ?database_ip_address:string_ ->
  unit ->
  schema_short_info_response

val make_database_short_info_response :
  ?database_id:string_ ->
  ?database_name:string_ ->
  ?database_ip_address:string_ ->
  ?database_engine:string_ ->
  unit ->
  database_short_info_response

val make_server_short_info_response :
  ?server_id:string_ ->
  ?ip_address:string_ ->
  ?server_name:string_ ->
  unit ->
  server_short_info_response

val make_schema_response :
  ?code_line_count:long_optional ->
  ?code_size:long_optional ->
  ?complexity:string_ ->
  ?server:server_short_info_response ->
  ?database_instance:database_short_info_response ->
  ?schema_id:string_ ->
  ?schema_name:string_ ->
  ?original_schema:schema_short_info_response ->
  ?similarity:double_optional ->
  unit ->
  schema_response

val make_describe_fleet_advisor_schemas_response :
  ?fleet_advisor_schemas:fleet_advisor_schema_list ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_schemas_response

val make_describe_fleet_advisor_schemas_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_schemas_request

val make_fleet_advisor_schema_object_response :
  ?schema_id:string_ ->
  ?object_type:string_ ->
  ?number_of_objects:long_optional ->
  ?code_line_count:long_optional ->
  ?code_size:long_optional ->
  unit ->
  fleet_advisor_schema_object_response

val make_describe_fleet_advisor_schema_object_summary_response :
  ?fleet_advisor_schema_objects:fleet_advisor_schema_object_list ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_schema_object_summary_response

val make_describe_fleet_advisor_schema_object_summary_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_schema_object_summary_request

val make_fleet_advisor_lsa_analysis_response :
  ?lsa_analysis_id:string_ -> ?status:string_ -> unit -> fleet_advisor_lsa_analysis_response

val make_describe_fleet_advisor_lsa_analysis_response :
  ?analysis:fleet_advisor_lsa_analysis_response_list ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_lsa_analysis_response

val make_describe_fleet_advisor_lsa_analysis_request :
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_lsa_analysis_request

val make_collector_short_info_response :
  ?collector_referenced_id:string_ ->
  ?collector_name:string_ ->
  unit ->
  collector_short_info_response

val make_database_instance_software_details_response :
  ?engine:string_ ->
  ?engine_version:string_ ->
  ?engine_edition:string_ ->
  ?service_pack:string_ ->
  ?support_level:string_ ->
  ?os_architecture:integer_optional ->
  ?tooltip:string_ ->
  unit ->
  database_instance_software_details_response

val make_database_response :
  ?database_id:string_ ->
  ?database_name:string_ ->
  ?ip_address:string_ ->
  ?number_of_schemas:long_optional ->
  ?server:server_short_info_response ->
  ?software_details:database_instance_software_details_response ->
  ?collectors:collectors_list ->
  unit ->
  database_response

val make_describe_fleet_advisor_databases_response :
  ?databases:database_list ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_databases_response

val make_describe_fleet_advisor_databases_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_databases_request

val make_inventory_data :
  ?number_of_databases:integer_optional ->
  ?number_of_schemas:integer_optional ->
  unit ->
  inventory_data

val make_collector_health_check :
  ?collector_status:collector_status ->
  ?local_collector_s3_access:boolean_optional ->
  ?web_collector_s3_access:boolean_optional ->
  ?web_collector_granted_role_based_access:boolean_optional ->
  unit ->
  collector_health_check

val make_collector_response :
  ?collector_referenced_id:string_ ->
  ?collector_name:string_ ->
  ?collector_version:string_ ->
  ?version_status:version_status ->
  ?description:string_ ->
  ?s3_bucket_name:string_ ->
  ?service_access_role_arn:string_ ->
  ?collector_health_check:collector_health_check ->
  ?last_data_received:string_ ->
  ?registered_date:string_ ->
  ?created_date:string_ ->
  ?modified_date:string_ ->
  ?inventory_data:inventory_data ->
  unit ->
  collector_response

val make_describe_fleet_advisor_collectors_response :
  ?collectors:collector_responses ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_collectors_response

val make_describe_fleet_advisor_collectors_request :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_fleet_advisor_collectors_request

val make_describe_extension_pack_associations_response :
  ?marker:string_ ->
  ?requests:schema_conversion_request_list ->
  unit ->
  describe_extension_pack_associations_response

val make_describe_extension_pack_associations_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_extension_pack_associations_message

val make_describe_event_subscriptions_response :
  ?marker:string_ ->
  ?event_subscriptions_list:event_subscriptions_list ->
  unit ->
  describe_event_subscriptions_response

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
  unit ->
  event

val make_describe_events_response :
  ?marker:string_ -> ?events:event_list -> unit -> describe_events_response

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

val make_event_category_group :
  ?source_type:string_ -> ?event_categories:event_categories_list -> unit -> event_category_group

val make_describe_event_categories_response :
  ?event_category_group_list:event_category_group_list -> unit -> describe_event_categories_response

val make_describe_event_categories_message :
  ?source_type:string_ -> ?filters:filter_list -> unit -> describe_event_categories_message

val make_engine_version :
  ?version:string_ ->
  ?lifecycle:string_ ->
  ?release_status:release_status_values ->
  ?launch_date:t_stamp ->
  ?auto_upgrade_date:t_stamp ->
  ?deprecation_date:t_stamp ->
  ?force_upgrade_date:t_stamp ->
  ?available_upgrades:available_upgrades_list ->
  unit ->
  engine_version

val make_describe_engine_versions_response :
  ?engine_versions:engine_version_list ->
  ?marker:string_ ->
  unit ->
  describe_engine_versions_response

val make_describe_engine_versions_message :
  ?max_records:integer_optional -> ?marker:string_ -> unit -> describe_engine_versions_message

val make_supported_endpoint_type :
  ?engine_name:string_ ->
  ?supports_cd_c:boolean_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?replication_instance_engine_minimum_version:string_ ->
  ?engine_display_name:string_ ->
  unit ->
  supported_endpoint_type

val make_describe_endpoint_types_response :
  ?marker:string_ ->
  ?supported_endpoint_types:supported_endpoint_type_list ->
  unit ->
  describe_endpoint_types_response

val make_describe_endpoint_types_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_endpoint_types_message

val make_endpoint_setting :
  ?name:string_ ->
  ?type_:endpoint_setting_type_value ->
  ?enum_values:endpoint_setting_enum_values ->
  ?sensitive:boolean_optional ->
  ?units:string_ ->
  ?applicability:string_ ->
  ?int_value_min:integer_optional ->
  ?int_value_max:integer_optional ->
  ?default_value:string_ ->
  unit ->
  endpoint_setting

val make_describe_endpoint_settings_response :
  ?marker:string_ ->
  ?endpoint_settings:endpoint_settings_list ->
  unit ->
  describe_endpoint_settings_response

val make_describe_endpoint_settings_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  engine_name:string_ ->
  unit ->
  describe_endpoint_settings_message

val make_describe_endpoints_response :
  ?marker:string_ -> ?endpoints:endpoint_list -> unit -> describe_endpoints_response

val make_describe_endpoints_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_endpoints_message

val make_describe_data_providers_response :
  ?marker:string_ -> ?data_providers:data_provider_list -> unit -> describe_data_providers_response

val make_describe_data_providers_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_data_providers_message

val make_describe_data_migrations_response :
  ?data_migrations:data_migrations -> ?marker:marker -> unit -> describe_data_migrations_response

val make_describe_data_migrations_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:marker ->
  ?without_settings:boolean_optional ->
  ?without_statistics:boolean_optional ->
  unit ->
  describe_data_migrations_message

val make_describe_conversion_configuration_response :
  ?migration_project_identifier:string_ ->
  ?conversion_configuration:string_ ->
  unit ->
  describe_conversion_configuration_response

val make_describe_conversion_configuration_message :
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_conversion_configuration_message

val make_describe_connections_response :
  ?marker:string_ -> ?connections:connection_list -> unit -> describe_connections_response

val make_describe_connections_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_connections_message

val make_describe_certificates_response :
  ?marker:string_ -> ?certificates:certificate_list -> unit -> describe_certificates_response

val make_describe_certificates_message :
  ?filters:filter_list ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_certificates_message

val make_describe_applicable_individual_assessments_response :
  ?individual_assessment_names:individual_assessment_name_list ->
  ?marker:string_ ->
  unit ->
  describe_applicable_individual_assessments_response

val make_describe_applicable_individual_assessments_message :
  ?replication_task_arn:string_ ->
  ?replication_instance_arn:string_ ->
  ?replication_config_arn:string_ ->
  ?source_engine_name:string_ ->
  ?target_engine_name:string_ ->
  ?migration_type:migration_type_value ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_applicable_individual_assessments_message

val make_describe_account_attributes_response :
  ?account_quotas:account_quota_list ->
  ?unique_account_identifier:string_ ->
  unit ->
  describe_account_attributes_response

val make_describe_account_attributes_message : unit -> unit

val make_delete_replication_task_assessment_run_response :
  ?replication_task_assessment_run:replication_task_assessment_run ->
  unit ->
  delete_replication_task_assessment_run_response

val make_delete_replication_task_assessment_run_message :
  replication_task_assessment_run_arn:string_ ->
  unit ->
  delete_replication_task_assessment_run_message

val make_delete_replication_task_response :
  ?replication_task:replication_task -> unit -> delete_replication_task_response

val make_delete_replication_task_message :
  replication_task_arn:string_ -> unit -> delete_replication_task_message

val make_delete_replication_subnet_group_response : unit -> unit

val make_delete_replication_subnet_group_message :
  replication_subnet_group_identifier:string_ -> unit -> delete_replication_subnet_group_message

val make_delete_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> delete_replication_instance_response

val make_delete_replication_instance_message :
  replication_instance_arn:string_ -> unit -> delete_replication_instance_message

val make_delete_replication_config_response :
  ?replication_config:replication_config -> unit -> delete_replication_config_response

val make_delete_replication_config_message :
  replication_config_arn:string_ -> unit -> delete_replication_config_message

val make_delete_migration_project_response :
  ?migration_project:migration_project -> unit -> delete_migration_project_response

val make_delete_migration_project_message :
  migration_project_identifier:string_ -> unit -> delete_migration_project_message

val make_delete_instance_profile_response :
  ?instance_profile:instance_profile -> unit -> delete_instance_profile_response

val make_delete_instance_profile_message :
  instance_profile_identifier:string_ -> unit -> delete_instance_profile_message

val make_delete_fleet_advisor_databases_response :
  ?database_ids:string_list -> unit -> delete_fleet_advisor_databases_response

val make_delete_fleet_advisor_databases_request :
  database_ids:string_list -> unit -> delete_fleet_advisor_databases_request

val make_delete_collector_request :
  collector_referenced_id:string_ -> unit -> delete_collector_request

val make_delete_event_subscription_response :
  ?event_subscription:event_subscription -> unit -> delete_event_subscription_response

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_endpoint_response : ?endpoint:endpoint -> unit -> delete_endpoint_response
val make_delete_endpoint_message : endpoint_arn:string_ -> unit -> delete_endpoint_message

val make_delete_data_provider_response :
  ?data_provider:data_provider -> unit -> delete_data_provider_response

val make_delete_data_provider_message :
  data_provider_identifier:string_ -> unit -> delete_data_provider_message

val make_delete_data_migration_response :
  ?data_migration:data_migration -> unit -> delete_data_migration_response

val make_delete_data_migration_message :
  data_migration_identifier:string_ -> unit -> delete_data_migration_message

val make_delete_connection_response : ?connection:connection -> unit -> delete_connection_response

val make_delete_connection_message :
  endpoint_arn:string_ -> replication_instance_arn:string_ -> unit -> delete_connection_message

val make_delete_certificate_response :
  ?certificate:certificate -> unit -> delete_certificate_response

val make_delete_certificate_message : certificate_arn:string_ -> unit -> delete_certificate_message

val make_create_replication_task_response :
  ?replication_task:replication_task -> unit -> create_replication_task_response

val make_create_replication_task_message :
  ?replication_task_settings:string_ ->
  ?cdc_start_time:t_stamp ->
  ?cdc_start_position:string_ ->
  ?cdc_stop_position:string_ ->
  ?tags:tag_list ->
  ?task_data:string_ ->
  ?resource_identifier:string_ ->
  replication_task_identifier:string_ ->
  source_endpoint_arn:string_ ->
  target_endpoint_arn:string_ ->
  replication_instance_arn:string_ ->
  migration_type:migration_type_value ->
  table_mappings:string_ ->
  unit ->
  create_replication_task_message

val make_create_replication_subnet_group_response :
  ?replication_subnet_group:replication_subnet_group ->
  unit ->
  create_replication_subnet_group_response

val make_create_replication_subnet_group_message :
  ?tags:tag_list ->
  replication_subnet_group_identifier:string_ ->
  replication_subnet_group_description:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_replication_subnet_group_message

val make_create_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> create_replication_instance_response

val make_create_replication_instance_message :
  ?allocated_storage:integer_optional ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?availability_zone:string_ ->
  ?replication_subnet_group_identifier:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?multi_a_z:boolean_optional ->
  ?engine_version:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?dns_name_servers:string_ ->
  ?resource_identifier:string_ ->
  ?network_type:string_ ->
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  replication_instance_identifier:string_ ->
  replication_instance_class:replication_instance_class ->
  unit ->
  create_replication_instance_message

val make_create_replication_config_response :
  ?replication_config:replication_config -> unit -> create_replication_config_response

val make_create_replication_config_message :
  ?replication_settings:string_ ->
  ?supplemental_settings:string_ ->
  ?resource_identifier:string_ ->
  ?tags:tag_list ->
  replication_config_identifier:string_ ->
  source_endpoint_arn:string_ ->
  target_endpoint_arn:string_ ->
  compute_config:compute_config ->
  replication_type:migration_type_value ->
  table_mappings:string_ ->
  unit ->
  create_replication_config_message

val make_create_migration_project_response :
  ?migration_project:migration_project -> unit -> create_migration_project_response

val make_create_migration_project_message :
  ?migration_project_name:string_ ->
  ?transformation_rules:string_ ->
  ?description:string_ ->
  ?tags:tag_list ->
  ?schema_conversion_application_attributes:sc_application_attributes ->
  source_data_provider_descriptors:data_provider_descriptor_definition_list ->
  target_data_provider_descriptors:data_provider_descriptor_definition_list ->
  instance_profile_identifier:string_ ->
  unit ->
  create_migration_project_message

val make_create_instance_profile_response :
  ?instance_profile:instance_profile -> unit -> create_instance_profile_response

val make_create_instance_profile_message :
  ?availability_zone:string_ ->
  ?kms_key_arn:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?tags:tag_list ->
  ?network_type:string_ ->
  ?instance_profile_name:string_ ->
  ?description:string_ ->
  ?subnet_group_identifier:string_ ->
  ?vpc_security_groups:string_list ->
  unit ->
  create_instance_profile_message

val make_create_fleet_advisor_collector_response :
  ?collector_referenced_id:string_ ->
  ?collector_name:string_ ->
  ?description:string_ ->
  ?service_access_role_arn:string_ ->
  ?s3_bucket_name:string_ ->
  unit ->
  create_fleet_advisor_collector_response

val make_create_fleet_advisor_collector_request :
  ?description:string_ ->
  collector_name:string_ ->
  service_access_role_arn:string_ ->
  s3_bucket_name:string_ ->
  unit ->
  create_fleet_advisor_collector_request

val make_create_event_subscription_response :
  ?event_subscription:event_subscription -> unit -> create_event_subscription_response

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

val make_create_endpoint_response : ?endpoint:endpoint -> unit -> create_endpoint_response

val make_create_endpoint_message :
  ?username:string_ ->
  ?password:secret_string ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?database_name:string_ ->
  ?extra_connection_attributes:string_ ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?service_access_role_arn:string_ ->
  ?external_table_definition:string_ ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?s3_settings:s3_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?kafka_settings:kafka_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?neptune_settings:neptune_settings ->
  ?redshift_settings:redshift_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?oracle_settings:oracle_settings ->
  ?sybase_settings:sybase_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?resource_identifier:string_ ->
  ?doc_db_settings:doc_db_settings ->
  ?redis_settings:redis_settings ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?timestream_settings:timestream_settings ->
  endpoint_identifier:string_ ->
  endpoint_type:replication_endpoint_type_value ->
  engine_name:string_ ->
  unit ->
  create_endpoint_message

val make_create_data_provider_response :
  ?data_provider:data_provider -> unit -> create_data_provider_response

val make_create_data_provider_message :
  ?data_provider_name:string_ ->
  ?description:string_ ->
  ?\#virtual:boolean_optional ->
  ?tags:tag_list ->
  engine:string_ ->
  settings:data_provider_settings ->
  unit ->
  create_data_provider_message

val make_create_data_migration_response :
  ?data_migration:data_migration -> unit -> create_data_migration_response

val make_create_data_migration_message :
  ?data_migration_name:string_ ->
  ?enable_cloudwatch_logs:boolean_optional ->
  ?source_data_settings:source_data_settings ->
  ?target_data_settings:target_data_settings ->
  ?number_of_jobs:integer_optional ->
  ?tags:tag_list ->
  ?selection_rules:secret_string ->
  migration_project_identifier:string_ ->
  data_migration_type:migration_type_value ->
  service_access_role_arn:string_ ->
  unit ->
  create_data_migration_message

val make_cancel_replication_task_assessment_run_response :
  ?replication_task_assessment_run:replication_task_assessment_run ->
  unit ->
  cancel_replication_task_assessment_run_response

val make_cancel_replication_task_assessment_run_message :
  replication_task_assessment_run_arn:string_ ->
  unit ->
  cancel_replication_task_assessment_run_message

val make_cancel_metadata_model_creation_response :
  ?request:schema_conversion_request -> unit -> cancel_metadata_model_creation_response

val make_cancel_metadata_model_creation_message :
  migration_project_identifier:migration_project_identifier ->
  request_identifier:string_ ->
  unit ->
  cancel_metadata_model_creation_message

val make_cancel_metadata_model_conversion_response :
  ?request:schema_conversion_request -> unit -> cancel_metadata_model_conversion_response

val make_cancel_metadata_model_conversion_message :
  migration_project_identifier:migration_project_identifier ->
  request_identifier:string_ ->
  unit ->
  cancel_metadata_model_conversion_message

val make_batch_start_recommendations_error_entry :
  ?database_id:string_ ->
  ?message:string_ ->
  ?code:string_ ->
  unit ->
  batch_start_recommendations_error_entry

val make_batch_start_recommendations_response :
  ?error_entries:batch_start_recommendations_error_entry_list ->
  unit ->
  batch_start_recommendations_response

val make_start_recommendations_request_entry :
  database_id:string_ ->
  settings:recommendation_settings ->
  unit ->
  start_recommendations_request_entry

val make_batch_start_recommendations_request :
  ?data:start_recommendations_request_entry_list -> unit -> batch_start_recommendations_request

val make_apply_pending_maintenance_action_response :
  ?resource_pending_maintenance_actions:resource_pending_maintenance_actions ->
  unit ->
  apply_pending_maintenance_action_response

val make_apply_pending_maintenance_action_message :
  replication_instance_arn:string_ ->
  apply_action:string_ ->
  opt_in_type:string_ ->
  unit ->
  apply_pending_maintenance_action_message
