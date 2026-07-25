open Types

val make_archival_summary :
  ?archival_date_time:date ->
  ?archival_reason:archival_reason ->
  ?archival_backup_arn:backup_arn ->
  unit ->
  archival_summary

val make_attribute_definition :
  attribute_name:key_schema_attribute_name ->
  attribute_type:scalar_attribute_type ->
  unit ->
  attribute_definition

val make_attribute_value_update :
  ?value:attribute_value -> ?action:attribute_action -> unit -> attribute_value_update

val make_auto_scaling_target_tracking_scaling_policy_configuration_description :
  ?disable_scale_in:boolean_object ->
  ?scale_in_cooldown:integer_object ->
  ?scale_out_cooldown:integer_object ->
  target_value:double_object ->
  unit ->
  auto_scaling_target_tracking_scaling_policy_configuration_description

val make_auto_scaling_policy_description :
  ?policy_name:auto_scaling_policy_name ->
  ?target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_description ->
  unit ->
  auto_scaling_policy_description

val make_auto_scaling_target_tracking_scaling_policy_configuration_update :
  ?disable_scale_in:boolean_object ->
  ?scale_in_cooldown:integer_object ->
  ?scale_out_cooldown:integer_object ->
  target_value:double_object ->
  unit ->
  auto_scaling_target_tracking_scaling_policy_configuration_update

val make_auto_scaling_policy_update :
  ?policy_name:auto_scaling_policy_name ->
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_update ->
  unit ->
  auto_scaling_policy_update

val make_auto_scaling_settings_description :
  ?minimum_units:positive_long_object ->
  ?maximum_units:positive_long_object ->
  ?auto_scaling_disabled:boolean_object ->
  ?auto_scaling_role_arn:string_ ->
  ?scaling_policies:auto_scaling_policy_description_list ->
  unit ->
  auto_scaling_settings_description

val make_auto_scaling_settings_update :
  ?minimum_units:positive_long_object ->
  ?maximum_units:positive_long_object ->
  ?auto_scaling_disabled:boolean_object ->
  ?auto_scaling_role_arn:auto_scaling_role_arn ->
  ?scaling_policy_update:auto_scaling_policy_update ->
  unit ->
  auto_scaling_settings_update

val make_sse_description :
  ?status:sse_status ->
  ?sse_type:sse_type ->
  ?kms_master_key_arn:kms_master_key_arn ->
  ?inaccessible_encryption_date_time:date ->
  unit ->
  sse_description

val make_time_to_live_description :
  ?time_to_live_status:time_to_live_status ->
  ?attribute_name:time_to_live_attribute_name ->
  unit ->
  time_to_live_description

val make_stream_specification :
  ?stream_view_type:stream_view_type ->
  stream_enabled:stream_enabled ->
  unit ->
  stream_specification

val make_on_demand_throughput :
  ?max_read_request_units:long_object ->
  ?max_write_request_units:long_object ->
  unit ->
  on_demand_throughput

val make_provisioned_throughput :
  read_capacity_units:positive_long_object ->
  write_capacity_units:positive_long_object ->
  unit ->
  provisioned_throughput

val make_projection :
  ?projection_type:projection_type ->
  ?non_key_attributes:non_key_attribute_name_list ->
  unit ->
  projection

val make_key_schema_element :
  attribute_name:key_schema_attribute_name -> key_type:key_type -> unit -> key_schema_element

val make_global_secondary_index_info :
  ?index_name:index_name ->
  ?key_schema:key_schema ->
  ?projection:projection ->
  ?provisioned_throughput:provisioned_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  unit ->
  global_secondary_index_info

val make_local_secondary_index_info :
  ?index_name:index_name ->
  ?key_schema:key_schema ->
  ?projection:projection ->
  unit ->
  local_secondary_index_info

val make_source_table_feature_details :
  ?local_secondary_indexes:local_secondary_indexes ->
  ?global_secondary_indexes:global_secondary_indexes ->
  ?stream_description:stream_specification ->
  ?time_to_live_description:time_to_live_description ->
  ?sse_description:sse_description ->
  unit ->
  source_table_feature_details

val make_source_table_details :
  ?table_arn:table_arn ->
  ?table_size_bytes:long_object ->
  ?on_demand_throughput:on_demand_throughput ->
  ?item_count:item_count ->
  ?billing_mode:billing_mode ->
  table_name:table_name ->
  table_id:table_id ->
  key_schema:key_schema ->
  table_creation_date_time:table_creation_date_time ->
  provisioned_throughput:provisioned_throughput ->
  unit ->
  source_table_details

val make_backup_details :
  ?backup_size_bytes:backup_size_bytes ->
  ?backup_expiry_date_time:date ->
  backup_arn:backup_arn ->
  backup_name:backup_name ->
  backup_status:backup_status ->
  backup_type:backup_type ->
  backup_creation_date_time:backup_creation_date_time ->
  unit ->
  backup_details

val make_backup_description :
  ?backup_details:backup_details ->
  ?source_table_details:source_table_details ->
  ?source_table_feature_details:source_table_feature_details ->
  unit ->
  backup_description

val make_backup_summary :
  ?table_name:table_name ->
  ?table_id:table_id ->
  ?table_arn:table_arn ->
  ?backup_arn:backup_arn ->
  ?backup_name:backup_name ->
  ?backup_creation_date_time:backup_creation_date_time ->
  ?backup_expiry_date_time:date ->
  ?backup_status:backup_status ->
  ?backup_type:backup_type ->
  ?backup_size_bytes:backup_size_bytes ->
  unit ->
  backup_summary

val make_throttling_reason : ?reason:reason -> ?resource:resource -> unit -> throttling_reason

val make_capacity :
  ?read_capacity_units:consumed_capacity_units ->
  ?write_capacity_units:consumed_capacity_units ->
  ?capacity_units:consumed_capacity_units ->
  unit ->
  capacity

val make_consumed_capacity :
  ?table_name:table_arn ->
  ?capacity_units:consumed_capacity_units ->
  ?read_capacity_units:consumed_capacity_units ->
  ?write_capacity_units:consumed_capacity_units ->
  ?table:capacity ->
  ?local_secondary_indexes:secondary_indexes_capacity_map ->
  ?global_secondary_indexes:secondary_indexes_capacity_map ->
  unit ->
  consumed_capacity

val make_batch_statement_error :
  ?code:batch_statement_error_code_enum ->
  ?message:string_ ->
  ?item:attribute_map ->
  unit ->
  batch_statement_error

val make_batch_statement_response :
  ?error:batch_statement_error ->
  ?table_name:table_name ->
  ?item:attribute_map ->
  unit ->
  batch_statement_response

val make_batch_execute_statement_output :
  ?responses:parti_ql_batch_response ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  batch_execute_statement_output

val make_batch_statement_request :
  ?parameters:prepared_statement_parameters ->
  ?consistent_read:consistent_read ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  statement:parti_ql_statement ->
  unit ->
  batch_statement_request

val make_batch_execute_statement_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  statements:parti_ql_batch_request ->
  unit ->
  batch_execute_statement_input

val make_keys_and_attributes :
  ?attributes_to_get:attribute_name_list ->
  ?consistent_read:consistent_read ->
  ?projection_expression:projection_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  keys:key_list ->
  unit ->
  keys_and_attributes

val make_batch_get_item_output :
  ?responses:batch_get_response_map ->
  ?unprocessed_keys:batch_get_request_map ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  batch_get_item_output

val make_batch_get_item_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  request_items:batch_get_request_map ->
  unit ->
  batch_get_item_input

val make_item_collection_metrics :
  ?item_collection_key:item_collection_key_attribute_map ->
  ?size_estimate_range_g_b:item_collection_size_estimate_range ->
  unit ->
  item_collection_metrics

val make_delete_request : key:key -> unit -> delete_request
val make_put_request : item:put_item_input_attribute_map -> unit -> put_request

val make_write_request :
  ?put_request:put_request -> ?delete_request:delete_request -> unit -> write_request

val make_batch_write_item_output :
  ?unprocessed_items:batch_write_item_request_map ->
  ?item_collection_metrics:item_collection_metrics_per_table ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  batch_write_item_output

val make_batch_write_item_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  request_items:batch_write_item_request_map ->
  unit ->
  batch_write_item_input

val make_billing_mode_summary :
  ?billing_mode:billing_mode ->
  ?last_update_to_pay_per_request_date_time:date ->
  unit ->
  billing_mode_summary

val make_cancellation_reason :
  ?item:attribute_map -> ?code:code -> ?message:error_message -> unit -> cancellation_reason

val make_condition :
  ?attribute_value_list:attribute_value_list ->
  comparison_operator:comparison_operator ->
  unit ->
  condition

val make_condition_check :
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  key:key ->
  table_name:table_arn ->
  condition_expression:condition_expression ->
  unit ->
  condition_check

val make_point_in_time_recovery_description :
  ?point_in_time_recovery_status:point_in_time_recovery_status ->
  ?recovery_period_in_days:recovery_period_in_days ->
  ?earliest_restorable_date_time:date ->
  ?latest_restorable_date_time:date ->
  unit ->
  point_in_time_recovery_description

val make_continuous_backups_description :
  ?point_in_time_recovery_description:point_in_time_recovery_description ->
  continuous_backups_status:continuous_backups_status ->
  unit ->
  continuous_backups_description

val make_contributor_insights_summary :
  ?table_name:table_name ->
  ?index_name:index_name ->
  ?contributor_insights_status:contributor_insights_status ->
  ?contributor_insights_mode:contributor_insights_mode ->
  unit ->
  contributor_insights_summary

val make_create_backup_output : ?backup_details:backup_details -> unit -> create_backup_output

val make_create_backup_input :
  table_name:table_arn -> backup_name:backup_name -> unit -> create_backup_input

val make_warm_throughput :
  ?read_units_per_second:long_object ->
  ?write_units_per_second:long_object ->
  unit ->
  warm_throughput

val make_create_global_secondary_index_action :
  ?provisioned_throughput:provisioned_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:warm_throughput ->
  index_name:index_name ->
  key_schema:key_schema ->
  projection:projection ->
  unit ->
  create_global_secondary_index_action

val make_table_class_summary :
  ?table_class:table_class -> ?last_update_date_time:date -> unit -> table_class_summary

val make_global_secondary_index_warm_throughput_description :
  ?read_units_per_second:positive_long_object ->
  ?write_units_per_second:positive_long_object ->
  ?status:index_status ->
  unit ->
  global_secondary_index_warm_throughput_description

val make_on_demand_throughput_override :
  ?max_read_request_units:long_object -> unit -> on_demand_throughput_override

val make_provisioned_throughput_override :
  ?read_capacity_units:positive_long_object -> unit -> provisioned_throughput_override

val make_replica_global_secondary_index_description :
  ?index_name:index_name ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?warm_throughput:global_secondary_index_warm_throughput_description ->
  unit ->
  replica_global_secondary_index_description

val make_table_warm_throughput_description :
  ?read_units_per_second:positive_long_object ->
  ?write_units_per_second:positive_long_object ->
  ?status:table_status ->
  unit ->
  table_warm_throughput_description

val make_replica_description :
  ?region_name:region_name ->
  ?replica_status:replica_status ->
  ?replica_arn:string_ ->
  ?replica_status_description:replica_status_description ->
  ?replica_status_percent_progress:replica_status_percent_progress ->
  ?kms_master_key_id:kms_master_key_id ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?warm_throughput:table_warm_throughput_description ->
  ?global_secondary_indexes:replica_global_secondary_index_description_list ->
  ?replica_inaccessible_date_time:date ->
  ?replica_table_class_summary:table_class_summary ->
  ?global_table_settings_replication_mode:global_table_settings_replication_mode ->
  unit ->
  replica_description

val make_global_table_description :
  ?replication_group:replica_description_list ->
  ?global_table_arn:global_table_arn_string ->
  ?creation_date_time:date ->
  ?global_table_status:global_table_status ->
  ?global_table_name:table_name ->
  unit ->
  global_table_description

val make_create_global_table_output :
  ?global_table_description:global_table_description -> unit -> create_global_table_output

val make_replica : ?region_name:region_name -> unit -> replica

val make_create_global_table_input :
  global_table_name:table_name ->
  replication_group:replica_list ->
  unit ->
  create_global_table_input

val make_create_global_table_witness_group_member_action :
  region_name:region_name -> unit -> create_global_table_witness_group_member_action

val make_create_replica_action : region_name:region_name -> unit -> create_replica_action

val make_replica_global_secondary_index :
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index

val make_create_replication_group_member_action :
  ?kms_master_key_id:kms_master_key_id ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?global_secondary_indexes:replica_global_secondary_index_list ->
  ?table_class_override:table_class ->
  region_name:region_name ->
  unit ->
  create_replication_group_member_action

val make_restore_summary :
  ?source_backup_arn:backup_arn ->
  ?source_table_arn:table_arn ->
  restore_date_time:date ->
  restore_in_progress:restore_in_progress ->
  unit ->
  restore_summary

val make_global_table_witness_description :
  ?region_name:region_name ->
  ?witness_status:witness_status ->
  unit ->
  global_table_witness_description

val make_provisioned_throughput_description :
  ?last_increase_date_time:date ->
  ?last_decrease_date_time:date ->
  ?number_of_decreases_today:positive_long_object ->
  ?read_capacity_units:non_negative_long_object ->
  ?write_capacity_units:non_negative_long_object ->
  unit ->
  provisioned_throughput_description

val make_global_secondary_index_description :
  ?index_name:index_name ->
  ?key_schema:key_schema ->
  ?projection:projection ->
  ?index_status:index_status ->
  ?backfilling:backfilling ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?index_size_bytes:long_object ->
  ?item_count:long_object ->
  ?index_arn:string_ ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:global_secondary_index_warm_throughput_description ->
  unit ->
  global_secondary_index_description

val make_local_secondary_index_description :
  ?index_name:index_name ->
  ?key_schema:key_schema ->
  ?projection:projection ->
  ?index_size_bytes:long_object ->
  ?item_count:long_object ->
  ?index_arn:string_ ->
  unit ->
  local_secondary_index_description

val make_table_description :
  ?attribute_definitions:attribute_definitions ->
  ?table_name:table_name ->
  ?key_schema:key_schema ->
  ?table_status:table_status ->
  ?creation_date_time:date ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?table_size_bytes:long_object ->
  ?item_count:long_object ->
  ?table_arn:string_ ->
  ?table_id:table_id ->
  ?billing_mode_summary:billing_mode_summary ->
  ?local_secondary_indexes:local_secondary_index_description_list ->
  ?global_secondary_indexes:global_secondary_index_description_list ->
  ?stream_specification:stream_specification ->
  ?latest_stream_label:string_ ->
  ?latest_stream_arn:stream_arn ->
  ?global_table_version:string_ ->
  ?replicas:replica_description_list ->
  ?global_table_witnesses:global_table_witness_description_list ->
  ?global_table_settings_replication_mode:global_table_settings_replication_mode ->
  ?restore_summary:restore_summary ->
  ?sse_description:sse_description ->
  ?archival_summary:archival_summary ->
  ?table_class_summary:table_class_summary ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:table_warm_throughput_description ->
  ?multi_region_consistency:multi_region_consistency ->
  unit ->
  table_description

val make_create_table_output : ?table_description:table_description -> unit -> create_table_output
val make_tag : key:tag_key_string -> value:tag_value_string -> unit -> tag

val make_sse_specification :
  ?enabled:sse_enabled ->
  ?sse_type:sse_type ->
  ?kms_master_key_id:kms_master_key_id ->
  unit ->
  sse_specification

val make_global_secondary_index :
  ?provisioned_throughput:provisioned_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:warm_throughput ->
  index_name:index_name ->
  key_schema:key_schema ->
  projection:projection ->
  unit ->
  global_secondary_index

val make_local_secondary_index :
  index_name:index_name ->
  key_schema:key_schema ->
  projection:projection ->
  unit ->
  local_secondary_index

val make_create_table_input :
  ?attribute_definitions:attribute_definitions ->
  ?key_schema:key_schema ->
  ?local_secondary_indexes:local_secondary_index_list ->
  ?global_secondary_indexes:global_secondary_index_list ->
  ?billing_mode:billing_mode ->
  ?provisioned_throughput:provisioned_throughput ->
  ?stream_specification:stream_specification ->
  ?sse_specification:sse_specification ->
  ?tags:tag_list ->
  ?table_class:table_class ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?warm_throughput:warm_throughput ->
  ?resource_policy:resource_policy ->
  ?on_demand_throughput:on_demand_throughput ->
  ?global_table_source_arn:table_arn ->
  ?global_table_settings_replication_mode:global_table_settings_replication_mode ->
  table_name:table_arn ->
  unit ->
  create_table_input

val make_csv_options :
  ?delimiter:csv_delimiter -> ?header_list:csv_header_list -> unit -> csv_options

val make_delete :
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  key:key ->
  table_name:table_arn ->
  unit ->
  delete

val make_delete_backup_output :
  ?backup_description:backup_description -> unit -> delete_backup_output

val make_delete_backup_input : backup_arn:backup_arn -> unit -> delete_backup_input

val make_delete_global_secondary_index_action :
  index_name:index_name -> unit -> delete_global_secondary_index_action

val make_delete_global_table_witness_group_member_action :
  region_name:region_name -> unit -> delete_global_table_witness_group_member_action

val make_delete_item_output :
  ?attributes:attribute_map ->
  ?consumed_capacity:consumed_capacity ->
  ?item_collection_metrics:item_collection_metrics ->
  unit ->
  delete_item_output

val make_expected_attribute_value :
  ?value:attribute_value ->
  ?exists:boolean_object ->
  ?comparison_operator:comparison_operator ->
  ?attribute_value_list:attribute_value_list ->
  unit ->
  expected_attribute_value

val make_delete_item_input :
  ?expected:expected_attribute_map ->
  ?conditional_operator:conditional_operator ->
  ?return_values:return_value ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  table_name:table_arn ->
  key:key ->
  unit ->
  delete_item_input

val make_delete_replica_action : region_name:region_name -> unit -> delete_replica_action

val make_delete_replication_group_member_action :
  region_name:region_name -> unit -> delete_replication_group_member_action

val make_delete_resource_policy_output :
  ?revision_id:policy_revision_id -> unit -> delete_resource_policy_output

val make_delete_resource_policy_input :
  ?expected_revision_id:policy_revision_id ->
  resource_arn:resource_arn_string ->
  unit ->
  delete_resource_policy_input

val make_delete_table_output : ?table_description:table_description -> unit -> delete_table_output
val make_delete_table_input : table_name:table_arn -> unit -> delete_table_input

val make_describe_backup_output :
  ?backup_description:backup_description -> unit -> describe_backup_output

val make_describe_backup_input : backup_arn:backup_arn -> unit -> describe_backup_input

val make_describe_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description ->
  unit ->
  describe_continuous_backups_output

val make_describe_continuous_backups_input :
  table_name:table_arn -> unit -> describe_continuous_backups_input

val make_failure_exception :
  ?exception_name:exception_name ->
  ?exception_description:exception_description ->
  unit ->
  failure_exception

val make_describe_contributor_insights_output :
  ?table_name:table_name ->
  ?index_name:index_name ->
  ?contributor_insights_rule_list:contributor_insights_rule_list ->
  ?contributor_insights_status:contributor_insights_status ->
  ?last_update_date_time:last_update_date_time ->
  ?failure_exception:failure_exception ->
  ?contributor_insights_mode:contributor_insights_mode ->
  unit ->
  describe_contributor_insights_output

val make_describe_contributor_insights_input :
  ?index_name:index_name -> table_name:table_arn -> unit -> describe_contributor_insights_input

val make_endpoint : address:string_ -> cache_period_in_minutes:long -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit

val make_incremental_export_specification :
  ?export_from_time:export_from_time ->
  ?export_to_time:export_to_time ->
  ?export_view_type:export_view_type ->
  unit ->
  incremental_export_specification

val make_export_description :
  ?export_arn:export_arn ->
  ?export_status:export_status ->
  ?start_time:export_start_time ->
  ?end_time:export_end_time ->
  ?export_manifest:export_manifest ->
  ?table_arn:table_arn ->
  ?table_id:table_id ->
  ?export_time:export_time ->
  ?client_token:client_token ->
  ?s3_bucket:s3_bucket ->
  ?s3_bucket_owner:s3_bucket_owner ->
  ?s3_prefix:s3_prefix ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_sse_kms_key_id:s3_sse_kms_key_id ->
  ?failure_code:failure_code ->
  ?failure_message:failure_message ->
  ?export_format:export_format ->
  ?billed_size_bytes:billed_size_bytes ->
  ?item_count:item_count ->
  ?export_type:export_type ->
  ?incremental_export_specification:incremental_export_specification ->
  unit ->
  export_description

val make_describe_export_output :
  ?export_description:export_description -> unit -> describe_export_output

val make_describe_export_input : export_arn:export_arn -> unit -> describe_export_input

val make_describe_global_table_output :
  ?global_table_description:global_table_description -> unit -> describe_global_table_output

val make_describe_global_table_input :
  global_table_name:table_name -> unit -> describe_global_table_input

val make_replica_global_secondary_index_settings_description :
  ?index_status:index_status ->
  ?provisioned_read_capacity_units:positive_long_object ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_write_capacity_units:positive_long_object ->
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index_settings_description

val make_replica_settings_description :
  ?replica_status:replica_status ->
  ?replica_billing_mode_summary:billing_mode_summary ->
  ?replica_provisioned_read_capacity_units:non_negative_long_object ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_write_capacity_units:non_negative_long_object ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_global_secondary_index_settings:replica_global_secondary_index_settings_description_list ->
  ?replica_table_class_summary:table_class_summary ->
  region_name:region_name ->
  unit ->
  replica_settings_description

val make_describe_global_table_settings_output :
  ?global_table_name:table_name ->
  ?replica_settings:replica_settings_description_list ->
  unit ->
  describe_global_table_settings_output

val make_describe_global_table_settings_input :
  global_table_name:table_name -> unit -> describe_global_table_settings_input

val make_table_creation_parameters :
  ?billing_mode:billing_mode ->
  ?provisioned_throughput:provisioned_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?sse_specification:sse_specification ->
  ?global_secondary_indexes:global_secondary_index_list ->
  table_name:table_name ->
  attribute_definitions:attribute_definitions ->
  key_schema:key_schema ->
  unit ->
  table_creation_parameters

val make_input_format_options : ?csv:csv_options -> unit -> input_format_options

val make_s3_bucket_source :
  ?s3_bucket_owner:s3_bucket_owner ->
  ?s3_key_prefix:s3_prefix ->
  s3_bucket:s3_bucket ->
  unit ->
  s3_bucket_source

val make_import_table_description :
  ?import_arn:import_arn ->
  ?import_status:import_status ->
  ?table_arn:table_arn ->
  ?table_id:table_id ->
  ?client_token:client_token ->
  ?s3_bucket_source:s3_bucket_source ->
  ?error_count:error_count ->
  ?cloud_watch_log_group_arn:cloud_watch_log_group_arn ->
  ?input_format:input_format ->
  ?input_format_options:input_format_options ->
  ?input_compression_type:input_compression_type ->
  ?table_creation_parameters:table_creation_parameters ->
  ?start_time:import_start_time ->
  ?end_time:import_end_time ->
  ?processed_size_bytes:long_object ->
  ?processed_item_count:processed_item_count ->
  ?imported_item_count:imported_item_count ->
  ?failure_code:failure_code ->
  ?failure_message:failure_message ->
  unit ->
  import_table_description

val make_describe_import_output :
  import_table_description:import_table_description -> unit -> describe_import_output

val make_describe_import_input : import_arn:import_arn -> unit -> describe_import_input

val make_kinesis_data_stream_destination :
  ?stream_arn:stream_arn ->
  ?destination_status:destination_status ->
  ?destination_status_description:string_ ->
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit ->
  kinesis_data_stream_destination

val make_describe_kinesis_streaming_destination_output :
  ?table_name:table_name ->
  ?kinesis_data_stream_destinations:kinesis_data_stream_destinations ->
  unit ->
  describe_kinesis_streaming_destination_output

val make_describe_kinesis_streaming_destination_input :
  table_name:table_arn -> unit -> describe_kinesis_streaming_destination_input

val make_describe_limits_output :
  ?account_max_read_capacity_units:positive_long_object ->
  ?account_max_write_capacity_units:positive_long_object ->
  ?table_max_read_capacity_units:positive_long_object ->
  ?table_max_write_capacity_units:positive_long_object ->
  unit ->
  describe_limits_output

val make_describe_limits_input : unit -> unit
val make_describe_table_output : ?table:table_description -> unit -> describe_table_output
val make_describe_table_input : table_name:table_arn -> unit -> describe_table_input

val make_replica_global_secondary_index_auto_scaling_description :
  ?index_name:index_name ->
  ?index_status:index_status ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  unit ->
  replica_global_secondary_index_auto_scaling_description

val make_replica_auto_scaling_description :
  ?region_name:region_name ->
  ?global_secondary_indexes:replica_global_secondary_index_auto_scaling_description_list ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_status:replica_status ->
  unit ->
  replica_auto_scaling_description

val make_table_auto_scaling_description :
  ?table_name:table_name ->
  ?table_status:table_status ->
  ?replicas:replica_auto_scaling_description_list ->
  unit ->
  table_auto_scaling_description

val make_describe_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
  unit ->
  describe_table_replica_auto_scaling_output

val make_describe_table_replica_auto_scaling_input :
  table_name:table_arn -> unit -> describe_table_replica_auto_scaling_input

val make_describe_time_to_live_output :
  ?time_to_live_description:time_to_live_description -> unit -> describe_time_to_live_output

val make_describe_time_to_live_input : table_name:table_arn -> unit -> describe_time_to_live_input

val make_enable_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit ->
  enable_kinesis_streaming_configuration

val make_kinesis_streaming_destination_output :
  ?table_name:table_name ->
  ?stream_arn:stream_arn ->
  ?destination_status:destination_status ->
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  unit ->
  kinesis_streaming_destination_output

val make_kinesis_streaming_destination_input :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  table_name:table_arn ->
  stream_arn:stream_arn ->
  unit ->
  kinesis_streaming_destination_input

val make_time_to_live_specification :
  enabled:time_to_live_enabled ->
  attribute_name:time_to_live_attribute_name ->
  unit ->
  time_to_live_specification

val make_update_time_to_live_output :
  ?time_to_live_specification:time_to_live_specification -> unit -> update_time_to_live_output

val make_update_time_to_live_input :
  table_name:table_arn ->
  time_to_live_specification:time_to_live_specification ->
  unit ->
  update_time_to_live_input

val make_update_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
  unit ->
  update_table_replica_auto_scaling_output

val make_replica_global_secondary_index_auto_scaling_update :
  ?index_name:index_name ->
  ?provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  unit ->
  replica_global_secondary_index_auto_scaling_update

val make_replica_auto_scaling_update :
  ?replica_global_secondary_index_updates:replica_global_secondary_index_auto_scaling_update_list ->
  ?replica_provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  region_name:region_name ->
  unit ->
  replica_auto_scaling_update

val make_global_secondary_index_auto_scaling_update :
  ?index_name:index_name ->
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  unit ->
  global_secondary_index_auto_scaling_update

val make_update_table_replica_auto_scaling_input :
  ?global_secondary_index_updates:global_secondary_index_auto_scaling_update_list ->
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?replica_updates:replica_auto_scaling_update_list ->
  table_name:table_arn ->
  unit ->
  update_table_replica_auto_scaling_input

val make_update_table_output : ?table_description:table_description -> unit -> update_table_output

val make_global_table_witness_group_update :
  ?create:create_global_table_witness_group_member_action ->
  ?delete:delete_global_table_witness_group_member_action ->
  unit ->
  global_table_witness_group_update

val make_update_replication_group_member_action :
  ?kms_master_key_id:kms_master_key_id ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?global_secondary_indexes:replica_global_secondary_index_list ->
  ?table_class_override:table_class ->
  region_name:region_name ->
  unit ->
  update_replication_group_member_action

val make_replication_group_update :
  ?create:create_replication_group_member_action ->
  ?update:update_replication_group_member_action ->
  ?delete:delete_replication_group_member_action ->
  unit ->
  replication_group_update

val make_update_global_secondary_index_action :
  ?provisioned_throughput:provisioned_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:warm_throughput ->
  index_name:index_name ->
  unit ->
  update_global_secondary_index_action

val make_global_secondary_index_update :
  ?update:update_global_secondary_index_action ->
  ?create:create_global_secondary_index_action ->
  ?delete:delete_global_secondary_index_action ->
  unit ->
  global_secondary_index_update

val make_update_table_input :
  ?attribute_definitions:attribute_definitions ->
  ?billing_mode:billing_mode ->
  ?provisioned_throughput:provisioned_throughput ->
  ?global_secondary_index_updates:global_secondary_index_update_list ->
  ?stream_specification:stream_specification ->
  ?sse_specification:sse_specification ->
  ?replica_updates:replication_group_update_list ->
  ?table_class:table_class ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?multi_region_consistency:multi_region_consistency ->
  ?global_table_witness_updates:global_table_witness_group_update_list ->
  ?on_demand_throughput:on_demand_throughput ->
  ?warm_throughput:warm_throughput ->
  ?global_table_settings_replication_mode:global_table_settings_replication_mode ->
  table_name:table_arn ->
  unit ->
  update_table_input

val make_update_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit ->
  update_kinesis_streaming_configuration

val make_update_kinesis_streaming_destination_output :
  ?table_name:table_name ->
  ?stream_arn:stream_arn ->
  ?destination_status:destination_status ->
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  unit ->
  update_kinesis_streaming_destination_output

val make_update_kinesis_streaming_destination_input :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  table_name:table_arn ->
  stream_arn:stream_arn ->
  unit ->
  update_kinesis_streaming_destination_input

val make_update_item_output :
  ?attributes:attribute_map ->
  ?consumed_capacity:consumed_capacity ->
  ?item_collection_metrics:item_collection_metrics ->
  unit ->
  update_item_output

val make_update_item_input :
  ?attribute_updates:attribute_updates ->
  ?expected:expected_attribute_map ->
  ?conditional_operator:conditional_operator ->
  ?return_values:return_value ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?update_expression:update_expression ->
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  table_name:table_arn ->
  key:key ->
  unit ->
  update_item_input

val make_update_global_table_settings_output :
  ?global_table_name:table_name ->
  ?replica_settings:replica_settings_description_list ->
  unit ->
  update_global_table_settings_output

val make_replica_global_secondary_index_settings_update :
  ?provisioned_read_capacity_units:positive_long_object ->
  ?provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index_settings_update

val make_replica_settings_update :
  ?replica_provisioned_read_capacity_units:positive_long_object ->
  ?replica_provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?replica_global_secondary_index_settings_update:
    replica_global_secondary_index_settings_update_list ->
  ?replica_table_class:table_class ->
  region_name:region_name ->
  unit ->
  replica_settings_update

val make_global_table_global_secondary_index_settings_update :
  ?provisioned_write_capacity_units:positive_long_object ->
  ?provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  index_name:index_name ->
  unit ->
  global_table_global_secondary_index_settings_update

val make_update_global_table_settings_input :
  ?global_table_billing_mode:billing_mode ->
  ?global_table_provisioned_write_capacity_units:positive_long_object ->
  ?global_table_provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?global_table_global_secondary_index_settings_update:
    global_table_global_secondary_index_settings_update_list ->
  ?replica_settings_update:replica_settings_update_list ->
  global_table_name:table_name ->
  unit ->
  update_global_table_settings_input

val make_update_global_table_output :
  ?global_table_description:global_table_description -> unit -> update_global_table_output

val make_replica_update :
  ?create:create_replica_action -> ?delete:delete_replica_action -> unit -> replica_update

val make_update_global_table_input :
  global_table_name:table_name ->
  replica_updates:replica_update_list ->
  unit ->
  update_global_table_input

val make_update_contributor_insights_output :
  ?table_name:table_name ->
  ?index_name:index_name ->
  ?contributor_insights_status:contributor_insights_status ->
  ?contributor_insights_mode:contributor_insights_mode ->
  unit ->
  update_contributor_insights_output

val make_update_contributor_insights_input :
  ?index_name:index_name ->
  ?contributor_insights_mode:contributor_insights_mode ->
  table_name:table_arn ->
  contributor_insights_action:contributor_insights_action ->
  unit ->
  update_contributor_insights_input

val make_update_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description ->
  unit ->
  update_continuous_backups_output

val make_point_in_time_recovery_specification :
  ?recovery_period_in_days:recovery_period_in_days ->
  point_in_time_recovery_enabled:boolean_object ->
  unit ->
  point_in_time_recovery_specification

val make_update_continuous_backups_input :
  table_name:table_arn ->
  point_in_time_recovery_specification:point_in_time_recovery_specification ->
  unit ->
  update_continuous_backups_input

val make_untag_resource_input :
  resource_arn:resource_arn_string -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_transact_write_items_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?item_collection_metrics:item_collection_metrics_per_table ->
  unit ->
  transact_write_items_output

val make_update :
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  key:key ->
  update_expression:update_expression ->
  table_name:table_arn ->
  unit ->
  update

val make_put :
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  item:put_item_input_attribute_map ->
  table_name:table_arn ->
  unit ->
  put

val make_transact_write_item :
  ?condition_check:condition_check ->
  ?put:put ->
  ?delete:delete ->
  ?update:update ->
  unit ->
  transact_write_item

val make_transact_write_items_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?client_request_token:client_request_token ->
  transact_items:transact_write_item_list ->
  unit ->
  transact_write_items_input

val make_item_response : ?item:attribute_map -> unit -> item_response

val make_transact_get_items_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?responses:item_response_list ->
  unit ->
  transact_get_items_output

val make_get :
  ?projection_expression:projection_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  key:key ->
  table_name:table_arn ->
  unit ->
  get

val make_transact_get_item : get:get -> unit -> transact_get_item

val make_transact_get_items_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_items:transact_get_item_list ->
  unit ->
  transact_get_items_input

val make_tag_resource_input :
  resource_arn:resource_arn_string -> tags:tag_list -> unit -> tag_resource_input

val make_scan_output :
  ?items:item_list ->
  ?count:integer ->
  ?scanned_count:integer ->
  ?last_evaluated_key:key ->
  ?consumed_capacity:consumed_capacity ->
  unit ->
  scan_output

val make_scan_input :
  ?index_name:index_name ->
  ?attributes_to_get:attribute_name_list ->
  ?limit:positive_integer_object ->
  ?select:select ->
  ?scan_filter:filter_condition_map ->
  ?conditional_operator:conditional_operator ->
  ?exclusive_start_key:key ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?total_segments:scan_total_segments ->
  ?segment:scan_segment ->
  ?projection_expression:projection_expression ->
  ?filter_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?consistent_read:consistent_read ->
  table_name:table_arn ->
  unit ->
  scan_input

val make_restore_table_to_point_in_time_output :
  ?table_description:table_description -> unit -> restore_table_to_point_in_time_output

val make_restore_table_to_point_in_time_input :
  ?source_table_arn:table_arn ->
  ?source_table_name:table_name ->
  ?use_latest_restorable_time:boolean_object ->
  ?restore_date_time:date ->
  ?billing_mode_override:billing_mode ->
  ?global_secondary_index_override:global_secondary_index_list ->
  ?local_secondary_index_override:local_secondary_index_list ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?sse_specification_override:sse_specification ->
  target_table_name:table_name ->
  unit ->
  restore_table_to_point_in_time_input

val make_restore_table_from_backup_output :
  ?table_description:table_description -> unit -> restore_table_from_backup_output

val make_restore_table_from_backup_input :
  ?billing_mode_override:billing_mode ->
  ?global_secondary_index_override:global_secondary_index_list ->
  ?local_secondary_index_override:local_secondary_index_list ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?sse_specification_override:sse_specification ->
  target_table_name:table_name ->
  backup_arn:backup_arn ->
  unit ->
  restore_table_from_backup_input

val make_query_output :
  ?items:item_list ->
  ?count:integer ->
  ?scanned_count:integer ->
  ?last_evaluated_key:key ->
  ?consumed_capacity:consumed_capacity ->
  unit ->
  query_output

val make_query_input :
  ?index_name:index_name ->
  ?select:select ->
  ?attributes_to_get:attribute_name_list ->
  ?limit:positive_integer_object ->
  ?consistent_read:consistent_read ->
  ?key_conditions:key_conditions ->
  ?query_filter:filter_condition_map ->
  ?conditional_operator:conditional_operator ->
  ?scan_index_forward:boolean_object ->
  ?exclusive_start_key:key ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?projection_expression:projection_expression ->
  ?filter_expression:condition_expression ->
  ?key_condition_expression:key_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  table_name:table_arn ->
  unit ->
  query_input

val make_put_resource_policy_output :
  ?revision_id:policy_revision_id -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  ?expected_revision_id:policy_revision_id ->
  ?confirm_remove_self_resource_access:confirm_remove_self_resource_access ->
  resource_arn:resource_arn_string ->
  policy:resource_policy ->
  unit ->
  put_resource_policy_input

val make_put_item_output :
  ?attributes:attribute_map ->
  ?consumed_capacity:consumed_capacity ->
  ?item_collection_metrics:item_collection_metrics ->
  unit ->
  put_item_output

val make_put_item_input :
  ?expected:expected_attribute_map ->
  ?return_values:return_value ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?conditional_operator:conditional_operator ->
  ?condition_expression:condition_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  table_name:table_arn ->
  item:put_item_input_attribute_map ->
  unit ->
  put_item_input

val make_list_tags_of_resource_output :
  ?tags:tag_list -> ?next_token:next_token_string -> unit -> list_tags_of_resource_output

val make_list_tags_of_resource_input :
  ?next_token:next_token_string ->
  resource_arn:resource_arn_string ->
  unit ->
  list_tags_of_resource_input

val make_list_tables_output :
  ?table_names:table_name_list ->
  ?last_evaluated_table_name:table_name ->
  unit ->
  list_tables_output

val make_list_tables_input :
  ?exclusive_start_table_name:table_name ->
  ?limit:list_tables_input_limit ->
  unit ->
  list_tables_input

val make_import_summary :
  ?import_arn:import_arn ->
  ?import_status:import_status ->
  ?table_arn:table_arn ->
  ?s3_bucket_source:s3_bucket_source ->
  ?cloud_watch_log_group_arn:cloud_watch_log_group_arn ->
  ?input_format:input_format ->
  ?start_time:import_start_time ->
  ?end_time:import_end_time ->
  unit ->
  import_summary

val make_list_imports_output :
  ?import_summary_list:import_summary_list ->
  ?next_token:import_next_token ->
  unit ->
  list_imports_output

val make_list_imports_input :
  ?table_arn:table_arn ->
  ?page_size:list_imports_max_limit ->
  ?next_token:import_next_token ->
  unit ->
  list_imports_input

val make_global_table :
  ?global_table_name:table_name -> ?replication_group:replica_list -> unit -> global_table

val make_list_global_tables_output :
  ?global_tables:global_table_list ->
  ?last_evaluated_global_table_name:table_name ->
  unit ->
  list_global_tables_output

val make_list_global_tables_input :
  ?exclusive_start_global_table_name:table_name ->
  ?limit:positive_integer_object ->
  ?region_name:region_name ->
  unit ->
  list_global_tables_input

val make_export_summary :
  ?export_arn:export_arn ->
  ?export_status:export_status ->
  ?export_type:export_type ->
  unit ->
  export_summary

val make_list_exports_output :
  ?export_summaries:export_summaries -> ?next_token:export_next_token -> unit -> list_exports_output

val make_list_exports_input :
  ?table_arn:table_arn ->
  ?max_results:list_exports_max_limit ->
  ?next_token:export_next_token ->
  unit ->
  list_exports_input

val make_list_contributor_insights_output :
  ?contributor_insights_summaries:contributor_insights_summaries ->
  ?next_token:next_token_string ->
  unit ->
  list_contributor_insights_output

val make_list_contributor_insights_input :
  ?table_name:table_arn ->
  ?next_token:next_token_string ->
  ?max_results:list_contributor_insights_limit ->
  unit ->
  list_contributor_insights_input

val make_list_backups_output :
  ?backup_summaries:backup_summaries ->
  ?last_evaluated_backup_arn:backup_arn ->
  unit ->
  list_backups_output

val make_list_backups_input :
  ?table_name:table_arn ->
  ?limit:backups_input_limit ->
  ?time_range_lower_bound:time_range_lower_bound ->
  ?time_range_upper_bound:time_range_upper_bound ->
  ?exclusive_start_backup_arn:backup_arn ->
  ?backup_type:backup_type_filter ->
  unit ->
  list_backups_input

val make_import_table_output :
  import_table_description:import_table_description -> unit -> import_table_output

val make_import_table_input :
  ?client_token:client_token ->
  ?input_format_options:input_format_options ->
  ?input_compression_type:input_compression_type ->
  s3_bucket_source:s3_bucket_source ->
  input_format:input_format ->
  table_creation_parameters:table_creation_parameters ->
  unit ->
  import_table_input

val make_get_resource_policy_output :
  ?policy:resource_policy -> ?revision_id:policy_revision_id -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  resource_arn:resource_arn_string -> unit -> get_resource_policy_input

val make_get_item_output :
  ?item:attribute_map -> ?consumed_capacity:consumed_capacity -> unit -> get_item_output

val make_get_item_input :
  ?attributes_to_get:attribute_name_list ->
  ?consistent_read:consistent_read ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?projection_expression:projection_expression ->
  ?expression_attribute_names:expression_attribute_name_map ->
  table_name:table_arn ->
  key:key ->
  unit ->
  get_item_input

val make_export_table_to_point_in_time_output :
  ?export_description:export_description -> unit -> export_table_to_point_in_time_output

val make_export_table_to_point_in_time_input :
  ?export_time:export_time ->
  ?client_token:client_token ->
  ?s3_bucket_owner:s3_bucket_owner ->
  ?s3_prefix:s3_prefix ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_sse_kms_key_id:s3_sse_kms_key_id ->
  ?export_format:export_format ->
  ?export_type:export_type ->
  ?incremental_export_specification:incremental_export_specification ->
  table_arn:table_arn ->
  s3_bucket:s3_bucket ->
  unit ->
  export_table_to_point_in_time_input

val make_execute_transaction_output :
  ?responses:item_response_list ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  execute_transaction_output

val make_parameterized_statement :
  ?parameters:prepared_statement_parameters ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  statement:parti_ql_statement ->
  unit ->
  parameterized_statement

val make_execute_transaction_input :
  ?client_request_token:client_request_token ->
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_statements:parameterized_statements ->
  unit ->
  execute_transaction_input

val make_execute_statement_output :
  ?items:item_list ->
  ?next_token:parti_ql_next_token ->
  ?consumed_capacity:consumed_capacity ->
  ?last_evaluated_key:key ->
  unit ->
  execute_statement_output

val make_execute_statement_input :
  ?parameters:prepared_statement_parameters ->
  ?consistent_read:consistent_read ->
  ?next_token:parti_ql_next_token ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?limit:positive_integer_object ->
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  statement:parti_ql_statement ->
  unit ->
  execute_statement_input
