open Types

let make_update_scheduled_report_response ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : update_scheduled_report_response)

let make_date_time_value ~type_:(type__ : date_time_type) ~value:(value_ : generic_string) () =
  ({ type_ = type__; value = value_ } : date_time_value)

let make_date_time_range ~start_time:(start_time_ : date_time_value)
    ~end_time:(end_time_ : date_time_value) () =
  ({ start_time = start_time_; end_time = end_time_ } : date_time_range)

let make_schedule_period ?start_time:(start_time_ : generic_time_stamp option)
    ?end_time:(end_time_ : generic_time_stamp option) () =
  ({ start_time = start_time_; end_time = end_time_ } : schedule_period)

let make_schedule_config ?schedule_expression:(schedule_expression_ : generic_string option)
    ?schedule_expression_time_zone:(schedule_expression_time_zone_ : generic_string option)
    ?schedule_period:(schedule_period_ : schedule_period option)
    ?state:(state_ : schedule_state option) () =
  ({
     schedule_expression = schedule_expression_;
     schedule_expression_time_zone = schedule_expression_time_zone_;
     schedule_period = schedule_period_;
     state = state_;
   }
    : schedule_config)

let make_update_scheduled_report_request ?name:(name_ : scheduled_report_name option)
    ?description:(description_ : description option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?scheduled_report_execution_role_arn:
      (scheduled_report_execution_role_arn_ : service_role_arn option)
    ?schedule_config:(schedule_config_ : schedule_config option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ?clear_widget_ids:(clear_widget_ids_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?clear_widget_date_range_override:
      (clear_widget_date_range_override_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~arn:(arn_ : scheduled_report_arn) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     dashboard_arn = dashboard_arn_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     schedule_config = schedule_config_;
     widget_ids = widget_ids_;
     widget_date_range_override = widget_date_range_override_;
     clear_widget_ids = clear_widget_ids_;
     clear_widget_date_range_override = clear_widget_date_range_override_;
   }
    : update_scheduled_report_request)

let make_update_dashboard_response ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : update_dashboard_response)

let make_table_display_config_struct () = (() : unit)

let make_graph_display_config ~visual_type:(visual_type_ : visual_type) () =
  ({ visual_type = visual_type_ } : graph_display_config)

let make_cost_category_values ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?values:(values_ : string_list option) ?match_options:(match_options_ : match_options option) ()
    =
  ({ key = key_; values = values_; match_options = match_options_ } : cost_category_values)

let make_tag_values ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?values:(values_ : string_list option) ?match_options:(match_options_ : match_options option) ()
    =
  ({ key = key_; values = values_; match_options = match_options_ } : tag_values)

let make_dimension_values ?match_options:(match_options_ : match_options option)
    ~key:(key_ : dimension) ~values:(values_ : string_list) () =
  ({ key = key_; values = values_; match_options = match_options_ } : dimension_values)

let make_expression ?\#or:(or_ : expressions option) ?and_:(and__ : expressions option)
    ?not:(not_ : expression option) ?dimensions:(dimensions_ : dimension_values option)
    ?tags:(tags_ : tag_values option)
    ?cost_categories:(cost_categories_ : cost_category_values option) () =
  ({
     \#or = or_;
     and_ = and__;
     not = not_;
     dimensions = dimensions_;
     tags = tags_;
     cost_categories = cost_categories_;
   }
    : expression)

let make_group_definition ?type_:(type__ : group_definition_type option)
    ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ key = key_; type_ = type__ } : group_definition)

let make_reservation_utilization_query ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?filter:(filter_ : expression option)
    ~time_range:(time_range_ : date_time_range) () =
  ({ time_range = time_range_; group_by = group_by_; granularity = granularity_; filter = filter_ }
    : reservation_utilization_query)

let make_reservation_coverage_query ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?filter:(filter_ : expression option)
    ?metrics:(metrics_ : metric_names option) ~time_range:(time_range_ : date_time_range) () =
  ({
     time_range = time_range_;
     group_by = group_by_;
     granularity = granularity_;
     filter = filter_;
     metrics = metrics_;
   }
    : reservation_coverage_query)

let make_savings_plans_utilization_query ?granularity:(granularity_ : granularity option)
    ?filter:(filter_ : expression option) ~time_range:(time_range_ : date_time_range) () =
  ({ time_range = time_range_; granularity = granularity_; filter = filter_ }
    : savings_plans_utilization_query)

let make_savings_plans_coverage_query ?metrics:(metrics_ : metric_names option)
    ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ?filter:(filter_ : expression option)
    ~time_range:(time_range_ : date_time_range) () =
  ({
     time_range = time_range_;
     metrics = metrics_;
     granularity = granularity_;
     group_by = group_by_;
     filter = filter_;
   }
    : savings_plans_coverage_query)

let make_cost_and_usage_query ?group_by:(group_by_ : group_definitions option)
    ?filter:(filter_ : expression option) ~metrics:(metrics_ : metric_names)
    ~time_range:(time_range_ : date_time_range) ~granularity:(granularity_ : granularity) () =
  ({
     metrics = metrics_;
     time_range = time_range_;
     granularity = granularity_;
     group_by = group_by_;
     filter = filter_;
   }
    : cost_and_usage_query)

let make_widget_config ~query_parameters:(query_parameters_ : query_parameters)
    ~display_config:(display_config_ : display_config) () =
  ({ query_parameters = query_parameters_; display_config = display_config_ } : widget_config)

let make_widget ?id:(id_ : widget_id option) ?description:(description_ : description option)
    ?width:(width_ : widget_width option) ?height:(height_ : widget_height option)
    ?horizontal_offset:(horizontal_offset_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~title:(title_ : widget_title) ~configs:(configs_ : widget_config_list) () =
  ({
     id = id_;
     title = title_;
     description = description_;
     width = width_;
     height = height_;
     horizontal_offset = horizontal_offset_;
     configs = configs_;
   }
    : widget)

let make_update_dashboard_request ?description:(description_ : description option)
    ?widgets:(widgets_ : widget_list option) ~arn:(arn_ : dashboard_arn)
    ~name:(name_ : dashboard_name) () =
  ({ arn = arn_; name = name_; description = description_; widgets = widgets_ }
    : update_dashboard_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~key:(key_ : resource_tag_key) ~value:(value_ : resource_tag_value) () =
  ({ key = key_; value = value_ } : resource_tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_health_status ?last_refreshed_at:(last_refreshed_at_ : generic_time_stamp option)
    ?status_reasons:(status_reasons_ : status_reason_list option)
    ~status_code:(status_code_ : health_status_code) () =
  ({
     status_code = status_code_;
     last_refreshed_at = last_refreshed_at_;
     status_reasons = status_reasons_;
   }
    : health_status)

let make_scheduled_report_summary
    ?schedule_expression_time_zone:(schedule_expression_time_zone_ : generic_string option)
    ?widget_ids:(widget_ids_ : widget_id_list option) ~arn:(arn_ : scheduled_report_arn)
    ~name:(name_ : scheduled_report_name) ~dashboard_arn:(dashboard_arn_ : dashboard_arn)
    ~schedule_expression:(schedule_expression_ : generic_string) ~state:(state_ : schedule_state)
    ~health_status:(health_status_ : health_status) () =
  ({
     arn = arn_;
     name = name_;
     dashboard_arn = dashboard_arn_;
     schedule_expression = schedule_expression_;
     state = state_;
     health_status = health_status_;
     schedule_expression_time_zone = schedule_expression_time_zone_;
     widget_ids = widget_ids_;
   }
    : scheduled_report_summary)

let make_list_scheduled_reports_response ?next_token:(next_token_ : next_page_token option)
    ~scheduled_reports:(scheduled_reports_ : scheduled_report_summary_list) () =
  ({ scheduled_reports = scheduled_reports_; next_token = next_token_ }
    : list_scheduled_reports_response)

let make_list_scheduled_reports_request ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_scheduled_reports_request)

let make_dashboard_reference ?description:(description_ : description option)
    ~arn:(arn_ : dashboard_arn) ~name:(name_ : dashboard_name) ~type_:(type__ : dashboard_type)
    ~created_at:(created_at_ : generic_time_stamp) ~updated_at:(updated_at_ : generic_time_stamp) ()
    =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : dashboard_reference)

let make_list_dashboards_response ?next_token:(next_token_ : next_page_token option)
    ~dashboards:(dashboards_ : dashboard_reference_list) () =
  ({ dashboards = dashboards_; next_token = next_token_ } : list_dashboards_response)

let make_list_dashboards_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_dashboards_request)

let make_scheduled_report ?arn:(arn_ : scheduled_report_arn option)
    ?description:(description_ : description option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ?created_at:(created_at_ : generic_time_stamp option)
    ?updated_at:(updated_at_ : generic_time_stamp option)
    ?last_execution_at:(last_execution_at_ : generic_time_stamp option)
    ?health_status:(health_status_ : health_status option) ~name:(name_ : scheduled_report_name)
    ~dashboard_arn:(dashboard_arn_ : dashboard_arn)
    ~scheduled_report_execution_role_arn:(scheduled_report_execution_role_arn_ : service_role_arn)
    ~schedule_config:(schedule_config_ : schedule_config) () =
  ({
     arn = arn_;
     name = name_;
     dashboard_arn = dashboard_arn_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     schedule_config = schedule_config_;
     description = description_;
     widget_ids = widget_ids_;
     widget_date_range_override = widget_date_range_override_;
     created_at = created_at_;
     updated_at = updated_at_;
     last_execution_at = last_execution_at_;
     health_status = health_status_;
   }
    : scheduled_report)

let make_get_scheduled_report_response ~scheduled_report:(scheduled_report_ : scheduled_report) () =
  ({ scheduled_report = scheduled_report_ } : get_scheduled_report_response)

let make_get_scheduled_report_request ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : get_scheduled_report_request)

let make_get_resource_policy_response ~resource_arn:(resource_arn_ : dashboard_arn)
    ~policy_document:(policy_document_ : generic_string) () =
  ({ resource_arn = resource_arn_; policy_document = policy_document_ }
    : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : dashboard_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_dashboard_response ?description:(description_ : description option)
    ~arn:(arn_ : dashboard_arn) ~name:(name_ : dashboard_name) ~type_:(type__ : dashboard_type)
    ~widgets:(widgets_ : widget_list) ~created_at:(created_at_ : generic_time_stamp)
    ~updated_at:(updated_at_ : generic_time_stamp) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     widgets = widgets_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : get_dashboard_response)

let make_get_dashboard_request ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : get_dashboard_request)

let make_execute_scheduled_report_response ?health_status:(health_status_ : health_status option)
    ?execution_triggered:(execution_triggered_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ health_status = health_status_; execution_triggered = execution_triggered_ }
    : execute_scheduled_report_response)

let make_execute_scheduled_report_request ?client_token:(client_token_ : client_token option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_; client_token = client_token_; dry_run = dry_run_ }
    : execute_scheduled_report_request)

let make_delete_scheduled_report_response ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : delete_scheduled_report_response)

let make_delete_scheduled_report_request ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : delete_scheduled_report_request)

let make_delete_dashboard_response ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : delete_dashboard_response)

let make_delete_dashboard_request ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : delete_dashboard_request)

let make_create_scheduled_report_response ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : create_scheduled_report_response)

let make_scheduled_report_input ?description:(description_ : description option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ~name:(name_ : scheduled_report_name) ~dashboard_arn:(dashboard_arn_ : dashboard_arn)
    ~scheduled_report_execution_role_arn:(scheduled_report_execution_role_arn_ : service_role_arn)
    ~schedule_config:(schedule_config_ : schedule_config) () =
  ({
     name = name_;
     dashboard_arn = dashboard_arn_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     schedule_config = schedule_config_;
     description = description_;
     widget_ids = widget_ids_;
     widget_date_range_override = widget_date_range_override_;
   }
    : scheduled_report_input)

let make_create_scheduled_report_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~scheduled_report:(scheduled_report_ : scheduled_report_input) () =
  ({
     scheduled_report = scheduled_report_;
     resource_tags = resource_tags_;
     client_token = client_token_;
   }
    : create_scheduled_report_request)

let make_create_dashboard_response ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : create_dashboard_response)

let make_create_dashboard_request ?description:(description_ : description option)
    ?resource_tags:(resource_tags_ : resource_tag_list option) ~name:(name_ : dashboard_name)
    ~widgets:(widgets_ : widget_list) () =
  ({ name = name_; description = description_; widgets = widgets_; resource_tags = resource_tags_ }
    : create_dashboard_request)
