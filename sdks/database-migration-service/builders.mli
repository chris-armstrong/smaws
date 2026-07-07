open Types

val make_vpc_security_group_membership :
  ?status:string_ -> ?vpc_security_group_id:string_ -> unit -> vpc_security_group_membership

val make_update_subscriptions_to_event_bridge_response :
  ?result_:string_ -> unit -> update_subscriptions_to_event_bridge_response

val make_update_subscriptions_to_event_bridge_message :
  ?force_move:boolean_optional -> unit -> update_subscriptions_to_event_bridge_message

val make_timestream_settings :
  ?enable_magnetic_store_writes:boolean_optional ->
  ?cdc_inserts_and_updates:boolean_optional ->
  magnetic_duration:integer_optional ->
  memory_duration:integer_optional ->
  database_name:string_ ->
  unit ->
  timestream_settings

val make_connection :
  ?replication_instance_identifier:string_ ->
  ?endpoint_identifier:string_ ->
  ?last_failure_message:string_ ->
  ?status:string_ ->
  ?endpoint_arn:string_ ->
  ?replication_instance_arn:string_ ->
  unit ->
  connection

val make_test_connection_response : ?connection:connection -> unit -> test_connection_response

val make_test_connection_message :
  endpoint_arn:string_ -> replication_instance_arn:string_ -> unit -> test_connection_message

val make_target_data_setting :
  ?table_preparation_mode:table_preparation_mode -> unit -> target_data_setting

val make_tag : ?resource_arn:string_ -> ?value:string_ -> ?key:string_ -> unit -> tag
val make_table_to_reload : table_name:string_ -> schema_name:string_ -> unit -> table_to_reload

val make_table_statistics :
  ?resync_progress:double_optional ->
  ?resync_rows_failed:long_optional ->
  ?resync_rows_succeeded:long_optional ->
  ?resync_rows_attempted:long_optional ->
  ?resync_state:string_ ->
  ?validation_state_details:string_ ->
  ?validation_state:string_ ->
  ?validation_suspended_records:long ->
  ?validation_failed_records:long ->
  ?validation_pending_records:long ->
  ?table_state:string_ ->
  ?last_update_time:t_stamp ->
  ?full_load_reloaded:boolean_optional ->
  ?full_load_end_time:t_stamp ->
  ?full_load_start_time:t_stamp ->
  ?full_load_error_rows:long ->
  ?full_load_condtnl_chk_failed_rows:long ->
  ?full_load_rows:long ->
  ?applied_ddls:long_optional ->
  ?applied_updates:long_optional ->
  ?applied_deletes:long_optional ->
  ?applied_inserts:long_optional ->
  ?ddls:long ->
  ?updates:long ->
  ?deletes:long ->
  ?inserts:long ->
  ?table_name:string_ ->
  ?schema_name:string_ ->
  unit ->
  table_statistics

val make_sybase_settings :
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?username:string_ ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?database_name:string_ ->
  unit ->
  sybase_settings

val make_sybase_ase_data_provider_settings :
  ?certificate_arn:string_ ->
  ?encrypt_password:boolean_optional ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  sybase_ase_data_provider_settings

val make_supported_endpoint_type :
  ?engine_display_name:string_ ->
  ?replication_instance_engine_minimum_version:string_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?supports_cd_c:boolean_ ->
  ?engine_name:string_ ->
  unit ->
  supported_endpoint_type

val make_availability_zone : ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_status:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_replication_task_stats :
  ?full_load_finish_date:t_stamp ->
  ?full_load_start_date:t_stamp ->
  ?stop_date:t_stamp ->
  ?start_date:t_stamp ->
  ?fresh_start_date:t_stamp ->
  ?tables_errored:integer ->
  ?tables_queued:integer ->
  ?tables_loading:integer ->
  ?tables_loaded:integer ->
  ?elapsed_time_millis:long ->
  ?full_load_progress_percent:integer ->
  unit ->
  replication_task_stats

val make_replication_task :
  ?target_replication_instance_arn:string_ ->
  ?task_data:string_ ->
  ?replication_task_stats:replication_task_stats ->
  ?replication_task_arn:string_ ->
  ?recovery_checkpoint:string_ ->
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?replication_task_start_date:t_stamp ->
  ?replication_task_creation_date:t_stamp ->
  ?stop_reason:string_ ->
  ?last_failure_message:string_ ->
  ?status:string_ ->
  ?replication_task_settings:string_ ->
  ?table_mappings:string_ ->
  ?migration_type:migration_type_value ->
  ?replication_instance_arn:string_ ->
  ?target_endpoint_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?replication_task_identifier:string_ ->
  unit ->
  replication_task

val make_stop_replication_task_response :
  ?replication_task:replication_task -> unit -> stop_replication_task_response

val make_stop_replication_task_message :
  replication_task_arn:string_ -> unit -> stop_replication_task_message

val make_provision_data :
  ?reason_for_new_provisioning_data:string_ ->
  ?date_new_provisioning_data_available:t_stamp ->
  ?is_new_provisioning_available:boolean_ ->
  ?date_provisioned:t_stamp ->
  ?provisioned_capacity_units:integer ->
  ?provision_state:string_ ->
  unit ->
  provision_data

val make_replication_task_assessment_run_progress :
  ?individual_assessment_completed_count:integer ->
  ?individual_assessment_count:integer ->
  unit ->
  replication_task_assessment_run_progress

val make_replication_task_assessment_run_result_statistic :
  ?skipped:integer ->
  ?cancelled:integer ->
  ?warning:integer ->
  ?error:integer ->
  ?failed:integer ->
  ?passed:integer ->
  unit ->
  replication_task_assessment_run_result_statistic

val make_premigration_assessment_status :
  ?result_statistic:replication_task_assessment_run_result_statistic ->
  ?result_kms_key_arn:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_location_folder:string_ ->
  ?result_location_bucket:string_ ->
  ?last_failure_message:string_ ->
  ?assessment_progress:replication_task_assessment_run_progress ->
  ?premigration_assessment_run_creation_date:t_stamp ->
  ?status:string_ ->
  ?fail_on_assessment_failure:boolean_ ->
  ?premigration_assessment_run_arn:string_ ->
  unit ->
  premigration_assessment_status

val make_replication_stats :
  ?full_load_finish_date:t_stamp ->
  ?full_load_start_date:t_stamp ->
  ?stop_date:t_stamp ->
  ?start_date:t_stamp ->
  ?fresh_start_date:t_stamp ->
  ?tables_errored:integer ->
  ?tables_queued:integer ->
  ?tables_loading:integer ->
  ?tables_loaded:integer ->
  ?elapsed_time_millis:long ->
  ?full_load_progress_percent:integer ->
  unit ->
  replication_stats

val make_replication :
  ?is_read_only:boolean_optional ->
  ?replication_deprovision_time:t_stamp ->
  ?replication_last_stop_time:t_stamp ->
  ?replication_update_time:t_stamp ->
  ?replication_create_time:t_stamp ->
  ?recovery_checkpoint:string_ ->
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?cdc_start_time:t_stamp ->
  ?start_replication_type:string_ ->
  ?replication_stats:replication_stats ->
  ?failure_messages:string_list ->
  ?stop_reason:string_ ->
  ?premigration_assessment_statuses:premigration_assessment_status_list ->
  ?provision_data:provision_data ->
  ?status:string_ ->
  ?replication_type:migration_type_value ->
  ?target_endpoint_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?replication_config_arn:string_ ->
  ?replication_config_identifier:string_ ->
  unit ->
  replication

val make_stop_replication_response : ?replication:replication -> unit -> stop_replication_response

val make_stop_replication_message :
  replication_config_arn:string_ -> unit -> stop_replication_message

val make_data_migration_settings :
  ?selection_rules:secret_string ->
  ?cloudwatch_logs_enabled:boolean_optional ->
  ?number_of_jobs:integer_optional ->
  unit ->
  data_migration_settings

val make_source_data_setting :
  ?slot_name:string_ ->
  ?cdc_stop_time:iso8601_date_time ->
  ?cdc_start_time:iso8601_date_time ->
  ?cdc_start_position:string_ ->
  unit ->
  source_data_setting

val make_data_migration_statistics :
  ?stop_time:iso8601_date_time ->
  ?start_time:iso8601_date_time ->
  ?tables_errored:integer ->
  ?tables_queued:integer ->
  ?cdc_latency:integer ->
  ?full_load_percentage:integer ->
  ?tables_loading:integer ->
  ?elapsed_time_millis:long ->
  ?tables_loaded:integer ->
  unit ->
  data_migration_statistics

val make_data_migration :
  ?stop_reason:string_ ->
  ?last_failure_message:string_ ->
  ?data_migration_cidr_blocks:data_migration_cidr_block ->
  ?public_ip_addresses:public_ip_address_list ->
  ?data_migration_status:string_ ->
  ?data_migration_statistics:data_migration_statistics ->
  ?target_data_settings:target_data_settings ->
  ?source_data_settings:source_data_settings ->
  ?data_migration_settings:data_migration_settings ->
  ?data_migration_type:migration_type_value ->
  ?migration_project_arn:string_ ->
  ?service_access_role_arn:string_ ->
  ?data_migration_end_time:iso8601_date_time ->
  ?data_migration_start_time:iso8601_date_time ->
  ?data_migration_create_time:iso8601_date_time ->
  ?data_migration_arn:string_ ->
  ?data_migration_name:string_ ->
  unit ->
  data_migration

val make_stop_data_migration_response :
  ?data_migration:data_migration -> unit -> stop_data_migration_response

val make_stop_data_migration_message :
  data_migration_identifier:string_ -> unit -> stop_data_migration_message

val make_statement_properties : definition:string_ -> unit -> statement_properties

val make_start_replication_task_response :
  ?replication_task:replication_task -> unit -> start_replication_task_response

val make_start_replication_task_message :
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?cdc_start_time:t_stamp ->
  start_replication_task_type:start_replication_task_type_value ->
  replication_task_arn:string_ ->
  unit ->
  start_replication_task_message

val make_replication_task_assessment_run :
  ?result_statistic:replication_task_assessment_run_result_statistic ->
  ?is_latest_task_assessment_run:boolean_ ->
  ?assessment_run_name:string_ ->
  ?result_kms_key_arn:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_location_folder:string_ ->
  ?result_location_bucket:string_ ->
  ?service_access_role_arn:string_ ->
  ?last_failure_message:string_ ->
  ?assessment_progress:replication_task_assessment_run_progress ->
  ?replication_task_assessment_run_creation_date:t_stamp ->
  ?status:string_ ->
  ?replication_task_arn:string_ ->
  ?replication_task_assessment_run_arn:string_ ->
  unit ->
  replication_task_assessment_run

val make_start_replication_task_assessment_run_response :
  ?replication_task_assessment_run:replication_task_assessment_run ->
  unit ->
  start_replication_task_assessment_run_response

val make_start_replication_task_assessment_run_message :
  ?tags:tag_list ->
  ?exclude:exclude_test_list ->
  ?include_only:include_test_list ->
  ?result_kms_key_arn:string_ ->
  ?result_encryption_mode:string_ ->
  ?result_location_folder:string_ ->
  assessment_run_name:string_ ->
  result_location_bucket:string_ ->
  service_access_role_arn:string_ ->
  replication_task_arn:string_ ->
  unit ->
  start_replication_task_assessment_run_message

val make_start_replication_task_assessment_response :
  ?replication_task:replication_task -> unit -> start_replication_task_assessment_response

val make_start_replication_task_assessment_message :
  replication_task_arn:string_ -> unit -> start_replication_task_assessment_message

val make_start_replication_response : ?replication:replication -> unit -> start_replication_response

val make_start_replication_message :
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?cdc_start_time:t_stamp ->
  ?premigration_assessment_settings:string_ ->
  start_replication_type:string_ ->
  replication_config_arn:string_ ->
  unit ->
  start_replication_message

val make_recommendation_settings :
  workload_type:string_ -> instance_sizing_type:string_ -> unit -> recommendation_settings

val make_start_recommendations_request_entry :
  settings:recommendation_settings ->
  database_id:string_ ->
  unit ->
  start_recommendations_request_entry

val make_start_recommendations_request :
  settings:recommendation_settings -> database_id:string_ -> unit -> start_recommendations_request

val make_start_metadata_model_import_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_import_response

val make_start_metadata_model_import_message :
  ?refresh:boolean_ ->
  origin:origin_type_value ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_metadata_model_import_message

val make_start_metadata_model_export_to_target_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_export_to_target_response

val make_start_metadata_model_export_to_target_message :
  ?overwrite_extension_pack:boolean_optional ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_metadata_model_export_to_target_message

val make_start_metadata_model_export_as_script_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_export_as_script_response

val make_start_metadata_model_export_as_script_message :
  ?file_name:string_ ->
  origin:origin_type_value ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_metadata_model_export_as_script_message

val make_start_metadata_model_creation_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_creation_response

val make_start_metadata_model_creation_message :
  properties:metadata_model_properties ->
  metadata_model_name:string_ ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_metadata_model_creation_message

val make_start_metadata_model_conversion_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_conversion_response

val make_start_metadata_model_conversion_message :
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  start_metadata_model_conversion_message

val make_start_metadata_model_assessment_response :
  ?request_identifier:string_ -> unit -> start_metadata_model_assessment_response

val make_start_metadata_model_assessment_message :
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
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
  start_type:start_replication_migration_type_value ->
  data_migration_identifier:string_ ->
  unit ->
  start_data_migration_message

val make_server_short_info_response :
  ?server_name:string_ ->
  ?ip_address:string_ ->
  ?server_id:string_ ->
  unit ->
  server_short_info_response

val make_schema_short_info_response :
  ?database_ip_address:string_ ->
  ?database_name:string_ ->
  ?database_id:string_ ->
  ?schema_name:string_ ->
  ?schema_id:string_ ->
  unit ->
  schema_short_info_response

val make_database_short_info_response :
  ?database_engine:string_ ->
  ?database_ip_address:string_ ->
  ?database_name:string_ ->
  ?database_id:string_ ->
  unit ->
  database_short_info_response

val make_schema_response :
  ?similarity:double_optional ->
  ?original_schema:schema_short_info_response ->
  ?schema_name:string_ ->
  ?schema_id:string_ ->
  ?database_instance:database_short_info_response ->
  ?server:server_short_info_response ->
  ?complexity:string_ ->
  ?code_size:long_optional ->
  ?code_line_count:long_optional ->
  unit ->
  schema_response

val make_default_error_details : ?message:string_ -> unit -> default_error_details

val make_export_sql_details :
  ?object_ur_l:string_ -> ?s3_object_key:string_ -> unit -> export_sql_details

val make_processed_object :
  ?endpoint_type:string_ -> ?type_:string_ -> ?name:string_ -> unit -> processed_object

val make_progress :
  ?processed_object:processed_object ->
  ?progress_step:string_ ->
  ?total_objects:long ->
  ?progress_percent:double_optional ->
  unit ->
  progress

val make_schema_conversion_request :
  ?progress:progress ->
  ?export_sql_details:export_sql_details ->
  ?error:error_details ->
  ?migration_project_arn:string_ ->
  ?request_identifier:string_ ->
  ?status:string_ ->
  unit ->
  schema_conversion_request

val make_sc_application_attributes :
  ?s3_bucket_role_arn:string_ -> ?s3_bucket_path:string_ -> unit -> sc_application_attributes

val make_s3_settings :
  ?glue_catalog_generation:boolean_optional ->
  ?expected_bucket_owner:string_ ->
  ?add_trailing_padding_character:boolean_optional ->
  ?date_partition_timezone:string_ ->
  ?rfc4180:boolean_optional ->
  ?max_file_size:integer_optional ->
  ?ignore_header_rows:integer_optional ->
  ?csv_null_value:string_ ->
  ?cdc_min_file_size:integer_optional ->
  ?cdc_max_batch_interval:integer_optional ->
  ?add_column_name:boolean_optional ->
  ?canned_acl_for_objects:canned_acl_for_objects_value ->
  ?use_task_start_time_for_full_load_timestamp:boolean_optional ->
  ?cdc_path:string_ ->
  ?preserve_transactions:boolean_optional ->
  ?csv_no_sup_value:string_ ->
  ?use_csv_no_sup_value:boolean_optional ->
  ?date_partition_delimiter:date_partition_delimiter_value ->
  ?date_partition_sequence:date_partition_sequence_value ->
  ?date_partition_enabled:boolean_optional ->
  ?cdc_inserts_and_updates:boolean_optional ->
  ?parquet_timestamp_in_millisecond:boolean_optional ->
  ?timestamp_column_name:string_ ->
  ?cdc_inserts_only:boolean_optional ->
  ?include_op_for_full_load:boolean_optional ->
  ?enable_statistics:boolean_optional ->
  ?parquet_version:parquet_version_value ->
  ?data_page_size:integer_optional ->
  ?row_group_length:integer_optional ->
  ?dict_page_size_limit:integer_optional ->
  ?encoding_type:encoding_type_value ->
  ?data_format:data_format_value ->
  ?server_side_encryption_kms_key_id:string_ ->
  ?encryption_mode:encryption_mode_value ->
  ?compression_type:compression_type_value ->
  ?bucket_name:string_ ->
  ?bucket_folder:string_ ->
  ?csv_delimiter:string_ ->
  ?csv_row_delimiter:string_ ->
  ?external_table_definition:string_ ->
  ?service_access_role_arn:string_ ->
  unit ->
  s3_settings

val make_run_fleet_advisor_lsa_analysis_response :
  ?status:string_ -> ?lsa_analysis_id:string_ -> unit -> run_fleet_advisor_lsa_analysis_response

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

val make_replication_task_individual_assessment :
  ?replication_task_individual_assessment_start_date:t_stamp ->
  ?status:string_ ->
  ?individual_assessment_name:string_ ->
  ?replication_task_assessment_run_arn:string_ ->
  ?replication_task_individual_assessment_arn:string_ ->
  unit ->
  replication_task_individual_assessment

val make_replication_subnet_group :
  ?is_read_only:boolean_optional ->
  ?supported_network_types:string_list ->
  ?subnets:subnet_list ->
  ?subnet_group_status:string_ ->
  ?vpc_id:string_ ->
  ?replication_subnet_group_description:string_ ->
  ?replication_subnet_group_identifier:string_ ->
  unit ->
  replication_subnet_group

val make_replication_pending_modified_values :
  ?network_type:string_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?allocated_storage:integer_optional ->
  ?replication_instance_class:replication_instance_class ->
  unit ->
  replication_pending_modified_values

val make_replication_instance_task_log :
  ?replication_instance_task_log_size:long ->
  ?replication_task_arn:string_ ->
  ?replication_task_name:string_ ->
  unit ->
  replication_instance_task_log

val make_kerberos_authentication_settings :
  ?krb5_file_contents:string_ ->
  ?key_cache_secret_iam_arn:string_ ->
  ?key_cache_secret_id:string_ ->
  unit ->
  kerberos_authentication_settings

val make_replication_instance :
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  ?network_type:string_ ->
  ?dns_name_servers:string_ ->
  ?free_until:t_stamp ->
  ?secondary_availability_zone:string_ ->
  ?publicly_accessible:boolean_ ->
  ?replication_instance_ipv6_addresses:replication_instance_ipv6_address_list ->
  ?replication_instance_private_ip_addresses:replication_instance_private_ip_address_list ->
  ?replication_instance_public_ip_addresses:replication_instance_public_ip_address_list ->
  ?replication_instance_private_ip_address:string_ ->
  ?replication_instance_public_ip_address:string_ ->
  ?replication_instance_arn:string_ ->
  ?kms_key_id:string_ ->
  ?auto_minor_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_ ->
  ?pending_modified_values:replication_pending_modified_values ->
  ?preferred_maintenance_window:string_ ->
  ?replication_subnet_group:replication_subnet_group ->
  ?availability_zone:string_ ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?instance_create_time:t_stamp ->
  ?allocated_storage:integer ->
  ?replication_instance_status:string_ ->
  ?replication_instance_class:replication_instance_class ->
  ?replication_instance_identifier:string_ ->
  unit ->
  replication_instance

val make_compute_config :
  ?vpc_security_group_ids:string_list ->
  ?replication_subnet_group_id:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?multi_a_z:boolean_optional ->
  ?min_capacity_units:integer_optional ->
  ?max_capacity_units:integer_optional ->
  ?kms_key_id:string_ ->
  ?dns_name_servers:string_ ->
  ?availability_zone:string_ ->
  unit ->
  compute_config

val make_replication_config :
  ?is_read_only:boolean_optional ->
  ?replication_config_update_time:t_stamp ->
  ?replication_config_create_time:t_stamp ->
  ?table_mappings:string_ ->
  ?supplemental_settings:string_ ->
  ?replication_settings:string_ ->
  ?compute_config:compute_config ->
  ?replication_type:migration_type_value ->
  ?target_endpoint_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?replication_config_arn:string_ ->
  ?replication_config_identifier:string_ ->
  unit ->
  replication_config

val make_remove_tags_from_resource_response : unit -> unit

val make_remove_tags_from_resource_message :
  tag_keys:key_list -> resource_arn:string_ -> unit -> remove_tags_from_resource_message

val make_reload_tables_response : ?replication_task_arn:string_ -> unit -> reload_tables_response

val make_reload_tables_message :
  ?reload_option:reload_option_value ->
  tables_to_reload:table_list_to_reload ->
  replication_task_arn:string_ ->
  unit ->
  reload_tables_message

val make_reload_replication_tables_response :
  ?replication_config_arn:string_ -> unit -> reload_replication_tables_response

val make_reload_replication_tables_message :
  ?reload_option:reload_option_value ->
  tables_to_reload:table_list_to_reload ->
  replication_config_arn:string_ ->
  unit ->
  reload_replication_tables_message

val make_refresh_schemas_status :
  ?last_failure_message:string_ ->
  ?last_refresh_date:t_stamp ->
  ?status:refresh_schemas_status_type_value ->
  ?replication_instance_arn:string_ ->
  ?endpoint_arn:string_ ->
  unit ->
  refresh_schemas_status

val make_refresh_schemas_response :
  ?refresh_schemas_status:refresh_schemas_status -> unit -> refresh_schemas_response

val make_refresh_schemas_message :
  replication_instance_arn:string_ -> endpoint_arn:string_ -> unit -> refresh_schemas_message

val make_redshift_settings :
  ?map_boolean_as_boolean:boolean_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?write_buffer_size:integer_optional ->
  ?username:string_ ->
  ?truncate_columns:boolean_optional ->
  ?trim_blanks:boolean_optional ->
  ?time_format:string_ ->
  ?server_side_encryption_kms_key_id:string_ ->
  ?service_access_role_arn:string_ ->
  ?server_name:string_ ->
  ?replace_chars:string_ ->
  ?replace_invalid_chars:string_ ->
  ?remove_quotes:boolean_optional ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?max_file_size:integer_optional ->
  ?load_timeout:integer_optional ->
  ?file_transfer_upload_streams:integer_optional ->
  ?explicit_ids:boolean_optional ->
  ?encryption_mode:encryption_mode_value ->
  ?empty_as_null:boolean_optional ->
  ?date_format:string_ ->
  ?database_name:string_ ->
  ?connection_timeout:integer_optional ->
  ?comp_update:boolean_optional ->
  ?case_sensitive_names:boolean_optional ->
  ?bucket_name:string_ ->
  ?bucket_folder:string_ ->
  ?after_connect_script:string_ ->
  ?accept_any_date:boolean_optional ->
  unit ->
  redshift_settings

val make_redshift_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  redshift_data_provider_settings

val make_redis_settings :
  ?ssl_ca_certificate_arn:string_ ->
  ?auth_password:secret_string ->
  ?auth_user_name:string_ ->
  ?auth_type:redis_auth_type_value ->
  ?ssl_security_protocol:ssl_security_protocol_value ->
  port:integer ->
  server_name:string_ ->
  unit ->
  redis_settings

val make_rds_requirements :
  ?engine_version:string_ ->
  ?deployment_option:string_ ->
  ?storage_iops:integer_optional ->
  ?storage_size:integer_optional ->
  ?instance_memory:double_optional ->
  ?instance_vcpu:double_optional ->
  ?engine_edition:string_ ->
  unit ->
  rds_requirements

val make_rds_configuration :
  ?engine_version:string_ ->
  ?deployment_option:string_ ->
  ?storage_iops:integer_optional ->
  ?storage_size:integer_optional ->
  ?storage_type:string_ ->
  ?instance_memory:double_optional ->
  ?instance_vcpu:double_optional ->
  ?instance_type:string_ ->
  ?engine_edition:string_ ->
  unit ->
  rds_configuration

val make_rds_recommendation :
  ?target_configuration:rds_configuration ->
  ?requirements_to_target:rds_requirements ->
  unit ->
  rds_recommendation

val make_recommendation_data : ?rds_engine:rds_recommendation -> unit -> recommendation_data

val make_recommendation :
  ?data:recommendation_data ->
  ?settings:recommendation_settings ->
  ?preferred:boolean_optional ->
  ?status:string_ ->
  ?created_date:string_ ->
  ?engine_name:string_ ->
  ?database_id:string_ ->
  unit ->
  recommendation

val make_reboot_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> reboot_replication_instance_response

val make_reboot_replication_instance_message :
  ?force_planned_failover:boolean_optional ->
  ?force_failover:boolean_optional ->
  replication_instance_arn:string_ ->
  unit ->
  reboot_replication_instance_message

val make_postgre_sql_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  postgre_sql_data_provider_settings

val make_postgre_sql_settings :
  ?authentication_method:postgre_sql_authentication_method ->
  ?service_access_role_arn:string_ ->
  ?disable_unicode_source_filter:boolean_optional ->
  ?babelfish_database_name:string_ ->
  ?database_mode:database_mode ->
  ?map_long_varchar_as:long_varchar_mapping_type ->
  ?map_jsonb_as_clob:boolean_optional ->
  ?map_boolean_as_boolean:boolean_optional ->
  ?trim_space_in_char:boolean_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?plugin_name:plugin_name_value ->
  ?slot_name:string_ ->
  ?username:string_ ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?heartbeat_frequency:integer_optional ->
  ?heartbeat_schema:string_ ->
  ?heartbeat_enable:boolean_optional ->
  ?fail_tasks_on_lob_truncation:boolean_optional ->
  ?execute_timeout:integer_optional ->
  ?ddl_artifacts_schema:string_ ->
  ?database_name:string_ ->
  ?max_file_size:integer_optional ->
  ?capture_ddls:boolean_optional ->
  ?after_connect_script:string_ ->
  unit ->
  postgre_sql_settings

val make_orderable_replication_instance :
  ?release_status:release_status_values ->
  ?availability_zones:availability_zones_list ->
  ?included_allocated_storage:integer ->
  ?default_allocated_storage:integer ->
  ?max_allocated_storage:integer ->
  ?min_allocated_storage:integer ->
  ?storage_type:string_ ->
  ?replication_instance_class:replication_instance_class ->
  ?engine_version:string_ ->
  unit ->
  orderable_replication_instance

val make_oracle_settings :
  ?authentication_method:oracle_authentication_method ->
  ?open_transaction_window:integer_optional ->
  ?convert_timestamp_with_zone_to_ut_c:boolean_optional ->
  ?trim_space_in_char:boolean_optional ->
  ?secrets_manager_oracle_asm_secret_id:string_ ->
  ?secrets_manager_oracle_asm_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?use_logminer_reader:boolean_optional ->
  ?use_direct_path_full_load:boolean_optional ->
  ?use_b_file:boolean_optional ->
  ?username:string_ ->
  ?standby_delay_time:integer_optional ->
  ?spatial_data_option_to_geo_json_function_name:string_ ->
  ?server_name:string_ ->
  ?security_db_encryption_name:string_ ->
  ?security_db_encryption:secret_string ->
  ?retry_interval:integer_optional ->
  ?read_table_space_name:boolean_optional ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?number_datatype_scale:integer_optional ->
  ?fail_tasks_on_lob_truncation:boolean_optional ->
  ?direct_path_parallel_load:boolean_optional ->
  ?database_name:string_ ->
  ?char_length_semantics:char_length_semantics ->
  ?asm_user:string_ ->
  ?asm_server:string_ ->
  ?asm_password:secret_string ->
  ?archived_logs_only:boolean_optional ->
  ?direct_path_no_log:boolean_optional ->
  ?enable_homogenous_tablespace:boolean_optional ->
  ?replace_path_prefix:boolean_optional ->
  ?use_path_prefix:string_ ->
  ?oracle_path_prefix:string_ ->
  ?use_alternate_folder_for_online:boolean_optional ->
  ?access_alternate_directly:boolean_optional ->
  ?read_ahead_blocks:integer_optional ->
  ?parallel_asm_read_threads:integer_optional ->
  ?allow_select_nested_tables:boolean_optional ->
  ?extra_archived_log_dest_ids:integer_list ->
  ?additional_archived_log_dest_id:integer_optional ->
  ?archived_log_dest_id:integer_optional ->
  ?add_supplemental_logging:boolean_optional ->
  unit ->
  oracle_settings

val make_oracle_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?secrets_manager_security_db_encryption_access_role_arn:string_ ->
  ?secrets_manager_security_db_encryption_secret_id:string_ ->
  ?secrets_manager_oracle_asm_access_role_arn:string_ ->
  ?secrets_manager_oracle_asm_secret_id:string_ ->
  ?asm_server:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  oracle_data_provider_settings

val make_neptune_settings :
  ?iam_auth_enabled:boolean_optional ->
  ?max_retry_count:integer_optional ->
  ?max_file_size:integer_optional ->
  ?error_retry_duration:integer_optional ->
  ?service_access_role_arn:string_ ->
  s3_bucket_folder:string_ ->
  s3_bucket_name:string_ ->
  unit ->
  neptune_settings

val make_my_sql_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  my_sql_data_provider_settings

val make_my_sql_settings :
  ?authentication_method:my_sql_authentication_method ->
  ?service_access_role_arn:string_ ->
  ?execute_timeout:integer_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?username:string_ ->
  ?server_timezone:string_ ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?parallel_load_threads:integer_optional ->
  ?max_file_size:integer_optional ->
  ?target_db_type:target_db_type ->
  ?events_poll_interval:integer_optional ->
  ?database_name:string_ ->
  ?clean_source_metadata_on_mismatch:boolean_optional ->
  ?after_connect_script:string_ ->
  unit ->
  my_sql_settings

val make_move_replication_task_response :
  ?replication_task:replication_task -> unit -> move_replication_task_response

val make_move_replication_task_message :
  target_replication_instance_arn:string_ ->
  replication_task_arn:string_ ->
  unit ->
  move_replication_task_message

val make_mongo_db_settings :
  ?replicate_shard_collections:boolean_optional ->
  ?use_update_look_up:boolean_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?auth_source:string_ ->
  ?docs_to_investigate:string_ ->
  ?extract_doc_id:string_ ->
  ?nesting_level:nesting_level_value ->
  ?auth_mechanism:auth_mechanism_value ->
  ?auth_type:auth_type_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?password:secret_string ->
  ?username:string_ ->
  unit ->
  mongo_db_settings

val make_mongo_db_data_provider_settings :
  ?auth_mechanism:auth_mechanism_value ->
  ?auth_source:string_ ->
  ?auth_type:auth_type_value ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  mongo_db_data_provider_settings

val make_modify_replication_task_response :
  ?replication_task:replication_task -> unit -> modify_replication_task_response

val make_modify_replication_task_message :
  ?task_data:string_ ->
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?cdc_start_time:t_stamp ->
  ?replication_task_settings:string_ ->
  ?table_mappings:string_ ->
  ?migration_type:migration_type_value ->
  ?replication_task_identifier:string_ ->
  replication_task_arn:string_ ->
  unit ->
  modify_replication_task_message

val make_modify_replication_subnet_group_response :
  ?replication_subnet_group:replication_subnet_group ->
  unit ->
  modify_replication_subnet_group_response

val make_modify_replication_subnet_group_message :
  ?replication_subnet_group_description:string_ ->
  subnet_ids:subnet_identifier_list ->
  replication_subnet_group_identifier:string_ ->
  unit ->
  modify_replication_subnet_group_message

val make_modify_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> modify_replication_instance_response

val make_modify_replication_instance_message :
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  ?network_type:string_ ->
  ?replication_instance_identifier:string_ ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?allow_major_version_upgrade:boolean_ ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?replication_instance_class:replication_instance_class ->
  ?apply_immediately:boolean_ ->
  ?allocated_storage:integer_optional ->
  replication_instance_arn:string_ ->
  unit ->
  modify_replication_instance_message

val make_modify_replication_config_response :
  ?replication_config:replication_config -> unit -> modify_replication_config_response

val make_modify_replication_config_message :
  ?target_endpoint_arn:string_ ->
  ?source_endpoint_arn:string_ ->
  ?compute_config:compute_config ->
  ?supplemental_settings:string_ ->
  ?replication_settings:string_ ->
  ?table_mappings:string_ ->
  ?replication_type:migration_type_value ->
  ?replication_config_identifier:string_ ->
  replication_config_arn:string_ ->
  unit ->
  modify_replication_config_message

val make_data_provider_descriptor :
  ?data_provider_arn:string_ ->
  ?data_provider_name:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  unit ->
  data_provider_descriptor

val make_migration_project :
  ?schema_conversion_application_attributes:sc_application_attributes ->
  ?description:string_ ->
  ?transformation_rules:string_ ->
  ?instance_profile_name:string_ ->
  ?instance_profile_arn:string_ ->
  ?target_data_provider_descriptors:data_provider_descriptor_list ->
  ?source_data_provider_descriptors:data_provider_descriptor_list ->
  ?migration_project_creation_time:iso8601_date_time ->
  ?migration_project_arn:string_ ->
  ?migration_project_name:string_ ->
  unit ->
  migration_project

val make_modify_migration_project_response :
  ?migration_project:migration_project -> unit -> modify_migration_project_response

val make_data_provider_descriptor_definition :
  ?secrets_manager_access_role_arn:string_ ->
  ?secrets_manager_secret_id:string_ ->
  data_provider_identifier:string_ ->
  unit ->
  data_provider_descriptor_definition

val make_modify_migration_project_message :
  ?schema_conversion_application_attributes:sc_application_attributes ->
  ?description:string_ ->
  ?transformation_rules:string_ ->
  ?instance_profile_identifier:string_ ->
  ?target_data_provider_descriptors:data_provider_descriptor_definition_list ->
  ?source_data_provider_descriptors:data_provider_descriptor_definition_list ->
  ?migration_project_name:string_ ->
  migration_project_identifier:string_ ->
  unit ->
  modify_migration_project_message

val make_instance_profile :
  ?vpc_security_groups:string_list ->
  ?subnet_group_identifier:string_ ->
  ?instance_profile_creation_time:iso8601_date_time ->
  ?description:string_ ->
  ?instance_profile_name:string_ ->
  ?network_type:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?kms_key_arn:string_ ->
  ?availability_zone:string_ ->
  ?instance_profile_arn:string_ ->
  unit ->
  instance_profile

val make_modify_instance_profile_response :
  ?instance_profile:instance_profile -> unit -> modify_instance_profile_response

val make_modify_instance_profile_message :
  ?vpc_security_groups:string_list ->
  ?subnet_group_identifier:string_ ->
  ?description:string_ ->
  ?instance_profile_name:string_ ->
  ?network_type:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?kms_key_arn:string_ ->
  ?availability_zone:string_ ->
  instance_profile_identifier:string_ ->
  unit ->
  modify_instance_profile_message

val make_event_subscription :
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

val make_modify_event_subscription_response :
  ?event_subscription:event_subscription -> unit -> modify_event_subscription_response

val make_modify_event_subscription_message :
  ?enabled:boolean_optional ->
  ?event_categories:event_categories_list ->
  ?source_type:string_ ->
  ?sns_topic_arn:string_ ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_dynamo_db_settings : service_access_role_arn:string_ -> unit -> dynamo_db_settings

val make_dms_transfer_settings :
  ?bucket_name:string_ -> ?service_access_role_arn:string_ -> unit -> dms_transfer_settings

val make_kinesis_settings :
  ?use_large_integer_value:boolean_optional ->
  ?no_hex_prefix:boolean_optional ->
  ?include_null_and_empty:boolean_optional ->
  ?include_control_details:boolean_optional ->
  ?include_table_alter_operations:boolean_optional ->
  ?partition_include_schema_table:boolean_optional ->
  ?include_partition_value:boolean_optional ->
  ?include_transaction_details:boolean_optional ->
  ?service_access_role_arn:string_ ->
  ?message_format:message_format_value ->
  ?stream_arn:string_ ->
  unit ->
  kinesis_settings

val make_kafka_settings :
  ?use_large_integer_value:boolean_optional ->
  ?ssl_endpoint_identification_algorithm:kafka_ssl_endpoint_identification_algorithm ->
  ?sasl_mechanism:kafka_sasl_mechanism ->
  ?no_hex_prefix:boolean_optional ->
  ?sasl_password:secret_string ->
  ?sasl_username:string_ ->
  ?ssl_ca_certificate_arn:string_ ->
  ?ssl_client_key_password:secret_string ->
  ?ssl_client_key_arn:string_ ->
  ?ssl_client_certificate_arn:string_ ->
  ?security_protocol:kafka_security_protocol ->
  ?include_null_and_empty:boolean_optional ->
  ?message_max_bytes:integer_optional ->
  ?include_control_details:boolean_optional ->
  ?include_table_alter_operations:boolean_optional ->
  ?partition_include_schema_table:boolean_optional ->
  ?include_partition_value:boolean_optional ->
  ?include_transaction_details:boolean_optional ->
  ?message_format:message_format_value ->
  ?topic:string_ ->
  ?broker:string_ ->
  unit ->
  kafka_settings

val make_elasticsearch_settings :
  ?use_new_mapping_type:boolean_optional ->
  ?error_retry_duration:integer_optional ->
  ?full_load_error_percentage:integer_optional ->
  endpoint_uri:string_ ->
  service_access_role_arn:string_ ->
  unit ->
  elasticsearch_settings

val make_microsoft_sql_server_settings :
  ?authentication_method:sql_server_authentication_method ->
  ?force_lob_lookup:boolean_optional ->
  ?tlog_access_mode:tlog_access_mode ->
  ?trim_space_in_char:boolean_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?use_third_party_backup_device:boolean_optional ->
  ?use_bcp_full_load:boolean_optional ->
  ?username:string_ ->
  ?server_name:string_ ->
  ?safeguard_policy:safeguard_policy ->
  ?read_backup_only:boolean_optional ->
  ?query_single_always_on_node:boolean_optional ->
  ?password:secret_string ->
  ?control_tables_file_group:string_ ->
  ?database_name:string_ ->
  ?bcp_packet_size:integer_optional ->
  ?port:integer_optional ->
  unit ->
  microsoft_sql_server_settings

val make_ibm_db2_settings :
  ?keep_csv_files:boolean_optional ->
  ?max_file_size:integer_optional ->
  ?write_buffer_size:integer_optional ->
  ?load_timeout:integer_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?username:string_ ->
  ?max_k_bytes_per_read:integer_optional ->
  ?current_lsn:string_ ->
  ?set_data_capture_changes:boolean_optional ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?database_name:string_ ->
  unit ->
  ibm_db2_settings

val make_doc_db_settings :
  ?replicate_shard_collections:boolean_optional ->
  ?use_update_look_up:boolean_optional ->
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?kms_key_id:string_ ->
  ?docs_to_investigate:integer_optional ->
  ?extract_doc_id:boolean_optional ->
  ?nesting_level:nesting_level_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?password:secret_string ->
  ?username:string_ ->
  unit ->
  doc_db_settings

val make_gcp_my_sql_settings :
  ?secrets_manager_secret_id:string_ ->
  ?secrets_manager_access_role_arn:string_ ->
  ?username:string_ ->
  ?server_timezone:string_ ->
  ?server_name:string_ ->
  ?port:integer_optional ->
  ?password:secret_string ->
  ?parallel_load_threads:integer_optional ->
  ?max_file_size:integer_optional ->
  ?target_db_type:target_db_type ->
  ?events_poll_interval:integer_optional ->
  ?database_name:string_ ->
  ?clean_source_metadata_on_mismatch:boolean_optional ->
  ?after_connect_script:string_ ->
  unit ->
  gcp_my_sql_settings

val make_lakehouse_settings : arn:string_ -> unit -> lakehouse_settings

val make_endpoint :
  ?lakehouse_settings:lakehouse_settings ->
  ?timestream_settings:timestream_settings ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?redis_settings:redis_settings ->
  ?doc_db_settings:doc_db_settings ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?sybase_settings:sybase_settings ->
  ?oracle_settings:oracle_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?redshift_settings:redshift_settings ->
  ?neptune_settings:neptune_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?kafka_settings:kafka_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?s3_settings:s3_settings ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?is_read_only:boolean_optional ->
  ?external_id:string_ ->
  ?external_table_definition:string_ ->
  ?service_access_role_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?endpoint_arn:string_ ->
  ?kms_key_id:string_ ->
  ?status:string_ ->
  ?extra_connection_attributes:string_ ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?username:string_ ->
  ?engine_display_name:string_ ->
  ?engine_name:string_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?endpoint_identifier:string_ ->
  unit ->
  endpoint

val make_modify_endpoint_response : ?endpoint:endpoint -> unit -> modify_endpoint_response

val make_modify_endpoint_message :
  ?timestream_settings:timestream_settings ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?exact_settings:boolean_optional ->
  ?redis_settings:redis_settings ->
  ?doc_db_settings:doc_db_settings ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?sybase_settings:sybase_settings ->
  ?oracle_settings:oracle_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?redshift_settings:redshift_settings ->
  ?neptune_settings:neptune_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?kafka_settings:kafka_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?s3_settings:s3_settings ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?external_table_definition:string_ ->
  ?service_access_role_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?extra_connection_attributes:string_ ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?password:secret_string ->
  ?username:string_ ->
  ?engine_name:string_ ->
  ?endpoint_type:replication_endpoint_type_value ->
  ?endpoint_identifier:string_ ->
  endpoint_arn:string_ ->
  unit ->
  modify_endpoint_message

val make_microsoft_sql_server_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  microsoft_sql_server_data_provider_settings

val make_doc_db_data_provider_settings :
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  doc_db_data_provider_settings

val make_maria_db_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  maria_db_data_provider_settings

val make_ibm_db2_luw_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?security_mechanism:integer_optional ->
  ?encryption_algorithm:integer_optional ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  ibm_db2_luw_data_provider_settings

val make_ibm_db2z_os_data_provider_settings :
  ?s3_access_role_arn:string_ ->
  ?s3_path:string_ ->
  ?certificate_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  unit ->
  ibm_db2z_os_data_provider_settings

val make_data_provider :
  ?settings:data_provider_settings ->
  ?\#virtual:boolean_optional ->
  ?engine:string_ ->
  ?description:string_ ->
  ?data_provider_creation_time:iso8601_date_time ->
  ?data_provider_arn:string_ ->
  ?data_provider_name:string_ ->
  unit ->
  data_provider

val make_modify_data_provider_response :
  ?data_provider:data_provider -> unit -> modify_data_provider_response

val make_modify_data_provider_message :
  ?settings:data_provider_settings ->
  ?exact_settings:boolean_optional ->
  ?\#virtual:boolean_optional ->
  ?engine:string_ ->
  ?description:string_ ->
  ?data_provider_name:string_ ->
  data_provider_identifier:string_ ->
  unit ->
  modify_data_provider_message

val make_modify_data_migration_response :
  ?data_migration:data_migration -> unit -> modify_data_migration_response

val make_modify_data_migration_message :
  ?selection_rules:secret_string ->
  ?number_of_jobs:integer_optional ->
  ?target_data_settings:target_data_settings ->
  ?source_data_settings:source_data_settings ->
  ?data_migration_type:migration_type_value ->
  ?service_access_role_arn:string_ ->
  ?enable_cloudwatch_logs:boolean_optional ->
  ?data_migration_name:string_ ->
  data_migration_identifier:string_ ->
  unit ->
  modify_data_migration_message

val make_modify_conversion_configuration_response :
  ?migration_project_identifier:string_ -> unit -> modify_conversion_configuration_response

val make_modify_conversion_configuration_message :
  conversion_configuration:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  modify_conversion_configuration_message

val make_metadata_model_reference :
  ?selection_rules:string_ -> ?metadata_model_name:string_ -> unit -> metadata_model_reference

val make_list_tags_for_resource_response :
  ?tag_list:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_message :
  ?resource_arn_list:arn_list -> ?resource_arn:string_ -> unit -> list_tags_for_resource_message

val make_limitation :
  ?type_:string_ ->
  ?impact:string_ ->
  ?description:string_ ->
  ?name:string_ ->
  ?engine_name:string_ ->
  ?database_id:string_ ->
  unit ->
  limitation

val make_inventory_data :
  ?number_of_schemas:integer_optional ->
  ?number_of_databases:integer_optional ->
  unit ->
  inventory_data

val make_certificate :
  ?kms_key_id:string_ ->
  ?key_length:integer_optional ->
  ?signing_algorithm:string_ ->
  ?valid_to_date:t_stamp ->
  ?valid_from_date:t_stamp ->
  ?certificate_owner:string_ ->
  ?certificate_arn:string_ ->
  ?certificate_wallet:certificate_wallet ->
  ?certificate_pem:string_ ->
  ?certificate_creation_date:t_stamp ->
  ?certificate_identifier:string_ ->
  unit ->
  certificate

val make_import_certificate_response :
  ?certificate:certificate -> unit -> import_certificate_response

val make_import_certificate_message :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?certificate_wallet:certificate_wallet ->
  ?certificate_pem:secret_string ->
  certificate_identifier:string_ ->
  unit ->
  import_certificate_message

val make_get_target_selection_rules_response :
  ?target_selection_rules:string_ -> unit -> get_target_selection_rules_response

val make_get_target_selection_rules_message :
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  get_target_selection_rules_message

val make_fleet_advisor_schema_object_response :
  ?code_size:long_optional ->
  ?code_line_count:long_optional ->
  ?number_of_objects:long_optional ->
  ?object_type:string_ ->
  ?schema_id:string_ ->
  unit ->
  fleet_advisor_schema_object_response

val make_fleet_advisor_lsa_analysis_response :
  ?status:string_ -> ?lsa_analysis_id:string_ -> unit -> fleet_advisor_lsa_analysis_response

val make_filter : values:filter_value_list -> name:string_ -> unit -> filter

val make_export_metadata_model_assessment_result_entry :
  ?object_ur_l:string_ ->
  ?s3_object_key:string_ ->
  unit ->
  export_metadata_model_assessment_result_entry

val make_export_metadata_model_assessment_response :
  ?csv_report:export_metadata_model_assessment_result_entry ->
  ?pdf_report:export_metadata_model_assessment_result_entry ->
  unit ->
  export_metadata_model_assessment_response

val make_export_metadata_model_assessment_message :
  ?assessment_report_types:assessment_report_types_list ->
  ?file_name:string_ ->
  selection_rules:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  export_metadata_model_assessment_message

val make_event :
  ?date:t_stamp ->
  ?event_categories:event_categories_list ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  event

val make_event_category_group :
  ?event_categories:event_categories_list -> ?source_type:string_ -> unit -> event_category_group

val make_engine_version :
  ?available_upgrades:available_upgrades_list ->
  ?force_upgrade_date:t_stamp ->
  ?deprecation_date:t_stamp ->
  ?auto_upgrade_date:t_stamp ->
  ?launch_date:t_stamp ->
  ?release_status:release_status_values ->
  ?lifecycle:string_ ->
  ?version:string_ ->
  unit ->
  engine_version

val make_endpoint_setting :
  ?default_value:string_ ->
  ?int_value_max:integer_optional ->
  ?int_value_min:integer_optional ->
  ?applicability:string_ ->
  ?units:string_ ->
  ?sensitive:boolean_optional ->
  ?enum_values:endpoint_setting_enum_values ->
  ?type_:endpoint_setting_type_value ->
  ?name:string_ ->
  unit ->
  endpoint_setting

val make_describe_table_statistics_response :
  ?marker:string_ ->
  ?table_statistics:table_statistics_list ->
  ?replication_task_arn:string_ ->
  unit ->
  describe_table_statistics_response

val make_describe_table_statistics_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  replication_task_arn:string_ ->
  unit ->
  describe_table_statistics_message

val make_describe_schemas_response :
  ?schemas:schema_list -> ?marker:string_ -> unit -> describe_schemas_response

val make_describe_schemas_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  endpoint_arn:string_ ->
  unit ->
  describe_schemas_message

val make_describe_replications_response :
  ?replications:replication_list -> ?marker:string_ -> unit -> describe_replications_response

val make_describe_replications_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replications_message

val make_describe_replication_tasks_response :
  ?replication_tasks:replication_task_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_tasks_response

val make_describe_replication_tasks_message :
  ?without_settings:boolean_optional ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_tasks_message

val make_describe_replication_task_individual_assessments_response :
  ?replication_task_individual_assessments:replication_task_individual_assessment_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_individual_assessments_response

val make_describe_replication_task_individual_assessments_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_task_individual_assessments_message

val make_describe_replication_task_assessment_runs_response :
  ?replication_task_assessment_runs:replication_task_assessment_run_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_assessment_runs_response

val make_describe_replication_task_assessment_runs_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_task_assessment_runs_message

val make_describe_replication_task_assessment_results_response :
  ?replication_task_assessment_results:replication_task_assessment_result_list ->
  ?bucket_name:string_ ->
  ?marker:string_ ->
  unit ->
  describe_replication_task_assessment_results_response

val make_describe_replication_task_assessment_results_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?replication_task_arn:string_ ->
  unit ->
  describe_replication_task_assessment_results_message

val make_describe_replication_table_statistics_response :
  ?replication_table_statistics:replication_table_statistics_list ->
  ?marker:string_ ->
  ?replication_config_arn:string_ ->
  unit ->
  describe_replication_table_statistics_response

val make_describe_replication_table_statistics_message :
  ?filters:filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  replication_config_arn:string_ ->
  unit ->
  describe_replication_table_statistics_message

val make_describe_replication_subnet_groups_response :
  ?replication_subnet_groups:replication_subnet_groups ->
  ?marker:string_ ->
  unit ->
  describe_replication_subnet_groups_response

val make_describe_replication_subnet_groups_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_subnet_groups_message

val make_describe_replication_instances_response :
  ?replication_instances:replication_instance_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_instances_response

val make_describe_replication_instances_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_instances_message

val make_describe_replication_instance_task_logs_response :
  ?marker:string_ ->
  ?replication_instance_task_logs:replication_instance_task_logs_list ->
  ?replication_instance_arn:string_ ->
  unit ->
  describe_replication_instance_task_logs_response

val make_describe_replication_instance_task_logs_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  replication_instance_arn:string_ ->
  unit ->
  describe_replication_instance_task_logs_message

val make_describe_replication_configs_response :
  ?replication_configs:replication_config_list ->
  ?marker:string_ ->
  unit ->
  describe_replication_configs_response

val make_describe_replication_configs_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_replication_configs_message

val make_describe_refresh_schemas_status_response :
  ?refresh_schemas_status:refresh_schemas_status -> unit -> describe_refresh_schemas_status_response

val make_describe_refresh_schemas_status_message :
  endpoint_arn:string_ -> unit -> describe_refresh_schemas_status_message

val make_describe_recommendations_response :
  ?recommendations:recommendation_list ->
  ?next_token:string_ ->
  unit ->
  describe_recommendations_response

val make_describe_recommendations_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_recommendations_request

val make_describe_recommendation_limitations_response :
  ?limitations:limitation_list ->
  ?next_token:string_ ->
  unit ->
  describe_recommendation_limitations_response

val make_describe_recommendation_limitations_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_recommendation_limitations_request

val make_describe_pending_maintenance_actions_response :
  ?marker:string_ ->
  ?pending_maintenance_actions:pending_maintenance_actions ->
  unit ->
  describe_pending_maintenance_actions_response

val make_describe_pending_maintenance_actions_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  ?replication_instance_arn:string_ ->
  unit ->
  describe_pending_maintenance_actions_message

val make_describe_orderable_replication_instances_response :
  ?marker:string_ ->
  ?orderable_replication_instances:orderable_replication_instance_list ->
  unit ->
  describe_orderable_replication_instances_response

val make_describe_orderable_replication_instances_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_orderable_replication_instances_message

val make_describe_migration_projects_response :
  ?migration_projects:migration_project_list ->
  ?marker:string_ ->
  unit ->
  describe_migration_projects_response

val make_describe_migration_projects_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_migration_projects_message

val make_describe_metadata_model_response :
  ?definition:string_ ->
  ?target_metadata_models:metadata_model_reference_list ->
  ?metadata_model_type:string_ ->
  ?metadata_model_name:string_ ->
  unit ->
  describe_metadata_model_response

val make_describe_metadata_model_message :
  origin:origin_type_value ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  describe_metadata_model_message

val make_describe_metadata_model_imports_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_imports_response

val make_describe_metadata_model_imports_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_imports_message

val make_describe_metadata_model_exports_to_target_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_exports_to_target_response

val make_describe_metadata_model_exports_to_target_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_exports_to_target_message

val make_describe_metadata_model_exports_as_script_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_exports_as_script_response

val make_describe_metadata_model_exports_as_script_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_exports_as_script_message

val make_describe_metadata_model_creations_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_creations_response

val make_describe_metadata_model_creations_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_creations_message

val make_describe_metadata_model_conversions_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_conversions_response

val make_describe_metadata_model_conversions_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_conversions_message

val make_describe_metadata_model_children_response :
  ?metadata_model_children:metadata_model_reference_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_children_response

val make_describe_metadata_model_children_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  origin:origin_type_value ->
  migration_project_identifier:migration_project_identifier ->
  selection_rules:string_ ->
  unit ->
  describe_metadata_model_children_message

val make_describe_metadata_model_assessments_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_metadata_model_assessments_response

val make_describe_metadata_model_assessments_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_metadata_model_assessments_message

val make_describe_instance_profiles_response :
  ?instance_profiles:instance_profile_list ->
  ?marker:string_ ->
  unit ->
  describe_instance_profiles_response

val make_describe_instance_profiles_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_instance_profiles_message

val make_describe_fleet_advisor_schemas_response :
  ?next_token:string_ ->
  ?fleet_advisor_schemas:fleet_advisor_schema_list ->
  unit ->
  describe_fleet_advisor_schemas_response

val make_describe_fleet_advisor_schemas_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_fleet_advisor_schemas_request

val make_describe_fleet_advisor_schema_object_summary_response :
  ?next_token:string_ ->
  ?fleet_advisor_schema_objects:fleet_advisor_schema_object_list ->
  unit ->
  describe_fleet_advisor_schema_object_summary_response

val make_describe_fleet_advisor_schema_object_summary_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_fleet_advisor_schema_object_summary_request

val make_describe_fleet_advisor_lsa_analysis_response :
  ?next_token:string_ ->
  ?analysis:fleet_advisor_lsa_analysis_response_list ->
  unit ->
  describe_fleet_advisor_lsa_analysis_response

val make_describe_fleet_advisor_lsa_analysis_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_fleet_advisor_lsa_analysis_request

val make_database_instance_software_details_response :
  ?tooltip:string_ ->
  ?os_architecture:integer_optional ->
  ?support_level:string_ ->
  ?service_pack:string_ ->
  ?engine_edition:string_ ->
  ?engine_version:string_ ->
  ?engine:string_ ->
  unit ->
  database_instance_software_details_response

val make_collector_short_info_response :
  ?collector_name:string_ ->
  ?collector_referenced_id:string_ ->
  unit ->
  collector_short_info_response

val make_database_response :
  ?collectors:collectors_list ->
  ?software_details:database_instance_software_details_response ->
  ?server:server_short_info_response ->
  ?number_of_schemas:long_optional ->
  ?ip_address:string_ ->
  ?database_name:string_ ->
  ?database_id:string_ ->
  unit ->
  database_response

val make_describe_fleet_advisor_databases_response :
  ?next_token:string_ ->
  ?databases:database_list ->
  unit ->
  describe_fleet_advisor_databases_response

val make_describe_fleet_advisor_databases_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_fleet_advisor_databases_request

val make_collector_health_check :
  ?web_collector_granted_role_based_access:boolean_optional ->
  ?web_collector_s3_access:boolean_optional ->
  ?local_collector_s3_access:boolean_optional ->
  ?collector_status:collector_status ->
  unit ->
  collector_health_check

val make_collector_response :
  ?inventory_data:inventory_data ->
  ?modified_date:string_ ->
  ?created_date:string_ ->
  ?registered_date:string_ ->
  ?last_data_received:string_ ->
  ?collector_health_check:collector_health_check ->
  ?service_access_role_arn:string_ ->
  ?s3_bucket_name:string_ ->
  ?description:string_ ->
  ?version_status:version_status ->
  ?collector_version:string_ ->
  ?collector_name:string_ ->
  ?collector_referenced_id:string_ ->
  unit ->
  collector_response

val make_describe_fleet_advisor_collectors_response :
  ?next_token:string_ ->
  ?collectors:collector_responses ->
  unit ->
  describe_fleet_advisor_collectors_response

val make_describe_fleet_advisor_collectors_request :
  ?next_token:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_fleet_advisor_collectors_request

val make_describe_extension_pack_associations_response :
  ?requests:schema_conversion_request_list ->
  ?marker:string_ ->
  unit ->
  describe_extension_pack_associations_response

val make_describe_extension_pack_associations_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:filter_list ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_extension_pack_associations_message

val make_describe_events_response :
  ?events:event_list -> ?marker:string_ -> unit -> describe_events_response

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

val make_describe_event_subscriptions_response :
  ?event_subscriptions_list:event_subscriptions_list ->
  ?marker:string_ ->
  unit ->
  describe_event_subscriptions_response

val make_describe_event_subscriptions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  ?subscription_name:string_ ->
  unit ->
  describe_event_subscriptions_message

val make_describe_event_categories_response :
  ?event_category_group_list:event_category_group_list -> unit -> describe_event_categories_response

val make_describe_event_categories_message :
  ?filters:filter_list -> ?source_type:string_ -> unit -> describe_event_categories_message

val make_describe_engine_versions_response :
  ?marker:string_ ->
  ?engine_versions:engine_version_list ->
  unit ->
  describe_engine_versions_response

val make_describe_engine_versions_message :
  ?marker:string_ -> ?max_records:integer_optional -> unit -> describe_engine_versions_message

val make_describe_endpoints_response :
  ?endpoints:endpoint_list -> ?marker:string_ -> unit -> describe_endpoints_response

val make_describe_endpoints_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_endpoints_message

val make_describe_endpoint_types_response :
  ?supported_endpoint_types:supported_endpoint_type_list ->
  ?marker:string_ ->
  unit ->
  describe_endpoint_types_response

val make_describe_endpoint_types_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_endpoint_types_message

val make_describe_endpoint_settings_response :
  ?endpoint_settings:endpoint_settings_list ->
  ?marker:string_ ->
  unit ->
  describe_endpoint_settings_response

val make_describe_endpoint_settings_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  engine_name:string_ ->
  unit ->
  describe_endpoint_settings_message

val make_describe_data_providers_response :
  ?data_providers:data_provider_list -> ?marker:string_ -> unit -> describe_data_providers_response

val make_describe_data_providers_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_data_providers_message

val make_describe_data_migrations_response :
  ?marker:marker -> ?data_migrations:data_migrations -> unit -> describe_data_migrations_response

val make_describe_data_migrations_message :
  ?without_statistics:boolean_optional ->
  ?without_settings:boolean_optional ->
  ?marker:marker ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_data_migrations_message

val make_describe_conversion_configuration_response :
  ?conversion_configuration:string_ ->
  ?migration_project_identifier:string_ ->
  unit ->
  describe_conversion_configuration_response

val make_describe_conversion_configuration_message :
  migration_project_identifier:migration_project_identifier ->
  unit ->
  describe_conversion_configuration_message

val make_describe_connections_response :
  ?connections:connection_list -> ?marker:string_ -> unit -> describe_connections_response

val make_describe_connections_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_connections_message

val make_describe_certificates_response :
  ?certificates:certificate_list -> ?marker:string_ -> unit -> describe_certificates_response

val make_describe_certificates_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?filters:filter_list ->
  unit ->
  describe_certificates_message

val make_describe_applicable_individual_assessments_response :
  ?marker:string_ ->
  ?individual_assessment_names:individual_assessment_name_list ->
  unit ->
  describe_applicable_individual_assessments_response

val make_describe_applicable_individual_assessments_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?migration_type:migration_type_value ->
  ?target_engine_name:string_ ->
  ?source_engine_name:string_ ->
  ?replication_config_arn:string_ ->
  ?replication_instance_arn:string_ ->
  ?replication_task_arn:string_ ->
  unit ->
  describe_applicable_individual_assessments_message

val make_account_quota :
  ?max:long -> ?used:long -> ?account_quota_name:string_ -> unit -> account_quota

val make_describe_account_attributes_response :
  ?unique_account_identifier:string_ ->
  ?account_quotas:account_quota_list ->
  unit ->
  describe_account_attributes_response

val make_describe_account_attributes_message : unit -> unit

val make_delete_replication_task_response :
  ?replication_task:replication_task -> unit -> delete_replication_task_response

val make_delete_replication_task_message :
  replication_task_arn:string_ -> unit -> delete_replication_task_message

val make_delete_replication_task_assessment_run_response :
  ?replication_task_assessment_run:replication_task_assessment_run ->
  unit ->
  delete_replication_task_assessment_run_response

val make_delete_replication_task_assessment_run_message :
  replication_task_assessment_run_arn:string_ ->
  unit ->
  delete_replication_task_assessment_run_message

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
  replication_instance_arn:string_ -> endpoint_arn:string_ -> unit -> delete_connection_message

val make_delete_certificate_response :
  ?certificate:certificate -> unit -> delete_certificate_response

val make_delete_certificate_message : certificate_arn:string_ -> unit -> delete_certificate_message

val make_create_replication_task_response :
  ?replication_task:replication_task -> unit -> create_replication_task_response

val make_create_replication_task_message :
  ?resource_identifier:string_ ->
  ?task_data:string_ ->
  ?tags:tag_list ->
  ?cdc_stop_position:string_ ->
  ?cdc_start_position:string_ ->
  ?cdc_start_time:t_stamp ->
  ?replication_task_settings:string_ ->
  table_mappings:string_ ->
  migration_type:migration_type_value ->
  replication_instance_arn:string_ ->
  target_endpoint_arn:string_ ->
  source_endpoint_arn:string_ ->
  replication_task_identifier:string_ ->
  unit ->
  create_replication_task_message

val make_create_replication_subnet_group_response :
  ?replication_subnet_group:replication_subnet_group ->
  unit ->
  create_replication_subnet_group_response

val make_create_replication_subnet_group_message :
  ?tags:tag_list ->
  subnet_ids:subnet_identifier_list ->
  replication_subnet_group_description:string_ ->
  replication_subnet_group_identifier:string_ ->
  unit ->
  create_replication_subnet_group_message

val make_create_replication_instance_response :
  ?replication_instance:replication_instance -> unit -> create_replication_instance_response

val make_create_replication_instance_message :
  ?kerberos_authentication_settings:kerberos_authentication_settings ->
  ?network_type:string_ ->
  ?resource_identifier:string_ ->
  ?dns_name_servers:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?auto_minor_version_upgrade:boolean_optional ->
  ?engine_version:string_ ->
  ?multi_a_z:boolean_optional ->
  ?preferred_maintenance_window:string_ ->
  ?replication_subnet_group_identifier:string_ ->
  ?availability_zone:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?allocated_storage:integer_optional ->
  replication_instance_class:replication_instance_class ->
  replication_instance_identifier:string_ ->
  unit ->
  create_replication_instance_message

val make_create_replication_config_response :
  ?replication_config:replication_config -> unit -> create_replication_config_response

val make_create_replication_config_message :
  ?tags:tag_list ->
  ?resource_identifier:string_ ->
  ?supplemental_settings:string_ ->
  ?replication_settings:string_ ->
  table_mappings:string_ ->
  replication_type:migration_type_value ->
  compute_config:compute_config ->
  target_endpoint_arn:string_ ->
  source_endpoint_arn:string_ ->
  replication_config_identifier:string_ ->
  unit ->
  create_replication_config_message

val make_create_migration_project_response :
  ?migration_project:migration_project -> unit -> create_migration_project_response

val make_create_migration_project_message :
  ?schema_conversion_application_attributes:sc_application_attributes ->
  ?tags:tag_list ->
  ?description:string_ ->
  ?transformation_rules:string_ ->
  ?migration_project_name:string_ ->
  instance_profile_identifier:string_ ->
  target_data_provider_descriptors:data_provider_descriptor_definition_list ->
  source_data_provider_descriptors:data_provider_descriptor_definition_list ->
  unit ->
  create_migration_project_message

val make_create_instance_profile_response :
  ?instance_profile:instance_profile -> unit -> create_instance_profile_response

val make_create_instance_profile_message :
  ?vpc_security_groups:string_list ->
  ?subnet_group_identifier:string_ ->
  ?description:string_ ->
  ?instance_profile_name:string_ ->
  ?network_type:string_ ->
  ?tags:tag_list ->
  ?publicly_accessible:boolean_optional ->
  ?kms_key_arn:string_ ->
  ?availability_zone:string_ ->
  unit ->
  create_instance_profile_message

val make_create_fleet_advisor_collector_response :
  ?s3_bucket_name:string_ ->
  ?service_access_role_arn:string_ ->
  ?description:string_ ->
  ?collector_name:string_ ->
  ?collector_referenced_id:string_ ->
  unit ->
  create_fleet_advisor_collector_response

val make_create_fleet_advisor_collector_request :
  ?description:string_ ->
  s3_bucket_name:string_ ->
  service_access_role_arn:string_ ->
  collector_name:string_ ->
  unit ->
  create_fleet_advisor_collector_request

val make_create_event_subscription_response :
  ?event_subscription:event_subscription -> unit -> create_event_subscription_response

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

val make_create_endpoint_response : ?endpoint:endpoint -> unit -> create_endpoint_response

val make_create_endpoint_message :
  ?timestream_settings:timestream_settings ->
  ?gcp_my_sql_settings:gcp_my_sql_settings ->
  ?redis_settings:redis_settings ->
  ?doc_db_settings:doc_db_settings ->
  ?resource_identifier:string_ ->
  ?ibm_db2_settings:ibm_db2_settings ->
  ?microsoft_sql_server_settings:microsoft_sql_server_settings ->
  ?sybase_settings:sybase_settings ->
  ?oracle_settings:oracle_settings ->
  ?my_sql_settings:my_sql_settings ->
  ?postgre_sql_settings:postgre_sql_settings ->
  ?redshift_settings:redshift_settings ->
  ?neptune_settings:neptune_settings ->
  ?elasticsearch_settings:elasticsearch_settings ->
  ?kafka_settings:kafka_settings ->
  ?kinesis_settings:kinesis_settings ->
  ?mongo_db_settings:mongo_db_settings ->
  ?dms_transfer_settings:dms_transfer_settings ->
  ?s3_settings:s3_settings ->
  ?dynamo_db_settings:dynamo_db_settings ->
  ?external_table_definition:string_ ->
  ?service_access_role_arn:string_ ->
  ?ssl_mode:dms_ssl_mode_value ->
  ?certificate_arn:string_ ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?extra_connection_attributes:string_ ->
  ?database_name:string_ ->
  ?port:integer_optional ->
  ?server_name:string_ ->
  ?password:secret_string ->
  ?username:string_ ->
  engine_name:string_ ->
  endpoint_type:replication_endpoint_type_value ->
  endpoint_identifier:string_ ->
  unit ->
  create_endpoint_message

val make_create_data_provider_response :
  ?data_provider:data_provider -> unit -> create_data_provider_response

val make_create_data_provider_message :
  ?tags:tag_list ->
  ?\#virtual:boolean_optional ->
  ?description:string_ ->
  ?data_provider_name:string_ ->
  settings:data_provider_settings ->
  engine:string_ ->
  unit ->
  create_data_provider_message

val make_create_data_migration_response :
  ?data_migration:data_migration -> unit -> create_data_migration_response

val make_create_data_migration_message :
  ?selection_rules:secret_string ->
  ?tags:tag_list ->
  ?number_of_jobs:integer_optional ->
  ?target_data_settings:target_data_settings ->
  ?source_data_settings:source_data_settings ->
  ?enable_cloudwatch_logs:boolean_optional ->
  ?data_migration_name:string_ ->
  service_access_role_arn:string_ ->
  data_migration_type:migration_type_value ->
  migration_project_identifier:string_ ->
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
  request_identifier:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  cancel_metadata_model_creation_message

val make_cancel_metadata_model_conversion_response :
  ?request:schema_conversion_request -> unit -> cancel_metadata_model_conversion_response

val make_cancel_metadata_model_conversion_message :
  request_identifier:string_ ->
  migration_project_identifier:migration_project_identifier ->
  unit ->
  cancel_metadata_model_conversion_message

val make_batch_start_recommendations_error_entry :
  ?code:string_ ->
  ?message:string_ ->
  ?database_id:string_ ->
  unit ->
  batch_start_recommendations_error_entry

val make_batch_start_recommendations_response :
  ?error_entries:batch_start_recommendations_error_entry_list ->
  unit ->
  batch_start_recommendations_response

val make_batch_start_recommendations_request :
  ?data:start_recommendations_request_entry_list -> unit -> batch_start_recommendations_request

val make_apply_pending_maintenance_action_response :
  ?resource_pending_maintenance_actions:resource_pending_maintenance_actions ->
  unit ->
  apply_pending_maintenance_action_response

val make_apply_pending_maintenance_action_message :
  opt_in_type:string_ ->
  apply_action:string_ ->
  replication_instance_arn:string_ ->
  unit ->
  apply_pending_maintenance_action_message

val make_add_tags_to_resource_response : unit -> unit

val make_add_tags_to_resource_message :
  tags:tag_list -> resource_arn:string_ -> unit -> add_tags_to_resource_message
