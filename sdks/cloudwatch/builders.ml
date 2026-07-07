open Types

let make_wall_clock_window ?timezone:(timezone_ : timezone option) () =
  ({ timezone = timezone_ } : wall_clock_window)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_input ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_input)

let make_stop_o_tel_enrichment_output () = (() : unit)
let make_stop_o_tel_enrichment_input () = (() : unit)
let make_stop_metric_streams_output () = (() : unit)

let make_stop_metric_streams_input ~names:(names_ : metric_stream_names) () =
  ({ names = names_ } : stop_metric_streams_input)

let make_statistic_set ~maximum:(maximum_ : datapoint_value) ~minimum:(minimum_ : datapoint_value)
    ~sum:(sum_ : datapoint_value) ~sample_count:(sample_count_ : datapoint_value) () =
  ({ maximum = maximum_; minimum = minimum_; sum = sum_; sample_count = sample_count_ }
    : statistic_set)

let make_start_o_tel_enrichment_output () = (() : unit)
let make_start_o_tel_enrichment_input () = (() : unit)
let make_start_metric_streams_output () = (() : unit)

let make_start_metric_streams_input ~names:(names_ : metric_stream_names) () =
  ({ names = names_ } : start_metric_streams_input)

let make_sliding_window () = (() : unit)

let make_dimension ~value:(value_ : dimension_value) ~name:(name_ : dimension_name) () =
  ({ value = value_; name = name_ } : dimension)

let make_single_metric_anomaly_detector ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?dimensions:(dimensions_ : dimensions option) ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : namespace option) ?account_id:(account_id_ : account_id option) () =
  ({
     stat = stat_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
     account_id = account_id_;
   }
    : single_metric_anomaly_detector)

let make_set_alarm_state_input ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ~state_reason:(state_reason_ : state_reason) ~state_value:(state_value_ : state_value)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({
     state_reason_data = state_reason_data_;
     state_reason = state_reason_;
     state_value = state_value_;
     alarm_name = alarm_name_;
   }
    : set_alarm_state_input)

let make_schedule_configuration ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ~schedule_expression:(schedule_expression_ : schedule_expression) () =
  ({
     end_time_offset = end_time_offset_;
     start_time_offset = start_time_offset_;
     schedule_expression = schedule_expression_;
   }
    : schedule_configuration)

let make_scheduled_query_configuration ?tags:(tags_ : tag_list option)
    ?query_ar_n:(query_ar_n_ : amazon_resource_name option)
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option)
    ~aggregation_expression:(aggregation_expression_ : aggregation_expression)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~scheduled_query_role_ar_n:(scheduled_query_role_ar_n_ : amazon_resource_name)
    ~query_string:(query_string_ : query_string) () =
  ({
     tags = tags_;
     aggregation_expression = aggregation_expression_;
     schedule_configuration = schedule_configuration_;
     scheduled_query_role_ar_n = scheduled_query_role_ar_n_;
     query_ar_n = query_ar_n_;
     log_group_identifiers = log_group_identifiers_;
     query_string = query_string_;
   }
    : scheduled_query_configuration)

let make_schedule ?timezone:(timezone_ : timezone option) ~duration:(duration_ : duration)
    ~expression:(expression_ : expression) () =
  ({ timezone = timezone_; duration = duration_; expression = expression_ } : schedule)

let make_rule ~schedule:(schedule_ : schedule) () = ({ schedule = schedule_ } : rule)

let make_range ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp) () =
  ({ end_time = end_time_; start_time = start_time_ } : range)

let make_put_metric_stream_output ?arn:(arn_ : amazon_resource_name option) () =
  ({ arn = arn_ } : put_metric_stream_output)

let make_metric_stream_filter
    ?metric_names:(metric_names_ : metric_stream_filter_metric_names option)
    ?namespace:(namespace_ : namespace option) () =
  ({ metric_names = metric_names_; namespace = namespace_ } : metric_stream_filter)

let make_metric_stream_statistics_metric ~metric_name:(metric_name_ : metric_name)
    ~namespace:(namespace_ : namespace) () =
  ({ metric_name = metric_name_; namespace = namespace_ } : metric_stream_statistics_metric)

let make_metric_stream_statistics_configuration
    ~additional_statistics:(additional_statistics_ : metric_stream_statistics_additional_statistics)
    ~include_metrics:(include_metrics_ : metric_stream_statistics_include_metrics) () =
  ({ additional_statistics = additional_statistics_; include_metrics = include_metrics_ }
    : metric_stream_statistics_configuration)

let make_put_metric_stream_input
    ?include_linked_accounts_metrics:
      (include_linked_accounts_metrics_ : include_linked_accounts_metrics option)
    ?statistics_configurations:
      (statistics_configurations_ : metric_stream_statistics_configurations option)
    ?tags:(tags_ : tag_list option)
    ?exclude_filters:(exclude_filters_ : metric_stream_filters option)
    ?include_filters:(include_filters_ : metric_stream_filters option)
    ~output_format:(output_format_ : metric_stream_output_format)
    ~role_arn:(role_arn_ : amazon_resource_name)
    ~firehose_arn:(firehose_arn_ : amazon_resource_name) ~name:(name_ : metric_stream_name) () =
  ({
     include_linked_accounts_metrics = include_linked_accounts_metrics_;
     statistics_configurations = statistics_configurations_;
     tags = tags_;
     output_format = output_format_;
     role_arn = role_arn_;
     firehose_arn = firehose_arn_;
     exclude_filters = exclude_filters_;
     include_filters = include_filters_;
     name = name_;
   }
    : put_metric_stream_input)

let make_metric_datum ?storage_resolution:(storage_resolution_ : storage_resolution option)
    ?unit_:(unit__ : standard_unit option) ?counts:(counts_ : counts option)
    ?values:(values_ : values option) ?statistic_values:(statistic_values_ : statistic_set option)
    ?value:(value_ : datapoint_value option) ?timestamp:(timestamp_ : timestamp option)
    ?dimensions:(dimensions_ : dimensions option) ~metric_name:(metric_name_ : metric_name) () =
  ({
     storage_resolution = storage_resolution_;
     unit_ = unit__;
     counts = counts_;
     values = values_;
     statistic_values = statistic_values_;
     value = value_;
     timestamp = timestamp_;
     dimensions = dimensions_;
     metric_name = metric_name_;
   }
    : metric_datum)

let make_entity ?attributes:(attributes_ : entity_attributes_map option)
    ?key_attributes:(key_attributes_ : entity_key_attributes_map option) () =
  ({ attributes = attributes_; key_attributes = key_attributes_ } : entity)

let make_entity_metric_data ?metric_data:(metric_data_ : metric_data option)
    ?entity:(entity_ : entity option) () =
  ({ metric_data = metric_data_; entity = entity_ } : entity_metric_data)

let make_put_metric_data_input
    ?strict_entity_validation:(strict_entity_validation_ : strict_entity_validation option)
    ?entity_metric_data:(entity_metric_data_ : entity_metric_data_list option)
    ?metric_data:(metric_data_ : metric_data option) ~namespace:(namespace_ : namespace) () =
  ({
     strict_entity_validation = strict_entity_validation_;
     entity_metric_data = entity_metric_data_;
     metric_data = metric_data_;
     namespace = namespace_;
   }
    : put_metric_data_input)

let make_metric ?dimensions:(dimensions_ : dimensions option)
    ?metric_name:(metric_name_ : metric_name option) ?namespace:(namespace_ : namespace option) () =
  ({ dimensions = dimensions_; metric_name = metric_name_; namespace = namespace_ } : metric)

let make_metric_stat ?unit_:(unit__ : standard_unit option) ~stat:(stat_ : stat)
    ~period:(period_ : period) ~metric:(metric_ : metric) () =
  ({ unit_ = unit__; stat = stat_; period = period_; metric = metric_ } : metric_stat)

let make_metric_data_query ?account_id:(account_id_ : account_id option)
    ?period:(period_ : period option) ?return_data:(return_data_ : return_data option)
    ?label:(label_ : metric_label option) ?expression:(expression_ : metric_expression option)
    ?metric_stat:(metric_stat_ : metric_stat option) ~id:(id_ : metric_id) () =
  ({
     account_id = account_id_;
     period = period_;
     return_data = return_data_;
     label = label_;
     expression = expression_;
     metric_stat = metric_stat_;
     id = id_;
   }
    : metric_data_query)

let make_alarm_prom_ql_criteria ?recovery_period:(recovery_period_ : recovery_period option)
    ?pending_period:(pending_period_ : pending_period option) ~query:(query_ : query) () =
  ({ recovery_period = recovery_period_; pending_period = pending_period_; query = query_ }
    : alarm_prom_ql_criteria)

let make_put_metric_alarm_input
    ?evaluation_interval:(evaluation_interval_ : evaluation_interval option)
    ?evaluation_criteria:(evaluation_criteria_ : evaluation_criteria option)
    ?evaluation_window:(evaluation_window_ : evaluation_window option)
    ?threshold_metric_id:(threshold_metric_id_ : metric_id option) ?tags:(tags_ : tag_list option)
    ?metrics:(metrics_ : metric_data_queries option)
    ?evaluate_low_sample_count_percentile:
      (evaluate_low_sample_count_percentile_ : evaluate_low_sample_count_percentile option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?threshold:(threshold_ : threshold option)
    ?datapoints_to_alarm:(datapoints_to_alarm_ : datapoints_to_alarm option)
    ?evaluation_periods:(evaluation_periods_ : evaluation_periods option)
    ?unit_:(unit__ : standard_unit option) ?period:(period_ : period option)
    ?dimensions:(dimensions_ : dimensions option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?statistic:(statistic_ : statistic option) ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({
     evaluation_interval = evaluation_interval_;
     evaluation_criteria = evaluation_criteria_;
     evaluation_window = evaluation_window_;
     threshold_metric_id = threshold_metric_id_;
     tags = tags_;
     metrics = metrics_;
     evaluate_low_sample_count_percentile = evaluate_low_sample_count_percentile_;
     treat_missing_data = treat_missing_data_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     datapoints_to_alarm = datapoints_to_alarm_;
     evaluation_periods = evaluation_periods_;
     unit_ = unit__;
     period = period_;
     dimensions = dimensions_;
     extended_statistic = extended_statistic_;
     statistic = statistic_;
     namespace = namespace_;
     metric_name = metric_name_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_actions = alarm_actions_;
     ok_actions = ok_actions_;
     actions_enabled = actions_enabled_;
     alarm_description = alarm_description_;
     alarm_name = alarm_name_;
   }
    : put_metric_alarm_input)

let make_partial_failure ?failure_description:(failure_description_ : failure_description option)
    ?failure_code:(failure_code_ : failure_code option)
    ?exception_type:(exception_type_ : exception_type option)
    ?failure_resource:(failure_resource_ : failure_resource option) () =
  ({
     failure_description = failure_description_;
     failure_code = failure_code_;
     exception_type = exception_type_;
     failure_resource = failure_resource_;
   }
    : partial_failure)

let make_put_managed_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : put_managed_insight_rules_output)

let make_managed_rule ?tags:(tags_ : tag_list option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~template_name:(template_name_ : template_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_; template_name = template_name_ } : managed_rule)

let make_put_managed_insight_rules_input ~managed_rules:(managed_rules_ : managed_rules) () =
  ({ managed_rules = managed_rules_ } : put_managed_insight_rules_input)

let make_put_log_alarm_input ?tags:(tags_ : tag_list option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?action_log_line_role_arn:(action_log_line_role_arn_ : action_log_line_role_arn option)
    ?action_log_line_count:(action_log_line_count_ : action_log_line_count option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~threshold:(threshold_ : threshold)
    ~query_results_to_alarm:(query_results_to_alarm_ : query_results_to_alarm)
    ~query_results_to_evaluate:(query_results_to_evaluate_ : query_results_to_evaluate)
    ~scheduled_query_configuration:(scheduled_query_configuration_ : scheduled_query_configuration)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({
     tags = tags_;
     treat_missing_data = treat_missing_data_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     query_results_to_alarm = query_results_to_alarm_;
     query_results_to_evaluate = query_results_to_evaluate_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_actions = alarm_actions_;
     ok_actions = ok_actions_;
     actions_enabled = actions_enabled_;
     action_log_line_role_arn = action_log_line_role_arn_;
     action_log_line_count = action_log_line_count_;
     scheduled_query_configuration = scheduled_query_configuration_;
     alarm_description = alarm_description_;
     alarm_name = alarm_name_;
   }
    : put_log_alarm_input)

let make_put_insight_rule_output () = (() : unit)

let make_put_insight_rule_input
    ?apply_on_transformed_logs:
      (apply_on_transformed_logs_ : insight_rule_on_transformed_logs option)
    ?tags:(tags_ : tag_list option) ?rule_state:(rule_state_ : insight_rule_state option)
    ~rule_definition:(rule_definition_ : insight_rule_definition)
    ~rule_name:(rule_name_ : insight_rule_name) () =
  ({
     apply_on_transformed_logs = apply_on_transformed_logs_;
     tags = tags_;
     rule_definition = rule_definition_;
     rule_state = rule_state_;
     rule_name = rule_name_;
   }
    : put_insight_rule_input)

let make_dashboard_validation_message ?message:(message_ : message option)
    ?data_path:(data_path_ : data_path option) () =
  ({ message = message_; data_path = data_path_ } : dashboard_validation_message)

let make_put_dashboard_output
    ?dashboard_validation_messages:
      (dashboard_validation_messages_ : dashboard_validation_messages option) () =
  ({ dashboard_validation_messages = dashboard_validation_messages_ } : put_dashboard_output)

let make_put_dashboard_input ?tags:(tags_ : tag_list option)
    ~dashboard_body:(dashboard_body_ : dashboard_body)
    ~dashboard_name:(dashboard_name_ : dashboard_name) () =
  ({ tags = tags_; dashboard_body = dashboard_body_; dashboard_name = dashboard_name_ }
    : put_dashboard_input)

let make_put_composite_alarm_input
    ?actions_suppressor_extension_period:
      (actions_suppressor_extension_period_ : suppressor_period option)
    ?actions_suppressor_wait_period:(actions_suppressor_wait_period_ : suppressor_period option)
    ?actions_suppressor:(actions_suppressor_ : alarm_arn option) ?tags:(tags_ : tag_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ~alarm_rule:(alarm_rule_ : alarm_rule) ~alarm_name:(alarm_name_ : alarm_name) () =
  ({
     actions_suppressor_extension_period = actions_suppressor_extension_period_;
     actions_suppressor_wait_period = actions_suppressor_wait_period_;
     actions_suppressor = actions_suppressor_;
     tags = tags_;
     ok_actions = ok_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_rule = alarm_rule_;
     alarm_name = alarm_name_;
     alarm_description = alarm_description_;
     alarm_actions = alarm_actions_;
     actions_enabled = actions_enabled_;
   }
    : put_composite_alarm_input)

let make_put_anomaly_detector_output () = (() : unit)

let make_anomaly_detector_configuration
    ?metric_timezone:(metric_timezone_ : anomaly_detector_metric_timezone option)
    ?excluded_time_ranges:(excluded_time_ranges_ : anomaly_detector_excluded_time_ranges option) ()
    =
  ({ metric_timezone = metric_timezone_; excluded_time_ranges = excluded_time_ranges_ }
    : anomaly_detector_configuration)

let make_metric_characteristics ?periodic_spikes:(periodic_spikes_ : periodic_spikes option) () =
  ({ periodic_spikes = periodic_spikes_ } : metric_characteristics)

let make_metric_math_anomaly_detector
    ?metric_data_queries:(metric_data_queries_ : metric_data_queries option) () =
  ({ metric_data_queries = metric_data_queries_ } : metric_math_anomaly_detector)

let make_put_anomaly_detector_input
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?metric_characteristics:(metric_characteristics_ : metric_characteristics option)
    ?configuration:(configuration_ : anomaly_detector_configuration option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?dimensions:(dimensions_ : dimensions option) ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : namespace option) () =
  ({
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     metric_characteristics = metric_characteristics_;
     configuration = configuration_;
     stat = stat_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
   }
    : put_anomaly_detector_input)

let make_mute_targets ~alarm_names:(alarm_names_ : mute_target_alarm_name_list) () =
  ({ alarm_names = alarm_names_ } : mute_targets)

let make_put_alarm_mute_rule_input ?expire_date:(expire_date_ : timestamp option)
    ?start_date:(start_date_ : timestamp option) ?tags:(tags_ : tag_list option)
    ?mute_targets:(mute_targets_ : mute_targets option)
    ?description:(description_ : alarm_description option) ~rule:(rule_ : rule) ~name:(name_ : name)
    () =
  ({
     expire_date = expire_date_;
     start_date = start_date_;
     tags = tags_;
     mute_targets = mute_targets_;
     rule = rule_;
     description = description_;
     name = name_;
   }
    : put_alarm_mute_rule_input)

let make_metric_stream_entry ?output_format:(output_format_ : metric_stream_output_format option)
    ?state:(state_ : metric_stream_state option)
    ?firehose_arn:(firehose_arn_ : amazon_resource_name option)
    ?name:(name_ : metric_stream_name option)
    ?last_update_date:(last_update_date_ : timestamp option)
    ?creation_date:(creation_date_ : timestamp option) ?arn:(arn_ : amazon_resource_name option) ()
    =
  ({
     output_format = output_format_;
     state = state_;
     firehose_arn = firehose_arn_;
     name = name_;
     last_update_date = last_update_date_;
     creation_date = creation_date_;
     arn = arn_;
   }
    : metric_stream_entry)

let make_message_data ?value:(value_ : message_data_value option)
    ?code:(code_ : message_data_code option) () =
  ({ value = value_; code = code_ } : message_data)

let make_metric_alarm ?evaluation_interval:(evaluation_interval_ : evaluation_interval option)
    ?evaluation_criteria:(evaluation_criteria_ : evaluation_criteria option)
    ?evaluation_window:(evaluation_window_ : evaluation_window option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?threshold_metric_id:(threshold_metric_id_ : metric_id option)
    ?metrics:(metrics_ : metric_data_queries option)
    ?evaluate_low_sample_count_percentile:
      (evaluate_low_sample_count_percentile_ : evaluate_low_sample_count_percentile option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?threshold:(threshold_ : threshold option)
    ?datapoints_to_alarm:(datapoints_to_alarm_ : datapoints_to_alarm option)
    ?evaluation_periods:(evaluation_periods_ : evaluation_periods option)
    ?unit_:(unit__ : standard_unit option) ?period:(period_ : period option)
    ?dimensions:(dimensions_ : dimensions option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?statistic:(statistic_ : statistic option) ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_reason:(state_reason_ : state_reason option)
    ?state_value:(state_value_ : state_value option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option) ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({
     evaluation_interval = evaluation_interval_;
     evaluation_criteria = evaluation_criteria_;
     evaluation_window = evaluation_window_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     evaluation_state = evaluation_state_;
     threshold_metric_id = threshold_metric_id_;
     metrics = metrics_;
     evaluate_low_sample_count_percentile = evaluate_low_sample_count_percentile_;
     treat_missing_data = treat_missing_data_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     datapoints_to_alarm = datapoints_to_alarm_;
     evaluation_periods = evaluation_periods_;
     unit_ = unit__;
     period = period_;
     dimensions = dimensions_;
     extended_statistic = extended_statistic_;
     statistic = statistic_;
     namespace = namespace_;
     metric_name = metric_name_;
     state_updated_timestamp = state_updated_timestamp_;
     state_reason_data = state_reason_data_;
     state_reason = state_reason_;
     state_value = state_value_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_actions = alarm_actions_;
     ok_actions = ok_actions_;
     actions_enabled = actions_enabled_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     alarm_description = alarm_description_;
     alarm_arn = alarm_arn_;
     alarm_name = alarm_name_;
   }
    : metric_alarm)

let make_managed_rule_state ~state:(state_ : insight_rule_state)
    ~rule_name:(rule_name_ : insight_rule_name) () =
  ({ state = state_; rule_name = rule_name_ } : managed_rule_state)

let make_managed_rule_description ?rule_state:(rule_state_ : managed_rule_state option)
    ?resource_ar_n:(resource_ar_n_ : amazon_resource_name option)
    ?template_name:(template_name_ : template_name option) () =
  ({ rule_state = rule_state_; resource_ar_n = resource_ar_n_; template_name = template_name_ }
    : managed_rule_description)

let make_log_alarm
    ?action_log_line_role_arn:(action_log_line_role_arn_ : action_log_line_role_arn option)
    ?action_log_line_count:(action_log_line_count_ : action_log_line_count option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?threshold:(threshold_ : threshold option)
    ?query_results_to_alarm:(query_results_to_alarm_ : query_results_to_alarm option)
    ?query_results_to_evaluate:(query_results_to_evaluate_ : query_results_to_evaluate option)
    ?scheduled_query_configuration:
      (scheduled_query_configuration_ : scheduled_query_configuration option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_reason:(state_reason_ : state_reason option)
    ?state_value:(state_value_ : state_value option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option) ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({
     action_log_line_role_arn = action_log_line_role_arn_;
     action_log_line_count = action_log_line_count_;
     evaluation_state = evaluation_state_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     treat_missing_data = treat_missing_data_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     query_results_to_alarm = query_results_to_alarm_;
     query_results_to_evaluate = query_results_to_evaluate_;
     scheduled_query_configuration = scheduled_query_configuration_;
     state_updated_timestamp = state_updated_timestamp_;
     state_reason_data = state_reason_data_;
     state_reason = state_reason_;
     state_value = state_value_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_actions = alarm_actions_;
     ok_actions = ok_actions_;
     actions_enabled = actions_enabled_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     alarm_description = alarm_description_;
     alarm_arn = alarm_arn_;
     alarm_name = alarm_name_;
   }
    : log_alarm)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_input)

let make_list_metrics_output ?owning_accounts:(owning_accounts_ : owning_accounts option)
    ?next_token:(next_token_ : next_token option) ?metrics:(metrics_ : metrics option) () =
  ({ owning_accounts = owning_accounts_; next_token = next_token_; metrics = metrics_ }
    : list_metrics_output)

let make_dimension_filter ?value:(value_ : dimension_value option) ~name:(name_ : dimension_name) ()
    =
  ({ value = value_; name = name_ } : dimension_filter)

let make_list_metrics_input ?owning_account:(owning_account_ : account_id option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?recently_active:(recently_active_ : recently_active option)
    ?next_token:(next_token_ : next_token option)
    ?dimensions:(dimensions_ : dimension_filters option)
    ?metric_name:(metric_name_ : metric_name option) ?namespace:(namespace_ : namespace option) () =
  ({
     owning_account = owning_account_;
     include_linked_accounts = include_linked_accounts_;
     recently_active = recently_active_;
     next_token = next_token_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
   }
    : list_metrics_input)

let make_list_metric_streams_output ?entries:(entries_ : metric_stream_entries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ entries = entries_; next_token = next_token_ } : list_metric_streams_output)

let make_list_metric_streams_input
    ?max_results:(max_results_ : list_metric_streams_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_metric_streams_input)

let make_list_managed_insight_rules_output ?next_token:(next_token_ : next_token option)
    ?managed_rules:(managed_rules_ : managed_rule_descriptions option) () =
  ({ next_token = next_token_; managed_rules = managed_rules_ } : list_managed_insight_rules_output)

let make_list_managed_insight_rules_input
    ?max_results:(max_results_ : insight_rule_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ max_results = max_results_; next_token = next_token_; resource_ar_n = resource_ar_n_ }
    : list_managed_insight_rules_input)

let make_dashboard_entry ?size:(size_ : size option)
    ?last_modified:(last_modified_ : last_modified option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?dashboard_name:(dashboard_name_ : dashboard_name option) () =
  ({
     size = size_;
     last_modified = last_modified_;
     dashboard_arn = dashboard_arn_;
     dashboard_name = dashboard_name_;
   }
    : dashboard_entry)

let make_list_dashboards_output ?next_token:(next_token_ : next_token option)
    ?dashboard_entries:(dashboard_entries_ : dashboard_entries option) () =
  ({ next_token = next_token_; dashboard_entries = dashboard_entries_ } : list_dashboards_output)

let make_list_dashboards_input ?next_token:(next_token_ : next_token option)
    ?dashboard_name_prefix:(dashboard_name_prefix_ : dashboard_name_prefix option) () =
  ({ next_token = next_token_; dashboard_name_prefix = dashboard_name_prefix_ }
    : list_dashboards_input)

let make_alarm_mute_rule_summary
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option)
    ?mute_type:(mute_type_ : mute_type option) ?status:(status_ : alarm_mute_rule_status option)
    ?expire_date:(expire_date_ : timestamp option)
    ?alarm_mute_rule_arn:(alarm_mute_rule_arn_ : arn option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     mute_type = mute_type_;
     status = status_;
     expire_date = expire_date_;
     alarm_mute_rule_arn = alarm_mute_rule_arn_;
   }
    : alarm_mute_rule_summary)

let make_list_alarm_mute_rules_output ?next_token:(next_token_ : next_token option)
    ?alarm_mute_rule_summaries:(alarm_mute_rule_summaries_ : alarm_mute_rule_summaries option) () =
  ({ next_token = next_token_; alarm_mute_rule_summaries = alarm_mute_rule_summaries_ }
    : list_alarm_mute_rules_output)

let make_list_alarm_mute_rules_input ?next_token:(next_token_ : next_token option)
    ?max_records:(max_records_ : max_records option)
    ?statuses:(statuses_ : alarm_mute_rule_statuses option) ?alarm_name:(alarm_name_ : name option)
    () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     statuses = statuses_;
     alarm_name = alarm_name_;
   }
    : list_alarm_mute_rules_input)

let make_label_options ?timezone:(timezone_ : get_metric_data_label_timezone option) () =
  ({ timezone = timezone_ } : label_options)

let make_insight_rule
    ?apply_on_transformed_logs:
      (apply_on_transformed_logs_ : insight_rule_on_transformed_logs option)
    ?managed_rule:(managed_rule_ : insight_rule_is_managed option)
    ~definition:(definition_ : insight_rule_definition) ~schema:(schema_ : insight_rule_schema)
    ~state:(state_ : insight_rule_state) ~name:(name_ : insight_rule_name) () =
  ({
     apply_on_transformed_logs = apply_on_transformed_logs_;
     managed_rule = managed_rule_;
     definition = definition_;
     schema = schema_;
     state = state_;
     name = name_;
   }
    : insight_rule)

let make_insight_rule_metric_datapoint ?maximum:(maximum_ : insight_rule_unbound_double option)
    ?minimum:(minimum_ : insight_rule_unbound_double option)
    ?sum:(sum_ : insight_rule_unbound_double option)
    ?average:(average_ : insight_rule_unbound_double option)
    ?sample_count:(sample_count_ : insight_rule_unbound_double option)
    ?max_contributor_value:(max_contributor_value_ : insight_rule_unbound_double option)
    ?unique_contributors:(unique_contributors_ : insight_rule_unbound_double option)
    ~timestamp:(timestamp_ : timestamp) () =
  ({
     maximum = maximum_;
     minimum = minimum_;
     sum = sum_;
     average = average_;
     sample_count = sample_count_;
     max_contributor_value = max_contributor_value_;
     unique_contributors = unique_contributors_;
     timestamp = timestamp_;
   }
    : insight_rule_metric_datapoint)

let make_insight_rule_contributor_datapoint
    ~approximate_value:(approximate_value_ : insight_rule_unbound_double)
    ~timestamp:(timestamp_ : timestamp) () =
  ({ approximate_value = approximate_value_; timestamp = timestamp_ }
    : insight_rule_contributor_datapoint)

let make_insight_rule_contributor ~datapoints:(datapoints_ : insight_rule_contributor_datapoints)
    ~approximate_aggregate_value:(approximate_aggregate_value_ : insight_rule_unbound_double)
    ~keys:(keys_ : insight_rule_contributor_keys) () =
  ({
     datapoints = datapoints_;
     approximate_aggregate_value = approximate_aggregate_value_;
     keys = keys_;
   }
    : insight_rule_contributor)

let make_get_o_tel_enrichment_output ~status:(status_ : o_tel_enrichment_status) () =
  ({ status = status_ } : get_o_tel_enrichment_output)

let make_get_o_tel_enrichment_input () = (() : unit)

let make_get_metric_widget_image_output
    ?metric_widget_image:(metric_widget_image_ : metric_widget_image option) () =
  ({ metric_widget_image = metric_widget_image_ } : get_metric_widget_image_output)

let make_get_metric_widget_image_input ?output_format:(output_format_ : output_format option)
    ~metric_widget:(metric_widget_ : metric_widget) () =
  ({ output_format = output_format_; metric_widget = metric_widget_ }
    : get_metric_widget_image_input)

let make_get_metric_stream_output
    ?include_linked_accounts_metrics:
      (include_linked_accounts_metrics_ : include_linked_accounts_metrics option)
    ?statistics_configurations:
      (statistics_configurations_ : metric_stream_statistics_configurations option)
    ?output_format:(output_format_ : metric_stream_output_format option)
    ?last_update_date:(last_update_date_ : timestamp option)
    ?creation_date:(creation_date_ : timestamp option) ?state:(state_ : metric_stream_state option)
    ?role_arn:(role_arn_ : amazon_resource_name option)
    ?firehose_arn:(firehose_arn_ : amazon_resource_name option)
    ?exclude_filters:(exclude_filters_ : metric_stream_filters option)
    ?include_filters:(include_filters_ : metric_stream_filters option)
    ?name:(name_ : metric_stream_name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     include_linked_accounts_metrics = include_linked_accounts_metrics_;
     statistics_configurations = statistics_configurations_;
     output_format = output_format_;
     last_update_date = last_update_date_;
     creation_date = creation_date_;
     state = state_;
     role_arn = role_arn_;
     firehose_arn = firehose_arn_;
     exclude_filters = exclude_filters_;
     include_filters = include_filters_;
     name = name_;
     arn = arn_;
   }
    : get_metric_stream_output)

let make_get_metric_stream_input ~name:(name_ : metric_stream_name) () =
  ({ name = name_ } : get_metric_stream_input)

let make_datapoint ?extended_statistics:(extended_statistics_ : datapoint_value_map option)
    ?unit_:(unit__ : standard_unit option) ?maximum:(maximum_ : datapoint_value option)
    ?minimum:(minimum_ : datapoint_value option) ?sum:(sum_ : datapoint_value option)
    ?average:(average_ : datapoint_value option)
    ?sample_count:(sample_count_ : datapoint_value option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({
     extended_statistics = extended_statistics_;
     unit_ = unit__;
     maximum = maximum_;
     minimum = minimum_;
     sum = sum_;
     average = average_;
     sample_count = sample_count_;
     timestamp = timestamp_;
   }
    : datapoint)

let make_get_metric_statistics_output ?datapoints:(datapoints_ : datapoints option)
    ?label:(label_ : metric_label option) () =
  ({ datapoints = datapoints_; label = label_ } : get_metric_statistics_output)

let make_get_metric_statistics_input ?unit_:(unit__ : standard_unit option)
    ?extended_statistics:(extended_statistics_ : extended_statistics option)
    ?statistics:(statistics_ : statistics option) ?dimensions:(dimensions_ : dimensions option)
    ~period:(period_ : period) ~end_time:(end_time_ : timestamp)
    ~start_time:(start_time_ : timestamp) ~metric_name:(metric_name_ : metric_name)
    ~namespace:(namespace_ : namespace) () =
  ({
     unit_ = unit__;
     extended_statistics = extended_statistics_;
     statistics = statistics_;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
   }
    : get_metric_statistics_input)

let make_get_metric_data_output ?messages:(messages_ : metric_data_result_messages option)
    ?next_token:(next_token_ : next_token option)
    ?metric_data_results:(metric_data_results_ : metric_data_results option) () =
  ({ messages = messages_; next_token = next_token_; metric_data_results = metric_data_results_ }
    : get_metric_data_output)

let make_get_metric_data_input ?label_options:(label_options_ : label_options option)
    ?max_datapoints:(max_datapoints_ : get_metric_data_max_datapoints option)
    ?scan_by:(scan_by_ : scan_by option) ?next_token:(next_token_ : next_token option)
    ~end_time:(end_time_ : timestamp) ~start_time:(start_time_ : timestamp)
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries) () =
  ({
     label_options = label_options_;
     max_datapoints = max_datapoints_;
     scan_by = scan_by_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     metric_data_queries = metric_data_queries_;
   }
    : get_metric_data_input)

let make_get_insight_rule_report_output
    ?metric_datapoints:(metric_datapoints_ : insight_rule_metric_datapoints option)
    ?contributors:(contributors_ : insight_rule_contributors option)
    ?approximate_unique_count:(approximate_unique_count_ : insight_rule_unbound_long option)
    ?aggregate_value:(aggregate_value_ : insight_rule_unbound_double option)
    ?aggregation_statistic:(aggregation_statistic_ : insight_rule_aggregation_statistic option)
    ?key_labels:(key_labels_ : insight_rule_contributor_key_labels option) () =
  ({
     metric_datapoints = metric_datapoints_;
     contributors = contributors_;
     approximate_unique_count = approximate_unique_count_;
     aggregate_value = aggregate_value_;
     aggregation_statistic = aggregation_statistic_;
     key_labels = key_labels_;
   }
    : get_insight_rule_report_output)

let make_get_insight_rule_report_input ?order_by:(order_by_ : insight_rule_order_by option)
    ?metrics:(metrics_ : insight_rule_metric_list option)
    ?max_contributor_count:(max_contributor_count_ : insight_rule_unbound_integer option)
    ~period:(period_ : period) ~end_time:(end_time_ : timestamp)
    ~start_time:(start_time_ : timestamp) ~rule_name:(rule_name_ : insight_rule_name) () =
  ({
     order_by = order_by_;
     metrics = metrics_;
     max_contributor_count = max_contributor_count_;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     rule_name = rule_name_;
   }
    : get_insight_rule_report_input)

let make_get_dataset_output ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ~arn:(arn_ : dataset_arn) ~dataset_id:(dataset_id_ : dataset_id) () =
  ({ kms_key_arn = kms_key_arn_; arn = arn_; dataset_id = dataset_id_ } : get_dataset_output)

let make_get_dataset_input ~dataset_identifier:(dataset_identifier_ : dataset_identifier) () =
  ({ dataset_identifier = dataset_identifier_ } : get_dataset_input)

let make_get_dashboard_output ?dashboard_name:(dashboard_name_ : dashboard_name option)
    ?dashboard_body:(dashboard_body_ : dashboard_body option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option) () =
  ({
     dashboard_name = dashboard_name_;
     dashboard_body = dashboard_body_;
     dashboard_arn = dashboard_arn_;
   }
    : get_dashboard_output)

let make_get_dashboard_input ~dashboard_name:(dashboard_name_ : dashboard_name) () =
  ({ dashboard_name = dashboard_name_ } : get_dashboard_input)

let make_get_alarm_mute_rule_output ?mute_type:(mute_type_ : mute_type option)
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option)
    ?status:(status_ : alarm_mute_rule_status option) ?expire_date:(expire_date_ : timestamp option)
    ?start_date:(start_date_ : timestamp option) ?mute_targets:(mute_targets_ : mute_targets option)
    ?rule:(rule_ : rule option) ?description:(description_ : alarm_description option)
    ?alarm_mute_rule_arn:(alarm_mute_rule_arn_ : arn option) ?name:(name_ : name option) () =
  ({
     mute_type = mute_type_;
     last_updated_timestamp = last_updated_timestamp_;
     status = status_;
     expire_date = expire_date_;
     start_date = start_date_;
     mute_targets = mute_targets_;
     rule = rule_;
     description = description_;
     alarm_mute_rule_arn = alarm_mute_rule_arn_;
     name = name_;
   }
    : get_alarm_mute_rule_output)

let make_get_alarm_mute_rule_input ~alarm_mute_rule_name:(alarm_mute_rule_name_ : name) () =
  ({ alarm_mute_rule_name = alarm_mute_rule_name_ } : get_alarm_mute_rule_input)

let make_enable_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : enable_insight_rules_output)

let make_enable_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : enable_insight_rules_input)

let make_enable_alarm_actions_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : enable_alarm_actions_input)

let make_disassociate_dataset_kms_key_output () = (() : unit)

let make_disassociate_dataset_kms_key_input
    ~dataset_identifier:(dataset_identifier_ : dataset_identifier) () =
  ({ dataset_identifier = dataset_identifier_ } : disassociate_dataset_kms_key_input)

let make_disable_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : disable_insight_rules_output)

let make_disable_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : disable_insight_rules_input)

let make_disable_alarm_actions_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : disable_alarm_actions_input)

let make_describe_insight_rules_output ?insight_rules:(insight_rules_ : insight_rules option)
    ?next_token:(next_token_ : next_token option) () =
  ({ insight_rules = insight_rules_; next_token = next_token_ } : describe_insight_rules_output)

let make_describe_insight_rules_input ?max_results:(max_results_ : insight_rule_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_insight_rules_input)

let make_anomaly_detector
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?metric_characteristics:(metric_characteristics_ : metric_characteristics option)
    ?state_value:(state_value_ : anomaly_detector_state_value option)
    ?configuration:(configuration_ : anomaly_detector_configuration option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?dimensions:(dimensions_ : dimensions option) ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : namespace option) () =
  ({
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     metric_characteristics = metric_characteristics_;
     state_value = state_value_;
     configuration = configuration_;
     stat = stat_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
   }
    : anomaly_detector)

let make_describe_anomaly_detectors_output ?next_token:(next_token_ : next_token option)
    ?anomaly_detectors:(anomaly_detectors_ : anomaly_detectors option) () =
  ({ next_token = next_token_; anomaly_detectors = anomaly_detectors_ }
    : describe_anomaly_detectors_output)

let make_describe_anomaly_detectors_input
    ?anomaly_detector_types:(anomaly_detector_types_ : anomaly_detector_types option)
    ?dimensions:(dimensions_ : dimensions option) ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : namespace option)
    ?max_results:(max_results_ : max_returned_results_count option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     anomaly_detector_types = anomaly_detector_types_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_anomaly_detectors_input)

let make_describe_alarms_for_metric_output ?metric_alarms:(metric_alarms_ : metric_alarms option) ()
    =
  ({ metric_alarms = metric_alarms_ } : describe_alarms_for_metric_output)

let make_describe_alarms_for_metric_input ?unit_:(unit__ : standard_unit option)
    ?period:(period_ : period option) ?dimensions:(dimensions_ : dimensions option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?statistic:(statistic_ : statistic option) ~namespace:(namespace_ : namespace)
    ~metric_name:(metric_name_ : metric_name) () =
  ({
     unit_ = unit__;
     period = period_;
     dimensions = dimensions_;
     extended_statistic = extended_statistic_;
     statistic = statistic_;
     namespace = namespace_;
     metric_name = metric_name_;
   }
    : describe_alarms_for_metric_input)

let make_composite_alarm
    ?actions_suppressor_extension_period:
      (actions_suppressor_extension_period_ : suppressor_period option)
    ?actions_suppressor_wait_period:(actions_suppressor_wait_period_ : suppressor_period option)
    ?actions_suppressor:(actions_suppressor_ : alarm_arn option)
    ?actions_suppressed_reason:(actions_suppressed_reason_ : actions_suppressed_reason option)
    ?actions_suppressed_by:(actions_suppressed_by_ : actions_suppressed_by option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?state_value:(state_value_ : state_value option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_reason:(state_reason_ : state_reason option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?alarm_rule:(alarm_rule_ : alarm_rule option) ?alarm_name:(alarm_name_ : alarm_name option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option) () =
  ({
     actions_suppressor_extension_period = actions_suppressor_extension_period_;
     actions_suppressor_wait_period = actions_suppressor_wait_period_;
     actions_suppressor = actions_suppressor_;
     actions_suppressed_reason = actions_suppressed_reason_;
     actions_suppressed_by = actions_suppressed_by_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     state_value = state_value_;
     state_updated_timestamp = state_updated_timestamp_;
     state_reason_data = state_reason_data_;
     state_reason = state_reason_;
     ok_actions = ok_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     alarm_rule = alarm_rule_;
     alarm_name = alarm_name_;
     alarm_description = alarm_description_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     alarm_arn = alarm_arn_;
     alarm_actions = alarm_actions_;
     actions_enabled = actions_enabled_;
   }
    : composite_alarm)

let make_describe_alarms_output ?next_token:(next_token_ : next_token option)
    ?log_alarms:(log_alarms_ : log_alarms option)
    ?metric_alarms:(metric_alarms_ : metric_alarms option)
    ?composite_alarms:(composite_alarms_ : composite_alarms option) () =
  ({
     next_token = next_token_;
     log_alarms = log_alarms_;
     metric_alarms = metric_alarms_;
     composite_alarms = composite_alarms_;
   }
    : describe_alarms_output)

let make_describe_alarms_input ?next_token:(next_token_ : next_token option)
    ?max_records:(max_records_ : max_records option)
    ?action_prefix:(action_prefix_ : action_prefix option)
    ?state_value:(state_value_ : state_value option)
    ?parents_of_alarm_name:(parents_of_alarm_name_ : alarm_name option)
    ?children_of_alarm_name:(children_of_alarm_name_ : alarm_name option)
    ?alarm_types:(alarm_types_ : alarm_types option)
    ?alarm_name_prefix:(alarm_name_prefix_ : alarm_name_prefix option)
    ?alarm_names:(alarm_names_ : alarm_names option) () =
  ({
     next_token = next_token_;
     max_records = max_records_;
     action_prefix = action_prefix_;
     state_value = state_value_;
     parents_of_alarm_name = parents_of_alarm_name_;
     children_of_alarm_name = children_of_alarm_name_;
     alarm_types = alarm_types_;
     alarm_name_prefix = alarm_name_prefix_;
     alarm_names = alarm_names_;
   }
    : describe_alarms_input)

let make_alarm_history_item
    ?alarm_contributor_attributes:(alarm_contributor_attributes_ : contributor_attributes option)
    ?history_data:(history_data_ : history_data option)
    ?history_summary:(history_summary_ : history_summary option)
    ?history_item_type:(history_item_type_ : history_item_type option)
    ?timestamp:(timestamp_ : timestamp option) ?alarm_type:(alarm_type_ : alarm_type option)
    ?alarm_contributor_id:(alarm_contributor_id_ : contributor_id option)
    ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({
     alarm_contributor_attributes = alarm_contributor_attributes_;
     history_data = history_data_;
     history_summary = history_summary_;
     history_item_type = history_item_type_;
     timestamp = timestamp_;
     alarm_type = alarm_type_;
     alarm_contributor_id = alarm_contributor_id_;
     alarm_name = alarm_name_;
   }
    : alarm_history_item)

let make_describe_alarm_history_output ?next_token:(next_token_ : next_token option)
    ?alarm_history_items:(alarm_history_items_ : alarm_history_items option) () =
  ({ next_token = next_token_; alarm_history_items = alarm_history_items_ }
    : describe_alarm_history_output)

let make_describe_alarm_history_input ?scan_by:(scan_by_ : scan_by option)
    ?next_token:(next_token_ : next_token option) ?max_records:(max_records_ : max_records option)
    ?end_date:(end_date_ : timestamp option) ?start_date:(start_date_ : timestamp option)
    ?history_item_type:(history_item_type_ : history_item_type option)
    ?alarm_types:(alarm_types_ : alarm_types option)
    ?alarm_contributor_id:(alarm_contributor_id_ : contributor_id option)
    ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({
     scan_by = scan_by_;
     next_token = next_token_;
     max_records = max_records_;
     end_date = end_date_;
     start_date = start_date_;
     history_item_type = history_item_type_;
     alarm_types = alarm_types_;
     alarm_contributor_id = alarm_contributor_id_;
     alarm_name = alarm_name_;
   }
    : describe_alarm_history_input)

let make_alarm_contributor
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ~state_reason:(state_reason_ : state_reason)
    ~contributor_attributes:(contributor_attributes_ : contributor_attributes)
    ~contributor_id:(contributor_id_ : contributor_id) () =
  ({
     state_transitioned_timestamp = state_transitioned_timestamp_;
     state_reason = state_reason_;
     contributor_attributes = contributor_attributes_;
     contributor_id = contributor_id_;
   }
    : alarm_contributor)

let make_describe_alarm_contributors_output ?next_token:(next_token_ : next_token option)
    ~alarm_contributors:(alarm_contributors_ : alarm_contributors) () =
  ({ next_token = next_token_; alarm_contributors = alarm_contributors_ }
    : describe_alarm_contributors_output)

let make_describe_alarm_contributors_input ?next_token:(next_token_ : next_token option)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({ next_token = next_token_; alarm_name = alarm_name_ } : describe_alarm_contributors_input)

let make_delete_metric_stream_output () = (() : unit)

let make_delete_metric_stream_input ~name:(name_ : metric_stream_name) () =
  ({ name = name_ } : delete_metric_stream_input)

let make_delete_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : delete_insight_rules_output)

let make_delete_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : delete_insight_rules_input)

let make_delete_dashboards_output () = (() : unit)

let make_delete_dashboards_input ~dashboard_names:(dashboard_names_ : dashboard_names) () =
  ({ dashboard_names = dashboard_names_ } : delete_dashboards_input)

let make_delete_anomaly_detector_output () = (() : unit)

let make_delete_anomaly_detector_input
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?dimensions:(dimensions_ : dimensions option) ?metric_name:(metric_name_ : metric_name option)
    ?namespace:(namespace_ : namespace option) () =
  ({
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     stat = stat_;
     dimensions = dimensions_;
     metric_name = metric_name_;
     namespace = namespace_;
   }
    : delete_anomaly_detector_input)

let make_delete_alarms_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : delete_alarms_input)

let make_delete_alarm_mute_rule_input ~alarm_mute_rule_name:(alarm_mute_rule_name_ : name) () =
  ({ alarm_mute_rule_name = alarm_mute_rule_name_ } : delete_alarm_mute_rule_input)

let make_associate_dataset_kms_key_output () = (() : unit)

let make_associate_dataset_kms_key_input ~kms_key_arn:(kms_key_arn_ : kms_key_arn)
    ~dataset_identifier:(dataset_identifier_ : dataset_identifier) () =
  ({ kms_key_arn = kms_key_arn_; dataset_identifier = dataset_identifier_ }
    : associate_dataset_kms_key_input)
