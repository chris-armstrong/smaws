open Types
open Service_metadata

module CreateAnomalyMonitor = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_anomaly_monitor_request) =
    let input = Json_serializers.create_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.CreateAnomalyMonitor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_anomaly_monitor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_anomaly_monitor_request) =
    let input = Json_serializers.create_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.CreateAnomalyMonitor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_anomaly_monitor_response_of_yojson
      ~error_deserializer
end

module CreateAnomalySubscription = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownMonitorException _ -> "com.amazonaws.costexplorer#UnknownMonitorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownMonitorException" ->
          `UnknownMonitorException
            (Json_deserializers.unknown_monitor_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_anomaly_subscription_request) =
    let input = Json_serializers.create_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.CreateAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_anomaly_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_anomaly_subscription_request) =
    let input = Json_serializers.create_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.CreateAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_anomaly_subscription_response_of_yojson
      ~error_deserializer
end

module CreateCostCategoryDefinition = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.costexplorer#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cost_category_definition_request) =
    let input = Json_serializers.create_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.CreateCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cost_category_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cost_category_definition_request) =
    let input = Json_serializers.create_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.CreateCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cost_category_definition_response_of_yojson
      ~error_deserializer
end

module DeleteAnomalyMonitor = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownMonitorException _ -> "com.amazonaws.costexplorer#UnknownMonitorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownMonitorException" ->
          `UnknownMonitorException
            (Json_deserializers.unknown_monitor_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_anomaly_monitor_request) =
    let input = Json_serializers.delete_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.DeleteAnomalyMonitor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_anomaly_monitor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_anomaly_monitor_request) =
    let input = Json_serializers.delete_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.DeleteAnomalyMonitor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_anomaly_monitor_response_of_yojson
      ~error_deserializer
end

module DeleteAnomalySubscription = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownSubscriptionException _ -> "com.amazonaws.costexplorer#UnknownSubscriptionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownSubscriptionException" ->
          `UnknownSubscriptionException
            (Json_deserializers.unknown_subscription_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_anomaly_subscription_request) =
    let input = Json_serializers.delete_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.DeleteAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_anomaly_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_anomaly_subscription_request) =
    let input = Json_serializers.delete_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.DeleteAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_anomaly_subscription_response_of_yojson
      ~error_deserializer
end

module DeleteCostCategoryDefinition = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cost_category_definition_request) =
    let input = Json_serializers.delete_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.DeleteCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cost_category_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cost_category_definition_request) =
    let input = Json_serializers.delete_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.DeleteCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cost_category_definition_response_of_yojson
      ~error_deserializer
end

module DescribeCostCategoryDefinition = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cost_category_definition_request) =
    let input = Json_serializers.describe_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.DescribeCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cost_category_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cost_category_definition_request) =
    let input = Json_serializers.describe_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.DescribeCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cost_category_definition_response_of_yojson
      ~error_deserializer
end

module GetAnomalies = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_anomalies_request) =
    let input = Json_serializers.get_anomalies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetAnomalies" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_anomalies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_anomalies_request) =
    let input = Json_serializers.get_anomalies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetAnomalies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_anomalies_response_of_yojson ~error_deserializer
end

module GetAnomalyMonitors = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownMonitorException _ -> "com.amazonaws.costexplorer#UnknownMonitorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownMonitorException" ->
          `UnknownMonitorException
            (Json_deserializers.unknown_monitor_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_anomaly_monitors_request) =
    let input = Json_serializers.get_anomaly_monitors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetAnomalyMonitors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_anomaly_monitors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_anomaly_monitors_request) =
    let input = Json_serializers.get_anomaly_monitors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetAnomalyMonitors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_anomaly_monitors_response_of_yojson
      ~error_deserializer
end

module GetAnomalySubscriptions = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownSubscriptionException _ -> "com.amazonaws.costexplorer#UnknownSubscriptionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownSubscriptionException" ->
          `UnknownSubscriptionException
            (Json_deserializers.unknown_subscription_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_anomaly_subscriptions_request) =
    let input = Json_serializers.get_anomaly_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetAnomalySubscriptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_anomaly_subscriptions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_anomaly_subscriptions_request) =
    let input = Json_serializers.get_anomaly_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetAnomalySubscriptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_anomaly_subscriptions_response_of_yojson
      ~error_deserializer
end

module GetApproximateUsageRecords = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_approximate_usage_records_request) =
    let input = Json_serializers.get_approximate_usage_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetApproximateUsageRecords" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_approximate_usage_records_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_approximate_usage_records_request) =
    let input = Json_serializers.get_approximate_usage_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetApproximateUsageRecords" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_approximate_usage_records_response_of_yojson
      ~error_deserializer
end

module GetCommitmentPurchaseAnalysis = struct
  let error_to_string = function
    | `AnalysisNotFoundException _ -> "com.amazonaws.costexplorer#AnalysisNotFoundException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AnalysisNotFoundException" ->
          `AnalysisNotFoundException
            (Json_deserializers.analysis_not_found_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_commitment_purchase_analysis_request) =
    let input = Json_serializers.get_commitment_purchase_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetCommitmentPurchaseAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_commitment_purchase_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_commitment_purchase_analysis_request) =
    let input = Json_serializers.get_commitment_purchase_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCommitmentPurchaseAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_commitment_purchase_analysis_response_of_yojson
      ~error_deserializer
end

module GetCostAndUsage = struct
  let error_to_string = function
    | `BillExpirationException _ -> "com.amazonaws.costexplorer#BillExpirationException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `RequestChangedException _ -> "com.amazonaws.costexplorer#RequestChangedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillExpirationException" ->
          `BillExpirationException
            (Json_deserializers.bill_expiration_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestChangedException" ->
          `RequestChangedException
            (Json_deserializers.request_changed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_and_usage_request) =
    let input = Json_serializers.get_cost_and_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetCostAndUsage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_and_usage_request) =
    let input = Json_serializers.get_cost_and_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostAndUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_response_of_yojson
      ~error_deserializer
end

module GetCostAndUsageComparisons = struct
  let error_to_string = function
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_and_usage_comparisons_request) =
    let input = Json_serializers.get_cost_and_usage_comparisons_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetCostAndUsageComparisons" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_comparisons_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_and_usage_comparisons_request) =
    let input = Json_serializers.get_cost_and_usage_comparisons_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostAndUsageComparisons" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_comparisons_response_of_yojson
      ~error_deserializer
end

module GetCostAndUsageWithResources = struct
  let error_to_string = function
    | `BillExpirationException _ -> "com.amazonaws.costexplorer#BillExpirationException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `RequestChangedException _ -> "com.amazonaws.costexplorer#RequestChangedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillExpirationException" ->
          `BillExpirationException
            (Json_deserializers.bill_expiration_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestChangedException" ->
          `RequestChangedException
            (Json_deserializers.request_changed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_and_usage_with_resources_request) =
    let input = Json_serializers.get_cost_and_usage_with_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetCostAndUsageWithResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_with_resources_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_and_usage_with_resources_request) =
    let input = Json_serializers.get_cost_and_usage_with_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostAndUsageWithResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_and_usage_with_resources_response_of_yojson
      ~error_deserializer
end

module GetCostCategories = struct
  let error_to_string = function
    | `BillExpirationException _ -> "com.amazonaws.costexplorer#BillExpirationException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `RequestChangedException _ -> "com.amazonaws.costexplorer#RequestChangedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillExpirationException" ->
          `BillExpirationException
            (Json_deserializers.bill_expiration_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestChangedException" ->
          `RequestChangedException
            (Json_deserializers.request_changed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_categories_request) =
    let input = Json_serializers.get_cost_categories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetCostCategories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_categories_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_categories_request) =
    let input = Json_serializers.get_cost_categories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostCategories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_categories_response_of_yojson
      ~error_deserializer
end

module GetCostComparisonDrivers = struct
  let error_to_string = function
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_comparison_drivers_request) =
    let input = Json_serializers.get_cost_comparison_drivers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetCostComparisonDrivers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_comparison_drivers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_comparison_drivers_request) =
    let input = Json_serializers.get_cost_comparison_drivers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostComparisonDrivers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_comparison_drivers_response_of_yojson
      ~error_deserializer
end

module GetCostForecast = struct
  let error_to_string = function
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cost_forecast_request) =
    let input = Json_serializers.get_cost_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetCostForecast"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cost_forecast_request) =
    let input = Json_serializers.get_cost_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetCostForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cost_forecast_response_of_yojson
      ~error_deserializer
end

module GetDimensionValues = struct
  let error_to_string = function
    | `BillExpirationException _ -> "com.amazonaws.costexplorer#BillExpirationException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `RequestChangedException _ -> "com.amazonaws.costexplorer#RequestChangedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillExpirationException" ->
          `BillExpirationException
            (Json_deserializers.bill_expiration_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestChangedException" ->
          `RequestChangedException
            (Json_deserializers.request_changed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dimension_values_request) =
    let input = Json_serializers.get_dimension_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetDimensionValues"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_dimension_values_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dimension_values_request) =
    let input = Json_serializers.get_dimension_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetDimensionValues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_dimension_values_response_of_yojson
      ~error_deserializer
end

module GetReservationCoverage = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_reservation_coverage_request) =
    let input = Json_serializers.get_reservation_coverage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetReservationCoverage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_coverage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_reservation_coverage_request) =
    let input = Json_serializers.get_reservation_coverage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetReservationCoverage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_coverage_response_of_yojson
      ~error_deserializer
end

module GetReservationPurchaseRecommendation = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_reservation_purchase_recommendation_request) =
    let input =
      Json_serializers.get_reservation_purchase_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetReservationPurchaseRecommendation" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_reservation_purchase_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_reservation_purchase_recommendation_request) =
    let input =
      Json_serializers.get_reservation_purchase_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetReservationPurchaseRecommendation" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_reservation_purchase_recommendation_response_of_yojson
      ~error_deserializer
end

module GetReservationUtilization = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_reservation_utilization_request) =
    let input = Json_serializers.get_reservation_utilization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetReservationUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_utilization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_reservation_utilization_request) =
    let input = Json_serializers.get_reservation_utilization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetReservationUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_reservation_utilization_response_of_yojson
      ~error_deserializer
end

module GetRightsizingRecommendation = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rightsizing_recommendation_request) =
    let input = Json_serializers.get_rightsizing_recommendation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetRightsizingRecommendation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rightsizing_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rightsizing_recommendation_request) =
    let input = Json_serializers.get_rightsizing_recommendation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetRightsizingRecommendation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rightsizing_recommendation_response_of_yojson
      ~error_deserializer
end

module GetSavingsPlanPurchaseRecommendationDetails = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_savings_plan_purchase_recommendation_details_request) =
    let input =
      Json_serializers.get_savings_plan_purchase_recommendation_details_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlanPurchaseRecommendationDetails" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plan_purchase_recommendation_details_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : get_savings_plan_purchase_recommendation_details_request) =
    let input =
      Json_serializers.get_savings_plan_purchase_recommendation_details_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlanPurchaseRecommendationDetails" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plan_purchase_recommendation_details_response_of_yojson
      ~error_deserializer
end

module GetSavingsPlansCoverage = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_savings_plans_coverage_request) =
    let input = Json_serializers.get_savings_plans_coverage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansCoverage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_savings_plans_coverage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_savings_plans_coverage_request) =
    let input = Json_serializers.get_savings_plans_coverage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansCoverage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_savings_plans_coverage_response_of_yojson
      ~error_deserializer
end

module GetSavingsPlansPurchaseRecommendation = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_savings_plans_purchase_recommendation_request) =
    let input =
      Json_serializers.get_savings_plans_purchase_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansPurchaseRecommendation" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plans_purchase_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_savings_plans_purchase_recommendation_request) =
    let input =
      Json_serializers.get_savings_plans_purchase_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansPurchaseRecommendation" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plans_purchase_recommendation_response_of_yojson
      ~error_deserializer
end

module GetSavingsPlansUtilization = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_savings_plans_utilization_request) =
    let input = Json_serializers.get_savings_plans_utilization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_savings_plans_utilization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_savings_plans_utilization_request) =
    let input = Json_serializers.get_savings_plans_utilization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansUtilization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_savings_plans_utilization_response_of_yojson
      ~error_deserializer
end

module GetSavingsPlansUtilizationDetails = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_savings_plans_utilization_details_request) =
    let input = Json_serializers.get_savings_plans_utilization_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansUtilizationDetails" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plans_utilization_details_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_savings_plans_utilization_details_request) =
    let input = Json_serializers.get_savings_plans_utilization_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetSavingsPlansUtilizationDetails" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_savings_plans_utilization_details_response_of_yojson
      ~error_deserializer
end

module GetTags = struct
  let error_to_string = function
    | `BillExpirationException _ -> "com.amazonaws.costexplorer#BillExpirationException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `RequestChangedException _ -> "com.amazonaws.costexplorer#RequestChangedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillExpirationException" ->
          `BillExpirationException
            (Json_deserializers.bill_expiration_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RequestChangedException" ->
          `RequestChangedException
            (Json_deserializers.request_changed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tags_request) =
    let input = Json_serializers.get_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_tags_request) =
    let input = Json_serializers.get_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSInsightsIndexService.GetTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_tags_response_of_yojson
      ~error_deserializer
end

module GetUsageForecast = struct
  let error_to_string = function
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.costexplorer#BillingViewHealthStatusException"
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | `UnresolvableUsageUnitException _ ->
        "com.amazonaws.costexplorer#UnresolvableUsageUnitException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnresolvableUsageUnitException" ->
          `UnresolvableUsageUnitException
            (Json_deserializers.unresolvable_usage_unit_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_usage_forecast_request) =
    let input = Json_serializers.get_usage_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.GetUsageForecast"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_usage_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_usage_forecast_request) =
    let input = Json_serializers.get_usage_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.GetUsageForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_usage_forecast_response_of_yojson
      ~error_deserializer
end

module ListCommitmentPurchaseAnalyses = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_commitment_purchase_analyses_request) =
    let input = Json_serializers.list_commitment_purchase_analyses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.ListCommitmentPurchaseAnalyses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_commitment_purchase_analyses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_commitment_purchase_analyses_request) =
    let input = Json_serializers.list_commitment_purchase_analyses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListCommitmentPurchaseAnalyses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_commitment_purchase_analyses_response_of_yojson
      ~error_deserializer
end

module ListCostAllocationTagBackfillHistory = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cost_allocation_tag_backfill_history_request) =
    let input =
      Json_serializers.list_cost_allocation_tag_backfill_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.ListCostAllocationTagBackfillHistory" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cost_allocation_tag_backfill_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cost_allocation_tag_backfill_history_request) =
    let input =
      Json_serializers.list_cost_allocation_tag_backfill_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListCostAllocationTagBackfillHistory" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cost_allocation_tag_backfill_history_response_of_yojson
      ~error_deserializer
end

module ListCostAllocationTags = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cost_allocation_tags_request) =
    let input = Json_serializers.list_cost_allocation_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.ListCostAllocationTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cost_allocation_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cost_allocation_tags_request) =
    let input = Json_serializers.list_cost_allocation_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListCostAllocationTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cost_allocation_tags_response_of_yojson
      ~error_deserializer
end

module ListCostCategoryDefinitions = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cost_category_definitions_request) =
    let input = Json_serializers.list_cost_category_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.ListCostCategoryDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cost_category_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cost_category_definitions_request) =
    let input = Json_serializers.list_cost_category_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListCostCategoryDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cost_category_definitions_response_of_yojson
      ~error_deserializer
end

module ListCostCategoryResourceAssociations = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cost_category_resource_associations_request) =
    let input =
      Json_serializers.list_cost_category_resource_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.ListCostCategoryResourceAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cost_category_resource_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cost_category_resource_associations_request) =
    let input =
      Json_serializers.list_cost_category_resource_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListCostCategoryResourceAssociations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cost_category_resource_associations_response_of_yojson
      ~error_deserializer
end

module ListSavingsPlansPurchaseRecommendationGeneration = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `InvalidNextTokenException _ -> "com.amazonaws.costexplorer#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_savings_plans_purchase_recommendation_generation_request) =
    let input =
      Json_serializers.list_savings_plans_purchase_recommendation_generation_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.ListSavingsPlansPurchaseRecommendationGeneration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_savings_plans_purchase_recommendation_generation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_savings_plans_purchase_recommendation_generation_request) =
    let input =
      Json_serializers.list_savings_plans_purchase_recommendation_generation_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListSavingsPlansPurchaseRecommendationGeneration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_savings_plans_purchase_recommendation_generation_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ProvideAnomalyFeedback = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : provide_anomaly_feedback_request) =
    let input = Json_serializers.provide_anomaly_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.ProvideAnomalyFeedback"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.provide_anomaly_feedback_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : provide_anomaly_feedback_request) =
    let input = Json_serializers.provide_anomaly_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.ProvideAnomalyFeedback" ~service ~context ~input
      ~output_deserializer:Json_deserializers.provide_anomaly_feedback_response_of_yojson
      ~error_deserializer
end

module StartCommitmentPurchaseAnalysis = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `GenerationExistsException _ -> "com.amazonaws.costexplorer#GenerationExistsException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.costexplorer#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "GenerationExistsException" ->
          `GenerationExistsException
            (Json_deserializers.generation_exists_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_commitment_purchase_analysis_request) =
    let input = Json_serializers.start_commitment_purchase_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.StartCommitmentPurchaseAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_commitment_purchase_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_commitment_purchase_analysis_request) =
    let input = Json_serializers.start_commitment_purchase_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.StartCommitmentPurchaseAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_commitment_purchase_analysis_response_of_yojson
      ~error_deserializer
end

module StartCostAllocationTagBackfill = struct
  let error_to_string = function
    | `BackfillLimitExceededException _ ->
        "com.amazonaws.costexplorer#BackfillLimitExceededException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BackfillLimitExceededException" ->
          `BackfillLimitExceededException
            (Json_deserializers.backfill_limit_exceeded_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_cost_allocation_tag_backfill_request) =
    let input = Json_serializers.start_cost_allocation_tag_backfill_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.StartCostAllocationTagBackfill" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_cost_allocation_tag_backfill_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_cost_allocation_tag_backfill_request) =
    let input = Json_serializers.start_cost_allocation_tag_backfill_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.StartCostAllocationTagBackfill" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_cost_allocation_tag_backfill_response_of_yojson
      ~error_deserializer
end

module StartSavingsPlansPurchaseRecommendationGeneration = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.costexplorer#DataUnavailableException"
    | `GenerationExistsException _ -> "com.amazonaws.costexplorer#GenerationExistsException"
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.costexplorer#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "GenerationExistsException" ->
          `GenerationExistsException
            (Json_deserializers.generation_exists_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_savings_plans_purchase_recommendation_generation_request) =
    let input =
      Json_serializers.start_savings_plans_purchase_recommendation_generation_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.StartSavingsPlansPurchaseRecommendationGeneration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_savings_plans_purchase_recommendation_generation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : start_savings_plans_purchase_recommendation_generation_request) =
    let input =
      Json_serializers.start_savings_plans_purchase_recommendation_generation_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.StartSavingsPlansPurchaseRecommendationGeneration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_savings_plans_purchase_recommendation_generation_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.costexplorer#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAnomalyMonitor = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownMonitorException _ -> "com.amazonaws.costexplorer#UnknownMonitorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownMonitorException" ->
          `UnknownMonitorException
            (Json_deserializers.unknown_monitor_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_anomaly_monitor_request) =
    let input = Json_serializers.update_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSInsightsIndexService.UpdateAnomalyMonitor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_anomaly_monitor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_anomaly_monitor_request) =
    let input = Json_serializers.update_anomaly_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.UpdateAnomalyMonitor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_anomaly_monitor_response_of_yojson
      ~error_deserializer
end

module UpdateAnomalySubscription = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `UnknownMonitorException _ -> "com.amazonaws.costexplorer#UnknownMonitorException"
    | `UnknownSubscriptionException _ -> "com.amazonaws.costexplorer#UnknownSubscriptionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "UnknownMonitorException" ->
          `UnknownMonitorException
            (Json_deserializers.unknown_monitor_exception_of_yojson tree path)
      | _, "UnknownSubscriptionException" ->
          `UnknownSubscriptionException
            (Json_deserializers.unknown_subscription_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_anomaly_subscription_request) =
    let input = Json_serializers.update_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.UpdateAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_anomaly_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_anomaly_subscription_request) =
    let input = Json_serializers.update_anomaly_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.UpdateAnomalySubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_anomaly_subscription_response_of_yojson
      ~error_deserializer
end

module UpdateCostAllocationTagsStatus = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cost_allocation_tags_status_request) =
    let input = Json_serializers.update_cost_allocation_tags_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.UpdateCostAllocationTagsStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cost_allocation_tags_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cost_allocation_tags_status_request) =
    let input = Json_serializers.update_cost_allocation_tags_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.UpdateCostAllocationTagsStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cost_allocation_tags_status_response_of_yojson
      ~error_deserializer
end

module UpdateCostCategoryDefinition = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.costexplorer#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costexplorer#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.costexplorer#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cost_category_definition_request) =
    let input = Json_serializers.update_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSInsightsIndexService.UpdateCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cost_category_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cost_category_definition_request) =
    let input = Json_serializers.update_cost_category_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSInsightsIndexService.UpdateCostCategoryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cost_category_definition_response_of_yojson
      ~error_deserializer
end
