open Types

val make_update_scheduled_report_response :
  arn:scheduled_report_arn -> unit -> update_scheduled_report_response

val make_date_time_value : type_:date_time_type -> value:generic_string -> unit -> date_time_value

val make_date_time_range :
  start_time:date_time_value -> end_time:date_time_value -> unit -> date_time_range

val make_schedule_period :
  ?start_time:generic_time_stamp -> ?end_time:generic_time_stamp -> unit -> schedule_period

val make_schedule_config :
  ?schedule_expression:generic_string ->
  ?schedule_expression_time_zone:generic_string ->
  ?schedule_period:schedule_period ->
  ?state:schedule_state ->
  unit ->
  schedule_config

val make_update_scheduled_report_request :
  ?name:scheduled_report_name ->
  ?description:description ->
  ?dashboard_arn:dashboard_arn ->
  ?scheduled_report_execution_role_arn:service_role_arn ->
  ?schedule_config:schedule_config ->
  ?widget_ids:widget_id_list ->
  ?widget_date_range_override:date_time_range ->
  ?clear_widget_ids:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?clear_widget_date_range_override:Smaws_Lib.Smithy_api.Types.boolean_ ->
  arn:scheduled_report_arn ->
  unit ->
  update_scheduled_report_request

val make_update_dashboard_response : arn:dashboard_arn -> unit -> update_dashboard_response
val make_table_display_config_struct : unit -> unit
val make_graph_display_config : visual_type:visual_type -> unit -> graph_display_config

val make_cost_category_values :
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  ?values:string_list ->
  ?match_options:match_options ->
  unit ->
  cost_category_values

val make_tag_values :
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  ?values:string_list ->
  ?match_options:match_options ->
  unit ->
  tag_values

val make_dimension_values :
  ?match_options:match_options -> key:dimension -> values:string_list -> unit -> dimension_values

val make_expression :
  ?\#or:expressions ->
  ?and_:expressions ->
  ?not:expression ->
  ?dimensions:dimension_values ->
  ?tags:tag_values ->
  ?cost_categories:cost_category_values ->
  unit ->
  expression

val make_group_definition :
  ?type_:group_definition_type -> key:Smaws_Lib.Smithy_api.Types.string_ -> unit -> group_definition

val make_reservation_utilization_query :
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?filter:expression ->
  time_range:date_time_range ->
  unit ->
  reservation_utilization_query

val make_reservation_coverage_query :
  ?group_by:group_definitions ->
  ?granularity:granularity ->
  ?filter:expression ->
  ?metrics:metric_names ->
  time_range:date_time_range ->
  unit ->
  reservation_coverage_query

val make_savings_plans_utilization_query :
  ?granularity:granularity ->
  ?filter:expression ->
  time_range:date_time_range ->
  unit ->
  savings_plans_utilization_query

val make_savings_plans_coverage_query :
  ?metrics:metric_names ->
  ?granularity:granularity ->
  ?group_by:group_definitions ->
  ?filter:expression ->
  time_range:date_time_range ->
  unit ->
  savings_plans_coverage_query

val make_cost_and_usage_query :
  ?group_by:group_definitions ->
  ?filter:expression ->
  metrics:metric_names ->
  time_range:date_time_range ->
  granularity:granularity ->
  unit ->
  cost_and_usage_query

val make_widget_config :
  query_parameters:query_parameters -> display_config:display_config -> unit -> widget_config

val make_widget :
  ?id:widget_id ->
  ?description:description ->
  ?width:widget_width ->
  ?height:widget_height ->
  ?horizontal_offset:Smaws_Lib.Smithy_api.Types.integer ->
  title:widget_title ->
  configs:widget_config_list ->
  unit ->
  widget

val make_update_dashboard_request :
  ?description:description ->
  ?widgets:widget_list ->
  arn:dashboard_arn ->
  name:dashboard_name ->
  unit ->
  update_dashboard_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn ->
  resource_tag_keys:resource_tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : key:resource_tag_key -> value:resource_tag_value -> unit -> resource_tag

val make_tag_resource_request :
  resource_arn:resource_arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_health_status :
  ?last_refreshed_at:generic_time_stamp ->
  ?status_reasons:status_reason_list ->
  status_code:health_status_code ->
  unit ->
  health_status

val make_scheduled_report_summary :
  ?schedule_expression_time_zone:generic_string ->
  ?widget_ids:widget_id_list ->
  arn:scheduled_report_arn ->
  name:scheduled_report_name ->
  dashboard_arn:dashboard_arn ->
  schedule_expression:generic_string ->
  state:schedule_state ->
  health_status:health_status ->
  unit ->
  scheduled_report_summary

val make_list_scheduled_reports_response :
  ?next_token:next_page_token ->
  scheduled_reports:scheduled_report_summary_list ->
  unit ->
  list_scheduled_reports_response

val make_list_scheduled_reports_request :
  ?next_token:next_page_token -> ?max_results:max_results -> unit -> list_scheduled_reports_request

val make_dashboard_reference :
  ?description:description ->
  arn:dashboard_arn ->
  name:dashboard_name ->
  type_:dashboard_type ->
  created_at:generic_time_stamp ->
  updated_at:generic_time_stamp ->
  unit ->
  dashboard_reference

val make_list_dashboards_response :
  ?next_token:next_page_token ->
  dashboards:dashboard_reference_list ->
  unit ->
  list_dashboards_response

val make_list_dashboards_request :
  ?max_results:max_results -> ?next_token:next_page_token -> unit -> list_dashboards_request

val make_scheduled_report :
  ?arn:scheduled_report_arn ->
  ?description:description ->
  ?widget_ids:widget_id_list ->
  ?widget_date_range_override:date_time_range ->
  ?created_at:generic_time_stamp ->
  ?updated_at:generic_time_stamp ->
  ?last_execution_at:generic_time_stamp ->
  ?health_status:health_status ->
  name:scheduled_report_name ->
  dashboard_arn:dashboard_arn ->
  scheduled_report_execution_role_arn:service_role_arn ->
  schedule_config:schedule_config ->
  unit ->
  scheduled_report

val make_get_scheduled_report_response :
  scheduled_report:scheduled_report -> unit -> get_scheduled_report_response

val make_get_scheduled_report_request :
  arn:scheduled_report_arn -> unit -> get_scheduled_report_request

val make_get_resource_policy_response :
  resource_arn:dashboard_arn ->
  policy_document:generic_string ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:dashboard_arn -> unit -> get_resource_policy_request

val make_get_dashboard_response :
  ?description:description ->
  arn:dashboard_arn ->
  name:dashboard_name ->
  type_:dashboard_type ->
  widgets:widget_list ->
  created_at:generic_time_stamp ->
  updated_at:generic_time_stamp ->
  unit ->
  get_dashboard_response

val make_get_dashboard_request : arn:dashboard_arn -> unit -> get_dashboard_request

val make_execute_scheduled_report_response :
  ?health_status:health_status ->
  ?execution_triggered:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  execute_scheduled_report_response

val make_execute_scheduled_report_request :
  ?client_token:client_token ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.boolean_ ->
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

val make_scheduled_report_input :
  ?description:description ->
  ?widget_ids:widget_id_list ->
  ?widget_date_range_override:date_time_range ->
  name:scheduled_report_name ->
  dashboard_arn:dashboard_arn ->
  scheduled_report_execution_role_arn:service_role_arn ->
  schedule_config:schedule_config ->
  unit ->
  scheduled_report_input

val make_create_scheduled_report_request :
  ?resource_tags:resource_tag_list ->
  ?client_token:client_token ->
  scheduled_report:scheduled_report_input ->
  unit ->
  create_scheduled_report_request

val make_create_dashboard_response : arn:dashboard_arn -> unit -> create_dashboard_response

val make_create_dashboard_request :
  ?description:description ->
  ?resource_tags:resource_tag_list ->
  name:dashboard_name ->
  widgets:widget_list ->
  unit ->
  create_dashboard_request
