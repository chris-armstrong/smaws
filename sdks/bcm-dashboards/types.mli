type nonrec widget_width = int [@@ocaml.doc ""]

type nonrec widget_title = string [@@ocaml.doc ""]

type nonrec widget_id = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec widget_height = int [@@ocaml.doc ""]

type nonrec metric_name =
  | Cost [@ocaml.doc ""]
  | Unit [@ocaml.doc ""]
  | Hour [@ocaml.doc ""]
  | SpendCoveredBySavingsPlans [@ocaml.doc ""]
  | UsageQuantity [@ocaml.doc ""]
  | UnblendedCost [@ocaml.doc ""]
  | NormalizedUsageAmount [@ocaml.doc ""]
  | NetUnblendedCost [@ocaml.doc ""]
  | NetAmortizedCost [@ocaml.doc ""]
  | BlendedCost [@ocaml.doc ""]
  | AmortizedCost [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_names = metric_name list [@@ocaml.doc ""]

type nonrec date_time_type = RELATIVE [@ocaml.doc ""] | ABSOLUTE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec date_time_value = {
  value : generic_string; [@ocaml.doc "The actual date/time value.\n"]
  type_ : date_time_type;
      [@ocaml.doc
        "The type of date/time value: [ABSOLUTE] for specific dates or [RELATIVE] for dynamic time \
         periods.\n"]
}
[@@ocaml.doc
  "Represents a point in time that can be specified as either an absolute date (for example, \
   \"2025-07-01\") or a relative time period using ISO 8601 duration format (for example, \"-P3M\" \
   for three months ago).\n"]

type nonrec date_time_range = {
  end_time : date_time_value; [@ocaml.doc "The end time of the date range for querying data.\n"]
  start_time : date_time_value; [@ocaml.doc "The start time of the date range for querying data.\n"]
}
[@@ocaml.doc "Defines a time period with explicit start and end times for data queries.\n"]

type nonrec granularity = MONTHLY [@ocaml.doc ""] | DAILY [@ocaml.doc ""] | HOURLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec group_definition_type =
  | COST_CATEGORY [@ocaml.doc ""]
  | TAG [@ocaml.doc ""]
  | DIMENSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec group_definition = {
  type_ : group_definition_type option; [@ocaml.doc "The type of grouping to apply.\n"]
  key : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The key to use for grouping cost and usage data.\n"]
}
[@@ocaml.doc "Specifies how to group cost and usage data.\n"]

type nonrec group_definitions = group_definition list [@@ocaml.doc ""]

type nonrec dimension =
  | PLATFORM [@ocaml.doc ""]
  | SCOPE [@ocaml.doc ""]
  | DEPLOYMENT_OPTION [@ocaml.doc ""]
  | CACHE_ENGINE [@ocaml.doc ""]
  | INSTANCE_TYPE_FAMILY [@ocaml.doc ""]
  | SAVINGS_PLANS_TYPE [@ocaml.doc ""]
  | LEGAL_ENTITY_NAME [@ocaml.doc ""]
  | DATABASE_ENGINE [@ocaml.doc ""]
  | COST_CATEGORY_NAME [@ocaml.doc ""]
  | RESERVATION_ID [@ocaml.doc ""]
  | BILLING_ENTITY [@ocaml.doc ""]
  | TENANCY [@ocaml.doc ""]
  | OPERATING_SYSTEM [@ocaml.doc ""]
  | TAG_KEY [@ocaml.doc ""]
  | SUBSCRIPTION_ID [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | RECORD_TYPE [@ocaml.doc ""]
  | USAGE_TYPE_GROUP [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | PURCHASE_TYPE [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | LINKED_ACCOUNT [@ocaml.doc ""]
  | INSTANCE_TYPE [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec match_option =
  | CASE_INSENSITIVE [@ocaml.doc ""]
  | CASE_SENSITIVE [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | ABSENT [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_options = match_option list [@@ocaml.doc ""]

type nonrec dimension_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options for dimension values, such as [EQUALS], [CONTAINS], [STARTS_WITH], or \
         [ENDS_WITH].\n"]
  values : string_list; [@ocaml.doc "The values to match for the specified dimension key.\n"]
  key : dimension;
      [@ocaml.doc
        "The key of the dimension to filter on (for example, [SERVICE], [USAGE_TYPE], or \
         [OPERATION]).\n"]
}
[@@ocaml.doc
  "Specifies the values and match options for dimension-based filtering in cost and usage queries.\n"]

type nonrec tag_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options for tag values, such as [EQUALS], [CONTAINS], [STARTS_WITH], or \
         [ENDS_WITH].\n"]
  values : string_list option; [@ocaml.doc "The values to match for the specified tag key.\n"]
  key : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The key of the tag to filter on.\n"]
}
[@@ocaml.doc "Specifies tag-based filtering options for cost and usage queries.\n"]

type nonrec cost_category_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options for cost category values, such as [EQUALS], [CONTAINS], [STARTS_WITH], \
         or [ENDS_WITH].\n"]
  values : string_list option;
      [@ocaml.doc "The values to match for the specified cost category key.\n"]
  key : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The key of the cost category to filter on.\n"]
}
[@@ocaml.doc
  "Specifies the values and match options for cost category-based filtering in cost and usage \
   queries.\n"]

type expression = {
  cost_categories : cost_category_values option;
      [@ocaml.doc "The cost category values to include in the filter expression.\n"]
  tags : tag_values option; [@ocaml.doc "The tag values to include in the filter expression.\n"]
  dimensions : dimension_values option;
      [@ocaml.doc "The dimension values to include in the filter expression.\n"]
  not : expression option; [@ocaml.doc "An expression to negate with NOT logic.\n"]
  and_ : expressions option; [@ocaml.doc "A list of expressions to combine with AND logic.\n"]
  \#or : expressions option; [@ocaml.doc "A list of expressions to combine with OR logic.\n"]
}
[@@ocaml.doc
  "Defines complex filtering conditions using logical operators ([AND], [OR], [NOT]) and various \
   filter types.\n"]

and expressions = expression list [@@ocaml.doc ""]

type nonrec cost_and_usage_query = {
  filter : expression option;
      [@ocaml.doc "The filter expression to be applied to the cost and usage data.\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "Specifies how to group the retrieved data, such as by [SERVICE], [ACCOUNT], or [TAG].\n"]
  granularity : granularity;
      [@ocaml.doc "The granularity of the retrieved data: [HOURLY], [DAILY], or [MONTHLY].\n"]
  time_range : date_time_range;
      [@ocaml.doc
        "The time period for which to retrieve data. Can be specified as absolute dates or \
         relative time periods.\n"]
  metrics : metric_names;
      [@ocaml.doc
        "The specific cost and usage metrics to retrieve.\n\n\
        \  Valid values for CostAndUsageQuery metrics are [AmortizedCost], [BlendedCost], \
         [NetAmortizedCost], [NetUnblendedCost], [NormalizedUsageAmount], [UnblendedCost], and \
         [UsageQuantity].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Defines the parameters for retrieving Amazon Web Services cost and usage data. Includes \
   specifications for metrics, time periods, granularity, grouping dimensions, and filtering \
   conditions.\n"]

type nonrec savings_plans_coverage_query = {
  filter : expression option; [@ocaml.doc ""]
  group_by : group_definitions option;
      [@ocaml.doc
        "Specifies how to group the Savings Plans coverage data, such as by service or instance \
         family.\n"]
  granularity : granularity option;
      [@ocaml.doc "The time granularity of the retrieved data: [HOURLY], [DAILY], or [MONTHLY].\n"]
  metrics : metric_names option;
      [@ocaml.doc
        "The coverage metrics to include in the results.\n\n\
        \  Valid value for SavingsPlansCoverageQuery metrics is [SpendCoveredBySavingsPlans].\n\
        \  \n\
        \   "]
  time_range : date_time_range; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Defines the parameters for querying Savings Plans coverage data, including metrics, grouping \
   options, and time granularity.\n"]

type nonrec savings_plans_utilization_query = {
  filter : expression option; [@ocaml.doc ""]
  granularity : granularity option;
      [@ocaml.doc "The time granularity of the retrieved data: [HOURLY], [DAILY], or [MONTHLY].\n"]
  time_range : date_time_range; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Defines the parameters for querying Savings Plans utilization data, including time granularity \
   and sorting preferences.\n"]

type nonrec reservation_coverage_query = {
  metrics : metric_names option;
      [@ocaml.doc
        "The coverage metrics to include in the results.\n\n\
        \  Valid values for ReservationCoverageQuery metrics are [Hour], [Unit], and [Cost].\n\
        \  \n\
        \   "]
  filter : expression option; [@ocaml.doc ""]
  granularity : granularity option;
      [@ocaml.doc "The time granularity of the retrieved data: [HOURLY], [DAILY], or [MONTHLY].\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "Specifies how to group the Reserved Instance coverage data, such as by service, Region, \
         or instance type.\n"]
  time_range : date_time_range; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Defines the parameters for querying Reserved Instance coverage data, including grouping \
   options, metrics, and sorting preferences.\n"]

type nonrec reservation_utilization_query = {
  filter : expression option; [@ocaml.doc ""]
  granularity : granularity option;
      [@ocaml.doc "The time granularity of the retrieved data: [HOURLY], [DAILY], or [MONTHLY].\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "Specifies how to group the Reserved Instance utilization data, such as by service, \
         Region, or instance type.\n"]
  time_range : date_time_range; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Defines the parameters for querying Reserved Instance utilization data, including grouping \
   options and time granularity.\n"]

type nonrec query_parameters =
  | ReservationUtilization of reservation_utilization_query
      [@ocaml.doc
        "The parameters for querying Reserved Instance utilization data, showing how effectively \
         your Reserved Instances are being used.\n"]
  | ReservationCoverage of reservation_coverage_query
      [@ocaml.doc
        "The parameters for querying Reserved Instance coverage data, showing how much of your \
         eligible instance usage is covered by Reserved Instances.\n"]
  | SavingsPlansUtilization of savings_plans_utilization_query
      [@ocaml.doc
        "The parameters for querying Savings Plans utilization data, showing how effectively your \
         Savings Plans are being used.\n"]
  | SavingsPlansCoverage of savings_plans_coverage_query
      [@ocaml.doc
        "The parameters for querying Savings Plans coverage data, showing how much of your \
         eligible compute usage is covered by Savings Plans.\n"]
  | CostAndUsage of cost_and_usage_query
      [@ocaml.doc
        "The parameters for querying cost and usage data, including metrics, time range, \
         granularity, grouping dimensions, and filters.\n"]
[@@ocaml.doc "Defines the data retrieval parameters for a widget.\n"]

type nonrec visual_type = STACK [@ocaml.doc ""] | BAR [@ocaml.doc ""] | LINE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec graph_display_config = {
  visual_type : visual_type; [@ocaml.doc "The type of visualization to use for the data.\n"]
}
[@@ocaml.doc
  "Defines the visual representation settings for widget data, including the visualization type, \
   styling options, and display preferences for different metric types.\n"]

type nonrec graph_display_config_map = (generic_string * graph_display_config) list [@@ocaml.doc ""]

type nonrec table_display_config_struct = unit [@@ocaml.doc ""]

type nonrec display_config =
  | Table of table_display_config_struct
      [@ocaml.doc "The configuration for tabular display of the widget data.\n"]
  | Graph of graph_display_config_map
      [@ocaml.doc
        "The configuration for graphical display of the widget data, including chart type and \
         visual options.\n"]
[@@ocaml.doc
  "Defines how the widget's data should be visualized, including chart type, color schemes, axis \
   configurations, and other display preferences.\n"]

type nonrec widget_config = {
  display_config : display_config;
      [@ocaml.doc
        "The configuration that determines how the retrieved data should be visualized in the \
         widget.\n"]
  query_parameters : query_parameters;
      [@ocaml.doc
        "The parameters that define what data the widget should retrieve and how it should be \
         filtered or grouped.\n"]
}
[@@ocaml.doc
  "Defines the complete configuration for a widget, including data retrieval settings and \
   visualization preferences.\n"]

type nonrec widget_config_list = widget_config list [@@ocaml.doc ""]

type nonrec widget = {
  configs : widget_config_list;
      [@ocaml.doc
        "An array of configurations that define the data queries and display settings for the \
         widget.\n"]
  horizontal_offset : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "Specifies the starting column position of the widget in the dashboard's grid layout. Used \
         to control widget placement.\n"]
  height : widget_height option;
      [@ocaml.doc
        "The height of the widget in row spans. The dashboard layout consists of a grid system.\n"]
  width : widget_width option;
      [@ocaml.doc
        "The width of the widget in column spans. The dashboard layout consists of a grid system.\n"]
  description : description option;
      [@ocaml.doc "A description of the widget's purpose or the data it displays.\n"]
  title : widget_title; [@ocaml.doc "The title of the widget.\n"]
  id : widget_id option; [@ocaml.doc "The unique identifier for the widget.\n"]
}
[@@ocaml.doc
  "A configurable visualization component within a dashboard that displays specific cost and usage \
   metrics. Each widget can show data as charts or tables and includes settings for data querying, \
   filtering, and visual presentation.\n"]

type nonrec widget_list = widget list [@@ocaml.doc ""]

type nonrec widget_id_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec validation_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The input parameters do not satisfy the requirements. Check the error message for specific \
   validation details.\n"]

type nonrec scheduled_report_arn = string [@@ocaml.doc ""]

type nonrec update_scheduled_report_response = {
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the updated scheduled report.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_report_name = string [@@ocaml.doc ""]

type nonrec dashboard_arn = string [@@ocaml.doc ""]

type nonrec service_role_arn = string [@@ocaml.doc ""]

type nonrec generic_time_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec schedule_period = {
  end_time : generic_time_stamp option;
      [@ocaml.doc
        "The end time of the schedule period. If not specified, defaults to 3 years from the time \
         of the create or update request. The maximum allowed value is 3 years from the current \
         time. Setting an end time beyond this limit returns a [ValidationException].\n"]
  start_time : generic_time_stamp option;
      [@ocaml.doc
        "The start time of the schedule period. If not specified, defaults to the time of the \
         create or update request. The start time cannot be more than 5 minutes before the time of \
         the request.\n"]
}
[@@ocaml.doc "Defines the active time period for execution of the scheduled report.\n"]

type nonrec schedule_state = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec schedule_config = {
  state : schedule_state option;
      [@ocaml.doc
        "The state of the schedule. [ENABLED] means the scheduled report runs according to its \
         schedule expression. [DISABLED] means the scheduled report is paused and will not run \
         until re-enabled.\n"]
  schedule_period : schedule_period option;
      [@ocaml.doc "The time period during which the schedule is active.\n"]
  schedule_expression_time_zone : generic_string option;
      [@ocaml.doc "The time zone for the schedule expression, for example, [UTC].\n"]
  schedule_expression : generic_string option;
      [@ocaml.doc
        "The schedule expression that specifies when to trigger the scheduled report run. This \
         value must be a cron expression consisting of six fields separated by white spaces: \
         [cron(minutes hours day_of_month month day_of_week year)].\n"]
}
[@@ocaml.doc
  "Defines the schedule for a scheduled report, including the cron expression, time zone, active \
   period, and the schedule state.\n"]

type nonrec update_scheduled_report_request = {
  clear_widget_date_range_override : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Set to true to clear existing widgetDateRangeOverride. "]
  clear_widget_ids : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Set to true to clear existing widgetIds."]
  widget_date_range_override : date_time_range option;
      [@ocaml.doc "The date range override to apply to widgets in the scheduled report.\n"]
  widget_ids : widget_id_list option;
      [@ocaml.doc
        "The list of widget identifiers to include in the scheduled report. If not specified, all \
         widgets in the dashboard are included.\n"]
  schedule_config : schedule_config option;
      [@ocaml.doc "The updated schedule configuration for the report.\n"]
  scheduled_report_execution_role_arn : service_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role that the scheduled report uses to execute. Amazon Web Services \
         Billing and Cost Management Dashboards will assume this IAM role while executing the \
         scheduled report.\n"]
  dashboard_arn : dashboard_arn option;
      [@ocaml.doc "The ARN of the dashboard to associate with the scheduled report.\n"]
  description : description option; [@ocaml.doc "The new description for the scheduled report.\n"]
  name : scheduled_report_name option; [@ocaml.doc "The new name for the scheduled report.\n"]
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report to update.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was denied due to request throttling. Reduce the frequency of requests and use \
   exponential backoff.\n"]

type nonrec resource_not_found_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified resource (dashboard, policy, or widget) was not found. Verify the ARN and try \
   again.\n"]

type nonrec internal_server_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal error occurred while processing the request. Retry your request. If the problem \
   persists, contact Amazon Web Services Support.\n"]

type nonrec conflict_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The request could not be completed due to a conflict with the current state of the resource. \
   For example, attempting to create a resource that already exists or is being created.\n"]

type nonrec access_denied_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "You do not have sufficient permissions to perform this action. Verify your IAM permissions and \
   any resource policies.\n"]

type nonrec update_dashboard_response = {
  arn : dashboard_arn; [@ocaml.doc "The ARN of the updated dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec dashboard_name = string [@@ocaml.doc ""]

type nonrec update_dashboard_request = {
  widgets : widget_list option;
      [@ocaml.doc
        "The updated array of widget configurations for the dashboard. Replaces all existing \
         widgets.\n"]
  description : description option; [@ocaml.doc "The new description for the dashboard.\n"]
  name : dashboard_name; [@ocaml.doc "The new name for the dashboard.\n"]
  arn : dashboard_arn; [@ocaml.doc "The ARN of the dashboard to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : resource_tag_key_list;
      [@ocaml.doc "The keys of the tags to remove from the dashboard resource.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  value : resource_tag_value;
      [@ocaml.doc "The value of the tag to be attached to the dashboard resource.\n"]
  key : resource_tag_key;
      [@ocaml.doc "The key of the tag to be attached to the dashboard resource.\n"]
}
[@@ocaml.doc
  "A key-value pair that can be attached to a dashboard for organization and management purposes.\n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_tags : resource_tag_list; [@ocaml.doc "The tags to add to the dashboard resource.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec status_reason =
  | WIDGET_ID_NOT_FOUND [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
  | DASHBOARD_ACCESS_DENIED [@ocaml.doc ""]
  | DASHBOARD_NOT_FOUND [@ocaml.doc ""]
  | EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS [@ocaml.doc ""]
  | EXECUTION_ROLE_ASSUME_FAILED [@ocaml.doc ""]
  | DATA_SOURCE_ACCESS_DENIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec status_reason_list = status_reason list [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The request would exceed a service quota. Review the service quotas for Amazon Web Services \
   Billing and Cost Management Dashboards and retry your request.\n"]

type nonrec health_status_code = UNHEALTHY [@ocaml.doc ""] | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec health_status = {
  status_reasons : status_reason_list option;
      [@ocaml.doc
        "The list of reasons for the current health status. Only present when the status is \
         [UNHEALTHY].\n"]
  last_refreshed_at : generic_time_stamp option;
      [@ocaml.doc "The timestamp when the health status was last refreshed.\n"]
  status_code : health_status_code;
      [@ocaml.doc
        "The health status code. [HEALTHY] indicates the scheduled report is configured properly \
         and has all required permissions to execute. [UNHEALTHY] indicates the scheduled report \
         is unable to deliver the notification to the default Amazon EventBridge EventBus in your \
         account and your action is needed. The reason for the unhealthy state is captured in the \
         health status reasons.\n"]
}
[@@ocaml.doc
  "Contains the health status information for a scheduled report, including the status code and \
   any reasons for an unhealthy state.\n"]

type nonrec scheduled_report_summary = {
  widget_ids : widget_id_list option;
      [@ocaml.doc "The list of widget identifiers included in the scheduled report.\n"]
  schedule_expression_time_zone : generic_string option;
      [@ocaml.doc "The time zone for the schedule expression, for example, [UTC].\n"]
  health_status : health_status;
      [@ocaml.doc "The health status of the scheduled report as of its last refresh time.\n"]
  state : schedule_state; [@ocaml.doc "The state of the schedule: [ENABLED] or [DISABLED].\n"]
  schedule_expression : generic_string;
      [@ocaml.doc "The schedule expression that defines when the report runs.\n"]
  dashboard_arn : dashboard_arn;
      [@ocaml.doc "The ARN of the dashboard associated with the scheduled report.\n"]
  name : scheduled_report_name; [@ocaml.doc "The name of the scheduled report.\n"]
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report.\n"]
}
[@@ocaml.doc "Contains summary information for a scheduled report.\n"]

type nonrec scheduled_report_summary_list = scheduled_report_summary list [@@ocaml.doc ""]

type nonrec scheduled_report_input = {
  widget_date_range_override : date_time_range option;
      [@ocaml.doc "The date range override to apply to widgets in the scheduled report.\n"]
  widget_ids : widget_id_list option;
      [@ocaml.doc
        "The list of widget identifiers to include in the scheduled report. If not specified, all \
         widgets in the dashboard are included.\n"]
  description : description option;
      [@ocaml.doc "A description of the scheduled report's purpose or contents.\n"]
  schedule_config : schedule_config;
      [@ocaml.doc
        "The schedule configuration that defines when and how often the report is generated. If \
         the schedule state is not specified, it defaults to [ENABLED].\n"]
  scheduled_report_execution_role_arn : service_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role that the scheduled report uses to execute. Amazon Web Services \
         Billing and Cost Management Dashboards will assume this IAM role while executing the \
         scheduled report.\n"]
  dashboard_arn : dashboard_arn;
      [@ocaml.doc "The ARN of the dashboard to generate the scheduled report from.\n"]
  name : scheduled_report_name; [@ocaml.doc "The name of the scheduled report.\n"]
}
[@@ocaml.doc
  "Defines the configuration for creating a new scheduled report, including the dashboard, \
   schedule, execution role, and optional widget settings.\n"]

type nonrec scheduled_report = {
  health_status : health_status option;
      [@ocaml.doc "The health status of the scheduled report at last refresh time.\n"]
  last_execution_at : generic_time_stamp option;
      [@ocaml.doc "The timestamp of the most recent execution of the scheduled report.\n"]
  updated_at : generic_time_stamp option;
      [@ocaml.doc "The timestamp when the scheduled report was last modified.\n"]
  created_at : generic_time_stamp option;
      [@ocaml.doc "The timestamp when the scheduled report was created.\n"]
  widget_date_range_override : date_time_range option;
      [@ocaml.doc "The date range override applied to widgets in the scheduled report.\n"]
  widget_ids : widget_id_list option;
      [@ocaml.doc "The list of widget identifiers included in the scheduled report.\n"]
  description : description option;
      [@ocaml.doc "A description of the scheduled report's purpose or contents.\n"]
  schedule_config : schedule_config;
      [@ocaml.doc
        "The schedule configuration that defines when and how often the report is generated.\n"]
  scheduled_report_execution_role_arn : service_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role that the scheduled report uses to execute. Amazon Web Services \
         Billing and Cost Management Dashboards will assume this IAM role while executing the \
         scheduled report.\n"]
  dashboard_arn : dashboard_arn;
      [@ocaml.doc "The ARN of the dashboard associated with the scheduled report.\n"]
  name : scheduled_report_name; [@ocaml.doc "The name of the scheduled report.\n"]
  arn : scheduled_report_arn option; [@ocaml.doc "The ARN of the scheduled report.\n"]
}
[@@ocaml.doc "Contains the full configuration and metadata of a scheduled report.\n"]

type nonrec next_page_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc "The list of tags associated with the specified dashboard resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_scheduled_reports_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. Not returned if there are no more \
         results to retrieve.\n"]
  scheduled_reports : scheduled_report_summary_list;
      [@ocaml.doc
        "An array of scheduled report summaries, containing basic information about each scheduled \
         report.\n"]
}
[@@ocaml.doc ""]

type nonrec list_scheduled_reports_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. Valid range is 1 to 100. The \
         default value is 50.\n"]
  next_token : next_page_token option;
      [@ocaml.doc
        "The token for the next page of results. Use the value returned in the previous response.\n"]
}
[@@ocaml.doc ""]

type nonrec dashboard_type = CUSTOM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dashboard_reference = {
  updated_at : generic_time_stamp;
      [@ocaml.doc "The timestamp when the dashboard was last modified.\n"]
  created_at : generic_time_stamp; [@ocaml.doc "The timestamp when the dashboard was created.\n"]
  type_ : dashboard_type; [@ocaml.doc "The dashboard type.\n"]
  description : description option; [@ocaml.doc "The description of the referenced dashboard.\n"]
  name : dashboard_name; [@ocaml.doc "The name of the referenced dashboard.\n"]
  arn : dashboard_arn; [@ocaml.doc "The ARN of the referenced dashboard.\n"]
}
[@@ocaml.doc
  "Contains basic information about a dashboard, including its ARN, name, type, and timestamps.\n"]

type nonrec dashboard_reference_list = dashboard_reference list [@@ocaml.doc ""]

type nonrec list_dashboards_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. Not returned if there are no more \
         results to retrieve.\n"]
  dashboards : dashboard_reference_list;
      [@ocaml.doc
        "An array of dashboard references, containing basic information about each dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dashboards_request = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token for the next page of results. Use the value returned in the previous response.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in a single call. The default value is 20.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_report_response = {
  scheduled_report : scheduled_report;
      [@ocaml.doc "The scheduled report configuration and metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec get_scheduled_report_request = {
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_response = {
  policy_document : generic_string;
      [@ocaml.doc
        "The JSON policy document that represents the dashboard's resource-based policy.\n"]
  resource_arn : dashboard_arn;
      [@ocaml.doc "The ARN of the dashboard for which the resource-based policy was retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : dashboard_arn;
      [@ocaml.doc "The ARN of the dashboard whose resource-based policy you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_response = {
  updated_at : generic_time_stamp;
      [@ocaml.doc "The timestamp when the dashboard was last modified.\n"]
  created_at : generic_time_stamp; [@ocaml.doc "The timestamp when the dashboard was created.\n"]
  widgets : widget_list;
      [@ocaml.doc "An array of widget configurations that make up the dashboard.\n"]
  type_ : dashboard_type; [@ocaml.doc "Indicates the dashboard type.\n"]
  description : description option; [@ocaml.doc "The description of the retrieved dashboard.\n"]
  name : dashboard_name; [@ocaml.doc "The name of the retrieved dashboard.\n"]
  arn : dashboard_arn; [@ocaml.doc "The ARN of the retrieved dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec get_dashboard_request = {
  arn : dashboard_arn;
      [@ocaml.doc
        "The ARN of the dashboard to retrieve. This is required to uniquely identify the dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_scheduled_report_response = {
  execution_triggered : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the execution was successfully triggered.\n"]
  health_status : health_status option;
      [@ocaml.doc "The health status of the scheduled report after the execution request.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec execute_scheduled_report_request = {
  dry_run : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "When set to [true], validates the scheduled report configuration without triggering an \
         actual execution.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report to execute.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_report_response = {
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_report_request = {
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the scheduled report to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dashboard_response = {
  arn : dashboard_arn; [@ocaml.doc "The ARN of the dashboard that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dashboard_request = {
  arn : dashboard_arn; [@ocaml.doc "The ARN of the dashboard to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scheduled_report_response = {
  arn : scheduled_report_arn; [@ocaml.doc "The ARN of the newly created scheduled report.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scheduled_report_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "The tags to apply to the scheduled report resource for organization and management.\n"]
  scheduled_report : scheduled_report_input;
      [@ocaml.doc
        "The configuration for the scheduled report, including the dashboard to report on, the \
         schedule, and the execution role that the service will use to generate the dashboard \
         snapshot.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dashboard_response = {
  arn : dashboard_arn; [@ocaml.doc "The ARN of the newly created dashboard.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dashboard_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc "The tags to apply to the dashboard resource for organization and management.\n"]
  widgets : widget_list;
      [@ocaml.doc
        "An array of widget configurations that define the visualizations to be displayed in the \
         dashboard. Each dashboard can contain up to 20 widgets.\n"]
  description : description option;
      [@ocaml.doc "A description of the dashboard's purpose or contents.\n"]
  name : dashboard_name;
      [@ocaml.doc "The name of the dashboard. The name must be unique within your account.\n"]
}
[@@ocaml.doc ""]
