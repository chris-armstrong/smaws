open Types

val make_alarm_contributor :
  ?state_transitioned_timestamp:timestamp ->
  contributor_id:contributor_id ->
  contributor_attributes:contributor_attributes ->
  state_reason:state_reason ->
  unit ->
  alarm_contributor

val make_alarm_history_item :
  ?alarm_name:alarm_name ->
  ?alarm_contributor_id:contributor_id ->
  ?alarm_type:alarm_type ->
  ?timestamp:timestamp ->
  ?history_item_type:history_item_type ->
  ?history_summary:history_summary ->
  ?history_data:history_data ->
  ?alarm_contributor_attributes:contributor_attributes ->
  unit ->
  alarm_history_item

val make_alarm_mute_rule_summary :
  ?alarm_mute_rule_arn:arn ->
  ?expire_date:timestamp ->
  ?status:alarm_mute_rule_status ->
  ?mute_type:mute_type ->
  ?last_updated_timestamp:timestamp ->
  unit ->
  alarm_mute_rule_summary

val make_alarm_prom_ql_criteria :
  ?pending_period:pending_period ->
  ?recovery_period:recovery_period ->
  query:query ->
  unit ->
  alarm_prom_ql_criteria

val make_dimension : name:dimension_name -> value:dimension_value -> unit -> dimension

val make_metric :
  ?namespace:namespace -> ?metric_name:metric_name -> ?dimensions:dimensions -> unit -> metric

val make_metric_stat :
  ?unit_:standard_unit -> metric:metric -> period:period -> stat:stat -> unit -> metric_stat

val make_metric_data_query :
  ?metric_stat:metric_stat ->
  ?expression:metric_expression ->
  ?label:metric_label ->
  ?return_data:return_data ->
  ?period:period ->
  ?account_id:account_id ->
  id:metric_id ->
  unit ->
  metric_data_query

val make_metric_math_anomaly_detector :
  ?metric_data_queries:metric_data_queries -> unit -> metric_math_anomaly_detector

val make_single_metric_anomaly_detector :
  ?account_id:account_id ->
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimensions ->
  ?stat:anomaly_detector_metric_stat ->
  unit ->
  single_metric_anomaly_detector

val make_metric_characteristics : ?periodic_spikes:periodic_spikes -> unit -> metric_characteristics
val make_range : start_time:timestamp -> end_time:timestamp -> unit -> range

val make_anomaly_detector_configuration :
  ?excluded_time_ranges:anomaly_detector_excluded_time_ranges ->
  ?metric_timezone:anomaly_detector_metric_timezone ->
  unit ->
  anomaly_detector_configuration

val make_anomaly_detector :
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimensions ->
  ?stat:anomaly_detector_metric_stat ->
  ?configuration:anomaly_detector_configuration ->
  ?state_value:anomaly_detector_state_value ->
  ?metric_characteristics:metric_characteristics ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  unit ->
  anomaly_detector

val make_associate_dataset_kms_key_output : unit -> unit

val make_associate_dataset_kms_key_input :
  dataset_identifier:dataset_identifier ->
  kms_key_arn:kms_key_arn ->
  unit ->
  associate_dataset_kms_key_input

val make_partial_failure :
  ?failure_resource:failure_resource ->
  ?exception_type:exception_type ->
  ?failure_code:failure_code ->
  ?failure_description:failure_description ->
  unit ->
  partial_failure

val make_composite_alarm :
  ?actions_enabled:actions_enabled ->
  ?alarm_actions:resource_list ->
  ?alarm_arn:alarm_arn ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?alarm_description:alarm_description ->
  ?alarm_name:alarm_name ->
  ?alarm_rule:alarm_rule ->
  ?insufficient_data_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?state_reason:state_reason ->
  ?state_reason_data:state_reason_data ->
  ?state_updated_timestamp:timestamp ->
  ?state_value:state_value ->
  ?state_transitioned_timestamp:timestamp ->
  ?actions_suppressed_by:actions_suppressed_by ->
  ?actions_suppressed_reason:actions_suppressed_reason ->
  ?actions_suppressor:alarm_arn ->
  ?actions_suppressor_wait_period:suppressor_period ->
  ?actions_suppressor_extension_period:suppressor_period ->
  unit ->
  composite_alarm

val make_dashboard_entry :
  ?dashboard_name:dashboard_name ->
  ?dashboard_arn:dashboard_arn ->
  ?last_modified:last_modified ->
  ?size:size ->
  unit ->
  dashboard_entry

val make_dashboard_validation_message :
  ?data_path:data_path -> ?message:message -> unit -> dashboard_validation_message

val make_datapoint :
  ?timestamp:timestamp ->
  ?sample_count:datapoint_value ->
  ?average:datapoint_value ->
  ?sum:datapoint_value ->
  ?minimum:datapoint_value ->
  ?maximum:datapoint_value ->
  ?unit_:standard_unit ->
  ?extended_statistics:datapoint_value_map ->
  unit ->
  datapoint

val make_delete_alarm_mute_rule_input :
  alarm_mute_rule_name:name -> unit -> delete_alarm_mute_rule_input

val make_delete_alarms_input : alarm_names:alarm_names -> unit -> delete_alarms_input
val make_delete_anomaly_detector_output : unit -> unit

val make_delete_anomaly_detector_input :
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimensions ->
  ?stat:anomaly_detector_metric_stat ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  unit ->
  delete_anomaly_detector_input

val make_delete_dashboards_output : unit -> unit

val make_delete_dashboards_input :
  dashboard_names:dashboard_names -> unit -> delete_dashboards_input

val make_delete_insight_rules_output :
  ?failures:batch_failures -> unit -> delete_insight_rules_output

val make_delete_insight_rules_input :
  rule_names:insight_rule_names -> unit -> delete_insight_rules_input

val make_delete_metric_stream_output : unit -> unit
val make_delete_metric_stream_input : name:metric_stream_name -> unit -> delete_metric_stream_input

val make_describe_alarm_contributors_output :
  ?next_token:next_token ->
  alarm_contributors:alarm_contributors ->
  unit ->
  describe_alarm_contributors_output

val make_describe_alarm_contributors_input :
  ?next_token:next_token -> alarm_name:alarm_name -> unit -> describe_alarm_contributors_input

val make_describe_alarm_history_output :
  ?alarm_history_items:alarm_history_items ->
  ?next_token:next_token ->
  unit ->
  describe_alarm_history_output

val make_describe_alarm_history_input :
  ?alarm_name:alarm_name ->
  ?alarm_contributor_id:contributor_id ->
  ?alarm_types:alarm_types ->
  ?history_item_type:history_item_type ->
  ?start_date:timestamp ->
  ?end_date:timestamp ->
  ?max_records:max_records ->
  ?next_token:next_token ->
  ?scan_by:scan_by ->
  unit ->
  describe_alarm_history_input

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_schedule_configuration :
  ?start_time_offset:start_time_offset ->
  ?end_time_offset:end_time_offset ->
  schedule_expression:schedule_expression ->
  unit ->
  schedule_configuration

val make_scheduled_query_configuration :
  ?log_group_identifiers:log_group_identifiers ->
  ?query_ar_n:amazon_resource_name ->
  ?tags:tag_list ->
  query_string:query_string ->
  scheduled_query_role_ar_n:amazon_resource_name ->
  schedule_configuration:schedule_configuration ->
  aggregation_expression:aggregation_expression ->
  unit ->
  scheduled_query_configuration

val make_log_alarm :
  ?alarm_name:alarm_name ->
  ?alarm_arn:alarm_arn ->
  ?alarm_description:alarm_description ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?actions_enabled:actions_enabled ->
  ?ok_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?state_value:state_value ->
  ?state_reason:state_reason ->
  ?state_reason_data:state_reason_data ->
  ?state_updated_timestamp:timestamp ->
  ?scheduled_query_configuration:scheduled_query_configuration ->
  ?query_results_to_evaluate:query_results_to_evaluate ->
  ?query_results_to_alarm:query_results_to_alarm ->
  ?threshold:threshold ->
  ?comparison_operator:comparison_operator ->
  ?treat_missing_data:treat_missing_data ->
  ?state_transitioned_timestamp:timestamp ->
  ?evaluation_state:evaluation_state ->
  ?action_log_line_count:action_log_line_count ->
  ?action_log_line_role_arn:action_log_line_role_arn ->
  unit ->
  log_alarm

val make_sliding_window : unit -> unit
val make_wall_clock_window : ?timezone:timezone -> unit -> wall_clock_window

val make_metric_alarm :
  ?alarm_name:alarm_name ->
  ?alarm_arn:alarm_arn ->
  ?alarm_description:alarm_description ->
  ?alarm_configuration_updated_timestamp:timestamp ->
  ?actions_enabled:actions_enabled ->
  ?ok_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?state_value:state_value ->
  ?state_reason:state_reason ->
  ?state_reason_data:state_reason_data ->
  ?state_updated_timestamp:timestamp ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  ?statistic:statistic ->
  ?extended_statistic:extended_statistic ->
  ?dimensions:dimensions ->
  ?period:period ->
  ?unit_:standard_unit ->
  ?evaluation_periods:evaluation_periods ->
  ?datapoints_to_alarm:datapoints_to_alarm ->
  ?threshold:threshold ->
  ?comparison_operator:comparison_operator ->
  ?treat_missing_data:treat_missing_data ->
  ?evaluate_low_sample_count_percentile:evaluate_low_sample_count_percentile ->
  ?metrics:metric_data_queries ->
  ?threshold_metric_id:metric_id ->
  ?evaluation_state:evaluation_state ->
  ?state_transitioned_timestamp:timestamp ->
  ?evaluation_window:evaluation_window ->
  ?evaluation_criteria:evaluation_criteria ->
  ?evaluation_interval:evaluation_interval ->
  unit ->
  metric_alarm

val make_describe_alarms_output :
  ?composite_alarms:composite_alarms ->
  ?metric_alarms:metric_alarms ->
  ?log_alarms:log_alarms ->
  ?next_token:next_token ->
  unit ->
  describe_alarms_output

val make_describe_alarms_input :
  ?alarm_names:alarm_names ->
  ?alarm_name_prefix:alarm_name_prefix ->
  ?alarm_types:alarm_types ->
  ?children_of_alarm_name:alarm_name ->
  ?parents_of_alarm_name:alarm_name ->
  ?state_value:state_value ->
  ?action_prefix:action_prefix ->
  ?max_records:max_records ->
  ?next_token:next_token ->
  unit ->
  describe_alarms_input

val make_describe_alarms_for_metric_output :
  ?metric_alarms:metric_alarms -> unit -> describe_alarms_for_metric_output

val make_describe_alarms_for_metric_input :
  ?statistic:statistic ->
  ?extended_statistic:extended_statistic ->
  ?dimensions:dimensions ->
  ?period:period ->
  ?unit_:standard_unit ->
  metric_name:metric_name ->
  namespace:namespace ->
  unit ->
  describe_alarms_for_metric_input

val make_describe_anomaly_detectors_output :
  ?anomaly_detectors:anomaly_detectors ->
  ?next_token:next_token ->
  unit ->
  describe_anomaly_detectors_output

val make_describe_anomaly_detectors_input :
  ?next_token:next_token ->
  ?max_results:max_returned_results_count ->
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimensions ->
  ?anomaly_detector_types:anomaly_detector_types ->
  unit ->
  describe_anomaly_detectors_input

val make_insight_rule :
  ?managed_rule:insight_rule_is_managed ->
  ?apply_on_transformed_logs:insight_rule_on_transformed_logs ->
  name:insight_rule_name ->
  state:insight_rule_state ->
  schema:insight_rule_schema ->
  definition:insight_rule_definition ->
  unit ->
  insight_rule

val make_describe_insight_rules_output :
  ?next_token:next_token -> ?insight_rules:insight_rules -> unit -> describe_insight_rules_output

val make_describe_insight_rules_input :
  ?next_token:next_token ->
  ?max_results:insight_rule_max_results ->
  unit ->
  describe_insight_rules_input

val make_dimension_filter :
  ?value:dimension_value -> name:dimension_name -> unit -> dimension_filter

val make_disable_alarm_actions_input :
  alarm_names:alarm_names -> unit -> disable_alarm_actions_input

val make_disable_insight_rules_output :
  ?failures:batch_failures -> unit -> disable_insight_rules_output

val make_disable_insight_rules_input :
  rule_names:insight_rule_names -> unit -> disable_insight_rules_input

val make_disassociate_dataset_kms_key_output : unit -> unit

val make_disassociate_dataset_kms_key_input :
  dataset_identifier:dataset_identifier -> unit -> disassociate_dataset_kms_key_input

val make_enable_alarm_actions_input : alarm_names:alarm_names -> unit -> enable_alarm_actions_input

val make_enable_insight_rules_output :
  ?failures:batch_failures -> unit -> enable_insight_rules_output

val make_enable_insight_rules_input :
  rule_names:insight_rule_names -> unit -> enable_insight_rules_input

val make_entity :
  ?key_attributes:entity_key_attributes_map -> ?attributes:entity_attributes_map -> unit -> entity

val make_statistic_set :
  sample_count:datapoint_value ->
  sum:datapoint_value ->
  minimum:datapoint_value ->
  maximum:datapoint_value ->
  unit ->
  statistic_set

val make_metric_datum :
  ?dimensions:dimensions ->
  ?timestamp:timestamp ->
  ?value:datapoint_value ->
  ?statistic_values:statistic_set ->
  ?values:values ->
  ?counts:counts ->
  ?unit_:standard_unit ->
  ?storage_resolution:storage_resolution ->
  metric_name:metric_name ->
  unit ->
  metric_datum

val make_entity_metric_data :
  ?entity:entity -> ?metric_data:metric_data -> unit -> entity_metric_data

val make_mute_targets : alarm_names:mute_target_alarm_name_list -> unit -> mute_targets

val make_schedule :
  ?timezone:timezone -> expression:expression -> duration:duration -> unit -> schedule

val make_rule : schedule:schedule -> unit -> rule

val make_get_alarm_mute_rule_output :
  ?name:name ->
  ?alarm_mute_rule_arn:arn ->
  ?description:alarm_description ->
  ?rule:rule ->
  ?mute_targets:mute_targets ->
  ?start_date:timestamp ->
  ?expire_date:timestamp ->
  ?status:alarm_mute_rule_status ->
  ?last_updated_timestamp:timestamp ->
  ?mute_type:mute_type ->
  unit ->
  get_alarm_mute_rule_output

val make_get_alarm_mute_rule_input : alarm_mute_rule_name:name -> unit -> get_alarm_mute_rule_input

val make_get_dashboard_output :
  ?dashboard_arn:dashboard_arn ->
  ?dashboard_body:dashboard_body ->
  ?dashboard_name:dashboard_name ->
  unit ->
  get_dashboard_output

val make_get_dashboard_input : dashboard_name:dashboard_name -> unit -> get_dashboard_input

val make_get_dataset_output :
  ?kms_key_arn:kms_key_arn -> dataset_id:dataset_id -> arn:dataset_arn -> unit -> get_dataset_output

val make_get_dataset_input : dataset_identifier:dataset_identifier -> unit -> get_dataset_input

val make_insight_rule_metric_datapoint :
  ?unique_contributors:insight_rule_unbound_double ->
  ?max_contributor_value:insight_rule_unbound_double ->
  ?sample_count:insight_rule_unbound_double ->
  ?average:insight_rule_unbound_double ->
  ?sum:insight_rule_unbound_double ->
  ?minimum:insight_rule_unbound_double ->
  ?maximum:insight_rule_unbound_double ->
  timestamp:timestamp ->
  unit ->
  insight_rule_metric_datapoint

val make_insight_rule_contributor_datapoint :
  timestamp:timestamp ->
  approximate_value:insight_rule_unbound_double ->
  unit ->
  insight_rule_contributor_datapoint

val make_insight_rule_contributor :
  keys:insight_rule_contributor_keys ->
  approximate_aggregate_value:insight_rule_unbound_double ->
  datapoints:insight_rule_contributor_datapoints ->
  unit ->
  insight_rule_contributor

val make_get_insight_rule_report_output :
  ?key_labels:insight_rule_contributor_key_labels ->
  ?aggregation_statistic:insight_rule_aggregation_statistic ->
  ?aggregate_value:insight_rule_unbound_double ->
  ?approximate_unique_count:insight_rule_unbound_long ->
  ?contributors:insight_rule_contributors ->
  ?metric_datapoints:insight_rule_metric_datapoints ->
  unit ->
  get_insight_rule_report_output

val make_get_insight_rule_report_input :
  ?max_contributor_count:insight_rule_unbound_integer ->
  ?metrics:insight_rule_metric_list ->
  ?order_by:insight_rule_order_by ->
  rule_name:insight_rule_name ->
  start_time:timestamp ->
  end_time:timestamp ->
  period:period ->
  unit ->
  get_insight_rule_report_input

val make_message_data : ?code:message_data_code -> ?value:message_data_value -> unit -> message_data

val make_get_metric_data_output :
  ?metric_data_results:metric_data_results ->
  ?next_token:next_token ->
  ?messages:metric_data_result_messages ->
  unit ->
  get_metric_data_output

val make_label_options : ?timezone:get_metric_data_label_timezone -> unit -> label_options

val make_get_metric_data_input :
  ?next_token:next_token ->
  ?scan_by:scan_by ->
  ?max_datapoints:get_metric_data_max_datapoints ->
  ?label_options:label_options ->
  metric_data_queries:metric_data_queries ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit ->
  get_metric_data_input

val make_get_metric_statistics_output :
  ?label:metric_label -> ?datapoints:datapoints -> unit -> get_metric_statistics_output

val make_get_metric_statistics_input :
  ?dimensions:dimensions ->
  ?statistics:statistics ->
  ?extended_statistics:extended_statistics ->
  ?unit_:standard_unit ->
  namespace:namespace ->
  metric_name:metric_name ->
  start_time:timestamp ->
  end_time:timestamp ->
  period:period ->
  unit ->
  get_metric_statistics_input

val make_metric_stream_statistics_metric :
  namespace:namespace -> metric_name:metric_name -> unit -> metric_stream_statistics_metric

val make_metric_stream_statistics_configuration :
  include_metrics:metric_stream_statistics_include_metrics ->
  additional_statistics:metric_stream_statistics_additional_statistics ->
  unit ->
  metric_stream_statistics_configuration

val make_metric_stream_filter :
  ?namespace:namespace ->
  ?metric_names:metric_stream_filter_metric_names ->
  unit ->
  metric_stream_filter

val make_get_metric_stream_output :
  ?arn:amazon_resource_name ->
  ?name:metric_stream_name ->
  ?include_filters:metric_stream_filters ->
  ?exclude_filters:metric_stream_filters ->
  ?firehose_arn:amazon_resource_name ->
  ?role_arn:amazon_resource_name ->
  ?state:metric_stream_state ->
  ?creation_date:timestamp ->
  ?last_update_date:timestamp ->
  ?output_format:metric_stream_output_format ->
  ?statistics_configurations:metric_stream_statistics_configurations ->
  ?include_linked_accounts_metrics:include_linked_accounts_metrics ->
  unit ->
  get_metric_stream_output

val make_get_metric_stream_input : name:metric_stream_name -> unit -> get_metric_stream_input

val make_get_metric_widget_image_output :
  ?metric_widget_image:metric_widget_image -> unit -> get_metric_widget_image_output

val make_get_metric_widget_image_input :
  ?output_format:output_format ->
  metric_widget:metric_widget ->
  unit ->
  get_metric_widget_image_input

val make_get_o_tel_enrichment_output :
  status:o_tel_enrichment_status -> unit -> get_o_tel_enrichment_output

val make_get_o_tel_enrichment_input : unit -> unit
val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit

val make_tag_resource_input :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_input

val make_stop_o_tel_enrichment_output : unit -> unit
val make_stop_o_tel_enrichment_input : unit -> unit
val make_stop_metric_streams_output : unit -> unit
val make_stop_metric_streams_input : names:metric_stream_names -> unit -> stop_metric_streams_input
val make_start_o_tel_enrichment_output : unit -> unit
val make_start_o_tel_enrichment_input : unit -> unit
val make_start_metric_streams_output : unit -> unit

val make_start_metric_streams_input :
  names:metric_stream_names -> unit -> start_metric_streams_input

val make_set_alarm_state_input :
  ?state_reason_data:state_reason_data ->
  alarm_name:alarm_name ->
  state_value:state_value ->
  state_reason:state_reason ->
  unit ->
  set_alarm_state_input

val make_put_metric_stream_output : ?arn:amazon_resource_name -> unit -> put_metric_stream_output

val make_put_metric_stream_input :
  ?include_filters:metric_stream_filters ->
  ?exclude_filters:metric_stream_filters ->
  ?tags:tag_list ->
  ?statistics_configurations:metric_stream_statistics_configurations ->
  ?include_linked_accounts_metrics:include_linked_accounts_metrics ->
  name:metric_stream_name ->
  firehose_arn:amazon_resource_name ->
  role_arn:amazon_resource_name ->
  output_format:metric_stream_output_format ->
  unit ->
  put_metric_stream_input

val make_put_metric_data_input :
  ?metric_data:metric_data ->
  ?entity_metric_data:entity_metric_data_list ->
  ?strict_entity_validation:strict_entity_validation ->
  namespace:namespace ->
  unit ->
  put_metric_data_input

val make_put_metric_alarm_input :
  ?alarm_description:alarm_description ->
  ?actions_enabled:actions_enabled ->
  ?ok_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?metric_name:metric_name ->
  ?namespace:namespace ->
  ?statistic:statistic ->
  ?extended_statistic:extended_statistic ->
  ?dimensions:dimensions ->
  ?period:period ->
  ?unit_:standard_unit ->
  ?evaluation_periods:evaluation_periods ->
  ?datapoints_to_alarm:datapoints_to_alarm ->
  ?threshold:threshold ->
  ?comparison_operator:comparison_operator ->
  ?treat_missing_data:treat_missing_data ->
  ?evaluate_low_sample_count_percentile:evaluate_low_sample_count_percentile ->
  ?metrics:metric_data_queries ->
  ?tags:tag_list ->
  ?threshold_metric_id:metric_id ->
  ?evaluation_window:evaluation_window ->
  ?evaluation_criteria:evaluation_criteria ->
  ?evaluation_interval:evaluation_interval ->
  alarm_name:alarm_name ->
  unit ->
  put_metric_alarm_input

val make_put_managed_insight_rules_output :
  ?failures:batch_failures -> unit -> put_managed_insight_rules_output

val make_managed_rule :
  ?tags:tag_list ->
  template_name:template_name ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  managed_rule

val make_put_managed_insight_rules_input :
  managed_rules:managed_rules -> unit -> put_managed_insight_rules_input

val make_put_log_alarm_input :
  ?alarm_description:alarm_description ->
  ?action_log_line_count:action_log_line_count ->
  ?action_log_line_role_arn:action_log_line_role_arn ->
  ?actions_enabled:actions_enabled ->
  ?ok_actions:resource_list ->
  ?alarm_actions:resource_list ->
  ?insufficient_data_actions:resource_list ->
  ?treat_missing_data:treat_missing_data ->
  ?tags:tag_list ->
  alarm_name:alarm_name ->
  scheduled_query_configuration:scheduled_query_configuration ->
  query_results_to_evaluate:query_results_to_evaluate ->
  query_results_to_alarm:query_results_to_alarm ->
  threshold:threshold ->
  comparison_operator:comparison_operator ->
  unit ->
  put_log_alarm_input

val make_put_insight_rule_output : unit -> unit

val make_put_insight_rule_input :
  ?rule_state:insight_rule_state ->
  ?tags:tag_list ->
  ?apply_on_transformed_logs:insight_rule_on_transformed_logs ->
  rule_name:insight_rule_name ->
  rule_definition:insight_rule_definition ->
  unit ->
  put_insight_rule_input

val make_put_dashboard_output :
  ?dashboard_validation_messages:dashboard_validation_messages -> unit -> put_dashboard_output

val make_put_dashboard_input :
  ?tags:tag_list ->
  dashboard_name:dashboard_name ->
  dashboard_body:dashboard_body ->
  unit ->
  put_dashboard_input

val make_put_composite_alarm_input :
  ?actions_enabled:actions_enabled ->
  ?alarm_actions:resource_list ->
  ?alarm_description:alarm_description ->
  ?insufficient_data_actions:resource_list ->
  ?ok_actions:resource_list ->
  ?tags:tag_list ->
  ?actions_suppressor:alarm_arn ->
  ?actions_suppressor_wait_period:suppressor_period ->
  ?actions_suppressor_extension_period:suppressor_period ->
  alarm_name:alarm_name ->
  alarm_rule:alarm_rule ->
  unit ->
  put_composite_alarm_input

val make_put_anomaly_detector_output : unit -> unit

val make_put_anomaly_detector_input :
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimensions ->
  ?stat:anomaly_detector_metric_stat ->
  ?configuration:anomaly_detector_configuration ->
  ?metric_characteristics:metric_characteristics ->
  ?single_metric_anomaly_detector:single_metric_anomaly_detector ->
  ?metric_math_anomaly_detector:metric_math_anomaly_detector ->
  unit ->
  put_anomaly_detector_input

val make_put_alarm_mute_rule_input :
  ?description:alarm_description ->
  ?mute_targets:mute_targets ->
  ?tags:tag_list ->
  ?start_date:timestamp ->
  ?expire_date:timestamp ->
  name:name ->
  rule:rule ->
  unit ->
  put_alarm_mute_rule_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_metric_stream_entry :
  ?arn:amazon_resource_name ->
  ?creation_date:timestamp ->
  ?last_update_date:timestamp ->
  ?name:metric_stream_name ->
  ?firehose_arn:amazon_resource_name ->
  ?state:metric_stream_state ->
  ?output_format:metric_stream_output_format ->
  unit ->
  metric_stream_entry

val make_list_metric_streams_output :
  ?next_token:next_token -> ?entries:metric_stream_entries -> unit -> list_metric_streams_output

val make_list_metric_streams_input :
  ?next_token:next_token ->
  ?max_results:list_metric_streams_max_results ->
  unit ->
  list_metric_streams_input

val make_list_metrics_output :
  ?metrics:metrics ->
  ?next_token:next_token ->
  ?owning_accounts:owning_accounts ->
  unit ->
  list_metrics_output

val make_list_metrics_input :
  ?namespace:namespace ->
  ?metric_name:metric_name ->
  ?dimensions:dimension_filters ->
  ?next_token:next_token ->
  ?recently_active:recently_active ->
  ?include_linked_accounts:include_linked_accounts ->
  ?owning_account:account_id ->
  unit ->
  list_metrics_input

val make_managed_rule_state :
  rule_name:insight_rule_name -> state:insight_rule_state -> unit -> managed_rule_state

val make_managed_rule_description :
  ?template_name:template_name ->
  ?resource_ar_n:amazon_resource_name ->
  ?rule_state:managed_rule_state ->
  unit ->
  managed_rule_description

val make_list_managed_insight_rules_output :
  ?managed_rules:managed_rule_descriptions ->
  ?next_token:next_token ->
  unit ->
  list_managed_insight_rules_output

val make_list_managed_insight_rules_input :
  ?next_token:next_token ->
  ?max_results:insight_rule_max_results ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_managed_insight_rules_input

val make_list_dashboards_output :
  ?dashboard_entries:dashboard_entries -> ?next_token:next_token -> unit -> list_dashboards_output

val make_list_dashboards_input :
  ?dashboard_name_prefix:dashboard_name_prefix ->
  ?next_token:next_token ->
  unit ->
  list_dashboards_input

val make_list_alarm_mute_rules_output :
  ?alarm_mute_rule_summaries:alarm_mute_rule_summaries ->
  ?next_token:next_token ->
  unit ->
  list_alarm_mute_rules_output

val make_list_alarm_mute_rules_input :
  ?alarm_name:name ->
  ?statuses:alarm_mute_rule_statuses ->
  ?max_records:max_records ->
  ?next_token:next_token ->
  unit ->
  list_alarm_mute_rules_input
