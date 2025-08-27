open Types
open Service_metadata
module CreatePerformanceAnalysisReport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_performance_analysis_report_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_performance_analysis_report_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227CreatePerformanceAnalysisReport"
            ~service ~config:context.config ~input
            ~output_deserializer:create_performance_analysis_report_response_of_yojson
            ~error_deserializer
  end
module DeletePerformanceAnalysisReport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_performance_analysis_report_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_performance_analysis_report_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227DeletePerformanceAnalysisReport"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_performance_analysis_report_response_of_yojson
            ~error_deserializer
  end
module DescribeDimensionKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_dimension_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_dimension_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227DescribeDimensionKeys"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_dimension_keys_response_of_yojson
            ~error_deserializer
  end
module GetDimensionKeyDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_dimension_key_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_dimension_key_details_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227GetDimensionKeyDetails"
            ~service ~config:context.config ~input
            ~output_deserializer:get_dimension_key_details_response_of_yojson
            ~error_deserializer
  end
module GetPerformanceAnalysisReport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_performance_analysis_report_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_performance_analysis_report_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227GetPerformanceAnalysisReport"
            ~service ~config:context.config ~input
            ~output_deserializer:get_performance_analysis_report_response_of_yojson
            ~error_deserializer
  end
module GetResourceMetadata =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_metadata_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_metadata_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227GetResourceMetadata"
            ~service ~config:context.config ~input
            ~output_deserializer:get_resource_metadata_response_of_yojson
            ~error_deserializer
  end
module GetResourceMetrics =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_metrics_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_metrics_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227GetResourceMetrics"
            ~service ~config:context.config ~input
            ~output_deserializer:get_resource_metrics_response_of_yojson
            ~error_deserializer
  end
module ListAvailableResourceDimensions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_available_resource_dimensions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_available_resource_dimensions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227ListAvailableResourceDimensions"
            ~service ~config:context.config ~input
            ~output_deserializer:list_available_resource_dimensions_response_of_yojson
            ~error_deserializer
  end
module ListAvailableResourceMetrics =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_available_resource_metrics_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_available_resource_metrics_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227ListAvailableResourceMetrics"
            ~service ~config:context.config ~input
            ~output_deserializer:list_available_resource_metrics_response_of_yojson
            ~error_deserializer
  end
module ListPerformanceAnalysisReports =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_performance_analysis_reports_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_performance_analysis_reports_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227ListPerformanceAnalysisReports"
            ~service ~config:context.config ~input
            ~output_deserializer:list_performance_analysis_reports_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227ListTagsForResource"
            ~service ~config:context.config ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227TagResource" ~service
            ~config:context.config ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceError") ->
              `InternalServiceError
                (internal_service_error_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"PerformanceInsightsv20180227UntagResource" ~service
            ~config:context.config ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end