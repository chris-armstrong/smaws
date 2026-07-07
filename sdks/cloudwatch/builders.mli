open Types

val make_wall_clock_window : ?timezone:timezone -> unit -> wall_clock_window
val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_input :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_input

val make_stop_o_tel_enrichment_output : unit -> unit
val make_stop_o_tel_enrichment_input : unit -> unit
val make_stop_metric_streams_output : unit -> unit
val make_stop_metric_streams_input : names:metric_stream_names -> unit -> stop_metric_streams_input

val make_statistic_set :
  maximum:datapoint_value ->
  minimum:datapoint_value ->
  sum:datapoint_value ->
  sample_count:datapoint_value ->
  unit ->
  statistic_set

val make_start_o_tel_enrichment_output : unit -> unit
val make_start_o_tel_enrichment_input : unit -> unit
val make_start_metric_streams_output : unit -> unit

val make_start_metric_streams_input :
  names:metric_stream_names -> unit -> start_metric_streams_input

val make_sliding_window : unit -> unit
val make_dimension : value:dimension_value -> name:dimension_name -> unit -> dimension

val make_single_metric_anomaly_detector :
  ?stat:anomaly_detector_metric_stat ->
  ?dimensions:dimensions ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  ?account_id:account_id ->
  unit ->
  single_metric_anomaly_detector

val make_set_alarm_state_input :
  ?state_reason_data:state_reason_data ->
  state_reason:state_reason ->
  state_value:state_value ->
  alarm_name:alarm_name ->
  unit ->
  set_alarm_state_input

val make_schedule_configuration :
  ?end_time_offset:end_time_offset ->
  ?start_time_offset:start_time_offset ->
  schedule_expression:schedule_expression ->
  unit ->
  schedule_configuration

val make_scheduled_query_configuration :
  ?tags:tag_list ->
  ?query_ar_n:amazon_resource_name ->
  ?log_group_identifiers:log_group_identifiers ->
  aggregation_expression:aggregation_expression ->
  schedule_configuration:schedule_configuration ->
  scheduled_query_role_ar_n:amazon_resource_name ->
  query_string:query_string ->
  unit ->
  scheduled_query_configuration

val make_schedule :
  ?timezone:timezone -> duration:duration -> expression:expression -> unit -> schedule

val make_rule : schedule:schedule -> unit -> rule
val make_range : end_time:timestamp -> start_time:timestamp -> unit -> range
val make_put_metric_stream_output : ?arn:amazon_resource_name -> unit -> put_metric_stream_output

val make_metric_stream_filter :
  ?metric_names:metric_stream_filter_metric_names ->
  ?namespace:namespace ->
  unit ->
  metric_stream_filter

val make_metric_stream_statistics_metric :
  metric_name:metric_name -> namespace:namespace -> unit -> metric_stream_statistics_metric

val make_metric_stream_statistics_configuration :
  additional_statistics:metric_stream_statistics_additional_statistics ->
  include_metrics:metric_stream_statistics_include_metrics ->
  unit ->
  metric_stream_statistics_configuration

val make_put_metric_stream_input :
  ?include_linked_accounts_metrics:include_linked_accounts_metrics ->
  ?statistics_configurations:metric_stream_statistics_configurations ->
  ?tags:tag_list ->
  ?exclude_filters:metric_stream_filters ->
  ?include_filters:metric_stream_filters ->
  output_format:metric_stream_output_format ->
  role_arn:amazon_resource_name ->
  firehose_arn:amazon_resource_name ->
  name:metric_stream_name ->
  unit ->
  put_metric_stream_input

val make_metric_datum :
  ?storage_resolution:storage_resolution ->
  ?unit_:standard_unit ->
  ?counts:counts ->
  ?values:values ->
  ?statistic_values:statistic_set ->
  ?value:datapoint_value ->
  ?timestamp:timestamp ->
  ?dimensions:dimensions ->
  metric_name:metric_name ->
  unit ->
  metric_datum

val make_entity :
  ?attributes:entity_attributes_map -> ?key_attributes:entity_key_attributes_map -> unit -> entity

val make_entity_metric_data :
  ?metric_data:metric_data -> ?entity:entity -> unit -> entity_metric_data

val make_put_metric_data_input :
  ?strict_entity_validation:strict_entity_validation ->
  ?entity_metric_data:entity_metric_data_list ->
  ?metric_data:metric_data ->
  namespace:namespace ->
  unit ->
  put_metric_data_input

val make_metric :
  ?dimensions:dimensions -> ?metric_name:metric_name -> ?namespace:namespace -> unit -> metric

val make_metric_stat :
  ?unit_:standard_unit -> stat:stat -> period:period -> metric:metric -> unit -> metric_stat

val make_metric_data_query :
  ?account_id:account_id ->
  ?period:period ->
  ?return_data:return_data ->
  ?label:metric_label ->
  ?expression:metric_expression ->
  ?metric_stat:metric_stat ->
  id:metric_id ->
  unit ->
  metric_data_query

val make_alarm_prom_ql_criteria :
  ?recovery_period:recovery_period ->
  ?pending_period:pending_period ->
  query:query ->
  unit ->
  alarm_prom_ql_criteria

val make_put_metric_alarm_input :
  ?evaluation_interval:evaluation_interval ->
  ?evaluation_criteria:evaluation_criteria ->
  ?evaluation_window:evaluation_window ->
  ?threshold_metric_id:metric_id ->
  ?tags:tag_list ->
  ?metrics:metric_data_queries ->
  ?evaluate_low_sample_count_percentile:evaluate_low_sample_count_percentile ->
  ?treat_missing_data:treat_missing_data ->
  ?comparison_operator:comparison_operator ->
  ?threshold:threshold ->
  ?datapoints_to_alarm:datapoints_to_alarm ->
  ?evaluation_periods:evaluation_periods ->
  ?unit_:standard_unit ->
  ?period:period ->
  ?dimensions:dimensions ->
  ?extended_statistic:extended_statistic ->
  ?statistic:statistic ->
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  ?alarm_description:alarm_description ->
  alarm_name:alarm_name ->
  unit ->
  put_metric_alarm_input

val make_partial_failure :
  ?failure_description:failure_description ->
  ?failure_code:failure_code ->
  ?exception_type:exception_type ->
  ?failure_resource:failure_resource ->
  unit ->
  partial_failure

val make_put_managed_insight_rules_output :
  ?failures:batch_failures -> unit -> put_managed_insight_rules_output

val make_managed_rule :
  ?tags:tag_list ->
  resource_ar_n:amazon_resource_name ->
  template_name:template_name ->
  unit ->
  managed_rule

val make_put_managed_insight_rules_input :
  managed_rules:managed_rules -> unit -> put_managed_insight_rules_input

val make_put_log_alarm_input :
  ?tags:tag_list ->
  ?treat_missing_data:treat_missing_data ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  ?action_log_line_role_arn:action_log_line_role_arn ->
  ?action_log_line_count:action_log_line_count ->
  ?alarm_description:alarm_description ->
  comparison_operator:comparison_operator ->
  threshold:threshold ->
  query_results_to_alarm:query_results_to_alarm ->
  query_results_to_evaluate:query_results_to_evaluate ->
  scheduled_query_configuration:scheduled_query_configuration ->
  alarm_name:alarm_name ->
  unit ->
  put_log_alarm_input

val make_put_insight_rule_output : unit -> unit

val make_put_insight_rule_input :
  ?apply_on_transformed_logs:insight_rule_on_transformed_logs ->
  ?tags:tag_list ->
  ?rule_state:insight_rule_state ->
  rule_definition:insight_rule_definition ->
  rule_name:insight_rule_name ->
  unit ->
  put_insight_rule_input

val make_dashboard_validation_message :
  ?message:message -> ?data_path:data_path -> unit -> dashboard_validation_message

val make_put_dashboard_output :
  ?dashboard_validation_messages:dashboard_validation_messages -> unit -> put_dashboard_output

val make_put_dashboard_input :
  ?tags:tag_list ->
  dashboard_body:dashboard_body ->
  dashboard_name:dashboard_name ->
  unit ->
  put_dashboard_input

val make_put_composite_alarm_input :
  ?actions_suppressor_extension_period:suppressor_period ->
  ?actions_suppressor_wait_period:suppressor_period ->
  ?actions_suppressor:alarm_arn ->
  ?tags:tag_list ->
  ?ok_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_description:alarm_description ->
  ?alarm_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  alarm_rule:alarm_rule ->
  alarm_name:alarm_name ->
  unit ->
  put_composite_alarm_input

val make_put_anomaly_detector_output : unit -> unit

val make_anomaly_detector_configuration :
  ?metric_timezone:anomaly_detector_metric_timezone ->
  ?excluded_time_ranges:anomaly_detector_excluded_time_ranges ->
  unit ->
  anomaly_detector_configuration

val make_metric_characteristics : ?periodic_spikes:periodic_spikes -> unit -> metric_characteristics

val make_metric_math_anomaly_detector :
  ?metric_data_queries:metric_data_queries -> unit -> metric_math_anomaly_detector

val make_put_anomaly_detector_input :
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?metric_characteristics:metric_characteristics ->
  ?configuration:anomaly_detector_configuration ->
  ?stat:anomaly_detector_metric_stat ->
  ?dimensions:dimensions ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  unit ->
  put_anomaly_detector_input

val make_mute_targets : alarm_names:mute_target_alarm_name_list -> unit -> mute_targets

val make_put_alarm_mute_rule_input :
  ?expire_date:timestamp ->
  ?start_date:timestamp ->
  ?tags:tag_list ->
  ?mute_targets:mute_targets ->
  ?description:alarm_description ->
  rule:rule ->
  name:name ->
  unit ->
  put_alarm_mute_rule_input

val make_metric_stream_entry :
  ?output_format:metric_stream_output_format ->
  ?state:metric_stream_state ->
  ?firehose_arn:amazon_resource_name ->
  ?name:metric_stream_name ->
  ?last_update_date:timestamp ->
  ?creation_date:timestamp ->
  ?arn:amazon_resource_name ->
  unit ->
  metric_stream_entry

val make_message_data : ?value:message_data_value -> ?code:message_data_code -> unit -> message_data

val make_metric_alarm :
  ?evaluation_interval:evaluation_interval ->
  ?evaluation_criteria:evaluation_criteria ->
  ?evaluation_window:evaluation_window ->
  ?state_transitioned_timestamp:timestamp ->
  ?evaluation_state:evaluation_state ->
  ?threshold_metric_id:metric_id ->
  ?metrics:metric_data_queries ->
  ?evaluate_low_sample_count_percentile:evaluate_low_sample_count_percentile ->
  ?treat_missing_data:treat_missing_data ->
  ?comparison_operator:comparison_operator ->
  ?threshold:threshold ->
  ?datapoints_to_alarm:datapoints_to_alarm ->
  ?evaluation_periods:evaluation_periods ->
  ?unit_:standard_unit ->
  ?period:period ->
  ?dimensions:dimensions ->
  ?extended_statistic:extended_statistic ->
  ?statistic:statistic ->
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?state_updated_timestamp:timestamp ->
  ?state_reason_data:state_reason_data ->
  ?state_reason:state_reason ->
  ?state_value:state_value ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?alarm_description:alarm_description ->
  ?alarm_arn:alarm_arn ->
  ?alarm_name:alarm_name ->
  unit ->
  metric_alarm

val make_managed_rule_state :
  state:insight_rule_state -> rule_name:insight_rule_name -> unit -> managed_rule_state

val make_managed_rule_description :
  ?rule_state:managed_rule_state ->
  ?resource_ar_n:amazon_resource_name ->
  ?template_name:template_name ->
  unit ->
  managed_rule_description

val make_log_alarm :
  ?action_log_line_role_arn:action_log_line_role_arn ->
  ?action_log_line_count:action_log_line_count ->
  ?evaluation_state:evaluation_state ->
  ?state_transitioned_timestamp:timestamp ->
  ?treat_missing_data:treat_missing_data ->
  ?comparison_operator:comparison_operator ->
  ?threshold:threshold ->
  ?query_results_to_alarm:query_results_to_alarm ->
  ?query_results_to_evaluate:query_results_to_evaluate ->
  ?scheduled_query_configuration:scheduled_query_configuration ->
  ?state_updated_timestamp:timestamp ->
  ?state_reason_data:state_reason_data ->
  ?state_reason:state_reason ->
  ?state_value:state_value ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?alarm_description:alarm_description ->
  ?alarm_arn:alarm_arn ->
  ?alarm_name:alarm_name ->
  unit ->
  log_alarm

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_list_metrics_output :
  ?owning_accounts:owning_accounts ->
  ?next_token:next_token ->
  ?metrics:metrics ->
  unit ->
  list_metrics_output

val make_dimension_filter :
  ?value:dimension_value -> name:dimension_name -> unit -> dimension_filter

val make_list_metrics_input :
  ?owning_account:account_id ->
  ?include_linked_accounts:include_linked_accounts ->
  ?recently_active:recently_active ->
  ?next_token:next_token ->
  ?dimensions:dimension_filters ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  unit ->
  list_metrics_input

val make_list_metric_streams_output :
  ?entries:metric_stream_entries -> ?next_token:next_token -> unit -> list_metric_streams_output

val make_list_metric_streams_input :
  ?max_results:list_metric_streams_max_results ->
  ?next_token:next_token ->
  unit ->
  list_metric_streams_input

val make_list_managed_insight_rules_output :
  ?next_token:next_token ->
  ?managed_rules:managed_rule_descriptions ->
  unit ->
  list_managed_insight_rules_output

val make_list_managed_insight_rules_input :
  ?max_results:insight_rule_max_results ->
  ?next_token:next_token ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_managed_insight_rules_input

val make_dashboard_entry :
  ?size:size ->
  ?last_modified:last_modified ->
  ?dashboard_arn:dashboard_arn ->
  ?dashboard_name:dashboard_name ->
  unit ->
  dashboard_entry

val make_list_dashboards_output :
  ?next_token:next_token -> ?dashboard_entries:dashboard_entries -> unit -> list_dashboards_output

val make_list_dashboards_input :
  ?next_token:next_token ->
  ?dashboard_name_prefix:dashboard_name_prefix ->
  unit ->
  list_dashboards_input

val make_alarm_mute_rule_summary :
  ?last_updated_timestamp:timestamp ->
  ?mute_type:mute_type ->
  ?status:alarm_mute_rule_status ->
  ?expire_date:timestamp ->
  ?alarm_mute_rule_arn:arn ->
  unit ->
  alarm_mute_rule_summary

val make_list_alarm_mute_rules_output :
  ?next_token:next_token ->
  ?alarm_mute_rule_summaries:alarm_mute_rule_summaries ->
  unit ->
  list_alarm_mute_rules_output

val make_list_alarm_mute_rules_input :
  ?next_token:next_token ->
  ?max_records:max_records ->
  ?statuses:alarm_mute_rule_statuses ->
  ?alarm_name:name ->
  unit ->
  list_alarm_mute_rules_input

val make_label_options : ?timezone:get_metric_data_label_timezone -> unit -> label_options

val make_insight_rule :
  ?apply_on_transformed_logs:insight_rule_on_transformed_logs ->
  ?managed_rule:insight_rule_is_managed ->
  definition:insight_rule_definition ->
  schema:insight_rule_schema ->
  state:insight_rule_state ->
  name:insight_rule_name ->
  unit ->
  insight_rule

val make_insight_rule_metric_datapoint :
  ?maximum:insight_rule_unbound_double ->
  ?minimum:insight_rule_unbound_double ->
  ?sum:insight_rule_unbound_double ->
  ?average:insight_rule_unbound_double ->
  ?sample_count:insight_rule_unbound_double ->
  ?max_contributor_value:insight_rule_unbound_double ->
  ?unique_contributors:insight_rule_unbound_double ->
  timestamp:timestamp ->
  unit ->
  insight_rule_metric_datapoint

val make_insight_rule_contributor_datapoint :
  approximate_value:insight_rule_unbound_double ->
  timestamp:timestamp ->
  unit ->
  insight_rule_contributor_datapoint

val make_insight_rule_contributor :
  datapoints:insight_rule_contributor_datapoints ->
  approximate_aggregate_value:insight_rule_unbound_double ->
  keys:insight_rule_contributor_keys ->
  unit ->
  insight_rule_contributor

val make_get_o_tel_enrichment_output :
  status:o_tel_enrichment_status -> unit -> get_o_tel_enrichment_output

val make_get_o_tel_enrichment_input : unit -> unit

val make_get_metric_widget_image_output :
  ?metric_widget_image:metric_widget_image -> unit -> get_metric_widget_image_output

val make_get_metric_widget_image_input :
  ?output_format:output_format ->
  metric_widget:metric_widget ->
  unit ->
  get_metric_widget_image_input

val make_get_metric_stream_output :
  ?include_linked_accounts_metrics:include_linked_accounts_metrics ->
  ?statistics_configurations:metric_stream_statistics_configurations ->
  ?output_format:metric_stream_output_format ->
  ?last_update_date:timestamp ->
  ?creation_date:timestamp ->
  ?state:metric_stream_state ->
  ?role_arn:amazon_resource_name ->
  ?firehose_arn:amazon_resource_name ->
  ?exclude_filters:metric_stream_filters ->
  ?include_filters:metric_stream_filters ->
  ?name:metric_stream_name ->
  ?arn:amazon_resource_name ->
  unit ->
  get_metric_stream_output

val make_get_metric_stream_input : name:metric_stream_name -> unit -> get_metric_stream_input

val make_datapoint :
  ?extended_statistics:datapoint_value_map ->
  ?unit_:standard_unit ->
  ?maximum:datapoint_value ->
  ?minimum:datapoint_value ->
  ?sum:datapoint_value ->
  ?average:datapoint_value ->
  ?sample_count:datapoint_value ->
  ?timestamp:timestamp ->
  unit ->
  datapoint

val make_get_metric_statistics_output :
  ?datapoints:datapoints -> ?label:metric_label -> unit -> get_metric_statistics_output

val make_get_metric_statistics_input :
  ?unit_:standard_unit ->
  ?extended_statistics:extended_statistics ->
  ?statistics:statistics ->
  ?dimensions:dimensions ->
  period:period ->
  end_time:timestamp ->
  start_time:timestamp ->
  metric_name:metric_name ->
  namespace:namespace ->
  unit ->
  get_metric_statistics_input

val make_get_metric_data_output :
  ?messages:metric_data_result_messages ->
  ?next_token:next_token ->
  ?metric_data_results:metric_data_results ->
  unit ->
  get_metric_data_output

val make_get_metric_data_input :
  ?label_options:label_options ->
  ?max_datapoints:get_metric_data_max_datapoints ->
  ?scan_by:scan_by ->
  ?next_token:next_token ->
  end_time:timestamp ->
  start_time:timestamp ->
  metric_data_queries:metric_data_queries ->
  unit ->
  get_metric_data_input

val make_get_insight_rule_report_output :
  ?metric_datapoints:insight_rule_metric_datapoints ->
  ?contributors:insight_rule_contributors ->
  ?approximate_unique_count:insight_rule_unbound_long ->
  ?aggregate_value:insight_rule_unbound_double ->
  ?aggregation_statistic:insight_rule_aggregation_statistic ->
  ?key_labels:insight_rule_contributor_key_labels ->
  unit ->
  get_insight_rule_report_output

val make_get_insight_rule_report_input :
  ?order_by:insight_rule_order_by ->
  ?metrics:insight_rule_metric_list ->
  ?max_contributor_count:insight_rule_unbound_integer ->
  period:period ->
  end_time:timestamp ->
  start_time:timestamp ->
  rule_name:insight_rule_name ->
  unit ->
  get_insight_rule_report_input

val make_get_dataset_output :
  ?kms_key_arn:kms_key_arn -> arn:dataset_arn -> dataset_id:dataset_id -> unit -> get_dataset_output

val make_get_dataset_input : dataset_identifier:dataset_identifier -> unit -> get_dataset_input

val make_get_dashboard_output :
  ?dashboard_name:dashboard_name ->
  ?dashboard_body:dashboard_body ->
  ?dashboard_arn:dashboard_arn ->
  unit ->
  get_dashboard_output

val make_get_dashboard_input : dashboard_name:dashboard_name -> unit -> get_dashboard_input

val make_get_alarm_mute_rule_output :
  ?mute_type:mute_type ->
  ?last_updated_timestamp:timestamp ->
  ?status:alarm_mute_rule_status ->
  ?expire_date:timestamp ->
  ?start_date:timestamp ->
  ?mute_targets:mute_targets ->
  ?rule:rule ->
  ?description:alarm_description ->
  ?alarm_mute_rule_arn:arn ->
  ?name:name ->
  unit ->
  get_alarm_mute_rule_output

val make_get_alarm_mute_rule_input : alarm_mute_rule_name:name -> unit -> get_alarm_mute_rule_input

val make_enable_insight_rules_output :
  ?failures:batch_failures -> unit -> enable_insight_rules_output

val make_enable_insight_rules_input :
  rule_names:insight_rule_names -> unit -> enable_insight_rules_input

val make_enable_alarm_actions_input : alarm_names:alarm_names -> unit -> enable_alarm_actions_input
val make_disassociate_dataset_kms_key_output : unit -> unit

val make_disassociate_dataset_kms_key_input :
  dataset_identifier:dataset_identifier -> unit -> disassociate_dataset_kms_key_input

val make_disable_insight_rules_output :
  ?failures:batch_failures -> unit -> disable_insight_rules_output

val make_disable_insight_rules_input :
  rule_names:insight_rule_names -> unit -> disable_insight_rules_input

val make_disable_alarm_actions_input :
  alarm_names:alarm_names -> unit -> disable_alarm_actions_input

val make_describe_insight_rules_output :
  ?insight_rules:insight_rules -> ?next_token:next_token -> unit -> describe_insight_rules_output

val make_describe_insight_rules_input :
  ?max_results:insight_rule_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_insight_rules_input

val make_anomaly_detector :
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?metric_characteristics:metric_characteristics ->
  ?state_value:anomaly_detector_state_value ->
  ?configuration:anomaly_detector_configuration ->
  ?stat:anomaly_detector_metric_stat ->
  ?dimensions:dimensions ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  unit ->
  anomaly_detector

val make_describe_anomaly_detectors_output :
  ?next_token:next_token ->
  ?anomaly_detectors:anomaly_detectors ->
  unit ->
  describe_anomaly_detectors_output

val make_describe_anomaly_detectors_input :
  ?anomaly_detector_types:anomaly_detector_types ->
  ?dimensions:dimensions ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  ?max_results:max_returned_results_count ->
  ?next_token:next_token ->
  unit ->
  describe_anomaly_detectors_input

val make_describe_alarms_for_metric_output :
  ?metric_alarms:metric_alarms -> unit -> describe_alarms_for_metric_output

val make_describe_alarms_for_metric_input :
  ?unit_:standard_unit ->
  ?period:period ->
  ?dimensions:dimensions ->
  ?extended_statistic:extended_statistic ->
  ?statistic:statistic ->
  namespace:namespace ->
  metric_name:metric_name ->
  unit ->
  describe_alarms_for_metric_input

val make_composite_alarm :
  ?actions_suppressor_extension_period:suppressor_period ->
  ?actions_suppressor_wait_period:suppressor_period ->
  ?actions_suppressor:alarm_arn ->
  ?actions_suppressed_reason:actions_suppressed_reason ->
  ?actions_suppressed_by:actions_suppressed_by ->
  ?state_transitioned_timestamp:timestamp ->
  ?state_value:state_value ->
  ?state_updated_timestamp:timestamp ->
  ?state_reason_data:state_reason_data ->
  ?state_reason:state_reason ->
  ?ok_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?alarm_rule:alarm_rule ->
  ?alarm_name:alarm_name ->
  ?alarm_description:alarm_description ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?alarm_arn:alarm_arn ->
  ?alarm_actions:resource_list ->
  ?actions_enabled:actions_enabled ->
  unit ->
  composite_alarm

val make_describe_alarms_output :
  ?next_token:next_token ->
  ?log_alarms:log_alarms ->
  ?metric_alarms:metric_alarms ->
  ?composite_alarms:composite_alarms ->
  unit ->
  describe_alarms_output

val make_describe_alarms_input :
  ?next_token:next_token ->
  ?max_records:max_records ->
  ?action_prefix:action_prefix ->
  ?state_value:state_value ->
  ?parents_of_alarm_name:alarm_name ->
  ?children_of_alarm_name:alarm_name ->
  ?alarm_types:alarm_types ->
  ?alarm_name_prefix:alarm_name_prefix ->
  ?alarm_names:alarm_names ->
  unit ->
  describe_alarms_input

val make_alarm_history_item :
  ?alarm_contributor_attributes:contributor_attributes ->
  ?history_data:history_data ->
  ?history_summary:history_summary ->
  ?history_item_type:history_item_type ->
  ?timestamp:timestamp ->
  ?alarm_type:alarm_type ->
  ?alarm_contributor_id:contributor_id ->
  ?alarm_name:alarm_name ->
  unit ->
  alarm_history_item

val make_describe_alarm_history_output :
  ?next_token:next_token ->
  ?alarm_history_items:alarm_history_items ->
  unit ->
  describe_alarm_history_output

val make_describe_alarm_history_input :
  ?scan_by:scan_by ->
  ?next_token:next_token ->
  ?max_records:max_records ->
  ?end_date:timestamp ->
  ?start_date:timestamp ->
  ?history_item_type:history_item_type ->
  ?alarm_types:alarm_types ->
  ?alarm_contributor_id:contributor_id ->
  ?alarm_name:alarm_name ->
  unit ->
  describe_alarm_history_input

val make_alarm_contributor :
  ?state_transitioned_timestamp:timestamp ->
  state_reason:state_reason ->
  contributor_attributes:contributor_attributes ->
  contributor_id:contributor_id ->
  unit ->
  alarm_contributor

val make_describe_alarm_contributors_output :
  ?next_token:next_token ->
  alarm_contributors:alarm_contributors ->
  unit ->
  describe_alarm_contributors_output

val make_describe_alarm_contributors_input :
  ?next_token:next_token -> alarm_name:alarm_name -> unit -> describe_alarm_contributors_input

val make_delete_metric_stream_output : unit -> unit
val make_delete_metric_stream_input : name:metric_stream_name -> unit -> delete_metric_stream_input

val make_delete_insight_rules_output :
  ?failures:batch_failures -> unit -> delete_insight_rules_output

val make_delete_insight_rules_input :
  rule_names:insight_rule_names -> unit -> delete_insight_rules_input

val make_delete_dashboards_output : unit -> unit

val make_delete_dashboards_input :
  dashboard_names:dashboard_names -> unit -> delete_dashboards_input

val make_delete_anomaly_detector_output : unit -> unit

val make_delete_anomaly_detector_input :
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?stat:anomaly_detector_metric_stat ->
  ?dimensions:dimensions ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  unit ->
  delete_anomaly_detector_input

val make_delete_alarms_input : alarm_names:alarm_names -> unit -> delete_alarms_input

val make_delete_alarm_mute_rule_input :
  alarm_mute_rule_name:name -> unit -> delete_alarm_mute_rule_input

val make_associate_dataset_kms_key_output : unit -> unit

val make_associate_dataset_kms_key_input :
  kms_key_arn:kms_key_arn ->
  dataset_identifier:dataset_identifier ->
  unit ->
  associate_dataset_kms_key_input
