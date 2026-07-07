open Smaws_Lib.Json.SerializeHelpers
open Types

let widget_width_to_yojson = int_to_yojson
let widget_title_to_yojson = string_to_yojson
let widget_id_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let widget_height_to_yojson = int_to_yojson

let metric_name_to_yojson (x : metric_name) =
  match x with
  | Cost -> `String "Cost"
  | Unit -> `String "Unit"
  | Hour -> `String "Hour"
  | SpendCoveredBySavingsPlans -> `String "SpendCoveredBySavingsPlans"
  | UsageQuantity -> `String "UsageQuantity"
  | UnblendedCost -> `String "UnblendedCost"
  | NormalizedUsageAmount -> `String "NormalizedUsageAmount"
  | NetUnblendedCost -> `String "NetUnblendedCost"
  | NetAmortizedCost -> `String "NetAmortizedCost"
  | BlendedCost -> `String "BlendedCost"
  | AmortizedCost -> `String "AmortizedCost"

let metric_names_to_yojson tree = list_to_yojson metric_name_to_yojson tree

let date_time_type_to_yojson (x : date_time_type) =
  match x with RELATIVE -> `String "RELATIVE" | ABSOLUTE -> `String "ABSOLUTE"

let generic_string_to_yojson = string_to_yojson

let date_time_value_to_yojson (x : date_time_value) =
  assoc_to_yojson
    [
      ("value", Some (generic_string_to_yojson x.value));
      ("type", Some (date_time_type_to_yojson x.type_));
    ]

let date_time_range_to_yojson (x : date_time_range) =
  assoc_to_yojson
    [
      ("endTime", Some (date_time_value_to_yojson x.end_time));
      ("startTime", Some (date_time_value_to_yojson x.start_time));
    ]

let granularity_to_yojson (x : granularity) =
  match x with
  | MONTHLY -> `String "MONTHLY"
  | DAILY -> `String "DAILY"
  | HOURLY -> `String "HOURLY"

let group_definition_type_to_yojson (x : group_definition_type) =
  match x with
  | COST_CATEGORY -> `String "COST_CATEGORY"
  | TAG -> `String "TAG"
  | DIMENSION -> `String "DIMENSION"

let group_definition_to_yojson (x : group_definition) =
  assoc_to_yojson
    [
      ("type", option_to_yojson group_definition_type_to_yojson x.type_);
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
    ]

let group_definitions_to_yojson tree = list_to_yojson group_definition_to_yojson tree

let dimension_to_yojson (x : dimension) =
  match x with
  | PLATFORM -> `String "PLATFORM"
  | SCOPE -> `String "SCOPE"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | COST_CATEGORY_NAME -> `String "COST_CATEGORY_NAME"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | TENANCY -> `String "TENANCY"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | TAG_KEY -> `String "TAG_KEY"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | SERVICE -> `String "SERVICE"
  | REGION -> `String "REGION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | OPERATION -> `String "OPERATION"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | AZ -> `String "AZ"

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let match_option_to_yojson (x : match_option) =
  match x with
  | CASE_INSENSITIVE -> `String "CASE_INSENSITIVE"
  | CASE_SENSITIVE -> `String "CASE_SENSITIVE"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ABSENT -> `String "ABSENT"
  | EQUALS -> `String "EQUALS"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("values", Some (string_list_to_yojson x.values));
      ("key", Some (dimension_to_yojson x.key));
    ]

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
    ]

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("matchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
    ]

let rec expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("costCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
      ("tags", option_to_yojson tag_values_to_yojson x.tags);
      ("dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("not", option_to_yojson expression_to_yojson x.not);
      ("and", option_to_yojson expressions_to_yojson x.and_);
      ("or", option_to_yojson expressions_to_yojson x.\#or);
    ]

and expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

let cost_and_usage_query_to_yojson (x : cost_and_usage_query) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("granularity", Some (granularity_to_yojson x.granularity));
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
      ("metrics", Some (metric_names_to_yojson x.metrics));
    ]

let savings_plans_coverage_query_to_yojson (x : savings_plans_coverage_query) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
    ]

let savings_plans_utilization_query_to_yojson (x : savings_plans_utilization_query) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
    ]

let reservation_coverage_query_to_yojson (x : reservation_coverage_query) =
  assoc_to_yojson
    [
      ("metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
    ]

let reservation_utilization_query_to_yojson (x : reservation_utilization_query) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("groupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("timeRange", Some (date_time_range_to_yojson x.time_range));
    ]

let query_parameters_to_yojson (x : query_parameters) =
  match x with
  | ReservationUtilization arg ->
      assoc_to_yojson
        [ ("reservationUtilization", Some (reservation_utilization_query_to_yojson arg)) ]
  | ReservationCoverage arg ->
      assoc_to_yojson [ ("reservationCoverage", Some (reservation_coverage_query_to_yojson arg)) ]
  | SavingsPlansUtilization arg ->
      assoc_to_yojson
        [ ("savingsPlansUtilization", Some (savings_plans_utilization_query_to_yojson arg)) ]
  | SavingsPlansCoverage arg ->
      assoc_to_yojson
        [ ("savingsPlansCoverage", Some (savings_plans_coverage_query_to_yojson arg)) ]
  | CostAndUsage arg ->
      assoc_to_yojson [ ("costAndUsage", Some (cost_and_usage_query_to_yojson arg)) ]

let visual_type_to_yojson (x : visual_type) =
  match x with STACK -> `String "STACK" | BAR -> `String "BAR" | LINE -> `String "LINE"

let graph_display_config_to_yojson (x : graph_display_config) =
  assoc_to_yojson [ ("visualType", Some (visual_type_to_yojson x.visual_type)) ]

let graph_display_config_map_to_yojson tree =
  map_to_yojson generic_string_to_yojson graph_display_config_to_yojson tree

let table_display_config_struct_to_yojson = unit_to_yojson

let display_config_to_yojson (x : display_config) =
  match x with
  | Table arg -> assoc_to_yojson [ ("table", Some (table_display_config_struct_to_yojson arg)) ]
  | Graph arg -> assoc_to_yojson [ ("graph", Some (graph_display_config_map_to_yojson arg)) ]

let widget_config_to_yojson (x : widget_config) =
  assoc_to_yojson
    [
      ("displayConfig", Some (display_config_to_yojson x.display_config));
      ("queryParameters", Some (query_parameters_to_yojson x.query_parameters));
    ]

let widget_config_list_to_yojson tree = list_to_yojson widget_config_to_yojson tree

let widget_to_yojson (x : widget) =
  assoc_to_yojson
    [
      ("configs", Some (widget_config_list_to_yojson x.configs));
      ( "horizontalOffset",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.horizontal_offset
      );
      ("height", option_to_yojson widget_height_to_yojson x.height);
      ("width", option_to_yojson widget_width_to_yojson x.width);
      ("description", option_to_yojson description_to_yojson x.description);
      ("title", Some (widget_title_to_yojson x.title));
      ("id", option_to_yojson widget_id_to_yojson x.id);
    ]

let widget_list_to_yojson tree = list_to_yojson widget_to_yojson tree

let widget_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let scheduled_report_arn_to_yojson = string_to_yojson

let update_scheduled_report_response_to_yojson (x : update_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let scheduled_report_name_to_yojson = string_to_yojson
let dashboard_arn_to_yojson = string_to_yojson
let service_role_arn_to_yojson = string_to_yojson
let generic_time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let schedule_period_to_yojson (x : schedule_period) =
  assoc_to_yojson
    [
      ("endTime", option_to_yojson generic_time_stamp_to_yojson x.end_time);
      ("startTime", option_to_yojson generic_time_stamp_to_yojson x.start_time);
    ]

let schedule_state_to_yojson (x : schedule_state) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let schedule_config_to_yojson (x : schedule_config) =
  assoc_to_yojson
    [
      ("state", option_to_yojson schedule_state_to_yojson x.state);
      ("schedulePeriod", option_to_yojson schedule_period_to_yojson x.schedule_period);
      ( "scheduleExpressionTimeZone",
        option_to_yojson generic_string_to_yojson x.schedule_expression_time_zone );
      ("scheduleExpression", option_to_yojson generic_string_to_yojson x.schedule_expression);
    ]

let update_scheduled_report_request_to_yojson (x : update_scheduled_report_request) =
  assoc_to_yojson
    [
      ( "clearWidgetDateRangeOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.clear_widget_date_range_override );
      ( "clearWidgetIds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.clear_widget_ids
      );
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ("scheduleConfig", option_to_yojson schedule_config_to_yojson x.schedule_config);
      ( "scheduledReportExecutionRoleArn",
        option_to_yojson service_role_arn_to_yojson x.scheduled_report_execution_role_arn );
      ("dashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson scheduled_report_name_to_yojson x.name);
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
    ]

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

let update_dashboard_response_to_yojson (x : update_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let dashboard_name_to_yojson = string_to_yojson

let update_dashboard_request_to_yojson (x : update_dashboard_request) =
  assoc_to_yojson
    [
      ("widgets", option_to_yojson widget_list_to_yojson x.widgets);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (dashboard_name_to_yojson x.name));
      ("arn", Some (dashboard_arn_to_yojson x.arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("value", Some (resource_tag_value_to_yojson x.value));
      ("key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let status_reason_to_yojson (x : status_reason) =
  match x with
  | WIDGET_ID_NOT_FOUND -> `String "WIDGET_ID_NOT_FOUND"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | DASHBOARD_ACCESS_DENIED -> `String "DASHBOARD_ACCESS_DENIED"
  | DASHBOARD_NOT_FOUND -> `String "DASHBOARD_NOT_FOUND"
  | EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS -> `String "EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS"
  | EXECUTION_ROLE_ASSUME_FAILED -> `String "EXECUTION_ROLE_ASSUME_FAILED"
  | DATA_SOURCE_ACCESS_DENIED -> `String "DATA_SOURCE_ACCESS_DENIED"

let status_reason_list_to_yojson tree = list_to_yojson status_reason_to_yojson tree

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let health_status_code_to_yojson (x : health_status_code) =
  match x with UNHEALTHY -> `String "UNHEALTHY" | HEALTHY -> `String "HEALTHY"

let health_status_to_yojson (x : health_status) =
  assoc_to_yojson
    [
      ("statusReasons", option_to_yojson status_reason_list_to_yojson x.status_reasons);
      ("lastRefreshedAt", option_to_yojson generic_time_stamp_to_yojson x.last_refreshed_at);
      ("statusCode", Some (health_status_code_to_yojson x.status_code));
    ]

let scheduled_report_summary_to_yojson (x : scheduled_report_summary) =
  assoc_to_yojson
    [
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ( "scheduleExpressionTimeZone",
        option_to_yojson generic_string_to_yojson x.schedule_expression_time_zone );
      ("healthStatus", Some (health_status_to_yojson x.health_status));
      ("state", Some (schedule_state_to_yojson x.state));
      ("scheduleExpression", Some (generic_string_to_yojson x.schedule_expression));
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ("name", Some (scheduled_report_name_to_yojson x.name));
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
    ]

let scheduled_report_summary_list_to_yojson tree =
  list_to_yojson scheduled_report_summary_to_yojson tree

let scheduled_report_input_to_yojson (x : scheduled_report_input) =
  assoc_to_yojson
    [
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ("description", option_to_yojson description_to_yojson x.description);
      ("scheduleConfig", Some (schedule_config_to_yojson x.schedule_config));
      ( "scheduledReportExecutionRoleArn",
        Some (service_role_arn_to_yojson x.scheduled_report_execution_role_arn) );
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ("name", Some (scheduled_report_name_to_yojson x.name));
    ]

let scheduled_report_to_yojson (x : scheduled_report) =
  assoc_to_yojson
    [
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("lastExecutionAt", option_to_yojson generic_time_stamp_to_yojson x.last_execution_at);
      ("updatedAt", option_to_yojson generic_time_stamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson generic_time_stamp_to_yojson x.created_at);
      ( "widgetDateRangeOverride",
        option_to_yojson date_time_range_to_yojson x.widget_date_range_override );
      ("widgetIds", option_to_yojson widget_id_list_to_yojson x.widget_ids);
      ("description", option_to_yojson description_to_yojson x.description);
      ("scheduleConfig", Some (schedule_config_to_yojson x.schedule_config));
      ( "scheduledReportExecutionRoleArn",
        Some (service_role_arn_to_yojson x.scheduled_report_execution_role_arn) );
      ("dashboardArn", Some (dashboard_arn_to_yojson x.dashboard_arn));
      ("name", Some (scheduled_report_name_to_yojson x.name));
      ("arn", option_to_yojson scheduled_report_arn_to_yojson x.arn);
    ]

let next_page_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let list_scheduled_reports_response_to_yojson (x : list_scheduled_reports_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("scheduledReports", Some (scheduled_report_summary_list_to_yojson x.scheduled_reports));
    ]

let list_scheduled_reports_request_to_yojson (x : list_scheduled_reports_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let dashboard_type_to_yojson (x : dashboard_type) = match x with CUSTOM -> `String "CUSTOM"

let dashboard_reference_to_yojson (x : dashboard_reference) =
  assoc_to_yojson
    [
      ("updatedAt", Some (generic_time_stamp_to_yojson x.updated_at));
      ("createdAt", Some (generic_time_stamp_to_yojson x.created_at));
      ("type", Some (dashboard_type_to_yojson x.type_));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (dashboard_name_to_yojson x.name));
      ("arn", Some (dashboard_arn_to_yojson x.arn));
    ]

let dashboard_reference_list_to_yojson tree = list_to_yojson dashboard_reference_to_yojson tree

let list_dashboards_response_to_yojson (x : list_dashboards_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("dashboards", Some (dashboard_reference_list_to_yojson x.dashboards));
    ]

let list_dashboards_request_to_yojson (x : list_dashboards_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let get_scheduled_report_response_to_yojson (x : get_scheduled_report_response) =
  assoc_to_yojson [ ("scheduledReport", Some (scheduled_report_to_yojson x.scheduled_report)) ]

let get_scheduled_report_request_to_yojson (x : get_scheduled_report_request) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("policyDocument", Some (generic_string_to_yojson x.policy_document));
      ("resourceArn", Some (dashboard_arn_to_yojson x.resource_arn));
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("resourceArn", Some (dashboard_arn_to_yojson x.resource_arn)) ]

let get_dashboard_response_to_yojson (x : get_dashboard_response) =
  assoc_to_yojson
    [
      ("updatedAt", Some (generic_time_stamp_to_yojson x.updated_at));
      ("createdAt", Some (generic_time_stamp_to_yojson x.created_at));
      ("widgets", Some (widget_list_to_yojson x.widgets));
      ("type", Some (dashboard_type_to_yojson x.type_));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (dashboard_name_to_yojson x.name));
      ("arn", Some (dashboard_arn_to_yojson x.arn));
    ]

let get_dashboard_request_to_yojson (x : get_dashboard_request) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let execute_scheduled_report_response_to_yojson (x : execute_scheduled_report_response) =
  assoc_to_yojson
    [
      ( "executionTriggered",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.execution_triggered );
      ("healthStatus", option_to_yojson health_status_to_yojson x.health_status);
    ]

let client_token_to_yojson = string_to_yojson

let execute_scheduled_report_request_to_yojson (x : execute_scheduled_report_request) =
  assoc_to_yojson
    [
      ("dryRun", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.dry_run);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("arn", Some (scheduled_report_arn_to_yojson x.arn));
    ]

let delete_scheduled_report_response_to_yojson (x : delete_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let delete_scheduled_report_request_to_yojson (x : delete_scheduled_report_request) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let delete_dashboard_response_to_yojson (x : delete_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let delete_dashboard_request_to_yojson (x : delete_dashboard_request) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let create_scheduled_report_response_to_yojson (x : create_scheduled_report_response) =
  assoc_to_yojson [ ("arn", Some (scheduled_report_arn_to_yojson x.arn)) ]

let create_scheduled_report_request_to_yojson (x : create_scheduled_report_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("scheduledReport", Some (scheduled_report_input_to_yojson x.scheduled_report));
    ]

let create_dashboard_response_to_yojson (x : create_dashboard_response) =
  assoc_to_yojson [ ("arn", Some (dashboard_arn_to_yojson x.arn)) ]

let create_dashboard_request_to_yojson (x : create_dashboard_request) =
  assoc_to_yojson
    [
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("widgets", Some (widget_list_to_yojson x.widgets));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (dashboard_name_to_yojson x.name));
    ]
