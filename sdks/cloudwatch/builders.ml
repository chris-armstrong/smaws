open Types

let make_alarm_contributor
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ~contributor_id:(contributor_id_ : contributor_id)
    ~contributor_attributes:(contributor_attributes_ : contributor_attributes)
    ~state_reason:(state_reason_ : state_reason) () =
  ({
     contributor_id = contributor_id_;
     contributor_attributes = contributor_attributes_;
     state_reason = state_reason_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
   }
    : alarm_contributor)

let make_alarm_history_item ?alarm_name:(alarm_name_ : alarm_name option)
    ?alarm_contributor_id:(alarm_contributor_id_ : contributor_id option)
    ?alarm_type:(alarm_type_ : alarm_type option) ?timestamp:(timestamp_ : timestamp option)
    ?history_item_type:(history_item_type_ : history_item_type option)
    ?history_summary:(history_summary_ : history_summary option)
    ?history_data:(history_data_ : history_data option)
    ?alarm_contributor_attributes:(alarm_contributor_attributes_ : contributor_attributes option) ()
    =
  ({
     alarm_name = alarm_name_;
     alarm_contributor_id = alarm_contributor_id_;
     alarm_type = alarm_type_;
     timestamp = timestamp_;
     history_item_type = history_item_type_;
     history_summary = history_summary_;
     history_data = history_data_;
     alarm_contributor_attributes = alarm_contributor_attributes_;
   }
    : alarm_history_item)

let make_alarm_mute_rule_summary ?alarm_mute_rule_arn:(alarm_mute_rule_arn_ : arn option)
    ?expire_date:(expire_date_ : timestamp option) ?status:(status_ : alarm_mute_rule_status option)
    ?mute_type:(mute_type_ : mute_type option)
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option) () =
  ({
     alarm_mute_rule_arn = alarm_mute_rule_arn_;
     expire_date = expire_date_;
     status = status_;
     mute_type = mute_type_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : alarm_mute_rule_summary)

let make_alarm_prom_ql_criteria ?pending_period:(pending_period_ : pending_period option)
    ?recovery_period:(recovery_period_ : recovery_period option) ~query:(query_ : query) () =
  ({ query = query_; pending_period = pending_period_; recovery_period = recovery_period_ }
    : alarm_prom_ql_criteria)

let make_dimension ~name:(name_ : dimension_name) ~value:(value_ : dimension_value) () =
  ({ name = name_; value = value_ } : dimension)

let make_metric ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option) ?dimensions:(dimensions_ : dimensions option)
    () =
  ({ namespace = namespace_; metric_name = metric_name_; dimensions = dimensions_ } : metric)

let make_metric_stat ?unit_:(unit__ : standard_unit option) ~metric:(metric_ : metric)
    ~period:(period_ : period) ~stat:(stat_ : stat) () =
  ({ metric = metric_; period = period_; stat = stat_; unit_ = unit__ } : metric_stat)

let make_metric_data_query ?metric_stat:(metric_stat_ : metric_stat option)
    ?expression:(expression_ : metric_expression option) ?label:(label_ : metric_label option)
    ?return_data:(return_data_ : return_data option) ?period:(period_ : period option)
    ?account_id:(account_id_ : account_id option) ~id:(id_ : metric_id) () =
  ({
     id = id_;
     metric_stat = metric_stat_;
     expression = expression_;
     label = label_;
     return_data = return_data_;
     period = period_;
     account_id = account_id_;
   }
    : metric_data_query)

let make_metric_math_anomaly_detector
    ?metric_data_queries:(metric_data_queries_ : metric_data_queries option) () =
  ({ metric_data_queries = metric_data_queries_ } : metric_math_anomaly_detector)

let make_single_metric_anomaly_detector ?account_id:(account_id_ : account_id option)
    ?namespace:(namespace_ : namespace option) ?metric_name:(metric_name_ : metric_name option)
    ?dimensions:(dimensions_ : dimensions option)
    ?stat:(stat_ : anomaly_detector_metric_stat option) () =
  ({
     account_id = account_id_;
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     stat = stat_;
   }
    : single_metric_anomaly_detector)

let make_metric_characteristics ?periodic_spikes:(periodic_spikes_ : periodic_spikes option) () =
  ({ periodic_spikes = periodic_spikes_ } : metric_characteristics)

let make_range ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp) () =
  ({ start_time = start_time_; end_time = end_time_ } : range)

let make_anomaly_detector_configuration
    ?excluded_time_ranges:(excluded_time_ranges_ : anomaly_detector_excluded_time_ranges option)
    ?metric_timezone:(metric_timezone_ : anomaly_detector_metric_timezone option) () =
  ({ excluded_time_ranges = excluded_time_ranges_; metric_timezone = metric_timezone_ }
    : anomaly_detector_configuration)

let make_anomaly_detector ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option) ?dimensions:(dimensions_ : dimensions option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?configuration:(configuration_ : anomaly_detector_configuration option)
    ?state_value:(state_value_ : anomaly_detector_state_value option)
    ?metric_characteristics:(metric_characteristics_ : metric_characteristics option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option) () =
  ({
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     stat = stat_;
     configuration = configuration_;
     state_value = state_value_;
     metric_characteristics = metric_characteristics_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
   }
    : anomaly_detector)

let make_associate_dataset_kms_key_output () = (() : unit)

let make_associate_dataset_kms_key_input
    ~dataset_identifier:(dataset_identifier_ : dataset_identifier)
    ~kms_key_arn:(kms_key_arn_ : kms_key_arn) () =
  ({ dataset_identifier = dataset_identifier_; kms_key_arn = kms_key_arn_ }
    : associate_dataset_kms_key_input)

let make_partial_failure ?failure_resource:(failure_resource_ : failure_resource option)
    ?exception_type:(exception_type_ : exception_type option)
    ?failure_code:(failure_code_ : failure_code option)
    ?failure_description:(failure_description_ : failure_description option) () =
  ({
     failure_resource = failure_resource_;
     exception_type = exception_type_;
     failure_code = failure_code_;
     failure_description = failure_description_;
   }
    : partial_failure)

let make_composite_alarm ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_name:(alarm_name_ : alarm_name option) ?alarm_rule:(alarm_rule_ : alarm_rule option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?state_reason:(state_reason_ : state_reason option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?state_value:(state_value_ : state_value option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?actions_suppressed_by:(actions_suppressed_by_ : actions_suppressed_by option)
    ?actions_suppressed_reason:(actions_suppressed_reason_ : actions_suppressed_reason option)
    ?actions_suppressor:(actions_suppressor_ : alarm_arn option)
    ?actions_suppressor_wait_period:(actions_suppressor_wait_period_ : suppressor_period option)
    ?actions_suppressor_extension_period:
      (actions_suppressor_extension_period_ : suppressor_period option) () =
  ({
     actions_enabled = actions_enabled_;
     alarm_actions = alarm_actions_;
     alarm_arn = alarm_arn_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     alarm_description = alarm_description_;
     alarm_name = alarm_name_;
     alarm_rule = alarm_rule_;
     insufficient_data_actions = insufficient_data_actions_;
     ok_actions = ok_actions_;
     state_reason = state_reason_;
     state_reason_data = state_reason_data_;
     state_updated_timestamp = state_updated_timestamp_;
     state_value = state_value_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     actions_suppressed_by = actions_suppressed_by_;
     actions_suppressed_reason = actions_suppressed_reason_;
     actions_suppressor = actions_suppressor_;
     actions_suppressor_wait_period = actions_suppressor_wait_period_;
     actions_suppressor_extension_period = actions_suppressor_extension_period_;
   }
    : composite_alarm)

let make_dashboard_entry ?dashboard_name:(dashboard_name_ : dashboard_name option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?last_modified:(last_modified_ : last_modified option) ?size:(size_ : size option) () =
  ({
     dashboard_name = dashboard_name_;
     dashboard_arn = dashboard_arn_;
     last_modified = last_modified_;
     size = size_;
   }
    : dashboard_entry)

let make_dashboard_validation_message ?data_path:(data_path_ : data_path option)
    ?message:(message_ : message option) () =
  ({ data_path = data_path_; message = message_ } : dashboard_validation_message)

let make_datapoint ?timestamp:(timestamp_ : timestamp option)
    ?sample_count:(sample_count_ : datapoint_value option)
    ?average:(average_ : datapoint_value option) ?sum:(sum_ : datapoint_value option)
    ?minimum:(minimum_ : datapoint_value option) ?maximum:(maximum_ : datapoint_value option)
    ?unit_:(unit__ : standard_unit option)
    ?extended_statistics:(extended_statistics_ : datapoint_value_map option) () =
  ({
     timestamp = timestamp_;
     sample_count = sample_count_;
     average = average_;
     sum = sum_;
     minimum = minimum_;
     maximum = maximum_;
     unit_ = unit__;
     extended_statistics = extended_statistics_;
   }
    : datapoint)

let make_delete_alarm_mute_rule_input ~alarm_mute_rule_name:(alarm_mute_rule_name_ : name) () =
  ({ alarm_mute_rule_name = alarm_mute_rule_name_ } : delete_alarm_mute_rule_input)

let make_delete_alarms_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : delete_alarms_input)

let make_delete_anomaly_detector_output () = (() : unit)

let make_delete_anomaly_detector_input ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option) ?dimensions:(dimensions_ : dimensions option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option) () =
  ({
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     stat = stat_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
   }
    : delete_anomaly_detector_input)

let make_delete_dashboards_output () = (() : unit)

let make_delete_dashboards_input ~dashboard_names:(dashboard_names_ : dashboard_names) () =
  ({ dashboard_names = dashboard_names_ } : delete_dashboards_input)

let make_delete_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : delete_insight_rules_output)

let make_delete_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : delete_insight_rules_input)

let make_delete_metric_stream_output () = (() : unit)

let make_delete_metric_stream_input ~name:(name_ : metric_stream_name) () =
  ({ name = name_ } : delete_metric_stream_input)

let make_describe_alarm_contributors_output ?next_token:(next_token_ : next_token option)
    ~alarm_contributors:(alarm_contributors_ : alarm_contributors) () =
  ({ alarm_contributors = alarm_contributors_; next_token = next_token_ }
    : describe_alarm_contributors_output)

let make_describe_alarm_contributors_input ?next_token:(next_token_ : next_token option)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({ alarm_name = alarm_name_; next_token = next_token_ } : describe_alarm_contributors_input)

let make_describe_alarm_history_output
    ?alarm_history_items:(alarm_history_items_ : alarm_history_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({ alarm_history_items = alarm_history_items_; next_token = next_token_ }
    : describe_alarm_history_output)

let make_describe_alarm_history_input ?alarm_name:(alarm_name_ : alarm_name option)
    ?alarm_contributor_id:(alarm_contributor_id_ : contributor_id option)
    ?alarm_types:(alarm_types_ : alarm_types option)
    ?history_item_type:(history_item_type_ : history_item_type option)
    ?start_date:(start_date_ : timestamp option) ?end_date:(end_date_ : timestamp option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : next_token option)
    ?scan_by:(scan_by_ : scan_by option) () =
  ({
     alarm_name = alarm_name_;
     alarm_contributor_id = alarm_contributor_id_;
     alarm_types = alarm_types_;
     history_item_type = history_item_type_;
     start_date = start_date_;
     end_date = end_date_;
     max_records = max_records_;
     next_token = next_token_;
     scan_by = scan_by_;
   }
    : describe_alarm_history_input)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_schedule_configuration ?start_time_offset:(start_time_offset_ : start_time_offset option)
    ?end_time_offset:(end_time_offset_ : end_time_offset option)
    ~schedule_expression:(schedule_expression_ : schedule_expression) () =
  ({
     schedule_expression = schedule_expression_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
   }
    : schedule_configuration)

let make_scheduled_query_configuration
    ?log_group_identifiers:(log_group_identifiers_ : log_group_identifiers option)
    ?query_ar_n:(query_ar_n_ : amazon_resource_name option) ?tags:(tags_ : tag_list option)
    ~query_string:(query_string_ : query_string)
    ~scheduled_query_role_ar_n:(scheduled_query_role_ar_n_ : amazon_resource_name)
    ~schedule_configuration:(schedule_configuration_ : schedule_configuration)
    ~aggregation_expression:(aggregation_expression_ : aggregation_expression) () =
  ({
     query_string = query_string_;
     log_group_identifiers = log_group_identifiers_;
     query_ar_n = query_ar_n_;
     scheduled_query_role_ar_n = scheduled_query_role_ar_n_;
     schedule_configuration = schedule_configuration_;
     aggregation_expression = aggregation_expression_;
     tags = tags_;
   }
    : scheduled_query_configuration)

let make_log_alarm ?alarm_name:(alarm_name_ : alarm_name option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?state_value:(state_value_ : state_value option)
    ?state_reason:(state_reason_ : state_reason option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?scheduled_query_configuration:
      (scheduled_query_configuration_ : scheduled_query_configuration option)
    ?query_results_to_evaluate:(query_results_to_evaluate_ : query_results_to_evaluate option)
    ?query_results_to_alarm:(query_results_to_alarm_ : query_results_to_alarm option)
    ?threshold:(threshold_ : threshold option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?action_log_line_count:(action_log_line_count_ : action_log_line_count option)
    ?action_log_line_role_arn:(action_log_line_role_arn_ : action_log_line_role_arn option) () =
  ({
     alarm_name = alarm_name_;
     alarm_arn = alarm_arn_;
     alarm_description = alarm_description_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     actions_enabled = actions_enabled_;
     ok_actions = ok_actions_;
     alarm_actions = alarm_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     state_value = state_value_;
     state_reason = state_reason_;
     state_reason_data = state_reason_data_;
     state_updated_timestamp = state_updated_timestamp_;
     scheduled_query_configuration = scheduled_query_configuration_;
     query_results_to_evaluate = query_results_to_evaluate_;
     query_results_to_alarm = query_results_to_alarm_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     treat_missing_data = treat_missing_data_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     evaluation_state = evaluation_state_;
     action_log_line_count = action_log_line_count_;
     action_log_line_role_arn = action_log_line_role_arn_;
   }
    : log_alarm)

let make_sliding_window () = (() : unit)

let make_wall_clock_window ?timezone:(timezone_ : timezone option) () =
  ({ timezone = timezone_ } : wall_clock_window)

let make_metric_alarm ?alarm_name:(alarm_name_ : alarm_name option)
    ?alarm_arn:(alarm_arn_ : alarm_arn option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?alarm_configuration_updated_timestamp:
      (alarm_configuration_updated_timestamp_ : timestamp option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?state_value:(state_value_ : state_value option)
    ?state_reason:(state_reason_ : state_reason option)
    ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ?state_updated_timestamp:(state_updated_timestamp_ : timestamp option)
    ?metric_name:(metric_name_ : metric_name option) ?namespace:(namespace_ : namespace option)
    ?statistic:(statistic_ : statistic option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?dimensions:(dimensions_ : dimensions option) ?period:(period_ : period option)
    ?unit_:(unit__ : standard_unit option)
    ?evaluation_periods:(evaluation_periods_ : evaluation_periods option)
    ?datapoints_to_alarm:(datapoints_to_alarm_ : datapoints_to_alarm option)
    ?threshold:(threshold_ : threshold option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?evaluate_low_sample_count_percentile:
      (evaluate_low_sample_count_percentile_ : evaluate_low_sample_count_percentile option)
    ?metrics:(metrics_ : metric_data_queries option)
    ?threshold_metric_id:(threshold_metric_id_ : metric_id option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?state_transitioned_timestamp:(state_transitioned_timestamp_ : timestamp option)
    ?evaluation_window:(evaluation_window_ : evaluation_window option)
    ?evaluation_criteria:(evaluation_criteria_ : evaluation_criteria option)
    ?evaluation_interval:(evaluation_interval_ : evaluation_interval option) () =
  ({
     alarm_name = alarm_name_;
     alarm_arn = alarm_arn_;
     alarm_description = alarm_description_;
     alarm_configuration_updated_timestamp = alarm_configuration_updated_timestamp_;
     actions_enabled = actions_enabled_;
     ok_actions = ok_actions_;
     alarm_actions = alarm_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     state_value = state_value_;
     state_reason = state_reason_;
     state_reason_data = state_reason_data_;
     state_updated_timestamp = state_updated_timestamp_;
     metric_name = metric_name_;
     namespace = namespace_;
     statistic = statistic_;
     extended_statistic = extended_statistic_;
     dimensions = dimensions_;
     period = period_;
     unit_ = unit__;
     evaluation_periods = evaluation_periods_;
     datapoints_to_alarm = datapoints_to_alarm_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     treat_missing_data = treat_missing_data_;
     evaluate_low_sample_count_percentile = evaluate_low_sample_count_percentile_;
     metrics = metrics_;
     threshold_metric_id = threshold_metric_id_;
     evaluation_state = evaluation_state_;
     state_transitioned_timestamp = state_transitioned_timestamp_;
     evaluation_window = evaluation_window_;
     evaluation_criteria = evaluation_criteria_;
     evaluation_interval = evaluation_interval_;
   }
    : metric_alarm)

let make_describe_alarms_output ?composite_alarms:(composite_alarms_ : composite_alarms option)
    ?metric_alarms:(metric_alarms_ : metric_alarms option)
    ?log_alarms:(log_alarms_ : log_alarms option) ?next_token:(next_token_ : next_token option) () =
  ({
     composite_alarms = composite_alarms_;
     metric_alarms = metric_alarms_;
     log_alarms = log_alarms_;
     next_token = next_token_;
   }
    : describe_alarms_output)

let make_describe_alarms_input ?alarm_names:(alarm_names_ : alarm_names option)
    ?alarm_name_prefix:(alarm_name_prefix_ : alarm_name_prefix option)
    ?alarm_types:(alarm_types_ : alarm_types option)
    ?children_of_alarm_name:(children_of_alarm_name_ : alarm_name option)
    ?parents_of_alarm_name:(parents_of_alarm_name_ : alarm_name option)
    ?state_value:(state_value_ : state_value option)
    ?action_prefix:(action_prefix_ : action_prefix option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     alarm_names = alarm_names_;
     alarm_name_prefix = alarm_name_prefix_;
     alarm_types = alarm_types_;
     children_of_alarm_name = children_of_alarm_name_;
     parents_of_alarm_name = parents_of_alarm_name_;
     state_value = state_value_;
     action_prefix = action_prefix_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : describe_alarms_input)

let make_describe_alarms_for_metric_output ?metric_alarms:(metric_alarms_ : metric_alarms option) ()
    =
  ({ metric_alarms = metric_alarms_ } : describe_alarms_for_metric_output)

let make_describe_alarms_for_metric_input ?statistic:(statistic_ : statistic option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?dimensions:(dimensions_ : dimensions option) ?period:(period_ : period option)
    ?unit_:(unit__ : standard_unit option) ~metric_name:(metric_name_ : metric_name)
    ~namespace:(namespace_ : namespace) () =
  ({
     metric_name = metric_name_;
     namespace = namespace_;
     statistic = statistic_;
     extended_statistic = extended_statistic_;
     dimensions = dimensions_;
     period = period_;
     unit_ = unit__;
   }
    : describe_alarms_for_metric_input)

let make_describe_anomaly_detectors_output
    ?anomaly_detectors:(anomaly_detectors_ : anomaly_detectors option)
    ?next_token:(next_token_ : next_token option) () =
  ({ anomaly_detectors = anomaly_detectors_; next_token = next_token_ }
    : describe_anomaly_detectors_output)

let make_describe_anomaly_detectors_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_returned_results_count option)
    ?namespace:(namespace_ : namespace option) ?metric_name:(metric_name_ : metric_name option)
    ?dimensions:(dimensions_ : dimensions option)
    ?anomaly_detector_types:(anomaly_detector_types_ : anomaly_detector_types option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     anomaly_detector_types = anomaly_detector_types_;
   }
    : describe_anomaly_detectors_input)

let make_insight_rule ?managed_rule:(managed_rule_ : insight_rule_is_managed option)
    ?apply_on_transformed_logs:
      (apply_on_transformed_logs_ : insight_rule_on_transformed_logs option)
    ~name:(name_ : insight_rule_name) ~state:(state_ : insight_rule_state)
    ~schema:(schema_ : insight_rule_schema) ~definition:(definition_ : insight_rule_definition) () =
  ({
     name = name_;
     state = state_;
     schema = schema_;
     definition = definition_;
     managed_rule = managed_rule_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
   }
    : insight_rule)

let make_describe_insight_rules_output ?next_token:(next_token_ : next_token option)
    ?insight_rules:(insight_rules_ : insight_rules option) () =
  ({ next_token = next_token_; insight_rules = insight_rules_ } : describe_insight_rules_output)

let make_describe_insight_rules_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : insight_rule_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_insight_rules_input)

let make_dimension_filter ?value:(value_ : dimension_value option) ~name:(name_ : dimension_name) ()
    =
  ({ name = name_; value = value_ } : dimension_filter)

let make_disable_alarm_actions_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : disable_alarm_actions_input)

let make_disable_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : disable_insight_rules_output)

let make_disable_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : disable_insight_rules_input)

let make_disassociate_dataset_kms_key_output () = (() : unit)

let make_disassociate_dataset_kms_key_input
    ~dataset_identifier:(dataset_identifier_ : dataset_identifier) () =
  ({ dataset_identifier = dataset_identifier_ } : disassociate_dataset_kms_key_input)

let make_enable_alarm_actions_input ~alarm_names:(alarm_names_ : alarm_names) () =
  ({ alarm_names = alarm_names_ } : enable_alarm_actions_input)

let make_enable_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : enable_insight_rules_output)

let make_enable_insight_rules_input ~rule_names:(rule_names_ : insight_rule_names) () =
  ({ rule_names = rule_names_ } : enable_insight_rules_input)

let make_entity ?key_attributes:(key_attributes_ : entity_key_attributes_map option)
    ?attributes:(attributes_ : entity_attributes_map option) () =
  ({ key_attributes = key_attributes_; attributes = attributes_ } : entity)

let make_statistic_set ~sample_count:(sample_count_ : datapoint_value) ~sum:(sum_ : datapoint_value)
    ~minimum:(minimum_ : datapoint_value) ~maximum:(maximum_ : datapoint_value) () =
  ({ sample_count = sample_count_; sum = sum_; minimum = minimum_; maximum = maximum_ }
    : statistic_set)

let make_metric_datum ?dimensions:(dimensions_ : dimensions option)
    ?timestamp:(timestamp_ : timestamp option) ?value:(value_ : datapoint_value option)
    ?statistic_values:(statistic_values_ : statistic_set option) ?values:(values_ : values option)
    ?counts:(counts_ : counts option) ?unit_:(unit__ : standard_unit option)
    ?storage_resolution:(storage_resolution_ : storage_resolution option)
    ~metric_name:(metric_name_ : metric_name) () =
  ({
     metric_name = metric_name_;
     dimensions = dimensions_;
     timestamp = timestamp_;
     value = value_;
     statistic_values = statistic_values_;
     values = values_;
     counts = counts_;
     unit_ = unit__;
     storage_resolution = storage_resolution_;
   }
    : metric_datum)

let make_entity_metric_data ?entity:(entity_ : entity option)
    ?metric_data:(metric_data_ : metric_data option) () =
  ({ entity = entity_; metric_data = metric_data_ } : entity_metric_data)

let make_mute_targets ~alarm_names:(alarm_names_ : mute_target_alarm_name_list) () =
  ({ alarm_names = alarm_names_ } : mute_targets)

let make_schedule ?timezone:(timezone_ : timezone option) ~expression:(expression_ : expression)
    ~duration:(duration_ : duration) () =
  ({ expression = expression_; duration = duration_; timezone = timezone_ } : schedule)

let make_rule ~schedule:(schedule_ : schedule) () = ({ schedule = schedule_ } : rule)

let make_get_alarm_mute_rule_output ?name:(name_ : name option)
    ?alarm_mute_rule_arn:(alarm_mute_rule_arn_ : arn option)
    ?description:(description_ : alarm_description option) ?rule:(rule_ : rule option)
    ?mute_targets:(mute_targets_ : mute_targets option) ?start_date:(start_date_ : timestamp option)
    ?expire_date:(expire_date_ : timestamp option) ?status:(status_ : alarm_mute_rule_status option)
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option)
    ?mute_type:(mute_type_ : mute_type option) () =
  ({
     name = name_;
     alarm_mute_rule_arn = alarm_mute_rule_arn_;
     description = description_;
     rule = rule_;
     mute_targets = mute_targets_;
     start_date = start_date_;
     expire_date = expire_date_;
     status = status_;
     last_updated_timestamp = last_updated_timestamp_;
     mute_type = mute_type_;
   }
    : get_alarm_mute_rule_output)

let make_get_alarm_mute_rule_input ~alarm_mute_rule_name:(alarm_mute_rule_name_ : name) () =
  ({ alarm_mute_rule_name = alarm_mute_rule_name_ } : get_alarm_mute_rule_input)

let make_get_dashboard_output ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?dashboard_body:(dashboard_body_ : dashboard_body option)
    ?dashboard_name:(dashboard_name_ : dashboard_name option) () =
  ({
     dashboard_arn = dashboard_arn_;
     dashboard_body = dashboard_body_;
     dashboard_name = dashboard_name_;
   }
    : get_dashboard_output)

let make_get_dashboard_input ~dashboard_name:(dashboard_name_ : dashboard_name) () =
  ({ dashboard_name = dashboard_name_ } : get_dashboard_input)

let make_get_dataset_output ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ~dataset_id:(dataset_id_ : dataset_id) ~arn:(arn_ : dataset_arn) () =
  ({ dataset_id = dataset_id_; arn = arn_; kms_key_arn = kms_key_arn_ } : get_dataset_output)

let make_get_dataset_input ~dataset_identifier:(dataset_identifier_ : dataset_identifier) () =
  ({ dataset_identifier = dataset_identifier_ } : get_dataset_input)

let make_insight_rule_metric_datapoint
    ?unique_contributors:(unique_contributors_ : insight_rule_unbound_double option)
    ?max_contributor_value:(max_contributor_value_ : insight_rule_unbound_double option)
    ?sample_count:(sample_count_ : insight_rule_unbound_double option)
    ?average:(average_ : insight_rule_unbound_double option)
    ?sum:(sum_ : insight_rule_unbound_double option)
    ?minimum:(minimum_ : insight_rule_unbound_double option)
    ?maximum:(maximum_ : insight_rule_unbound_double option) ~timestamp:(timestamp_ : timestamp) ()
    =
  ({
     timestamp = timestamp_;
     unique_contributors = unique_contributors_;
     max_contributor_value = max_contributor_value_;
     sample_count = sample_count_;
     average = average_;
     sum = sum_;
     minimum = minimum_;
     maximum = maximum_;
   }
    : insight_rule_metric_datapoint)

let make_insight_rule_contributor_datapoint ~timestamp:(timestamp_ : timestamp)
    ~approximate_value:(approximate_value_ : insight_rule_unbound_double) () =
  ({ timestamp = timestamp_; approximate_value = approximate_value_ }
    : insight_rule_contributor_datapoint)

let make_insight_rule_contributor ~keys:(keys_ : insight_rule_contributor_keys)
    ~approximate_aggregate_value:(approximate_aggregate_value_ : insight_rule_unbound_double)
    ~datapoints:(datapoints_ : insight_rule_contributor_datapoints) () =
  ({
     keys = keys_;
     approximate_aggregate_value = approximate_aggregate_value_;
     datapoints = datapoints_;
   }
    : insight_rule_contributor)

let make_get_insight_rule_report_output
    ?key_labels:(key_labels_ : insight_rule_contributor_key_labels option)
    ?aggregation_statistic:(aggregation_statistic_ : insight_rule_aggregation_statistic option)
    ?aggregate_value:(aggregate_value_ : insight_rule_unbound_double option)
    ?approximate_unique_count:(approximate_unique_count_ : insight_rule_unbound_long option)
    ?contributors:(contributors_ : insight_rule_contributors option)
    ?metric_datapoints:(metric_datapoints_ : insight_rule_metric_datapoints option) () =
  ({
     key_labels = key_labels_;
     aggregation_statistic = aggregation_statistic_;
     aggregate_value = aggregate_value_;
     approximate_unique_count = approximate_unique_count_;
     contributors = contributors_;
     metric_datapoints = metric_datapoints_;
   }
    : get_insight_rule_report_output)

let make_get_insight_rule_report_input
    ?max_contributor_count:(max_contributor_count_ : insight_rule_unbound_integer option)
    ?metrics:(metrics_ : insight_rule_metric_list option)
    ?order_by:(order_by_ : insight_rule_order_by option) ~rule_name:(rule_name_ : insight_rule_name)
    ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp)
    ~period:(period_ : period) () =
  ({
     rule_name = rule_name_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     max_contributor_count = max_contributor_count_;
     metrics = metrics_;
     order_by = order_by_;
   }
    : get_insight_rule_report_input)

let make_message_data ?code:(code_ : message_data_code option)
    ?value:(value_ : message_data_value option) () =
  ({ code = code_; value = value_ } : message_data)

let make_get_metric_data_output
    ?metric_data_results:(metric_data_results_ : metric_data_results option)
    ?next_token:(next_token_ : next_token option)
    ?messages:(messages_ : metric_data_result_messages option) () =
  ({ metric_data_results = metric_data_results_; next_token = next_token_; messages = messages_ }
    : get_metric_data_output)

let make_label_options ?timezone:(timezone_ : get_metric_data_label_timezone option) () =
  ({ timezone = timezone_ } : label_options)

let make_get_metric_data_input ?next_token:(next_token_ : next_token option)
    ?scan_by:(scan_by_ : scan_by option)
    ?max_datapoints:(max_datapoints_ : get_metric_data_max_datapoints option)
    ?label_options:(label_options_ : label_options option)
    ~metric_data_queries:(metric_data_queries_ : metric_data_queries)
    ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp) () =
  ({
     metric_data_queries = metric_data_queries_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     scan_by = scan_by_;
     max_datapoints = max_datapoints_;
     label_options = label_options_;
   }
    : get_metric_data_input)

let make_get_metric_statistics_output ?label:(label_ : metric_label option)
    ?datapoints:(datapoints_ : datapoints option) () =
  ({ label = label_; datapoints = datapoints_ } : get_metric_statistics_output)

let make_get_metric_statistics_input ?dimensions:(dimensions_ : dimensions option)
    ?statistics:(statistics_ : statistics option)
    ?extended_statistics:(extended_statistics_ : extended_statistics option)
    ?unit_:(unit__ : standard_unit option) ~namespace:(namespace_ : namespace)
    ~metric_name:(metric_name_ : metric_name) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) ~period:(period_ : period) () =
  ({
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     statistics = statistics_;
     extended_statistics = extended_statistics_;
     unit_ = unit__;
   }
    : get_metric_statistics_input)

let make_metric_stream_statistics_metric ~namespace:(namespace_ : namespace)
    ~metric_name:(metric_name_ : metric_name) () =
  ({ namespace = namespace_; metric_name = metric_name_ } : metric_stream_statistics_metric)

let make_metric_stream_statistics_configuration
    ~include_metrics:(include_metrics_ : metric_stream_statistics_include_metrics)
    ~additional_statistics:(additional_statistics_ : metric_stream_statistics_additional_statistics)
    () =
  ({ include_metrics = include_metrics_; additional_statistics = additional_statistics_ }
    : metric_stream_statistics_configuration)

let make_metric_stream_filter ?namespace:(namespace_ : namespace option)
    ?metric_names:(metric_names_ : metric_stream_filter_metric_names option) () =
  ({ namespace = namespace_; metric_names = metric_names_ } : metric_stream_filter)

let make_get_metric_stream_output ?arn:(arn_ : amazon_resource_name option)
    ?name:(name_ : metric_stream_name option)
    ?include_filters:(include_filters_ : metric_stream_filters option)
    ?exclude_filters:(exclude_filters_ : metric_stream_filters option)
    ?firehose_arn:(firehose_arn_ : amazon_resource_name option)
    ?role_arn:(role_arn_ : amazon_resource_name option) ?state:(state_ : metric_stream_state option)
    ?creation_date:(creation_date_ : timestamp option)
    ?last_update_date:(last_update_date_ : timestamp option)
    ?output_format:(output_format_ : metric_stream_output_format option)
    ?statistics_configurations:
      (statistics_configurations_ : metric_stream_statistics_configurations option)
    ?include_linked_accounts_metrics:
      (include_linked_accounts_metrics_ : include_linked_accounts_metrics option) () =
  ({
     arn = arn_;
     name = name_;
     include_filters = include_filters_;
     exclude_filters = exclude_filters_;
     firehose_arn = firehose_arn_;
     role_arn = role_arn_;
     state = state_;
     creation_date = creation_date_;
     last_update_date = last_update_date_;
     output_format = output_format_;
     statistics_configurations = statistics_configurations_;
     include_linked_accounts_metrics = include_linked_accounts_metrics_;
   }
    : get_metric_stream_output)

let make_get_metric_stream_input ~name:(name_ : metric_stream_name) () =
  ({ name = name_ } : get_metric_stream_input)

let make_get_metric_widget_image_output
    ?metric_widget_image:(metric_widget_image_ : metric_widget_image option) () =
  ({ metric_widget_image = metric_widget_image_ } : get_metric_widget_image_output)

let make_get_metric_widget_image_input ?output_format:(output_format_ : output_format option)
    ~metric_widget:(metric_widget_ : metric_widget) () =
  ({ metric_widget = metric_widget_; output_format = output_format_ }
    : get_metric_widget_image_input)

let make_get_o_tel_enrichment_output ~status:(status_ : o_tel_enrichment_status) () =
  ({ status = status_ } : get_o_tel_enrichment_output)

let make_get_o_tel_enrichment_input () = (() : unit)
let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_input)

let make_stop_o_tel_enrichment_output () = (() : unit)
let make_stop_o_tel_enrichment_input () = (() : unit)
let make_stop_metric_streams_output () = (() : unit)

let make_stop_metric_streams_input ~names:(names_ : metric_stream_names) () =
  ({ names = names_ } : stop_metric_streams_input)

let make_start_o_tel_enrichment_output () = (() : unit)
let make_start_o_tel_enrichment_input () = (() : unit)
let make_start_metric_streams_output () = (() : unit)

let make_start_metric_streams_input ~names:(names_ : metric_stream_names) () =
  ({ names = names_ } : start_metric_streams_input)

let make_set_alarm_state_input ?state_reason_data:(state_reason_data_ : state_reason_data option)
    ~alarm_name:(alarm_name_ : alarm_name) ~state_value:(state_value_ : state_value)
    ~state_reason:(state_reason_ : state_reason) () =
  ({
     alarm_name = alarm_name_;
     state_value = state_value_;
     state_reason = state_reason_;
     state_reason_data = state_reason_data_;
   }
    : set_alarm_state_input)

let make_put_metric_stream_output ?arn:(arn_ : amazon_resource_name option) () =
  ({ arn = arn_ } : put_metric_stream_output)

let make_put_metric_stream_input ?include_filters:(include_filters_ : metric_stream_filters option)
    ?exclude_filters:(exclude_filters_ : metric_stream_filters option)
    ?tags:(tags_ : tag_list option)
    ?statistics_configurations:
      (statistics_configurations_ : metric_stream_statistics_configurations option)
    ?include_linked_accounts_metrics:
      (include_linked_accounts_metrics_ : include_linked_accounts_metrics option)
    ~name:(name_ : metric_stream_name) ~firehose_arn:(firehose_arn_ : amazon_resource_name)
    ~role_arn:(role_arn_ : amazon_resource_name)
    ~output_format:(output_format_ : metric_stream_output_format) () =
  ({
     name = name_;
     include_filters = include_filters_;
     exclude_filters = exclude_filters_;
     firehose_arn = firehose_arn_;
     role_arn = role_arn_;
     output_format = output_format_;
     tags = tags_;
     statistics_configurations = statistics_configurations_;
     include_linked_accounts_metrics = include_linked_accounts_metrics_;
   }
    : put_metric_stream_input)

let make_put_metric_data_input ?metric_data:(metric_data_ : metric_data option)
    ?entity_metric_data:(entity_metric_data_ : entity_metric_data_list option)
    ?strict_entity_validation:(strict_entity_validation_ : strict_entity_validation option)
    ~namespace:(namespace_ : namespace) () =
  ({
     namespace = namespace_;
     metric_data = metric_data_;
     entity_metric_data = entity_metric_data_;
     strict_entity_validation = strict_entity_validation_;
   }
    : put_metric_data_input)

let make_put_metric_alarm_input ?alarm_description:(alarm_description_ : alarm_description option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?metric_name:(metric_name_ : metric_name option) ?namespace:(namespace_ : namespace option)
    ?statistic:(statistic_ : statistic option)
    ?extended_statistic:(extended_statistic_ : extended_statistic option)
    ?dimensions:(dimensions_ : dimensions option) ?period:(period_ : period option)
    ?unit_:(unit__ : standard_unit option)
    ?evaluation_periods:(evaluation_periods_ : evaluation_periods option)
    ?datapoints_to_alarm:(datapoints_to_alarm_ : datapoints_to_alarm option)
    ?threshold:(threshold_ : threshold option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?evaluate_low_sample_count_percentile:
      (evaluate_low_sample_count_percentile_ : evaluate_low_sample_count_percentile option)
    ?metrics:(metrics_ : metric_data_queries option) ?tags:(tags_ : tag_list option)
    ?threshold_metric_id:(threshold_metric_id_ : metric_id option)
    ?evaluation_window:(evaluation_window_ : evaluation_window option)
    ?evaluation_criteria:(evaluation_criteria_ : evaluation_criteria option)
    ?evaluation_interval:(evaluation_interval_ : evaluation_interval option)
    ~alarm_name:(alarm_name_ : alarm_name) () =
  ({
     alarm_name = alarm_name_;
     alarm_description = alarm_description_;
     actions_enabled = actions_enabled_;
     ok_actions = ok_actions_;
     alarm_actions = alarm_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     metric_name = metric_name_;
     namespace = namespace_;
     statistic = statistic_;
     extended_statistic = extended_statistic_;
     dimensions = dimensions_;
     period = period_;
     unit_ = unit__;
     evaluation_periods = evaluation_periods_;
     datapoints_to_alarm = datapoints_to_alarm_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     treat_missing_data = treat_missing_data_;
     evaluate_low_sample_count_percentile = evaluate_low_sample_count_percentile_;
     metrics = metrics_;
     tags = tags_;
     threshold_metric_id = threshold_metric_id_;
     evaluation_window = evaluation_window_;
     evaluation_criteria = evaluation_criteria_;
     evaluation_interval = evaluation_interval_;
   }
    : put_metric_alarm_input)

let make_put_managed_insight_rules_output ?failures:(failures_ : batch_failures option) () =
  ({ failures = failures_ } : put_managed_insight_rules_output)

let make_managed_rule ?tags:(tags_ : tag_list option)
    ~template_name:(template_name_ : template_name)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ template_name = template_name_; resource_ar_n = resource_ar_n_; tags = tags_ } : managed_rule)

let make_put_managed_insight_rules_input ~managed_rules:(managed_rules_ : managed_rules) () =
  ({ managed_rules = managed_rules_ } : put_managed_insight_rules_input)

let make_put_log_alarm_input ?alarm_description:(alarm_description_ : alarm_description option)
    ?action_log_line_count:(action_log_line_count_ : action_log_line_count option)
    ?action_log_line_role_arn:(action_log_line_role_arn_ : action_log_line_role_arn option)
    ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?ok_actions:(ok_actions_ : resource_list option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?tags:(tags_ : tag_list option) ~alarm_name:(alarm_name_ : alarm_name)
    ~scheduled_query_configuration:(scheduled_query_configuration_ : scheduled_query_configuration)
    ~query_results_to_evaluate:(query_results_to_evaluate_ : query_results_to_evaluate)
    ~query_results_to_alarm:(query_results_to_alarm_ : query_results_to_alarm)
    ~threshold:(threshold_ : threshold)
    ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({
     alarm_name = alarm_name_;
     alarm_description = alarm_description_;
     scheduled_query_configuration = scheduled_query_configuration_;
     action_log_line_count = action_log_line_count_;
     action_log_line_role_arn = action_log_line_role_arn_;
     actions_enabled = actions_enabled_;
     ok_actions = ok_actions_;
     alarm_actions = alarm_actions_;
     insufficient_data_actions = insufficient_data_actions_;
     query_results_to_evaluate = query_results_to_evaluate_;
     query_results_to_alarm = query_results_to_alarm_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     treat_missing_data = treat_missing_data_;
     tags = tags_;
   }
    : put_log_alarm_input)

let make_put_insight_rule_output () = (() : unit)

let make_put_insight_rule_input ?rule_state:(rule_state_ : insight_rule_state option)
    ?tags:(tags_ : tag_list option)
    ?apply_on_transformed_logs:
      (apply_on_transformed_logs_ : insight_rule_on_transformed_logs option)
    ~rule_name:(rule_name_ : insight_rule_name)
    ~rule_definition:(rule_definition_ : insight_rule_definition) () =
  ({
     rule_name = rule_name_;
     rule_state = rule_state_;
     rule_definition = rule_definition_;
     tags = tags_;
     apply_on_transformed_logs = apply_on_transformed_logs_;
   }
    : put_insight_rule_input)

let make_put_dashboard_output
    ?dashboard_validation_messages:
      (dashboard_validation_messages_ : dashboard_validation_messages option) () =
  ({ dashboard_validation_messages = dashboard_validation_messages_ } : put_dashboard_output)

let make_put_dashboard_input ?tags:(tags_ : tag_list option)
    ~dashboard_name:(dashboard_name_ : dashboard_name)
    ~dashboard_body:(dashboard_body_ : dashboard_body) () =
  ({ dashboard_name = dashboard_name_; dashboard_body = dashboard_body_; tags = tags_ }
    : put_dashboard_input)

let make_put_composite_alarm_input ?actions_enabled:(actions_enabled_ : actions_enabled option)
    ?alarm_actions:(alarm_actions_ : resource_list option)
    ?alarm_description:(alarm_description_ : alarm_description option)
    ?insufficient_data_actions:(insufficient_data_actions_ : resource_list option)
    ?ok_actions:(ok_actions_ : resource_list option) ?tags:(tags_ : tag_list option)
    ?actions_suppressor:(actions_suppressor_ : alarm_arn option)
    ?actions_suppressor_wait_period:(actions_suppressor_wait_period_ : suppressor_period option)
    ?actions_suppressor_extension_period:
      (actions_suppressor_extension_period_ : suppressor_period option)
    ~alarm_name:(alarm_name_ : alarm_name) ~alarm_rule:(alarm_rule_ : alarm_rule) () =
  ({
     actions_enabled = actions_enabled_;
     alarm_actions = alarm_actions_;
     alarm_description = alarm_description_;
     alarm_name = alarm_name_;
     alarm_rule = alarm_rule_;
     insufficient_data_actions = insufficient_data_actions_;
     ok_actions = ok_actions_;
     tags = tags_;
     actions_suppressor = actions_suppressor_;
     actions_suppressor_wait_period = actions_suppressor_wait_period_;
     actions_suppressor_extension_period = actions_suppressor_extension_period_;
   }
    : put_composite_alarm_input)

let make_put_anomaly_detector_output () = (() : unit)

let make_put_anomaly_detector_input ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option) ?dimensions:(dimensions_ : dimensions option)
    ?stat:(stat_ : anomaly_detector_metric_stat option)
    ?configuration:(configuration_ : anomaly_detector_configuration option)
    ?metric_characteristics:(metric_characteristics_ : metric_characteristics option)
    ?single_metric_anomaly_detector:
      (single_metric_anomaly_detector_ : single_metric_anomaly_detector option)
    ?metric_math_anomaly_detector:
      (metric_math_anomaly_detector_ : metric_math_anomaly_detector option) () =
  ({
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     stat = stat_;
     configuration = configuration_;
     metric_characteristics = metric_characteristics_;
     single_metric_anomaly_detector = single_metric_anomaly_detector_;
     metric_math_anomaly_detector = metric_math_anomaly_detector_;
   }
    : put_anomaly_detector_input)

let make_put_alarm_mute_rule_input ?description:(description_ : alarm_description option)
    ?mute_targets:(mute_targets_ : mute_targets option) ?tags:(tags_ : tag_list option)
    ?start_date:(start_date_ : timestamp option) ?expire_date:(expire_date_ : timestamp option)
    ~name:(name_ : name) ~rule:(rule_ : rule) () =
  ({
     name = name_;
     description = description_;
     rule = rule_;
     mute_targets = mute_targets_;
     tags = tags_;
     start_date = start_date_;
     expire_date = expire_date_;
   }
    : put_alarm_mute_rule_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_input)

let make_metric_stream_entry ?arn:(arn_ : amazon_resource_name option)
    ?creation_date:(creation_date_ : timestamp option)
    ?last_update_date:(last_update_date_ : timestamp option)
    ?name:(name_ : metric_stream_name option)
    ?firehose_arn:(firehose_arn_ : amazon_resource_name option)
    ?state:(state_ : metric_stream_state option)
    ?output_format:(output_format_ : metric_stream_output_format option) () =
  ({
     arn = arn_;
     creation_date = creation_date_;
     last_update_date = last_update_date_;
     name = name_;
     firehose_arn = firehose_arn_;
     state = state_;
     output_format = output_format_;
   }
    : metric_stream_entry)

let make_list_metric_streams_output ?next_token:(next_token_ : next_token option)
    ?entries:(entries_ : metric_stream_entries option) () =
  ({ next_token = next_token_; entries = entries_ } : list_metric_streams_output)

let make_list_metric_streams_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_metric_streams_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_metric_streams_input)

let make_list_metrics_output ?metrics:(metrics_ : metrics option)
    ?next_token:(next_token_ : next_token option)
    ?owning_accounts:(owning_accounts_ : owning_accounts option) () =
  ({ metrics = metrics_; next_token = next_token_; owning_accounts = owning_accounts_ }
    : list_metrics_output)

let make_list_metrics_input ?namespace:(namespace_ : namespace option)
    ?metric_name:(metric_name_ : metric_name option)
    ?dimensions:(dimensions_ : dimension_filters option)
    ?next_token:(next_token_ : next_token option)
    ?recently_active:(recently_active_ : recently_active option)
    ?include_linked_accounts:(include_linked_accounts_ : include_linked_accounts option)
    ?owning_account:(owning_account_ : account_id option) () =
  ({
     namespace = namespace_;
     metric_name = metric_name_;
     dimensions = dimensions_;
     next_token = next_token_;
     recently_active = recently_active_;
     include_linked_accounts = include_linked_accounts_;
     owning_account = owning_account_;
   }
    : list_metrics_input)

let make_managed_rule_state ~rule_name:(rule_name_ : insight_rule_name)
    ~state:(state_ : insight_rule_state) () =
  ({ rule_name = rule_name_; state = state_ } : managed_rule_state)

let make_managed_rule_description ?template_name:(template_name_ : template_name option)
    ?resource_ar_n:(resource_ar_n_ : amazon_resource_name option)
    ?rule_state:(rule_state_ : managed_rule_state option) () =
  ({ template_name = template_name_; resource_ar_n = resource_ar_n_; rule_state = rule_state_ }
    : managed_rule_description)

let make_list_managed_insight_rules_output
    ?managed_rules:(managed_rules_ : managed_rule_descriptions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ managed_rules = managed_rules_; next_token = next_token_ } : list_managed_insight_rules_output)

let make_list_managed_insight_rules_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : insight_rule_max_results option)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_; next_token = next_token_; max_results = max_results_ }
    : list_managed_insight_rules_input)

let make_list_dashboards_output ?dashboard_entries:(dashboard_entries_ : dashboard_entries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dashboard_entries = dashboard_entries_; next_token = next_token_ } : list_dashboards_output)

let make_list_dashboards_input
    ?dashboard_name_prefix:(dashboard_name_prefix_ : dashboard_name_prefix option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dashboard_name_prefix = dashboard_name_prefix_; next_token = next_token_ }
    : list_dashboards_input)

let make_list_alarm_mute_rules_output
    ?alarm_mute_rule_summaries:(alarm_mute_rule_summaries_ : alarm_mute_rule_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ alarm_mute_rule_summaries = alarm_mute_rule_summaries_; next_token = next_token_ }
    : list_alarm_mute_rules_output)

let make_list_alarm_mute_rules_input ?alarm_name:(alarm_name_ : name option)
    ?statuses:(statuses_ : alarm_mute_rule_statuses option)
    ?max_records:(max_records_ : max_records option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     alarm_name = alarm_name_;
     statuses = statuses_;
     max_records = max_records_;
     next_token = next_token_;
   }
    : list_alarm_mute_rules_input)
