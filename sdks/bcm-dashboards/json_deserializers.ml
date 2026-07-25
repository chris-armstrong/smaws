open Smaws_Lib.Json.DeserializeHelpers
open Types

let generic_string_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : access_denied_exception)

let scheduled_report_arn_of_yojson = string_of_yojson

let update_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : update_scheduled_report_response)

let date_time_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ABSOLUTE" -> ABSOLUTE
    | `String "RELATIVE" -> RELATIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DateTimeType" value)
    | _ -> raise (deserialize_wrong_type_error path "DateTimeType")
     : date_time_type)
    : date_time_type)

let date_time_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key date_time_type_of_yojson "type" _list path;
     value = value_for_key generic_string_of_yojson "value" _list path;
   }
    : date_time_value)

let date_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = value_for_key date_time_value_of_yojson "startTime" _list path;
     end_time = value_for_key date_time_value_of_yojson "endTime" _list path;
   }
    : date_time_range)

let widget_id_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let schedule_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleState" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleState")
     : schedule_state)
    : schedule_state)

let generic_time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let schedule_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key generic_time_stamp_of_yojson "endTime") _list path;
   }
    : schedule_period)

let schedule_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule_expression =
       option_of_yojson (value_for_key generic_string_of_yojson "scheduleExpression") _list path;
     schedule_expression_time_zone =
       option_of_yojson
         (value_for_key generic_string_of_yojson "scheduleExpressionTimeZone")
         _list path;
     schedule_period =
       option_of_yojson (value_for_key schedule_period_of_yojson "schedulePeriod") _list path;
     state = option_of_yojson (value_for_key schedule_state_of_yojson "state") _list path;
   }
    : schedule_config)

let service_role_arn_of_yojson = string_of_yojson
let dashboard_arn_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let scheduled_report_name_of_yojson = string_of_yojson

let update_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
     name = option_of_yojson (value_for_key scheduled_report_name_of_yojson "name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "dashboardArn") _list path;
     scheduled_report_execution_role_arn =
       option_of_yojson
         (value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn")
         _list path;
     schedule_config =
       option_of_yojson (value_for_key schedule_config_of_yojson "scheduleConfig") _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
     clear_widget_ids =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "clearWidgetIds")
         _list path;
     clear_widget_date_range_override =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "clearWidgetDateRangeOverride")
         _list path;
   }
    : update_scheduled_report_request)

let update_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : update_dashboard_response)

let table_display_config_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let visual_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINE" -> LINE
    | `String "BAR" -> BAR
    | `String "STACK" -> STACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "VisualType" value)
    | _ -> raise (deserialize_wrong_type_error path "VisualType")
     : visual_type)
    : visual_type)

let graph_display_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ visual_type = value_for_key visual_type_of_yojson "visualType" _list path }
    : graph_display_config)

let graph_display_config_map_of_yojson tree path =
  map_of_yojson generic_string_of_yojson graph_display_config_of_yojson tree path

let display_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "graph" -> Graph (graph_display_config_map_of_yojson value_ path)
   | "table" -> Table (table_display_config_struct_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "DisplayConfig" unknown)
    : display_config)

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "ABSENT" -> ABSENT
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String "CASE_SENSITIVE" -> CASE_SENSITIVE
    | `String "CASE_INSENSITIVE" -> CASE_INSENSITIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let match_options_of_yojson tree path = list_of_yojson match_option_of_yojson tree path

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
   }
    : cost_category_values)

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
   }
    : tag_values)

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "AZ" -> AZ
    | `String "INSTANCE_TYPE" -> INSTANCE_TYPE
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "OPERATION" -> OPERATION
    | `String "PURCHASE_TYPE" -> PURCHASE_TYPE
    | `String "REGION" -> REGION
    | `String "SERVICE" -> SERVICE
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "USAGE_TYPE_GROUP" -> USAGE_TYPE_GROUP
    | `String "RECORD_TYPE" -> RECORD_TYPE
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String "SUBSCRIPTION_ID" -> SUBSCRIPTION_ID
    | `String "TAG_KEY" -> TAG_KEY
    | `String "OPERATING_SYSTEM" -> OPERATING_SYSTEM
    | `String "TENANCY" -> TENANCY
    | `String "BILLING_ENTITY" -> BILLING_ENTITY
    | `String "RESERVATION_ID" -> RESERVATION_ID
    | `String "COST_CATEGORY_NAME" -> COST_CATEGORY_NAME
    | `String "DATABASE_ENGINE" -> DATABASE_ENGINE
    | `String "LEGAL_ENTITY_NAME" -> LEGAL_ENTITY_NAME
    | `String "SAVINGS_PLANS_TYPE" -> SAVINGS_PLANS_TYPE
    | `String "INSTANCE_TYPE_FAMILY" -> INSTANCE_TYPE_FAMILY
    | `String "CACHE_ENGINE" -> CACHE_ENGINE
    | `String "DEPLOYMENT_OPTION" -> DEPLOYMENT_OPTION
    | `String "SCOPE" -> SCOPE
    | `String "PLATFORM" -> PLATFORM
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key dimension_of_yojson "key" _list path;
     values = value_for_key string_list_of_yojson "values" _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
   }
    : dimension_values)

let rec expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

and expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     \#or = option_of_yojson (value_for_key expressions_of_yojson "or") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "and") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "not") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_values_of_yojson "dimensions") _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "tags") _list path;
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "costCategories") _list path;
   }
    : expression)

let granularity_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOURLY" -> HOURLY
    | `String "DAILY" -> DAILY
    | `String "MONTHLY" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Granularity" value)
    | _ -> raise (deserialize_wrong_type_error path "Granularity")
     : granularity)
    : granularity)

let group_definition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIMENSION" -> DIMENSION
    | `String "TAG" -> TAG
    | `String "COST_CATEGORY" -> COST_CATEGORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupDefinitionType" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupDefinitionType")
     : group_definition_type)
    : group_definition_type)

let group_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key" _list path;
     type_ = option_of_yojson (value_for_key group_definition_type_of_yojson "type") _list path;
   }
    : group_definition)

let group_definitions_of_yojson tree path = list_of_yojson group_definition_of_yojson tree path

let reservation_utilization_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
   }
    : reservation_utilization_query)

let metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "AmortizedCost" -> AmortizedCost
    | `String "BlendedCost" -> BlendedCost
    | `String "NetAmortizedCost" -> NetAmortizedCost
    | `String "NetUnblendedCost" -> NetUnblendedCost
    | `String "NormalizedUsageAmount" -> NormalizedUsageAmount
    | `String "UnblendedCost" -> UnblendedCost
    | `String "UsageQuantity" -> UsageQuantity
    | `String "SpendCoveredBySavingsPlans" -> SpendCoveredBySavingsPlans
    | `String "Hour" -> Hour
    | `String "Unit" -> Unit
    | `String "Cost" -> Cost
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")
     : metric_name)
    : metric_name)

let metric_names_of_yojson tree path = list_of_yojson metric_name_of_yojson tree path

let reservation_coverage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "metrics") _list path;
   }
    : reservation_coverage_query)

let savings_plans_utilization_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
   }
    : savings_plans_utilization_query)

let savings_plans_coverage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "metrics") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
   }
    : savings_plans_coverage_query)

let cost_and_usage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics = value_for_key metric_names_of_yojson "metrics" _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     granularity = value_for_key granularity_of_yojson "granularity" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
   }
    : cost_and_usage_query)

let query_parameters_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "costAndUsage" -> CostAndUsage (cost_and_usage_query_of_yojson value_ path)
   | "savingsPlansCoverage" ->
       SavingsPlansCoverage (savings_plans_coverage_query_of_yojson value_ path)
   | "savingsPlansUtilization" ->
       SavingsPlansUtilization (savings_plans_utilization_query_of_yojson value_ path)
   | "reservationCoverage" -> ReservationCoverage (reservation_coverage_query_of_yojson value_ path)
   | "reservationUtilization" ->
       ReservationUtilization (reservation_utilization_query_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "QueryParameters" unknown)
    : query_parameters)

let widget_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_parameters = value_for_key query_parameters_of_yojson "queryParameters" _list path;
     display_config = value_for_key display_config_of_yojson "displayConfig" _list path;
   }
    : widget_config)

let widget_config_list_of_yojson tree path = list_of_yojson widget_config_of_yojson tree path
let widget_height_of_yojson = int_of_yojson
let widget_width_of_yojson = int_of_yojson
let widget_title_of_yojson = string_of_yojson
let widget_id_of_yojson = string_of_yojson

let widget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key widget_id_of_yojson "id") _list path;
     title = value_for_key widget_title_of_yojson "title" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     width = option_of_yojson (value_for_key widget_width_of_yojson "width") _list path;
     height = option_of_yojson (value_for_key widget_height_of_yojson "height") _list path;
     horizontal_offset =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "horizontalOffset")
         _list path;
     configs = value_for_key widget_config_list_of_yojson "configs" _list path;
   }
    : widget)

let widget_list_of_yojson tree path = list_of_yojson widget_of_yojson tree path
let dashboard_name_of_yojson = string_of_yojson

let update_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     widgets = option_of_yojson (value_for_key widget_list_of_yojson "widgets") _list path;
   }
    : update_dashboard_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "resourceTagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "key" _list path;
     value = value_for_key resource_tag_value_of_yojson "value" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
     resource_tags = value_for_key resource_tag_list_of_yojson "resourceTags" _list path;
   }
    : tag_resource_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let next_page_token_of_yojson = string_of_yojson

let status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_SOURCE_ACCESS_DENIED" -> DATA_SOURCE_ACCESS_DENIED
    | `String "EXECUTION_ROLE_ASSUME_FAILED" -> EXECUTION_ROLE_ASSUME_FAILED
    | `String "EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS" -> EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS
    | `String "DASHBOARD_NOT_FOUND" -> DASHBOARD_NOT_FOUND
    | `String "DASHBOARD_ACCESS_DENIED" -> DASHBOARD_ACCESS_DENIED
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "WIDGET_ID_NOT_FOUND" -> WIDGET_ID_NOT_FOUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusReason")
     : status_reason)
    : status_reason)

let status_reason_list_of_yojson tree path = list_of_yojson status_reason_of_yojson tree path

let health_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusCode")
     : health_status_code)
    : health_status_code)

let health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code = value_for_key health_status_code_of_yojson "statusCode" _list path;
     last_refreshed_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "lastRefreshedAt") _list path;
     status_reasons =
       option_of_yojson (value_for_key status_reason_list_of_yojson "statusReasons") _list path;
   }
    : health_status)

let scheduled_report_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     schedule_expression = value_for_key generic_string_of_yojson "scheduleExpression" _list path;
     state = value_for_key schedule_state_of_yojson "state" _list path;
     health_status = value_for_key health_status_of_yojson "healthStatus" _list path;
     schedule_expression_time_zone =
       option_of_yojson
         (value_for_key generic_string_of_yojson "scheduleExpressionTimeZone")
         _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
   }
    : scheduled_report_summary)

let scheduled_report_summary_list_of_yojson tree path =
  list_of_yojson scheduled_report_summary_of_yojson tree path

let list_scheduled_reports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_reports =
       value_for_key scheduled_report_summary_list_of_yojson "scheduledReports" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : list_scheduled_reports_response)

let max_results_of_yojson = int_of_yojson

let list_scheduled_reports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_scheduled_reports_request)

let dashboard_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "DashboardType" value)
    | _ -> raise (deserialize_wrong_type_error path "DashboardType")
     : dashboard_type)
    : dashboard_type)

let dashboard_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     type_ = value_for_key dashboard_type_of_yojson "type" _list path;
     created_at = value_for_key generic_time_stamp_of_yojson "createdAt" _list path;
     updated_at = value_for_key generic_time_stamp_of_yojson "updatedAt" _list path;
   }
    : dashboard_reference)

let dashboard_reference_list_of_yojson tree path =
  list_of_yojson dashboard_reference_of_yojson tree path

let list_dashboards_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dashboards = value_for_key dashboard_reference_list_of_yojson "dashboards" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : list_dashboards_response)

let list_dashboards_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : list_dashboards_request)

let scheduled_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key scheduled_report_arn_of_yojson "arn") _list path;
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     scheduled_report_execution_role_arn =
       value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn" _list path;
     schedule_config = value_for_key schedule_config_of_yojson "scheduleConfig" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
     created_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "createdAt") _list path;
     updated_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "updatedAt") _list path;
     last_execution_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "lastExecutionAt") _list path;
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
   }
    : scheduled_report)

let get_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ scheduled_report = value_for_key scheduled_report_of_yojson "scheduledReport" _list path }
    : get_scheduled_report_response)

let get_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : get_scheduled_report_request)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key dashboard_arn_of_yojson "resourceArn" _list path;
     policy_document = value_for_key generic_string_of_yojson "policyDocument" _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key dashboard_arn_of_yojson "resourceArn" _list path }
    : get_resource_policy_request)

let get_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     type_ = value_for_key dashboard_type_of_yojson "type" _list path;
     widgets = value_for_key widget_list_of_yojson "widgets" _list path;
     created_at = value_for_key generic_time_stamp_of_yojson "createdAt" _list path;
     updated_at = value_for_key generic_time_stamp_of_yojson "updatedAt" _list path;
   }
    : get_dashboard_response)

let get_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : get_dashboard_request)

let execute_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
     execution_triggered =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "executionTriggered")
         _list path;
   }
    : execute_scheduled_report_response)

let client_token_of_yojson = string_of_yojson

let execute_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "dryRun")
         _list path;
   }
    : execute_scheduled_report_request)

let delete_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : delete_scheduled_report_response)

let delete_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : delete_scheduled_report_request)

let delete_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : delete_dashboard_response)

let delete_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : delete_dashboard_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : service_quota_exceeded_exception)

let create_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : create_scheduled_report_response)

let scheduled_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     scheduled_report_execution_role_arn =
       value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn" _list path;
     schedule_config = value_for_key schedule_config_of_yojson "scheduleConfig" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
   }
    : scheduled_report_input)

let create_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_report = value_for_key scheduled_report_input_of_yojson "scheduledReport" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_scheduled_report_request)

let create_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : create_dashboard_response)

let create_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     widgets = value_for_key widget_list_of_yojson "widgets" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
   }
    : create_dashboard_request)
