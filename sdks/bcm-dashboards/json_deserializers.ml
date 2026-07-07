open Smaws_Lib.Json.DeserializeHelpers
open Types

let widget_width_of_yojson = int_of_yojson
let widget_title_of_yojson = string_of_yojson
let widget_id_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let widget_height_of_yojson = int_of_yojson

let metric_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Cost" -> Cost
    | `String "Unit" -> Unit
    | `String "Hour" -> Hour
    | `String "SpendCoveredBySavingsPlans" -> SpendCoveredBySavingsPlans
    | `String "UsageQuantity" -> UsageQuantity
    | `String "UnblendedCost" -> UnblendedCost
    | `String "NormalizedUsageAmount" -> NormalizedUsageAmount
    | `String "NetUnblendedCost" -> NetUnblendedCost
    | `String "NetAmortizedCost" -> NetAmortizedCost
    | `String "BlendedCost" -> BlendedCost
    | `String "AmortizedCost" -> AmortizedCost
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")
     : metric_name)
    : metric_name)

let metric_names_of_yojson tree path = list_of_yojson metric_name_of_yojson tree path

let date_time_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RELATIVE" -> RELATIVE
    | `String "ABSOLUTE" -> ABSOLUTE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DateTimeType" value)
    | _ -> raise (deserialize_wrong_type_error path "DateTimeType")
     : date_time_type)
    : date_time_type)

let generic_string_of_yojson = string_of_yojson

let date_time_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key generic_string_of_yojson "value" _list path;
     type_ = value_for_key date_time_type_of_yojson "type" _list path;
   }
    : date_time_value)

let date_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = value_for_key date_time_value_of_yojson "endTime" _list path;
     start_time = value_for_key date_time_value_of_yojson "startTime" _list path;
   }
    : date_time_range)

let granularity_of_yojson (tree : t) path =
  ((match tree with
    | `String "MONTHLY" -> MONTHLY
    | `String "DAILY" -> DAILY
    | `String "HOURLY" -> HOURLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Granularity" value)
    | _ -> raise (deserialize_wrong_type_error path "Granularity")
     : granularity)
    : granularity)

let group_definition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COST_CATEGORY" -> COST_CATEGORY
    | `String "TAG" -> TAG
    | `String "DIMENSION" -> DIMENSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupDefinitionType" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupDefinitionType")
     : group_definition_type)
    : group_definition_type)

let group_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key group_definition_type_of_yojson "type") _list path;
     key = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key" _list path;
   }
    : group_definition)

let group_definitions_of_yojson tree path = list_of_yojson group_definition_of_yojson tree path

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLATFORM" -> PLATFORM
    | `String "SCOPE" -> SCOPE
    | `String "DEPLOYMENT_OPTION" -> DEPLOYMENT_OPTION
    | `String "CACHE_ENGINE" -> CACHE_ENGINE
    | `String "INSTANCE_TYPE_FAMILY" -> INSTANCE_TYPE_FAMILY
    | `String "SAVINGS_PLANS_TYPE" -> SAVINGS_PLANS_TYPE
    | `String "LEGAL_ENTITY_NAME" -> LEGAL_ENTITY_NAME
    | `String "DATABASE_ENGINE" -> DATABASE_ENGINE
    | `String "COST_CATEGORY_NAME" -> COST_CATEGORY_NAME
    | `String "RESERVATION_ID" -> RESERVATION_ID
    | `String "BILLING_ENTITY" -> BILLING_ENTITY
    | `String "TENANCY" -> TENANCY
    | `String "OPERATING_SYSTEM" -> OPERATING_SYSTEM
    | `String "TAG_KEY" -> TAG_KEY
    | `String "SUBSCRIPTION_ID" -> SUBSCRIPTION_ID
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String "RECORD_TYPE" -> RECORD_TYPE
    | `String "USAGE_TYPE_GROUP" -> USAGE_TYPE_GROUP
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "SERVICE" -> SERVICE
    | `String "REGION" -> REGION
    | `String "PURCHASE_TYPE" -> PURCHASE_TYPE
    | `String "OPERATION" -> OPERATION
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "INSTANCE_TYPE" -> INSTANCE_TYPE
    | `String "AZ" -> AZ
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "CASE_INSENSITIVE" -> CASE_INSENSITIVE
    | `String "CASE_SENSITIVE" -> CASE_SENSITIVE
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String "CONTAINS" -> CONTAINS
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ABSENT" -> ABSENT
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let match_options_of_yojson tree path = list_of_yojson match_option_of_yojson tree path

let dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
     values = value_for_key string_list_of_yojson "values" _list path;
     key = value_for_key dimension_of_yojson "key" _list path;
   }
    : dimension_values)

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
   }
    : tag_values)

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "matchOptions") _list path;
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
   }
    : cost_category_values)

let rec expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "costCategories") _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "tags") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_values_of_yojson "dimensions") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "not") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "and") _list path;
     \#or = option_of_yojson (value_for_key expressions_of_yojson "or") _list path;
   }
    : expression)

and expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

let cost_and_usage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     granularity = value_for_key granularity_of_yojson "granularity" _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
     metrics = value_for_key metric_names_of_yojson "metrics" _list path;
   }
    : cost_and_usage_query)

let savings_plans_coverage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "metrics") _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
   }
    : savings_plans_coverage_query)

let savings_plans_utilization_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
   }
    : savings_plans_utilization_query)

let reservation_coverage_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "metrics") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
   }
    : reservation_coverage_query)

let reservation_utilization_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "granularity") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "groupBy") _list path;
     time_range = value_for_key date_time_range_of_yojson "timeRange" _list path;
   }
    : reservation_utilization_query)

let query_parameters_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "reservationUtilization" ->
       ReservationUtilization (reservation_utilization_query_of_yojson value_ path)
   | "reservationCoverage" -> ReservationCoverage (reservation_coverage_query_of_yojson value_ path)
   | "savingsPlansUtilization" ->
       SavingsPlansUtilization (savings_plans_utilization_query_of_yojson value_ path)
   | "savingsPlansCoverage" ->
       SavingsPlansCoverage (savings_plans_coverage_query_of_yojson value_ path)
   | "costAndUsage" -> CostAndUsage (cost_and_usage_query_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "QueryParameters" unknown)
    : query_parameters)

let visual_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STACK" -> STACK
    | `String "BAR" -> BAR
    | `String "LINE" -> LINE
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

let table_display_config_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let display_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "table" -> Table (table_display_config_struct_of_yojson value_ path)
   | "graph" -> Graph (graph_display_config_map_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "DisplayConfig" unknown)
    : display_config)

let widget_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_config = value_for_key display_config_of_yojson "displayConfig" _list path;
     query_parameters = value_for_key query_parameters_of_yojson "queryParameters" _list path;
   }
    : widget_config)

let widget_config_list_of_yojson tree path = list_of_yojson widget_config_of_yojson tree path

let widget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configs = value_for_key widget_config_list_of_yojson "configs" _list path;
     horizontal_offset =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "horizontalOffset")
         _list path;
     height = option_of_yojson (value_for_key widget_height_of_yojson "height") _list path;
     width = option_of_yojson (value_for_key widget_width_of_yojson "width") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     title = value_for_key widget_title_of_yojson "title" _list path;
     id = option_of_yojson (value_for_key widget_id_of_yojson "id") _list path;
   }
    : widget)

let widget_list_of_yojson tree path = list_of_yojson widget_of_yojson tree path

let widget_id_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : validation_exception)

let scheduled_report_arn_of_yojson = string_of_yojson

let update_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : update_scheduled_report_response)

let scheduled_report_name_of_yojson = string_of_yojson
let dashboard_arn_of_yojson = string_of_yojson
let service_role_arn_of_yojson = string_of_yojson
let generic_time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let schedule_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key generic_time_stamp_of_yojson "endTime") _list path;
     start_time =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "startTime") _list path;
   }
    : schedule_period)

let schedule_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleState" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleState")
     : schedule_state)
    : schedule_state)

let schedule_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key schedule_state_of_yojson "state") _list path;
     schedule_period =
       option_of_yojson (value_for_key schedule_period_of_yojson "schedulePeriod") _list path;
     schedule_expression_time_zone =
       option_of_yojson
         (value_for_key generic_string_of_yojson "scheduleExpressionTimeZone")
         _list path;
     schedule_expression =
       option_of_yojson (value_for_key generic_string_of_yojson "scheduleExpression") _list path;
   }
    : schedule_config)

let update_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clear_widget_date_range_override =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "clearWidgetDateRangeOverride")
         _list path;
     clear_widget_ids =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "clearWidgetIds")
         _list path;
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     schedule_config =
       option_of_yojson (value_for_key schedule_config_of_yojson "scheduleConfig") _list path;
     scheduled_report_execution_role_arn =
       option_of_yojson
         (value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn")
         _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "dashboardArn") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key scheduled_report_name_of_yojson "name") _list path;
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
   }
    : update_scheduled_report_request)

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

let update_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : update_dashboard_response)

let dashboard_name_of_yojson = string_of_yojson

let update_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     widgets = option_of_yojson (value_for_key widget_list_of_yojson "widgets") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
   }
    : update_dashboard_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "resourceTagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key resource_tag_value_of_yojson "value" _list path;
     key = value_for_key resource_tag_key_of_yojson "key" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags = value_for_key resource_tag_list_of_yojson "resourceTags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "WIDGET_ID_NOT_FOUND" -> WIDGET_ID_NOT_FOUND
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "DASHBOARD_ACCESS_DENIED" -> DASHBOARD_ACCESS_DENIED
    | `String "DASHBOARD_NOT_FOUND" -> DASHBOARD_NOT_FOUND
    | `String "EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS" -> EXECUTION_ROLE_INSUFFICIENT_PERMISSIONS
    | `String "EXECUTION_ROLE_ASSUME_FAILED" -> EXECUTION_ROLE_ASSUME_FAILED
    | `String "DATA_SOURCE_ACCESS_DENIED" -> DATA_SOURCE_ACCESS_DENIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusReason")
     : status_reason)
    : status_reason)

let status_reason_list_of_yojson tree path = list_of_yojson status_reason_of_yojson tree path

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : service_quota_exceeded_exception)

let health_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusCode")
     : health_status_code)
    : health_status_code)

let health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reasons =
       option_of_yojson (value_for_key status_reason_list_of_yojson "statusReasons") _list path;
     last_refreshed_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "lastRefreshedAt") _list path;
     status_code = value_for_key health_status_code_of_yojson "statusCode" _list path;
   }
    : health_status)

let scheduled_report_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     schedule_expression_time_zone =
       option_of_yojson
         (value_for_key generic_string_of_yojson "scheduleExpressionTimeZone")
         _list path;
     health_status = value_for_key health_status_of_yojson "healthStatus" _list path;
     state = value_for_key schedule_state_of_yojson "state" _list path;
     schedule_expression = value_for_key generic_string_of_yojson "scheduleExpression" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
   }
    : scheduled_report_summary)

let scheduled_report_summary_list_of_yojson tree path =
  list_of_yojson scheduled_report_summary_of_yojson tree path

let scheduled_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     schedule_config = value_for_key schedule_config_of_yojson "scheduleConfig" _list path;
     scheduled_report_execution_role_arn =
       value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
   }
    : scheduled_report_input)

let scheduled_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
     last_execution_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "lastExecutionAt") _list path;
     updated_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "updatedAt") _list path;
     created_at =
       option_of_yojson (value_for_key generic_time_stamp_of_yojson "createdAt") _list path;
     widget_date_range_override =
       option_of_yojson
         (value_for_key date_time_range_of_yojson "widgetDateRangeOverride")
         _list path;
     widget_ids = option_of_yojson (value_for_key widget_id_list_of_yojson "widgetIds") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     schedule_config = value_for_key schedule_config_of_yojson "scheduleConfig" _list path;
     scheduled_report_execution_role_arn =
       value_for_key service_role_arn_of_yojson "scheduledReportExecutionRoleArn" _list path;
     dashboard_arn = value_for_key dashboard_arn_of_yojson "dashboardArn" _list path;
     name = value_for_key scheduled_report_name_of_yojson "name" _list path;
     arn = option_of_yojson (value_for_key scheduled_report_arn_of_yojson "arn") _list path;
   }
    : scheduled_report)

let next_page_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

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

let list_scheduled_reports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     scheduled_reports =
       value_for_key scheduled_report_summary_list_of_yojson "scheduledReports" _list path;
   }
    : list_scheduled_reports_response)

let list_scheduled_reports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
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
     updated_at = value_for_key generic_time_stamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key generic_time_stamp_of_yojson "createdAt" _list path;
     type_ = value_for_key dashboard_type_of_yojson "type" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
   }
    : dashboard_reference)

let dashboard_reference_list_of_yojson tree path =
  list_of_yojson dashboard_reference_of_yojson tree path

let list_dashboards_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     dashboards = value_for_key dashboard_reference_list_of_yojson "dashboards" _list path;
   }
    : list_dashboards_response)

let list_dashboards_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_dashboards_request)

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
     policy_document = value_for_key generic_string_of_yojson "policyDocument" _list path;
     resource_arn = value_for_key dashboard_arn_of_yojson "resourceArn" _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key dashboard_arn_of_yojson "resourceArn" _list path }
    : get_resource_policy_request)

let get_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = value_for_key generic_time_stamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key generic_time_stamp_of_yojson "createdAt" _list path;
     widgets = value_for_key widget_list_of_yojson "widgets" _list path;
     type_ = value_for_key dashboard_type_of_yojson "type" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
     arn = value_for_key dashboard_arn_of_yojson "arn" _list path;
   }
    : get_dashboard_response)

let get_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : get_dashboard_request)

let execute_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_triggered =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "executionTriggered")
         _list path;
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "healthStatus") _list path;
   }
    : execute_scheduled_report_response)

let client_token_of_yojson = string_of_yojson

let execute_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "dryRun")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path;
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

let create_scheduled_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key scheduled_report_arn_of_yojson "arn" _list path }
    : create_scheduled_report_response)

let create_scheduled_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
     scheduled_report = value_for_key scheduled_report_input_of_yojson "scheduledReport" _list path;
   }
    : create_scheduled_report_request)

let create_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key dashboard_arn_of_yojson "arn" _list path } : create_dashboard_response)

let create_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
     widgets = value_for_key widget_list_of_yojson "widgets" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key dashboard_name_of_yojson "name" _list path;
   }
    : create_dashboard_request)
