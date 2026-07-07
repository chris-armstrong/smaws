open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson
let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path
let user_of_yojson = string_of_yojson
let users_of_yojson tree path = list_of_yojson user_of_yojson tree path

let update_subscriber_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let account_id_of_yojson = string_of_yojson
let budget_name_of_yojson = string_of_yojson

let notification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FORECASTED" -> FORECASTED
    | `String "ACTUAL" -> ACTUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationType")
     : notification_type)
    : notification_type)

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUAL_TO" -> EQUAL_TO
    | `String "LESS_THAN" -> LESS_THAN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let notification_threshold_of_yojson = double_of_yojson

let threshold_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ABSOLUTE_VALUE" -> ABSOLUTE_VALUE
    | `String "PERCENTAGE" -> PERCENTAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThresholdType" value)
    | _ -> raise (deserialize_wrong_type_error path "ThresholdType")
     : threshold_type)
    : threshold_type)

let notification_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALARM" -> ALARM
    | `String "OK" -> OK
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationState" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationState")
     : notification_state)
    : notification_state)

let notification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_state =
       option_of_yojson (value_for_key notification_state_of_yojson "NotificationState") _list path;
     threshold_type =
       option_of_yojson (value_for_key threshold_type_of_yojson "ThresholdType") _list path;
     threshold = value_for_key notification_threshold_of_yojson "Threshold" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
   }
    : notification)

let subscription_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMAIL" -> EMAIL
    | `String "SNS" -> SNS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriptionType")
     : subscription_type)
    : subscription_type)

let subscriber_address_of_yojson = string_of_yojson

let subscriber_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = value_for_key subscriber_address_of_yojson "Address" _list path;
     subscription_type = value_for_key subscription_type_of_yojson "SubscriptionType" _list path;
   }
    : subscriber)

let update_subscriber_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_subscriber = value_for_key subscriber_of_yojson "NewSubscriber" _list path;
     old_subscriber = value_for_key subscriber_of_yojson "OldSubscriber" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : update_subscriber_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_found_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_error_exception)

let duplicate_record_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : duplicate_record_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let update_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_notification = value_for_key notification_of_yojson "NewNotification" _list path;
     old_notification = value_for_key notification_of_yojson "OldNotification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : update_notification_request)

let update_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let numeric_value_of_yojson = string_of_yojson
let unit_value_of_yojson = string_of_yojson

let spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = value_for_key unit_value_of_yojson "Unit" _list path;
     amount = value_for_key numeric_value_of_yojson "Amount" _list path;
   }
    : spend)

let generic_string_of_yojson = string_of_yojson

let planned_budget_limits_of_yojson tree path =
  map_of_yojson generic_string_of_yojson spend_of_yojson tree path

let dimension_value_of_yojson = string_of_yojson
let dimension_values_of_yojson tree path = list_of_yojson dimension_value_of_yojson tree path

let cost_filters_of_yojson tree path =
  map_of_yojson generic_string_of_yojson dimension_values_of_yojson tree path

let nullable_boolean_of_yojson = bool_of_yojson

let cost_types_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     use_amortized =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "UseAmortized") _list path;
     include_discount =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeDiscount") _list path;
     include_support =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeSupport") _list path;
     include_other_subscription =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "IncludeOtherSubscription")
         _list path;
     include_recurring =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeRecurring") _list path;
     include_upfront =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeUpfront") _list path;
     include_credit =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeCredit") _list path;
     include_refund =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeRefund") _list path;
     use_blended =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "UseBlended") _list path;
     include_subscription =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeSubscription") _list path;
     include_tax =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeTax") _list path;
   }
    : cost_types)

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String "ANNUALLY" -> ANNUALLY
    | `String "QUARTERLY" -> QUARTERLY
    | `String "MONTHLY" -> MONTHLY
    | `String "DAILY" -> DAILY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let generic_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_ = option_of_yojson (value_for_key generic_timestamp_of_yojson "End") _list path;
     start = option_of_yojson (value_for_key generic_timestamp_of_yojson "Start") _list path;
   }
    : time_period)

let calculated_spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecasted_spend =
       option_of_yojson (value_for_key spend_of_yojson "ForecastedSpend") _list path;
     actual_spend = value_for_key spend_of_yojson "ActualSpend" _list path;
   }
    : calculated_spend)

let budget_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAVINGS_PLANS_COVERAGE" -> SPCoverage
    | `String "SAVINGS_PLANS_UTILIZATION" -> SPUtilization
    | `String "RI_COVERAGE" -> RICoverage
    | `String "RI_UTILIZATION" -> RIUtilization
    | `String "COST" -> Cost
    | `String "USAGE" -> Usage
    | `String value -> raise (deserialize_unknown_enum_value_error path "BudgetType" value)
    | _ -> raise (deserialize_wrong_type_error path "BudgetType")
     : budget_type)
    : budget_type)

let auto_adjust_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FORECAST" -> FORECAST
    | `String "HISTORICAL" -> HISTORICAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoAdjustType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoAdjustType")
     : auto_adjust_type)
    : auto_adjust_type)

let adjustment_period_of_yojson = int_of_yojson

let historical_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     look_back_available_periods =
       option_of_yojson
         (value_for_key adjustment_period_of_yojson "LookBackAvailablePeriods")
         _list path;
     budget_adjustment_period =
       value_for_key adjustment_period_of_yojson "BudgetAdjustmentPeriod" _list path;
   }
    : historical_options)

let auto_adjust_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_auto_adjust_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastAutoAdjustTime") _list path;
     historical_options =
       option_of_yojson (value_for_key historical_options_of_yojson "HistoricalOptions") _list path;
     auto_adjust_type = value_for_key auto_adjust_type_of_yojson "AutoAdjustType" _list path;
   }
    : auto_adjust_data)

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "COST_CATEGORY_NAME" -> COST_CATEGORY_NAME
    | `String "TAG_KEY" -> TAG_KEY
    | `String "RESERVATION_MODIFIED" -> RESERVATION_MODIFIED
    | `String "PAYMENT_OPTION" -> PAYMENT_OPTION
    | `String "SAVINGS_PLAN_ARN" -> SAVINGS_PLAN_ARN
    | `String "SAVINGS_PLANS_TYPE" -> SAVINGS_PLANS_TYPE
    | `String "RIGHTSIZING_TYPE" -> RIGHTSIZING_TYPE
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String "RESERVATION_ID" -> RESERVATION_ID
    | `String "BILLING_ENTITY" -> BILLING_ENTITY
    | `String "INSTANCE_TYPE_FAMILY" -> INSTANCE_TYPE_FAMILY
    | `String "CACHE_ENGINE" -> CACHE_ENGINE
    | `String "DATABASE_ENGINE" -> DATABASE_ENGINE
    | `String "DEPLOYMENT_OPTION" -> DEPLOYMENT_OPTION
    | `String "INVOICING_ENTITY" -> INVOICING_ENTITY
    | `String "LEGAL_ENTITY_NAME" -> LEGAL_ENTITY_NAME
    | `String "SUBSCRIPTION_ID" -> SUBSCRIPTION_ID
    | `String "PLATFORM" -> PLATFORM
    | `String "SCOPE" -> SCOPE
    | `String "TENANCY" -> TENANCY
    | `String "OPERATING_SYSTEM" -> OPERATING_SYSTEM
    | `String "RECORD_TYPE" -> RECORD_TYPE
    | `String "USAGE_TYPE_GROUP" -> USAGE_TYPE_GROUP
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "SERVICE_CODE" -> SERVICE_CODE
    | `String "SERVICE" -> SERVICE
    | `String "REGION" -> REGION
    | `String "PURCHASE_TYPE" -> PURCHASE_TYPE
    | `String "OPERATION" -> OPERATION
    | `String "LINKED_ACCOUNT_NAME" -> LINKED_ACCOUNT_NAME
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "INSTANCE_TYPE" -> INSTANCE_TYPE
    | `String "AZ" -> AZ
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

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

let expression_dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
     values = value_for_key values_of_yojson "Values" _list path;
     key = value_for_key dimension_of_yojson "Key" _list path;
   }
    : expression_dimension_values)

let tag_key_of_yojson = string_of_yojson

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag_values)

let cost_category_name_of_yojson = string_of_yojson

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     key = option_of_yojson (value_for_key cost_category_name_of_yojson "Key") _list path;
   }
    : cost_category_values)

let rec expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "CostCategories") _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "Tags") _list path;
     dimensions =
       option_of_yojson
         (value_for_key expression_dimension_values_of_yojson "Dimensions")
         _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "Not") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "And") _list path;
     \#or = option_of_yojson (value_for_key expressions_of_yojson "Or") _list path;
   }
    : expression)

and expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

let metric_of_yojson (tree : t) path =
  ((match tree with
    | `String "Hours" -> HOURS
    | `String "NormalizedUsageAmount" -> NORMALIZED_USAGE_AMOUNT
    | `String "UsageQuantity" -> USAGE_QUANTITY
    | `String "NetAmortizedCost" -> NET_AMORTIZED_COST
    | `String "NetUnblendedCost" -> NET_UNBLENDED_COST
    | `String "AmortizedCost" -> AMORTIZED_COST
    | `String "UnblendedCost" -> UNBLENDED_COST
    | `String "BlendedCost" -> BLENDED_COST
    | `String value -> raise (deserialize_unknown_enum_value_error path "Metric" value)
    | _ -> raise (deserialize_wrong_type_error path "Metric")
     : metric)
    : metric)

let metrics_of_yojson tree path = list_of_yojson metric_of_yojson tree path
let billing_view_arn_of_yojson = string_of_yojson

let health_status_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusValue" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusValue")
     : health_status_value)
    : health_status_value)

let health_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_YEAR_HISTORICAL_DATA_DISABLED" -> MULTI_YEAR_HISTORICAL_DATA_DISABLED
    | `String "FILTER_INVALID" -> FILTER_INVALID
    | `String "BILLING_VIEW_UNHEALTHY" -> BILLING_VIEW_UNHEALTHY
    | `String "BILLING_VIEW_NO_ACCESS" -> BILLING_VIEW_NO_ACCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusReason")
     : health_status_reason)
    : health_status_reason)

let health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastUpdatedTime") _list path;
     status_reason =
       option_of_yojson (value_for_key health_status_reason_of_yojson "StatusReason") _list path;
     status = option_of_yojson (value_for_key health_status_value_of_yojson "Status") _list path;
   }
    : health_status)

let budget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "HealthStatus") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
     filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "FilterExpression") _list path;
     auto_adjust_data =
       option_of_yojson (value_for_key auto_adjust_data_of_yojson "AutoAdjustData") _list path;
     last_updated_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastUpdatedTime") _list path;
     budget_type = value_for_key budget_type_of_yojson "BudgetType" _list path;
     calculated_spend =
       option_of_yojson (value_for_key calculated_spend_of_yojson "CalculatedSpend") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     time_unit = value_for_key time_unit_of_yojson "TimeUnit" _list path;
     cost_types = option_of_yojson (value_for_key cost_types_of_yojson "CostTypes") _list path;
     cost_filters = option_of_yojson (value_for_key cost_filters_of_yojson "CostFilters") _list path;
     planned_budget_limits =
       option_of_yojson
         (value_for_key planned_budget_limits_of_yojson "PlannedBudgetLimits")
         _list path;
     budget_limit = option_of_yojson (value_for_key spend_of_yojson "BudgetLimit") _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
   }
    : budget)

let update_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_budget = value_for_key budget_of_yojson "NewBudget" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : update_budget_request)

let action_id_of_yojson = string_of_yojson

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUN_SSM_DOCUMENTS" -> SSM
    | `String "APPLY_SCP_POLICY" -> SCP
    | `String "APPLY_IAM_POLICY" -> IAM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let action_threshold_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_threshold_type = value_for_key threshold_type_of_yojson "ActionThresholdType" _list path;
     action_threshold_value =
       value_for_key notification_threshold_of_yojson "ActionThresholdValue" _list path;
   }
    : action_threshold)

let policy_arn_of_yojson = string_of_yojson
let role_of_yojson = string_of_yojson
let roles_of_yojson tree path = list_of_yojson role_of_yojson tree path
let group_of_yojson = string_of_yojson
let groups_of_yojson tree path = list_of_yojson group_of_yojson tree path

let iam_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     users = option_of_yojson (value_for_key users_of_yojson "Users") _list path;
     groups = option_of_yojson (value_for_key groups_of_yojson "Groups") _list path;
     roles = option_of_yojson (value_for_key roles_of_yojson "Roles") _list path;
     policy_arn = value_for_key policy_arn_of_yojson "PolicyArn" _list path;
   }
    : iam_action_definition)

let policy_id_of_yojson = string_of_yojson
let target_id_of_yojson = string_of_yojson
let target_ids_of_yojson tree path = list_of_yojson target_id_of_yojson tree path

let scp_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_ids = value_for_key target_ids_of_yojson "TargetIds" _list path;
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
   }
    : scp_action_definition)

let action_sub_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOP_RDS_INSTANCES" -> STOP_RDS
    | `String "STOP_EC2_INSTANCES" -> STOP_EC2
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionSubType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionSubType")
     : action_sub_type)
    : action_sub_type)

let region_of_yojson = string_of_yojson
let instance_id_of_yojson = string_of_yojson
let instance_ids_of_yojson tree path = list_of_yojson instance_id_of_yojson tree path

let ssm_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_ids = value_for_key instance_ids_of_yojson "InstanceIds" _list path;
     region = value_for_key region_of_yojson "Region" _list path;
     action_sub_type = value_for_key action_sub_type_of_yojson "ActionSubType" _list path;
   }
    : ssm_action_definition)

let definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ssm_action_definition =
       option_of_yojson
         (value_for_key ssm_action_definition_of_yojson "SsmActionDefinition")
         _list path;
     scp_action_definition =
       option_of_yojson
         (value_for_key scp_action_definition_of_yojson "ScpActionDefinition")
         _list path;
     iam_action_definition =
       option_of_yojson
         (value_for_key iam_action_definition_of_yojson "IamActionDefinition")
         _list path;
   }
    : definition)

let role_arn_of_yojson = string_of_yojson

let approval_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL" -> MANUAL
    | `String "AUTOMATIC" -> AUTO
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApprovalModel" value)
    | _ -> raise (deserialize_wrong_type_error path "ApprovalModel")
     : approval_model)
    : approval_model)

let action_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESET_FAILURE" -> Reset_Failure
    | `String "RESET_IN_PROGRESS" -> Reset_In_Progress
    | `String "REVERSE_FAILURE" -> Reverse_Failure
    | `String "REVERSE_SUCCESS" -> Reverse_Success
    | `String "REVERSE_IN_PROGRESS" -> Reverse_In_Progress
    | `String "EXECUTION_FAILURE" -> Execution_Failure
    | `String "EXECUTION_SUCCESS" -> Execution_Success
    | `String "EXECUTION_IN_PROGRESS" -> Execution_In_Progress
    | `String "PENDING" -> Pending
    | `String "STANDBY" -> Standby
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionStatus")
     : action_status)
    : action_status)

let subscribers_of_yojson tree path = list_of_yojson subscriber_of_yojson tree path

let action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     status = value_for_key action_status_of_yojson "Status" _list path;
     approval_model = value_for_key approval_model_of_yojson "ApprovalModel" _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "ExecutionRoleArn" _list path;
     definition = value_for_key definition_of_yojson "Definition" _list path;
     action_threshold = value_for_key action_threshold_of_yojson "ActionThreshold" _list path;
     action_type = value_for_key action_type_of_yojson "ActionType" _list path;
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
   }
    : action)

let update_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_action = value_for_key action_of_yojson "NewAction" _list path;
     old_action = value_for_key action_of_yojson "OldAction" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : update_budget_action_response)

let update_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribers = option_of_yojson (value_for_key subscribers_of_yojson "Subscribers") _list path;
     approval_model =
       option_of_yojson (value_for_key approval_model_of_yojson "ApprovalModel") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRoleArn") _list path;
     definition = option_of_yojson (value_for_key definition_of_yojson "Definition") _list path;
     action_threshold =
       option_of_yojson (value_for_key action_threshold_of_yojson "ActionThreshold") _list path;
     notification_type =
       option_of_yojson (value_for_key notification_type_of_yojson "NotificationType") _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : update_budget_action_request)

let resource_locked_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_locked_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let billing_view_health_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : billing_view_health_status_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "ResourceTagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key resource_tag_value_of_yojson "Value" _list path;
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags = value_for_key resource_tag_list_of_yojson "ResourceTags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let notifications_of_yojson tree path = list_of_yojson notification_of_yojson tree path

let notification_with_subscribers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
   }
    : notification_with_subscribers)

let notification_with_subscribers_list_of_yojson tree path =
  list_of_yojson notification_with_subscribers_of_yojson tree path

let max_results_describe_budgets_of_yojson = int_of_yojson
let max_results_budget_notifications_of_yojson = int_of_yojson
let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let expired_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : expired_next_token_exception)

let execution_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESET_BUDGET_ACTION" -> ResetBudgetAction
    | `String "REVERSE_BUDGET_ACTION" -> ReverseBudgetAction
    | `String "RETRY_BUDGET_ACTION" -> RetryBudgetAction
    | `String "APPROVE_BUDGET_ACTION" -> ApproveBudgetAction
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionType")
     : execution_type)
    : execution_type)

let execute_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_type = value_for_key execution_type_of_yojson "ExecutionType" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : execute_budget_action_response)

let execute_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_type = value_for_key execution_type_of_yojson "ExecutionType" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : execute_budget_action_request)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXECUTE_ACTION" -> ExecuteAction
    | `String "UPDATE_ACTION" -> UpdateAction
    | `String "DELETE_ACTION" -> DeleteAction
    | `String "CREATE_ACTION" -> CreateAction
    | `String "SYSTEM" -> System
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let describe_subscribers_for_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     subscribers = option_of_yojson (value_for_key subscribers_of_yojson "Subscribers") _list path;
   }
    : describe_subscribers_for_notification_response)

let describe_subscribers_for_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_subscribers_for_notification_request)

let describe_notifications_for_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     notifications =
       option_of_yojson (value_for_key notifications_of_yojson "Notifications") _list path;
   }
    : describe_notifications_for_budget_response)

let describe_notifications_for_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_notifications_for_budget_request)

let budgets_of_yojson tree path = list_of_yojson budget_of_yojson tree path

let describe_budgets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
   }
    : describe_budgets_response)

let describe_budgets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_filter_expression =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ShowFilterExpression") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key max_results_describe_budgets_of_yojson "MaxResults")
         _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budgets_request)

let describe_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ budget = option_of_yojson (value_for_key budget_of_yojson "Budget") _list path }
    : describe_budget_response)

let describe_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     show_filter_expression =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ShowFilterExpression") _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_request)

let budgeted_and_actual_amounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     actual_amount = option_of_yojson (value_for_key spend_of_yojson "ActualAmount") _list path;
     budgeted_amount = option_of_yojson (value_for_key spend_of_yojson "BudgetedAmount") _list path;
   }
    : budgeted_and_actual_amounts)

let budgeted_and_actual_amounts_list_of_yojson tree path =
  list_of_yojson budgeted_and_actual_amounts_of_yojson tree path

let budget_performance_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
     filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "FilterExpression") _list path;
     budgeted_and_actual_amounts_list =
       option_of_yojson
         (value_for_key budgeted_and_actual_amounts_list_of_yojson "BudgetedAndActualAmountsList")
         _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     time_unit = option_of_yojson (value_for_key time_unit_of_yojson "TimeUnit") _list path;
     cost_types = option_of_yojson (value_for_key cost_types_of_yojson "CostTypes") _list path;
     cost_filters = option_of_yojson (value_for_key cost_filters_of_yojson "CostFilters") _list path;
     budget_type = option_of_yojson (value_for_key budget_type_of_yojson "BudgetType") _list path;
     budget_name = option_of_yojson (value_for_key budget_name_of_yojson "BudgetName") _list path;
   }
    : budget_performance_history)

let describe_budget_performance_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     budget_performance_history =
       option_of_yojson
         (value_for_key budget_performance_history_of_yojson "BudgetPerformanceHistory")
         _list path;
   }
    : describe_budget_performance_history_response)

let describe_budget_performance_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_performance_history_request)

let budget_notifications_for_account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_name = option_of_yojson (value_for_key budget_name_of_yojson "BudgetName") _list path;
     notifications =
       option_of_yojson (value_for_key notifications_of_yojson "Notifications") _list path;
   }
    : budget_notifications_for_account)

let budget_notifications_for_account_list_of_yojson tree path =
  list_of_yojson budget_notifications_for_account_of_yojson tree path

let describe_budget_notifications_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     budget_notifications_for_account =
       option_of_yojson
         (value_for_key budget_notifications_for_account_list_of_yojson
            "BudgetNotificationsForAccount")
         _list path;
   }
    : describe_budget_notifications_for_account_response)

let describe_budget_notifications_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key max_results_budget_notifications_of_yojson "MaxResults")
         _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_notifications_for_account_request)

let actions_of_yojson tree path = list_of_yojson action_of_yojson tree path

let describe_budget_actions_for_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     actions = value_for_key actions_of_yojson "Actions" _list path;
   }
    : describe_budget_actions_for_budget_response)

let describe_budget_actions_for_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_actions_for_budget_request)

let describe_budget_actions_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     actions = value_for_key actions_of_yojson "Actions" _list path;
   }
    : describe_budget_actions_for_account_response)

let describe_budget_actions_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_actions_for_account_request)

let describe_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key action_of_yojson "Action" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_action_response)

let describe_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_action_request)

let action_history_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key action_of_yojson "Action" _list path;
     message = value_for_key generic_string_of_yojson "Message" _list path;
   }
    : action_history_details)

let action_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_history_details =
       value_for_key action_history_details_of_yojson "ActionHistoryDetails" _list path;
     event_type = value_for_key event_type_of_yojson "EventType" _list path;
     status = value_for_key action_status_of_yojson "Status" _list path;
     timestamp = value_for_key generic_timestamp_of_yojson "Timestamp" _list path;
   }
    : action_history)

let action_histories_of_yojson tree path = list_of_yojson action_history_of_yojson tree path

let describe_budget_action_histories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     action_histories = value_for_key action_histories_of_yojson "ActionHistories" _list path;
   }
    : describe_budget_action_histories_response)

let describe_budget_action_histories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : describe_budget_action_histories_request)

let delete_subscriber_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_subscriber_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscriber = value_for_key subscriber_of_yojson "Subscriber" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : delete_subscriber_request)

let delete_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : delete_notification_request)

let delete_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : delete_budget_request)

let delete_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key action_of_yojson "Action" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : delete_budget_action_response)

let delete_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : delete_budget_action_request)

let creation_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : creation_limit_exceeded_exception)

let create_subscriber_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_subscriber_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscriber = value_for_key subscriber_of_yojson "Subscriber" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : create_subscriber_request)

let create_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : create_notification_request)

let create_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
     notifications_with_subscribers =
       option_of_yojson
         (value_for_key notification_with_subscribers_list_of_yojson "NotificationsWithSubscribers")
         _list path;
     budget = value_for_key budget_of_yojson "Budget" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : create_budget_request)

let create_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : create_budget_action_response)

let create_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     approval_model = value_for_key approval_model_of_yojson "ApprovalModel" _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "ExecutionRoleArn" _list path;
     definition = value_for_key definition_of_yojson "Definition" _list path;
     action_threshold = value_for_key action_threshold_of_yojson "ActionThreshold" _list path;
     action_type = value_for_key action_type_of_yojson "ActionType" _list path;
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
   }
    : create_budget_action_request)
