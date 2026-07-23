open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_record_exception_to_yojson (x : duplicate_record_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_subscriber_response_to_yojson = unit_to_yojson
let subscriber_address_to_yojson = string_to_yojson

let subscription_type_to_yojson (x : subscription_type) =
  match x with SNS -> `String "SNS" | EMAIL -> `String "EMAIL"

let subscriber_to_yojson (x : subscriber) =
  assoc_to_yojson
    [
      ("SubscriptionType", Some (subscription_type_to_yojson x.subscription_type));
      ("Address", Some (subscriber_address_to_yojson x.address));
    ]

let notification_state_to_yojson (x : notification_state) =
  match x with OK -> `String "OK" | ALARM -> `String "ALARM"

let threshold_type_to_yojson (x : threshold_type) =
  match x with PERCENTAGE -> `String "PERCENTAGE" | ABSOLUTE_VALUE -> `String "ABSOLUTE_VALUE"

let notification_threshold_to_yojson = double_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | EQUAL_TO -> `String "EQUAL_TO"

let notification_type_to_yojson (x : notification_type) =
  match x with ACTUAL -> `String "ACTUAL" | FORECASTED -> `String "FORECASTED"

let notification_to_yojson (x : notification) =
  assoc_to_yojson
    [
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("Threshold", Some (notification_threshold_to_yojson x.threshold));
      ("ThresholdType", option_to_yojson threshold_type_to_yojson x.threshold_type);
      ("NotificationState", option_to_yojson notification_state_to_yojson x.notification_state);
    ]

let budget_name_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson

let update_subscriber_request_to_yojson (x : update_subscriber_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
      ("OldSubscriber", Some (subscriber_to_yojson x.old_subscriber));
      ("NewSubscriber", Some (subscriber_to_yojson x.new_subscriber));
    ]

let update_notification_response_to_yojson = unit_to_yojson

let update_notification_request_to_yojson (x : update_notification_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("OldNotification", Some (notification_to_yojson x.old_notification));
      ("NewNotification", Some (notification_to_yojson x.new_notification));
    ]

let resource_locked_exception_to_yojson (x : resource_locked_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let subscribers_to_yojson tree = list_to_yojson subscriber_to_yojson tree

let action_status_to_yojson (x : action_status) =
  match x with
  | Standby -> `String "STANDBY"
  | Pending -> `String "PENDING"
  | Execution_In_Progress -> `String "EXECUTION_IN_PROGRESS"
  | Execution_Success -> `String "EXECUTION_SUCCESS"
  | Execution_Failure -> `String "EXECUTION_FAILURE"
  | Reverse_In_Progress -> `String "REVERSE_IN_PROGRESS"
  | Reverse_Success -> `String "REVERSE_SUCCESS"
  | Reverse_Failure -> `String "REVERSE_FAILURE"
  | Reset_In_Progress -> `String "RESET_IN_PROGRESS"
  | Reset_Failure -> `String "RESET_FAILURE"

let approval_model_to_yojson (x : approval_model) =
  match x with AUTO -> `String "AUTOMATIC" | MANUAL -> `String "MANUAL"

let role_arn_to_yojson = string_to_yojson
let instance_id_to_yojson = string_to_yojson
let instance_ids_to_yojson tree = list_to_yojson instance_id_to_yojson tree
let region_to_yojson = string_to_yojson

let action_sub_type_to_yojson (x : action_sub_type) =
  match x with STOP_EC2 -> `String "STOP_EC2_INSTANCES" | STOP_RDS -> `String "STOP_RDS_INSTANCES"

let ssm_action_definition_to_yojson (x : ssm_action_definition) =
  assoc_to_yojson
    [
      ("ActionSubType", Some (action_sub_type_to_yojson x.action_sub_type));
      ("Region", Some (region_to_yojson x.region));
      ("InstanceIds", Some (instance_ids_to_yojson x.instance_ids));
    ]

let target_id_to_yojson = string_to_yojson
let target_ids_to_yojson tree = list_to_yojson target_id_to_yojson tree
let policy_id_to_yojson = string_to_yojson

let scp_action_definition_to_yojson (x : scp_action_definition) =
  assoc_to_yojson
    [
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
      ("TargetIds", Some (target_ids_to_yojson x.target_ids));
    ]

let user_to_yojson = string_to_yojson
let users_to_yojson tree = list_to_yojson user_to_yojson tree
let group_to_yojson = string_to_yojson
let groups_to_yojson tree = list_to_yojson group_to_yojson tree
let role_to_yojson = string_to_yojson
let roles_to_yojson tree = list_to_yojson role_to_yojson tree
let policy_arn_to_yojson = string_to_yojson

let iam_action_definition_to_yojson (x : iam_action_definition) =
  assoc_to_yojson
    [
      ("PolicyArn", Some (policy_arn_to_yojson x.policy_arn));
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("Users", option_to_yojson users_to_yojson x.users);
    ]

let definition_to_yojson (x : definition) =
  assoc_to_yojson
    [
      ( "IamActionDefinition",
        option_to_yojson iam_action_definition_to_yojson x.iam_action_definition );
      ( "ScpActionDefinition",
        option_to_yojson scp_action_definition_to_yojson x.scp_action_definition );
      ( "SsmActionDefinition",
        option_to_yojson ssm_action_definition_to_yojson x.ssm_action_definition );
    ]

let action_threshold_to_yojson (x : action_threshold) =
  assoc_to_yojson
    [
      ("ActionThresholdValue", Some (notification_threshold_to_yojson x.action_threshold_value));
      ("ActionThresholdType", Some (threshold_type_to_yojson x.action_threshold_type));
    ]

let action_type_to_yojson (x : action_type) =
  match x with
  | IAM -> `String "APPLY_IAM_POLICY"
  | SCP -> `String "APPLY_SCP_POLICY"
  | SSM -> `String "RUN_SSM_DOCUMENTS"

let action_id_to_yojson = string_to_yojson

let action_to_yojson (x : action) =
  assoc_to_yojson
    [
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
      ("ActionType", Some (action_type_to_yojson x.action_type));
      ("ActionThreshold", Some (action_threshold_to_yojson x.action_threshold));
      ("Definition", Some (definition_to_yojson x.definition));
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("ApprovalModel", Some (approval_model_to_yojson x.approval_model));
      ("Status", Some (action_status_to_yojson x.status));
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
    ]

let update_budget_action_response_to_yojson (x : update_budget_action_response) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("OldAction", Some (action_to_yojson x.old_action));
      ("NewAction", Some (action_to_yojson x.new_action));
    ]

let update_budget_action_request_to_yojson (x : update_budget_action_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("NotificationType", option_to_yojson notification_type_to_yojson x.notification_type);
      ("ActionThreshold", option_to_yojson action_threshold_to_yojson x.action_threshold);
      ("Definition", option_to_yojson definition_to_yojson x.definition);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("ApprovalModel", option_to_yojson approval_model_to_yojson x.approval_model);
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_budget_response_to_yojson = unit_to_yojson
let generic_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let health_status_reason_to_yojson (x : health_status_reason) =
  match x with
  | BILLING_VIEW_NO_ACCESS -> `String "BILLING_VIEW_NO_ACCESS"
  | BILLING_VIEW_UNHEALTHY -> `String "BILLING_VIEW_UNHEALTHY"
  | FILTER_INVALID -> `String "FILTER_INVALID"
  | MULTI_YEAR_HISTORICAL_DATA_DISABLED -> `String "MULTI_YEAR_HISTORICAL_DATA_DISABLED"

let health_status_value_to_yojson (x : health_status_value) =
  match x with HEALTHY -> `String "HEALTHY" | UNHEALTHY -> `String "UNHEALTHY"

let health_status_to_yojson (x : health_status) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson health_status_value_to_yojson x.status);
      ("StatusReason", option_to_yojson health_status_reason_to_yojson x.status_reason);
      ("LastUpdatedTime", option_to_yojson generic_timestamp_to_yojson x.last_updated_time);
    ]

let billing_view_arn_to_yojson = string_to_yojson

let metric_to_yojson (x : metric) =
  match x with
  | BLENDED_COST -> `String "BlendedCost"
  | UNBLENDED_COST -> `String "UnblendedCost"
  | AMORTIZED_COST -> `String "AmortizedCost"
  | NET_UNBLENDED_COST -> `String "NetUnblendedCost"
  | NET_AMORTIZED_COST -> `String "NetAmortizedCost"
  | USAGE_QUANTITY -> `String "UsageQuantity"
  | NORMALIZED_USAGE_AMOUNT -> `String "NormalizedUsageAmount"
  | HOURS -> `String "Hours"

let metrics_to_yojson tree = list_to_yojson metric_to_yojson tree

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
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson cost_category_name_to_yojson x.key);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let dimension_to_yojson (x : dimension) =
  match x with
  | AZ -> `String "AZ"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME"
  | OPERATION -> `String "OPERATION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | REGION -> `String "REGION"
  | SERVICE -> `String "SERVICE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | TENANCY -> `String "TENANCY"
  | SCOPE -> `String "SCOPE"
  | PLATFORM -> `String "PLATFORM"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | INVOICING_ENTITY -> `String "INVOICING_ENTITY"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | RIGHTSIZING_TYPE -> `String "RIGHTSIZING_TYPE"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | SAVINGS_PLAN_ARN -> `String "SAVINGS_PLAN_ARN"
  | PAYMENT_OPTION -> `String "PAYMENT_OPTION"
  | RESERVATION_MODIFIED -> `String "RESERVATION_MODIFIED"
  | TAG_KEY -> `String "TAG_KEY"
  | COST_CATEGORY_NAME -> `String "COST_CATEGORY_NAME"

let expression_dimension_values_to_yojson (x : expression_dimension_values) =
  assoc_to_yojson
    [
      ("Key", Some (dimension_to_yojson x.key));
      ("Values", Some (values_to_yojson x.values));
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let rec expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

and expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("Dimensions", option_to_yojson expression_dimension_values_to_yojson x.dimensions);
      ("Tags", option_to_yojson tag_values_to_yojson x.tags);
      ("CostCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
    ]

let adjustment_period_to_yojson = int_to_yojson

let historical_options_to_yojson (x : historical_options) =
  assoc_to_yojson
    [
      ("BudgetAdjustmentPeriod", Some (adjustment_period_to_yojson x.budget_adjustment_period));
      ( "LookBackAvailablePeriods",
        option_to_yojson adjustment_period_to_yojson x.look_back_available_periods );
    ]

let auto_adjust_type_to_yojson (x : auto_adjust_type) =
  match x with HISTORICAL -> `String "HISTORICAL" | FORECAST -> `String "FORECAST"

let auto_adjust_data_to_yojson (x : auto_adjust_data) =
  assoc_to_yojson
    [
      ("AutoAdjustType", Some (auto_adjust_type_to_yojson x.auto_adjust_type));
      ("HistoricalOptions", option_to_yojson historical_options_to_yojson x.historical_options);
      ("LastAutoAdjustTime", option_to_yojson generic_timestamp_to_yojson x.last_auto_adjust_time);
    ]

let budget_type_to_yojson (x : budget_type) =
  match x with
  | Usage -> `String "USAGE"
  | Cost -> `String "COST"
  | RIUtilization -> `String "RI_UTILIZATION"
  | RICoverage -> `String "RI_COVERAGE"
  | SPUtilization -> `String "SAVINGS_PLANS_UTILIZATION"
  | SPCoverage -> `String "SAVINGS_PLANS_COVERAGE"

let unit_value_to_yojson = string_to_yojson
let numeric_value_to_yojson = string_to_yojson

let spend_to_yojson (x : spend) =
  assoc_to_yojson
    [
      ("Amount", Some (numeric_value_to_yojson x.amount));
      ("Unit", Some (unit_value_to_yojson x.unit_));
    ]

let calculated_spend_to_yojson (x : calculated_spend) =
  assoc_to_yojson
    [
      ("ActualSpend", Some (spend_to_yojson x.actual_spend));
      ("ForecastedSpend", option_to_yojson spend_to_yojson x.forecasted_spend);
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("Start", option_to_yojson generic_timestamp_to_yojson x.start);
      ("End", option_to_yojson generic_timestamp_to_yojson x.end_);
    ]

let time_unit_to_yojson (x : time_unit) =
  match x with
  | DAILY -> `String "DAILY"
  | MONTHLY -> `String "MONTHLY"
  | QUARTERLY -> `String "QUARTERLY"
  | ANNUALLY -> `String "ANNUALLY"
  | CUSTOM -> `String "CUSTOM"

let nullable_boolean_to_yojson = bool_to_yojson

let cost_types_to_yojson (x : cost_types) =
  assoc_to_yojson
    [
      ("IncludeTax", option_to_yojson nullable_boolean_to_yojson x.include_tax);
      ("IncludeSubscription", option_to_yojson nullable_boolean_to_yojson x.include_subscription);
      ("UseBlended", option_to_yojson nullable_boolean_to_yojson x.use_blended);
      ("IncludeRefund", option_to_yojson nullable_boolean_to_yojson x.include_refund);
      ("IncludeCredit", option_to_yojson nullable_boolean_to_yojson x.include_credit);
      ("IncludeUpfront", option_to_yojson nullable_boolean_to_yojson x.include_upfront);
      ("IncludeRecurring", option_to_yojson nullable_boolean_to_yojson x.include_recurring);
      ( "IncludeOtherSubscription",
        option_to_yojson nullable_boolean_to_yojson x.include_other_subscription );
      ("IncludeSupport", option_to_yojson nullable_boolean_to_yojson x.include_support);
      ("IncludeDiscount", option_to_yojson nullable_boolean_to_yojson x.include_discount);
      ("UseAmortized", option_to_yojson nullable_boolean_to_yojson x.use_amortized);
    ]

let dimension_value_to_yojson = string_to_yojson
let dimension_values_to_yojson tree = list_to_yojson dimension_value_to_yojson tree
let generic_string_to_yojson = string_to_yojson

let cost_filters_to_yojson tree =
  map_to_yojson generic_string_to_yojson dimension_values_to_yojson tree

let planned_budget_limits_to_yojson tree =
  map_to_yojson generic_string_to_yojson spend_to_yojson tree

let budget_to_yojson (x : budget) =
  assoc_to_yojson
    [
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("BudgetLimit", option_to_yojson spend_to_yojson x.budget_limit);
      ( "PlannedBudgetLimits",
        option_to_yojson planned_budget_limits_to_yojson x.planned_budget_limits );
      ("CostFilters", option_to_yojson cost_filters_to_yojson x.cost_filters);
      ("CostTypes", option_to_yojson cost_types_to_yojson x.cost_types);
      ("TimeUnit", Some (time_unit_to_yojson x.time_unit));
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("CalculatedSpend", option_to_yojson calculated_spend_to_yojson x.calculated_spend);
      ("BudgetType", Some (budget_type_to_yojson x.budget_type));
      ("LastUpdatedTime", option_to_yojson generic_timestamp_to_yojson x.last_updated_time);
      ("AutoAdjustData", option_to_yojson auto_adjust_data_to_yojson x.auto_adjust_data);
      ("FilterExpression", option_to_yojson expression_to_yojson x.filter_expression);
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("HealthStatus", option_to_yojson health_status_to_yojson x.health_status);
    ]

let update_budget_request_to_yojson (x : update_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("NewBudget", Some (budget_to_yojson x.new_budget));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Key", Some (resource_tag_key_to_yojson x.key));
      ("Value", Some (resource_tag_value_to_yojson x.value));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let execution_type_to_yojson (x : execution_type) =
  match x with
  | ApproveBudgetAction -> `String "APPROVE_BUDGET_ACTION"
  | RetryBudgetAction -> `String "RETRY_BUDGET_ACTION"
  | ReverseBudgetAction -> `String "REVERSE_BUDGET_ACTION"
  | ResetBudgetAction -> `String "RESET_BUDGET_ACTION"

let execute_budget_action_response_to_yojson (x : execute_budget_action_response) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("ExecutionType", Some (execution_type_to_yojson x.execution_type));
    ]

let execute_budget_action_request_to_yojson (x : execute_budget_action_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("ExecutionType", Some (execution_type_to_yojson x.execution_type));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let expired_next_token_exception_to_yojson (x : expired_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let describe_subscribers_for_notification_response_to_yojson
    (x : describe_subscribers_for_notification_response) =
  assoc_to_yojson
    [
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let describe_subscribers_for_notification_request_to_yojson
    (x : describe_subscribers_for_notification_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let notifications_to_yojson tree = list_to_yojson notification_to_yojson tree

let describe_notifications_for_budget_response_to_yojson
    (x : describe_notifications_for_budget_response) =
  assoc_to_yojson
    [
      ("Notifications", option_to_yojson notifications_to_yojson x.notifications);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_notifications_for_budget_request_to_yojson
    (x : describe_notifications_for_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let budgets_to_yojson tree = list_to_yojson budget_to_yojson tree

let describe_budgets_response_to_yojson (x : describe_budgets_response) =
  assoc_to_yojson
    [
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let max_results_describe_budgets_to_yojson = int_to_yojson

let describe_budgets_request_to_yojson (x : describe_budgets_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("MaxResults", option_to_yojson max_results_describe_budgets_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("ShowFilterExpression", option_to_yojson nullable_boolean_to_yojson x.show_filter_expression);
    ]

let budgeted_and_actual_amounts_to_yojson (x : budgeted_and_actual_amounts) =
  assoc_to_yojson
    [
      ("BudgetedAmount", option_to_yojson spend_to_yojson x.budgeted_amount);
      ("ActualAmount", option_to_yojson spend_to_yojson x.actual_amount);
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
    ]

let budgeted_and_actual_amounts_list_to_yojson tree =
  list_to_yojson budgeted_and_actual_amounts_to_yojson tree

let budget_performance_history_to_yojson (x : budget_performance_history) =
  assoc_to_yojson
    [
      ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name);
      ("BudgetType", option_to_yojson budget_type_to_yojson x.budget_type);
      ("CostFilters", option_to_yojson cost_filters_to_yojson x.cost_filters);
      ("CostTypes", option_to_yojson cost_types_to_yojson x.cost_types);
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ( "BudgetedAndActualAmountsList",
        option_to_yojson budgeted_and_actual_amounts_list_to_yojson
          x.budgeted_and_actual_amounts_list );
      ("FilterExpression", option_to_yojson expression_to_yojson x.filter_expression);
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
    ]

let describe_budget_performance_history_response_to_yojson
    (x : describe_budget_performance_history_response) =
  assoc_to_yojson
    [
      ( "BudgetPerformanceHistory",
        option_to_yojson budget_performance_history_to_yojson x.budget_performance_history );
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_performance_history_request_to_yojson
    (x : describe_budget_performance_history_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let budget_notifications_for_account_to_yojson (x : budget_notifications_for_account) =
  assoc_to_yojson
    [
      ("Notifications", option_to_yojson notifications_to_yojson x.notifications);
      ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name);
    ]

let budget_notifications_for_account_list_to_yojson tree =
  list_to_yojson budget_notifications_for_account_to_yojson tree

let describe_budget_notifications_for_account_response_to_yojson
    (x : describe_budget_notifications_for_account_response) =
  assoc_to_yojson
    [
      ( "BudgetNotificationsForAccount",
        option_to_yojson budget_notifications_for_account_list_to_yojson
          x.budget_notifications_for_account );
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let max_results_budget_notifications_to_yojson = int_to_yojson

let describe_budget_notifications_for_account_request_to_yojson
    (x : describe_budget_notifications_for_account_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("MaxResults", option_to_yojson max_results_budget_notifications_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let actions_to_yojson tree = list_to_yojson action_to_yojson tree

let describe_budget_actions_for_budget_response_to_yojson
    (x : describe_budget_actions_for_budget_response) =
  assoc_to_yojson
    [
      ("Actions", Some (actions_to_yojson x.actions));
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_actions_for_budget_request_to_yojson
    (x : describe_budget_actions_for_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_actions_for_account_response_to_yojson
    (x : describe_budget_actions_for_account_response) =
  assoc_to_yojson
    [
      ("Actions", Some (actions_to_yojson x.actions));
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_actions_for_account_request_to_yojson
    (x : describe_budget_actions_for_account_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let action_history_details_to_yojson (x : action_history_details) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("Action", Some (action_to_yojson x.action));
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | System -> `String "SYSTEM"
  | CreateAction -> `String "CREATE_ACTION"
  | DeleteAction -> `String "DELETE_ACTION"
  | UpdateAction -> `String "UPDATE_ACTION"
  | ExecuteAction -> `String "EXECUTE_ACTION"

let action_history_to_yojson (x : action_history) =
  assoc_to_yojson
    [
      ("Timestamp", Some (generic_timestamp_to_yojson x.timestamp));
      ("Status", Some (action_status_to_yojson x.status));
      ("EventType", Some (event_type_to_yojson x.event_type));
      ("ActionHistoryDetails", Some (action_history_details_to_yojson x.action_history_details));
    ]

let action_histories_to_yojson tree = list_to_yojson action_history_to_yojson tree

let describe_budget_action_histories_response_to_yojson
    (x : describe_budget_action_histories_response) =
  assoc_to_yojson
    [
      ("ActionHistories", Some (action_histories_to_yojson x.action_histories));
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_action_histories_request_to_yojson
    (x : describe_budget_action_histories_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let describe_budget_action_response_to_yojson (x : describe_budget_action_response) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Action", Some (action_to_yojson x.action));
    ]

let describe_budget_action_request_to_yojson (x : describe_budget_action_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
    ]

let describe_budget_response_to_yojson (x : describe_budget_response) =
  assoc_to_yojson [ ("Budget", option_to_yojson budget_to_yojson x.budget) ]

let describe_budget_request_to_yojson (x : describe_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ShowFilterExpression", option_to_yojson nullable_boolean_to_yojson x.show_filter_expression);
    ]

let delete_subscriber_response_to_yojson = unit_to_yojson

let delete_subscriber_request_to_yojson (x : delete_subscriber_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
      ("Subscriber", Some (subscriber_to_yojson x.subscriber));
    ]

let delete_notification_response_to_yojson = unit_to_yojson

let delete_notification_request_to_yojson (x : delete_notification_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
    ]

let delete_budget_action_response_to_yojson (x : delete_budget_action_response) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Action", Some (action_to_yojson x.action));
    ]

let delete_budget_action_request_to_yojson (x : delete_budget_action_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
    ]

let delete_budget_response_to_yojson = unit_to_yojson

let delete_budget_request_to_yojson (x : delete_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
    ]

let creation_limit_exceeded_exception_to_yojson (x : creation_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_subscriber_response_to_yojson = unit_to_yojson

let create_subscriber_request_to_yojson (x : create_subscriber_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
      ("Subscriber", Some (subscriber_to_yojson x.subscriber));
    ]

let create_notification_response_to_yojson = unit_to_yojson

let create_notification_request_to_yojson (x : create_notification_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("Notification", Some (notification_to_yojson x.notification));
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
    ]

let create_budget_action_response_to_yojson (x : create_budget_action_response) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
    ]

let create_budget_action_request_to_yojson (x : create_budget_action_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
      ("ActionType", Some (action_type_to_yojson x.action_type));
      ("ActionThreshold", Some (action_threshold_to_yojson x.action_threshold));
      ("Definition", Some (definition_to_yojson x.definition));
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("ApprovalModel", Some (approval_model_to_yojson x.approval_model));
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let create_budget_response_to_yojson = unit_to_yojson

let notification_with_subscribers_to_yojson (x : notification_with_subscribers) =
  assoc_to_yojson
    [
      ("Notification", Some (notification_to_yojson x.notification));
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
    ]

let notification_with_subscribers_list_to_yojson tree =
  list_to_yojson notification_with_subscribers_to_yojson tree

let create_budget_request_to_yojson (x : create_budget_request) =
  assoc_to_yojson
    [
      ("AccountId", Some (account_id_to_yojson x.account_id));
      ("Budget", Some (budget_to_yojson x.budget));
      ( "NotificationsWithSubscribers",
        option_to_yojson notification_with_subscribers_list_to_yojson
          x.notifications_with_subscribers );
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]
