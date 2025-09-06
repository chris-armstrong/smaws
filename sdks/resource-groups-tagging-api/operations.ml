open Types
open Service_metadata

module DescribeReportCreation = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_report_creation_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126DescribeReportCreation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_report_creation_output_of_yojson
      ~error_deserializer
end

module GetComplianceSummary = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compliance_summary_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_compliance_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126GetComplianceSummary" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_compliance_summary_output_of_yojson
      ~error_deserializer
end

module GetResources = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PaginationTokenExpiredException" ->
          `PaginationTokenExpiredException
            (Json_deserializers.pagination_token_expired_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resources_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126GetResources"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_resources_output_of_yojson ~error_deserializer
end

module GetTagKeys = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PaginationTokenExpiredException" ->
          `PaginationTokenExpiredException
            (Json_deserializers.pagination_token_expired_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tag_keys_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_tag_keys_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126GetTagKeys"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_tag_keys_output_of_yojson ~error_deserializer
end

module GetTagValues = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PaginationTokenExpiredException" ->
          `PaginationTokenExpiredException
            (Json_deserializers.pagination_token_expired_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tag_values_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_tag_values_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126GetTagValues"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_tag_values_output_of_yojson ~error_deserializer
end

module StartReportCreation = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_report_creation_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126StartReportCreation" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_report_creation_output_of_yojson
      ~error_deserializer
end

module TagResources = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resources_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126TagResources"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resources_output_of_yojson ~error_deserializer
end

module UntagResources = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottledException" ->
          `ThrottledException (Json_deserializers.throttled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resources_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126UntagResources" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resources_output_of_yojson ~error_deserializer
end
