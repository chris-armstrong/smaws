open Types
open Service_metadata

module CancelQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_query_request) =
    let input = Json_serializers.cancel_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.CancelQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.cancel_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_query_request) =
    let input = Json_serializers.cancel_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.CancelQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_query_response_of_yojson ~error_deserializer
end

module CreateScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreamquery#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamquery#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_scheduled_query_request) =
    let input = Json_serializers.create_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.CreateScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_scheduled_query_request) =
    let input = Json_serializers.create_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.CreateScheduledQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_query_response_of_yojson
      ~error_deserializer
end

module DeleteScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_scheduled_query_request) =
    let input = Json_serializers.delete_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DeleteScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_query_request) =
    let input = Json_serializers.delete_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DeleteScheduledQuery" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAccountSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_account_settings_request) =
    let input = Json_serializers.describe_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_settings_request) =
    let input = Json_serializers.describe_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeAccountSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_settings_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoints = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoints_request) =
    let input = Json_serializers.describe_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoints_request) =
    let input = Json_serializers.describe_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoints_response_of_yojson
      ~error_deserializer
end

module DescribeScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_scheduled_query_request) =
    let input = Json_serializers.describe_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scheduled_query_request) =
    let input = Json_serializers.describe_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeScheduledQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scheduled_query_response_of_yojson
      ~error_deserializer
end

module ExecuteScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_scheduled_query_request) =
    let input = Json_serializers.execute_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ExecuteScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_scheduled_query_request) =
    let input = Json_serializers.execute_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ExecuteScheduledQuery" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ListScheduledQueries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_scheduled_queries_request) =
    let input = Json_serializers.list_scheduled_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ListScheduledQueries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_queries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_scheduled_queries_request) =
    let input = Json_serializers.list_scheduled_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ListScheduledQueries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_queries_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PrepareQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : prepare_query_request) =
    let input = Json_serializers.prepare_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.PrepareQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.prepare_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : prepare_query_request) =
    let input = Json_serializers.prepare_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.PrepareQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.prepare_query_response_of_yojson ~error_deserializer
end

module Query = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreamquery#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `QueryExecutionException _ -> "com.amazonaws.timestreamquery#QueryExecutionException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "QueryExecutionException" ->
          `QueryExecutionException
            (Json_deserializers.query_execution_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_request) =
    let input = Json_serializers.query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.Query" ~service ~context
      ~input ~output_deserializer:Json_deserializers.query_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : query_request) =
    let input = Json_serializers.query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.Query"
      ~service ~context ~input ~output_deserializer:Json_deserializers.query_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamquery#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAccountSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_account_settings_request) =
    let input = Json_serializers.update_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.UpdateAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_account_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_account_settings_request) =
    let input = Json_serializers.update_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.UpdateAccountSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_account_settings_response_of_yojson
      ~error_deserializer
end

module UpdateScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamquery#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamquery#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamquery#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamquery#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamquery#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamquery#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEndpointException" ->
          `InvalidEndpointException
            (Json_deserializers.invalid_endpoint_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_scheduled_query_request) =
    let input = Json_serializers.update_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.UpdateScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_scheduled_query_request) =
    let input = Json_serializers.update_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.UpdateScheduledQuery" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
