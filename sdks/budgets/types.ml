type nonrec error_message = string [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec user = string [@@ocaml.doc ""]

type nonrec users = user list [@@ocaml.doc ""]

type nonrec update_subscriber_response = unit [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec budget_name = string [@@ocaml.doc ""]

type nonrec notification_type = FORECASTED [@ocaml.doc ""] | ACTUAL [@ocaml.doc ""]
[@@ocaml.doc " The type of a notification. It must be ACTUAL or FORECASTED.\n"]

type nonrec comparison_operator =
  | EQUAL_TO [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
[@@ocaml.doc
  " The comparison operator of a notification. Currently, the service supports the following \
   operators:\n\n\
  \  [GREATER_THAN], [LESS_THAN], [EQUAL_TO] \n\
  \ "]

type nonrec notification_threshold = float [@@ocaml.doc ""]

type nonrec threshold_type = ABSOLUTE_VALUE [@ocaml.doc ""] | PERCENTAGE [@ocaml.doc ""]
[@@ocaml.doc " The type of threshold for a notification.\n"]

type nonrec notification_state = ALARM [@ocaml.doc ""] | OK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec notification = {
  notification_state : notification_state option;
      [@ocaml.doc
        "Specifies whether this notification is in alarm. If a budget notification is in the \
         [ALARM] state, you passed the set threshold for the budget.\n"]
  threshold_type : threshold_type option;
      [@ocaml.doc
        "The type of threshold for a notification. For [ABSOLUTE_VALUE] thresholds, Amazon Web \
         Services notifies you when you go over or are forecasted to go over your total cost \
         threshold. For [PERCENTAGE] thresholds, Amazon Web Services notifies you when you go over \
         or are forecasted to go over a certain percentage of your forecasted spend. For example, \
         if you have a budget for 200 dollars and you have a [PERCENTAGE] threshold of 80%, Amazon \
         Web Services notifies you when you go over 160 dollars.\n"]
  threshold : notification_threshold;
      [@ocaml.doc
        "The threshold that's associated with a notification. Thresholds are always a percentage, \
         and many customers find value being alerted between 50% - 200% of the budgeted amount. \
         The maximum limit for your threshold is 1,000,000% above the budgeted amount.\n"]
  comparison_operator : comparison_operator;
      [@ocaml.doc "The comparison that's used for this notification.\n"]
  notification_type : notification_type;
      [@ocaml.doc
        "Specifies whether the notification is for how much you have spent ([ACTUAL]) or for how \
         much that you're forecasted to spend ([FORECASTED]).\n"]
}
[@@ocaml.doc
  "A notification that's associated with a budget. A budget can have up to ten notifications. \n\n\
  \ Each notification must have at least one subscriber. A notification can have one SNS \
   subscriber and up to 10 email subscribers, for a total of 11 subscribers.\n\
  \ \n\
  \  For example, if you have a budget for 200 dollars and you want to be notified when you go \
   over 160 dollars, create a notification with the following parameters:\n\
  \  \n\
  \   {ul\n\
  \         {-  A notificationType of [ACTUAL] \n\
  \             \n\
  \              }\n\
  \         {-  A [thresholdType] of [PERCENTAGE] \n\
  \             \n\
  \              }\n\
  \         {-  A [comparisonOperator] of [GREATER_THAN] \n\
  \             \n\
  \              }\n\
  \         {-  A notification [threshold] of [80] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec subscription_type = EMAIL [@ocaml.doc ""] | SNS [@ocaml.doc ""]
[@@ocaml.doc " The subscription type of the subscriber. It can be SMS or EMAIL.\n"]

type nonrec subscriber_address = string [@@ocaml.doc ""]

type nonrec subscriber = {
  address : subscriber_address;
      [@ocaml.doc
        "The address that Amazon Web Services sends budget notifications to, either an SNS topic \
         or an email.\n\n\
        \ When you create a subscriber, the value of [Address] can't contain line breaks.\n\
        \ "]
  subscription_type : subscription_type;
      [@ocaml.doc "The type of notification that Amazon Web Services sends to a subscriber.\n"]
}
[@@ocaml.doc
  "The subscriber to a budget notification. The subscriber consists of a subscription type and \
   either an Amazon SNS topic or an email address.\n\n\
  \ For example, an email subscriber has the following parameters:\n\
  \ \n\
  \  {ul\n\
  \        {-  A [subscriptionType] of [EMAIL] \n\
  \            \n\
  \             }\n\
  \        {-  An [address] of [example@example.com] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec update_subscriber_request = {
  new_subscriber : subscriber;
      [@ocaml.doc "The updated subscriber that is associated with a budget notification.\n"]
  old_subscriber : subscriber;
      [@ocaml.doc "The previous subscriber that is associated with a budget notification.\n"]
  notification : notification;
      [@ocaml.doc "The notification whose subscriber you want to update.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose subscriber you want to update.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose subscriber you want to update.\n"]
}
[@@ocaml.doc " Request of UpdateSubscriber \n"]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The number of API requests has exceeded the maximum allowed API request throttling limit for \
   the account.\n"]

type nonrec not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "We can\226\128\153t locate the resource that you specified.\n"]

type nonrec invalid_parameter_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An error on the client occurred. Typically, the cause is an invalid input value.\n"]

type nonrec internal_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An error on the server occurred during the processing of your request. Try again later.\n"]

type nonrec duplicate_record_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The budget name already exists. Budget names must be unique within an account.\n"]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You are not authorized to use this operation with the given parameters.\n"]

type nonrec update_notification_response = unit [@@ocaml.doc ""]

type nonrec update_notification_request = {
  new_notification : notification;
      [@ocaml.doc "The updated notification to be associated with a budget.\n"]
  old_notification : notification;
      [@ocaml.doc "The previous notification that is associated with a budget.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose notification you want to update.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose notification you want to update.\n"]
}
[@@ocaml.doc " Request of UpdateNotification \n"]

type nonrec update_budget_response = unit [@@ocaml.doc ""]

type nonrec numeric_value = string [@@ocaml.doc ""]

type nonrec unit_value = string [@@ocaml.doc ""]

type nonrec spend = {
  unit_ : unit_value;
      [@ocaml.doc
        "The unit of measurement that's used for the budget forecast, actual spend, or budget \
         threshold.\n"]
  amount : numeric_value;
      [@ocaml.doc
        "The cost or usage amount that's associated with a budget forecast, actual spend, or \
         budget threshold.\n"]
}
[@@ocaml.doc
  "The amount of cost or usage that's measured for a budget.\n\n\
  \  {i Cost example:} A [Spend] for [3 USD] of costs has the following parameters:\n\
  \ \n\
  \  {ul\n\
  \        {-  An [Amount] of [3] \n\
  \            \n\
  \             }\n\
  \        {-  A [Unit] of [USD] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {i Usage example:} A [Spend] for [3 GB] of S3 usage has the following parameters:\n\
  \   \n\
  \    {ul\n\
  \          {-  An [Amount] of [3] \n\
  \              \n\
  \               }\n\
  \          {-  A [Unit] of [GB] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec planned_budget_limits = (generic_string * spend) list [@@ocaml.doc ""]

type nonrec dimension_value = string [@@ocaml.doc ""]

type nonrec dimension_values = dimension_value list [@@ocaml.doc ""]

type nonrec cost_filters = (generic_string * dimension_values) list
[@@ocaml.doc " A map that represents the cost filters that are applied to the budget.\n"]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec cost_types = {
  use_amortized : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget uses the amortized rate.\n\n The default value is [false].\n "]
  include_discount : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes discounts.\n\n The default value is [true].\n "]
  include_support : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes support subscription fees.\n\n\
        \ The default value is [true].\n\
        \ "]
  include_other_subscription : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes non-RI subscription costs.\n\n\
        \ The default value is [true].\n\
        \ "]
  include_recurring : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes recurring fees such as monthly RI fees.\n\n\
        \ The default value is [true].\n\
        \ "]
  include_upfront : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes upfront RI costs.\n\n The default value is [true].\n "]
  include_credit : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes credits.\n\n The default value is [true].\n "]
  include_refund : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes refunds.\n\n The default value is [true].\n "]
  use_blended : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget uses a blended rate.\n\n The default value is [false].\n "]
  include_subscription : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether a budget includes subscriptions.\n\n The default value is [true].\n "]
  include_tax : nullable_boolean option;
      [@ocaml.doc "Specifies whether a budget includes taxes.\n\n The default value is [true].\n "]
}
[@@ocaml.doc
  "The types of cost that are included in a [COST] budget, such as tax and subscriptions.\n\n\
  \  [USAGE], [RI_UTILIZATION], [RI_COVERAGE], [SAVINGS_PLANS_UTILIZATION], and \
   [SAVINGS_PLANS_COVERAGE] budgets don't have [CostTypes].\n\
  \ "]

type nonrec time_unit =
  | CUSTOM [@ocaml.doc ""]
  | ANNUALLY [@ocaml.doc ""]
  | QUARTERLY [@ocaml.doc ""]
  | MONTHLY [@ocaml.doc ""]
  | DAILY [@ocaml.doc ""]
[@@ocaml.doc " The time unit of the budget, such as MONTHLY or QUARTERLY.\n"]

type nonrec generic_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec time_period = {
  end_ : generic_timestamp option;
      [@ocaml.doc
        "The end date for a budget. If you didn't specify an end date, Amazon Web Services set \
         your end date to [06/15/87 00:00 UTC]. The defaults are the same for the Billing and Cost \
         Management console and the API.\n\n\
        \ After the end date, Amazon Web Services deletes the budget and all the associated \
         notifications and subscribers. You can change your end date with the [UpdateBudget] \
         operation.\n\
        \ "]
  start : generic_timestamp option;
      [@ocaml.doc
        "The start date for a budget. If you created your budget and didn't specify a start date, \
         Amazon Web Services defaults to the start of your chosen time period (DAILY, MONTHLY, \
         QUARTERLY, ANNUALLY, or CUSTOM). For example, if you created your budget on January 24, \
         2018, chose [DAILY], and didn't set a start date, Amazon Web Services set your start date \
         to [01/24/18 00:00 UTC]. If you chose [MONTHLY], Amazon Web Services set your start date \
         to [01/01/18 00:00 UTC]. The defaults are the same for the Billing and Cost Management \
         console and the API.\n\n\
        \ You can change your start date with the [UpdateBudget] operation.\n\
        \ "]
}
[@@ocaml.doc
  "The period of time that's covered by a budget. The period has a start date and an end date. The \
   start date must come before the end date. There are no restrictions on the end date. \n"]

type nonrec calculated_spend = {
  forecasted_spend : spend option;
      [@ocaml.doc
        "The amount of cost, usage, RI units, or Savings Plans units that you're forecasted to use.\n"]
  actual_spend : spend;
      [@ocaml.doc "The amount of cost, usage, RI units, or Savings Plans units that you used.\n"]
}
[@@ocaml.doc
  "The spend objects that are associated with this budget. The [actualSpend] tracks how much \
   you've used, cost, usage, RI units, or Savings Plans units and the [forecastedSpend] tracks how \
   much that you're predicted to spend based on your historical usage profile.\n\n\
  \ For example, if it's the 20th of the month and you have spent [50] dollars on Amazon EC2, your \
   [actualSpend] is [50 USD], and your [forecastedSpend] is [75 USD].\n\
  \ "]

type nonrec budget_type =
  | SPCoverage [@ocaml.doc ""]
  | SPUtilization [@ocaml.doc ""]
  | RICoverage [@ocaml.doc ""]
  | RIUtilization [@ocaml.doc ""]
  | Cost [@ocaml.doc ""]
  | Usage [@ocaml.doc ""]
[@@ocaml.doc
  " The type of a budget. It must be one of the following types: \n\n\
  \  [COST], [USAGE], [RI_UTILIZATION], [RI_COVERAGE], [SAVINGS_PLANS_UTILIZATION], or \
   [SAVINGS_PLANS_COVERAGE].\n\
  \ "]

type nonrec auto_adjust_type = FORECAST [@ocaml.doc ""] | HISTORICAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec adjustment_period = int [@@ocaml.doc ""]

type nonrec historical_options = {
  look_back_available_periods : adjustment_period option;
      [@ocaml.doc
        "The integer that describes how many budget periods in your [BudgetAdjustmentPeriod] are \
         included in the calculation of your current [BudgetLimit]. If the first budget period in \
         your [BudgetAdjustmentPeriod] has no cost data, then that budget period isn\226\128\153t \
         included in the average that determines your budget limit. \n\n\
        \ For example, if you set [BudgetAdjustmentPeriod] as [4] quarters, but your account had \
         no cost data in the first quarter, then only the last three quarters are included in the \
         calculation. In this scenario, [LookBackAvailablePeriods] returns [3]. \n\
        \ \n\
        \  You can\226\128\153t set your own [LookBackAvailablePeriods]. The value is \
         automatically calculated from the [BudgetAdjustmentPeriod] and your historical cost data.\n\
        \  "]
  budget_adjustment_period : adjustment_period;
      [@ocaml.doc
        "The number of budget periods included in the moving-average calculation that determines \
         your auto-adjusted budget amount. The maximum value depends on the [TimeUnit] granularity \
         of the budget:\n\n\
        \ {ul\n\
        \       {-  For the [DAILY] granularity, the maximum value is [60].\n\
        \           \n\
        \            }\n\
        \       {-  For the [MONTHLY] granularity, the maximum value is [12].\n\
        \           \n\
        \            }\n\
        \       {-  For the [QUARTERLY] granularity, the maximum value is [4].\n\
        \           \n\
        \            }\n\
        \       {-  For the [ANNUALLY] granularity, the maximum value is [1].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The parameters that define or describe the historical data that your auto-adjusting budget is \
   based on.\n"]

type nonrec auto_adjust_data = {
  last_auto_adjust_time : generic_timestamp option;
      [@ocaml.doc "The last time that your budget was auto-adjusted.\n"]
  historical_options : historical_options option;
      [@ocaml.doc
        "The parameters that define or describe the historical data that your auto-adjusting \
         budget is based on.\n"]
  auto_adjust_type : auto_adjust_type;
      [@ocaml.doc
        "The string that defines whether your budget auto-adjusts based on historical or \
         forecasted data.\n"]
}
[@@ocaml.doc "The parameters that determine the budget amount for an auto-adjusting budget.\n"]

type nonrec dimension =
  | COST_CATEGORY_NAME [@ocaml.doc ""]
  | TAG_KEY [@ocaml.doc ""]
  | RESERVATION_MODIFIED [@ocaml.doc ""]
  | PAYMENT_OPTION [@ocaml.doc ""]
  | SAVINGS_PLAN_ARN [@ocaml.doc ""]
  | SAVINGS_PLANS_TYPE [@ocaml.doc ""]
  | RIGHTSIZING_TYPE [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | RESERVATION_ID [@ocaml.doc ""]
  | BILLING_ENTITY [@ocaml.doc ""]
  | INSTANCE_TYPE_FAMILY [@ocaml.doc ""]
  | CACHE_ENGINE [@ocaml.doc ""]
  | DATABASE_ENGINE [@ocaml.doc ""]
  | DEPLOYMENT_OPTION [@ocaml.doc ""]
  | INVOICING_ENTITY [@ocaml.doc ""]
  | LEGAL_ENTITY_NAME [@ocaml.doc ""]
  | SUBSCRIPTION_ID [@ocaml.doc ""]
  | PLATFORM [@ocaml.doc ""]
  | SCOPE [@ocaml.doc ""]
  | TENANCY [@ocaml.doc ""]
  | OPERATING_SYSTEM [@ocaml.doc ""]
  | RECORD_TYPE [@ocaml.doc ""]
  | USAGE_TYPE_GROUP [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | SERVICE_CODE [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | PURCHASE_TYPE [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | LINKED_ACCOUNT_NAME [@ocaml.doc ""]
  | LINKED_ACCOUNT [@ocaml.doc ""]
  | INSTANCE_TYPE [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
[@@ocaml.doc ""]

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

type nonrec expression_dimension_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options that you can use to filter your results. You can specify only one of \
         these values in the array.\n"]
  values : values;
      [@ocaml.doc
        "The metadata values you can specify to filter upon, so that the results all match at \
         least one of the specified values.\n"]
  key : dimension; [@ocaml.doc "The name of the dimension that you want to filter on.\n"]
}
[@@ocaml.doc "Contains the specifications for the filters to use for your request.\n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_values = {
  match_options : match_options option;
      [@ocaml.doc "The match options that you can use to filter your results.\n"]
  values : values option; [@ocaml.doc "The specific value of the tag.\n"]
  key : tag_key option; [@ocaml.doc "The key for the tag.\n"]
}
[@@ocaml.doc "The values that are available for a tag.\n"]

type nonrec cost_category_name = string [@@ocaml.doc ""]

type nonrec cost_category_values = {
  match_options : match_options option;
      [@ocaml.doc "The match options that you can use to filter your results. \n"]
  values : values option; [@ocaml.doc "The specific value of the cost category.\n"]
  key : cost_category_name option; [@ocaml.doc "The unique name of the cost category.\n"]
}
[@@ocaml.doc "The cost category values used for filtering the costs.\n"]

type expression = {
  cost_categories : cost_category_values option;
      [@ocaml.doc "The filter that's based on CostCategoryValues.\n"]
  tags : tag_values option; [@ocaml.doc "The specific Tag to use for Expression.\n"]
  dimensions : expression_dimension_values option;
      [@ocaml.doc "The specific Dimension to use for Expression.\n"]
  not : expression option; [@ocaml.doc "Return results that don't match a Dimension object.\n"]
  and_ : expressions option; [@ocaml.doc "Return results that match both Dimension objects.\n"]
  \#or : expressions option; [@ocaml.doc "Return results that match either Dimension object.\n"]
}
[@@ocaml.doc "Use Expression to filter in various Budgets APIs.\n"]

and expressions = expression list [@@ocaml.doc ""]

type nonrec metric =
  | HOURS [@ocaml.doc ""]
  | NORMALIZED_USAGE_AMOUNT [@ocaml.doc ""]
  | USAGE_QUANTITY [@ocaml.doc ""]
  | NET_AMORTIZED_COST [@ocaml.doc ""]
  | NET_UNBLENDED_COST [@ocaml.doc ""]
  | AMORTIZED_COST [@ocaml.doc ""]
  | UNBLENDED_COST [@ocaml.doc ""]
  | BLENDED_COST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metrics = metric list [@@ocaml.doc ""]

type nonrec billing_view_arn = string [@@ocaml.doc ""]

type nonrec health_status_value = UNHEALTHY [@ocaml.doc ""] | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec health_status_reason =
  | MULTI_YEAR_HISTORICAL_DATA_DISABLED [@ocaml.doc ""]
  | FILTER_INVALID [@ocaml.doc ""]
  | BILLING_VIEW_UNHEALTHY [@ocaml.doc ""]
  | BILLING_VIEW_NO_ACCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec health_status = {
  last_updated_time : generic_timestamp option; [@ocaml.doc ""]
  status_reason : health_status_reason option;
      [@ocaml.doc
        "The reason for the current status.\n\n\
        \ {ul\n\
        \       {-   [BILLING_VIEW_NO_ACCESS]: The billing view resource does not grant \
         [billing:GetBillingViewData] permission to this account.\n\
        \           \n\
        \            }\n\
        \       {-   [BILLING_VIEW_UNHEALTHY]: The billing view associated with the budget is \
         unhealthy.\n\
        \           \n\
        \            }\n\
        \       {-   [FILTER_INVALID]: The filter contains reference to an account you do not have \
         access to.\n\
        \           \n\
        \            }\n\
        \       {-   [MULTI_YEAR_HISTORICAL_DATA_DISABLED]: The budget is not being updated. \
         Enable multi-year historical data in your Cost Management preferences.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status : health_status_value option;
      [@ocaml.doc "The current status of the billing view resource.\n"]
}
[@@ocaml.doc
  "Provides information about the current operational state of a billing view resource, including \
   its ability to access and update based on its associated billing view.\n"]

type nonrec budget = {
  health_status : health_status option;
      [@ocaml.doc "The current operational state of a Billing View derived resource.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  metrics : metrics option; [@ocaml.doc "The definition for how the budget data is aggregated.\n"]
  filter_expression : expression option;
      [@ocaml.doc "The filtering dimensions for the budget and their corresponding values.\n"]
  auto_adjust_data : auto_adjust_data option;
      [@ocaml.doc "The parameters that determine the budget amount for an auto-adjusting budget.\n"]
  last_updated_time : generic_timestamp option;
      [@ocaml.doc "The last time that you updated this budget.\n"]
  budget_type : budget_type;
      [@ocaml.doc
        "Specifies whether this budget tracks costs, usage, RI utilization, RI coverage, Savings \
         Plans utilization, or Savings Plans coverage.\n"]
  calculated_spend : calculated_spend option;
      [@ocaml.doc "The actual and forecasted cost or usage that the budget tracks.\n"]
  time_period : time_period option;
      [@ocaml.doc
        "The period of time that's covered by a budget. You set the start date and end date. The \
         start date must come before the end date. The end date must come before [06/15/87\n\
         \t\t\t\t00:00 UTC]. \n\n\
        \ If you create your budget and don't specify a start date, Amazon Web Services defaults \
         to the start of your chosen time period (DAILY, MONTHLY, QUARTERLY, ANNUALLY, or CUSTOM). \
         For example, if you created your budget on January 24, 2018, chose [DAILY], and didn't \
         set a start date, Amazon Web Services set your start date to [01/24/18 00:00\n\
         \t\t\t\tUTC]. If you chose [MONTHLY], Amazon Web Services set your start date to \
         [01/01/18 00:00 UTC]. If you didn't specify an end date, Amazon Web Services set your end \
         date to [06/15/87 00:00 UTC]. The defaults are the same for the Billing and Cost \
         Management console and the API. \n\
        \ \n\
        \  You can change either date with the [UpdateBudget] operation.\n\
        \  \n\
        \   After the end date, Amazon Web Services deletes the budget and all the associated \
         notifications and subscribers.\n\
        \   "]
  time_unit : time_unit;
      [@ocaml.doc "The length of time until a budget resets the actual and forecasted spend.\n"]
  cost_types : cost_types option;
      [@ocaml.doc
        "The types of costs that are included in this [COST] budget.\n\n\
        \  [USAGE], [RI_UTILIZATION], [RI_COVERAGE], [SAVINGS_PLANS_UTILIZATION], and \
         [SAVINGS_PLANS_COVERAGE] budgets do not have [CostTypes].\n\
        \ "]
  cost_filters : cost_filters option;
      [@ocaml.doc
        "The cost filters, such as [Region], [Service], [LinkedAccount], [Tag], or [CostCategory], \
         that are applied to a budget.\n\n\
        \ Amazon Web Services Budgets supports the following services as a [Service] filter for RI \
         budgets:\n\
        \ \n\
        \  {ul\n\
        \        {-  Amazon EC2\n\
        \            \n\
        \             }\n\
        \        {-  Amazon Redshift\n\
        \            \n\
        \             }\n\
        \        {-  Amazon Relational Database Service\n\
        \            \n\
        \             }\n\
        \        {-  Amazon ElastiCache\n\
        \            \n\
        \             }\n\
        \        {-  Amazon OpenSearch Service\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  planned_budget_limits : planned_budget_limits option;
      [@ocaml.doc
        "A map containing multiple [BudgetLimit], including current or future limits.\n\n\
        \  [PlannedBudgetLimits] is available for cost or usage budget and supports both monthly \
         and quarterly [TimeUnit]. \n\
        \ \n\
        \  For monthly budgets, provide 12 months of [PlannedBudgetLimits] values. This must start \
         from the current month and include the next 11 months. The [key] is the start of the \
         month, [UTC] in epoch seconds. \n\
        \  \n\
        \   For quarterly budgets, provide four quarters of [PlannedBudgetLimits] value entries in \
         standard calendar quarter increments. This must start from the current quarter and \
         include the next three quarters. The [key] is the start of the quarter, [UTC] in epoch \
         seconds. \n\
        \   \n\
        \    If the planned budget expires before 12 months for monthly or four quarters for \
         quarterly, provide the [PlannedBudgetLimits] values only for the remaining periods.\n\
        \    \n\
        \     If the budget begins at a date in the future, provide [PlannedBudgetLimits] values \
         from the start date of the budget. \n\
        \     \n\
        \      After all of the [BudgetLimit] values in [PlannedBudgetLimits] are used, the budget \
         continues to use the last limit as the [BudgetLimit]. At that point, the planned budget \
         provides the same experience as a fixed budget. \n\
        \      \n\
        \        [DescribeBudget] and [DescribeBudgets] response along with [PlannedBudgetLimits] \
         also contain [BudgetLimit] representing the current month or quarter limit present in \
         [PlannedBudgetLimits]. This only applies to budgets that are created with \
         [PlannedBudgetLimits]. Budgets that are created without [PlannedBudgetLimits] only \
         contain [BudgetLimit]. They don't contain [PlannedBudgetLimits].\n\
        \       "]
  budget_limit : spend option;
      [@ocaml.doc
        "The total amount of cost, usage, RI utilization, RI coverage, Savings Plans utilization, \
         or Savings Plans coverage that you want to track with your budget.\n\n\
        \  [BudgetLimit] is required for cost or usage budgets, but optional for RI or Savings \
         Plans utilization or coverage budgets. RI and Savings Plans utilization or coverage \
         budgets default to [100]. This is the only valid value for RI or Savings Plans \
         utilization or coverage budgets. You can't use [BudgetLimit] with [PlannedBudgetLimits] \
         for [CreateBudget] and [UpdateBudget] actions. \n\
        \ "]
  budget_name : budget_name;
      [@ocaml.doc
        "The name of a budget. The name must be unique within an account. The [:] and [\\] \
         characters, and the \"/action/\" substring, aren't allowed in [BudgetName].\n\n\
        \ Budget names are validated for content. Names that contain phone numbers, URLs, or email \
         addresses combined with certain terms may be rejected.\n\
        \ "]
}
[@@ocaml.doc
  "Represents the output of the [CreateBudget] operation. The content consists of the detailed \
   metadata and data file information, and the current status of the [budget] object.\n\n\
  \ This is the Amazon Resource Name (ARN) pattern for a budget: \n\
  \ \n\
  \   [arn:aws:budgets::AccountId:budget/budgetName] \n\
  \  "]

type nonrec update_budget_request = {
  new_budget : budget; [@ocaml.doc "The budget that you want to update your budget to.\n"]
  account_id : account_id;
      [@ocaml.doc "The [accountId] that is associated with the budget that you want to update.\n"]
}
[@@ocaml.doc " Request of UpdateBudget \n"]

type nonrec action_id = string [@@ocaml.doc ""]

type nonrec action_type = SSM [@ocaml.doc ""] | SCP [@ocaml.doc ""] | IAM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_threshold = {
  action_threshold_type : threshold_type; [@ocaml.doc ""]
  action_threshold_value : notification_threshold; [@ocaml.doc ""]
}
[@@ocaml.doc "The trigger threshold of the action. \n"]

type nonrec policy_arn = string [@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec roles = role list [@@ocaml.doc ""]

type nonrec group = string [@@ocaml.doc ""]

type nonrec groups = group list [@@ocaml.doc ""]

type nonrec iam_action_definition = {
  users : users option;
      [@ocaml.doc "A list of users to be attached. There must be at least one user. \n"]
  groups : groups option;
      [@ocaml.doc "A list of groups to be attached. There must be at least one group. \n"]
  roles : roles option;
      [@ocaml.doc "A list of roles to be attached. There must be at least one role. \n"]
  policy_arn : policy_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the policy to be attached. \n"]
}
[@@ocaml.doc "The Identity and Access Management (IAM) action definition details. \n"]

type nonrec policy_id = string [@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec target_ids = target_id list [@@ocaml.doc ""]

type nonrec scp_action_definition = {
  target_ids : target_ids; [@ocaml.doc "A list of target IDs. \n"]
  policy_id : policy_id; [@ocaml.doc "The policy ID attached. \n"]
}
[@@ocaml.doc "The service control policies (SCP) action definition details. \n"]

type nonrec action_sub_type = STOP_RDS [@ocaml.doc ""] | STOP_EC2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec instance_ids = instance_id list [@@ocaml.doc ""]

type nonrec ssm_action_definition = {
  instance_ids : instance_ids; [@ocaml.doc "The EC2 and RDS instance IDs. \n"]
  region : region; [@ocaml.doc "The Region to run the SSM document. \n"]
  action_sub_type : action_sub_type; [@ocaml.doc "The action subType. \n"]
}
[@@ocaml.doc "The Amazon Web Services Systems Manager (SSM) action definition details. \n"]

type nonrec definition = {
  ssm_action_definition : ssm_action_definition option;
      [@ocaml.doc "The Amazon Web Services Systems Manager (SSM) action definition details. \n"]
  scp_action_definition : scp_action_definition option;
      [@ocaml.doc "The service control policies (SCPs) action definition details. \n"]
  iam_action_definition : iam_action_definition option;
      [@ocaml.doc "The Identity and Access Management (IAM) action definition details. \n"]
}
[@@ocaml.doc "Specifies all of the type-specific parameters. \n"]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec approval_model = MANUAL [@ocaml.doc ""] | AUTO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec action_status =
  | Reset_Failure [@ocaml.doc ""]
  | Reset_In_Progress [@ocaml.doc ""]
  | Reverse_Failure [@ocaml.doc ""]
  | Reverse_Success [@ocaml.doc ""]
  | Reverse_In_Progress [@ocaml.doc ""]
  | Execution_Failure [@ocaml.doc ""]
  | Execution_Success [@ocaml.doc ""]
  | Execution_In_Progress [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Standby [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec subscribers = subscriber list [@@ocaml.doc ""]

type nonrec action = {
  subscribers : subscribers; [@ocaml.doc ""]
  status : action_status; [@ocaml.doc "The status of the action. \n"]
  approval_model : approval_model;
      [@ocaml.doc "This specifies if the action needs manual or automatic approval. \n"]
  execution_role_arn : role_arn;
      [@ocaml.doc
        "The role passed for action execution and reversion. Roles and actions must be in the same \
         account. \n"]
  definition : definition; [@ocaml.doc "Where you specify all of the type-specific parameters. \n"]
  action_threshold : action_threshold; [@ocaml.doc "The trigger threshold of the action. \n"]
  action_type : action_type;
      [@ocaml.doc
        "The type of action. This defines the type of tasks that can be carried out by this \
         action. This field also determines the format for definition. \n"]
  notification_type : notification_type; [@ocaml.doc ""]
  budget_name : budget_name; [@ocaml.doc ""]
  action_id : action_id;
      [@ocaml.doc "A system-generated universally unique identifier (UUID) for the action. \n"]
}
[@@ocaml.doc "A budget action resource. \n"]

type nonrec update_budget_action_response = {
  new_action : action; [@ocaml.doc " The updated action resource information. \n"]
  old_action : action; [@ocaml.doc " The previous action resource information. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_budget_action_request = {
  subscribers : subscribers option; [@ocaml.doc ""]
  approval_model : approval_model option;
      [@ocaml.doc " This specifies if the action needs manual or automatic approval. \n"]
  execution_role_arn : role_arn option;
      [@ocaml.doc
        " The role passed for action execution and reversion. Roles and actions must be in the \
         same account. \n"]
  definition : definition option; [@ocaml.doc ""]
  action_threshold : action_threshold option; [@ocaml.doc ""]
  notification_type : notification_type option; [@ocaml.doc ""]
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec resource_locked_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was received and recognized by the server, but the server rejected that particular \
   method for the requested resource.\n"]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached a Service Quota limit on this resource.\n"]

type nonrec billing_view_health_status_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The billing view status must be HEALTHY to perform this action. Try again when the status is \
   HEALTHY. \n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : resource_tag_key_list;
      [@ocaml.doc "The key that's associated with the tag.\n"]
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  value : resource_tag_value; [@ocaml.doc "The value that's associated with the tag.\n"]
  key : resource_tag_key; [@ocaml.doc "The key that's associated with the tag.\n"]
}
[@@ocaml.doc "The tag structure that contains a tag key and value.\n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_tags : resource_tag_list; [@ocaml.doc "The tags associated with the resource.\n"]
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec notifications = notification list [@@ocaml.doc ""]

type nonrec notification_with_subscribers = {
  subscribers : subscribers;
      [@ocaml.doc "A list of subscribers who are subscribed to this notification.\n"]
  notification : notification; [@ocaml.doc "The notification that's associated with a budget.\n"]
}
[@@ocaml.doc
  "A notification with subscribers. A notification can have one SNS subscriber and up to 10 email \
   subscribers, for a total of 11 subscribers.\n"]

type nonrec notification_with_subscribers_list = notification_with_subscribers list [@@ocaml.doc ""]

type nonrec max_results_describe_budgets = int [@@ocaml.doc ""]

type nonrec max_results_budget_notifications = int [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : resource_tag_list option; [@ocaml.doc "The tags associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The pagination token is invalid.\n"]

type nonrec expired_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The pagination token expired.\n"]

type nonrec execution_type =
  | ResetBudgetAction [@ocaml.doc ""]
  | ReverseBudgetAction [@ocaml.doc ""]
  | RetryBudgetAction [@ocaml.doc ""]
  | ApproveBudgetAction [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execute_budget_action_response = {
  execution_type : execution_type; [@ocaml.doc " The type of execution. \n"]
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec execute_budget_action_request = {
  execution_type : execution_type; [@ocaml.doc " The type of execution. \n"]
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec event_type =
  | ExecuteAction [@ocaml.doc ""]
  | UpdateAction [@ocaml.doc ""]
  | DeleteAction [@ocaml.doc ""]
  | CreateAction [@ocaml.doc ""]
  | System [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_subscribers_for_notification_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token in the service response that indicates the next set of results that \
         you can retrieve.\n"]
  subscribers : subscribers option;
      [@ocaml.doc "A list of subscribers that are associated with a notification.\n"]
}
[@@ocaml.doc " Response of DescribeSubscribersForNotification \n"]

type nonrec describe_subscribers_for_notification_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token that you include in your request to indicate the next set of results \
         that you want to retrieve.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "An optional integer that represents how many entries a paginated response contains.\n"]
  notification : notification; [@ocaml.doc "The notification whose subscribers you want to list.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose subscribers you want descriptions of.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose subscribers you want \
         descriptions of.\n"]
}
[@@ocaml.doc " Request of DescribeSubscribersForNotification \n"]

type nonrec describe_notifications_for_budget_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token in the service response that indicates the next set of results that \
         you can retrieve.\n"]
  notifications : notifications option;
      [@ocaml.doc "A list of notifications that are associated with a budget.\n"]
}
[@@ocaml.doc " Response of GetNotificationsForBudget \n"]

type nonrec describe_notifications_for_budget_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token that you include in your request to indicate the next set of results \
         that you want to retrieve.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "An optional integer that represents how many entries a paginated response contains.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose notifications you want descriptions of.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose notifications you want \
         descriptions of.\n"]
}
[@@ocaml.doc " Request of DescribeNotificationsForBudget \n"]

type nonrec budgets = budget list [@@ocaml.doc ""]

type nonrec describe_budgets_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token in the service response that indicates the next set of results that \
         you can retrieve.\n"]
  budgets : budgets option; [@ocaml.doc "A list of budgets.\n"]
}
[@@ocaml.doc " Response of DescribeBudgets \n"]

type nonrec describe_budgets_request = {
  show_filter_expression : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether the response includes the filter expression associated with the \
         budgets. By showing the filter expression, you can see detailed filtering logic applied \
         to the budgets, such as Amazon Web Services services or tags that are being tracked.\n"]
  next_token : generic_string option;
      [@ocaml.doc
        "The pagination token that you include in your request to indicate the next set of results \
         that you want to retrieve.\n"]
  max_results : max_results_describe_budgets option;
      [@ocaml.doc
        "An integer that represents how many budgets a paginated response contains. The default is \
         100.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budgets that you want to describe.\n"]
}
[@@ocaml.doc " Request of DescribeBudgets \n"]

type nonrec describe_budget_response = {
  budget : budget option; [@ocaml.doc "The description of the budget.\n"]
}
[@@ocaml.doc " Response of DescribeBudget \n"]

type nonrec describe_budget_request = {
  show_filter_expression : nullable_boolean option;
      [@ocaml.doc
        "Specifies whether the response includes the filter expression associated with the budget. \
         By showing the filter expression, you can see detailed filtering logic applied to the \
         budget, such as Amazon Web Services services or tags that are being tracked.\n"]
  budget_name : budget_name; [@ocaml.doc "The name of the budget that you want a description of.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget that you want a description of.\n"]
}
[@@ocaml.doc " Request of DescribeBudget \n"]

type nonrec budgeted_and_actual_amounts = {
  time_period : time_period option;
      [@ocaml.doc "The time period that's covered by this budget comparison.\n"]
  actual_amount : spend option; [@ocaml.doc "Your actual costs or usage for a budget period.\n"]
  budgeted_amount : spend option;
      [@ocaml.doc "The amount of cost or usage that you created the budget for.\n"]
}
[@@ocaml.doc
  "The amount of cost or usage that you created the budget for, compared to your actual costs or \
   usage.\n"]

type nonrec budgeted_and_actual_amounts_list = budgeted_and_actual_amounts list [@@ocaml.doc ""]

type nonrec budget_performance_history = {
  metrics : metrics option; [@ocaml.doc "The definition for how the budget data is aggregated.\n"]
  filter_expression : expression option;
      [@ocaml.doc "The filtering dimensions for the budget and their corresponding values.\n"]
  budgeted_and_actual_amounts_list : budgeted_and_actual_amounts_list option;
      [@ocaml.doc
        "A list of amounts of cost or usage that you created budgets for, which are compared to \
         your actual costs or usage.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  time_unit : time_unit option; [@ocaml.doc ""]
  cost_types : cost_types option;
      [@ocaml.doc "The history of the cost types for a budget during the specified time period.\n"]
  cost_filters : cost_filters option;
      [@ocaml.doc
        "The history of the cost filters for a budget during the specified time period.\n"]
  budget_type : budget_type option; [@ocaml.doc ""]
  budget_name : budget_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A history of the state of a budget at the end of the budget's specified time period.\n"]

type nonrec describe_budget_performance_history_response = {
  next_token : generic_string option; [@ocaml.doc ""]
  budget_performance_history : budget_performance_history option;
      [@ocaml.doc
        "The history of how often the budget has gone into an [ALARM] state.\n\n\
        \ For [DAILY] budgets, the history saves the state of the budget for the last 60 days. For \
         [MONTHLY] budgets, the history saves the state of the budget for the current month plus \
         the last 12 months. For [QUARTERLY] budgets, the history saves the state of the budget \
         for the last four quarters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_budget_performance_history_request = {
  next_token : generic_string option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  time_period : time_period option;
      [@ocaml.doc
        "Retrieves how often the budget went into an [ALARM] state for the specified time period.\n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec budget_notifications_for_account = {
  budget_name : budget_name option; [@ocaml.doc ""]
  notifications : notifications option; [@ocaml.doc ""]
}
[@@ocaml.doc " The budget name and associated notifications for an account. \n"]

type nonrec budget_notifications_for_account_list = budget_notifications_for_account list
[@@ocaml.doc ""]

type nonrec describe_budget_notifications_for_account_response = {
  next_token : generic_string option; [@ocaml.doc ""]
  budget_notifications_for_account : budget_notifications_for_account_list option;
      [@ocaml.doc " A list of budget names and associated notifications for an account. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_budget_notifications_for_account_request = {
  next_token : generic_string option; [@ocaml.doc ""]
  max_results : max_results_budget_notifications option;
      [@ocaml.doc
        " An integer that represents how many budgets a paginated response contains. The default \
         is 50. \n"]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec actions = action list [@@ocaml.doc ""]

type nonrec describe_budget_actions_for_budget_response = {
  next_token : generic_string option; [@ocaml.doc ""]
  actions : actions; [@ocaml.doc " A list of the budget action resources information. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_budget_actions_for_budget_request = {
  next_token : generic_string option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_budget_actions_for_account_response = {
  next_token : generic_string option; [@ocaml.doc ""]
  actions : actions; [@ocaml.doc " A list of the budget action resources information. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_budget_actions_for_account_request = {
  next_token : generic_string option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_budget_action_response = {
  action : action; [@ocaml.doc " A budget action resource. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_budget_action_request = {
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec action_history_details = {
  action : action; [@ocaml.doc "The budget action resource. \n"]
  message : generic_string; [@ocaml.doc ""]
}
[@@ocaml.doc "The description of the details for the event. \n"]

type nonrec action_history = {
  action_history_details : action_history_details;
      [@ocaml.doc "The description of the details for the event. \n"]
  event_type : event_type;
      [@ocaml.doc
        "This distinguishes between whether the events are triggered by the user or are generated \
         by the system. \n"]
  status : action_status; [@ocaml.doc "The status of action at the time of the event. \n"]
  timestamp : generic_timestamp; [@ocaml.doc ""]
}
[@@ocaml.doc "The historical records for a budget action. \n"]

type nonrec action_histories = action_history list [@@ocaml.doc ""]

type nonrec describe_budget_action_histories_response = {
  next_token : generic_string option; [@ocaml.doc ""]
  action_histories : action_histories;
      [@ocaml.doc " The historical record of the budget action resource. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_budget_action_histories_request = {
  next_token : generic_string option; [@ocaml.doc ""]
  max_results : max_results option; [@ocaml.doc ""]
  time_period : time_period option; [@ocaml.doc ""]
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_subscriber_response = unit [@@ocaml.doc ""]

type nonrec delete_subscriber_request = {
  subscriber : subscriber; [@ocaml.doc "The subscriber that you want to delete.\n"]
  notification : notification;
      [@ocaml.doc "The notification whose subscriber you want to delete.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose subscriber you want to delete.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose subscriber you want to delete.\n"]
}
[@@ocaml.doc " Request of DeleteSubscriber \n"]

type nonrec delete_notification_response = unit [@@ocaml.doc ""]

type nonrec delete_notification_request = {
  notification : notification; [@ocaml.doc "The notification that you want to delete.\n"]
  budget_name : budget_name;
      [@ocaml.doc "The name of the budget whose notification you want to delete.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget whose notification you want to delete.\n"]
}
[@@ocaml.doc " Request of DeleteNotification \n"]

type nonrec delete_budget_response = unit [@@ocaml.doc ""]

type nonrec delete_budget_request = {
  budget_name : budget_name; [@ocaml.doc "The name of the budget that you want to delete.\n"]
  account_id : account_id;
      [@ocaml.doc "The [accountId] that is associated with the budget that you want to delete.\n"]
}
[@@ocaml.doc " Request of DeleteBudget \n"]

type nonrec delete_budget_action_response = {
  action : action; [@ocaml.doc ""]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_budget_action_request = {
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec creation_limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You've exceeded the notification or subscriber limit.\n"]

type nonrec create_subscriber_response = unit [@@ocaml.doc ""]

type nonrec create_subscriber_request = {
  subscriber : subscriber;
      [@ocaml.doc "The subscriber that you want to associate with a budget notification.\n"]
  notification : notification;
      [@ocaml.doc "The notification that you want to create a subscriber for.\n"]
  budget_name : budget_name;
      [@ocaml.doc
        "The name of the budget that you want to subscribe to. Budget names must be unique within \
         an account.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget that you want to create a subscriber \
         for.\n"]
}
[@@ocaml.doc " Request of CreateSubscriber \n"]

type nonrec create_notification_response = unit [@@ocaml.doc ""]

type nonrec create_notification_request = {
  subscribers : subscribers;
      [@ocaml.doc
        "A list of subscribers that you want to associate with the notification. Each notification \
         can have one SNS subscriber and up to 10 email subscribers.\n"]
  notification : notification; [@ocaml.doc "The notification that you want to create.\n"]
  budget_name : budget_name;
      [@ocaml.doc
        "The name of the budget that you want Amazon Web Services to notify you about. Budget \
         names must be unique within an account.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The [accountId] that is associated with the budget that you want to create a notification \
         for.\n"]
}
[@@ocaml.doc " Request of CreateNotification \n"]

type nonrec create_budget_response = unit [@@ocaml.doc ""]

type nonrec create_budget_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified budget. Each tag consists of a \
         key and a value, and each key must be unique for the resource.\n"]
  notifications_with_subscribers : notification_with_subscribers_list option;
      [@ocaml.doc
        "A notification that you want to associate with a budget. A budget can have up to five \
         notifications, and each notification can have one SNS subscriber and up to 10 email \
         subscribers. If you include notifications and subscribers in your [CreateBudget] call, \
         Amazon Web Services creates the notifications and subscribers for you.\n"]
  budget : budget; [@ocaml.doc "The budget object that you want to create.\n"]
  account_id : account_id; [@ocaml.doc "The [accountId] that is associated with the budget.\n"]
}
[@@ocaml.doc " Request of CreateBudget \n"]

type nonrec create_budget_action_response = {
  action_id : action_id;
      [@ocaml.doc " A system-generated universally unique identifier (UUID) for the action. \n"]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_budget_action_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified budget action. Each tag consists \
         of a key and a value, and each key must be unique for the resource.\n"]
  subscribers : subscribers; [@ocaml.doc ""]
  approval_model : approval_model;
      [@ocaml.doc " This specifies if the action needs manual or automatic approval. \n"]
  execution_role_arn : role_arn;
      [@ocaml.doc
        " The role passed for action execution and reversion. Roles and actions must be in the \
         same account. \n"]
  definition : definition; [@ocaml.doc ""]
  action_threshold : action_threshold; [@ocaml.doc ""]
  action_type : action_type;
      [@ocaml.doc
        " The type of action. This defines the type of tasks that can be carried out by this \
         action. This field also determines the format for definition. \n"]
  notification_type : notification_type; [@ocaml.doc ""]
  budget_name : budget_name; [@ocaml.doc ""]
  account_id : account_id; [@ocaml.doc ""]
}
[@@ocaml.doc ""]
