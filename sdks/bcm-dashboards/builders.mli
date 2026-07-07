open Types

val make_date_time_value : value:generic_string -> type_:date_time_type -> unit -> date_time_value

val make_date_time_range :
  end_time:date_time_value -> start_time:date_time_value -> unit -> date_time_range

val make_group_definition :
  ?type_:group_definition_type -> key:Smaws_Lib.Smithy_api.Types.string_ -> unit -> group_definition

val make_dimension_values :
  ?match_options:match_options -> values:string_list -> key:dimension -> unit -> dimension_values

val make_tag_values :
  ?match_options:match_options ->
  ?values:string_list ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  tag_values

val make_cost_category_values :
  ?match_options:match_options ->
  ?values:string_list ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cost_category_values

val make_expression :
  ?cost_categories:cost_category_values ->
  ?tags:tag_values ->
  ?dimensions:dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_cost_and_usage_query :
  ?filter:expression ->
  ?group_by:group_definitions ->
  granularity:granularity ->
  time_range:date_time_range ->
  metrics:metric_names ->
  unit ->
  cost_and_usage_query

val make_savings_plans_coverage_query :
  ?filter:expression ->
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?metrics:metric_names ->
  time_range:date_time_range ->
  unit ->
  savings_plans_coverage_query

val make_savings_plans_utilization_query :
  ?filter:expression ->
  ?granularity:granularity ->
  time_range:date_time_range ->
  unit ->
  savings_plans_utilization_query

val make_reservation_coverage_query :
  ?metrics:metric_names ->
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_range:date_time_range ->
  unit ->
  reservation_coverage_query

val make_reservation_utilization_query :
  ?filter:expression ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  time_range:date_time_range ->
  unit ->
  reservation_utilization_query

val make_graph_display_config : visual_type:visual_type -> unit -> graph_display_config
val make_table_display_config_struct : unit -> unit

val make_widget_config :
  display_config:display_config -> query_parameters:query_parameters -> unit -> widget_config

val make_widget :
  ?horizontal_offset:Smaws_Lib.Smithy_api.Types.integer ->
  ?height:widget_height ->
  ?width:widget_width ->
  ?description:description ->
  ?id:widget_id ->
  configs:widget_config_list ->
  title:widget_title ->
  unit ->
  widget

val make_update_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> update_scheduled_report_response

val make_schedule_period :
  ?end_time:generic_time_stamp -> ?start_time:generic_time_stamp -> unit -> schedule_period

val make_schedule_config :
  ?state:schedule_state ->
  ?schedule_period:schedule_period ->
  ?schedule_expression_time_zone:generic_string ->
  ?schedule_expression:generic_string ->
  unit ->
  schedule_config

val make_update_scheduled_report_request :
  ?clear_widget_date_range_override:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clear_widget_ids:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?schedule_config:schedule_config ->
  ?scheduled_report_execution_role_arn:service_role_arn ->
  ?dashboard_arn:dashboard_arn ->
  ?description:description ->
  ?name:scheduled_report_name ->
  arn:scheduled_report_arn ->
  unit ->
  update_scheduled_report_request

val make_update_dashboard_response : arn:dashboard_arn -> unit -> update_dashboard_response

val make_update_dashboard_request :
  ?widgets:widget_list ->
  ?description:description ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  update_dashboard_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list ->
  resource_arn:resource_arn ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_health_status :
  ?status_reasons:status_reason_list ->
  ?last_refreshed_at:generic_time_stamp ->
  status_code:health_status_code ->
  unit ->
  health_status

val make_scheduled_report_summary :
  ?widget_ids:widget_id_list ->
  ?schedule_expression_time_zone:generic_string ->
  health_status:health_status ->
  state:schedule_state ->
  schedule_expression:generic_string ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  arn:scheduled_report_arn ->
  unit ->
  scheduled_report_summary

val make_scheduled_report_input :
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?description:description ->
  schedule_config:schedule_config ->
  scheduled_report_execution_role_arn:service_role_arn ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  unit ->
  scheduled_report_input

val make_scheduled_report :
  ?health_status:health_status ->
  ?last_execution_at:generic_time_stamp ->
  ?updated_at:generic_time_stamp ->
  ?created_at:generic_time_stamp ->
  ?widget_date_range_override:date_time_range ->
  ?widget_ids:widget_id_list ->
  ?description:description ->
  ?arn:scheduled_report_arn ->
  schedule_config:schedule_config ->
  scheduled_report_execution_role_arn:service_role_arn ->
  dashboard_arn:dashboard_arn ->
  name:scheduled_report_name ->
  unit ->
  scheduled_report

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_scheduled_reports_response :
  ?next_token:next_page_token ->
  scheduled_reports:scheduled_report_summary_list ->
  unit ->
  list_scheduled_reports_response

val make_list_scheduled_reports_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_scheduled_reports_request

val make_dashboard_reference :
  ?description:description ->
  updated_at:generic_time_stamp ->
  created_at:generic_time_stamp ->
  type_:dashboard_type ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  dashboard_reference

val make_list_dashboards_response :
  ?next_token:next_page_token ->
  dashboards:dashboard_reference_list ->
  unit ->
  list_dashboards_response

val make_list_dashboards_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_dashboards_request

val make_get_scheduled_report_response :
  scheduled_report:scheduled_report -> unit -> get_scheduled_report_response

val make_get_scheduled_report_request :
  arn:scheduled_report_arn -> unit -> get_scheduled_report_request

val make_get_resource_policy_response :
  policy_document:generic_string ->
  resource_arn:dashboard_arn ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:dashboard_arn -> unit -> get_resource_policy_request

val make_get_dashboard_response :
  ?description:description ->
  updated_at:generic_time_stamp ->
  created_at:generic_time_stamp ->
  widgets:widget_list ->
  type_:dashboard_type ->
  name:dashboard_name ->
  arn:dashboard_arn ->
  unit ->
  get_dashboard_response

val make_get_dashboard_request : arn:dashboard_arn -> unit -> get_dashboard_request

val make_execute_scheduled_report_response :
  ?execution_triggered:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?health_status:health_status ->
  unit ->
  execute_scheduled_report_response

val make_execute_scheduled_report_request :
  ?dry_run:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  arn:scheduled_report_arn ->
  unit ->
  execute_scheduled_report_request

val make_delete_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> delete_scheduled_report_response

val make_delete_scheduled_report_request :
  arn:scheduled_report_arn -> unit -> delete_scheduled_report_request

val make_delete_dashboard_response : arn:dashboard_arn -> unit -> delete_dashboard_response
val make_delete_dashboard_request : arn:dashboard_arn -> unit -> delete_dashboard_request

val make_create_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> create_scheduled_report_response

val make_create_scheduled_report_request :
  ?client_token:client_token ->
  ?resource_tags:resource_tag_list ->
  scheduled_report:scheduled_report_input ->
  unit ->
  create_scheduled_report_request

val make_create_dashboard_response : arn:dashboard_arn -> unit -> create_dashboard_response

val make_create_dashboard_request :
  ?resource_tags:resource_tag_list ->
  ?description:description ->
  widgets:widget_list ->
  name:dashboard_name ->
  unit ->
  create_dashboard_request
