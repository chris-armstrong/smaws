open Types

let make_date_time_value ~value:(value_ : generic_string) ~type_:(type__ : date_time_type) () =
  ({ value = value_; type_ = type__ } : date_time_value)

let make_date_time_range ~end_time:(end_time_ : date_time_value)
    ~start_time:(start_time_ : date_time_value) () =
  ({ end_time = end_time_; start_time = start_time_ } : date_time_range)

let make_group_definition ?type_:(type__ : group_definition_type option)
    ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; key = key_ } : group_definition)

let make_dimension_values ?match_options:(match_options_ : match_options option)
    ~values:(values_ : string_list) ~key:(key_ : dimension) () =
  ({ match_options = match_options_; values = values_; key = key_ } : dimension_values)

let make_tag_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : string_list option) ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({ match_options = match_options_; values = values_; key = key_ } : tag_values)

let make_cost_category_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : string_list option) ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({ match_options = match_options_; values = values_; key = key_ } : cost_category_values)

let make_expression ?cost_categories:(cost_categories_ : cost_category_values option)
    ?tags:(tags_ : tag_values option) ?dimensions:(dimensions_ : dimension_values option)
    ?not:(not_ : expression option) ?and_:(and__ : expressions option)
    ?\#or:(or_ : expressions option) () =
  ({
     cost_categories = cost_categories_;
     tags = tags_;
     dimensions = dimensions_;
     not = not_;
     and_ = and__;
     \#or = or_;
   }
    : expression)

let make_cost_and_usage_query ?filter:(filter_ : expression option)
    ?group_by:(group_by_ : group_definitions option) ~granularity:(granularity_ : granularity)
    ~time_range:(time_range_ : date_time_range) ~metrics:(metrics_ : metric_names) () =
  ({
     filter = filter_;
     group_by = group_by_;
     granularity = granularity_;
     time_range = time_range_;
     metrics = metrics_;
   }
    : cost_and_usage_query)

let make_savings_plans_coverage_query ?filter:(filter_ : expression option)
    ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?metrics:(metrics_ : metric_names option)
    ~time_range:(time_range_ : date_time_range) () =
  ({
     filter = filter_;
     group_by = group_by_;
     granularity = granularity_;
     metrics = metrics_;
     time_range = time_range_;
   }
    : savings_plans_coverage_query)

let make_savings_plans_utilization_query ?filter:(filter_ : expression option)
    ?granularity:(granularity_ : granularity option) ~time_range:(time_range_ : date_time_range) ()
    =
  ({ filter = filter_; granularity = granularity_; time_range = time_range_ }
    : savings_plans_utilization_query)

let make_reservation_coverage_query ?metrics:(metrics_ : metric_names option)
    ?filter:(filter_ : expression option) ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ~time_range:(time_range_ : date_time_range) ()
    =
  ({
     metrics = metrics_;
     filter = filter_;
     granularity = granularity_;
     group_by = group_by_;
     time_range = time_range_;
   }
    : reservation_coverage_query)

let make_reservation_utilization_query ?filter:(filter_ : expression option)
    ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ~time_range:(time_range_ : date_time_range) ()
    =
  ({ filter = filter_; granularity = granularity_; group_by = group_by_; time_range = time_range_ }
    : reservation_utilization_query)

let make_graph_display_config ~visual_type:(visual_type_ : visual_type) () =
  ({ visual_type = visual_type_ } : graph_display_config)

let make_table_display_config_struct () = (() : unit)

let make_widget_config ~display_config:(display_config_ : display_config)
    ~query_parameters:(query_parameters_ : query_parameters) () =
  ({ display_config = display_config_; query_parameters = query_parameters_ } : widget_config)

let make_widget ?horizontal_offset:(horizontal_offset_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?height:(height_ : widget_height option) ?width:(width_ : widget_width option)
    ?description:(description_ : description option) ?id:(id_ : widget_id option)
    ~configs:(configs_ : widget_config_list) ~title:(title_ : widget_title) () =
  ({
     configs = configs_;
     horizontal_offset = horizontal_offset_;
     height = height_;
     width = width_;
     description = description_;
     title = title_;
     id = id_;
   }
    : widget)

let make_update_scheduled_report_response ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : update_scheduled_report_response)

let make_schedule_period ?end_time:(end_time_ : generic_time_stamp option)
    ?start_time:(start_time_ : generic_time_stamp option) () =
  ({ end_time = end_time_; start_time = start_time_ } : schedule_period)

let make_schedule_config ?state:(state_ : schedule_state option)
    ?schedule_period:(schedule_period_ : schedule_period option)
    ?schedule_expression_time_zone:(schedule_expression_time_zone_ : generic_string option)
    ?schedule_expression:(schedule_expression_ : generic_string option) () =
  ({
     state = state_;
     schedule_period = schedule_period_;
     schedule_expression_time_zone = schedule_expression_time_zone_;
     schedule_expression = schedule_expression_;
   }
    : schedule_config)

let make_update_scheduled_report_request
    ?clear_widget_date_range_override:
      (clear_widget_date_range_override_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?clear_widget_ids:(clear_widget_ids_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?schedule_config:(schedule_config_ : schedule_config option)
    ?scheduled_report_execution_role_arn:
      (scheduled_report_execution_role_arn_ : service_role_arn option)
    ?dashboard_arn:(dashboard_arn_ : dashboard_arn option)
    ?description:(description_ : description option) ?name:(name_ : scheduled_report_name option)
    ~arn:(arn_ : scheduled_report_arn) () =
  ({
     clear_widget_date_range_override = clear_widget_date_range_override_;
     clear_widget_ids = clear_widget_ids_;
     widget_date_range_override = widget_date_range_override_;
     widget_ids = widget_ids_;
     schedule_config = schedule_config_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     dashboard_arn = dashboard_arn_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : update_scheduled_report_request)

let make_update_dashboard_response ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : update_dashboard_response)

let make_update_dashboard_request ?widgets:(widgets_ : widget_list option)
    ?description:(description_ : description option) ~name:(name_ : dashboard_name)
    ~arn:(arn_ : dashboard_arn) () =
  ({ widgets = widgets_; description = description_; name = name_; arn = arn_ }
    : update_dashboard_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_tag_keys = resource_tag_keys_; resource_arn = resource_arn_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~value:(value_ : resource_tag_value) ~key:(key_ : resource_tag_key) () =
  ({ value = value_; key = key_ } : resource_tag)

let make_tag_resource_request ~resource_tags:(resource_tags_ : resource_tag_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_tags = resource_tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_health_status ?status_reasons:(status_reasons_ : status_reason_list option)
    ?last_refreshed_at:(last_refreshed_at_ : generic_time_stamp option)
    ~status_code:(status_code_ : health_status_code) () =
  ({
     status_reasons = status_reasons_;
     last_refreshed_at = last_refreshed_at_;
     status_code = status_code_;
   }
    : health_status)

let make_scheduled_report_summary ?widget_ids:(widget_ids_ : widget_id_list option)
    ?schedule_expression_time_zone:(schedule_expression_time_zone_ : generic_string option)
    ~health_status:(health_status_ : health_status) ~state:(state_ : schedule_state)
    ~schedule_expression:(schedule_expression_ : generic_string)
    ~dashboard_arn:(dashboard_arn_ : dashboard_arn) ~name:(name_ : scheduled_report_name)
    ~arn:(arn_ : scheduled_report_arn) () =
  ({
     widget_ids = widget_ids_;
     schedule_expression_time_zone = schedule_expression_time_zone_;
     health_status = health_status_;
     state = state_;
     schedule_expression = schedule_expression_;
     dashboard_arn = dashboard_arn_;
     name = name_;
     arn = arn_;
   }
    : scheduled_report_summary)

let make_scheduled_report_input
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?description:(description_ : description option)
    ~schedule_config:(schedule_config_ : schedule_config)
    ~scheduled_report_execution_role_arn:(scheduled_report_execution_role_arn_ : service_role_arn)
    ~dashboard_arn:(dashboard_arn_ : dashboard_arn) ~name:(name_ : scheduled_report_name) () =
  ({
     widget_date_range_override = widget_date_range_override_;
     widget_ids = widget_ids_;
     description = description_;
     schedule_config = schedule_config_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     dashboard_arn = dashboard_arn_;
     name = name_;
   }
    : scheduled_report_input)

let make_scheduled_report ?health_status:(health_status_ : health_status option)
    ?last_execution_at:(last_execution_at_ : generic_time_stamp option)
    ?updated_at:(updated_at_ : generic_time_stamp option)
    ?created_at:(created_at_ : generic_time_stamp option)
    ?widget_date_range_override:(widget_date_range_override_ : date_time_range option)
    ?widget_ids:(widget_ids_ : widget_id_list option)
    ?description:(description_ : description option) ?arn:(arn_ : scheduled_report_arn option)
    ~schedule_config:(schedule_config_ : schedule_config)
    ~scheduled_report_execution_role_arn:(scheduled_report_execution_role_arn_ : service_role_arn)
    ~dashboard_arn:(dashboard_arn_ : dashboard_arn) ~name:(name_ : scheduled_report_name) () =
  ({
     health_status = health_status_;
     last_execution_at = last_execution_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     widget_date_range_override = widget_date_range_override_;
     widget_ids = widget_ids_;
     description = description_;
     schedule_config = schedule_config_;
     scheduled_report_execution_role_arn = scheduled_report_execution_role_arn_;
     dashboard_arn = dashboard_arn_;
     name = name_;
     arn = arn_;
   }
    : scheduled_report)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_scheduled_reports_response ?next_token:(next_token_ : next_page_token option)
    ~scheduled_reports:(scheduled_reports_ : scheduled_report_summary_list) () =
  ({ next_token = next_token_; scheduled_reports = scheduled_reports_ }
    : list_scheduled_reports_response)

let make_list_scheduled_reports_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_scheduled_reports_request)

let make_dashboard_reference ?description:(description_ : description option)
    ~updated_at:(updated_at_ : generic_time_stamp) ~created_at:(created_at_ : generic_time_stamp)
    ~type_:(type__ : dashboard_type) ~name:(name_ : dashboard_name) ~arn:(arn_ : dashboard_arn) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : dashboard_reference)

let make_list_dashboards_response ?next_token:(next_token_ : next_page_token option)
    ~dashboards:(dashboards_ : dashboard_reference_list) () =
  ({ next_token = next_token_; dashboards = dashboards_ } : list_dashboards_response)

let make_list_dashboards_request ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_dashboards_request)

let make_get_scheduled_report_response ~scheduled_report:(scheduled_report_ : scheduled_report) () =
  ({ scheduled_report = scheduled_report_ } : get_scheduled_report_response)

let make_get_scheduled_report_request ~arn:(arn_ : scheduled_report_arn) () =
  ({ arn = arn_ } : get_scheduled_report_request)

let make_get_resource_policy_response ~policy_document:(policy_document_ : generic_string)
    ~resource_arn:(resource_arn_ : dashboard_arn) () =
  ({ policy_document = policy_document_; resource_arn = resource_arn_ }
    : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : dashboard_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_dashboard_response ?description:(description_ : description option)
    ~updated_at:(updated_at_ : generic_time_stamp) ~created_at:(created_at_ : generic_time_stamp)
    ~widgets:(widgets_ : widget_list) ~type_:(type__ : dashboard_type)
    ~name:(name_ : dashboard_name) ~arn:(arn_ : dashboard_arn) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     widgets = widgets_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : get_dashboard_response)

let make_get_dashboard_request ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : get_dashboard_request)

let make_execute_scheduled_report_response
    ?execution_triggered:(execution_triggered_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?health_status:(health_status_ : health_status option) () =
  ({ execution_triggered = execution_triggered_; health_status = health_status_ }
    : execute_scheduled_report_response)

let make_execute_scheduled_report_request
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?client_token:(client_token_ : client_token option) ~arn:(arn_ : scheduled_report_arn) () =
  ({ dry_run = dry_run_; client_token = client_token_; arn = arn_ }
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

let make_create_scheduled_report_request ?client_token:(client_token_ : client_token option)
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~scheduled_report:(scheduled_report_ : scheduled_report_input) () =
  ({
     client_token = client_token_;
     resource_tags = resource_tags_;
     scheduled_report = scheduled_report_;
   }
    : create_scheduled_report_request)

let make_create_dashboard_response ~arn:(arn_ : dashboard_arn) () =
  ({ arn = arn_ } : create_dashboard_response)

let make_create_dashboard_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?description:(description_ : description option) ~widgets:(widgets_ : widget_list)
    ~name:(name_ : dashboard_name) () =
  ({ resource_tags = resource_tags_; widgets = widgets_; description = description_; name = name_ }
    : create_dashboard_request)
