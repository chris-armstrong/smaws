open Smaws_Lib.Json.SerializeHelpers
open Types

let generic_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let scheduled_report_arn_to_yojson = string_to_yojson

let update_scheduled_report_response_to_yojson (x : update_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let date_time_type_to_yojson (x : date_time_type) =
  match x with ABSOLUTE -> `String "ABSOLUTE" | RELATIVE -> `String "RELATIVE"

let date_time_value_to_yojson (x : date_time_value) =
  assoc_to_yojson
    [
      ("type", Some (date_time_type_to_yojson x.type_));
      ("value", Some (generic_string_to_yojson x.value));
    ]

let date_time_range_to_yojson (x : date_time_range) =
  assoc_to_yojson
    [
      ("startTime", Some (date_time_value_to_yojson x.start_time));
      ("endTime", Some (date_time_value_to_yojson x.end_time));
    ]

let widget_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let schedule_state_to_yojson (x : schedule_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let generic_time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let schedule_period_to_yojson (x : schedule_period) =
  assoc_to_yojson
    [
      ("startTime", option_to_yojson generic_time_stamp_to_yojson x.start_time);
      ("endTime", option_to_yojson generic_time_stamp_to_yojson x.end_time);
    ]

let schedule_config_to_yojson (x : schedule_config) =
  assoc_to_yojson
    [
      ("scheduleExpression", option_to_yojson generic_string_to_yojson x.schedule_expression);
      ( "scheduleExpressionTimeZone",
        option_to_yojson generic_string_to_yojson x.schedule_expression_time_zone );
      ("schedulePeriod", option_to_yojson schedule_period_to_yojson x.schedule_period);
      ("state", option_to_yojson schedule_state_to_yojson x.state);
    ]

let service_role_arn_to_yojson = string_to_yojson
let dashboard_arn_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let scheduled_report_name_to_yojson = string_to_yojson

let update_scheduled_report_request_to_yojson (x : update_scheduled_report_request) =
  assoc_to_yojson
    [
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
      ("name", option_to_yojson scheduled_report_name_to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("dashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ( "scheduledReportExecutionRoleArn",
        option_to_yojson service_role_arn_to_yojson x.scheduled_report_execution_role_arn );
      ("scheduleConfig", option_to_yojson schedule_config_to_yojson x.schedule_config);
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
      ( "clearWidgetIds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.clear_widget_ids
      );
      ( "clearWidgetDateRangeOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.clear_widget_date_range_override );
    ]

let update_dashboard_response_to_yojson (x : update_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let table_display_config_struct_to_yojson = unit_to_yojson

let visual_type_to_yojson (x : visual_type) =
  match x with LINE -> `String "LINE" | BAR -> `String "BAR" | STACK -> `String "STACK"

let graph_display_config_to_yojson (x : graph_display_config) =
  assoc_to_yojson [ ("visualType", Some (visual_type_to_yojson x.visual_type)) ]

let graph_display_config_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson graph_display_config_to_yojson tree

let display_config_to_yojson (x : display_config) =
  match x with
  | Graph arg -> assoc_to_yojson [ ("graph", Some (graph_display_config_map_to_yojson arg)) ]
  | Table arg -> assoc_to_yojson [ ("table", Some (table_display_config_struct_to_yojson arg)) ]

let match_option_to_yojson (x : match_option) =
  match x with
  | EQUALS -> `String "EQUALS"
  | ABSENT -> `String "ABSENT"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | CASE_SENSITIVE -> `String "CASE_SENSITIVE"
  | CASE_INSENSITIVE -> `String "CASE_INSENSITIVE"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let dimension_to_yojson (x : dimension) =
  match x with
  | AZ -> `String "AZ"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | OPERATION -> `String "OPERATION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | REGION -> `String "REGION"
  | SERVICE -> `String "SERVICE"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | TAG_KEY -> `String "TAG_KEY"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | TENANCY -> `String "TENANCY"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | COST_CATEGORY_NAME -> `String "COST_CATEGORY_NAME"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | SCOPE -> `String "SCOPE"
  | PLATFORM -> `String "PLATFORM"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("key", Some (dimension_to_yojson x.key));
      ("values", Some (string_list_to_yojson x.values));
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let rec expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

and expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("or", option_to_yojson expressions_to_yojson x.\#or);
      ("and", option_to_yojson expressions_to_yojson x.and_);
      ("not", option_to_yojson expression_to_yojson x.not);
      ("dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("tags", option_to_yojson tag_values_to_yojson x.tags);
      ("costCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
    ]

let granularity_to_yojson (x : granularity) =
  match x with
  | HOURLY -> `String "HOURLY"
  | DAILY -> `String "DAILY"
  | MONTHLY -> `String "MONTHLY"

let group_definition_type_to_yojson (x : group_definition_type) =
  match x with
  | DIMENSION -> `String "DIMENSION"
  | TAG -> `String "TAG"
  | COST_CATEGORY -> `String "COST_CATEGORY"

let group_definition_to_yojson (x : group_definition) =
  assoc_to_yojson
    [
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
      ("type", option_to_yojson group_definition_type_to_yojson x.type_);
    ]

let group_definitions_to_yojson tree = list_to_yojson group_definition_to_yojson tree

let reservation_utilization_query_to_yojson (x : reservation_utilization_query) =
  assoc_to_yojson
    [
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("filter", option_to_yojson expression_to_yojson x.filter);
    ]

let metric_name_to_yojson (x : metric_name) =
  match x with
  | AmortizedCost -> `String "AmortizedCost"
  | BlendedCost -> `String "BlendedCost"
  | NetAmortizedCost -> `String "NetAmortizedCost"
  | NetUnblendedCost -> `String "NetUnblendedCost"
  | NormalizedUsageAmount -> `String "NormalizedUsageAmount"
  | UnblendedCost -> `String "UnblendedCost"
  | UsageQuantity -> `String "UsageQuantity"
  | SpendCoveredBySavingsPlans -> `String "SpendCoveredBySavingsPlans"
  | Hour -> `String "Hour"
  | Unit -> `String "Unit"
  | Cost -> `String "Cost"

let metric_names_to_yojson tree = list_to_yojson metric_name_to_yojson tree

let reservation_coverage_query_to_yojson (x : reservation_coverage_query) =
  assoc_to_yojson
    [
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("metrics", option_to_yojson metric_names_to_yojson x.metrics);
    ]

let savings_plans_utilization_query_to_yojson (x : savings_plans_utilization_query) =
  assoc_to_yojson
    [
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("filter", option_to_yojson expression_to_yojson x.filter);
    ]

let savings_plans_coverage_query_to_yojson (x : savings_plans_coverage_query) =
  assoc_to_yojson
    [
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("filter", option_to_yojson expression_to_yojson x.filter);
    ]

let cost_and_usage_query_to_yojson (x : cost_and_usage_query) =
  assoc_to_yojson
    [
      ("metrics", Some (metric_names_to_yojson x.metrics));
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("granularity", Some (granularity_to_yojson x.granularity));
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("filter", option_to_yojson expression_to_yojson x.filter);
    ]

let query_parameters_to_yojson (x : query_parameters) =
  match x with
  | CostAndUsage arg ->
      assoc_to_yojson [ ("costAndUsage", Some (cost_and_usage_query_to_yojson arg)) ]
  | SavingsPlansCoverage arg ->
      assoc_to_yojson
        [ ("savingsPlansCoverage", Some (savings_plans_coverage_query_to_yojson arg)) ]
  | SavingsPlansUtilization arg ->
      assoc_to_yojson
        [ ("savingsPlansUtilization", Some (savings_plans_utilization_query_to_yojson arg)) ]
  | ReservationCoverage arg ->
      assoc_to_yojson [ ("reservationCoverage", Some (reservation_coverage_query_to_yojson arg)) ]
  | ReservationUtilization arg ->
      assoc_to_yojson
        [ ("reservationUtilization", Some (reservation_utilization_query_to_yojson arg)) ]

let widget_config_to_yojson (x : widget_config) =
  assoc_to_yojson
    [
      ("queryParameters", Some (query_parameters_to_yojson x.query_parameters));
      ("displayConfig", Some (display_config_to_yojson x.display_config));
    ]

let widget_config_list_to_yojson tree = list_to_yojson widget_config_to_yojson tree
let widget_height_to_yojson = int_to_yojson
let widget_width_to_yojson = int_to_yojson
let widget_title_to_yojson = string_to_yojson
let widget_id_to_yojson = string_to_yojson

let widget_to_yojson (x : widget) =
  assoc_to_yojson
    [
      ("id", option_to_yojson widget_id_to_yojson x.id);
      ("title", Some (widget_title_to_yojson x.title));
      ("description", option_to_yojson description_to_yojson x.description);
      ("width", option_to_yojson widget_width_to_yojson x.width);
      ("height", option_to_yojson widget_height_to_yojson x.height);
      ( "horizontalOffset",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.horizontal_offset
      );
      ("configs", Some (widget_config_list_to_yojson x.configs));
    ]

let widget_list_to_yojson tree = list_to_yojson widget_to_yojson tree
let dashboard_name_to_yojson = string_to_yojson

let update_dashboard_request_to_yojson (x : update_dashboard_request) =
  assoc_to_yojson
    [
      ("arn", Some (dashboard_arn_to_yojson x.arn));
      ("name", Some (dashboard_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("widgets", option_to_yojson widget_list_to_yojson x.widgets);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("resourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("key", Some (resource_tag_key_to_yojson x.key));
      ("value", Some (resource_tag_value_to_yojson x.value));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("resourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let next_page_token_to_yojson = string_to_yojson

let status_reason_to_yojson (x : status_reason) =
  match x with
  | DATA_SOURCE_ACCESS_DENIED -> `String "DATA_SOURCE_ACCESS_DENIED"
  | EXECUTION_ROLE_ASSUME_FAILED -> `String "EXECUTION_ROLE_ASSUME_FAILED"
  | EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS -> `String "EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS"
  | DASHBOARD_NOT_FOUND -> `String "DASHBOARD_NOT_FOUND"
  | DASHBOARD_ACCESS_DENIED -> `String "DASHBOARD_ACCESS_DENIED"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | WIDGET_ID_NOT_FOUND -> `String "WIDGET_ID_NOT_FOUND"

let status_reason_list_to_yojson tree = list_to_yojson status_reason_to_yojson tree

let health_status_code_to_yojson (x : health_status_code) =
  match x with HEALTHY -> `String "HEALTHY" | UNHEALTHY -> `String "UNHEALTHY"

let health_status_to_yojson (x : health_status) =
  assoc_to_yojson
    [
      ("statusCode", Some (health_status_code_to_yojson x.status_code));
      ("lastRefreshedAt", option_to_yojson generic_time_stamp_to_yojson x.last_refreshed_at);
      ("statusReasons", option_to_yojson status_reason_list_to_yojson x.status_reasons);
    ]

let scheduled_report_summary_to_yojson (x : scheduled_report_summary) =
  assoc_to_yojson
    [
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
      ("name", Some (scheduled_report_name_to_yojson x.name));
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ("scheduleExpression", Some (generic_string_to_yojson x.schedule_expression));
      ("state", Some (schedule_state_to_yojson x.state));
      ("healthStatus", Some (health_status_to_yojson x.health_status));
      ( "scheduleExpressionTimeZone",
        option_to_yojson generic_string_to_yojson x.schedule_expression_time_zone );
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
    ]

let scheduled_report_summary_list_to_yojson tree =
  list_to_yojson scheduled_report_summary_to_yojson tree

let list_scheduled_reports_response_to_yojson (x : list_scheduled_reports_response) =
  assoc_to_yojson
    [
      ("scheduledReports", Some (scheduled_report_summary_list_to_yojson x.scheduled_reports));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_scheduled_reports_request_to_yojson (x : list_scheduled_reports_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let dashboard_type_to_yojson (x : dashboard_type) = match x with CUSTOM -> `String "CUSTOM"

let dashboard_reference_to_yojson (x : dashboard_reference) =
  assoc_to_yojson
    [
      ("arn", Some (dashboard_arn_to_yojson x.arn));
      ("name", Some (dashboard_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("type", Some (dashboard_type_to_yojson x.type_));
      ("createdAt", Some (generic_time_stamp_to_yojson x.created_at));
      ("updatedAt", Some (generic_time_stamp_to_yojson x.updated_at));
    ]

let dashboard_reference_list_to_yojson tree = list_to_yojson dashboard_reference_to_yojson tree

let list_dashboards_response_to_yojson (x : list_dashboards_response) =
  assoc_to_yojson
    [
      ("dashboards", Some (dashboard_reference_list_to_yojson x.dashboards));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_dashboards_request_to_yojson (x : list_dashboards_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let scheduled_report_to_yojson (x : scheduled_report) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson scheduled_report_arn_to_yojson x.arn);
      ("name", Some (scheduled_report_name_to_yojson x.name));
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ( "scheduledReportExecutionRoleArn",
        Some (service_role_arn_to_yojson x.scheduled_report_execution_role_arn) );
      ("scheduleConfig", Some (schedule_config_to_yojson x.schedule_config));
      ("description", option_to_yojson description_to_yojson x.description);
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
      ("createdAt", option_to_yojson generic_time_stamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson generic_time_stamp_to_yojson x.updated_at);
      ("lastExecutionAt", option_to_yojson generic_time_stamp_to_yojson x.last_execution_at);
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
    ]

let get_scheduled_report_response_to_yojson (x : get_scheduled_report_response) =
  assoc_to_yojson [ ("scheduledReport", Some (scheduled_report_to_yojson x.scheduled_report)) ]

let get_scheduled_report_request_to_yojson (x : get_scheduled_report_request) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("resourceArn", Some (dashboard_arn_to_yojson x.resource_arn));
      ("policyDocument", Some (generic_string_to_yojson x.policy_document));
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("resourceArn", Some (dashboard_arn_to_yojson x.resource_arn)) ]

let get_dashboard_response_to_yojson (x : get_dashboard_response) =
  assoc_to_yojson
    [
      ("arn", Some (dashboard_arn_to_yojson x.arn));
      ("name", Some (dashboard_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("type", Some (dashboard_type_to_yojson x.type_));
      ("widgets", Some (widget_list_to_yojson x.widgets));
      ("createdAt", Some (generic_time_stamp_to_yojson x.created_at));
      ("updatedAt", Some (generic_time_stamp_to_yojson x.updated_at));
    ]

let get_dashboard_request_to_yojson (x : get_dashboard_request) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let execute_scheduled_report_response_to_yojson (x : execute_scheduled_report_response) =
  assoc_to_yojson
    [
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ( "executionTriggered",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.execution_triggered );
    ]

let client_token_to_yojson = string_to_yojson

let execute_scheduled_report_request_to_yojson (x : execute_scheduled_report_request) =
  assoc_to_yojson
    [
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("dryRun", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dry_run);
    ]

let delete_scheduled_report_response_to_yojson (x : delete_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let delete_scheduled_report_request_to_yojson (x : delete_scheduled_report_request) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let delete_dashboard_response_to_yojson (x : delete_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let delete_dashboard_request_to_yojson (x : delete_dashboard_request) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let create_scheduled_report_response_to_yojson (x : create_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let scheduled_report_input_to_yojson (x : scheduled_report_input) =
  assoc_to_yojson
    [
      ("name", Some (scheduled_report_name_to_yojson x.name));
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ( "scheduledReportExecutionRoleArn",
        Some (service_role_arn_to_yojson x.scheduled_report_execution_role_arn) );
      ("scheduleConfig", Some (schedule_config_to_yojson x.schedule_config));
      ("description", option_to_yojson description_to_yojson x.description);
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
    ]

let create_scheduled_report_request_to_yojson (x : create_scheduled_report_request) =
  assoc_to_yojson
    [
      ("scheduledReport", Some (scheduled_report_input_to_yojson x.scheduled_report));
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_dashboard_response_to_yojson (x : create_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let create_dashboard_request_to_yojson (x : create_dashboard_request) =
  assoc_to_yojson
    [
      ("name", Some (dashboard_name_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("widgets", Some (widget_list_to_yojson x.widgets));
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]
