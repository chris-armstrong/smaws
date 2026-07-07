open Types
open Service_metadata

module DeleteReportDefinition = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_report_definition_request) =
    let input = Json_serializers.delete_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrigamiServiceGatewayService.DeleteReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_report_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_report_definition_request) =
    let input = Json_serializers.delete_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.DeleteReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_report_definition_response_of_yojson
      ~error_deserializer
end

module DescribeReportDefinitions = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_report_definitions_request) =
    let input = Json_serializers.describe_report_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrigamiServiceGatewayService.DescribeReportDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_report_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_report_definitions_request) =
    let input = Json_serializers.describe_report_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.DescribeReportDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_report_definitions_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.costandusagereportservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrigamiServiceGatewayService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ModifyReportDefinition = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_report_definition_request) =
    let input = Json_serializers.modify_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrigamiServiceGatewayService.ModifyReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_report_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_report_definition_request) =
    let input = Json_serializers.modify_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.ModifyReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_report_definition_response_of_yojson
      ~error_deserializer
end

module PutReportDefinition = struct
  let error_to_string = function
    | `DuplicateReportNameException _ ->
        "com.amazonaws.costandusagereportservice#DuplicateReportNameException"
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ReportLimitReachedException _ ->
        "com.amazonaws.costandusagereportservice#ReportLimitReachedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.costandusagereportservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateReportNameException" ->
          `DuplicateReportNameException
            (Json_deserializers.duplicate_report_name_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ReportLimitReachedException" ->
          `ReportLimitReachedException
            (Json_deserializers.report_limit_reached_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_report_definition_request) =
    let input = Json_serializers.put_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrigamiServiceGatewayService.PutReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_report_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_report_definition_request) =
    let input = Json_serializers.put_report_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.PutReportDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_report_definition_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.costandusagereportservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrigamiServiceGatewayService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.costandusagereportservice#InternalErrorException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.costandusagereportservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.costandusagereportservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrigamiServiceGatewayService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrigamiServiceGatewayService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
