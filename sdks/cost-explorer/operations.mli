open Types

module CreateAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_monitor_request ->
    ( create_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_monitor_request ->
    ( create_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new cost anomaly detection monitor with the requested type and monitor specification. \n"]

module CreateAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_subscription_request ->
    ( create_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_anomaly_subscription_request ->
    ( create_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an alert subscription to a cost anomaly detection monitor. You can use each subscription \
   to define subscribers with email or SNS notifications. Email subscribers can set an absolute or \
   percentage threshold and a time frequency for receiving notifications. \n"]

module CreateCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cost_category_definition_request ->
    ( create_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cost_category_definition_request ->
    ( create_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new cost category with the requested name and rules.\n"]

module DeleteAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_monitor_request ->
    ( delete_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_monitor_request ->
    ( delete_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a cost anomaly monitor. \n"]

module DeleteAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_subscription_request ->
    ( delete_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_anomaly_subscription_request ->
    ( delete_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a cost anomaly subscription. \n"]

module DeleteCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cost_category_definition_request ->
    ( delete_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cost_category_definition_request ->
    ( delete_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a cost category. Expenses from this month going forward will no longer be categorized \
   with this cost category.\n"]

module DescribeCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cost_category_definition_request ->
    ( describe_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cost_category_definition_request ->
    ( describe_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the name, Amazon Resource Name (ARN), rules, definition, and effective dates of a cost \
   category that's defined in the account.\n\n\
  \ You have the option to use [EffectiveOn] to return a cost category that's active on a specific \
   date. If there's no [EffectiveOn] specified, you see a Cost Category that's effective on the \
   current date. If cost category is still effective, [EffectiveEnd] is omitted in the response. \n\
  \ "]

module GetAnomalies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomalies_request ->
    ( get_anomalies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomalies_request ->
    ( get_anomalies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all of the cost anomalies detected on your account during the time period that's \
   specified by the [DateInterval] object. Anomalies are available for up to 90 days.\n"]

module GetAnomalyMonitors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_monitors_request ->
    ( get_anomaly_monitors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_monitors_request ->
    ( get_anomaly_monitors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the cost anomaly monitor definitions for your account. You can filter using a list of \
   cost anomaly monitor Amazon Resource Names (ARNs). \n"]

module GetAnomalySubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_subscriptions_request ->
    ( get_anomaly_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_anomaly_subscriptions_request ->
    ( get_anomaly_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the cost anomaly subscription objects for your account. You can filter using a list \
   of cost anomaly monitor Amazon Resource Names (ARNs). \n"]

module GetApproximateUsageRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_approximate_usage_records_request ->
    ( get_approximate_usage_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_approximate_usage_records_request ->
    ( get_approximate_usage_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves estimated usage records for hourly granularity or resource-level data at daily \
   granularity.\n"]

module GetCommitmentPurchaseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AnalysisNotFoundException of analysis_not_found_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_commitment_purchase_analysis_request ->
    ( get_commitment_purchase_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AnalysisNotFoundException of analysis_not_found_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_commitment_purchase_analysis_request ->
    ( get_commitment_purchase_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AnalysisNotFoundException of analysis_not_found_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a commitment purchase analysis result based on the [AnalysisId].\n"]

module GetCostAndUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_request ->
    ( get_cost_and_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_request ->
    ( get_cost_and_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage metrics for your account. You can specify which cost and usage-related \
   metric that you want the request to return. For example, you can specify [BlendedCosts] or \
   [UsageQuantity]. You can also filter and group your data by various dimensions, such as \
   [SERVICE] or [AZ], in a specific time range. For a complete list of valid dimensions, see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html}GetDimensionValues} \
   operation. Management account in an organization in Organizations have access to all member \
   accounts.\n\n\
  \ For information about filter limitations, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-limits.html}Quotas and \
   restrictions} in the {i Billing and Cost Management User Guide}.\n\
  \ "]

module GetCostAndUsageComparisons : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_comparisons_request ->
    ( get_cost_and_usage_comparisons_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_comparisons_request ->
    ( get_cost_and_usage_comparisons_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage comparisons for your account between two periods within the last 13 \
   months. If you have enabled multi-year data at monthly granularity, you can go back up to 38 \
   months.\n"]

module GetCostAndUsageWithResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_with_resources_request ->
    ( get_cost_and_usage_with_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_and_usage_with_resources_request ->
    ( get_cost_and_usage_with_resources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves cost and usage metrics with resources for your account. You can specify which cost \
   and usage-related metric, such as [BlendedCosts] or [UsageQuantity], that you want the request \
   to return. You can also filter and group your data by various dimensions, such as [SERVICE] or \
   [AZ], in a specific time range. For a complete list of valid dimensions, see the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html}GetDimensionValues} \
   operation. Management account in an organization in Organizations have access to all member \
   accounts.\n\n\
  \ Hourly granularity is only available for EC2-Instances (Elastic Compute Cloud) resource-level \
   data. All other resource-level data is available at daily granularity.\n\
  \ \n\
  \   This is an opt-in only feature. You can enable this feature from the Cost Explorer Settings \
   page. For information about how to access the Settings page, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html}Controlling \
   Access for Cost Explorer} in the {i Billing and Cost Management User Guide}.\n\
  \   \n\
  \    "]

module GetCostCategories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_categories_request ->
    ( get_cost_categories_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_categories_request ->
    ( get_cost_categories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an array of cost category names and values incurred cost.\n\n\
  \  If some cost category names and values are not associated with any cost, they will not be \
   returned by this API.\n\
  \  \n\
  \   "]

module GetCostComparisonDrivers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_comparison_drivers_request ->
    ( get_cost_comparison_drivers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_comparison_drivers_request ->
    ( get_cost_comparison_drivers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves key factors driving cost changes between two time periods within the last 13 months, \
   such as usage changes, discount changes, and commitment-based savings. If you have enabled \
   multi-year data at monthly granularity, you can go back up to 38 months.\n"]

module GetCostForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cost_forecast_request ->
    ( get_cost_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cost_forecast_request ->
    ( get_cost_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a forecast for how much Amazon Web Services predicts that you will spend over the \
   forecast time period that you select, based on your past costs. \n"]

module GetDimensionValues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_values_request ->
    ( get_dimension_values_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dimension_values_request ->
    ( get_dimension_values_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all available filter values for a specified filter over a period of time. You can \
   search the dimension values for an arbitrary string. \n"]

module GetReservationCoverage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_coverage_request ->
    ( get_reservation_coverage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_coverage_request ->
    ( get_reservation_coverage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the reservation coverage for your account, which you can use to see how much of your \
   Amazon Elastic Compute Cloud, Amazon ElastiCache, Amazon Relational Database Service, or Amazon \
   Redshift usage is covered by a reservation. An organization's management account can see the \
   coverage of the associated member accounts. This supports dimensions, cost categories, and \
   nested expressions. For any time period, you can filter data about reservation usage by the \
   following dimensions:\n\n\
  \ {ul\n\
  \       {-  AZ\n\
  \           \n\
  \            }\n\
  \       {-  CACHE_ENGINE\n\
  \           \n\
  \            }\n\
  \       {-  DATABASE_ENGINE\n\
  \           \n\
  \            }\n\
  \       {-  DEPLOYMENT_OPTION\n\
  \           \n\
  \            }\n\
  \       {-  INSTANCE_TYPE\n\
  \           \n\
  \            }\n\
  \       {-  LINKED_ACCOUNT\n\
  \           \n\
  \            }\n\
  \       {-  OPERATING_SYSTEM\n\
  \           \n\
  \            }\n\
  \       {-  PLATFORM\n\
  \           \n\
  \            }\n\
  \       {-  REGION\n\
  \           \n\
  \            }\n\
  \       {-  SERVICE\n\
  \           \n\
  \            }\n\
  \       {-  TAG\n\
  \           \n\
  \            }\n\
  \       {-  TENANCY\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To determine valid values for a dimension, use the [GetDimensionValues] operation. \n\
  \   "]

module GetReservationPurchaseRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_purchase_recommendation_request ->
    ( get_reservation_purchase_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_purchase_recommendation_request ->
    ( get_reservation_purchase_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets recommendations for reservation purchases. These recommendations might help you to reduce \
   your costs. Reservations provide a discounted hourly rate (up to 75%) compared to On-Demand \
   pricing.\n\n\
  \ Amazon Web Services generates your recommendations by identifying your On-Demand usage during \
   a specific time period and collecting your usage into categories that are eligible for a \
   reservation. After Amazon Web Services has these categories, it simulates every combination of \
   reservations in each category of usage to identify the best number of each type of Reserved \
   Instance (RI) to purchase to maximize your estimated savings. \n\
  \ \n\
  \  For example, Amazon Web Services automatically aggregates your Amazon EC2 Linux, shared \
   tenancy, and c4 family usage in the US West (Oregon) Region and recommends that you buy \
   size-flexible regional reservations to apply to the c4 family usage. Amazon Web Services \
   recommends the smallest size instance in an instance family. This makes it easier to purchase a \
   size-flexible Reserved Instance (RI). Amazon Web Services also shows the equal number of \
   normalized units. This way, you can purchase any instance size that you want. For this example, \
   your RI recommendation is for [c4.large] because that is the smallest size instance in the c4 \
   instance family.\n\
  \  "]

module GetReservationUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_utilization_request ->
    ( get_reservation_utilization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_utilization_request ->
    ( get_reservation_utilization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the reservation utilization for your account. Management account in an organization \
   have access to member accounts. You can filter data by dimensions in a time period. You can use \
   [GetDimensionValues] to determine the possible dimension values. Currently, you can group only \
   by [SUBSCRIPTION_ID]. \n"]

module GetRightsizingRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rightsizing_recommendation_request ->
    ( get_rightsizing_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rightsizing_recommendation_request ->
    ( get_rightsizing_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates recommendations that help you save cost by identifying idle and underutilized Amazon \
   EC2 instances.\n\n\
  \ Recommendations are generated to either downsize or terminate instances, along with providing \
   savings detail and metrics. For more information about calculation and function, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-rightsizing.html}Optimizing \
   Your Cost with Rightsizing Recommendations} in the {i Billing and Cost Management User Guide}.\n\
  \ "]

module GetSavingsPlanPurchaseRecommendationDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plan_purchase_recommendation_details_request ->
    ( get_savings_plan_purchase_recommendation_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plan_purchase_recommendation_details_request ->
    ( get_savings_plan_purchase_recommendation_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for a Savings Plan recommendation. These details include the hourly \
   data-points that construct the cost, coverage, and utilization charts.\n"]

module GetSavingsPlansCoverage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_coverage_request ->
    ( get_savings_plans_coverage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_coverage_request ->
    ( get_savings_plans_coverage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans covered for your account. This enables you to see how much of your \
   cost is covered by a Savings Plan. An organization\226\128\153s management account can see the \
   coverage of the associated member accounts. This supports dimensions, cost categories, and \
   nested expressions. For any time period, you can filter data for Savings Plans usage with the \
   following dimensions:\n\n\
  \ {ul\n\
  \       {-   [LINKED_ACCOUNT] \n\
  \           \n\
  \            }\n\
  \       {-   [REGION] \n\
  \           \n\
  \            }\n\
  \       {-   [SERVICE] \n\
  \           \n\
  \            }\n\
  \       {-   [INSTANCE_FAMILY] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To determine valid values for a dimension, use the [GetDimensionValues] operation.\n\
  \   "]

module GetSavingsPlansPurchaseRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_purchase_recommendation_request ->
    ( get_savings_plans_purchase_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_purchase_recommendation_request ->
    ( get_savings_plans_purchase_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans recommendations for your account. First use \
   [StartSavingsPlansPurchaseRecommendationGeneration] to generate a new set of recommendations, \
   and then use [GetSavingsPlansPurchaseRecommendation] to retrieve them.\n"]

module GetSavingsPlansUtilization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_request ->
    ( get_savings_plans_utilization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_request ->
    ( get_savings_plans_utilization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Savings Plans utilization for your account across date ranges with daily or \
   monthly granularity. Management account in an organization have access to member accounts. You \
   can use [GetDimensionValues] in [SAVINGS_PLANS] to determine the possible dimension values.\n\n\
  \  You can't group by any dimension values for [GetSavingsPlansUtilization].\n\
  \  \n\
  \   "]

module GetSavingsPlansUtilizationDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_details_request ->
    ( get_savings_plans_utilization_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_savings_plans_utilization_details_request ->
    ( get_savings_plans_utilization_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves attribute data along with aggregate utilization and savings data for a given time \
   period. This doesn't support granular or grouped data (daily/monthly) in response. You can't \
   retrieve data by dates in a single response similar to [GetSavingsPlanUtilization], but you \
   have the option to make multiple calls to [GetSavingsPlanUtilizationDetails] by providing \
   individual dates. You can use [GetDimensionValues] in [SAVINGS_PLANS] to determine the possible \
   dimension values.\n\n\
  \   [GetSavingsPlanUtilizationDetails] internally groups data by [SavingsPlansArn].\n\
  \  \n\
  \   "]

module GetTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillExpirationException of bill_expiration_exception
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestChangedException of request_changed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillExpirationException of bill_expiration_exception
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestChangedException of request_changed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Queries for available tag keys and tag values for a specified period. You can search the tag \
   values for an arbitrary string. \n"]

module GetUsageForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BillingViewHealthStatusException of billing_view_health_status_exception
    | `DataUnavailableException of data_unavailable_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_forecast_request ->
    ( get_usage_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_forecast_request ->
    ( get_usage_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BillingViewHealthStatusException of billing_view_health_status_exception
      | `DataUnavailableException of data_unavailable_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnresolvableUsageUnitException of unresolvable_usage_unit_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a forecast for how much Amazon Web Services predicts that you will use over the \
   forecast time period that you select, based on your past usage. \n"]

module ListCommitmentPurchaseAnalyses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_commitment_purchase_analyses_request ->
    ( list_commitment_purchase_analyses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_commitment_purchase_analyses_request ->
    ( list_commitment_purchase_analyses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the commitment purchase analyses for your account.\n"]

module ListCostAllocationTagBackfillHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tag_backfill_history_request ->
    ( list_cost_allocation_tag_backfill_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tag_backfill_history_request ->
    ( list_cost_allocation_tag_backfill_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves a list of your historical cost allocation tag backfill requests. \n"]

module ListCostAllocationTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tags_request ->
    ( list_cost_allocation_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_allocation_tags_request ->
    ( list_cost_allocation_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get a list of cost allocation tags. All inputs in the API are optional and serve as filters. By \
   default, all cost allocation tags are returned. \n"]

module ListCostCategoryDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_definitions_request ->
    ( list_cost_category_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_definitions_request ->
    ( list_cost_category_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the name, Amazon Resource Name (ARN), [NumberOfRules] and effective dates of all cost \
   categories defined in the account. You have the option to use [EffectiveOn] and \
   [SupportedResourceTypes] to return a list of cost categories that were active on a specific \
   date. If there is no [EffectiveOn] specified, you\226\128\153ll see cost categories that are \
   effective on the current date. If cost category is still effective, [EffectiveEnd] is omitted \
   in the response. [ListCostCategoryDefinitions] supports pagination. The request can have a \
   [MaxResults] range up to 100.\n"]

module ListCostCategoryResourceAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_resource_associations_request ->
    ( list_cost_category_resource_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_cost_category_resource_associations_request ->
    ( list_cost_category_resource_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns resource associations of all cost categories defined in the account. You have the \
   option to use [CostCategoryArn] to get the association for a specific cost category. \
   [ListCostCategoryResourceAssociations] supports pagination. The request can have a [MaxResults] \
   range up to 100. \n"]

module ListSavingsPlansPurchaseRecommendationGeneration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_savings_plans_purchase_recommendation_generation_request ->
    ( list_savings_plans_purchase_recommendation_generation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_savings_plans_purchase_recommendation_generation_request ->
    ( list_savings_plans_purchase_recommendation_generation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of your historical recommendation generations within the past 30 days.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource tags associated with the resource specified by the Amazon Resource \
   Name (ARN). \n"]

module ProvideAnomalyFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    provide_anomaly_feedback_request ->
    ( provide_anomaly_feedback_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    provide_anomaly_feedback_request ->
    ( provide_anomaly_feedback_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the feedback property of a given cost anomaly. \n"]

module StartCommitmentPurchaseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `GenerationExistsException of generation_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_commitment_purchase_analysis_request ->
    ( start_commitment_purchase_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_commitment_purchase_analysis_request ->
    ( start_commitment_purchase_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies the parameters of a planned commitment purchase and starts the generation of the \
   analysis. This enables you to estimate the cost, coverage, and utilization impact of your \
   planned commitment purchases.\n"]

module StartCostAllocationTagBackfill : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BackfillLimitExceededException of backfill_limit_exceeded_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_cost_allocation_tag_backfill_request ->
    ( start_cost_allocation_tag_backfill_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackfillLimitExceededException of backfill_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_cost_allocation_tag_backfill_request ->
    ( start_cost_allocation_tag_backfill_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BackfillLimitExceededException of backfill_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Request a cost allocation tag backfill. This will backfill the activation status (either \
   [active] or [inactive]) for all tag keys from [para:BackfillFrom] up to the time this request \
   is made.\n\n\
  \ You can request a backfill once every 24 hours. \n\
  \ "]

module StartSavingsPlansPurchaseRecommendationGeneration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `GenerationExistsException of generation_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_savings_plans_purchase_recommendation_generation_request ->
    ( start_savings_plans_purchase_recommendation_generation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_savings_plans_purchase_recommendation_generation_request ->
    ( start_savings_plans_purchase_recommendation_generation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `GenerationExistsException of generation_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests a Savings Plans recommendation generation. This enables you to calculate a fresh set \
   of Savings Plans recommendations that takes your latest usage data and current Savings Plans \
   inventory into account. You can refresh Savings Plans recommendations up to three times daily \
   for a consolidated billing family.\n\n\
  \   [StartSavingsPlansPurchaseRecommendationGeneration] has no request syntax because no input \
   parameters are needed to support this operation.\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An API operation for adding one or more tags (key-value pairs) to a resource.\n\n\
  \ You can use the [TagResource] operation with a resource that already has tags. If you specify \
   a new tag key for the resource, this tag is appended to the list of tags associated with the \
   resource. If you specify a tag key that is already associated with the resource, the new tag \
   value you specify replaces the previous value for that tag.\n\
  \ \n\
  \  Although the maximum number of array members is 200, user-tag maximum is 50. The remaining \
   are reserved for Amazon Web Services use.\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from a resource. Specify only tag keys in your request. Don't specify \
   the value. \n"]

module UpdateAnomalyMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_monitor_request ->
    ( update_anomaly_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_monitor_request ->
    ( update_anomaly_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost anomaly monitor. The changes made are applied going forward, and \
   doesn't change anomalies detected in the past. \n"]

module UpdateAnomalySubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `UnknownMonitorException of unknown_monitor_exception
    | `UnknownSubscriptionException of unknown_subscription_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_subscription_request ->
    ( update_anomaly_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_anomaly_subscription_request ->
    ( update_anomaly_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `UnknownMonitorException of unknown_monitor_exception
      | `UnknownSubscriptionException of unknown_subscription_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost anomaly subscription. Specify the fields that you want to update. \
   Omitted fields are unchanged.\n\n\
  \  The JSON below describes the generic construct for each type. See \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_UpdateAnomalySubscription.html#API_UpdateAnomalySubscription_RequestParameters}Request \
   Parameters} for possible values as they apply to [AnomalySubscription].\n\
  \  \n\
  \   "]

module UpdateCostAllocationTagsStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cost_allocation_tags_status_request ->
    ( update_cost_allocation_tags_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cost_allocation_tags_status_request ->
    ( update_cost_allocation_tags_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates status for cost allocation tags in bulk, with maximum batch size of 20. If the tag \
   status that's updated is the same as the existing tag status, the request doesn't fail. \
   Instead, it doesn't have any effect on the tag status (for example, activating the active tag). \n"]

module UpdateCostCategoryDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cost_category_definition_request ->
    ( update_cost_category_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cost_category_definition_request ->
    ( update_cost_category_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing cost category. Changes made to the cost category rules will be used to \
   categorize the current month\226\128\153s expenses and future expenses. This won\226\128\153t \
   change categorization for the previous months.\n"]
