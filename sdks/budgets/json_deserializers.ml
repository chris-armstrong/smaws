open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

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

let update_subscriber_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let subscriber_address_of_yojson = string_of_yojson

let subscription_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNS" -> SNS
    | `String "EMAIL" -> EMAIL
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriptionType")
     : subscription_type)
    : subscription_type)

let subscriber_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_type = value_for_key subscription_type_of_yojson "SubscriptionType" _list path;
     address = value_for_key subscriber_address_of_yojson "Address" _list path;
   }
    : subscriber)

let notification_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "OK" -> OK
    | `String "ALARM" -> ALARM
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationState" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationState")
     : notification_state)
    : notification_state)

let threshold_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERCENTAGE" -> PERCENTAGE
    | `String "ABSOLUTE_VALUE" -> ABSOLUTE_VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThresholdType" value)
    | _ -> raise (deserialize_wrong_type_error path "ThresholdType")
     : threshold_type)
    : threshold_type)

let notification_threshold_of_yojson = double_of_yojson

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "LESS_THAN" -> LESS_THAN
    | `String "EQUAL_TO" -> EQUAL_TO
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let notification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTUAL" -> ACTUAL
    | `String "FORECASTED" -> FORECASTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationType")
     : notification_type)
    : notification_type)

let notification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     threshold = value_for_key notification_threshold_of_yojson "Threshold" _list path;
     threshold_type =
       option_of_yojson (value_for_key threshold_type_of_yojson "ThresholdType") _list path;
     notification_state =
       option_of_yojson (value_for_key notification_state_of_yojson "NotificationState") _list path;
   }
    : notification)

let budget_name_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson

let update_subscriber_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     old_subscriber = value_for_key subscriber_of_yojson "OldSubscriber" _list path;
     new_subscriber = value_for_key subscriber_of_yojson "NewSubscriber" _list path;
   }
    : update_subscriber_request)

let update_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     old_notification = value_for_key notification_of_yojson "OldNotification" _list path;
     new_notification = value_for_key notification_of_yojson "NewNotification" _list path;
   }
    : update_notification_request)

let resource_locked_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_locked_exception)

let subscribers_of_yojson tree path = list_of_yojson subscriber_of_yojson tree path

let action_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDBY" -> Standby
    | `String "PENDING" -> Pending
    | `String "EXECUTION_IN_PROGRESS" -> Execution_In_Progress
    | `String "EXECUTION_SUCCESS" -> Execution_Success
    | `String "EXECUTION_FAILURE" -> Execution_Failure
    | `String "REVERSE_IN_PROGRESS" -> Reverse_In_Progress
    | `String "REVERSE_SUCCESS" -> Reverse_Success
    | `String "REVERSE_FAILURE" -> Reverse_Failure
    | `String "RESET_IN_PROGRESS" -> Reset_In_Progress
    | `String "RESET_FAILURE" -> Reset_Failure
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionStatus")
     : action_status)
    : action_status)

let approval_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTO
    | `String "MANUAL" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApprovalModel" value)
    | _ -> raise (deserialize_wrong_type_error path "ApprovalModel")
     : approval_model)
    : approval_model)

let role_arn_of_yojson = string_of_yojson
let instance_id_of_yojson = string_of_yojson
let instance_ids_of_yojson tree path = list_of_yojson instance_id_of_yojson tree path
let region_of_yojson = string_of_yojson

let action_sub_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOP_EC2_INSTANCES" -> STOP_EC2
    | `String "STOP_RDS_INSTANCES" -> STOP_RDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionSubType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionSubType")
     : action_sub_type)
    : action_sub_type)

let ssm_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_sub_type = value_for_key action_sub_type_of_yojson "ActionSubType" _list path;
     region = value_for_key region_of_yojson "Region" _list path;
     instance_ids = value_for_key instance_ids_of_yojson "InstanceIds" _list path;
   }
    : ssm_action_definition)

let target_id_of_yojson = string_of_yojson
let target_ids_of_yojson tree path = list_of_yojson target_id_of_yojson tree path
let policy_id_of_yojson = string_of_yojson

let scp_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_id = value_for_key policy_id_of_yojson "PolicyId" _list path;
     target_ids = value_for_key target_ids_of_yojson "TargetIds" _list path;
   }
    : scp_action_definition)

let user_of_yojson = string_of_yojson
let users_of_yojson tree path = list_of_yojson user_of_yojson tree path
let group_of_yojson = string_of_yojson
let groups_of_yojson tree path = list_of_yojson group_of_yojson tree path
let role_of_yojson = string_of_yojson
let roles_of_yojson tree path = list_of_yojson role_of_yojson tree path
let policy_arn_of_yojson = string_of_yojson

let iam_action_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_arn = value_for_key policy_arn_of_yojson "PolicyArn" _list path;
     roles = option_of_yojson (value_for_key roles_of_yojson "Roles") _list path;
     groups = option_of_yojson (value_for_key groups_of_yojson "Groups") _list path;
     users = option_of_yojson (value_for_key users_of_yojson "Users") _list path;
   }
    : iam_action_definition)

let definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_action_definition =
       option_of_yojson
         (value_for_key iam_action_definition_of_yojson "IamActionDefinition")
         _list path;
     scp_action_definition =
       option_of_yojson
         (value_for_key scp_action_definition_of_yojson "ScpActionDefinition")
         _list path;
     ssm_action_definition =
       option_of_yojson
         (value_for_key ssm_action_definition_of_yojson "SsmActionDefinition")
         _list path;
   }
    : definition)

let action_threshold_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_threshold_value =
       value_for_key notification_threshold_of_yojson "ActionThresholdValue" _list path;
     action_threshold_type = value_for_key threshold_type_of_yojson "ActionThresholdType" _list path;
   }
    : action_threshold)

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLY_IAM_POLICY" -> IAM
    | `String "APPLY_SCP_POLICY" -> SCP
    | `String "RUN_SSM_DOCUMENTS" -> SSM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let action_id_of_yojson = string_of_yojson

let action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
     action_type = value_for_key action_type_of_yojson "ActionType" _list path;
     action_threshold = value_for_key action_threshold_of_yojson "ActionThreshold" _list path;
     definition = value_for_key definition_of_yojson "Definition" _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "ExecutionRoleArn" _list path;
     approval_model = value_for_key approval_model_of_yojson "ApprovalModel" _list path;
     status = value_for_key action_status_of_yojson "Status" _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
   }
    : action)

let update_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     old_action = value_for_key action_of_yojson "OldAction" _list path;
     new_action = value_for_key action_of_yojson "NewAction" _list path;
   }
    : update_budget_action_response)

let update_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     notification_type =
       option_of_yojson (value_for_key notification_type_of_yojson "NotificationType") _list path;
     action_threshold =
       option_of_yojson (value_for_key action_threshold_of_yojson "ActionThreshold") _list path;
     definition = option_of_yojson (value_for_key definition_of_yojson "Definition") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "ExecutionRoleArn") _list path;
     approval_model =
       option_of_yojson (value_for_key approval_model_of_yojson "ApprovalModel") _list path;
     subscribers = option_of_yojson (value_for_key subscribers_of_yojson "Subscribers") _list path;
   }
    : update_budget_action_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let billing_view_health_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : billing_view_health_status_exception)

let update_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let generic_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let health_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "BILLING_VIEW_NO_ACCESS" -> BILLING_VIEW_NO_ACCESS
    | `String "BILLING_VIEW_UNHEALTHY" -> BILLING_VIEW_UNHEALTHY
    | `String "FILTER_INVALID" -> FILTER_INVALID
    | `String "MULTI_YEAR_HISTORICAL_DATA_DISABLED" -> MULTI_YEAR_HISTORICAL_DATA_DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusReason")
     : health_status_reason)
    : health_status_reason)

let health_status_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusValue" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusValue")
     : health_status_value)
    : health_status_value)

let health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key health_status_value_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson (value_for_key health_status_reason_of_yojson "StatusReason") _list path;
     last_updated_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastUpdatedTime") _list path;
   }
    : health_status)

let billing_view_arn_of_yojson = string_of_yojson

let metric_of_yojson (tree : t) path =
  ((match tree with
    | `String "BlendedCost" -> BLENDED_COST
    | `String "UnblendedCost" -> UNBLENDED_COST
    | `String "AmortizedCost" -> AMORTIZED_COST
    | `String "NetUnblendedCost" -> NET_UNBLENDED_COST
    | `String "NetAmortizedCost" -> NET_AMORTIZED_COST
    | `String "UsageQuantity" -> USAGE_QUANTITY
    | `String "NormalizedUsageAmount" -> NORMALIZED_USAGE_AMOUNT
    | `String "Hours" -> HOURS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Metric" value)
    | _ -> raise (deserialize_wrong_type_error path "Metric")
     : metric)
    : metric)

let metrics_of_yojson tree path = list_of_yojson metric_of_yojson tree path

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
let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path
let cost_category_name_of_yojson = string_of_yojson

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key cost_category_name_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : cost_category_values)

let tag_key_of_yojson = string_of_yojson

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : tag_values)

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "AZ" -> AZ
    | `String "INSTANCE_TYPE" -> INSTANCE_TYPE
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "LINKED_ACCOUNT_NAME" -> LINKED_ACCOUNT_NAME
    | `String "OPERATION" -> OPERATION
    | `String "PURCHASE_TYPE" -> PURCHASE_TYPE
    | `String "REGION" -> REGION
    | `String "SERVICE" -> SERVICE
    | `String "SERVICE_CODE" -> SERVICE_CODE
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "USAGE_TYPE_GROUP" -> USAGE_TYPE_GROUP
    | `String "RECORD_TYPE" -> RECORD_TYPE
    | `String "OPERATING_SYSTEM" -> OPERATING_SYSTEM
    | `String "TENANCY" -> TENANCY
    | `String "SCOPE" -> SCOPE
    | `String "PLATFORM" -> PLATFORM
    | `String "SUBSCRIPTION_ID" -> SUBSCRIPTION_ID
    | `String "LEGAL_ENTITY_NAME" -> LEGAL_ENTITY_NAME
    | `String "INVOICING_ENTITY" -> INVOICING_ENTITY
    | `String "DEPLOYMENT_OPTION" -> DEPLOYMENT_OPTION
    | `String "DATABASE_ENGINE" -> DATABASE_ENGINE
    | `String "CACHE_ENGINE" -> CACHE_ENGINE
    | `String "INSTANCE_TYPE_FAMILY" -> INSTANCE_TYPE_FAMILY
    | `String "BILLING_ENTITY" -> BILLING_ENTITY
    | `String "RESERVATION_ID" -> RESERVATION_ID
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String "RIGHTSIZING_TYPE" -> RIGHTSIZING_TYPE
    | `String "SAVINGS_PLANS_TYPE" -> SAVINGS_PLANS_TYPE
    | `String "SAVINGS_PLAN_ARN" -> SAVINGS_PLAN_ARN
    | `String "PAYMENT_OPTION" -> PAYMENT_OPTION
    | `String "RESERVATION_MODIFIED" -> RESERVATION_MODIFIED
    | `String "TAG_KEY" -> TAG_KEY
    | `String "COST_CATEGORY_NAME" -> COST_CATEGORY_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let expression_dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key dimension_of_yojson "Key" _list path;
     values = value_for_key values_of_yojson "Values" _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : expression_dimension_values)

let rec expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

and expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     \#or = option_of_yojson (value_for_key expressions_of_yojson "Or") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "And") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "Not") _list path;
     dimensions =
       option_of_yojson
         (value_for_key expression_dimension_values_of_yojson "Dimensions")
         _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "Tags") _list path;
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "CostCategories") _list path;
   }
    : expression)

let adjustment_period_of_yojson = int_of_yojson

let historical_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_adjustment_period =
       value_for_key adjustment_period_of_yojson "BudgetAdjustmentPeriod" _list path;
     look_back_available_periods =
       option_of_yojson
         (value_for_key adjustment_period_of_yojson "LookBackAvailablePeriods")
         _list path;
   }
    : historical_options)

let auto_adjust_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HISTORICAL" -> HISTORICAL
    | `String "FORECAST" -> FORECAST
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoAdjustType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoAdjustType")
     : auto_adjust_type)
    : auto_adjust_type)

let auto_adjust_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_adjust_type = value_for_key auto_adjust_type_of_yojson "AutoAdjustType" _list path;
     historical_options =
       option_of_yojson (value_for_key historical_options_of_yojson "HistoricalOptions") _list path;
     last_auto_adjust_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastAutoAdjustTime") _list path;
   }
    : auto_adjust_data)

let budget_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "USAGE" -> Usage
    | `String "COST" -> Cost
    | `String "RI_UTILIZATION" -> RIUtilization
    | `String "RI_COVERAGE" -> RICoverage
    | `String "SAVINGS_PLANS_UTILIZATION" -> SPUtilization
    | `String "SAVINGS_PLANS_COVERAGE" -> SPCoverage
    | `String value -> raise (deserialize_unknown_enum_value_error path "BudgetType" value)
    | _ -> raise (deserialize_wrong_type_error path "BudgetType")
     : budget_type)
    : budget_type)

let unit_value_of_yojson = string_of_yojson
let numeric_value_of_yojson = string_of_yojson

let spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = value_for_key numeric_value_of_yojson "Amount" _list path;
     unit_ = value_for_key unit_value_of_yojson "Unit" _list path;
   }
    : spend)

let calculated_spend_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actual_spend = value_for_key spend_of_yojson "ActualSpend" _list path;
     forecasted_spend =
       option_of_yojson (value_for_key spend_of_yojson "ForecastedSpend") _list path;
   }
    : calculated_spend)

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = option_of_yojson (value_for_key generic_timestamp_of_yojson "Start") _list path;
     end_ = option_of_yojson (value_for_key generic_timestamp_of_yojson "End") _list path;
   }
    : time_period)

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAILY" -> DAILY
    | `String "MONTHLY" -> MONTHLY
    | `String "QUARTERLY" -> QUARTERLY
    | `String "ANNUALLY" -> ANNUALLY
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let nullable_boolean_of_yojson = bool_of_yojson

let cost_types_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_tax =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeTax") _list path;
     include_subscription =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeSubscription") _list path;
     use_blended =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "UseBlended") _list path;
     include_refund =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeRefund") _list path;
     include_credit =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeCredit") _list path;
     include_upfront =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeUpfront") _list path;
     include_recurring =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeRecurring") _list path;
     include_other_subscription =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "IncludeOtherSubscription")
         _list path;
     include_support =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeSupport") _list path;
     include_discount =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "IncludeDiscount") _list path;
     use_amortized =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "UseAmortized") _list path;
   }
    : cost_types)

let dimension_value_of_yojson = string_of_yojson
let dimension_values_of_yojson tree path = list_of_yojson dimension_value_of_yojson tree path
let generic_string_of_yojson = string_of_yojson

let cost_filters_of_yojson tree path =
  map_of_yojson generic_string_of_yojson dimension_values_of_yojson tree path

let planned_budget_limits_of_yojson tree path =
  map_of_yojson generic_string_of_yojson spend_of_yojson tree path

let budget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     budget_limit = option_of_yojson (value_for_key spend_of_yojson "BudgetLimit") _list path;
     planned_budget_limits =
       option_of_yojson
         (value_for_key planned_budget_limits_of_yojson "PlannedBudgetLimits")
         _list path;
     cost_filters = option_of_yojson (value_for_key cost_filters_of_yojson "CostFilters") _list path;
     cost_types = option_of_yojson (value_for_key cost_types_of_yojson "CostTypes") _list path;
     time_unit = value_for_key time_unit_of_yojson "TimeUnit" _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     calculated_spend =
       option_of_yojson (value_for_key calculated_spend_of_yojson "CalculatedSpend") _list path;
     budget_type = value_for_key budget_type_of_yojson "BudgetType" _list path;
     last_updated_time =
       option_of_yojson (value_for_key generic_timestamp_of_yojson "LastUpdatedTime") _list path;
     auto_adjust_data =
       option_of_yojson (value_for_key auto_adjust_data_of_yojson "AutoAdjustData") _list path;
     filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "FilterExpression") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     health_status =
       option_of_yojson (value_for_key health_status_of_yojson "HealthStatus") _list path;
   }
    : budget)

let update_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     new_budget = value_for_key budget_of_yojson "NewBudget" _list path;
   }
    : update_budget_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path
let amazon_resource_name_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "ResourceTagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
     value = value_for_key resource_tag_value_of_yojson "Value" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     resource_tags = value_for_key resource_tag_list_of_yojson "ResourceTags" _list path;
   }
    : tag_resource_request)

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

let execution_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPROVE_BUDGET_ACTION" -> ApproveBudgetAction
    | `String "RETRY_BUDGET_ACTION" -> RetryBudgetAction
    | `String "REVERSE_BUDGET_ACTION" -> ReverseBudgetAction
    | `String "RESET_BUDGET_ACTION" -> ResetBudgetAction
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionType")
     : execution_type)
    : execution_type)

let execute_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     execution_type = value_for_key execution_type_of_yojson "ExecutionType" _list path;
   }
    : execute_budget_action_response)

let execute_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     execution_type = value_for_key execution_type_of_yojson "ExecutionType" _list path;
   }
    : execute_budget_action_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let expired_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : expired_next_token_exception)

let describe_subscribers_for_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribers = option_of_yojson (value_for_key subscribers_of_yojson "Subscribers") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_subscribers_for_notification_response)

let max_results_of_yojson = int_of_yojson

let describe_subscribers_for_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_subscribers_for_notification_request)

let notifications_of_yojson tree path = list_of_yojson notification_of_yojson tree path

let describe_notifications_for_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notifications =
       option_of_yojson (value_for_key notifications_of_yojson "Notifications") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_notifications_for_budget_response)

let describe_notifications_for_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_notifications_for_budget_request)

let budgets_of_yojson tree path = list_of_yojson budget_of_yojson tree path

let describe_budgets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budgets = option_of_yojson (value_for_key budgets_of_yojson "Budgets") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budgets_response)

let max_results_describe_budgets_of_yojson = int_of_yojson

let describe_budgets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     max_results =
       option_of_yojson
         (value_for_key max_results_describe_budgets_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     show_filter_expression =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ShowFilterExpression") _list path;
   }
    : describe_budgets_request)

let budgeted_and_actual_amounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budgeted_amount = option_of_yojson (value_for_key spend_of_yojson "BudgetedAmount") _list path;
     actual_amount = option_of_yojson (value_for_key spend_of_yojson "ActualAmount") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
   }
    : budgeted_and_actual_amounts)

let budgeted_and_actual_amounts_list_of_yojson tree path =
  list_of_yojson budgeted_and_actual_amounts_of_yojson tree path

let budget_performance_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_name = option_of_yojson (value_for_key budget_name_of_yojson "BudgetName") _list path;
     budget_type = option_of_yojson (value_for_key budget_type_of_yojson "BudgetType") _list path;
     cost_filters = option_of_yojson (value_for_key cost_filters_of_yojson "CostFilters") _list path;
     cost_types = option_of_yojson (value_for_key cost_types_of_yojson "CostTypes") _list path;
     time_unit = option_of_yojson (value_for_key time_unit_of_yojson "TimeUnit") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     budgeted_and_actual_amounts_list =
       option_of_yojson
         (value_for_key budgeted_and_actual_amounts_list_of_yojson "BudgetedAndActualAmountsList")
         _list path;
     filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "FilterExpression") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
   }
    : budget_performance_history)

let describe_budget_performance_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_performance_history =
       option_of_yojson
         (value_for_key budget_performance_history_of_yojson "BudgetPerformanceHistory")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_performance_history_response)

let describe_budget_performance_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_performance_history_request)

let budget_notifications_for_account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notifications =
       option_of_yojson (value_for_key notifications_of_yojson "Notifications") _list path;
     budget_name = option_of_yojson (value_for_key budget_name_of_yojson "BudgetName") _list path;
   }
    : budget_notifications_for_account)

let budget_notifications_for_account_list_of_yojson tree path =
  list_of_yojson budget_notifications_for_account_of_yojson tree path

let describe_budget_notifications_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     budget_notifications_for_account =
       option_of_yojson
         (value_for_key budget_notifications_for_account_list_of_yojson
            "BudgetNotificationsForAccount")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_notifications_for_account_response)

let max_results_budget_notifications_of_yojson = int_of_yojson

let describe_budget_notifications_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     max_results =
       option_of_yojson
         (value_for_key max_results_budget_notifications_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_notifications_for_account_request)

let actions_of_yojson tree path = list_of_yojson action_of_yojson tree path

let describe_budget_actions_for_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key actions_of_yojson "Actions" _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_actions_for_budget_response)

let describe_budget_actions_for_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_actions_for_budget_request)

let describe_budget_actions_for_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key actions_of_yojson "Actions" _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_actions_for_account_response)

let describe_budget_actions_for_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_actions_for_account_request)

let action_history_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
   }
    : action_history_details)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYSTEM" -> System
    | `String "CREATE_ACTION" -> CreateAction
    | `String "DELETE_ACTION" -> DeleteAction
    | `String "UPDATE_ACTION" -> UpdateAction
    | `String "EXECUTE_ACTION" -> ExecuteAction
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let action_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = value_for_key generic_timestamp_of_yojson "Timestamp" _list path;
     status = value_for_key action_status_of_yojson "Status" _list path;
     event_type = value_for_key event_type_of_yojson "EventType" _list path;
     action_history_details =
       value_for_key action_history_details_of_yojson "ActionHistoryDetails" _list path;
   }
    : action_history)

let action_histories_of_yojson tree path = list_of_yojson action_history_of_yojson tree path

let describe_budget_action_histories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_histories = value_for_key action_histories_of_yojson "ActionHistories" _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_action_histories_response)

let describe_budget_action_histories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "TimePeriod") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : describe_budget_action_histories_request)

let describe_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
   }
    : describe_budget_action_response)

let describe_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
   }
    : describe_budget_action_request)

let describe_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ budget = option_of_yojson (value_for_key budget_of_yojson "Budget") _list path }
    : describe_budget_response)

let describe_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     show_filter_expression =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ShowFilterExpression") _list path;
   }
    : describe_budget_request)

let delete_subscriber_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_subscriber_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     subscriber = value_for_key subscriber_of_yojson "Subscriber" _list path;
   }
    : delete_subscriber_request)

let delete_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
   }
    : delete_notification_request)

let delete_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
   }
    : delete_budget_action_response)

let delete_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
   }
    : delete_budget_action_request)

let delete_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
   }
    : delete_budget_request)

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
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     subscriber = value_for_key subscriber_of_yojson "Subscriber" _list path;
   }
    : create_subscriber_request)

let create_notification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_notification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification = value_for_key notification_of_yojson "Notification" _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
   }
    : create_notification_request)

let create_budget_action_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     action_id = value_for_key action_id_of_yojson "ActionId" _list path;
   }
    : create_budget_action_response)

let create_budget_action_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget_name = value_for_key budget_name_of_yojson "BudgetName" _list path;
     notification_type = value_for_key notification_type_of_yojson "NotificationType" _list path;
     action_type = value_for_key action_type_of_yojson "ActionType" _list path;
     action_threshold = value_for_key action_threshold_of_yojson "ActionThreshold" _list path;
     definition = value_for_key definition_of_yojson "Definition" _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "ExecutionRoleArn" _list path;
     approval_model = value_for_key approval_model_of_yojson "ApprovalModel" _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_budget_action_request)

let create_budget_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let notification_with_subscribers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification = value_for_key notification_of_yojson "Notification" _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
   }
    : notification_with_subscribers)

let notification_with_subscribers_list_of_yojson tree path =
  list_of_yojson notification_with_subscribers_of_yojson tree path

let create_budget_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     budget = value_for_key budget_of_yojson "Budget" _list path;
     notifications_with_subscribers =
       option_of_yojson
         (value_for_key notification_with_subscribers_list_of_yojson "NotificationsWithSubscribers")
         _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_budget_request)
