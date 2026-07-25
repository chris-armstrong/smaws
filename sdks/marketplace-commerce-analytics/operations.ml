open Types
open Service_metadata

module StartSupportDataExport = struct
  let error_to_string = function
    | `MarketplaceCommerceAnalyticsException _ ->
        "com.amazonaws.marketplacecommerceanalytics#MarketplaceCommerceAnalyticsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "MarketplaceCommerceAnalyticsException" ->
          `MarketplaceCommerceAnalyticsException
            (Json_deserializers.marketplace_commerce_analytics_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_support_data_export_request) =
    let input = Json_serializers.start_support_data_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MarketplaceCommerceAnalytics20150701.StartSupportDataExport" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_support_data_export_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_support_data_export_request) =
    let input = Json_serializers.start_support_data_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MarketplaceCommerceAnalytics20150701.StartSupportDataExport" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_support_data_export_result_of_yojson
      ~error_deserializer
end

module GenerateDataSet = struct
  let error_to_string = function
    | `MarketplaceCommerceAnalyticsException _ ->
        "com.amazonaws.marketplacecommerceanalytics#MarketplaceCommerceAnalyticsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "MarketplaceCommerceAnalyticsException" ->
          `MarketplaceCommerceAnalyticsException
            (Json_deserializers.marketplace_commerce_analytics_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : generate_data_set_request) =
    let input = Json_serializers.generate_data_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MarketplaceCommerceAnalytics20150701.GenerateDataSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.generate_data_set_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : generate_data_set_request) =
    let input = Json_serializers.generate_data_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MarketplaceCommerceAnalytics20150701.GenerateDataSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.generate_data_set_result_of_yojson ~error_deserializer
end
