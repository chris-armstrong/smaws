open Types

val make_put_request : item:put_item_input_attribute_map -> unit -> put_request
val make_delete_request : key:key -> unit -> delete_request

val make_write_request :
  ?delete_request:delete_request -> ?put_request:put_request -> unit -> write_request

val make_warm_throughput :
  ?write_units_per_second:long_object ->
  ?read_units_per_second:long_object ->
  unit ->
  warm_throughput

val make_time_to_live_specification :
  attribute_name:time_to_live_attribute_name ->
  enabled:time_to_live_enabled ->
  unit ->
  time_to_live_specification

val make_update_time_to_live_output :
  ?time_to_live_specification:time_to_live_specification -> unit -> update_time_to_live_output

val make_update_time_to_live_input :
  time_to_live_specification:time_to_live_specification ->
  table_name:table_arn ->
  unit ->
  update_time_to_live_input

val make_auto_scaling_target_tracking_scaling_policy_configuration_description :
  ?scale_out_cooldown:integer_object ->
  ?scale_in_cooldown:integer_object ->
  ?disable_scale_in:boolean_object ->
  target_value:double_object ->
  unit ->
  auto_scaling_target_tracking_scaling_policy_configuration_description

val make_auto_scaling_policy_description :
  ?target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_description ->
  ?policy_name:auto_scaling_policy_name ->
  unit ->
  auto_scaling_policy_description

val make_auto_scaling_settings_description :
  ?scaling_policies:auto_scaling_policy_description_list ->
  ?auto_scaling_role_arn:string_ ->
  ?auto_scaling_disabled:boolean_object ->
  ?maximum_units:positive_long_object ->
  ?minimum_units:positive_long_object ->
  unit ->
  auto_scaling_settings_description

val make_replica_global_secondary_index_auto_scaling_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?index_status:index_status ->
  ?index_name:index_name ->
  unit ->
  replica_global_secondary_index_auto_scaling_description

val make_replica_auto_scaling_description :
  ?replica_status:replica_status ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?global_secondary_indexes:replica_global_secondary_index_auto_scaling_description_list ->
  ?region_name:region_name ->
  unit ->
  replica_auto_scaling_description

val make_table_auto_scaling_description :
  ?replicas:replica_auto_scaling_description_list ->
  ?table_status:table_status ->
  ?table_name:table_name ->
  unit ->
  table_auto_scaling_description

val make_update_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
  unit ->
  update_table_replica_auto_scaling_output

val make_auto_scaling_target_tracking_scaling_policy_configuration_update :
  ?scale_out_cooldown:integer_object ->
  ?scale_in_cooldown:integer_object ->
  ?disable_scale_in:boolean_object ->
  target_value:double_object ->
  unit ->
  auto_scaling_target_tracking_scaling_policy_configuration_update

val make_auto_scaling_policy_update :
  ?policy_name:auto_scaling_policy_name ->
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_update ->
  unit ->
  auto_scaling_policy_update

val make_auto_scaling_settings_update :
  ?scaling_policy_update:auto_scaling_policy_update ->
  ?auto_scaling_role_arn:auto_scaling_role_arn ->
  ?auto_scaling_disabled:boolean_object ->
  ?maximum_units:positive_long_object ->
  ?minimum_units:positive_long_object ->
  unit ->
  auto_scaling_settings_update

val make_global_secondary_index_auto_scaling_update :
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?index_name:index_name ->
  unit ->
  global_secondary_index_auto_scaling_update

val make_replica_global_secondary_index_auto_scaling_update :
  ?provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?index_name:index_name ->
  unit ->
  replica_global_secondary_index_auto_scaling_update

val make_replica_auto_scaling_update :
  ?replica_provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?replica_global_secondary_index_updates:replica_global_secondary_index_auto_scaling_update_list ->
  region_name:region_name ->
  unit ->
  replica_auto_scaling_update

val make_update_table_replica_auto_scaling_input :
  ?replica_updates:replica_auto_scaling_update_list ->
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?global_secondary_index_updates:global_secondary_index_auto_scaling_update_list ->
  table_name:table_arn ->
  unit ->
  update_table_replica_auto_scaling_input

val make_attribute_definition :
  attribute_type:scalar_attribute_type ->
  attribute_name:key_schema_attribute_name ->
  unit ->
  attribute_definition

val make_key_schema_element :
  key_type:key_type -> attribute_name:key_schema_attribute_name -> unit -> key_schema_element

val make_provisioned_throughput_description :
  ?write_capacity_units:non_negative_long_object ->
  ?read_capacity_units:non_negative_long_object ->
  ?number_of_decreases_today:positive_long_object ->
  ?last_decrease_date_time:date ->
  ?last_increase_date_time:date ->
  unit ->
  provisioned_throughput_description

val make_billing_mode_summary :
  ?last_update_to_pay_per_request_date_time:date ->
  ?billing_mode:billing_mode ->
  unit ->
  billing_mode_summary

val make_projection :
  ?non_key_attributes:non_key_attribute_name_list ->
  ?projection_type:projection_type ->
  unit ->
  projection

val make_local_secondary_index_description :
  ?index_arn:string_ ->
  ?item_count:long_object ->
  ?index_size_bytes:long_object ->
  ?projection:projection ->
  ?key_schema:key_schema ->
  ?index_name:index_name ->
  unit ->
  local_secondary_index_description

val make_on_demand_throughput :
  ?max_write_request_units:long_object ->
  ?max_read_request_units:long_object ->
  unit ->
  on_demand_throughput

val make_global_secondary_index_warm_throughput_description :
  ?status:index_status ->
  ?write_units_per_second:positive_long_object ->
  ?read_units_per_second:positive_long_object ->
  unit ->
  global_secondary_index_warm_throughput_description

val make_global_secondary_index_description :
  ?warm_throughput:global_secondary_index_warm_throughput_description ->
  ?on_demand_throughput:on_demand_throughput ->
  ?index_arn:string_ ->
  ?item_count:long_object ->
  ?index_size_bytes:long_object ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?backfilling:backfilling ->
  ?index_status:index_status ->
  ?projection:projection ->
  ?key_schema:key_schema ->
  ?index_name:index_name ->
  unit ->
  global_secondary_index_description

val make_stream_specification :
  ?stream_view_type:stream_view_type ->
  stream_enabled:stream_enabled ->
  unit ->
  stream_specification

val make_provisioned_throughput_override :
  ?read_capacity_units:positive_long_object -> unit -> provisioned_throughput_override

val make_on_demand_throughput_override :
  ?max_read_request_units:long_object -> unit -> on_demand_throughput_override

val make_table_warm_throughput_description :
  ?status:table_status ->
  ?write_units_per_second:positive_long_object ->
  ?read_units_per_second:positive_long_object ->
  unit ->
  table_warm_throughput_description

val make_replica_global_secondary_index_description :
  ?warm_throughput:global_secondary_index_warm_throughput_description ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?index_name:index_name ->
  unit ->
  replica_global_secondary_index_description

val make_table_class_summary :
  ?last_update_date_time:date -> ?table_class:table_class -> unit -> table_class_summary

val make_replica_description :
  ?replica_table_class_summary:table_class_summary ->
  ?replica_inaccessible_date_time:date ->
  ?global_secondary_indexes:replica_global_secondary_index_description_list ->
  ?warm_throughput:table_warm_throughput_description ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:kms_master_key_id ->
  ?replica_status_percent_progress:replica_status_percent_progress ->
  ?replica_status_description:replica_status_description ->
  ?replica_status:replica_status ->
  ?region_name:region_name ->
  unit ->
  replica_description

val make_global_table_witness_description :
  ?witness_status:witness_status ->
  ?region_name:region_name ->
  unit ->
  global_table_witness_description

val make_restore_summary :
  ?source_table_arn:table_arn ->
  ?source_backup_arn:backup_arn ->
  restore_in_progress:restore_in_progress ->
  restore_date_time:date ->
  unit ->
  restore_summary

val make_sse_description :
  ?inaccessible_encryption_date_time:date ->
  ?kms_master_key_arn:kms_master_key_arn ->
  ?sse_type:sse_type ->
  ?status:sse_status ->
  unit ->
  sse_description

val make_archival_summary :
  ?archival_backup_arn:backup_arn ->
  ?archival_reason:archival_reason ->
  ?archival_date_time:date ->
  unit ->
  archival_summary

val make_table_description :
  ?multi_region_consistency:multi_region_consistency ->
  ?warm_throughput:table_warm_throughput_description ->
  ?on_demand_throughput:on_demand_throughput ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?table_class_summary:table_class_summary ->
  ?archival_summary:archival_summary ->
  ?sse_description:sse_description ->
  ?restore_summary:restore_summary ->
  ?global_table_witnesses:global_table_witness_description_list ->
  ?replicas:replica_description_list ->
  ?global_table_version:string_ ->
  ?latest_stream_arn:stream_arn ->
  ?latest_stream_label:string_ ->
  ?stream_specification:stream_specification ->
  ?global_secondary_indexes:global_secondary_index_description_list ->
  ?local_secondary_indexes:local_secondary_index_description_list ->
  ?billing_mode_summary:billing_mode_summary ->
  ?table_id:table_id ->
  ?table_arn:string_ ->
  ?item_count:long_object ->
  ?table_size_bytes:long_object ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?creation_date_time:date ->
  ?table_status:table_status ->
  ?key_schema:key_schema ->
  ?table_name:table_name ->
  ?attribute_definitions:attribute_definitions ->
  unit ->
  table_description

val make_update_table_output : ?table_description:table_description -> unit -> update_table_output

val make_provisioned_throughput :
  write_capacity_units:positive_long_object ->
  read_capacity_units:positive_long_object ->
  unit ->
  provisioned_throughput

val make_update_global_secondary_index_action :
  ?warm_throughput:warm_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  index_name:index_name ->
  unit ->
  update_global_secondary_index_action

val make_create_global_secondary_index_action :
  ?warm_throughput:warm_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  projection:projection ->
  key_schema:key_schema ->
  index_name:index_name ->
  unit ->
  create_global_secondary_index_action

val make_delete_global_secondary_index_action :
  index_name:index_name -> unit -> delete_global_secondary_index_action

val make_global_secondary_index_update :
  ?delete:delete_global_secondary_index_action ->
  ?create:create_global_secondary_index_action ->
  ?update:update_global_secondary_index_action ->
  unit ->
  global_secondary_index_update

val make_sse_specification :
  ?kms_master_key_id:kms_master_key_id ->
  ?sse_type:sse_type ->
  ?enabled:sse_enabled ->
  unit ->
  sse_specification

val make_replica_global_secondary_index :
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index

val make_create_replication_group_member_action :
  ?table_class_override:table_class ->
  ?global_secondary_indexes:replica_global_secondary_index_list ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:kms_master_key_id ->
  region_name:region_name ->
  unit ->
  create_replication_group_member_action

val make_update_replication_group_member_action :
  ?table_class_override:table_class ->
  ?global_secondary_indexes:replica_global_secondary_index_list ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:kms_master_key_id ->
  region_name:region_name ->
  unit ->
  update_replication_group_member_action

val make_delete_replication_group_member_action :
  region_name:region_name -> unit -> delete_replication_group_member_action

val make_replication_group_update :
  ?delete:delete_replication_group_member_action ->
  ?update:update_replication_group_member_action ->
  ?create:create_replication_group_member_action ->
  unit ->
  replication_group_update

val make_create_global_table_witness_group_member_action :
  region_name:region_name -> unit -> create_global_table_witness_group_member_action

val make_delete_global_table_witness_group_member_action :
  region_name:region_name -> unit -> delete_global_table_witness_group_member_action

val make_global_table_witness_group_update :
  ?delete:delete_global_table_witness_group_member_action ->
  ?create:create_global_table_witness_group_member_action ->
  unit ->
  global_table_witness_group_update

val make_update_table_input :
  ?warm_throughput:warm_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?global_table_witness_updates:global_table_witness_group_update_list ->
  ?multi_region_consistency:multi_region_consistency ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?table_class:table_class ->
  ?replica_updates:replication_group_update_list ->
  ?sse_specification:sse_specification ->
  ?stream_specification:stream_specification ->
  ?global_secondary_index_updates:global_secondary_index_update_list ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  ?attribute_definitions:attribute_definitions ->
  table_name:table_arn ->
  unit ->
  update_table_input

val make_update_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit ->
  update_kinesis_streaming_configuration

val make_update_kinesis_streaming_destination_output :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  ?destination_status:destination_status ->
  ?stream_arn:stream_arn ->
  ?table_name:table_name ->
  unit ->
  update_kinesis_streaming_destination_output

val make_update_kinesis_streaming_destination_input :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  stream_arn:stream_arn ->
  table_name:table_arn ->
  unit ->
  update_kinesis_streaming_destination_input

val make_capacity :
  ?capacity_units:consumed_capacity_units ->
  ?write_capacity_units:consumed_capacity_units ->
  ?read_capacity_units:consumed_capacity_units ->
  unit ->
  capacity

val make_consumed_capacity :
  ?global_secondary_indexes:secondary_indexes_capacity_map ->
  ?local_secondary_indexes:secondary_indexes_capacity_map ->
  ?table:capacity ->
  ?write_capacity_units:consumed_capacity_units ->
  ?read_capacity_units:consumed_capacity_units ->
  ?capacity_units:consumed_capacity_units ->
  ?table_name:table_arn ->
  unit ->
  consumed_capacity

val make_item_collection_metrics :
  ?size_estimate_range_g_b:item_collection_size_estimate_range ->
  ?item_collection_key:item_collection_key_attribute_map ->
  unit ->
  item_collection_metrics

val make_update_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:attribute_map ->
  unit ->
  update_item_output

val make_attribute_value_update :
  ?action:attribute_action -> ?value:attribute_value -> unit -> attribute_value_update

val make_expected_attribute_value :
  ?attribute_value_list:attribute_value_list ->
  ?comparison_operator:comparison_operator ->
  ?exists:boolean_object ->
  ?value:attribute_value ->
  unit ->
  expected_attribute_value

val make_update_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  ?update_expression:update_expression ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?conditional_operator:conditional_operator ->
  ?expected:expected_attribute_map ->
  ?attribute_updates:attribute_updates ->
  key:key ->
  table_name:table_arn ->
  unit ->
  update_item_input

val make_replica_global_secondary_index_settings_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_write_capacity_units:positive_long_object ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_read_capacity_units:positive_long_object ->
  ?index_status:index_status ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index_settings_description

val make_replica_settings_description :
  ?replica_table_class_summary:table_class_summary ->
  ?replica_global_secondary_index_settings:replica_global_secondary_index_settings_description_list ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_write_capacity_units:non_negative_long_object ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_read_capacity_units:non_negative_long_object ->
  ?replica_billing_mode_summary:billing_mode_summary ->
  ?replica_status:replica_status ->
  region_name:region_name ->
  unit ->
  replica_settings_description

val make_update_global_table_settings_output :
  ?replica_settings:replica_settings_description_list ->
  ?global_table_name:table_name ->
  unit ->
  update_global_table_settings_output

val make_global_table_global_secondary_index_settings_update :
  ?provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?provisioned_write_capacity_units:positive_long_object ->
  index_name:index_name ->
  unit ->
  global_table_global_secondary_index_settings_update

val make_replica_global_secondary_index_settings_update :
  ?provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?provisioned_read_capacity_units:positive_long_object ->
  index_name:index_name ->
  unit ->
  replica_global_secondary_index_settings_update

val make_replica_settings_update :
  ?replica_table_class:table_class ->
  ?replica_global_secondary_index_settings_update:
    replica_global_secondary_index_settings_update_list ->
  ?replica_provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?replica_provisioned_read_capacity_units:positive_long_object ->
  region_name:region_name ->
  unit ->
  replica_settings_update

val make_update_global_table_settings_input :
  ?replica_settings_update:replica_settings_update_list ->
  ?global_table_global_secondary_index_settings_update:
    global_table_global_secondary_index_settings_update_list ->
  ?global_table_provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?global_table_provisioned_write_capacity_units:positive_long_object ->
  ?global_table_billing_mode:billing_mode ->
  global_table_name:table_name ->
  unit ->
  update_global_table_settings_input

val make_global_table_description :
  ?global_table_name:table_name ->
  ?global_table_status:global_table_status ->
  ?creation_date_time:date ->
  ?global_table_arn:global_table_arn_string ->
  ?replication_group:replica_description_list ->
  unit ->
  global_table_description

val make_update_global_table_output :
  ?global_table_description:global_table_description -> unit -> update_global_table_output

val make_create_replica_action : region_name:region_name -> unit -> create_replica_action
val make_delete_replica_action : region_name:region_name -> unit -> delete_replica_action

val make_replica_update :
  ?delete:delete_replica_action -> ?create:create_replica_action -> unit -> replica_update

val make_update_global_table_input :
  replica_updates:replica_update_list ->
  global_table_name:table_name ->
  unit ->
  update_global_table_input

val make_update_contributor_insights_output :
  ?contributor_insights_status:contributor_insights_status ->
  ?index_name:index_name ->
  ?table_name:table_name ->
  unit ->
  update_contributor_insights_output

val make_update_contributor_insights_input :
  ?index_name:index_name ->
  contributor_insights_action:contributor_insights_action ->
  table_name:table_arn ->
  unit ->
  update_contributor_insights_input

val make_point_in_time_recovery_description :
  ?latest_restorable_date_time:date ->
  ?earliest_restorable_date_time:date ->
  ?recovery_period_in_days:recovery_period_in_days ->
  ?point_in_time_recovery_status:point_in_time_recovery_status ->
  unit ->
  point_in_time_recovery_description

val make_continuous_backups_description :
  ?point_in_time_recovery_description:point_in_time_recovery_description ->
  continuous_backups_status:continuous_backups_status ->
  unit ->
  continuous_backups_description

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
  point_in_time_recovery_specification:point_in_time_recovery_specification ->
  table_name:table_arn ->
  unit ->
  update_continuous_backups_input

val make_update :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  table_name:table_arn ->
  update_expression:update_expression ->
  key:key ->
  unit ->
  update

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:resource_arn_string -> unit -> untag_resource_input

val make_cancellation_reason :
  ?message:error_message -> ?code:code -> ?item:attribute_map -> unit -> cancellation_reason

val make_transact_write_items_output :
  ?item_collection_metrics:item_collection_metrics_per_table ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  transact_write_items_output

val make_condition_check :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  condition_expression:condition_expression ->
  table_name:table_arn ->
  key:key ->
  unit ->
  condition_check

val make_put :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  table_name:table_arn ->
  item:put_item_input_attribute_map ->
  unit ->
  put

val make_delete :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  table_name:table_arn ->
  key:key ->
  unit ->
  delete

val make_transact_write_item :
  ?update:update ->
  ?delete:delete ->
  ?put:put ->
  ?condition_check:condition_check ->
  unit ->
  transact_write_item

val make_transact_write_items_input :
  ?client_request_token:client_request_token ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_items:transact_write_item_list ->
  unit ->
  transact_write_items_input

val make_item_response : ?item:attribute_map -> unit -> item_response

val make_transact_get_items_output :
  ?responses:item_response_list ->
  ?consumed_capacity:consumed_capacity_multiple ->
  unit ->
  transact_get_items_output

val make_get :
  ?expression_attribute_names:expression_attribute_name_map ->
  ?projection_expression:projection_expression ->
  table_name:table_arn ->
  key:key ->
  unit ->
  get

val make_transact_get_item : get:get -> unit -> transact_get_item

val make_transact_get_items_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_items:transact_get_item_list ->
  unit ->
  transact_get_items_input

val make_time_to_live_description :
  ?attribute_name:time_to_live_attribute_name ->
  ?time_to_live_status:time_to_live_status ->
  unit ->
  time_to_live_description

val make_tag : value:tag_value_string -> key:tag_key_string -> unit -> tag

val make_tag_resource_input :
  tags:tag_list -> resource_arn:resource_arn_string -> unit -> tag_resource_input

val make_global_secondary_index :
  ?warm_throughput:warm_throughput ->
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  projection:projection ->
  key_schema:key_schema ->
  index_name:index_name ->
  unit ->
  global_secondary_index

val make_table_creation_parameters :
  ?global_secondary_indexes:global_secondary_index_list ->
  ?sse_specification:sse_specification ->
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  key_schema:key_schema ->
  attribute_definitions:attribute_definitions ->
  table_name:table_name ->
  unit ->
  table_creation_parameters

val make_local_secondary_index_info :
  ?projection:projection ->
  ?key_schema:key_schema ->
  ?index_name:index_name ->
  unit ->
  local_secondary_index_info

val make_global_secondary_index_info :
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  ?projection:projection ->
  ?key_schema:key_schema ->
  ?index_name:index_name ->
  unit ->
  global_secondary_index_info

val make_source_table_feature_details :
  ?sse_description:sse_description ->
  ?time_to_live_description:time_to_live_description ->
  ?stream_description:stream_specification ->
  ?global_secondary_indexes:global_secondary_indexes ->
  ?local_secondary_indexes:local_secondary_indexes ->
  unit ->
  source_table_feature_details

val make_source_table_details :
  ?billing_mode:billing_mode ->
  ?item_count:item_count ->
  ?on_demand_throughput:on_demand_throughput ->
  ?table_size_bytes:long_object ->
  ?table_arn:table_arn ->
  provisioned_throughput:provisioned_throughput ->
  table_creation_date_time:table_creation_date_time ->
  key_schema:key_schema ->
  table_id:table_id ->
  table_name:table_name ->
  unit ->
  source_table_details

val make_scan_output :
  ?consumed_capacity:consumed_capacity ->
  ?last_evaluated_key:key ->
  ?scanned_count:integer ->
  ?count:integer ->
  ?items:item_list ->
  unit ->
  scan_output

val make_condition :
  ?attribute_value_list:attribute_value_list ->
  comparison_operator:comparison_operator ->
  unit ->
  condition

val make_scan_input :
  ?consistent_read:consistent_read ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?filter_expression:condition_expression ->
  ?projection_expression:projection_expression ->
  ?segment:scan_segment ->
  ?total_segments:scan_total_segments ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?exclusive_start_key:key ->
  ?conditional_operator:conditional_operator ->
  ?scan_filter:filter_condition_map ->
  ?select:select ->
  ?limit:positive_integer_object ->
  ?attributes_to_get:attribute_name_list ->
  ?index_name:index_name ->
  table_name:table_arn ->
  unit ->
  scan_input

val make_s3_bucket_source :
  ?s3_key_prefix:s3_prefix ->
  ?s3_bucket_owner:s3_bucket_owner ->
  s3_bucket:s3_bucket ->
  unit ->
  s3_bucket_source

val make_restore_table_to_point_in_time_output :
  ?table_description:table_description -> unit -> restore_table_to_point_in_time_output

val make_local_secondary_index :
  projection:projection ->
  key_schema:key_schema ->
  index_name:index_name ->
  unit ->
  local_secondary_index

val make_restore_table_to_point_in_time_input :
  ?sse_specification_override:sse_specification ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?local_secondary_index_override:local_secondary_index_list ->
  ?global_secondary_index_override:global_secondary_index_list ->
  ?billing_mode_override:billing_mode ->
  ?restore_date_time:date ->
  ?use_latest_restorable_time:boolean_object ->
  ?source_table_name:table_name ->
  ?source_table_arn:table_arn ->
  target_table_name:table_name ->
  unit ->
  restore_table_to_point_in_time_input

val make_restore_table_from_backup_output :
  ?table_description:table_description -> unit -> restore_table_from_backup_output

val make_restore_table_from_backup_input :
  ?sse_specification_override:sse_specification ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?local_secondary_index_override:local_secondary_index_list ->
  ?global_secondary_index_override:global_secondary_index_list ->
  ?billing_mode_override:billing_mode ->
  backup_arn:backup_arn ->
  target_table_name:table_name ->
  unit ->
  restore_table_from_backup_input

val make_replica : ?region_name:region_name -> unit -> replica

val make_query_output :
  ?consumed_capacity:consumed_capacity ->
  ?last_evaluated_key:key ->
  ?scanned_count:integer ->
  ?count:integer ->
  ?items:item_list ->
  unit ->
  query_output

val make_query_input :
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?key_condition_expression:key_expression ->
  ?filter_expression:condition_expression ->
  ?projection_expression:projection_expression ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?exclusive_start_key:key ->
  ?scan_index_forward:boolean_object ->
  ?conditional_operator:conditional_operator ->
  ?query_filter:filter_condition_map ->
  ?key_conditions:key_conditions ->
  ?consistent_read:consistent_read ->
  ?limit:positive_integer_object ->
  ?attributes_to_get:attribute_name_list ->
  ?select:select ->
  ?index_name:index_name ->
  table_name:table_arn ->
  unit ->
  query_input

val make_put_resource_policy_output :
  ?revision_id:policy_revision_id -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  ?confirm_remove_self_resource_access:confirm_remove_self_resource_access ->
  ?expected_revision_id:policy_revision_id ->
  policy:resource_policy ->
  resource_arn:resource_arn_string ->
  unit ->
  put_resource_policy_input

val make_put_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:attribute_map ->
  unit ->
  put_item_output

val make_put_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  ?conditional_operator:conditional_operator ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?expected:expected_attribute_map ->
  item:put_item_input_attribute_map ->
  table_name:table_arn ->
  unit ->
  put_item_input

val make_batch_statement_error :
  ?item:attribute_map ->
  ?message:string_ ->
  ?code:batch_statement_error_code_enum ->
  unit ->
  batch_statement_error

val make_batch_statement_response :
  ?item:attribute_map ->
  ?table_name:table_name ->
  ?error:batch_statement_error ->
  unit ->
  batch_statement_response

val make_batch_statement_request :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?consistent_read:consistent_read ->
  ?parameters:prepared_statement_parameters ->
  statement:parti_ql_statement ->
  unit ->
  batch_statement_request

val make_parameterized_statement :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?parameters:prepared_statement_parameters ->
  statement:parti_ql_statement ->
  unit ->
  parameterized_statement

val make_list_tags_of_resource_output :
  ?next_token:next_token_string -> ?tags:tag_list -> unit -> list_tags_of_resource_output

val make_list_tags_of_resource_input :
  ?next_token:next_token_string ->
  resource_arn:resource_arn_string ->
  unit ->
  list_tags_of_resource_input

val make_list_tables_output :
  ?last_evaluated_table_name:table_name ->
  ?table_names:table_name_list ->
  unit ->
  list_tables_output

val make_list_tables_input :
  ?limit:list_tables_input_limit ->
  ?exclusive_start_table_name:table_name ->
  unit ->
  list_tables_input

val make_import_summary :
  ?end_time:import_end_time ->
  ?start_time:import_start_time ->
  ?input_format:input_format ->
  ?cloud_watch_log_group_arn:cloud_watch_log_group_arn ->
  ?s3_bucket_source:s3_bucket_source ->
  ?table_arn:table_arn ->
  ?import_status:import_status ->
  ?import_arn:import_arn ->
  unit ->
  import_summary

val make_list_imports_output :
  ?next_token:import_next_token ->
  ?import_summary_list:import_summary_list ->
  unit ->
  list_imports_output

val make_list_imports_input :
  ?next_token:import_next_token ->
  ?page_size:list_imports_max_limit ->
  ?table_arn:table_arn ->
  unit ->
  list_imports_input

val make_global_table :
  ?replication_group:replica_list -> ?global_table_name:table_name -> unit -> global_table

val make_list_global_tables_output :
  ?last_evaluated_global_table_name:table_name ->
  ?global_tables:global_table_list ->
  unit ->
  list_global_tables_output

val make_list_global_tables_input :
  ?region_name:region_name ->
  ?limit:positive_integer_object ->
  ?exclusive_start_global_table_name:table_name ->
  unit ->
  list_global_tables_input

val make_export_summary :
  ?export_type:export_type ->
  ?export_status:export_status ->
  ?export_arn:export_arn ->
  unit ->
  export_summary

val make_list_exports_output :
  ?next_token:export_next_token -> ?export_summaries:export_summaries -> unit -> list_exports_output

val make_list_exports_input :
  ?next_token:export_next_token ->
  ?max_results:list_exports_max_limit ->
  ?table_arn:table_arn ->
  unit ->
  list_exports_input

val make_contributor_insights_summary :
  ?contributor_insights_status:contributor_insights_status ->
  ?index_name:index_name ->
  ?table_name:table_name ->
  unit ->
  contributor_insights_summary

val make_list_contributor_insights_output :
  ?next_token:next_token_string ->
  ?contributor_insights_summaries:contributor_insights_summaries ->
  unit ->
  list_contributor_insights_output

val make_list_contributor_insights_input :
  ?max_results:list_contributor_insights_limit ->
  ?next_token:next_token_string ->
  ?table_name:table_arn ->
  unit ->
  list_contributor_insights_input

val make_backup_summary :
  ?backup_size_bytes:backup_size_bytes ->
  ?backup_type:backup_type ->
  ?backup_status:backup_status ->
  ?backup_expiry_date_time:date ->
  ?backup_creation_date_time:backup_creation_date_time ->
  ?backup_name:backup_name ->
  ?backup_arn:backup_arn ->
  ?table_arn:table_arn ->
  ?table_id:table_id ->
  ?table_name:table_name ->
  unit ->
  backup_summary

val make_list_backups_output :
  ?last_evaluated_backup_arn:backup_arn ->
  ?backup_summaries:backup_summaries ->
  unit ->
  list_backups_output

val make_list_backups_input :
  ?backup_type:backup_type_filter ->
  ?exclusive_start_backup_arn:backup_arn ->
  ?time_range_upper_bound:time_range_upper_bound ->
  ?time_range_lower_bound:time_range_lower_bound ->
  ?limit:backups_input_limit ->
  ?table_name:table_arn ->
  unit ->
  list_backups_input

val make_enable_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit ->
  enable_kinesis_streaming_configuration

val make_kinesis_streaming_destination_output :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  ?destination_status:destination_status ->
  ?stream_arn:stream_arn ->
  ?table_name:table_name ->
  unit ->
  kinesis_streaming_destination_output

val make_kinesis_streaming_destination_input :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  stream_arn:stream_arn ->
  table_name:table_arn ->
  unit ->
  kinesis_streaming_destination_input

val make_kinesis_data_stream_destination :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  ?destination_status_description:string_ ->
  ?destination_status:destination_status ->
  ?stream_arn:stream_arn ->
  unit ->
  kinesis_data_stream_destination

val make_keys_and_attributes :
  ?expression_attribute_names:expression_attribute_name_map ->
  ?projection_expression:projection_expression ->
  ?consistent_read:consistent_read ->
  ?attributes_to_get:attribute_name_list ->
  keys:key_list ->
  unit ->
  keys_and_attributes

val make_csv_options :
  ?header_list:csv_header_list -> ?delimiter:csv_delimiter -> unit -> csv_options

val make_input_format_options : ?csv:csv_options -> unit -> input_format_options

val make_incremental_export_specification :
  ?export_view_type:export_view_type ->
  ?export_to_time:export_to_time ->
  ?export_from_time:export_from_time ->
  unit ->
  incremental_export_specification

val make_import_table_description :
  ?failure_message:failure_message ->
  ?failure_code:failure_code ->
  ?imported_item_count:imported_item_count ->
  ?processed_item_count:processed_item_count ->
  ?processed_size_bytes:long_object ->
  ?end_time:import_end_time ->
  ?start_time:import_start_time ->
  ?table_creation_parameters:table_creation_parameters ->
  ?input_compression_type:input_compression_type ->
  ?input_format_options:input_format_options ->
  ?input_format:input_format ->
  ?cloud_watch_log_group_arn:cloud_watch_log_group_arn ->
  ?error_count:error_count ->
  ?s3_bucket_source:s3_bucket_source ->
  ?client_token:client_token ->
  ?table_id:table_id ->
  ?table_arn:table_arn ->
  ?import_status:import_status ->
  ?import_arn:import_arn ->
  unit ->
  import_table_description

val make_import_table_output :
  import_table_description:import_table_description -> unit -> import_table_output

val make_import_table_input :
  ?input_compression_type:input_compression_type ->
  ?input_format_options:input_format_options ->
  ?client_token:client_token ->
  table_creation_parameters:table_creation_parameters ->
  input_format:input_format ->
  s3_bucket_source:s3_bucket_source ->
  unit ->
  import_table_input

val make_get_resource_policy_output :
  ?revision_id:policy_revision_id -> ?policy:resource_policy -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  resource_arn:resource_arn_string -> unit -> get_resource_policy_input

val make_get_item_output :
  ?consumed_capacity:consumed_capacity -> ?item:attribute_map -> unit -> get_item_output

val make_get_item_input :
  ?expression_attribute_names:expression_attribute_name_map ->
  ?projection_expression:projection_expression ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?consistent_read:consistent_read ->
  ?attributes_to_get:attribute_name_list ->
  key:key ->
  table_name:table_arn ->
  unit ->
  get_item_input

val make_failure_exception :
  ?exception_description:exception_description ->
  ?exception_name:exception_name ->
  unit ->
  failure_exception

val make_export_description :
  ?incremental_export_specification:incremental_export_specification ->
  ?export_type:export_type ->
  ?item_count:item_count ->
  ?billed_size_bytes:billed_size_bytes ->
  ?export_format:export_format ->
  ?failure_message:failure_message ->
  ?failure_code:failure_code ->
  ?s3_sse_kms_key_id:s3_sse_kms_key_id ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_prefix:s3_prefix ->
  ?s3_bucket_owner:s3_bucket_owner ->
  ?s3_bucket:s3_bucket ->
  ?client_token:client_token ->
  ?export_time:export_time ->
  ?table_id:table_id ->
  ?table_arn:table_arn ->
  ?export_manifest:export_manifest ->
  ?end_time:export_end_time ->
  ?start_time:export_start_time ->
  ?export_status:export_status ->
  ?export_arn:export_arn ->
  unit ->
  export_description

val make_export_table_to_point_in_time_output :
  ?export_description:export_description -> unit -> export_table_to_point_in_time_output

val make_export_table_to_point_in_time_input :
  ?incremental_export_specification:incremental_export_specification ->
  ?export_type:export_type ->
  ?export_format:export_format ->
  ?s3_sse_kms_key_id:s3_sse_kms_key_id ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_prefix:s3_prefix ->
  ?s3_bucket_owner:s3_bucket_owner ->
  ?client_token:client_token ->
  ?export_time:export_time ->
  s3_bucket:s3_bucket ->
  table_arn:table_arn ->
  unit ->
  export_table_to_point_in_time_input

val make_execute_transaction_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?responses:item_response_list ->
  unit ->
  execute_transaction_output

val make_execute_transaction_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  ?client_request_token:client_request_token ->
  transact_statements:parameterized_statements ->
  unit ->
  execute_transaction_input

val make_execute_statement_output :
  ?last_evaluated_key:key ->
  ?consumed_capacity:consumed_capacity ->
  ?next_token:parti_ql_next_token ->
  ?items:item_list ->
  unit ->
  execute_statement_output

val make_execute_statement_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?limit:positive_integer_object ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?next_token:parti_ql_next_token ->
  ?consistent_read:consistent_read ->
  ?parameters:prepared_statement_parameters ->
  statement:parti_ql_statement ->
  unit ->
  execute_statement_input

val make_endpoint : cache_period_in_minutes:long -> address:string_ -> unit -> endpoint

val make_describe_time_to_live_output :
  ?time_to_live_description:time_to_live_description -> unit -> describe_time_to_live_output

val make_describe_time_to_live_input : table_name:table_arn -> unit -> describe_time_to_live_input

val make_describe_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description ->
  unit ->
  describe_table_replica_auto_scaling_output

val make_describe_table_replica_auto_scaling_input :
  table_name:table_arn -> unit -> describe_table_replica_auto_scaling_input

val make_describe_table_output : ?table:table_description -> unit -> describe_table_output
val make_describe_table_input : table_name:table_arn -> unit -> describe_table_input

val make_describe_limits_output :
  ?table_max_write_capacity_units:positive_long_object ->
  ?table_max_read_capacity_units:positive_long_object ->
  ?account_max_write_capacity_units:positive_long_object ->
  ?account_max_read_capacity_units:positive_long_object ->
  unit ->
  describe_limits_output

val make_describe_limits_input : unit -> unit

val make_describe_kinesis_streaming_destination_output :
  ?kinesis_data_stream_destinations:kinesis_data_stream_destinations ->
  ?table_name:table_name ->
  unit ->
  describe_kinesis_streaming_destination_output

val make_describe_kinesis_streaming_destination_input :
  table_name:table_arn -> unit -> describe_kinesis_streaming_destination_input

val make_describe_import_output :
  import_table_description:import_table_description -> unit -> describe_import_output

val make_describe_import_input : import_arn:import_arn -> unit -> describe_import_input

val make_describe_global_table_settings_output :
  ?replica_settings:replica_settings_description_list ->
  ?global_table_name:table_name ->
  unit ->
  describe_global_table_settings_output

val make_describe_global_table_settings_input :
  global_table_name:table_name -> unit -> describe_global_table_settings_input

val make_describe_global_table_output :
  ?global_table_description:global_table_description -> unit -> describe_global_table_output

val make_describe_global_table_input :
  global_table_name:table_name -> unit -> describe_global_table_input

val make_describe_export_output :
  ?export_description:export_description -> unit -> describe_export_output

val make_describe_export_input : export_arn:export_arn -> unit -> describe_export_input
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit

val make_describe_contributor_insights_output :
  ?failure_exception:failure_exception ->
  ?last_update_date_time:last_update_date_time ->
  ?contributor_insights_status:contributor_insights_status ->
  ?contributor_insights_rule_list:contributor_insights_rule_list ->
  ?index_name:index_name ->
  ?table_name:table_name ->
  unit ->
  describe_contributor_insights_output

val make_describe_contributor_insights_input :
  ?index_name:index_name -> table_name:table_arn -> unit -> describe_contributor_insights_input

val make_describe_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description ->
  unit ->
  describe_continuous_backups_output

val make_describe_continuous_backups_input :
  table_name:table_arn -> unit -> describe_continuous_backups_input

val make_backup_details :
  ?backup_expiry_date_time:date ->
  ?backup_size_bytes:backup_size_bytes ->
  backup_creation_date_time:backup_creation_date_time ->
  backup_type:backup_type ->
  backup_status:backup_status ->
  backup_name:backup_name ->
  backup_arn:backup_arn ->
  unit ->
  backup_details

val make_backup_description :
  ?source_table_feature_details:source_table_feature_details ->
  ?source_table_details:source_table_details ->
  ?backup_details:backup_details ->
  unit ->
  backup_description

val make_describe_backup_output :
  ?backup_description:backup_description -> unit -> describe_backup_output

val make_describe_backup_input : backup_arn:backup_arn -> unit -> describe_backup_input
val make_delete_table_output : ?table_description:table_description -> unit -> delete_table_output
val make_delete_table_input : table_name:table_arn -> unit -> delete_table_input

val make_delete_resource_policy_output :
  ?revision_id:policy_revision_id -> unit -> delete_resource_policy_output

val make_delete_resource_policy_input :
  ?expected_revision_id:policy_revision_id ->
  resource_arn:resource_arn_string ->
  unit ->
  delete_resource_policy_input

val make_delete_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:attribute_map ->
  unit ->
  delete_item_output

val make_delete_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:expression_attribute_value_map ->
  ?expression_attribute_names:expression_attribute_name_map ->
  ?condition_expression:condition_expression ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?conditional_operator:conditional_operator ->
  ?expected:expected_attribute_map ->
  key:key ->
  table_name:table_arn ->
  unit ->
  delete_item_input

val make_delete_backup_output :
  ?backup_description:backup_description -> unit -> delete_backup_output

val make_delete_backup_input : backup_arn:backup_arn -> unit -> delete_backup_input
val make_create_table_output : ?table_description:table_description -> unit -> create_table_output

val make_create_table_input :
  ?on_demand_throughput:on_demand_throughput ->
  ?resource_policy:resource_policy ->
  ?warm_throughput:warm_throughput ->
  ?deletion_protection_enabled:deletion_protection_enabled ->
  ?table_class:table_class ->
  ?tags:tag_list ->
  ?sse_specification:sse_specification ->
  ?stream_specification:stream_specification ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  ?global_secondary_indexes:global_secondary_index_list ->
  ?local_secondary_indexes:local_secondary_index_list ->
  key_schema:key_schema ->
  table_name:table_arn ->
  attribute_definitions:attribute_definitions ->
  unit ->
  create_table_input

val make_create_global_table_output :
  ?global_table_description:global_table_description -> unit -> create_global_table_output

val make_create_global_table_input :
  replication_group:replica_list ->
  global_table_name:table_name ->
  unit ->
  create_global_table_input

val make_create_backup_output : ?backup_details:backup_details -> unit -> create_backup_output

val make_create_backup_input :
  backup_name:backup_name -> table_name:table_arn -> unit -> create_backup_input

val make_batch_write_item_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?item_collection_metrics:item_collection_metrics_per_table ->
  ?unprocessed_items:batch_write_item_request_map ->
  unit ->
  batch_write_item_output

val make_batch_write_item_input :
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  request_items:batch_write_item_request_map ->
  unit ->
  batch_write_item_input

val make_batch_get_item_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?unprocessed_keys:batch_get_request_map ->
  ?responses:batch_get_response_map ->
  unit ->
  batch_get_item_output

val make_batch_get_item_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  request_items:batch_get_request_map ->
  unit ->
  batch_get_item_input

val make_batch_execute_statement_output :
  ?consumed_capacity:consumed_capacity_multiple ->
  ?responses:parti_ql_batch_response ->
  unit ->
  batch_execute_statement_output

val make_batch_execute_statement_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  statements:parti_ql_batch_request ->
  unit ->
  batch_execute_statement_input
