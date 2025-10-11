open Types
open Service_metadata

module DescribeReportCreation = struct
  let error_to_string = function
    | `ConstraintViolationException _ ->
        "com.amazonaws.resourcegroupstaggingapi#ConstraintViolationException"
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.describe_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.DescribeReportCreation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_report_creation_output_of_yojson
      ~error_deserializer
end

module GetComplianceSummary = struct
  let error_to_string = function
    | `ConstraintViolationException _ ->
        "com.amazonaws.resourcegroupstaggingapi#ConstraintViolationException"
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_compliance_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetComplianceSummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compliance_summary_output_of_yojson
      ~error_deserializer
end

module GetResources = struct
  let error_to_string = function
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `PaginationTokenExpiredException _ ->
        "com.amazonaws.resourcegroupstaggingapi#PaginationTokenExpiredException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resources_output_of_yojson ~error_deserializer
end

module GetTagKeys = struct
  let error_to_string = function
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `PaginationTokenExpiredException _ ->
        "com.amazonaws.resourcegroupstaggingapi#PaginationTokenExpiredException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_tag_keys_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetTagKeys"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_tag_keys_output_of_yojson
      ~error_deserializer
end

module GetTagValues = struct
  let error_to_string = function
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `PaginationTokenExpiredException _ ->
        "com.amazonaws.resourcegroupstaggingapi#PaginationTokenExpiredException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_tag_values_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetTagValues"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_tag_values_output_of_yojson ~error_deserializer
end

module StartReportCreation = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.resourcegroupstaggingapi#ConcurrentModificationException"
    | `ConstraintViolationException _ ->
        "com.amazonaws.resourcegroupstaggingapi#ConstraintViolationException"
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.start_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.StartReportCreation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_report_creation_output_of_yojson
      ~error_deserializer
end

module TagResources = struct
  let error_to_string = function
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.tag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ResourceGroupsTaggingAPI_20170126.TagResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resources_output_of_yojson ~error_deserializer
end

module UntagResources = struct
  let error_to_string = function
    | `InternalServiceException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InternalServiceException"
    | `InvalidParameterException _ ->
        "com.amazonaws.resourcegroupstaggingapi#InvalidParameterException"
    | `ThrottledException _ -> "com.amazonaws.resourcegroupstaggingapi#ThrottledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.untag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.UntagResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resources_output_of_yojson ~error_deserializer
end
