open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let user_to_yojson = string_to_yojson
let users_to_yojson tree = list_to_yojson user_to_yojson tree
let update_subscriber_response_to_yojson = unit_to_yojson
let account_id_to_yojson = string_to_yojson
let budget_name_to_yojson = string_to_yojson

let notification_type_to_yojson (x : notification_type) =
  match x with FORECASTED -> `String "FORECASTED" | ACTUAL -> `String "ACTUAL"

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | EQUAL_TO -> `String "EQUAL_TO"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"

let notification_threshold_to_yojson = double_to_yojson

let threshold_type_to_yojson (x : threshold_type) =
  match x with ABSOLUTE_VALUE -> `String "ABSOLUTE_VALUE" | PERCENTAGE -> `String "PERCENTAGE"

let notification_state_to_yojson (x : notification_state) =
  match x with ALARM -> `String "ALARM" | OK -> `String "OK"

let notification_to_yojson (x : notification) =
  assoc_to_yojson
    [
      ("NotificationState", option_to_yojson notification_state_to_yojson x.notification_state);
      ("ThresholdType", option_to_yojson threshold_type_to_yojson x.threshold_type);
      ("Threshold", Some (notification_threshold_to_yojson x.threshold));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
    ]

let subscription_type_to_yojson (x : subscription_type) =
  match x with EMAIL -> `String "EMAIL" | SNS -> `String "SNS"

let subscriber_address_to_yojson = string_to_yojson

let subscriber_to_yojson (x : subscriber) =
  assoc_to_yojson
    [
      ("Address", Some (subscriber_address_to_yojson x.address));
      ("SubscriptionType", Some (subscription_type_to_yojson x.subscription_type));
    ]

let update_subscriber_request_to_yojson (x : update_subscriber_request) =
  assoc_to_yojson
    [
      ("NewSubscriber", Some (subscriber_to_yojson x.new_subscriber));
      ("OldSubscriber", Some (subscriber_to_yojson x.old_subscriber));
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

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

let update_notification_response_to_yojson = unit_to_yojson

let update_notification_request_to_yojson (x : update_notification_request) =
  assoc_to_yojson
    [
      ("NewNotification", Some (notification_to_yojson x.new_notification));
      ("OldNotification", Some (notification_to_yojson x.old_notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let update_budget_response_to_yojson = unit_to_yojson
let numeric_value_to_yojson = string_to_yojson
let unit_value_to_yojson = string_to_yojson

let spend_to_yojson (x : spend) =
  assoc_to_yojson
    [
      ("Unit", Some (unit_value_to_yojson x.unit_));
      ("Amount", Some (numeric_value_to_yojson x.amount));
    ]

let generic_string_to_yojson = string_to_yojson

let planned_budget_limits_to_yojson tree =
  map_to_yojson generic_string_to_yojson spend_to_yojson tree

let dimension_value_to_yojson = string_to_yojson
let dimension_values_to_yojson tree = list_to_yojson dimension_value_to_yojson tree

let cost_filters_to_yojson tree =
  map_to_yojson generic_string_to_yojson dimension_values_to_yojson tree

let nullable_boolean_to_yojson = bool_to_yojson

let cost_types_to_yojson (x : cost_types) =
  assoc_to_yojson
    [
      ("UseAmortized", option_to_yojson nullable_boolean_to_yojson x.use_amortized);
      ("IncludeDiscount", option_to_yojson nullable_boolean_to_yojson x.include_discount);
      ("IncludeSupport", option_to_yojson nullable_boolean_to_yojson x.include_support);
      ( "IncludeOtherSubscription",
        option_to_yojson nullable_boolean_to_yojson x.include_other_subscription );
      ("IncludeRecurring", option_to_yojson nullable_boolean_to_yojson x.include_recurring);
      ("IncludeUpfront", option_to_yojson nullable_boolean_to_yojson x.include_upfront);
      ("IncludeCredit", option_to_yojson nullable_boolean_to_yojson x.include_credit);
      ("IncludeRefund", option_to_yojson nullable_boolean_to_yojson x.include_refund);
      ("UseBlended", option_to_yojson nullable_boolean_to_yojson x.use_blended);
      ("IncludeSubscription", option_to_yojson nullable_boolean_to_yojson x.include_subscription);
      ("IncludeTax", option_to_yojson nullable_boolean_to_yojson x.include_tax);
    ]

let time_unit_to_yojson (x : time_unit) =
  match x with
  | CUSTOM -> `String "CUSTOM"
  | ANNUALLY -> `String "ANNUALLY"
  | QUARTERLY -> `String "QUARTERLY"
  | MONTHLY -> `String "MONTHLY"
  | DAILY -> `String "DAILY"

let generic_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("End", option_to_yojson generic_timestamp_to_yojson x.end_);
      ("Start", option_to_yojson generic_timestamp_to_yojson x.start);
    ]

let calculated_spend_to_yojson (x : calculated_spend) =
  assoc_to_yojson
    [
      ("ForecastedSpend", option_to_yojson spend_to_yojson x.forecasted_spend);
      ("ActualSpend", Some (spend_to_yojson x.actual_spend));
    ]

let budget_type_to_yojson (x : budget_type) =
  match x with
  | SPCoverage -> `String "SAVINGS_PLANS_COVERAGE"
  | SPUtilization -> `String "SAVINGS_PLANS_UTILIZATION"
  | RICoverage -> `String "RI_COVERAGE"
  | RIUtilization -> `String "RI_UTILIZATION"
  | Cost -> `String "COST"
  | Usage -> `String "USAGE"

let auto_adjust_type_to_yojson (x : auto_adjust_type) =
  match x with FORECAST -> `String "FORECAST" | HISTORICAL -> `String "HISTORICAL"

let adjustment_period_to_yojson = int_to_yojson

let historical_options_to_yojson (x : historical_options) =
  assoc_to_yojson
    [
      ( "LookBackAvailablePeriods",
        option_to_yojson adjustment_period_to_yojson x.look_back_available_periods );
      ("BudgetAdjustmentPeriod", Some (adjustment_period_to_yojson x.budget_adjustment_period));
    ]

let auto_adjust_data_to_yojson (x : auto_adjust_data) =
  assoc_to_yojson
    [
      ("LastAutoAdjustTime", option_to_yojson generic_timestamp_to_yojson x.last_auto_adjust_time);
      ("HistoricalOptions", option_to_yojson historical_options_to_yojson x.historical_options);
      ("AutoAdjustType", Some (auto_adjust_type_to_yojson x.auto_adjust_type));
    ]

let dimension_to_yojson (x : dimension) =
  match x with
  | COST_CATEGORY_NAME -> `String "COST_CATEGORY_NAME"
  | TAG_KEY -> `String "TAG_KEY"
  | RESERVATION_MODIFIED -> `String "RESERVATION_MODIFIED"
  | PAYMENT_OPTION -> `String "PAYMENT_OPTION"
  | SAVINGS_PLAN_ARN -> `String "SAVINGS_PLAN_ARN"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | RIGHTSIZING_TYPE -> `String "RIGHTSIZING_TYPE"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | INVOICING_ENTITY -> `String "INVOICING_ENTITY"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | PLATFORM -> `String "PLATFORM"
  | SCOPE -> `String "SCOPE"
  | TENANCY -> `String "TENANCY"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | SERVICE -> `String "SERVICE"
  | REGION -> `String "REGION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | OPERATION -> `String "OPERATION"
  | LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | AZ -> `String "AZ"

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

let expression_dimension_values_to_yojson (x : expression_dimension_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", Some (values_to_yojson x.values));
      ("Key", Some (dimension_to_yojson x.key));
    ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("Key", option_to_yojson cost_category_name_to_yojson x.key);
    ]

let rec expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("CostCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
      ("Tags", option_to_yojson tag_values_to_yojson x.tags);
      ("Dimensions", option_to_yojson expression_dimension_values_to_yojson x.dimensions);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
    ]

and expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

let metric_to_yojson (x : metric) =
  match x with
  | HOURS -> `String "Hours"
  | NORMALIZED_USAGE_AMOUNT -> `String "NormalizedUsageAmount"
  | USAGE_QUANTITY -> `String "UsageQuantity"
  | NET_AMORTIZED_COST -> `String "NetAmortizedCost"
  | NET_UNBLENDED_COST -> `String "NetUnblendedCost"
  | AMORTIZED_COST -> `String "AmortizedCost"
  | UNBLENDED_COST -> `String "UnblendedCost"
  | BLENDED_COST -> `String "BlendedCost"

let metrics_to_yojson tree = list_to_yojson metric_to_yojson tree
let billing_view_arn_to_yojson = string_to_yojson

let health_status_value_to_yojson (x : health_status_value) =
  match x with UNHEALTHY -> `String "UNHEALTHY" | HEALTHY -> `String "HEALTHY"

let health_status_reason_to_yojson (x : health_status_reason) =
  match x with
  | MULTI_YEAR_HISTORICAL_DATA_DISABLED -> `String "MULTI_YEAR_HISTORICAL_DATA_DISABLED"
  | FILTER_INVALID -> `String "FILTER_INVALID"
  | BILLING_VIEW_UNHEALTHY -> `String "BILLING_VIEW_UNHEALTHY"
  | BILLING_VIEW_NO_ACCESS -> `String "BILLING_VIEW_NO_ACCESS"

let health_status_to_yojson (x : health_status) =
  assoc_to_yojson
    [
      ("LastUpdatedTime", option_to_yojson generic_timestamp_to_yojson x.last_updated_time);
      ("StatusReason", option_to_yojson health_status_reason_to_yojson x.status_reason);
      ("Status", option_to_yojson health_status_value_to_yojson x.status);
    ]

let budget_to_yojson (x : budget) =
  assoc_to_yojson
    [
      ("HealthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("FilterExpression", option_to_yojson expression_to_yojson x.filter_expression);
      ("AutoAdjustData", option_to_yojson auto_adjust_data_to_yojson x.auto_adjust_data);
      ("LastUpdatedTime", option_to_yojson generic_timestamp_to_yojson x.last_updated_time);
      ("BudgetType", Some (budget_type_to_yojson x.budget_type));
      ("CalculatedSpend", option_to_yojson calculated_spend_to_yojson x.calculated_spend);
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("TimeUnit", Some (time_unit_to_yojson x.time_unit));
      ("CostTypes", option_to_yojson cost_types_to_yojson x.cost_types);
      ("CostFilters", option_to_yojson cost_filters_to_yojson x.cost_filters);
      ( "PlannedBudgetLimits",
        option_to_yojson planned_budget_limits_to_yojson x.planned_budget_limits );
      ("BudgetLimit", option_to_yojson spend_to_yojson x.budget_limit);
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
    ]

let update_budget_request_to_yojson (x : update_budget_request) =
  assoc_to_yojson
    [
      ("NewBudget", Some (budget_to_yojson x.new_budget));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let action_id_to_yojson = string_to_yojson

let action_type_to_yojson (x : action_type) =
  match x with
  | SSM -> `String "RUN_SSM_DOCUMENTS"
  | SCP -> `String "APPLY_SCP_POLICY"
  | IAM -> `String "APPLY_IAM_POLICY"

let action_threshold_to_yojson (x : action_threshold) =
  assoc_to_yojson
    [
      ("ActionThresholdType", Some (threshold_type_to_yojson x.action_threshold_type));
      ("ActionThresholdValue", Some (notification_threshold_to_yojson x.action_threshold_value));
    ]

let policy_arn_to_yojson = string_to_yojson
let role_to_yojson = string_to_yojson
let roles_to_yojson tree = list_to_yojson role_to_yojson tree
let group_to_yojson = string_to_yojson
let groups_to_yojson tree = list_to_yojson group_to_yojson tree

let iam_action_definition_to_yojson (x : iam_action_definition) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson users_to_yojson x.users);
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("PolicyArn", Some (policy_arn_to_yojson x.policy_arn));
    ]

let policy_id_to_yojson = string_to_yojson
let target_id_to_yojson = string_to_yojson
let target_ids_to_yojson tree = list_to_yojson target_id_to_yojson tree

let scp_action_definition_to_yojson (x : scp_action_definition) =
  assoc_to_yojson
    [
      ("TargetIds", Some (target_ids_to_yojson x.target_ids));
      ("PolicyId", Some (policy_id_to_yojson x.policy_id));
    ]

let action_sub_type_to_yojson (x : action_sub_type) =
  match x with STOP_RDS -> `String "STOP_RDS_INSTANCES" | STOP_EC2 -> `String "STOP_EC2_INSTANCES"

let region_to_yojson = string_to_yojson
let instance_id_to_yojson = string_to_yojson
let instance_ids_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let ssm_action_definition_to_yojson (x : ssm_action_definition) =
  assoc_to_yojson
    [
      ("InstanceIds", Some (instance_ids_to_yojson x.instance_ids));
      ("Region", Some (region_to_yojson x.region));
      ("ActionSubType", Some (action_sub_type_to_yojson x.action_sub_type));
    ]

let definition_to_yojson (x : definition) =
  assoc_to_yojson
    [
      ( "SsmActionDefinition",
        option_to_yojson ssm_action_definition_to_yojson x.ssm_action_definition );
      ( "ScpActionDefinition",
        option_to_yojson scp_action_definition_to_yojson x.scp_action_definition );
      ( "IamActionDefinition",
        option_to_yojson iam_action_definition_to_yojson x.iam_action_definition );
    ]

let role_arn_to_yojson = string_to_yojson

let approval_model_to_yojson (x : approval_model) =
  match x with MANUAL -> `String "MANUAL" | AUTO -> `String "AUTOMATIC"

let action_status_to_yojson (x : action_status) =
  match x with
  | Reset_Failure -> `String "RESET_FAILURE"
  | Reset_In_Progress -> `String "RESET_IN_PROGRESS"
  | Reverse_Failure -> `String "REVERSE_FAILURE"
  | Reverse_Success -> `String "REVERSE_SUCCESS"
  | Reverse_In_Progress -> `String "REVERSE_IN_PROGRESS"
  | Execution_Failure -> `String "EXECUTION_FAILURE"
  | Execution_Success -> `String "EXECUTION_SUCCESS"
  | Execution_In_Progress -> `String "EXECUTION_IN_PROGRESS"
  | Pending -> `String "PENDING"
  | Standby -> `String "STANDBY"

let subscribers_to_yojson tree = list_to_yojson subscriber_to_yojson tree

let action_to_yojson (x : action) =
  assoc_to_yojson
    [
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("Status", Some (action_status_to_yojson x.status));
      ("ApprovalModel", Some (approval_model_to_yojson x.approval_model));
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("Definition", Some (definition_to_yojson x.definition));
      ("ActionThreshold", Some (action_threshold_to_yojson x.action_threshold));
      ("ActionType", Some (action_type_to_yojson x.action_type));
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ActionId", Some (action_id_to_yojson x.action_id));
    ]

let update_budget_action_response_to_yojson (x : update_budget_action_response) =
  assoc_to_yojson
    [
      ("NewAction", Some (action_to_yojson x.new_action));
      ("OldAction", Some (action_to_yojson x.old_action));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let update_budget_action_request_to_yojson (x : update_budget_action_request) =
  assoc_to_yojson
    [
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
      ("ApprovalModel", option_to_yojson approval_model_to_yojson x.approval_model);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("Definition", option_to_yojson definition_to_yojson x.definition);
      ("ActionThreshold", option_to_yojson action_threshold_to_yojson x.action_threshold);
      ("NotificationType", option_to_yojson notification_type_to_yojson x.notification_type);
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let resource_locked_exception_to_yojson (x : resource_locked_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Value", Some (resource_tag_value_to_yojson x.value));
      ("Key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let notifications_to_yojson tree = list_to_yojson notification_to_yojson tree

let notification_with_subscribers_to_yojson (x : notification_with_subscribers) =
  assoc_to_yojson
    [
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("Notification", Some (notification_to_yojson x.notification));
    ]

let notification_with_subscribers_list_to_yojson tree =
  list_to_yojson notification_with_subscribers_to_yojson tree

let max_results_describe_budgets_to_yojson = int_to_yojson
let max_results_budget_notifications_to_yojson = int_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let expired_next_token_exception_to_yojson (x : expired_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let execution_type_to_yojson (x : execution_type) =
  match x with
  | ResetBudgetAction -> `String "RESET_BUDGET_ACTION"
  | ReverseBudgetAction -> `String "REVERSE_BUDGET_ACTION"
  | RetryBudgetAction -> `String "RETRY_BUDGET_ACTION"
  | ApproveBudgetAction -> `String "APPROVE_BUDGET_ACTION"

let execute_budget_action_response_to_yojson (x : execute_budget_action_response) =
  assoc_to_yojson
    [
      ("ExecutionType", Some (execution_type_to_yojson x.execution_type));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let execute_budget_action_request_to_yojson (x : execute_budget_action_request) =
  assoc_to_yojson
    [
      ("ExecutionType", Some (execution_type_to_yojson x.execution_type));
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | ExecuteAction -> `String "EXECUTE_ACTION"
  | UpdateAction -> `String "UPDATE_ACTION"
  | DeleteAction -> `String "DELETE_ACTION"
  | CreateAction -> `String "CREATE_ACTION"
  | System -> `String "SYSTEM"

let describe_subscribers_for_notification_response_to_yojson
    (x : describe_subscribers_for_notification_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
    ]

let describe_subscribers_for_notification_request_to_yojson
    (x : describe_subscribers_for_notification_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let describe_notifications_for_budget_response_to_yojson
    (x : describe_notifications_for_budget_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Notifications", option_to_yojson notifications_to_yojson x.notifications);
    ]

let describe_notifications_for_budget_request_to_yojson
    (x : describe_notifications_for_budget_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let budgets_to_yojson tree = list_to_yojson budget_to_yojson tree

let describe_budgets_response_to_yojson (x : describe_budgets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
    ]

let describe_budgets_request_to_yojson (x : describe_budgets_request) =
  assoc_to_yojson
    [
      ("ShowFilterExpression", option_to_yojson nullable_boolean_to_yojson x.show_filter_expression);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_describe_budgets_to_yojson x.max_results);
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let describe_budget_response_to_yojson (x : describe_budget_response) =
  assoc_to_yojson [ ("Budget", option_to_yojson budget_to_yojson x.budget) ]

let describe_budget_request_to_yojson (x : describe_budget_request) =
  assoc_to_yojson
    [
      ("ShowFilterExpression", option_to_yojson nullable_boolean_to_yojson x.show_filter_expression);
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let budgeted_and_actual_amounts_to_yojson (x : budgeted_and_actual_amounts) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("ActualAmount", option_to_yojson spend_to_yojson x.actual_amount);
      ("BudgetedAmount", option_to_yojson spend_to_yojson x.budgeted_amount);
    ]

let budgeted_and_actual_amounts_list_to_yojson tree =
  list_to_yojson budgeted_and_actual_amounts_to_yojson tree

let budget_performance_history_to_yojson (x : budget_performance_history) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("FilterExpression", option_to_yojson expression_to_yojson x.filter_expression);
      ( "BudgetedAndActualAmountsList",
        option_to_yojson budgeted_and_actual_amounts_list_to_yojson
          x.budgeted_and_actual_amounts_list );
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("CostTypes", option_to_yojson cost_types_to_yojson x.cost_types);
      ("CostFilters", option_to_yojson cost_filters_to_yojson x.cost_filters);
      ("BudgetType", option_to_yojson budget_type_to_yojson x.budget_type);
      ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name);
    ]

let describe_budget_performance_history_response_to_yojson
    (x : describe_budget_performance_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ( "BudgetPerformanceHistory",
        option_to_yojson budget_performance_history_to_yojson x.budget_performance_history );
    ]

let describe_budget_performance_history_request_to_yojson
    (x : describe_budget_performance_history_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let budget_notifications_for_account_to_yojson (x : budget_notifications_for_account) =
  assoc_to_yojson
    [
      ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name);
      ("Notifications", option_to_yojson notifications_to_yojson x.notifications);
    ]

let budget_notifications_for_account_list_to_yojson tree =
  list_to_yojson budget_notifications_for_account_to_yojson tree

let describe_budget_notifications_for_account_response_to_yojson
    (x : describe_budget_notifications_for_account_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ( "BudgetNotificationsForAccount",
        option_to_yojson budget_notifications_for_account_list_to_yojson
          x.budget_notifications_for_account );
    ]

let describe_budget_notifications_for_account_request_to_yojson
    (x : describe_budget_notifications_for_account_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_budget_notifications_to_yojson x.max_results);
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let actions_to_yojson tree = list_to_yojson action_to_yojson tree

let describe_budget_actions_for_budget_response_to_yojson
    (x : describe_budget_actions_for_budget_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Actions", Some (actions_to_yojson x.actions));
    ]

let describe_budget_actions_for_budget_request_to_yojson
    (x : describe_budget_actions_for_budget_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let describe_budget_actions_for_account_response_to_yojson
    (x : describe_budget_actions_for_account_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("Actions", Some (actions_to_yojson x.actions));
    ]

let describe_budget_actions_for_account_request_to_yojson
    (x : describe_budget_actions_for_account_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let describe_budget_action_response_to_yojson (x : describe_budget_action_response) =
  assoc_to_yojson
    [
      ("Action", Some (action_to_yojson x.action));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let describe_budget_action_request_to_yojson (x : describe_budget_action_request) =
  assoc_to_yojson
    [
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let action_history_details_to_yojson (x : action_history_details) =
  assoc_to_yojson
    [
      ("Action", Some (action_to_yojson x.action));
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let action_history_to_yojson (x : action_history) =
  assoc_to_yojson
    [
      ("ActionHistoryDetails", Some (action_history_details_to_yojson x.action_history_details));
      ("EventType", Some (event_type_to_yojson x.event_type));
      ("Status", Some (action_status_to_yojson x.status));
      ("Timestamp", Some (generic_timestamp_to_yojson x.timestamp));
    ]

let action_histories_to_yojson tree = list_to_yojson action_history_to_yojson tree

let describe_budget_action_histories_response_to_yojson
    (x : describe_budget_action_histories_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("ActionHistories", Some (action_histories_to_yojson x.action_histories));
    ]

let describe_budget_action_histories_request_to_yojson
    (x : describe_budget_action_histories_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("TimePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_subscriber_response_to_yojson = unit_to_yojson

let delete_subscriber_request_to_yojson (x : delete_subscriber_request) =
  assoc_to_yojson
    [
      ("Subscriber", Some (subscriber_to_yojson x.subscriber));
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_notification_response_to_yojson = unit_to_yojson

let delete_notification_request_to_yojson (x : delete_notification_request) =
  assoc_to_yojson
    [
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_budget_response_to_yojson = unit_to_yojson

let delete_budget_request_to_yojson (x : delete_budget_request) =
  assoc_to_yojson
    [
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_budget_action_response_to_yojson (x : delete_budget_action_response) =
  assoc_to_yojson
    [
      ("Action", Some (action_to_yojson x.action));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let delete_budget_action_request_to_yojson (x : delete_budget_action_request) =
  assoc_to_yojson
    [
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let creation_limit_exceeded_exception_to_yojson (x : creation_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_subscriber_response_to_yojson = unit_to_yojson

let create_subscriber_request_to_yojson (x : create_subscriber_request) =
  assoc_to_yojson
    [
      ("Subscriber", Some (subscriber_to_yojson x.subscriber));
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let create_notification_response_to_yojson = unit_to_yojson

let create_notification_request_to_yojson (x : create_notification_request) =
  assoc_to_yojson
    [
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("Notification", Some (notification_to_yojson x.notification));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let create_budget_response_to_yojson = unit_to_yojson

let create_budget_request_to_yojson (x : create_budget_request) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "NotificationsWithSubscribers",
        option_to_yojson notification_with_subscribers_list_to_yojson
          x.notifications_with_subscribers );
      ("Budget", Some (budget_to_yojson x.budget));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let create_budget_action_response_to_yojson (x : create_budget_action_response) =
  assoc_to_yojson
    [
      ("ActionId", Some (action_id_to_yojson x.action_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]

let create_budget_action_request_to_yojson (x : create_budget_action_request) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("ApprovalModel", Some (approval_model_to_yojson x.approval_model));
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("Definition", Some (definition_to_yojson x.definition));
      ("ActionThreshold", Some (action_threshold_to_yojson x.action_threshold));
      ("ActionType", Some (action_type_to_yojson x.action_type));
      ("NotificationType", Some (notification_type_to_yojson x.notification_type));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("AccountId", Some (account_id_to_yojson x.account_id));
    ]
