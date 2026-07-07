open Types
open Service_metadata

module CreateBatchLoadTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreamwrite#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : create_batch_load_task_request) =
    let input = Json_serializers.create_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.CreateBatchLoadTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_load_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_load_task_request) =
    let input = Json_serializers.create_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.CreateBatchLoadTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_load_task_response_of_yojson
      ~error_deserializer
end

module CreateDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreamwrite#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : create_database_request) =
    let input = Json_serializers.create_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.CreateDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_database_request) =
    let input = Json_serializers.create_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.CreateDatabase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_database_response_of_yojson ~error_deserializer
end

module CreateTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.timestreamwrite#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : create_table_request) =
    let input = Json_serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.CreateTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_table_request) =
    let input = Json_serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.CreateTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_table_response_of_yojson ~error_deserializer
end

module DeleteDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : delete_database_request) =
    let input = Json_serializers.delete_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DeleteDatabase" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_database_request) =
    let input = Json_serializers.delete_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DeleteDatabase" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : delete_table_request) =
    let input = Json_serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DeleteTable" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_table_request) =
    let input = Json_serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.DeleteTable"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeBatchLoadTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_batch_load_task_request) =
    let input = Json_serializers.describe_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeBatchLoadTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_load_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_batch_load_task_request) =
    let input = Json_serializers.describe_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeBatchLoadTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_load_task_response_of_yojson
      ~error_deserializer
end

module DescribeDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : describe_database_request) =
    let input = Json_serializers.describe_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_database_request) =
    let input = Json_serializers.describe_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeDatabase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_database_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoints = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

module DescribeTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : describe_table_request) =
    let input = Json_serializers.describe_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.DescribeTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_table_request) =
    let input = Json_serializers.describe_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.DescribeTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_table_response_of_yojson ~error_deserializer
end

module ListBatchLoadTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : list_batch_load_tasks_request) =
    let input = Json_serializers.list_batch_load_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ListBatchLoadTasks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_load_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_batch_load_tasks_request) =
    let input = Json_serializers.list_batch_load_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ListBatchLoadTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_batch_load_tasks_response_of_yojson
      ~error_deserializer
end

module ListDatabases = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : list_databases_request) =
    let input = Json_serializers.list_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ListDatabases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_databases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_databases_request) =
    let input = Json_serializers.list_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ListDatabases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_databases_response_of_yojson ~error_deserializer
end

module ListTables = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ListTables" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tables_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.ListTables"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tables_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

module ResumeBatchLoadTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : resume_batch_load_task_request) =
    let input = Json_serializers.resume_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.ResumeBatchLoadTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.resume_batch_load_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resume_batch_load_task_request) =
    let input = Json_serializers.resume_batch_load_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.ResumeBatchLoadTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.resume_batch_load_task_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

module UpdateDatabase = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.timestreamwrite#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : update_database_request) =
    let input = Json_serializers.update_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.UpdateDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_database_request) =
    let input = Json_serializers.update_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Timestream_20181101.UpdateDatabase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_database_response_of_yojson ~error_deserializer
end

module UpdateTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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

  let request context (request : update_table_request) =
    let input = Json_serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.UpdateTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_table_request) =
    let input = Json_serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.UpdateTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_table_response_of_yojson ~error_deserializer
end

module WriteRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.timestreamwrite#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.timestreamwrite#InternalServerException"
    | `InvalidEndpointException _ -> "com.amazonaws.timestreamwrite#InvalidEndpointException"
    | `RejectedRecordsException _ -> "com.amazonaws.timestreamwrite#RejectedRecordsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.timestreamwrite#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.timestreamwrite#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.timestreamwrite#ValidationException"
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
      | _, "RejectedRecordsException" ->
          `RejectedRecordsException
            (Json_deserializers.rejected_records_exception_of_yojson tree path)
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

  let request context (request : write_records_request) =
    let input = Json_serializers.write_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Timestream_20181101.WriteRecords" ~service
      ~context ~input ~output_deserializer:Json_deserializers.write_records_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : write_records_request) =
    let input = Json_serializers.write_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Timestream_20181101.WriteRecords"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.write_records_response_of_yojson ~error_deserializer
end
